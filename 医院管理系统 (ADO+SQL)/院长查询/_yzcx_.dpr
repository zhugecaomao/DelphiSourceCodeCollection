program _yzcx_;

uses
  Forms,
  yzcx_ in 'yzcx_.pas' {yzcx},
  bqcxtj_ in 'bqcxtj_.pas' {bqcxtj},
  DMyzcx_ in 'DMyzcx_.pas' {DMyzcx: TDataModule},
  zfcxtj_ in 'zfcxtj_.pas' {zfcxtj},
  sscxtj_ in 'sscxtj_.pas' {sscxtj};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tyzcx, yzcx);
  Application.CreateForm(Tsscxtj, sscxtj);
  Application.CreateForm(Tzfcxtj, zfcxtj);
  Application.CreateForm(Tbqcxtj, bqcxtj);
  Application.CreateForm(TDMyzcx, DMyzcx);
  Application.Run;
end.
