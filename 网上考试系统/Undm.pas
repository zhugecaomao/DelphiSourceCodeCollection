unit Undm;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, MConnect;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    DSManerge1: TDataSource;
    DSStudent1: TDataSource;
    DSExam1: TDataSource;
    DSInformation1: TDataSource;
    DSStatus1: TDataSource;
    DSManerge: TADODataSet;
    DSManergeDSDesigner: TWideStringField;
    DSManergeDSDesigner2: TWideStringField;
    DSManergeDSDesigner3: TSmallintField;
    DSStudent: TADODataSet;
    DSExam: TADODataSet;
    DSInformation: TADODataSet;
    DSStatus: TADODataSet;
    DSStudentid: TAutoIncField;
    DSStudentDSDesigner: TWideStringField;
    DSStudentDSDesigner2: TWideStringField;
    DSStudentDSDesigner3: TWideStringField;
    DSStudentDSDesigner4: TWideStringField;
    DSStudentDSDesigner5: TWideStringField;
    DSStudentDSDesigner6: TSmallintField;
    DSStudentDSDesigner7: TDateTimeField;
    DSStudentDSDesigner8: TBlobField;
    DSStudentDSDesigner9: TIntegerField;
    DSExamDSDesigner: TSmallintField;
    DSExamDSDesigner2: TMemoField;
    DSExamA: TWideStringField;
    DSExamB: TWideStringField;
    DSExamC: TWideStringField;
    DSExamD: TWideStringField;
    DSExamE: TWideStringField;
    DSInformationid: TAutoIncField;
    DSInformationDSDesigner: TWideStringField;
    DSInformationDSDesigner2: TSmallintField;
    DSInformationDSDesigner3: TWideStringField;
    DSInformationDSDesigner4: TWideStringField;
    DSStatusDSDesigner: TSmallintField;
    DSStatusDSDesigner2: TWideStringField;
    DCOMConnection1: TDCOMConnection;
    CDSManerge: TClientDataSet;
    CDSStudent: TClientDataSet;
    CDSExam: TClientDataSet;
    CDSInformation: TClientDataSet;
    CDSStatus: TClientDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    CDSInformationid: TAutoIncField;
    CDSInformationCDSDesigner: TWideStringField;
    CDSInformationCDSDesigner2: TSmallintField;
    CDSInformationCDSDesigner3: TWideStringField;
    CDSInformationCDSDesigner4: TWideStringField;
    CDSInformationstatus: TStringField;
    CDSStudentid: TAutoIncField;
    CDSStudentCDSDesigner: TWideStringField;
    CDSStudentCDSDesigner2: TWideStringField;
    CDSStudentCDSDesigner3: TWideStringField;
    CDSStudentCDSDesigner4: TWideStringField;
    CDSStudentCDSDesigner5: TWideStringField;
    CDSStudentCDSDesigner6: TSmallintField;
    CDSStudentCDSDesigner7: TDateTimeField;
    CDSStudentCDSDesigner8: TBlobField;
    CDSStudentCDSDesigner9: TIntegerField;
    CDSStudentstatus: TStringField;
    DSStudentstatus: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
