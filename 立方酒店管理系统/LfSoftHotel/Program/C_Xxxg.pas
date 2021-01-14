unit C_Xxxg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StandDb, DosMove, DB, DBTables, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, DBNavPlus, Mask, ComCtrls;

type
  TXxxgForm = class(TStandDbForm)
    tblMzdm: TTable;
    dsMzdm: TDataSource;
    tblDqdm: TTable;
    dsDqdm: TDataSource;
    tblZjdm: TTable;
    dsZjdm: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dbeZjhm: TDBEdit;
    dbeCsny: TDBEdit;
    dbeTlsy: TDBEdit;
    dbeZy: TDBEdit;
    dbeHcl: TDBEdit;
    dbeHcq: TDBEdit;
    dbeJtdz: TDBEdit;
    dbeBz: TDBEdit;
    dbcXb: TDBComboBox;
    dblMzdm: TDBLookupComboBox;
    dblDqdm: TDBLookupComboBox;
    dblZjdm: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    lblYwx: TLabel;
    lblYwm: TLabel;
    dbeYwx: TDBEdit;
    dbeYwm: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    tblGbdm: TTable;
    tblQzdm: TTable;
    dsGbdm: TDataSource;
    dsQzdm: TDataSource;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    dbeJdr: TDBEdit;
    Label26: TLabel;
    dbeJddw: TDBEdit;
    Label27: TLabel;
    dbeDwdz: TDBEdit;
    Label28: TLabel;
    dbeLxdh: TDBEdit;
    Label29: TLabel;
    DBEdit4: TDBEdit;
    Label30: TLabel;
    dbeQdr1: TDBEdit;
    Label31: TLabel;
    dbeQdr2: TDBEdit;
    Label32: TLabel;
    dbeQdr3: TDBEdit;
    Label33: TLabel;
    dbeQdr4: TDBEdit;
    TabSheet4: TTabSheet;
    Label34: TLabel;
    DBEdit9: TDBEdit;
    Label4: TLabel;
    dbeKrxm: TDBEdit;
    DBText1: TDBText;
    Label35: TLabel;
    dbeDwmc: TDBEdit;
    qryWorkD_KRBH: TStringField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_KRLX: TStringField;
    qryWorkD_DDRQ: TDateTimeField;
    qryWorkD_DDSJ: TDateTimeField;
    qryWorkD_LDRQ: TDateTimeField;
    qryWorkD_LDSJ: TDateTimeField;
    qryWorkD_YWX: TStringField;
    qryWorkD_YWM: TStringField;
    qryWorkD_XB: TStringField;
    qryWorkD_MZBH: TStringField;
    qryWorkD_DQBH: TStringField;
    qryWorkD_GBBH: TStringField;
    qryWorkD_NZTS: TIntegerField;
    qryWorkD_TLSY: TStringField;
    qryWorkD_ZJBH: TStringField;
    qryWorkD_ZJHM: TStringField;
    qryWorkD_CSNY: TDateTimeField;
    qryWorkD_HCL: TStringField;
    qryWorkD_HCQ: TStringField;
    qryWorkD_QZBH: TStringField;
    qryWorkD_QZYXQ: TDateTimeField;
    qryWorkD_ZY: TStringField;
    qryWorkD_LXDH: TStringField;
    qryWorkD_DWMC: TStringField;
    qryWorkD_JTDZ: TStringField;
    qryWorkD_JDR: TStringField;
    qryWorkD_JDDW: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_QDR1: TStringField;
    qryWorkD_QDR2: TStringField;
    qryWorkD_QDR3: TStringField;
    qryWorkD_QDR4: TStringField;
    dbeDdsj: TDBEdit;
    Label36: TLabel;
    procedure qryWorkAfterOpen(DataSet: TDataSet);
    procedure qryWorkAfterClose(DataSet: TDataSet);
    procedure qryWorkD_ZJHMValidate(Sender: TField);
    procedure qryWorkD_ZJBHChange(Sender: TField);
    procedure btnLocaClick(Sender: TObject);
    procedure dbeZjhmKeyPress(Sender: TObject; var Key: Char);
    procedure dsWorkDataChange(Sender: TObject; Field: TField);
    procedure qryWorkD_KRLXGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWorkBeforeInsert(DataSet: TDataSet);
    procedure qryWorkAfterPost(DataSet: TDataSet);
    procedure qryWorkBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    FKrxm : string;
    function  ValidSfz(const AZjhm: string): Boolean;
  public
    { Public declarations }
  end;

var
  XxxgForm: TXxxgForm;

procedure Xxxg;
procedure XxxgEnter(const AKrbh: string);
procedure LdkrEnter(const AKrbh: string);

implementation

uses C_HotelData, C_Define;

{$R *.dfm}

procedure Xxxg;
begin
  XxxgForm := TXxxgForm.Create(Application);
  try
    with XxxgForm do
    begin
      try
        qryWork.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      if qryWork.IsEmpty then Exit;

      ShowModal;
    end;
  finally
    XxxgForm.qryWork.Close;
    XxxgForm.Free;
  end;
end;

procedure XxxgEnter(const AKrbh: string);
begin
  XxxgForm := TXxxgForm.Create(Application);
  try
    with XxxgForm do
    begin
      try
        qryWork.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      if qryWork.IsEmpty then Exit;

      qryWork.Locate('D_KRBH',AKrbh,[]);
      FKrxm := qryWorkD_KRXM.Value;

      ShowModal;
    end;
  finally
    XxxgForm.qryWork.Close;
    XxxgForm.Free;
  end;
