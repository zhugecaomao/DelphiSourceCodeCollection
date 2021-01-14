unit uFM_1070;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Buttons, StdCtrls, Mask, DBCtrls, Db, DBTables, Grids, DBGrids,
  DBVrtNav, ExtCtrls, DBNavPlus;

type
  TFM_1070 = class(TS_Form)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
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
    Table1F12: TFloatField;
    Edit6: TEdit;
    Label6: TLabel;
    DBNavPlus1: TDBNavPlus;
    SB3: TSpeedButton;
    Button1: TSpeedButton;
    BitBtn2: TBitBtn;
    procedure RequiredValue(Sender: TField);    
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_1070: TFM_1070;
  sBEF01,sBEF02,sBEF03,sBEF04,sBEF05:String;

implementation
Uses utilities, uFunction, uDM, uDataBaseEValue, uRp_1070;

{$R *.DFM}

procedure TFM_1070.Button1Click(Sender: TObject);
begin
  inherited;
  Edit6.Text := IntToStr(ValidInt(Edit6.text));
  if Edit1.Text='' then begin R_OKMessage(['型号不可为空']); Edit1.SetFocus; Abort; end;
  if Edit2.Text='' then begin R_OKMessage(['品名不可为空']); Edit2.SetFocus; Abort; end;
  if Edit3.Text='' then begin R_OKMessage(['材质不可为空']); Edit3.SetFocus; Abort; end;

  Table1.Insert;
  Table1F01.AsString := Edit1.Text;
  Table1F02.AsString := Edit2.Text;
  Table1F03.AsString := Edit3.Text;
  Table1F04.AsString := Edit4.Text;
  Table1F05.AsString := Edit5.Text;
  Table1F06.AsString := Edit6.text;
  Try
    Table1.Post;
  except
    Table1.Cancel;
  end;
end;

procedure TFM_1070.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  //给Edit赋初值
  if Table1.RecordCount = 0 then
    for i := 0 to Panel1.ControlCount - 1 do
    begin
      if (Panel1.Controls[i] is TEdit) then
        TEdit(Panel1.Controls[i]).text := '';
    end
  else
  begin
    Edit1.Text := Table1F01.AsString;
    Edit2.Text := Table1F02.AsString;
    Edit3.Text := Table1F03.AsString;
    Edit4.Text := Table1F04.AsString;
    Edit5.Text := Table1F05.AsString;
    Edit6.Text := Table1F06.AsString;
  end;
end;

procedure TFM_1070.Table1CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table1CalF07.AsFloat := Table1F06.AsFloat * Table1F07.AsFloat;
end;

procedure TFM_1070.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'半成品基本资料');

  if Table1.State<>dsInsert then
  begin
    Edit1.Text := Table1F01.AsString;
    Edit2.Text := Table1F02.AsString;
    Edit3.Text := Table1F03.AsString;
    Edit4.Text := Table1F04.AsString;
    Edit5.Text := Table1F05.AsString;
    Edit6.Text := Table1F06.AsString;
  end;
end;

procedure TFM_1070.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFM_1070.Table1BeforePost(DataSet: TDataSet);
VAR
  s:string;
begin
  CheckFieldVal(DataSet);

  if not((sBEF01=Table1F01.AsString) and (sBEF02=Table1F02.AsString) and (sBEF03=Table1F03.AsString) and (sBEF04=Table1F04.AsString) and (sBEF05=Table1F05.AsString)) then
  begin
    s := 'select * from T1070 where F01='''+Table1F01.AsString+''' and F02='''+Table1F02.AsString+''' and F03='''+Table1F03.AsString+'''';
    if Table1F04.AsString = '' then
      s := s + '  and (F04 is null or F04="")'
    else
      s := s+' and F04=''' +Table1F04.AsString+'''';

    if Table1F05.AsString = '' then
      s := s + '  and (F05 is null or F05="")'
    else
      s := s+' and F05=''' +Table1F05.AsString+'''';

    QryExec(Qry1,s);
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
    QryExec(Qry1,'select Max(AutoNo) from T1070');
    Table1AutoNo.AsInteger := Qry1.Fields[0].AsInteger+1;
    // <可分配库存> := <库存量>
    Table1F12.AsFloat := Table1F06.AsFloat;
  end;

end;

procedure TFM_1070.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'半成品基本资料');
  DBGrid1.Columns[5].ReadOnly := True;  
end;

procedure TFM_1070.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Q_T1070.Close;
  DM.Q_T1070.Open;
  inherited;
end;

procedure TFM_1070.Table1BeforeEdit(DataSet: TDataSet);
begin
  sBEF01 := Table1F01.AsString;
  sBEF02 := Table1F02.AsString;
  sBEF03 := Table1F03.AsString;
  sBEF04 := Table1F04.AsString;
  sBEF05 := Table1F05.AsString;
  inherited;
end;

procedure TFM_1070.RequiredValue(Sender: TField);
begin
  EValue_IsNotNull(Sender);
end;

procedure TFM_1070.Edit1Exit(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := Copy(trim(TEdit(Sender).Text),1,Table1.FieldByName('F0'+IntToStr(TEdit(Sender).Tag)).Size);
end;

procedure TFM_1070.Edit6Exit(Sender: TObject);
begin
  inherited;
  Edit6.Text := IntToStr(ValidInt(Edit6.text));
end;

procedure TFM_1070.Table1AfterCancel(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.Columns[5].ReadOnly := True;
end;

procedure TFM_1070.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.Columns[5].ReadOnly := False;
end;

procedure TFM_1070.SB3Click(Sender: TObject);
begin
  inherited;
  xSearch_Data(Table1,1,[1,2,3,4,5,6]);
end;

procedure TFM_1070.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_1070')=nil then
   Rp_1070 := TRp_1070.Create(self);
   Rp_1070.Preview;
end;

end.
