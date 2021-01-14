unit QueryDataModuleUnit;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TQueryDataModule = class(TDataModule)
    DSStudents: TDataSource;
    DSTeachers: TDataSource;
    DSCourse: TDataSource;
    DSSpecial: TDataSource;
    StudentsQuery: TQuery;
    TeachersQuery: TQuery;
    CourseQuery: TQuery;
    SpecialQuery: TQuery;
    StudentsQuerySNo: TStringField;
    StudentsQueryName: TStringField;
    StudentsQuerySex: TStringField;
    StudentsQueryAge: TSmallintField;
    StudentsQueryEntrance: TDateField;
    TeachersQueryTNo: TStringField;
    TeachersQueryName: TStringField;
    TeachersQuerySex: TStringField;
    TeachersQueryAge: TSmallintField;
    TeachersQueryAddress: TStringField;
    CourseQueryCNo: TStringField;
    CourseQueryCName: TStringField;
    CourseQueryTCTime: TSmallintField;
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryDataModule: TQueryDataModule;

implementation

{$R *.dfm}

end.
