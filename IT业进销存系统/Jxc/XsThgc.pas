unit XsThgc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, ActnList, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  Mask, Grids, DBGrids;

type
  TfrmXsThgc = class(TfrmComDj)
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBText1: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    labJEA: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    labJEB: TLabel;
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmXsThgc: TfrmXsThgc;

implementation

uses Dm;

{$R *.DFM}

procedure TfrmXsThgc.FormShow(Sender: TObject);
var
  dblJE: double;
begin
  inherited;
  labJEA.Caption := '0.00';
  labJEB.Caption := '0.00';
  dblJE := 0;
  with dsMx do
  begin
    First;
    while not Eof do
    begin
      dblJE := dblJE + FieldByName('JE').AsFloat;
      Next;
    end;
    First;
  end;
  labJEA.Caption := FormatFloat('#,0.00', dblJE);
  labJEB.Caption := FormatFloat('#,0.00', dsZb.FieldByName('JE').AsFloat - dblJE);
end;

end.
