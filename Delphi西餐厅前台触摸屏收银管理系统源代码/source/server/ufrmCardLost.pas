unit ufrmCardLost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModifyDataBase, ImgList, StdCtrls, Buttons, DB, ADODB,
  CSADOQuery, dxExEdtr, dxEdLib, dxDBELib, dxEditor, dxCntner,
  CSCustomdxDateEdit, CSdxDBDateEdit, OleCtrls, MSCommLib_TLB;

type
  TfrmCardLost = class(TfrmModifyDataBase)
    Label2: TLabel;
    Label7: TLabel;
    cardinfoq: TCSADOQuery;
    cardinfod: TDataSource;
    eCardId: TdxEdit;
    eCMName: TdxEdit;
    bbtnFindCard: TBitBtn;
    Label1: TLabel;
    eOldMoney: TdxCurrencyEdit;
    SavingCardq: TCSADOQuery;
    SavingCardqcard_id: TStringField;
    SavingCardqbefore_money: TBCDField;
    SavingCardqsaving_money: TBCDField;
    SavingCardqafter_money: TBCDField;
    SavingCardqsaving_datetime: TDateTimeField;
    SavingCardqsaving_kind: TIntegerField;
    SavingCardqlogin_id: TStringField;
    Label6: TLabel;
    eOnlyNo: TdxEdit;
    bbtnLost: TBitBtn;
    Label3: TLabel;
    eNewCardId: TdxEdit;
    bbtnBackMoney: TBitBtn;
    bbtnNewCard: TBitBtn;
    MSComm: TMSComm;
    procedure bbtnFindCardClick(Sender: TObject);
    procedure bbtnLostClick(Sender: TObject);
    procedure bbtnBackMoneyClick(Sender: TObject);
    procedure bbtnNewCardClick(Sender: TObject);
  private
    Fb_CanLost: Boolean;
    Fs_CMId: String;  
    Fi_OleTick, Fi_NewTick: DWord;
    procedure prip_GetCardInfo; 
    function prif_OpenComPort(Ai_Buff: Integer): boolean;
    function prif_SendCommand(Av_Command: Variant; Ai_Buff, Ai_Time: DWord): String;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

const
  COMMANDHEAD = Chr(27);
var
  frmCardLost: TfrmCardLost;

implementation
uses udmData, ufrmBase;
{$R *.dfm}

{ TfrmCardLost }

procedure TfrmCardLost.prop_IniData;
begin
  inherited;
  Fb_CanLost := False;
end;

procedure TfrmCardLost.prip_GetCardInfo;
var
  ls_CMName: String;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT cm_id, cm_name FROM customerinfo WHERE cm_onlyno = ''%s''',
      [eOnlyNo.Text]);
    Open;
    if IsEmpty then
    begin
      DispInfo('会员资料没有找到,请核对输入的有效证件号是否正确');
      Close;
      Exit;
    end;
    Fs_CMId := FieldByName('cm_id').AsString;
    ls_CMName := FieldByName('cm_name').AsString;
    Close;
    SQL.Clear;
    SQL.Text := Format('SELECT card_id, card_money FROM cardinfo WHERE cm_id = ''%s'' AND ' +
      'card_state = 1', [Fs_CMId]);
    Open;
    if IsEmpty then
    begin
      DispInfo('会员资料没有找到或该会员已经挂失,请核对输入的有效证件号是否正确');
      Close;
      Exit;
    end;
    eCardId.Text := FieldByName('card_id').AsString;
    eCMName.Text := ls_CMName;
    eOldMoney.Value := FieldByName('card_money').AsCurrency;
    Fb_CanLost := True;
  end;
end;

procedure TfrmCardLost.bbtnFindCardClick(Sender: TObject);
begin
  inherited;
  prip_GetCardInfo;
end;

procedure TfrmCardLost.bbtnLostClick(Sender: TObject);
var
  ls_SQL, ls_SQL1, ls_Date, ls_Time: String;
begin
  inherited;
  if not Fb_CanLost then
  begin
    DispInfo('请先验证会员,再进行挂失操作');
    Exit;
  end;       
  ls_Date := FormatDateTime('YYYY-MM-DD', Date);
  ls_Time := FormatDateTime('HH:MM:SS', Time);
  ls_SQL := Format('UPDATE cardinfo SET card_state = 2 WHERE card_id = ''%s''', [eCardId.Text]);
  ls_SQL1 := Format('INSERT INTO cardlost (card_id, cm_id, lost_money, lost_date, lost_time, ' +
    ' login_id) VALUES (''%s'', ''%s'', %f, ''%s'', ''%s'', ''%s'')', [eCardId.Text, Fs_CMId,
    eOldMoney.Value, ls_Date, ls_Time, dmData.As_OptName]);
  try
    dmData.adocon.BeginTrans;
    dmData.adocon.Execute(ls_SQL); 
    dmData.adocon.Execute(ls_SQL1);
    dmData.adocon.CommitTrans;
    DispInfo('会员挂失完成!', 2);
  except
    dmData.adocon.RollbackTrans;
    DispInfo('会员挂失失败!');
  end;
