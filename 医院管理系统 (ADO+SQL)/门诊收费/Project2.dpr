program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {mzsf},
  Unit2 in 'Unit2.pas' {DMmzsf: TDataModule},
  Unit3 in 'Unit3.pas' {ypjgview},
  Unit4 in 'Unit4.pas' {mzsfbb};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmzsf, mzsf);
  Application.CreateForm(TDMmzsf, DMmzsf);
  Application.CreateForm(Typjgview, ypjgview);
  Application.CreateForm(Tmzsfbb, mzsfbb);
  Application.Run;
end.
