unit uFM_1090;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, ExtCtrls, Grids, DBGrids, Db, DBTables, Mask, ToolEdit,
  StdCtrls, Buttons, DBCtrls, DBNavPlus, Variants;

type
  TFM_1090 = class(TS_Form)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboEdit1: TComboEdit;
    Edit6: TEdit;
    Label7: TLabel;
    ComboEdit2: TComboEdit;
    Query1: TQuery;
    Query1F10: TStringField;
    Query1F03: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    Splitter2: TSplitter;
    Query2: TQuery;
    StringField2: TStringField;
    DataSource2: TDataSource;
    Query2F11: TStringField;
    Panel2: TPanel;
    DBNavPlus1: TDBNavPlus;
    Table1: TTable;
    Table1AutoNo: TIntegerField;
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F05: TStringField;
    Table1F06: TFloatField;
    Table1F08: TStringField;
    Table1F07: TFloatField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    Table1F10: TStringField;
    Table1F12: TFloatField;
    DataSource3: TDataSource;
    Query2F10: TStringField;
    Table1F11: TStringField;
    DBGrid3: TDBGrid;
    Qry1: TQuery;
    SB3: TSpeedButton;
    Button1: TSpeedButton;
    BitBtn2: TBitBtn;
    Table1F13: TFloatField;
    Label9: TLabel;
    Edit7: TEdit;
    Table1F14: TFloatField;
    procedure RequiredValue(Sender: TField);    
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure ComboEdit2ButtonClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
  private
    { Private declarations }
    lInsBtn: boolean;
    sCNo1,sCNo2,sBEF01,sBEF02,sBEF03,sBEF04,sBEF05:String;
  public
    { Public declarations }
  end;

var
  FM_1090: TFM_1090;

implementation

Uses utilities, uFunction, uDM, uDataBaseEValue, uRp_1090;

{$R *.DFM}

procedure TFM_1090.ComboEdit1ButtonClick(Sender: TObject);
var
  xS : TStringList;
begin
  inherited;
  xs := select_text('客户点选窗口','select F01 as 客户编号, F03 as 客户简称 from T1010 ','STK0311',[0],[]);
  if Assigned(xS) then
  try
    ComboEdit1.Text := xs.strings[0];
  finally
    xs.free;
  end;
end;

procedure TFM_1090.ComboEdit2ButtonClick(Sender: TObject);
var
  xS : TStringList;
begin
  inherited;
  xs := select_text('送料厂商点选窗口','select F01 as 送料厂商编号, F03 as 送料厂商简称 from T1011 ','STK0311',[0],[]);
  if Assigned(xS) then
  try
    ComboEdit2.Text := xs.strings[0];
  finally
    xs.free;
  end;

end;

