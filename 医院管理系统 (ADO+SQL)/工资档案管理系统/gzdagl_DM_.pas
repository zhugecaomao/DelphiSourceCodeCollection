unit gzdagl_DM_;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMgzdagl = class(TDataModule)
    ADOCgzdagl: TADOConnection;
    ADOTdepartment: TADOTable;
    DSdepartment: TDataSource;
    ADOTemployee: TADOTable;
    DSemployee: TDataSource;
    ADOTgongzi: TADOTable;
    DSgongzi: TDataSource;
    ADOTgongziDSDesigner: TStringField;
    ADOTgongziDSDesigner2: TBCDField;
    ADOTgongziDSDesigner3: TBCDField;
    ADOTgongziDSDesigner4: TBCDField;
    ADOTgongziDSDesigner5: TBCDField;
    ADOTgongziDSDesigner6: TBCDField;
    ADOTgongziDSDesigner7: TBCDField;
    ADOTgongziDSDesigner8: TBCDField;
    ADOTbutie: TADOTable;
    DSbutie: TDataSource;
    ADOTbutieDSDesigner: TStringField;
    ADOTbutieDSDesigner2: TBCDField;
    ADOTbutieDSDesigner3: TBCDField;
    ADOTbutieDSDesigner4: TBCDField;
    ADOTbutieDSDesigner5: TBCDField;
    ADOTbutieDSDesigner6: TBCDField;
    ADOTbutieDSDesigner7: TBCDField;
    ADOTbutieDSDesigner8: TBCDField;
    ADOTbutieDSDesigner9: TBCDField;
    ADOTkouchu: TADOTable;
    DSkouchu: TDataSource;
    ADOTkouchuDSDesigner: TStringField;
    ADOTkouchuDSDesigner2: TBCDField;
    ADOTkouchuDSDesigner3: TBCDField;
    ADOTkouchuDSDesigner4: TBCDField;
    ADOTkouchuDSDesigner5: TBCDField;
    ADOTkouchuDSDesigner6: TBCDField;
    ADOQemployee: TADOQuery;
    DSQemployee: TDataSource;
    ADOTemployeeDSDesigner: TStringField;
    ADOTemployeeDSDesigner2: TStringField;
    ADOTemployeeDSDesigner3: TStringField;
    ADOTemployeeDSDesigner4: TStringField;
    ADOTemployeeDSDesigner5: TStringField;
    ADOTemployeeDSDesigner6: TBCDField;
    ADOTemployeeDSDesigner7: TStringField;
    ADOTemployeeDSDesigner8: TStringField;
    ADOTemployeeDSDesigner9: TDateTimeField;
    ADOTemployeeDSDesigner10: TStringField;
    ADOQgongzi: TADOQuery;
    DSQgongzi: TDataSource;
    ADOQbutie: TADOQuery;
    DSQbutie: TDataSource;
    ADOQsum_butie: TADOQuery;
    DSQsum_butie: TDataSource;
    ADOQsum_department: TADOQuery;
    DSQsum_department: TDataSource;
    ADOQsum_departmentDSDesigner: TStringField;
    ADOQsum_departmentDSDesigner2: TBCDField;
    ADOQsum_xingshui: TADOQuery;
    DSQsum_xingshui: TDataSource;
    ADOTdepartmentDSDesigner: TStringField;
    ADOTdepartmentDSDesigner2: TStringField;
    ADOTdepartmentDSDesigner3: TStringField;
    ADOTdepartmentDSDesigner4: TBCDField;
    procedure ADOTdepartmentAfterScroll(DataSet: TDataSet);
    procedure ADOTemployeeAfterScroll(DataSet: TDataSet);
    procedure ADOTgongziAfterScroll(DataSet: TDataSet);
    procedure ADOTbutieAfterScroll(DataSet: TDataSet);
    procedure ADOTkouchuAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMgzdagl: TDMgzdagl;

implementation

uses gzdagl_department_, gzdagl_employee_, gzdagl_gongzi_;

{$R *.dfm}

procedure TDMgzdagl.ADOTdepartmentAfterScroll(DataSet: TDataSet);
begin
form_department.Label5.Caption:=inttostr(dataset.RecNo)+'/'+inttostr(dataset.RecordCount);
end;

procedure TDMgzdagl.ADOTemployeeAfterScroll(DataSet: TDataSet);
begin
form_employee.Label11.Caption:=inttostr(dataset.RecNo)+'/'+inttostr(dataset.RecordCount);
end;

procedure TDMgzdagl.ADOTgongziAfterScroll(DataSet: TDataSet);
begin
Form_gongzi.Label8.Caption:=inttostr(dataset.recno)+'/'+inttostr(dataset.RecordCount);
end;

procedure TDMgzdagl.ADOTbutieAfterScroll(DataSet: TDataSet);
begin
form_gongzi.Label17.Caption:=inttostr(dataset.RecNo)+'/'+inttostr(dataset.RecordCount);
end;

procedure TDMgzdagl.ADOTkouchuAfterScroll(DataSet: TDataSet);
begin
form_gongzi.Label23.Caption:=inttostr(dataset.RecNo)+'/'+inttostr(dataset.RecordCount);
end;

end.
