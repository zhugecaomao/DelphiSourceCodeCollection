unit ufrmCardSaving;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModifyDataBase, ImgList, StdCtrls, Buttons, DB, ADODB,
  CSADOQuery, dxExEdtr, dxEdLib, dxDBELib, dxEditor, dxCntner,
  CSCustomdxDateEdit, CSdxDBDateEdit, OleCtrls, MSCommLib_TLB;

type
  TfrmCardSaving = class(TfrmModifyDataBase)
    Label2: TLabel;
    Label7: TLabel;
    cardinfoq: TCSADOQuery;
    cardinfod: TDataSource;
    cardinfoqcard_id: TStringField;
    cardinfoqcm_id: TStringField;
    cardinfoqkind_id: TIntegerField;
    cardinfoqcard_money: TBCDField;
    cardinfoqcard_state: TIntegerField;
    cardinfoqemp_id: TStringField;
    cardinfoqlogin_id: TStringField;
    eCardId: TdxEdit;
    eCMName: TdxEdit;
    bbtnFindCard: TBitBtn;
    Label1: TLabel;
    eOldMoney: TdxCurrencyEdit;
    Label3: TLabel;
    eSavingMoney: TdxCurrencyEdit;
    Label4: TLabel;
    eNowMoney: TdxCurrencyEdit;
    Label5: TLabel;
    eSavingKind: TdxPickEdit;
    SavingCardq: TCSADOQuery;
    SavingCardqcard_id: TStringField;
    SavingCardqbefore_money: TBCDField;
    SavingCardqsaving_money: TBCDField;
    SavingCardqafter_money: TBCDField;
    SavingCardqsaving_kind: TIntegerField;
    SavingCardqlogin_id: TStringField;
    SavingCardqsaving_date: TStringField;
    SavingCardqsaving_time: TStringField;
    MSComm: TMSComm;
    procedure bbtnFindCardClick(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
    procedure eSavingMoneyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private   
    Fi_OleTick, Fi_NewTick: DWord;
    Fs_Old: String;
    function prif_CanSave: Boolean;
    procedure prip_GetCardInfo;
    procedure prip_GetCsKind;
    function prif_OpenComPort(Ai_Buff: Integer): boolean;
    function prif_SendCommand(Av_Command: Variant; Ai_Buff, Ai_Time: DWord): String;
    procedure prip_Print;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end; 

const
  COMMANDHEAD = Chr(27);

var
  frmCardSaving: TfrmCardSaving;

implementation
uses udmData, ufrmBase, Printers, upubCommon;
{$R *.dfm}

{ TfrmCardSaving }

procedure TfrmCardSaving.prop_IniData;
begin
  inherited;
  prip_GetCsKind;
end;

function TfrmCardSaving.prif_CanSave: Boolean;
begin
  if Length(Trim(eCardId.Text)) = 0 then
  begin
    DispInfo('会员卡号不能为空');
    eCardId.SetFocus;
    Result := False;
    Exit;
  end;
  if Length(Trim(eSavingKind.Text)) = 0 then
  begin
    DispInfo('充值方式必须选择!');
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmCardSaving.prip_GetCardInfo;
var
 ls_Receive, ls_CardNo, ls_CardNo1, ls_CardNo2: String;
begin
  if dmData.Ai_Card = 1 then
  begin
    ls_Receive := prif_SendCommand('e', 1024, 3);
    if (Copy(ls_Receive, 1, 1) = Chr(27)) and (Copy(ls_Receive, 2, 1) = 'y') then
    else begin
      Application.MessageBox('联机通讯失败，请与系统管理员联系！', PChar(Caption),
        MB_OK + MB_ICONQUESTION);
      Exit;
    end;
    ls_Receive := prif_SendCommand(']', 1024, 100);
    //ShowMessage(ls_Receive);
    if (Copy(ls_Receive, 1, 1) <> Chr(27)) and (Copy(ls_Receive, 2, 1) <> 's') then
    begin
      Application.MessageBox('接收数据失败。', PChar(Caption),
        MB_OK + MB_ICONQUESTION);
      Exit;
    end;
    if  Copy(ls_Receive, 3, 1) <> '0' then
    begin
      Application.MessageBox('有效范围内无卡或卡损坏，请与管理员联系。', PChar(Caption),
        MB_OK + MB_ICONQUESTION);
      Exit;
    end;
    if Copy(ls_Receive, 4, 1) <> '0' then
    begin
      Application.MessageBox('核对密码错误或卡损坏，请与管理员联系。', PChar(Caption),
        MB_OK + MB_ICONQUESTION);
      Exit;
    end;
    ls_CardNo1 := Copy(ls_Receive, 10, 1);
    ls_CardNo2 := IntToHex(Integer(Ord(ls_CardNo1[1])), 0);
    if  ls_CardNo2 = 'FF' then
    begin
      Application.MessageBox('此卡号为新卡不能进行充值。', PChar(Caption),
        MB_OK + MB_ICONQUESTION);
      Exit;
    end; 
    ls_CardNo := Copy(ls_Receive, 14, 5);
    eCardId.Text := ls_CardNo;
  end;
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT a.card_id, a.card_money, a.card_state, b.cm_id, b.cm_name FROM cardinfo a, ' +
      'customerinfo b WHERE a.card_id = ''%s'' AND a.cm_id = b.cm_id', [eCardId.Text]);
    Open;
    if IsEmpty then
    begin
      DispInfo('会员资料没有找到,请核对输入的会员卡号是否正确');
      bbtnConfirm.Enabled := False;
      Close;
      Exit;
    end;
    if FieldByName('card_state').AsInteger <> 1 then
    begin
      DispInfo('会员卡当前已经挂失,不能进行充值');
      bbtnConfirm.Enabled := False;
      Close;
      Exit;
    end;
    eCardId.Text := FieldByName('card_id').AsString;
    eSavingMoney.Value := 0.0;
    eSavingMoney.SetFocus;
    eCMName.Text := FieldByName('cm_name').AsString;
    eOldMoney.Value := FieldByName('card_money').AsCurrency;
  end;
