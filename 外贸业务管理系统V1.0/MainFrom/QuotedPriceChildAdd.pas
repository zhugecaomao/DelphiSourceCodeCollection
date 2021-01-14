unit QuotedPriceChildAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls, Menus, SUIPopupMenu,
  Mask, DBCtrlsEh, DBLookupEh, ComCtrls, SUIStatusBar;

type
  TQuotedPriceChildAdd_frm = class(TBaseFrm)
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
    PopupMenu2: TsuiPopupMenu;
    MenuItem1: TMenuItem;
    suiStatusBar1: TsuiStatusBar;
    procedure btnSelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
     Flag:string;  //'1'时,插入指定行. 否则往最后一行插入记录
     ProductID:string;
  end;

var
  QuotedPriceChildAdd_frm: TQuotedPriceChildAdd_frm;

implementation

uses DataModule, BasePage, ShipInfo, ClientInfo, ProductInfo, QuotedPrice;

{$R *.dfm}

procedure TQuotedPriceChildAdd_frm.btnSelClick(Sender: TObject);
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

procedure TQuotedPriceChildAdd_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TQuotedPriceChildAdd_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  CLOSE();
end;

procedure TQuotedPriceChildAdd_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
end;

procedure TQuotedPriceChildAdd_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  txtProductName.Clear;
  txtProductType.Clear;
  txtSupplierID.Clear;
  btnSel.Click;
end;

procedure TQuotedPriceChildAdd_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TQuotedPriceChildAdd_frm.DBGridDblClick(Sender: TObject);
begin
  inherited;
//
  if Query.Active then
  begin
     if Flag ='1' then
     begin
        QuotedPrice_frm.Update_QuotedPriceChild(Query.FieldByName('ProductID').AsString, QuotedPrice_frm.Query_QuotedPrice.FieldByName('QuotedID').AsString);
        close();
     end
     else    
     begin
       // with QuotedPrice_frm.StrGrid do
        begin
          QuotedPrice_frm.Insert_QuotedPriceChild(Query.FieldByName('ProductID').AsString, QuotedPrice_frm.Query_QuotedPrice.FieldByName('QuotedID').AsString);
          //if (Cells[2, RowCount-1] <>'') then
          //begin
          //   RowCount :=RowCount +1;
          //end;
        end;
     end;
  end;

end;

procedure TQuotedPriceChildAdd_frm.MenuItem1Click(Sender: TObject);
begin
  inherited;
//产品详细信息.
end;

end.
