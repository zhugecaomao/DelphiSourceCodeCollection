unit salebrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls,
  DB, Wwdatsrc, ADODB, wwDBGridEx;

type
  TfrmSaleBrow = class(TForm)
    panBill: TPanel;
    TreeView1: TTreeView;
    panTop: TPanel;
    FlatButton1: TFlatButton;
    qryFilter: TADOQuery;
    dsFilter: TwwDataSource;
    wwDBGridEx1: TwwDBGridEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaleBrow: TfrmSaleBrow;

implementation

{$R *.dfm}

end.
