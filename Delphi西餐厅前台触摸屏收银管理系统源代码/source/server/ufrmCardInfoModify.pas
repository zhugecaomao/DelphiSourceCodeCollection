unit ufrmCardInfoModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModifyDataBase, ImgList, StdCtrls, Buttons, DB, ADODB,
  CSADOQuery, dxExEdtr, dxEdLib, dxDBELib, dxEditor, dxCntner, 
  CSCustomdxDateEdit, CSdxDBDateEdit, OleCtrls, MSCommLib_TLB, ExtCtrls,
  ExtDlgs;

type
  TfrmCardInfoModify = class(TfrmModifyDataBase)
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    eCMId: TdxDBEdit;
    eCMName: TdxDBEdit;
    eCMTel: TdxDBEdit;
    Label16: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eCMMail: TdxDBEdit;
    Label8: TLabel;
    Label5: TLabel;
    eCMOnlyNo: TdxDBEdit;
    Label9: TLabel;
    eCMDate: TCSdxDBDateEdit;
    Label6: TLabel;
    eCMOld: TdxDBSpinEdit;
    eCMSex: TdxDBPickEdit;
    eCMAddRess: TdxDBEdit;
    eCMTime: TdxDBEdit;
    Label7: TLabel;
    Label10: TLabel;
    eCardId: TdxDBEdit;
    eCardKindId: TdxDBButtonEdit;
    Label12: TLabel;
    eEmpId: TdxDBButtonEdit;
    cardinfoq: TCSADOQuery;
    cardinfoqcard_id: TStringField;
    cardinfoqcm_id: TStringField;
    cardinfoqkind_id: TIntegerField;
    cardinfoqcard_money: TBCDField;
    cardinfoqcard_state: TIntegerField;
    cardinfoqemp_id: TStringField;
    cardinfoqlogin_id: TStringField;
    Viewqcm_id: TStringField;
    Viewqcm_name: TStringField;
    Viewqcm_old: TIntegerField;
    Viewqcm_sex: TStringField;
    Viewqcm_address: TStringField;
    Viewqcm_tel: TStringField;
    Viewqcm_mail: TStringField;
    Viewqcm_onlyno: TStringField;
    Viewqcm_date: TStringField;
    Viewqcm_time: TStringField;
    Viewqlast_time: TDateTimeField;
    Viewqlogin_id: TStringField;
    Label13: TLabel;
    eBirthday: TCSdxDBDateEdit;
    Viewqcm_birthday: TStringField;
    bbtnServiceFix: TBitBtn;
    bbtnPrcFix: TBitBtn;
    MSComm: TMSComm;
    Label14: TLabel;
    imgView: TImage;
    bbtnSelect: TBitBtn;
    cardinfod: TDataSource;
    Imgd: TDataSource;
    Imgq: TCSADOQuery;
    Imgqcardid: TStringField;
    Imgqcardimg: TStringField;
    Imgqstart_date: TStringField;
    Imgqend_date: TStringField;
    eStartDate: TCSdxDBDateEdit;
    Label15: TLabel;
    eEndDate: TCSdxDBDateEdit;
    Label17: TLabel;
    procedure bbtnConfirmClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure eCardKindIdButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure eEmpIdButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure bbtnServiceFixClick(Sender: TObject);
    procedure bbtnSelectClick(Sender: TObject);
  private
    Fs_CMId: String;
    Fb_SelectImg: Boolean;
    Fi_OleTick, Fi_NewTick: DWord; 
    function prif_CanSave: Boolean;
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
  frmCardInfoModify: TfrmCardInfoModify;

implementation
uses udmData, ufrmBase, ufrmEmpView, ufrmCardKindView, ufrmCardServiceFix;
{$R *.dfm}

{ TfrmCardInfoModify }

procedure TfrmCardInfoModify.prop_IniData;
var
  ls_CMId, ls_CardId: String;
