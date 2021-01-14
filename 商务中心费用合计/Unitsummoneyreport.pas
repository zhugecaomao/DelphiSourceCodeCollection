unit Unitsummoneyreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls, frxClass;

type
  TF_summoneyreport = class(TForm)
    t1: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_summoneyreport: TF_summoneyreport;

implementation
uses UDM;

{$R *.dfm}

end.
