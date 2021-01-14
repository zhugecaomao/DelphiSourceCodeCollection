unit C_Flwh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, DBTables, Grids,
  DBGrids, DosMove;

type
  TFlwhForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    btnBack: TBitBtn;
    tblFare: TTable;
    dbgFare: TDBGrid;
    dsFare: TDataSource;
    tblFareCODE: TStringField;
    tblFarePLACE: TStringField;
    tblFareUNIT: TCurrencyField;
    tblFareABBR: TStringField;
    DosMove1: TDosMove;
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    tblShfare: TTable;
    dbgShfare: TDBGrid;
    dsShfare: TDataSource;
    tblShfarePLACE: TStringField;
    tblShfareCODE: TStringField;
    tblShfareUNIT: TCurrencyField;
    tblShfarePRICE: TFloatField;
    tblShfareJFYN: TBooleanField;
    tblShfareNHYN: TBooleanField;
    dsSigcode: TDataSource;
    tblSigcode: TTable;
    dbgSigcode: TDBGrid;
    tblSigcodeCLASS: TStringField;
    tblSigcodeCLASSNAME: TStringField;
    tblSigcodeROOM: TStringField;
    tblSigcodeJFYN: TBooleanField;
    tblSigcodeTOTAL: TCurrencyField;
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlwhForm: TFlwhForm;

procedure Flwh;

implementation

{$R *.dfm}

procedure Flwh;
begin
  FlwhForm := TFlwhForm.Create(Application);
  try
    with FlwhForm do
    begin
      PageControl1.ActivePageIndex := 0;
      tblFare.Open;
      tblShfare.Open;
      tblSigCode.Open;
      ShowModal;
    end;
  finally
    FlwhForm.tblFare.Close;
    FlwhForm.tblShfare.Close;
    FlwhForm.tblSigcode.Close;
    FlwhForm.Free;
  end;
end;

procedure TFlwhForm.btnLocaClick(Sender: TObject);
begin
  if cmbOption.ItemIndex=0 then
  begin
    if PageControl1.ActivePageIndex=0 then
      tblFare.Locate('PLACE',edtValue.Text,[]);
    if PageControl1.ActivePageIndex=1 then
      tblShFare.Locate('PLACE',edtValue.Text,[]);
  end;
  if cmbOption.ItemIndex=1 then
  begin
    if PageControl1.ActivePageIndex=0 then
      tblFare.Locate('CODE',edtValue.Text,[]);
    if PageControl1.ActivePageIndex=1 then
      tblShFare.Locate('CODE',edtValue.Text,[]);
  end;
end;

end.