begin
  inherited;
  case Ri_Flag of
    2:
    begin
      Caption := Format(Caption, ['[修改]']);
      with cardInfoq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM cardinfo WHERE card_id = ''%s''', [Rs_Id]);
        Open;
        Edit;
        ls_CMId := FieldByName('cm_id').AsString;
      end;
      with Viewq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM customerinfo WHERE cm_id = ''%s''',
          [ls_CMId]);
        Open;
        Edit;
      end;
      with Imgq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM cardimage WHERE cardid = ''%s''', [Rs_Id]);
        Open;
        if (FileExists(FieldByName('cardimg').AsString)) and (not FieldByName('cardimg').IsNull) then
        begin
          imgView.Picture.LoadFromFile(FieldByName('cardimg').AsString);
        end;
        Edit;
        FieldByName('cardid').AsString := Rs_Id;
      end;
    end;
    3:
    begin
      Caption := Format(Caption, ['[删除]']);
      with cardInfoq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM cardinfo WHERE card_id = ''%s''', [Rs_Id]);
        Open;
        ls_CMId := FieldByName('cm_id').AsString;
      end;
      with Viewq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM customerinfo WHERE cm_id = ''%s''',
          [ls_CMId]);
        Open; 
      end; 
      with Imgq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM cardimage WHERE cardid = ''%s''', [Rs_Id]);
        Open; 
      end;
    end;
    1:
    begin
      ls_CMId := dmData.pubf_GetCustomerId;
      ls_CardId := dmData.pubf_GetCardId;
      with Viewq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := 'SELECT * FROM customerinfo WHERE 1 = 2';
        Open;
        Caption := Format(Caption, ['[添加]']);
        Append;
        FieldByName('cm_id').AsString := ls_CMId;
        FieldByName('cm_date').AsString := FormatDateTime('YYYY-MM-DD', Date);
        FieldByName('cm_time').AsString := FormatDateTime('HH:MM:SS', Time);
      end;
      with cardInfoq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := 'SELECT * FROM cardinfo WHERE 1 = 2';
        Open;
        Append;
        FieldByName('card_id').AsString := ls_CardId;
        FieldByName('cm_id').AsString := ls_CMId;
      end;
      with Imgq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := 'SELECT * FROM cardimage WHERE 1 = 2';
        Open;
        Append;
        FieldByName('cardid').AsString := ls_CardId;
        FieldByName('start_date').AsString := FormatDateTime('YYYY-MM-DD', Date);
        FieldByName('end_date').AsString := FormatDateTime('YYYY-MM-DD', Date);
      end;
    end;
  end;
end;

procedure TfrmCardInfoModify.bbtnConfirmClick(Sender: TObject);
var
  ls_Receive, ls_CardId: String;
begin
  inherited;
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
       '0' + cardInfoq.FieldByName('card_id').AsString + '0' + Chr(29) + Chr(27) + '\', 1024, 100);
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
  case Ri_Flag of
    1:
    begin
      if not prif_CanSave then Exit;
      Viewq.FieldByName('login_id').AsString := dmData.As_OptName;
      cardinfoq.FieldByName('login_id').AsString := dmData.As_OptName;
      cardinfoq.FieldByName('card_state').AsInteger := 1;
      Imgq.FieldByName('start_date').AsString := FormatDateTime('YYYY-MM-DD',
        StrToDate(Imgq.FieldByName('start_date').AsString));
      Imgq.FieldByName('end_date').AsString := FormatDateTime('YYYY-MM-DD',
        StrToDate(Imgq.FieldByName('end_date').AsString));
      Viewq.Post;
      cardinfoq.Post;
      Imgq.Post;
      if DispInfo('添加会员完成，是否继续添加？', 3) = 'y' then
      begin
        Viewq.Append;
        cardinfoq.Append;
        Fs_CMId := dmData.pubf_GetCustomerId;
        ls_CardId := dmData.pubf_GetCardId;
        cardinfoq.FieldByName('card_id').AsString := ls_CardId;
        cardinfoq.FieldByName('cm_id').AsString := Fs_CMId;
        Viewq.FieldByName('cm_id').AsString := Fs_CMId;
        Imgq.Append;
        Imgq.FieldByName('cardid').AsString := ls_CardId;
        Imgq.FieldByName('start_date').AsString := FormatDateTime('YYYY-MM-DD', Date);
        Imgq.FieldByName('end_date').AsString := FormatDateTime('YYYY-MM-DD', Date);
      end else ModalResult := mrOk;
    end;
    2:
    begin
      if not prif_CanSave then Exit;
      Viewq.FieldByName('login_id').AsString := dmData.As_OptName; 
      cardinfoq.FieldByName('login_id').AsString := dmData.As_OptName; 
      Imgq.FieldByName('start_date').AsString := FormatDateTime('YYYY-MM-DD',
        StrToDate(Imgq.FieldByName('start_date').AsString));
      Imgq.FieldByName('end_date').AsString := FormatDateTime('YYYY-MM-DD',
        StrToDate(Imgq.FieldByName('end_date').AsString));
      Viewq.Post;
      cardinfoq.Post;  
      Imgq.Post;
      DispInfo('会员数据修改完成', 2);
      ModalResult := mrOk;
    end;
    3:
    begin
      if DispInfo('您是否要确认删除当前数据？', 3) = 'y' then
      begin
        Viewq.Delete;
        cardinfoq.Delete;  
        Imgq.Delete;
        ModalResult := mrOk;
      end;
    end;
  end;
