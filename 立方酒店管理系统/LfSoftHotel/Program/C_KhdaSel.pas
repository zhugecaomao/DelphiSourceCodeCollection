unit C_KhdaSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Select, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, C_Define, DosMove;

type
  TKhdaSelForm = class(TSelectForm)
    qrySelectD_KHBH: TStringField;
    qrySelectD_KHMC: TStringField;
    qrySelectD_FLBH: TStringField;
    qrySelectD_DWDZ: TStringField;
    qrySelectD_FR: TStringField;
    qrySelectD_LXDH: TStringField;
    qrySelectD_JDRQ: TDateField;
    qrySelectD_DM: TStringField;
    qrySelectD_FLMC: TStringField;
    DosMove1: TDosMove;
    procedure btnLocaClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
  private
    { Private declarations }
    FKhbh: string;
    FKhmc: string;
  public
    { Public declarations }
  end;

var
  KhdaSelForm: TKhdaSelForm;

function KhdaSel: string;
function KhdaSel1: string;

implementation

uses C_HotelData;

{$R *.dfm}

function KhdaSel: string;
begin
  KhdaSelForm := TKhdaSelForm.Create(Application);
  try
    with KhdaSelForm do
    begin
      qrySelect.Open;
      ShowModal;
      Result := FKhbh;
    end;
  finally
    KhdaSelForm.qrySelect.Close;
    KhdaSelForm.Free;
  end;
end;

function KhdaSel1: string;
begin
  KhdaSelForm := TKhdaSelForm.Create(Application);
  try
    with KhdaSelForm do
    begin
      qrySelect.Open;
      ShowModal;
      Result := FKhbh+'|'+FKhmc
    end;
  finally
    KhdaSelForm.qrySelect.Close;
    KhdaSelForm.Free;
  end;
end;

procedure TKhdaSelForm.btnLocaClick(Sender: TObject);
var
  s : string;
begin
  {if cmbExpress.ItemIndex = 0 then
    if cmbOption.ItemIndex = 0 then
      qrySelect.Locate('D_KHMC',edtValue.Text,[])}

  case cmbOption.ItemIndex of
    0:
      s := 'select * from KHDA where D_KHBH like "%'+edtValue.Text+'%"';
    1:
      s := 'select * from KHDA where D_KHMC like "%'+edtValue.Text+'%"';
  end;
  with qrySelect do
  begin
    DisableControls;
    Close;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    Open;
    EnableControls;
  end;
end;

procedure TKhdaSelForm.btnOKClick(Sender: TObject);
begin
  FKhbh := qrySelectD_KHBH.Value;
  FKhmc := qrySelectD_KHMC.Value;
  Close;
end;

procedure TKhdaSelForm.btnCancClick(Sender: TObject);
begin
  FKhbh := '';
  FKhmc := '';
end;

end.
