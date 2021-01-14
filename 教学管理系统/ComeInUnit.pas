unit ComeInUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TComeInForm = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ComeInForm: TComeInForm;

implementation

uses MainUnit,UpDateDataModuleUnit, QueryDataModuleUnit, Numbers_QueryUnit,
  Names_QueryUnit, Special_QueryUnit, UpdateStudentsUnit,
  UpdateTeachersUnit, UpdateTeachingUnit, UpdateCourseUnit, PasswordUnit,
  QReportUnit, DecisionUnit, AboutUnit, Obscure_QueryUnit;

{$R *.dfm}

procedure TComeInForm.Button1Click(Sender: TObject);
begin
  if(Edit1.Text='123')or(Edit1.Text=Memo1.Lines.Text) then
 begin
  Application.CreateForm(TMainForm,MainForm);
  Application.CreateForm(TUpDateDataModule,UpDateDataModule);
  Application.CreateForm(TQueryDataModule,QueryDataModule);
  Application.CreateForm(TNumbers_QueryForm,Numbers_QueryForm);
  Application.CreateForm(TNames_QueryForm,Names_QueryForm);
  Application.CreateForm(TSpecial_QueryForm,Special_QueryForm);
  Application.CreateForm(TObscure_QueryForm,Obscure_QueryForm);
  Application.CreateForm(TUpdateStudentsForm,UpDateStudentsForm);
  Application.CreateForm(TUpdateTeachersForm,UpDateTeachersForm);
  Application.CreateForm(TUpdateTeachingForm,UpDateTeachingForm);
  Application.CreateForm(TUpdateCourseForm,UpDateCourseForm);
  Application.CreateForm(TPasswordForm,PasswordForm);
  Application.CreateForm(TQReportForm,QReportForm);
  Application.CreateForm(TDecisionForm,DecisionForm);
  Application.CreateForm(TAboutForm,AboutForm);

  ComeInForm.Hide;
  MainForm.Show;
 end
 else begin
   ShowMessage('密码输入不正确!');
   ComeInForm.Close;
   end;
end;

procedure TComeInForm.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TComeInForm.FormCreate(Sender: TObject);
begin
   memo1.Lines.LoadFromFile(application.GetNamePath+'aaa.mia');
end;

end.
