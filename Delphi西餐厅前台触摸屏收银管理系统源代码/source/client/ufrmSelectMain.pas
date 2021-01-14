unit ufrmSelectMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, CSADOQuery,
  abfComponents;

type
  TfrmSelectMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    bbtnNetLocat: TBitBtn;
    bbtnTrade: TBitBtn;
    bbtnDeliver: TBitBtn;
    bbtnOffLine: TBitBtn;
    bbtnPosSet: TBitBtn;
    bbtnExit: TBitBtn;
    bbtnBeginning: TBitBtn;
    bbtnOnLine: TBitBtn;
    labNow: TLabel;
    labNum: TLabel;
    Label5: TLabel;
    labNet: TLabel;
    labState: TLabel;
    Timer1: TTimer;
    OnLineq: TCSADOQuery;
    OnLineqI_MACHINES_CD: TStringField;
    OnLineqI_LOGIN_CD: TStringField;
    OnLineqI_DATE: TStringField;
    OnLineqI_TIME: TStringField;
    OnLineqI_WORK_CD: TStringField;
    OnLineqI_AMOUNT: TBCDField;
    OnLineqI_FLAG: TIntegerField;
    abfAutoRun: TabfAutoRun;
    procedure bbtnOnLineClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnTradeClick(Sender: TObject);
    procedure bbtnOffLineClick(Sender: TObject);
    procedure bbtnExitClick(Sender: TObject);
    procedure bbtnDeliverClick(Sender: TObject);
    procedure bbtnPosSetClick(Sender: TObject);
  private
    procedure prip_IniInterFace;
    procedure prip_IniData;
  public
    procedure pubp_Ini;
    function pubf_Ini: Boolean;
  end;

var
  frmSelectMain: TfrmSelectMain;

implementation

uses ufrmBeginning, upubCommon, udmData, ufrmFrontPay, uPubClient,
  ufrmDataDeliver, ufrmSoftReg, ufrmPosSet;

{$R *.dfm}

{ TfrmSelectMain }