end;

procedure LdkrEnter(const AKrbh: string);
begin
  XxxgForm := TXxxgForm.Create(Application);
  try
    with XxxgForm do
    begin
      qryWork.SQL.Clear;
      qryWork.SQL.Add('select * from KRXXDA');
      qryWork.RequestLive := False;
      try
        qryWork.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      if qryWork.IsEmpty then Exit;

      qryWork.Locate('D_KRBH',AKrbh,[]);
      
      ShowModal;
    end;
  finally
    XxxgForm.qryWork.Close;
    XxxgForm.Free;
  end;
end;

procedure TXxxgForm.qryWorkAfterOpen(DataSet: TDataSet);
begin
  inherited;
  try
    tblMzdm.Open;
    tblDqdm.Open;
    tblZjdm.Open;
    tblGbdm.Open;
    tblQzdm.Open;
  except
    On E:Exception do
    begin
      ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                  +#13#10
                  +'错误信息:'
                  +E.Message);
      raise;
    end;
  end;
end;

procedure TXxxgForm.qryWorkAfterClose(DataSet: TDataSet);
begin
  inherited;
  tblMzdm.Close;
  tblDqdm.Close;
  tblZjdm.Close;
  tblGbdm.Close;
  tblQzdm.Close;
end;

function TXxxgForm.ValidSfz(const AZjhm: string): Boolean;
begin
  Result := False;

  if Length(AZjhm)=15 then
  begin
    try
      qryWorkD_CSNY.Value :=
        EnCodeDate(StrToInt('19'+Copy(AZjhm,7,2)),
                   StrToInt(Copy(AZjhm,9,2)),
                   StrToInt(Copy(AZjhm,11,2)));
      if StrToInt(Copy(AZjhm,15,1)) mod 2 = 0 then
        qryWorkD_XB.Value := '女'
      else
        qryWorkD_XB.Value := '男';
      Result := True;
    except
      raise Exception.Create('非法身份证号码！');
    end;
  end;

  if Length(AZjhm)=18 then
  begin
    try
      qryWorkD_CSNY.Value :=
        EnCodeDate(StrToInt(Copy(AZjhm,7,4)),
                   StrToInt(Copy(AZjhm,11,2)),
                   StrToInt(Copy(AZjhm,13,2)));
      if StrToInt(Copy(AZjhm,18,1)) mod 2 = 0 then
        qryWorkD_XB.Value := '女'
      else
        qryWorkD_XB.Value := '男';
      Result := True;
    except
      raise Exception.Create('非法身份证号码！');
    end;
  end;
end;

procedure TXxxgForm.qryWorkD_ZJHMValidate(Sender: TField);
begin
  inherited;
  if (not ValidSfz(qryWorkD_ZJHM.Value))and(qryWorkD_ZJHM.Value<>'') then
    raise Exception.Create('非法身份证号码！');
end;

procedure TXxxgForm.qryWorkD_ZJBHChange(Sender: TField);
begin
  inherited;
  if HotelData.FindMc('ZJDM','D_ZJBH','D_ZJMC',qryWorkD_ZJBH.Value) = '身份证' then
  begin
    qryWorkD_ZJHM.OnValidate := qryWorkD_ZJHMValidate;
    dbeZjhm.OnKeyPress := dbeZjhmKeyPress;
  end
  else
  begin
    qryWorkD_ZJHM.OnValidate := nil;
    dbeZjhm.OnKeyPress := nil;
  end;
end;

procedure TXxxgForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  if cmbExpress.ItemIndex = 0 then
    if cmbOption.ItemIndex = 0 then
      qryWork.Locate('D_KRXM',edtValue.Text,[]);
end;

procedure TXxxgForm.dbeZjhmKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (Key in ['0'..'9'])) and (Ord(Key) <> VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure TXxxgForm.dsWorkDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  
  if qryWorkD_KRLX.Value = KRLX_NB then PageControl1.ActivePageIndex := 0
  else
  if qryWorkD_KRLX.Value = KRLX_WB then PageControl1.ActivePageIndex := 1
  else
  if qryWorkD_KRLX.Value = KRLX_TD then PageControl1.ActivePageIndex := 2
  else
  if qryWorkD_KRLX.Value = KRLX_MF then PageControl1.ActivePageIndex := 3;
end;

procedure TXxxgForm.qryWorkD_KRLXGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsString = KRLX_NB then Text := '客人类型：内宾';
    if Sender.AsString = KRLX_WB then Text := '客人类型：外宾';
    if Sender.AsString = KRLX_TD then Text := '客人类型：团队';
    if Sender.AsString = KRLX_MF then Text := '客人类型：免费';
  end;
end;

procedure TXxxgForm.qryWorkBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TXxxgForm.qryWorkAfterPost(DataSet: TDataSet);
var
  aKrxm,s : string;
begin
  aKrxm := qryWorkD_KRXM.Value;
  s := 'update KFZT set D_KRXM="'+aKrxm+'" where D_KRXM="'+FKrxm+'"';
  HotelData.ExecSql(s);
end;

procedure TXxxgForm.qryWorkBeforeEdit(DataSet: TDataSet);
begin
  FKrxm := qryWorkD_KRXM.Value;
end;

end.
