unit ProductInfoSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls, Menus, SUIPopupMenu,
  Mask, DBCtrlsEh, DBLookupEh;

type
  TProductInfoSel_frm = class(TBaseFrm)
    suiGroupBox1: TsuiGroupBox;
    DBGrid: TDBGridEh;
    DataSource1: TDataSource;
    Query: TADOQuery;
    suiImagePanel1: TsuiImagePanel;
    btnSel: TsuiButton;
    btnOK: TsuiButton;
    btnclose: TsuiButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtProductName: TEdit;
    txtSupplierID: TEdit;
    btnBrower: TsuiButton;
    albtnPrint: TsuiArrowButton;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    txtProductType: TDBLookupComboboxEh;
    procedure btnSelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProductInfoSel_frm: TProductInfoSel_frm;

implementation

uses DataModule, BasePage, ShipInfo, ClientInfo, ProductInfo;

{$R *.dfm}

procedure TProductInfoSel_frm.btnSelClick(Sender: TObject);
VAR sqlstr, whstr :string;
begin
  inherited;
  whstr :='';
  if txtProductName.Text <> '' then
  begin
    whstr :=whstr + ' and ProductName like ''' + txtProductName.Text + '%''';
  end;
  if txtProductType.Text <> '' then
  begin
    whstr :=whstr + ' and ProductType like ''' + txtProductType.Text + '%''';
  end;
  if txtSupplierID.Text <> '' then
  begin
    whstr :=whstr + ' and b.FactoryName like ''' + txtSupplierID.Text + '%''';
  end;
  sqlstr :='select ProductID, ProductName, ProductType, a.SupplierID, b.FactoryName as SupplierName from ProductInfo as a '+
        'left join(select FactoryID, FactoryName from FactoryInfo)b on a.SupplierID=b.FactoryID '+
        ' where 1=1 ' + whstr;
        //select ProductID, ProductName, ProductType, a.SupplierID, (select factoryname from factoryinfo where a.SupplierID=factoryinfo.factoryid) from [ProductInfo] as a

  Get_Query(Query, sqlstr);
  
end;

procedure TProductInfoSel_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TProductInfoSel_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  CLOSE();
end;

procedure TProductInfoSel_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
  if Query.Active then
  begin
     ProductInfo_frm.Query_ini(Query.FieldByName('ProductID').AsString);
  end;
end;

procedure TProductInfoSel_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  txtProductName.Clear;
  txtProductType.Clear;
  txtSupplierID.Clear;
  btnSel.Click;
end;

procedure TProductInfoSel_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

end.
