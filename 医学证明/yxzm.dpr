program yxzm;
uses
  Forms,
  main in 'main.pas' {frmmain},
  shuju in 'shuju.pas' {frmdate: TDataModule},
  luru in 'luru.pas' {lurufrm},
  chaxun in 'chaxun.pas' {frmchaxun};
{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmdate, frmdate);
  Application.CreateForm(Tlurufrm, lurufrm);
  Application.CreateForm(Tfrmchaxun, frmchaxun);
  Application.Run;
end.