end;

function TfrmCardInfoModify.prif_CanSave: Boolean;
begin 
  Result := True;
end;

procedure TfrmCardInfoModify.bbtnCancelClick(Sender: TObject);
begin
  Viewq.Cancel;
  inherited;
end;

procedure TfrmCardInfoModify.eCardKindIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmCardKindView := TfrmCardKindView.Create(nil);
  try
    frmCardKindView.pubp_Ini('', 2);
    if frmCardKindView.ShowModal = mrOk then
    begin
      cardinfoq.FieldByName('kind_id').AsInteger := frmCardKindView.Ai_KindId;
    end;
  finally
    FreeAndNil(frmCardKindView);
  end;
end;

procedure TfrmCardInfoModify.eEmpIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
 { frmEmpView := TfrmEmpView.Create(nil);
  try
    frmEmpView.pubp_Ini('', 2);
    if frmEmpVIew.ShowModal = mrOk then
    begin
      cardinfoq.FieldByName('emp_id').AsString := frmEmpView.As_EmpId;
    end;
  finally
    FreeAndNil(frmEmpVIew);
  end;}
end;

procedure TfrmCardInfoModify.bbtnServiceFixClick(Sender: TObject);
begin
  inherited;
  frmCardServiceFix := TfrmCardServiceFix.Create(nil);
  try
    frmCardServiceFix.pubp_Ini(cardinfoq.FieldByName('card_id').AsString,
      Viewq.FieldByName('cm_name').AsString);
    frmCardServiceFix.ShowModal;
  finally
    FreeAndNil(frmCardServiceFix);
  end;
end;

function TfrmCardInfoModify.prif_OpenComPort(Ai_Buff: Integer): boolean;
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

function TfrmCardInfoModify.prif_SendCommand(Av_Command: Variant; Ai_Buff,
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

procedure TfrmCardInfoModify.bbtnSelectClick(Sender: TObject);
var
  lc_OpenPic: TOpenPictureDialog;
begin
  inherited; 
  Fb_SelectImg := False;
  lc_OpenPic := TOpenPictureDialog.Create(nil);
  try
    lc_OpenPic.InitialDir := ExtractFilePath(Application.ExeName) + 'Image\';
    lc_OpenPic.Filter := 'All (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp|JPEG Image File ' +
      '(*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp';
    if lc_OpenPic.Execute then
    begin
      Imgq.FieldByName('cardimg').AsString := lc_OpenPic.FileName; 
      imgView.Picture.LoadFromFile(lc_OpenPic.FileName);
      Fb_SelectImg := True;
    end;
    bbtnConfirm.Enabled := True;
  finally
    lc_OpenPic.Free;
  end;
end;

end.
