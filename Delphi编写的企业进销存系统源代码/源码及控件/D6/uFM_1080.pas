unit uFM_1080;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Buttons, StdCtrls, Mask, DBCtrls, Db, DBTables, Grids, DBGrids,
  DBVrtNav, ExtCtrls, ToolEdit, DBNavPlus;

type
  TFM_1080 = class(TS_Form)
    Panel1: TPanel;
    Panel2: TPanel;
    Table1: TTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    Table1AutoNo: TIntegerField;
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F05: TStringField;
    Table1F06: TFloatField;
    Table1F07: TFloatField;
    Table1F08: TStringField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Qry1: TQuery;
    Table1CalF07: TFloatField;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Table2: TTable;
    DataSource2: TDataSource;
    Table1F10: TStringField;
    Table2AutoNo: TIntegerField;
    Table2F02: TDateTimeField;
    Table2F03: TFloatField;
    Table2BUSER: TStringField;
    Table2BTIME: TDateTimeField;
    Table2EUSER: TStringField;
    Table2ETIME: TDateTimeField;
    Label6: TLabel;
    ComboEdit1: TComboEdit;
    Label7: TLabel;
    Query1: TQuery;
    DataSource3: TDataSource;
    Query1F10: TStringField;
    Query1F03: TStringField;
    Table1F09: TStringField;
    Table1F12: TFloatField;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    DBNavPlus1: TDBNavPlus;
    Label8: TLabel;
    Edit6: TEdit;
    edtCName: TEdit;
    SB3: TSpeedButton;
    Button1: TSpeedButton;
    BitBtn2: TBitBtn;
    procedure RequiredValue(Sender: TField);
    procedure Button1Click(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure Table2BeforeEdit(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    lInsBtn: boolean;  
    sCNo,sBEF01,sBEF02,sBEF03,sBEF04,sBEF05:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_1080: TFM_1080;
  BEdate: Tdate;

implementation
Uses utilities, uFunction, uDM, uDataBaseEValue, uRp_1080;

{$R *.DFM}

procedure TFM_1080.Button1Click(Sender: TObject);
var
  CNo, sF01, sF02, sF03, sF04, sF05: string;
begin
  inherited;
  Edit6.Text := IntToStr(ValidInt(Edit6.text));
  if ComboEdit1.Text='' then begin R_OKMessage(['请输入客户编号']);ComboEdit1.SetFocus;Abort;end;
  if Edit1.Text='' then begin R_OKMessage(['型号不可为空']); Edit1.SetFocus;Abort; end;
  if Edit2.Text='' then begin R_OKMessage(['品名不可为空']); Edit2.SetFocus;Abort; end;
  if Edit3.Text='' then begin R_OKMessage(['材质不可为空']); Edit3.SetFocus;Abort; end;
  CNo := ComboEdit1.text;
  sF01 := Edit1.Text;
  sF02 := Edit2.Text;
  sF03 := Edit3.Text;
  sF04 := Edit4.Text;
  sF05 := Edit5.Text;

  lInsBtn := true;
  Table1.Insert;
  lInsBtn := false;
  Table1F01.AsString := Edit1.Text;
  Table1F02.AsString := Edit2.Text;
  Table1F03.AsString := Edit3.Text;
  Table1F04.AsString := Edit4.Text;
  Table1F05.AsString := Edit5.Text;
  Table1F06.AsString := Edit6.text;
  Table1F10.AsString := ComboEdit1.Text;
  Try
    Table1.Post;
    if CNo <> Query1F10.Text then
    begin
      Query1.Close;
      Query1.Open;
      Query1.Locate('F10',CNo,[]);
      Table1.FindKey([CNo,sF01,sF02,sF03,sF04,sF05]);
    end;
  except
    Table1.Cancel;
  end;
end;

procedure TFM_1080.Table1CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table1CalF07.AsFloat := Table1F06.AsFloat * Table1F07.AsFloat;
end;

procedure TFM_1080.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'成品基本资料主档');
  if Table1.State<>dsInsert then
  begin
    Edit1.Text := Table1F01.AsString;
    Edit2.Text := Table1F02.AsString;
    Edit3.Text := Table1F03.AsString;
    Edit4.Text := Table1F04.AsString;
    Edit5.Text := Table1F05.AsString;
    ComboEdit1.text := Table1F10.AsString;
  end;
end;

procedure TFM_1080.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFM_1080.ComboEdit1ButtonClick(Sender: TObject);
var
  xS : TStringList;
begin
  inherited;
  xs := select_text('客户点选窗口','select F01 as 客户编号, F03 as 客户简称 from T1010 ','STK0311',[0,1],[]);
  if Assigned(xS) then
  try
    ComboEdit1.Text := xs.strings[0];
    edtCName.Text := xs.Strings[1];    
  finally
    xs.free;
  end; 
end;

procedure TFM_1080.DBGrid2EditButtonClick(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField = Table2F02 then
  begin
    AssignDBDate(Sender, DataSource2, 'F02');
  end;
end;

procedure TFM_1080.Table2BeforePost(DataSet: TDataSet);
begin
  QryExec(Qry1,'select F02 from T1080A where F02='''+datetimetostr(Table2F02.AsDatetime)+'''and AutoNo='''+Table1AutoNo.AsString+'''');
  if Qry1.RecordCount > 0 then
  begin
    if BEdate=Table2F02.AsDateTime Then Exit;
    R_OKMessage(['日期重复,请重新输入']);
    Abort;
  end;
  if Table2F02.AsString = '' then
  begin
    R_OKMessage(['请输入定价日期']);
    Abort;
  end;
  if Table2F03.AsString = '' then
  begin
    R_OKMessage(['请输入单价']);
    Abort;
  end;
  inherited;
  //把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
end;


procedure TFM_1080.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
   InforDisplay(DataSet,'成品基本资料明细档');
 // Main.StatusBar2.Panels[1].Text := AlterRecord(Table2Buser,Table2Btime,Table2Euser,Table2Etime);
end;

procedure TFM_1080.Table1BeforePost(DataSet: TDataSet);
var
  sSQL : String;
begin
  CheckFieldVal(DataSet);

  if not ((sCNo=Table1F10.AsString) and (sBEF01=Table1F01.AsString) and (sBEF02=Table1F02.AsString) and (sBEF03=Table1F03.AsString) and (sBEF04=Table1F04.AsString) and (sBEF05=Table1F05.AsString)) then
  begin
    sSQL := 'select * from T1080 where F01='''+Table1F01.AsString+''' and F02='''+Table1F02.AsString+''' and F03='''+Table1F03.AsString+''' and F10='''+Table1F10.AsString+'''' ;
    if Table1F04.AsString='' then
      sSQL := sSQL + ' and (F04 IS NULL or F04="")'
    else
      sSQL := sSQL + ' and F04='''+Table1F04.AsString+'''';

    if Table1F05.AsString='' then
      sSQL := sSQL + ' and (F05 IS NULL or F05="")'
    else
      sSQL := sSQL + ' and F05='''+Table1F05.AsString+'''';

    QryExec(Qry1,sSQL);
    if Qry1.RecordCount=1 then
    begin
      R_OKMessage(['不可输入<型号><品名><材质><规格><心孔>均相同的资料,'#13#13'请重新输入']);
      Abort;
    end;
  end;

  inherited;

  //把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);

  if Table1.State in [dsInsert] then
  begin
    // 自动编号
    QryExec(Qry1,'select Max(AutoNo) from T1080');
    Table1AutoNo.AsInteger := Qry1.Fields[0].AsInteger+1;
    // <可分配库存> := <库存量>
    Table1F12.AsFloat := Table1F06.AsFloat;
  end;
end;


procedure TFM_1080.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'成品基本资料主档');
  DBGrid1.Columns[6].ReadOnly := true;
end;


procedure TFM_1080.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Q_T1080.Close;
  DM.Q_T1080.Open;
  inherited;

end;

procedure TFM_1080.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  QryExec(Qry1,'delete T1080A Where AutoNo='+inttostr(Table1AutoNo.asinteger),false);
end;

procedure TFM_1080.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  // 取得各索引栏位值, 以为在 before post 时判断资料是否重复
  sCNo := Table1F10.AsString;
  sBEF01 := Table1F01.AsString;
  sBEF02 := Table1F02.AsString;
  sBEF03 := Table1F03.AsString;
  sBEF04 := Table1F04.AsString;
  sBEF05 := Table1F05.AsString;
end;


procedure TFM_1080.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  DBNavPlus1.DataSource := DataSource1;
end;

procedure TFM_1080.DBGrid2Enter(Sender: TObject);
begin
  inherited;
  DBNavPlus1.DataSource := DataSource2;
end;

procedure TFM_1080.Edit1Exit(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := Copy(trim(TEdit(Sender).Text),1,Table1.FieldByName('F0'+IntToStr(TEdit(Sender).Tag)).Size);
end;

procedure TFM_1080.Edit6Exit(Sender: TObject);
begin
  inherited;
  Edit6.Text := IntToStr(ValidInt(Edit6.text));
end;

procedure TFM_1080.RequiredValue(Sender: TField);
begin
  EValue_IsNotNull(Sender);
end;

procedure TFM_1080.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.Columns[6].ReadOnly := False;
end;

procedure TFM_1080.Table1AfterCancel(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.Columns[6].ReadOnly := true;
end;

procedure TFM_1080.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (not lInsBtn) and Query1F10.IsNull then abort;
end;

procedure TFM_1080.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  edtCName.Text := Query1F03.Text;
end;

procedure TFM_1080.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  BEDate := Table2F02.AsDateTime;
end;

procedure TFM_1080.SB3Click(Sender: TObject);
begin
  inherited;
  xSearch_Data(Table1,1,[1,2,3,4,5,6]);
end;

procedure TFM_1080.BitBtn2Click(Sender: TObject);
begin
  inherited;
   if Application.FindComponent('Rp_1080')=nil then
    Rp_1080 := TRp_1080.Create(self);
    Rp_1080.Preview;
end;

procedure TFM_1080.FormCreate(Sender: TObject);
begin
  inherited;
  QryExec(Qry1,'select F06 from TUserRight where K_SN =''成品仓'' and NM='''+GlobalUser+'''');
   if Qry1.Fields[0].AsBoolean then
    DBGrid2.Visible := true
   else
    DBGrid2.Visible := false;
end;

end.