procedure TFM_1090.Edit1Exit(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := Copy(trim(TEdit(Sender).Text),1,Table1.FieldByName('F0'+IntToStr(TEdit(Sender).Tag)).Size);
end;

procedure TFM_1090.Edit6Exit(Sender: TObject);
begin
  inherited;
  Edit6.Text := IntToStr(ValidInt(Edit6.text));
end;

procedure TFM_1090.RequiredValue(Sender: TField);
begin
  EValue_IsNotNull(Sender);
end;

procedure TFM_1090.Table1AfterCancel(DataSet: TDataSet);
begin
  inherited;
  DBGrid3.Columns[5].ReadOnly := true;
end;

procedure TFM_1090.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBGrid3.Columns[5].ReadOnly := true;
  InforDisplay(DataSet,'客户来料档');
end;

procedure TFM_1090.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGrid3.Columns[5].ReadOnly := False;
end;

procedure TFM_1090.Table1BeforePost(DataSet: TDataSet);
var
  sSQL : String;
begin
  CheckFieldVal(DataSet); // 检查必须输入的栏位

  if not((Table1.State=dsEdit) and (sCNo1=Table1F10.AsString) and (sCNo2=Table1F11.AsString) and
     (sBEF01=Table1F01.AsString) and (sBEF02=Table1F02.AsString) and (sBEF03=Table1F03.AsString) and (sBEF04=Table1F04.AsString) and (sBEF05=Table1F05.AsString)) then
  begin
    sSQL := 'select * from T1090 where F01="'+Table1F01.AsString+'" and F02="'+Table1F02.AsString+'" and F03="'+Table1F03.AsString+'" and F10="'+Table1F10.AsString+'" and F11="'+Table1F11.AsString+'" ';
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
    QryExec(Qry1,'select Max(AutoNo) from T1090');
    Table1AutoNo.AsInteger := Qry1.Fields[0].AsInteger+1;
    // <可分配库存> := <库存量>
    Table1F12.AsFloat := Table1F06.AsFloat;
    Table1F14.AsFloat := Table1F13.AsFloat;
  end;

end;

procedure TFM_1090.Table1CalcFields(DataSet: TDataSet);
begin
  inherited;
  //Table1CalF07.AsFloat := Table1F06.AsFloat * Table1F07.AsFloat;
end;

procedure TFM_1090.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (not lInsBtn) and (Query2F10.IsNull or Query2F11.IsNull) then abort;
end;

procedure TFM_1090.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  // 取得各索引栏位值, 以为在 before post 时判断资料是否重复
  sCNo1 := Table1F10.AsString;
  sCNo2 := Table1F11.AsString;
  sBEF01 := Table1F01.AsString;
  sBEF02 := Table1F02.AsString;
  sBEF03 := Table1F03.AsString;
  sBEF04 := Table1F04.AsString;
  sBEF05 := Table1F05.AsString;
end;

procedure TFM_1090.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'客户来料档');
  if Table1.State<>dsInsert then
  begin
    Edit1.Text := Table1F01.AsString;
    Edit2.Text := Table1F02.AsString;
    Edit3.Text := Table1F03.AsString;
    Edit4.Text := Table1F04.AsString;
    Edit5.Text := Table1F05.AsString;
    ComboEdit1.text := Table1F10.AsString;
    ComboEdit2.text := Table1F11.AsString;
  end;
end;

procedure TFM_1090.Button1Click(Sender: TObject);
var
  CNo1, CNo2, sF01, sF02, sF03, sF04, sF05: string;
begin
  inherited;
  Edit6.Text := IntToStr(ValidInt(Edit6.text));
  Edit7.Text := IntToStr(ValidInt(Edit7.text));
  if ComboEdit1.Text='' then begin R_OKMessage(['请输入客户编号']);ComboEdit1.SetFocus;Abort;end;
  if ComboEdit2.Text='' then begin R_OKMessage(['请输入来料客户编号']);ComboEdit2.SetFocus;Abort;end;
  if Edit1.Text='' then begin R_OKMessage(['型号不可为空']); Edit1.SetFocus;Abort; end;
  if Edit2.Text='' then begin R_OKMessage(['品名不可为空']); Edit2.SetFocus;Abort; end;
  if Edit3.Text='' then begin R_OKMessage(['材质不可为空']); Edit3.SetFocus;Abort; end;
  CNo1 := ComboEdit1.text;
  CNo2 := ComboEdit2.text;
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
  Table1F13.AsString := Edit7.Text;
  Table1F10.AsString := ComboEdit1.Text;
  Table1F11.AsString := ComboEdit2.Text;
  Try
    Table1.Post;
    if (CNo1 <> Query2F10.AsString) or (CNo2 <> Query2F11.AsString) then
    begin
      Query1.Close;
      Query1.Open;
      Query1.Locate('F10',CNo1,[]);
      Query2.Close;
      Query2.Open;
      Query2.Locate('F10;F11',VarArrayOf([CNo1,CNo2]),[]);
      Table1.FindKey([CNo1,CNo2,sF01,sF02,sF03,sF04,sF05]);
    end;
  except
    Table1.Cancel;
  end;
end;

procedure TFM_1090.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFM_1090.FormCreate(Sender: TObject);
begin
  inherited;
  Query1.Open;
  Query2.Open;
  Table1.Open;

  lInsBtn := false;  
end;

procedure TFM_1090.SB3Click(Sender: TObject);
begin
  inherited;
  xSearch_Data(Table1,1,[1,2,3,4,5,6]);
end;

procedure TFM_1090.BitBtn2Click(Sender: TObject);
begin
  inherited;
   if Application.FindComponent('Rp_1090')=nil then
    Rp_1090 := TRp_1090.Create(self);
    Rp_1090.Preview;
end;

procedure TFM_1090.Edit7Exit(Sender: TObject);
begin
  inherited;
  Edit7.Text := IntToStr(ValidInt(Edit7.text))
end;

end.
