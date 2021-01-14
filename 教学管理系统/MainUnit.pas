unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, StdCtrls;

type
  TMainForm = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    CtrN1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    S1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    S2: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    A1: TMenuItem;
    N11: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    N12: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses UpdateStudentsUnit, UpdateTeachersUnit, UpdateCourseUnit,
  UpdateTeachingUnit, Numbers_QueryUnit, Names_QueryUnit,
  Special_QueryUnit, DecisionUnit, QReportUnit, PasswordUnit, AboutUnit,
  ComeInUnit, Obscure_QueryUnit;

{$R *.dfm}


procedure TMainForm.N1Click(Sender: TObject);
begin
  UpdateStudentsForm.Show;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  UpdateTeachersForm.Show;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  UpdateCourseForm.Show;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  UpdateTeachingForm.Show;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
  Numbers_QueryForm.Show;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  Names_QueryForm.Show;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  Special_QueryForm.Show;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  DecisionForm.Show;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
   QReportForm.Show;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
 PasswordForm.Show;
end;

procedure TMainForm.A1Click(Sender: TObject);
begin
  AboutForm.Show;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
 if   application.MessageBox('是否退出？','确认框',mb_OKCANCEL)=idOK then
 close
 else
 exit;
 ComeInForm.Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 label2.Caption:='计科院02(2)班 周晶晶';
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  Obscure_QueryForm.Show;
end;

end.
