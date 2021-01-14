unit Unittimetoserchvalues;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, frxClass;

type
  TF_KERENREPORT = class(TForm)
    tkerenreport: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_KERENREPORT: TF_KERENREPORT;

implementation
uses UDM;

{$R *.dfm}

end.
