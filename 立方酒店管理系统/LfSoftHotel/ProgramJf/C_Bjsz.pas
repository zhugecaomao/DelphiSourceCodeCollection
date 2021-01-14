unit C_Bjsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Grids, DBGrids, DB,
  DBTables, Mask, DBCtrls, DosMove;

type
  TBjszForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    tblHoliday: TTable;
    dsHoliday: TDataSource;
    tblHolidayHOLIDAY: TDateField;
    tblHolidayFTIME: TTimeField;
    tblHolidaySTIME: TTimeField;
    DBGrid1: TDBGrid;
    tblJfconfig: TTable;
    dsJfconfig: TDataSource;
    tblJfconfigMANAGE: TSmallintField;
    tblJfconfigSUNDAY: TBooleanField;
    tblJfconfigSTIME: TTimeField;
    tblJfconfigFTIME: TTimeField;
    tblJfconfigSHJF: TBooleanField;
    tblJfconfigSHPT: TBooleanField;
    tblJfconfigADDIFEE: TCurrencyField;
    tblJfconfigADDIFEE0: TCurrencyField;
    tblJfconfigXXTF: TCurrencyField;
    tblJfconfigSVC: TCurrencyField;
    tblJfconfigSVC0: TCurrencyField;
    tblJfconfigGJ: TCurrencyField;
    tblJfconfigGN: TCurrencyField;
    tblJfconfigNH: TCurrencyField;
    tblJfconfigWXF: TCurrencyField;
    tblJfconfigYZF: TCurrencyField;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DosMove1: TDosMove;
    TabSheet3: TTabSheet;
    tblJfconfigPASSWORD: TStringField;
    tblJfconfigSHFEE: TCurrencyField;
    tblJfconfigSHUNIT: TFloatField;
    tblJfconfigSHFEE0: TCurrencyField;
    tblJfconfigSHUNIT0: TFloatField;
    tblJfconfigNHFEE: TCurrencyField;
    tblJfconfigNHUNIT: TFloatField;
    tblJfconfigGNFEE: TCurrencyField;
    tblJfconfigGNUNIT: TFloatField;
    tblJfconfigGJFEE: TCurrencyField;
    tblJfconfigGJUNIT: TFloatField;
    tblJfconfigGATFEE: TCurrencyField;
    tblJfconfigGATUNIT: TFloatField;
    tblJfconfigGNFEEYH: TCurrencyField;
    tblJfconfigGNYHUNIT: TFloatField;
    tblJfconfigGJFEEYH: TCurrencyField;
    tblJfconfigGJYHUNIT: TFloatField;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BjszForm: TBjszForm;

procedure Bjsz;
procedure Klsz;

implementation

{$R *.dfm}

procedure Bjsz;
begin
  BjszForm := TBjszForm.Create(Application);
  try
    with BjszForm do
    begin
      tblHoliday.Open;
      tblJfconfig.Open;
      if tblJfconfig.IsEmpty then
        tblJfconfig.Insert
      else
        tblJfconfig.Edit;
      PageControl1.ActivePageIndex := 0;
      ShowModal;
    end;
  finally
    BjszForm.Free;
  end;
end;

procedure Klsz;
begin
  BjszForm := TBjszForm.Create(Application);
  try
    with BjszForm do
    begin
      tblHoliday.Open;
      tblJfconfig.Open;
      if tblJfconfig.IsEmpty then
        tblJfconfig.Insert
      else
        tblJfconfig.Edit;
      PageControl1.ActivePageIndex := 2;
      ShowModal;
    end;
  finally
    BjszForm.Free;
  end;
end;

procedure TBjszForm.btnCancClick(Sender: TObject);
begin
  tblJfconfig.Cancel;
end;

procedure TBjszForm.btnOKClick(Sender: TObject);
begin
  tblJfconfig.Post;
end;

end.
