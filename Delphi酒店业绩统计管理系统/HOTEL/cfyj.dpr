program cfyj;

uses
  FastMM4 in 'FastMM4.pas',
  FastMM4Messages in 'FastMM4Messages.pas',
  Forms,
  Controls,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9};


{$R *.res}
begin

  Application.Initialize;
  Application.Title := '厨房业绩统计系统——湘军情酒店';
  Application.CreateForm(TForm4, Form4);
//  Form4.show;
//  Form4.Refresh;
  Form4.ShowModal;
  if Form4.ModalResult=mrOk  then
  begin
  Form4.Free;
  Application.CreateForm(TForm1, Form1);
  Form1.Show;
 // Form1.Refresh;
  Form1.Update;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
  end;
  Form4.Free;
  Application.Terminate;
end.