end;

procedure TfrmCardLost.bbtnBackMoneyClick(Sender: TObject);
var
  ls_SQL, ls_SQL1, ls_Date, ls_Time: String;
begin
  inherited;
  if not Fb_CanLost then
  begin
    DispInfo('请先验证会员,再进行挂失操作');
    Exit;
  end;
  ls_Date := FormatDateTime('YYYY-MM-DD', Date);
  ls_Time := FormatDateTime('HH:MM:SS', Time);
  ls_SQL := Format('UPDATE cardinfo SET card_state = 3 WHERE card_id = ''%s''', [eCardId.Text]);
  ls_SQL1 := Format('INSERT INTO cardbackinfo (card_id, cm_id, back_money, back_date, back_time, ' +
    ' login_id) VALUES (''%s'', ''%s'', %f, ''%s'', ''%s'', ''%s'')', [eCardId.Text, Fs_CMId,
    eOldMoney.Value, ls_Date, ls_Time, dmData.As_OptName]);
  try
    dmData.adocon.BeginTrans;
    dmData.adocon.Execute(ls_SQL);
    dmData.adocon.Execute(ls_SQL1);
    dmData.adocon.CommitTrans;
    DispInfo('会员退卡完成!', 2);
  except
    dmData.adocon.RollbackTrans;
    DispInfo('会员退卡失败!');
  end;
end;

procedure TfrmCardLost.bbtnNewCardClick(Sender: TObject);
var
  ls_SQL, ls_SQL1, ls_SQL2, ls_Receive: String;
begin
  inherited;
  if not Fb_CanLost then
  begin
    DispInfo('请先验证会员,再进行挂失操作');
    Exit;
  end;
  if not CheckNull(eNewCardId.Text) then
  begin
    eNewCardId.SetFocus;
    Exit;
  end;
  if dmData.Ai_Card = 1 then
  begin
    ls_Receive := prif_SendCommand('e', 1024, 3);
    if (Copy(ls_Receive, 1, 1) = Chr(27)) and (Copy(ls_Receive, 2, 1) = 'y') then
    else begin
      Application.MessageBox('联机通讯失败，请与系统管理员联系！', PChar(Caption),
        MB_OK + MB_ICONQUESTION);
      Exit;
    end;
    ls_Receive := prif_SendCommand('t' + '00000' + '8' + Chr(2) + 's' +
       '0' + eNewCardId.Text + '0' + Chr(29) + Chr(27) + '\', 1024, 100);
    if Copy(ls_Receive, 1, 1) <> Chr(27) then //写卡错误
    begin
      Application.MessageBox('写卡错误1。', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      Exit;
    end;
    if Copy(ls_Receive, 2, 2) = 'rq' then //写卡错误
    begin
      Application.MessageBox('写卡错误2。', PChar(Caption),
        MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;
  ls_SQL := Format('UPDATE cardinfo SET card_id = ''%s'', card_state = 0 WHERE ' +
    ' card_id = ''%s''', [eCardId.Text, eCardId.Text]);
  ls_SQL1 := Format('UPDATE consumeinfo SET card_id  =''%s'' WHERE card_id = ''%s''',
    [eCardId.Text, eCardId.Text]);
  ls_SQL2 := Format('UPDATE cardsaving SET card_id  =''%s'' WHERE card_id = ''%s''',
    [eCardId.Text, eCardId.Text]);
  try
    dmData.adocon.BeginTrans;
    dmData.adocon.Execute(ls_SQL);
    dmData.adocon.Execute(ls_SQL1);
    dmData.adocon.Execute(ls_SQL2);
    dmData.adocon.CommitTrans;  
    DispInfo('会员补卡完成!', 2);
  except
    dmData.adocon.RollbackTrans; 
    DispInfo('会员补卡失败!');
  end;
end;

function TfrmCardLost.prif_OpenComPort(Ai_Buff: Integer): boolean;
begin
  Result := True;
  try
    if MsComm.PortOpen then MsComm.PortOpen := False;
    MsComm.Settings := '9600,n,8,1';
    MsComm.InputMode := comInputModeText;
    MsComm.InBufferSize := Ai_Buff;
    MsComm.CommPort := dmData.Ai_ComPort;
    MsComm.PortOpen := True;
  except
    on e: Exception do
    begin
      e.Create('串口打开失败！');
    end;
  end;
end;

function TfrmCardLost.prif_SendCommand(Av_Command: Variant; Ai_Buff,
  Ai_Time: DWord): String;
begin
  prif_OpenComPort(Ai_Buff);
  Av_Command := COMMANDHEAD + Av_Command;
  if MsComm.InBufferCount <> 0 then MsComm.InBufferCount := 0;
  if MsComm.OutBufferCount <> 0 then MsComm.OutBufferCount := 0;
  MsComm.Output := Av_Command;
  Fi_OleTick := GetTickCount;
  repeat
    Fi_NewTick := GetTickCount;
  until  (Fi_NewTick - Fi_OleTick)  > (Ai_Time * 10);
  Result := MsComm.Input;
  MsComm.PortOpen := False;
end;

end.
