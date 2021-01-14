unit UpDateDataModuleUnit;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TUpDateDataModule = class(TDataModule)
    TeachersTable: TTable;
    StudentsTable: TTable;
    CourseTable: TTable;
    TeachingTable: TTable;
    TeacherDataSource: TDataSource;
    StudentDataSource: TDataSource;
    CourseDataSource: TDataSource;
    TeachingDataSource: TDataSource;
    TeachersTableTNo: TStringField;
    TeachersTableName: TStringField;
    TeachersTableSex: TStringField;
    TeachersTableAge: TSmallintField;
    TeachersTableAddress: TStringField;
    CourseTableCNo: TStringField;
    CourseTableCName: TStringField;
    CourseTableTCTime: TSmallintField;
    StudentsTableSNo: TStringField;
    StudentsTableName: TStringField;
    StudentsTableSex: TStringField;
    StudentsTableAge: TSmallintField;
    StudentsTableEntrance: TDateField;
    TeachingTableCNo: TStringField;
    TeachingTableTNo: TStringField;
    TeachingTableSNo: TStringField;
    TeachingTableGrade: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpDateDataModule: TUpDateDataModule;

implementation

{$R *.dfm}


end.
