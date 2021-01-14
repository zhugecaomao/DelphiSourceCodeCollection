unit Undm;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDataModule2 = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    CDSInformation: TClientDataSet;
    CDSInformationid: TAutoIncField;
    CDSInformationCDSDesigner: TWideStringField;
    CDSInformationCDSDesigner2: TSmallintField;
    CDSInformationCDSDesigner3: TWideStringField;
    CDSInformationCDSDesigner4: TWideStringField;
    CDSExam: TClientDataSet;
    CDSStudent: TClientDataSet;
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
    CDSKaoshi: TClientDataSet;
    CDSExamCDSDesigner: TSmallintField;
    CDSExamCDSDesigner2: TMemoField;
    CDSExamA: TWideStringField;
    CDSExamB: TWideStringField;
    CDSExamC: TWideStringField;
    CDSExamD: TWideStringField;
    CDSExamE: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

end.
