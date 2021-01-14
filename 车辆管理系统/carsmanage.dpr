program carsmanage;

uses
  Forms,
  Unit1 in 'Unit1.pas' {mainform},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit7 in 'Unit7.pas' {Form7},
  Unita in 'Unita.pas' {AboutBox},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6_1},
  formquery1 in 'formquery1.pas' {form_query1},
  form21 in 'form21.pas' {form1_1},
  form31 in 'form31.pas' {form2_1},
  formquery2 in 'formquery2.pas' {form_query2},
  form41 in 'form41.pas' {Form4_1},
  formquery3 in 'formquery3.pas' {form_query3},
  form51 in 'form51.pas' {Form5_1},
  formquery4 in 'formquery4.pas' {Formquery_4},
  form62 in 'form62.pas' {form6_2},
  formquery5 in 'formquery5.pas' {formquery_5},
  form71 in 'form71.pas' {form7_1},
  formquery6 in 'formquery6.pas' {formquery_6},
  unitkey in 'unitkey.pas' {formkey},
  unitkey2 in 'unitkey2.pas' {formkey2},
  report in 'report.pas' {reportform},
  unitsplash in 'unitsplash.pas' {splash};

{$R *.res}

begin
  Application.Initialize;
  splash:=tsplash.Create(application);
  splash.show;
  splash.Update;
  Application.CreateForm(Tmainform, mainform);
  splash.free;
  Application.Run;

end.
