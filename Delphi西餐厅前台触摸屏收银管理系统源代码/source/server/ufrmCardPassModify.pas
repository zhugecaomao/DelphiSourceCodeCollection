unit ufrmCardPassModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModifyDataBase, ImgList, StdCtrls, Buttons, dxCntner,
  dxEditor, dxEdLib, DB, ADODB, CSADOQuery, OleCtrls, MSCommLib_TLB;

type
  TfrmCardPassModify = class(TfrmModifyDataBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eCardId: TdxEdit;
    eCmName: TdxEdit;
    eOldPass: TdxEdit;
    eNewPass: TdxEdit;
    bbtnFindCard: TBitBtn;
    CardInfoq: TCSADOQuery;
    CardInfoqcard_id: TStringField;
    CardInfoqcm_id: TStringField;
    CardInfoqcm_name: TStringField;
    CardInfoqcard_pass: TStringField;
    MSComm: TMSComm;
    procedure bbtnFindCardClick(Sender: TObject);
    procedure eCardIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmClick(Sender: TObject);
    procedure eNewPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Fs_OldPass: String;  
    Fi_OleTick, Fi_NewTick: DWord;
    procedure prip_GetCardInfo;
    function prif_CanModifyPass: Boolean;
    procedure prip_Save; 
    function prif_OpenComPort(Ai_Buff: Integer): boolean;
    function prif_SendCommand(Av_Command: Variant; Ai_Buff, Ai_Time: DWord): String;
  public
    { Public declarations }
  end;

const
  COMMANDHEAD = Chr(27);

var
  frmCardPassModify: TfrmCardPassModify;

implementation
uses udmData, ufrmBase;
{$R *.dfm}

{ TfrmCardPassModify }

procedure TfrmCardPassModify.prip_GetCardInfo; 
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
      Application.MessageBox('此卡号为新卡不能进行操作。', PChar(Caption),
        MB_OK + MB_ICONQUESTION);
      Exit;
    end; 
    ls_CardNo := Copy(ls_Receive, 14, 5);
    eCardId.Text := ls_CardNo;
  end;
  if not CheckNull(eCardId.Text) then Exit;
  with CardInfoq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT a.card_id, a.card_pass, a.cm_id, b.cm_name FROM cardinfo a, '+
      ' customerinfo b WHERE a.card_id = ''%s'' AND a.cm_id = b.cm_id', [eCardId.Text]);
    Open;
    if not IsEmpty then
    begin
      eCmName.Text := FieldByName('cm_name').AsString;
      //eOldPass.Text :=
      Fs_OldPass := FieldByName('card_pass').AsString;
      eOldPass.SetFocus;
    end else begin
      DispInfo('会员资料没有找到');
    end;
    Close;
  end;
end;

procedure TfrmCardPassModify.bbtnFindCardClick(Sender: TObject);
begin
  inherited;
  prip_GetCardInfo;
end;

procedure TfrmCardPassModify.eCardIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    prip_GetCardInfo;
  end;
end;

function TfrmCardPassModify.prif_CanModifyPass: Boolean;
begin

  if eOldPass.Text <> Fs_OldPass then
  begin
    DispInfo('旧密码输入错误，不能修改密码');
    eOldPass.SetFocus;
    Result := False;
    Exit;
  end;
  if not CheckNull(eNewPass.Text) then
  begin
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmCardPassModify.prip_Save;
var
  ls_SQL: String;
begin
  if not prif_CanModifyPass then Exit;
  ls_SQL := Format('UPDATE cardinfo SET card_pass = ''%s'' WHERE card_id = ''%s''', [eNewPass.Text,
    eCardId.Text]);
  try
    dmData.adocon.BeginTrans;
    dmData.adocon.Execute(ls_SQL);
    dmData.adocon.CommitTrans;
    eCardId.SetFocus;
    eCmName.Clear;
    eOldPass.Clear;
    eNewPass.Clear;
    DispInfo('修改密码完成');
  except
    dmData.adocon.RollbackTrans;
    DispInfo('修改密码失败');
  end;
end;

procedure TfrmCardPassModify.bbtnConfirmClick(Sender: TObject);
begin
  inherited;
  prip_Save;
end;

procedure TfrmCardPassModify.eNewPassKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then prip_Save;
end;

function TfrmCardPassModify.prif_OpenComPort(Ai_Buff: Integer): boolean;
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

function TfrmCardPassModify.prif_SendCommand(Av_Command: Variant; Ai_Buff,
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
