unit StockContractAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls, Menus, SUIPopupMenu,
  Mask, DBCtrlsEh, DBLookupEh, ComCtrls, SUIStatusBar;

type
  TStockContractAdd_frm = class(TBaseFrm)
    suiGroupBox1: TsuiGroupBox;
    DBGrid: TDBGridEh;
    DataSource1: TDataSource;
    Query: TADOQuery;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtProductName: TEdit;
    txtSupplierID: TEdit;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    txtProductType: TDBLookupComboboxEh;
    PopupMenu2: TsuiPopupMenu;
    MenuItem1: TMenuItem;
    suiStatusBar1: TsuiStatusBar;
    btnSel: TsuiButton;
    btnOK: TsuiButton;
    btnclose: TsuiButton;
    procedure btnSelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
     Flag:string;  //'1'时,插入指定行. 否则往最后一行插入记录
     ProductID:string;
  end;

var
  StockContractAdd_frm: TStockContractAdd_frm;

implementation

uses DataModule, BasePage, ShipInfo, ClientInfo, ProductInfo, ClientContract,
  StockContract;

{$R *.dfm}

procedure TStockContractAdd_frm.btnSelClick(Sender: TObject);
VAR sqlstr, whstr :string;
begin
  inherited;
  whstr :='';
  if ProductID <>'' then
  begin
    whstr :=whstr + ' and ProductID=''' + ProductID + '''';    
  end;
  
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

procedure TStockContractAdd_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  DBGrid.OnDblClick(nil);
end;

procedure TStockContractAdd_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  CLOSE();
end;

procedure TStockContractAdd_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
end;

procedure TStockContractAdd_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  txtProductName.Clear;
  txtProductType.Clear;
  txtSupplierID.Clear;
  btnSel.Click;
end;

procedure TStockContractAdd_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TStockContractAdd_frm.DBGridDblClick(Sender: TObject);
begin
  inherited;
//
  if Query.Active then
  begin
     if Flag ='1' then
     begin
        StockContract_frm.Update_ProductDetail(Query.FieldByName('ProductID').AsString, '');
        close();
     end
     else    
     begin
       // with ClientContract_frm.StrGrid do
        begin
          StockContract_frm.Insert_ProductDetail(Query.FieldByName('ProductID').AsString, '');
          //if (Cells[2, RowCount-1] <>'') then
          //begin
          //   RowCount :=RowCount +1;
          //end;
        end;
     end;
  end;
  DBGrid.SetFocus();
end;

procedure TStockContractAdd_frm.MenuItem1Click(Sender: TObject);
begin
  inherited;
//产品详细信息.
end;

procedure TStockContractAdd_frm.DBGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_RETURN  : DBGrid.OnDblClick(nil);
    //VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

end.
