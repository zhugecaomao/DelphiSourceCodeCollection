unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, QuickRpt, QRCtrls, RM_GridReport,
  RM_Common, RM_Preview, RM_Class, RM_Dataset;

type
  TForm10 = class(TForm)
    ADOTable1: TADOTable;
    RMDBDataSet1: TRMDBDataSet;
    RMReport1: TRMReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

end.
