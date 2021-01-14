unit C_Cswh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  DosMove;

type
  TCswhForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    tblJfconfig: TTable;
    dsJfconfig: TDataSource;
    tblJfconfigMANAGE: TSmallintField;
    tblJfconfigSUNDAY: TBooleanField;
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
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DosMove1: TDosMove;
    tblJfconfigSTIME: TTimeField;
    tblJfconfigFTIME: TTimeField;
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
    GroupBox1: TGroupBox;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit26: TDBEdit;
    Label33: TLabel;
    DBEdit25: TDBEdit;
    DBEdit27: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit28: TDBEdit;
    Label37: TLabel;
    DBEdit29: TDBEdit;
    Bevel1: TBevel;
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CswhForm: TCswhForm;

procedure Cswh;

implementation

{$R *.dfm}

procedure Cswh;
begin
  CswhForm := TCswhForm.Create(Application);
  try
    with CswhForm do
    begin
      tblJfconfig.Open;
      if tblJfconfig.IsEmpty then
        tblJfconfig.Insert
      else
        tblJfconfig.Edit;
      ShowModal;
    end;
  finally
    CswhForm.tblJfconfig.Close;
    CswhForm.Free;
  end;
end;

procedure TCswhForm.btnCancClick(Sender: TObject);
begin
  tblJfconfig.Cancel;
end;

procedure TCswhForm.btnOKClick(Sender: TObject);
begin
  tblJfconfig.Post;
end;

end.
