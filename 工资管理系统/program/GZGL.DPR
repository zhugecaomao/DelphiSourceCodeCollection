program gzgl;

uses
  Forms,
  gzglxt in 'GZGLXT.PAS' {Form1},
  Dataa in 'Dataa.pas' {Data3: TDataModule},
  mp in 'mp.pas' {Form41},
  gzffglxt in 'gzffglxt.pas' {Form83},
  gzmxbb in 'gzmxbb.pas' {Form85},
  gztzglxt in 'gztzglxt.pas' {Form84},
  xtdl3 in 'xtdl3.pas' {Formb},
  ygfdgzgl in 'ygfdgzgl.pas' {Form82},
  ygjbgzgl in 'ygjbgzgl.pas' {Form81},
  rytj in 'rytj.pas' {Form2},
  rysc in 'rysc.pas' {Form3},
  tjyusc in 'tjyusc.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TData3, Data3);
  Application.Run;
end.
