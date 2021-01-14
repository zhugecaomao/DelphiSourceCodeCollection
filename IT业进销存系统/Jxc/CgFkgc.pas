unit CgFkgc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDj, ActnList, Menus, DBCtrls, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  Mask, Grids, DBGrids;

type
  TfrmCgFkgc = class(TfrmComDj)
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DBText1: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    labJEA: TLabel;
    labJEB: TLabel;
    pnlZt: TPanel;
    spZt: TShape;
    labZt: TLabel;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCgFkgc: TfrmCgFkgc;

implementation

uses Dm;

{$R *.DFM}

procedure TfrmCgFkgc.FormShow(Sender: TObject);
var
  dblJE: double;
begin
  inherited;
  pnlZt.Visible := False;
  labJEA.Caption := '0.00';
  labJEB.Caption := '0.00';
  if dsZb.FieldByName('CGLX').AsInteger = 1 then
  begin
    spZt.Pen.Color := clBlue;
    labZt.Font.Color := spZt.Pen.Color;
    labZt.Caption := 'ÏÖ¿î²É¹º';
    pnlZt.Visible := True;
  end
  else
  begin
    dblJE := 0;
    with dsMx do
    begin
      First;
      while not Eof do
      begin
        dblJE := dblJE + FieldByName('BCJE').AsFloat;
        Next;
      end;
      First;
    end;
    labJEA.Caption := FormatFloat('#,0.00', dblJE);
    labJEB.Caption := FormatFloat('#,0.00', dsZb.FieldByName('JE').AsFloat - dblJE);
    pnlZt.Visible := dsZb.FieldByName('JE').AsFloat = dblJE;
  end;
end;

end.
