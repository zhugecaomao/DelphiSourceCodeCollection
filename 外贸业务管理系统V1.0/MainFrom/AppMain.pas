unit AppMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, SUIForm, SUIMainMenu;

type
  TAppMain_frm = class(TForm)
    suiMainMenu1: TsuiMainMenu;
    suiMDIForm1: TsuiMDIForm;
    N1: TMenuItem;
    AD1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    MenuStockContract: TMenuItem;
    MenuDocuments: TMenuItem;
    MenuDocumentsFacture: TMenuItem;
    MenuDocumentsReporter: TMenuItem;
    N16: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure MenuStockContractClick(Sender: TObject);
    procedure MenuDocumentsFactureClick(Sender: TObject);
    procedure MenuDocumentsReporterClick(Sender: TObject);
    procedure N16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppMain_frm: TAppMain_frm;

implementation

uses CompanyInfo, FactoryInfo, ClientInfo, ShipInfo, DictInfo, ProductInfo,
  QuotedPrice, PersonMgr, SecurityGroup, ClientContract, ClientContract1,
  StockContract, DocumentsClause, DocumentsReporter;


{$R *.dfm}

procedure TAppMain_frm.N2Click(Sender: TObject);
begin
  application.CreateForm(TCompanyInfo_frm, CompanyInfo_frm);
  CompanyInfo_frm.ShowModal;
  CompanyInfo_frm.Free;
end;

procedure TAppMain_frm.N4Click(Sender: TObject);
begin
  application.CreateForm(TFactoryInfo_frm, FactoryInfo_frm);
  FactoryInfo_frm.ShowModal;
  FactoryInfo_frm.Free;

end;

procedure TAppMain_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : close();
    //VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TAppMain_frm.N5Click(Sender: TObject);
begin
  application.CreateForm(TClientInfo_frm, ClientInfo_frm);
  ClientInfo_frm.ShowModal;
  ClientInfo_frm.Free;

end;

procedure TAppMain_frm.N7Click(Sender: TObject);
begin
  application.CreateForm(TShipInfo_frm, ShipInfo_frm);
  ShipInfo_frm.ShowModal;
  ShipInfo_frm.Free;

end;

procedure TAppMain_frm.N8Click(Sender: TObject);
begin
  application.CreateForm(TDictInfo_frm, DictInfo_frm);
  DictInfo_frm.ShowModal;
  DictInfo_frm.Free;

end;

procedure TAppMain_frm.N11Click(Sender: TObject);
begin
  application.CreateForm(TProductInfo_frm, ProductInfo_frm);
  ProductInfo_frm.ShowModal;
  ProductInfo_frm.Free;

end;

procedure TAppMain_frm.N10Click(Sender: TObject);
begin
  application.CreateForm(TQuotedPrice_frm, QuotedPrice_frm);
  QuotedPrice_frm.ShowModal;
  QuotedPrice_frm.Free;

end;

procedure TAppMain_frm.N12Click(Sender: TObject);
begin
  frmPersonMgr.ShowModal;
end;

procedure TAppMain_frm.N13Click(Sender: TObject);
begin
  frmSecurityGroup.ShowModal;
end;

procedure TAppMain_frm.N14Click(Sender: TObject);
begin
  application.CreateForm(TClientContract_frm, ClientContract_frm);
  ClientContract_frm.ShowModal;
  ClientContract_frm.Free;

end;

procedure TAppMain_frm.N15Click(Sender: TObject);
begin
  application.CreateForm(TClientContract_frm1, ClientContract_frm1);
  ClientContract_frm1.ShowModal;
  ClientContract_frm1.Free;

end;

procedure TAppMain_frm.MenuStockContractClick(Sender: TObject);
begin
  application.CreateForm(TStockContract_frm, StockContract_frm);
  StockContract_frm.ShowModal;
  StockContract_frm.Free;

end;

procedure TAppMain_frm.MenuDocumentsFactureClick(Sender: TObject);
begin
  application.CreateForm(TDocumentsClause_frm, DocumentsClause_frm);
  DocumentsClause_frm.ShowModal;
  DocumentsClause_frm.Free;

end;

procedure TAppMain_frm.MenuDocumentsReporterClick(Sender: TObject);
begin
  application.CreateForm(TDocumentsReporter_Frm, DocumentsReporter_Frm);
  DocumentsReporter_Frm.ShowModal;
  DocumentsReporter_Frm.Free;

end;

procedure TAppMain_frm.N16Click(Sender: TObject);
begin
  {application.CreateForm(TTest_Frm, Test_Frm);
  Test_Frm.ShowModal;
  Test_Frm.Free;  }

end;

end.
