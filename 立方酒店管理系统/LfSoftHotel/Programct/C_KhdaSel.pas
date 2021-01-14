unit C_KhdaSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TKhdaSelForm = class(TForm)
    Panel2: TPanel;
    lblTitle: TLabel;
    Image1: TImage;
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    Panel3: TPanel;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    Panel1: TPanel;
    dbgSelect: TDBGrid;
    qrySelect: TQuery;
    qrySelectD_KHBH: TStringField;
    qrySelectD_KHMC: TStringField;
    qrySelectD_FLBH: TStringField;
    qrySelectD_DWDZ: TStringField;
    qrySelectD_FR: TStringField;
    qrySelectD_LXDH: TStringField;
    qrySelectD_JDRQ: TDateField;
    qrySelectD_DM: TStringField;
    qrySelectD_FLMC: TStringField;
    dsSelect: TDataSource;
    procedure dsSelectDataChange(Sender: TObject; Field: TField);
    procedure dbgSelectDblClick(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
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

uses C_CtData;

{$R *.dfm}
function KhdaSel: string;
begin
  KhdaSelForm := TKhdaSelForm.Create(Application);
  try
    with KhdaSelForm do
    begin
      qrySelect.Open;
      ShowModal;
      if ModalResult = mrOk then
        Result := FKhbh
      else
        Result := '';
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
      if ModalResult = mrOk then
        Result := FKhbh+'|'+FKhmc
      else
        Result := '';
    end;
  finally
    KhdaSelForm.qrySelect.Close;
    KhdaSelForm.Free;
  end;
end;

procedure TKhdaSelForm.dsSelectDataChange(Sender: TObject; Field: TField);
begin
  FKhbh := qrySelectD_KHBH.Value;
  FKhmc := qrySelectD_KHMC.Value;
end;

procedure TKhdaSelForm.dbgSelectDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TKhdaSelForm.btnLocaClick(Sender: TObject);
var
  s : string;
begin
  inherited;
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

end.
