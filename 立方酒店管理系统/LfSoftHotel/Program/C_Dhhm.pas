unit C_Dhhm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBTables, Grids, DBGrids,
  DosMove;

type
  TDhhmForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnClose: TBitBtn;
    Label1: TLabel;
    qryDhhm: TQuery;
    dsDhhm: TDataSource;
    DBGrid1: TDBGrid;
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    DosMove1: TDosMove;
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DhhmForm: TDhhmForm;

procedure Dhhm;

implementation

{$R *.dfm}
procedure Dhhm;
begin
  DhhmForm := TDhhmForm.Create(Application);
  try
    with DhhmForm do
    begin
      qryDhhm.Open;
      ShowModal;
    end;
  finally
    DhhmForm.Free;
  end;
end;

procedure TDhhmForm.btnLocaClick(Sender: TObject);
var
  s : string;
begin
  if edtValue.Text = '' then
    s := 'select * from DHHM';
  if cmbOption.ItemIndex = 0 then
  begin
    s := 'select * from DHHM where D_DWMC like "%'+edtValue.Text+'%"';
  end;
  if cmbOption.ItemIndex = 1 then
  begin
    s := 'select * from DHHM where D_DHHM like "%'+edtValue.Text+'%"';
  end;
  qryDhhm.Close;
  qryDhhm.SQL.Clear;
  qryDhhm.SQL.Add(s);
  qryDhhm.Open;
end;

end.