procedure TfrmSelectMain.prip_IniData;
begin
  abfAutoRun.FileName := Application.ExeName;
  abfAutoRun.AutoRun := True;
  labNow.Caption := FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);
  MachinesInfo.MachinesName := GetMachinesName;
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_MACHINES_MS WHERE I_MACHINES_NAME = ''%s''',
      [MachinesInfo.MachinesName]);
    Open;
    if not IsEmpty then
    begin
      MachinesInfo.MachinesCD := FieldByName('I_MACHINES_CD').AsString;
      labNum.Caption := MachinesInfo.MachinesCD;
      if pubCommon.OnOffLine then
        labState.Caption := FieldByName('I_LAST_ON_TIME').AsString + ' 上线'
      else
        labState.Caption := FieldByName('I_LAST_OFF_TIME').AsString + ' 下线'
    end else ShutDownMachines;
    Close;
  end;
  labNet.Caption := MachinesInfo.MachinesNet;
end;

procedure TfrmSelectMain.prip_IniInterFace;
begin
  WindowState := wsMaximized;
end;

procedure TfrmSelectMain.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmSelectMain.bbtnOnLineClick(Sender: TObject);
var
  ls_SQL: String;
begin
  pubCommon.OnOffLine := True;
  ls_SQL := Format('UPDATE T_MACHINES_MS SET I_MACHINES_FREE = 0, ' +
    ' I_LAST_ON_TIME = ''%s'' WHERE I_MACHINES_CD = ''%s''', 
    [FormatDateTime('YYYY-MM-DD HH:MM:SS', Now), MachinesInfo.MachinesCD]);
  dmData.pubp_ExecSQL(ls_SQL);
  if not OpenLogin then Exit;
  if not OpenMain then Exit;
  //ModalResult := mrOk;
  //if not OpenSelectMain then Exit;
  if not OpenBeginning then Exit;  
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_MACHINES_MS WHERE I_MACHINES_NAME = ''%s''',
      [MachinesInfo.MachinesName]);
    Open;
    if not IsEmpty then
    begin
      MachinesInfo.MachinesCD := FieldByName('I_MACHINES_CD').AsString;
      labNum.Caption := MachinesInfo.MachinesCD;
      if pubCommon.OnOffLine then
        labState.Caption := FieldByName('I_LAST_ON_TIME').AsString + ' 上线'
      else
        labState.Caption := FieldByName('I_LAST_OFF_TIME').AsString + ' 下线'
    end else ShutDownMachines;
    Close;
  end;
  {frmBeginning := TfrmBeginning.Create(Self);
  frmBeginning.pubp_Ini;
  frmBeginning.Show; }
end;

procedure TfrmSelectMain.Timer1Timer(Sender: TObject);
begin
  labNow.Caption := FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);
end;

procedure TfrmSelectMain.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TfrmSelectMain.bbtnTradeClick(Sender: TObject);
begin
  if not pubCommon.OnOffLine then Exit;
  frmFrontPay := TfrmFrontPay.Create(Self);
  frmFrontPay.pubp_Ini;
  frmFrontPay.Show;
end;

procedure TfrmSelectMain.bbtnOffLineClick(Sender: TObject);
var
  ls_SQL: String;
begin
  if not pubCommon.OnOffLine then Exit;
  pubCommon.OnOffLine := False;
  ls_SQL := Format('UPDATE T_MACHINES_MS SET I_MACHINES_FREE = 0, ' +
    ' I_LAST_OFF_TIME = ''%s'' WHERE I_MACHINES_CD = ''%s''', 
    [FormatDateTime('YYYY-MM-DD HH:MM:SS', Now), MachinesInfo.MachinesCD]);
  dmData.pubp_ExecSQL(ls_SQL);
  with OnLineq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_LOGIN_WORK_MS WHERE 1 = 2';
    Open;
    Append;
    FieldByName('I_MACHINES_CD').AsString := MachinesINfo.MachinesCD;
    FieldByName('I_LOGIN_CD').AsString := LoginInfo.UserId;
    FieldByName('I_DATE').AsString := FormatDateTime('YYYY-MM-DD', Date);
    FieldByName('I_TIME').AsString := FormatDateTime('HH:MM:SS', Time);
    FieldByName('I_WORK_CD').AsString := LoginInfo.WorkCD;
    FieldByName('I_AMOUNT').AsCurrency := LoginInfo.LYMoney;  
    FieldByName('I_FLAG').AsCurrency := AI_OFFLINE;
    Post;
    Close;
  end; 
  prip_IniData;
end;

procedure TfrmSelectMain.bbtnExitClick(Sender: TObject);
var
  lc_PowerInfo: TPowerInfo;
begin 
  if pubCommon.OnOffLine then Exit;
  if not PowerInfo.ExitPos then
  begin
    lc_PowerInfo := PowerInfo;
    if not OpenLogin then Exit;
    if not lc_PowerInfo.ExitPos then
    begin
      PowerInfo := lc_PowerInfo;
      Exit;
    end;
  end;
  ShutDownMachines;  
end;    

function TfrmSelectMain.pubf_Ini: Boolean;
begin
  dmData := TdmData.Create(nil);
  Result := dmData.pubf_Connect;
  if not dmData.IsReg then
  begin 
    frmSoftReg := TfrmSoftReg.Create(nil);
    try
      frmSoftReg.pubp_Ini;
      if frmSoftReg.ShowModal <> mrOk then
      begin
        ShutDownMachines;
      end;
    finally
      FreeAndNil(frmSoftReg);
    end;
  end;
end;

procedure TfrmSelectMain.bbtnDeliverClick(Sender: TObject);
begin
  if pubCommon.OnOffLine then Exit; 
  if pubCommon.IsNet then
  begin
    frmDataDeliver := TfrmDataDeliver.Create(nil);
    try
      frmDataDeliver.pubp_Ini;
      frmDataDeliver.ShowModal;
    finally
      frmDataDeliver.free;
    end;
  end;
end;

procedure TfrmSelectMain.bbtnPosSetClick(Sender: TObject);
begin
  if not PowerInfo.PosSet then Exit;
  frmPosSet := TfrmPosSet.Create(nil);
  try
    frmPosSet.pubp_Ini;
    frmPosSet.ShowModal;
  finally
    frmPosSet.Free;
  end;
end;

end.
