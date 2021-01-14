unit ComTjfx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, ActnList, Menus, ComCtrls, DBCtrls, ToolWin, ExtCtrls, StdCtrls,
  Grids, DBGrids, TeeProcs, TeEngine, Chart, DBChart, QuickRpt, mconnect;

type
  TfrmComTjfx = class(TfrmComJbzl)
    labTj: TLabel;
    ToolButton1: TToolButton;
    btnFxt: TToolButton;
    aFxt: TAction;
    N3: TMenuItem;
    mnuFxt: TMenuItem;
    pnlFxt: TPanel;
    DBChart1: TDBChart;
    btnMx: TToolButton;
    aMx: TAction;
    N6: TMenuItem;
    pmnFxt: TMenuItem;
    pmnMx: TMenuItem;
    mnuMx: TMenuItem;
    procedure SetButton;override;
    procedure aFxtExecute(Sender: TObject);virtual;
    procedure FormShow(Sender: TObject);override;
    procedure aPreviewExecute(Sender: TObject);override;
    procedure aMxExecute(Sender: TObject);virtual;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComTjfx: TfrmComTjfx;

implementation

uses Filter, Dm;

{$R *.DFM}

{ TfrmComTjfx }

procedure TfrmComTjfx.SetButton;
begin
  inherited;
  aFxt.Enabled := aFxt.Tag = 0;
  aMx.Enabled := (aMx.Tag = 0) and not (dsJbzl.IsEmpty);
end;

procedure TfrmComTjfx.aFxtExecute(Sender: TObject);
begin
  aFxt.Checked := not aFxt.Checked;
  pnlFxt.Visible := aFxt.Checked;
end;

procedure TfrmComTjfx.FormShow(Sender: TObject);
begin
  inherited;
  with pnlFxt do
  begin
    Visible := aFxt.Checked;
    Align := alClient;
  end;
  DBChart1.Title.Text.Text := self.Caption;
  if labTj.Tag = 0 then
  begin
    labTj.Left := (Screen.Width - labTj.Width) div 2;
    if labTj.Left <= Label1.Left + Label1.Width then
      labTj.Left := Label1.Left + Label1.Width + 12;
  end;
end;

procedure TfrmComTjfx.aPreviewExecute(Sender: TObject);
begin
  if aFxt.Checked then
    DBChart1.Print
  else
    inherited;
end;

procedure TfrmComTjfx.aMxExecute(Sender: TObject);
begin
//
end;

end.
