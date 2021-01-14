unit Special_QueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls;

type
  TSpecial_QueryForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Special_QueryForm: TSpecial_QueryForm;

implementation

uses QueryDataModuleUnit;

{$R *.dfm}

procedure TSpecial_QueryForm.Button1Click(Sender: TObject);
begin
  with  QueryDataModule.SpecialQuery  do
 begin
   Close;
   SQL.Clear ;
   SQL.Add('SELECT Teacher.Name,Teaching.Grade,Student.Name');
   SQL.Add('FROM "Student.db" Student');
   SQL.Add('INNER JOIN "Teaching.db"  Teaching');
   SQL.Add('ON (Teaching.SNo=Student.SNo)');
   SQL.Add('INNER JOIN "Teacher.DB"  Teacher');
   SQL.Add('ON (Teacher.TNo=Teaching.TNo)');
   SQL.Add('WHERE  Teacher.Name=:gg');
   ParamByName('gg').AsString:=Edit1.Text ;
   Prepare;
   Open;
 end;

end;

procedure TSpecial_QueryForm.Button2Click(Sender: TObject);
begin
 close;
end;

end.