end;

procedure TfrmCardSaving.bbtnFindCardClick(Sender: TObject);
begin
  inherited;
  prip_GetCardInfo;
end;

procedure TfrmCardSaving.bbtnConfirmClick(Sender: TObject);
var
  li_Kind: Integer;
  ls_SQL: String;
begin
  inherited;
  if not prif_CanSave then Exit;
  li_Kind := StrToInt(Copy(eSavingKind.Text, 1, 1));
  try
    with SavingCardq do
    begin
      if Active then Close;
      Connection := dmData.adocon;
      SQL.Text := 'SELECT * FROM cardsaving';
      Open;
      Append;
      FieldByName('card_id').AsString := eCardId.Text;
      FieldByName('before_money').AsCurrency := eOldMoney.Value;
      FieldByName('saving_money').AsCurrency := eSavingMoney.Value;
      FieldByName('after_money').AsCurrency := eNowMoney.Value;
      FieldByName('saving_date').AsString := FormatDateTime('YYYY-MM-DD', Date); 
      FieldByName('saving_time').AsString := FormatDateTime('HH:MM:SS', Time);
      FieldByName('saving_kind').AsInteger := li_Kind;
      FieldByName('login_id').AsString := LoginInfo.UserId;
      Post;
      ls_SQL := Format('UPDATE cardinfo SET card_money = %f WHERE card_id = ''%s''',
        [eNowMoney.Value, eCardId.Text]);
      dmData.adocon.Execute(ls_SQL);
      Fs_Old := eOldMoney.Text;
      eOldMoney.Value := eNowMoney.Value;
      prip_Print;
      DispInfo(Format('充值完成,充值后金额为%f!', [eNowMoney.Value]), 2);
      eNowMoney.Value := 0.0;
    end;
  except
    On E: Exception do
    begin
      DispInfo('充值失败!');
      DispInfo(e.Message);
    end;
  end;
end;

procedure TfrmCardSaving.eSavingMoneyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    eNowMoney.Value := StrToCurr(eOldMoney.Text) + StrToCurr(eSavingMoney.Text);
    if eSavingMoney.Value > 0 then
    begin
      bbtnConfirm.Enabled := True;
    end;
  end;
end;

procedure TfrmCardSaving.prip_GetCsKind;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM cskind where kind_id <> 2';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        eSavingKind.Items.Add(IntToStr(FieldByName('kind_id').AsInteger) +
          '-' + FieldByName('kind_name').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

function TfrmCardSaving.prif_OpenComPort(Ai_Buff: Integer): boolean;
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

function TfrmCardSaving.prif_SendCommand(Av_Command: Variant; Ai_Buff,
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

procedure TfrmCardSaving.prip_Print;
var 
  li_I: Integer;
  lc_Rect: TRect;
begin
  lc_Rect := Rect(50, 50, 100, 300);
  li_I := 0; 
  with Printer do
  begin
    BeginDoc;
    Canvas.Font.Size := dmData.Ai_Size;
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), dmData.As_PrintTitle);
    Inc(li_I);   
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), '地址：' + dmData.As_Address);
    Inc(li_I);
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), '电话：' + dmData.As_Tel);
    Inc(li_I);
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), '会员充值');
    Inc(li_I);
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), '会员充值前金额:' + Fs_Old);
    Inc(li_I);  
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), '会员充值金额:' + eSavingMoney.Text);
    Inc(li_I);
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), '会员充值后金额:' + eOldMoney.Text);
    Inc(li_I);  
    Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), '客户签名：');
    EndDoc;
  end;
end;

end.
