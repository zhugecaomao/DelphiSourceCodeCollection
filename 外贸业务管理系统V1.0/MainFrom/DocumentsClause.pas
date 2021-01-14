unit DocumentsClause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ComCtrls, SUIStatusBar, SUIPageControl, SUITabControl,
  ExtCtrls, SUIForm, StdCtrls, Mask, DBCtrlsEh, SUIImagePanel, SUIGroupBox,
  GridsEh, DBGridEh, DBLookupEh, SUIButton, MemTableDataEh, Db, ADODB,
  DataDriverEh, MemTableEh, Menus, SUIPopupMenu, DBCtrls;

type
  TDocumentsClause_frm = class(TBaseFrm)
    PageContract: TsuiPageControl;
    Tab_Brower: TsuiTabSheet;
    Tab_Edit: TsuiTabSheet;
    suiStatusBar1: TsuiStatusBar;
    PageProductDetail: TsuiPageControl;
    TabSStock: TsuiTabSheet;
    suiTabSheet2: TsuiTabSheet;
    dsd_ContractChild: TDataSetDriverEh;
    q_ProductInfo: TADOQuery;
    suiGroupBox2: TsuiGroupBox;
    SGrid: TDBGridEh;
    suiPanel1: TsuiPanel;
    SGridChild: TDBGridEh;
    suiImagePanel4: TsuiImagePanel;
    btnAdd: TsuiButton;
    btnDelete: TsuiButton;
    btnSave: TsuiButton;
    btnBrower: TsuiButton;
    btnClose: TsuiButton;
    suiArrowButton1: TsuiArrowButton;
    btnNew: TsuiButton;
    MT_Contract: TADOTable;
    T_ContractChild: TADOTable;
    ds_Contract: TDataSource;
    mt_ContractChild: TMemTableEh;
    ds_ContractChild: TDataSource;
    txtContractID: TEdit;
    txtClientID: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    txtClientName: TEdit;
    btnClientSelect: TsuiButton;
    mt_ContractChildCID: TAutoIncField;
    mt_ContractChildProductID: TWideStringField;
    mt_ContractChildProductID_1: TWideStringField;
    mt_ContractChildQuantity: TFloatField;
    mt_ContractChildPrice: TBCDField;
    mt_ContractChildAmount: TBCDField;
    ds_ProductInfo: TDataSource;
    mt_ContractChildProductName: TStringField;
    mt_ContractChildPUnit: TStringField;
    Query: TADOQuery;
    mt_ContractChildProductEnName: TStringField;
    dsd_Contract: TDataSetDriverEh;
    q_Client: TADOQuery;
    ds_Client: TDataSource;
    bntSel: TsuiButton;
    Label21: TLabel;
    Label22: TLabel;
    txtSignDate1: TMaskEdit;
    txtSignDate2: TMaskEdit;
    btnClear: TsuiButton;
    Pop_DBGrid: TsuiPopupMenu;
    N1: TMenuItem;
    Pop_DBGridChild: TsuiPopupMenu;
    MenuItem1: TMenuItem;
    mt_ContractChildID: TIntegerField;
    Pop_GridChild: TsuiPopupMenu;
    MenuItem2: TMenuItem;
    suiTabSheet3: TsuiTabSheet;
    mt_Contract1: TMemTableEh;
    PopuNew: TsuiPopupMenu;
    ABtnNew: TsuiArrowButton;
    MenuQuotedPrice: TMenuItem;
    MenuClientContract: TMenuItem;
    Splitter1: TSplitter;
    N2: TMenuItem;
    suiTabSheet1: TsuiTabSheet;
    suiGroupBox1: TsuiGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label10: TLabel;
    dbClient: TDBEditEh;
    btnClientContrat: TsuiButton;
    Label7: TLabel;
    DBComboBoxEh2: TDBComboBoxEh;
    Label9: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ds_Port1: TDataSource;
    Query_Port1: TADOQuery;
    ds_Port2: TDataSource;
    Query_Port2: TADOQuery;
    suiGroupBox3: TsuiGroupBox;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEditEh2: TDBEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBDateTimeEditEh4: TDBDateTimeEditEh;
    DBComboBoxEh3: TDBComboBoxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    suiGroupBox4: TsuiGroupBox;
    Label16: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    Label25: TLabel;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    Label26: TLabel;
    DBComboBoxEh5: TDBComboBoxEh;
    Label27: TLabel;
    DBEditEh5: TDBEditEh;
    Label28: TLabel;
    DBEditEh6: TDBEditEh;
    Label29: TLabel;
    DBComboBoxEh6: TDBComboBoxEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DBMemo5: TDBMemo;
    Label34: TLabel;
    suiGroupBox5: TsuiGroupBox;
    suiGroupBox6: TsuiGroupBox;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    Label4: TLabel;
    Label30: TLabel;
    DBMemo1: TDBMemo;
    Label17: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GridChild: TDBGridEh;
    suiGroupBox7: TsuiGroupBox;
    suiGroupBox9: TsuiGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    DBEditEh21: TDBEditEh;
    DBDateTimeEditEh8: TDBDateTimeEditEh;
    DBLookupComboboxEh12: TDBLookupComboboxEh;
    DBLookupComboboxEh13: TDBLookupComboboxEh;
    DBDateTimeEditEh9: TDBDateTimeEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    DBNumberEditEh4: TDBNumberEditEh;
    suiGroupBox8: TsuiGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    suiGroupBox10: TsuiGroupBox;
    Label36: TLabel;
    Label38: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DBDateTimeEditEh5: TDBDateTimeEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh7: TDBEditEh;
    DBEditEh8: TDBEditEh;
    DBEditEh9: TDBEditEh;
    DBEditEh10: TDBEditEh;
    DBEditEh11: TDBEditEh;
    DBEditEh12: TDBEditEh;
    DBEditEh13: TDBEditEh;
    DBEditEh14: TDBEditEh;
    DBEditEh15: TDBEditEh;
    DBEditEh16: TDBEditEh;
    DBEditEh17: TDBEditEh;
    DBMemo9: TDBMemo;
    DBEditEh22: TDBEditEh;
    DBComboBoxEh4: TDBComboBoxEh;
    DBMemo10: TDBMemo;
    DBMemo11: TDBMemo;
    DBMemo12: TDBMemo;
    DBEditEh18: TDBEditEh;
    btnClient: TsuiButton;
    txtClientHint: TEdit;
    DBMemo13: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo14: TDBMemo;
    DBGridEh1: TDBGridEh;
    procedure btnClientSelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBrowerClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure bntSelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClientSelectClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ds_ContractDataChange(Sender: TObject; Field: TField);
    procedure ds_ContractChildDataChange(Sender: TObject; Field: TField);
    procedure MenuItem2Click(Sender: TObject);
    procedure GridChildColumns4UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure SGridDblClick(Sender: TObject);
    procedure GridChildExit(Sender: TObject);
    procedure MenuClientContractClick(Sender: TObject);
    procedure MenuQuotedPriceClick(Sender: TObject);
    procedure ABtnNewClick(Sender: TObject);
    procedure btnClientContratClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PageContractChange(Sender: TObject);
    procedure DBLookupComboboxEh4Change(Sender: TObject);
    procedure btnClientClick(Sender: TObject);
    procedure GridChildColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure PageProductDetailChange(Sender: TObject);
    procedure GridChildColumns5UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure GridChildColumns7UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
  private
        ContractID :string;
        procedure New_ini() ;
        procedure initialize();
        procedure Count_AmountMoney(CID:string) ;
  public
     procedure Query_ini(id:string);
     procedure Search_Ini(id:string);
     procedure Insert_ProductDetail(ID, ParentID:string);
     procedure Update_ProductDetail(ID, ParentID:string);
     procedure New_FromFlow(CID:string; Flag:string);
  end;

var
  DocumentsClause_frm: TDocumentsClause_frm;

implementation

uses DataModule, ClientContractAdd, BasePage, PubSelModule, SelectRecord,
  DocumentsClauseAdd;

{$R *.dfm}

procedure TDocumentsClause_frm.initialize();
var   sqlstr, whsql, id:string;
begin
   btnClear.OnClick(nil);

  sqlstr :='select ProductID,ProductName,ProductEnName,ProductSpec,ProductEnSpec,FactoryID,BarCode,'+
    'ProductType,ProductPrice,PriceRate,AmountUnit as Units, '+
    '(select DictName from DictAmountUnit where DictEnName=ProductInfo.AmountUnit)as AmountUnit,'+
    'OutPackageNum,OutPackageUnit,InPackageNum, '+
    'InPackageUnit,NetWeight,GrossWeight,SupplierID,LengthNum,WidthNum,HeightNum,StereNum from ProductInfo '+
    'where 1=1';
   Get_Query(q_ProductInfo, sqlstr);


   sqlstr :='select * from DictPort where CountryID=(select DictID from DictCountry where DictEnName=''CHINA'') ';
   Get_Query(Query_Port1, sqlstr);

   mt_Contract.Active :=true;
   mt_ContractChild.Active :=true;
end;

procedure TDocumentsClause_frm.New_ini();
begin
  mt_Contract.FieldByName('InvoiceDate').AsString :=formatdatetime('yyyy-MM-dd', date);
  mt_Contract.FieldByName('Creator').AsString :=User_ID;
  mt_Contract.FieldByName('CreateDate').AsString :=formatdatetime('yyyy-MM-dd', date);
end;

procedure TDocumentsClause_frm.Query_ini(id:string);
begin
  mt_Contract.Active :=true;
  mt_ContractChild.Active :=false;
  mt_ContractChild.Filtered :=false;
  mt_ContractChild.Filter :='CID='+ mt_Contract.FieldByName('CID').AsString ;
  mt_ContractChild.Filtered :=true;
  mt_ContractChild.Active :=true;
end;

procedure TDocumentsClause_frm.Search_Ini(id:string);
begin
end;

procedure TDocumentsClause_frm.Insert_ProductDetail(ID, ParentID:string);
var sqlstr:string;
begin
   if mt_ContractChild.Active =false then exit;
   ParentID :=mt_Contract.fieldbyname('CID').AsString;
   sqlstr :='select * from DocumentsFactureChild where CID='+ParentID+' and ProductID=''' +ID+ '''';
   if DoSql_Select(sqlstr)>0 then
   begin
       Application.MessageBox(pchar('此货品已经存在'), '提示信息', mb_ok+mb_iconinformation);
       exit;
   end;
   sqlstr :='select ProductID,ProductName,ProductEnName,ProductSpec,ProductEnSpec,FactoryID,BarCode,'+
    'ProductType,ProductPrice,PriceRate,AmountUnit as Units, (select DictName from DictAmountUnit where DictEnName=ProductInfo.AmountUnit)as AmountUnit,'+
    'OutPackageNum,OutPackageUnit,InPackageNum, '+
    'InPackageUnit,NetWeight,GrossWeight,SupplierID,LengthNum,WidthNum,HeightNum,StereNum from ProductInfo '+
    'where ProductID='''+ ID + '''';
   Get_Query(Query, sqlstr);
   if (Query.RecordCount >0) then
   begin
      mt_ContractChild.Append;
      mt_ContractChild.FieldByName('CID').AsString :=ParentID;
      mt_ContractChild.FieldByName('ProductID').AsString :=Query.fieldbyname('ProductID').AsString;
      mt_ContractChild.FieldByName('Price').AsString :=Query.fieldbyname('ProductPrice').AsString;
      mt_ContractChild.FieldByName('Quantity').AsString :='1';
      mt_ContractChild.FieldByName('Amount').AsFloat :=Query.fieldbyname('ProductPrice').AsFloat;
      mt_ContractChild.Post;
   end;
   Count_AmountMoney(ParentID);
end;

procedure TDocumentsClause_frm.Update_ProductDetail(ID, ParentID:string);
var sqlstr:string;
begin
   if mt_ContractChild.Active =false then exit;
   ParentID :=mt_Contract.fieldbyname('CID').AsString;
   sqlstr :='select * from DocumentsFactureChild where CID='+ParentID+' and ProductID=''' +ID+ '''';
   if DoSql_Select(sqlstr)>0 then
   begin
       Application.MessageBox(pchar('此货品已经存在'), '提示信息', mb_ok+mb_iconinformation);
       exit;
   end;
   sqlstr :='select ProductID,ProductName,ProductEnName,ProductSpec,ProductEnSpec,FactoryID,BarCode,'+
    'ProductType,ProductPrice,PriceRate,AmountUnit as Units, (select DictName from DictAmountUnit where DictEnName=ProductInfo.AmountUnit)as AmountUnit,'+
    'OutPackageNum,OutPackageUnit,InPackageNum, '+
    'InPackageUnit,NetWeight,GrossWeight,SupplierID,LengthNum,WidthNum,HeightNum,StereNum from ProductInfo '+
    'where ProductID='''+ ID + '''';
   Get_Query(Query, sqlstr);
   if (Query.RecordCount >0) then
   begin
      mt_ContractChild.Edit;
      mt_ContractChild.FieldByName('ProductID').AsString :=Query.fieldbyname('ProductID').AsString;
      mt_ContractChild.FieldByName('Price').AsString :=Query.fieldbyname('ProductPrice').AsString;
      mt_ContractChild.FieldByName('Quantity').AsString :='1';
      mt_ContractChild.FieldByName('Amount').AsFloat :=Query.fieldbyname('ProductPrice').AsFloat;
      mt_ContractChild.Post;
   end;
   Count_AmountMoney(ParentID);
end;
//从前流程页里调入.
//前流程ID, Flag那一步的流程调入. 1为报价,2为客户合同.
procedure TDocumentsClause_frm.New_FromFlow(CID:string; Flag:string);
var i:integer;
   sqlstr:string;
begin
  if flag ='1' then
  begin 
     sqlstr :='Select * from DocumentsFacture where CID='+ CID + '';
     Get_Query(Query, sqlstr);
     if (Query.RecordCount >0) then
     begin
        mt_Contract.Append();
        mt_Contract.FieldByName('CID').AsInteger :=Get_MaxID('StockContract', 'CID');
        mt_Contract.FieldByName('SignAddress').AsString :=Query.Fieldbyname('SignAddress').AsString;
        mt_Contract.FieldByName('TradeUnit').AsString :=Query.Fieldbyname('CompanyID').AsString;
        New_ini();
        mt_ContractChild.Active :=true;
        btnSave.Enabled :=true;
        sqlstr :='Select * from StockContractChild where CID='+ CID + '';
        Get_Query(Query, sqlstr);
        for i:=0 to Query.RecordCount -1 do
        begin
          mt_ContractChild.Append;
          mt_ContractChild.FieldByName('ProductID').AsString :=Query.Fieldbyname('ProductID').AsString;
          mt_ContractChild.FieldByName('Quantity').AsString :=Query.Fieldbyname('Quantity').AsString;
          mt_ContractChild.FieldByName('Price').AsString :=Query.Fieldbyname('Price').AsString;
          mt_ContractChild.FieldByName('Amount').AsString :=Query.Fieldbyname('Amount').AsString;
          Query.Next;
        end;
     end;
   end
  else
  begin 
     sqlstr :='Select * from ClientContract where CID='+ CID + '';
     Get_Query(Query, sqlstr);
     if (Query.RecordCount >0) then
     begin
        mt_Contract.Append();
        mt_Contract.FieldByName('CID').AsInteger :=Get_MaxID('StockContract', 'CID');
        mt_Contract.FieldByName('SignAddress').AsString :=Query.Fieldbyname('SignAddress').AsString;
        mt_Contract.FieldByName('TradeUnit').AsString :=Query.Fieldbyname('CompanyID').AsString;
        mt_Contract.FieldByName('ClientContractID').AsString :=Query.Fieldbyname('ContractID').AsString;
        New_ini();
        mt_ContractChild.Active :=true;
        btnSave.Enabled :=true;
        sqlstr :='Select * from ClientContractChild where CID='+ CID + '';
        Get_Query(Query, sqlstr);
        for i:=0 to Query.RecordCount -1 do
        begin
          mt_ContractChild.Append;
          mt_ContractChild.FieldByName('ProductID').AsString :=Query.Fieldbyname('ProductID').AsString;
          mt_ContractChild.FieldByName('Quantity').AsString :=Query.Fieldbyname('Quantity').AsString;
          mt_ContractChild.FieldByName('Price').AsString :=Query.Fieldbyname('Price').AsString;
          mt_ContractChild.FieldByName('Amount').AsString :=Query.Fieldbyname('Amount').AsString;
          Query.Next;
        end;
     end;
   end;
end;

procedure TDocumentsClause_frm.Count_AmountMoney(CID:string);
var  TotalMoney:real; sqlstr:string;
begin
   {sqlstr :='select sum(Amount) from StockContractChild where CID='+CID+'';
   TotalMoney :=strtofloat(GetOneValue(sqlstr));
   if   mt_Contract.State in[dsInsert,dsedit] then
   else
   mt_Contract.Edit;
   if mt_Contract.FieldByName('DiscountMoney').AsFloat > 0 then
     mt_Contract.FieldByName('TotalMoney').AsCurrency :=TotalMoney * mt_Contract.FieldByName('DiscountMoney').AsFloat
   else
   begin
      mt_Contract.FieldByName('DiscountMoney').AsFloat :=0 ;
      mt_Contract.FieldByName('TotalMoney').AsCurrency :=TotalMoney ;
   end;  }
end;

procedure TDocumentsClause_frm.btnClientSelClick(Sender: TObject);
begin
  inherited;
//
   Application.CreateForm(TPubSelModule_frm, PubSelModule_frm) ;
   PubSelModule_frm.SelectStr :='select FactoryID as 工厂编号, FactoryName as 工厂名称 from FactoryInfo';
   PubSelModule_frm.WheField[0] :='FactoryID';
   PubSelModule_frm.WheField[1] :=mt_Contract.FieldbyName('FactoryID').AsString;
   PubSelModule_frm.WheField[2] :='FactoryName';
   PubSelModule_frm.WheField[3] :='';

   PubSelModule_frm.ShowModal;
   if PubSelModule_frm.Flag then
   begin
      mt_Contract.FieldbyName('FactoryID').AsString :=PubSelModule_frm.Query.Fields[0].AsString ;
      //txtConpanyname.Text :=PubSelModule_frm.Query.Fields[1].AsString ;
   end;
   PubSelModule_frm.Free;

end;

procedure TDocumentsClause_frm.btnNewClick(Sender: TObject);
begin
  inherited;
//
  mt_Contract.Append();
  mt_Contract.FieldByName('CID').AsInteger :=Get_MaxID('DocumentsFacture', 'CID');
  New_ini();
  //mt_ContractChild.Filter :='CID='+ mt_Contract.FieldByName('CID').AsString ;
  //mt_ContractChild.Filtered :=true;
  mt_ContractChild.Active :=true;
  btnSave.Enabled :=true;
end;

procedure TDocumentsClause_frm.btnAddClick(Sender: TObject);
begin
  inherited;
   application.CreateForm(TDocumentsClauseAdd_frm, DocumentsClauseAdd_frm);
   DocumentsClauseAdd_frm.ShowModal;
   DocumentsClauseAdd_frm.Free;
end;

procedure TDocumentsClause_frm.btnDeleteClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TDocumentsClause_frm.btnSaveClick(Sender: TObject);
var Insertnum, Updatenum:integer;
begin
   inherited;
//
   Insertnum :=0;
   Updatenum :=0;
   if mt_Contract.State in[dsInsert] then
   begin
      try
        mt_Contract.UpdateRecord;
        mt_Contract.Post;
        //mt_Contract.ApplyUpdates(-1);
        Insertnum :=Insertnum +1;
      except
        on ex :exception do showmessage(ex.Message);
      end;
   end
   else if mt_Contract.State=dsedit then
   begin
     try
        //mt_Contract.UpdateRecord;
        //mt_Contract.Refresh;
        mt_Contract.Post;
        //mt_Contract.ApplyUpdates(-1);
        Updatenum :=Updatenum +1;
     except
        on ex :exception do showmessage(ex.Message);
     end;
   end;
  
   if mt_ContractChild.State in[dsInsert] then
   begin
      try
        //mt_Contract.ApplyUpdates(-1);
        mt_ContractChild.UpdateRecord;
        mt_ContractChild.Post;
        mt_ContractChild.ApplyUpdates(-1);
        Count_AmountMoney(mt_Contract.fieldbyname('CID').AsString);
        
        mt_Contract.UpdateRecord;
        mt_Contract.Post;
        Updatenum :=Updatenum +1;
      except
        on ex :exception do showmessage(ex.Message);
      end;
   end
   else if mt_ContractChild.State=dsedit then
   begin
     try
        mt_ContractChild.UpdateRecord;
        mt_ContractChild.Post;
        mt_ContractChild.ApplyUpdates(-1);
        //Count_AmountMoney(mt_Contract.fieldbyname('CID').AsString);

        mt_Contract.UpdateRecord;
        mt_Contract.Post;
        Updatenum :=Updatenum +1;
     except
       on ex :exception do showmessage(ex.Message);
     end;
   end;
   if Updatenum >0 then
   begin
       btnsave.Enabled :=false;
       application.MessageBox(pchar('修改成功'),'提示信息',mb_ok+mb_iconinformation);
   end
   else if Insertnum >0 then
   begin
       btnsave.Enabled :=false;
       if application.MessageBox(pchar('保存成功, 是否续继新建'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
       begin
         btnNew.Click;
       end;
   end;

end;

procedure TDocumentsClause_frm.btnBrowerClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TDocumentsClause_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TDocumentsClause_frm.bntSelClick(Sender: TObject);
var whstr:string;
begin
  inherited;
//
  whstr :='';
  if txtContractID.Text <>'' THEN
  begin
     whstr :=whstr + 'InvoiceID like '''+ TXTContractID.Text + '%''';
  end;
  if TXTClientID.Text <>'' THEN
  begin
     if  whstr <> '' then whstr :=whstr + ' and ';
     whstr :=whstr + 'ClientContractID ='''+ TXTClientID.Text + '''';
  end;
  if txtSignDate1.Text <> '    -  -  ' THEN
  begin
     if  whstr <> '' then whstr :=whstr + ' and ';
     whstr :=whstr + 'InvoiceDate >='''+ txtSignDate1.Text + '''';
  end;
  if txtSignDate2.Text <> '    -  -  ' THEN
  begin
     if  whstr <> '' then whstr :=whstr + ' and ';
     whstr :=whstr + 'InvoiceDate <='''+ txtSignDate2.Text + '''';
  end;
  mt_Contract.DisableControls;
  try
      mt_Contract.Filter := whstr;
    {if (txtContractID.Text <>'') and (txtClientID.Text <>'') THEN
      //mt_Contract.Locate('ContractID', 'ClientID', VarArrayof([txtContractID.Text, txtClientID.Text]), [loCaseInsensitive]);
      //mt_Contract.Locate('ContractID', txtContractID.Text, [])
      //mt_Contract.FindRec('ContractID', txtContractID.Text, [])
    else if  txtContractID.Text <>'' THEN
      //mt_Contract.Locate('ContractID', txtContractID.Text, [])
      //mt_Contract.FindRec('ContractID', txtContractID.Text, [])
      mt_Contract.Filter := '1=1 and ContractID ='''+ txtContractID.Text + ''''
    else   if  TXTClientID.Text <>'' THEN
    begin
      //mt_Contract.Locate('ClientID', txtClientID.Text, [])
      //mt_Contract.FindRec('ClientID', TXTClientID.Text, [])
      mt_Contract.Filter := '1=1 and ClientID ='''+ TXTClientID.Text + '''';
    end; }
  finally
    mt_Contract.EnableControls;
  end;
end;

procedure TDocumentsClause_frm.FormShow(Sender: TObject);
begin
  inherited;
  //
  Set_ImeName(tobject(TabSStock));
  Set_ImeName(tobject(Tab_Edit));
  Set_ImeName(tobject(Tab_Brower));
  initialize();
  PageContract.ActivePageIndex :=0;
end;

procedure TDocumentsClause_frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (mt_Contract.State in [dsEdit, dsinsert]) or (mt_ContractChild.State in [dsEdit, dsinsert]) then
  begin
     if application.MessageBox(pchar('是否保存当前数据'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
     begin
       if  mt_Contract.State in [dsEdit, dsinsert] then
          mt_Contract.Post;
       if  mt_ContractChild.State in [dsEdit, dsinsert] then
          mt_ContractChild.Post;
     end;
  end;

end;

procedure TDocumentsClause_frm.btnClientSelectClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TSelectRecord_frm, SelectRecord_frm) ;
   SelectRecord_frm.SelectStr :='select ContractID as 合同号, '+
      '(select ClientName from ClientInfo where ClientContract.ClientID=ClientID) as 客户名称, SignDate as 签约日期 from ClientContract';
   SelectRecord_frm.WheField[0] :='CID';
   SelectRecord_frm.WheField[1] :='';
   SelectRecord_frm.WheField[2] :='ContractID';

   SelectRecord_frm.ShowModal;
   if SelectRecord_frm.Flag then
   begin
      txtClientID.Text :=SelectRecord_frm.Query.Fields[0].AsString ;
      txtClientName.Text :=SelectRecord_frm.Query.Fields[1].AsString ;
   end;
   SelectRecord_frm.Free;
end;

procedure TDocumentsClause_frm.btnClearClick(Sender: TObject);
begin
  inherited;
   txtContractID.Clear;
   txtClientID.Clear;
   txtClientName.Clear;
   txtSignDate1.Text :='    -  -  ';
   txtSignDate2.Text :='    -  -  ';
end;

procedure TDocumentsClause_frm.N1Click(Sender: TObject);
var mybookmark:Tbookmark;
   sqlstr:string; I:integer;
begin
  inherited;
  if Application.MessageBox(pchar('确定要删除合同号为'+mt_Contract.FieldByName('ContractID').AsString+'的记录吗'), '提示信息', mb_iconinformation+mb_yesno) =idno then exit;
  try
     if not mt_Contract.eof then
     begin
        for i:=0 to SGrid.SelectedRows.Count-1 do
        begin
           SGrid.DataSource.DataSet.GotoBookmark(pointer(SGrid.SelectedRows[i]));
           sqlstr :='delete from DocumentsFacture where CID='+ SGrid.SelectedRows.DataSet.fieldbyname('CID').AsString;
           dosql(sqlstr);
           sqlstr :='delete from DocumentsFactureChild where CID='+ SGrid.SelectedRows.DataSet.fieldbyname('CID').AsString;
           dosql(sqlstr);
        end;
        SGrid.DataSource.DataSet.Close;
        SGrid.DataSource.DataSet.Open;
    end;
  except
  end;
end;

procedure TDocumentsClause_frm.MenuItem1Click(Sender: TObject);
var id, proid, sqlstr:string;
   I:integer;
begin
  inherited;
  if Application.MessageBox(pchar('确定要删除产品编号为'+mt_ContractChild.FieldByName('ProductID').AsString+'的记录吗'), '提示信息', mb_iconinformation+mb_yesno) =idno then exit;
  try
     if not mt_ContractChild.eof then
     begin
        for i:=0 to SGridChild.SelectedRows.Count-1 do
        begin
           SGridChild.DataSource.DataSet.GotoBookmark(pointer(SGridChild.SelectedRows[i]));
           id :=SGridChild.SelectedRows.DataSet.fieldbyname('ID').AsString;
           sqlstr :='delete from DocumentsFactureChild where ID='+ id;
           dosql(sqlstr);
        end;
        SGridChild.DataSource.DataSet.Close;
        SGridChild.DataSource.DataSet.Open;
    end;
  except
  end;

end;

procedure TDocumentsClause_frm.ds_ContractDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if btnSave.Enabled =false then
    btnSave.Enabled :=true;
end;

procedure TDocumentsClause_frm.ds_ContractChildDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if btnSave.Enabled =false then
    btnSave.Enabled :=true;

end;

procedure TDocumentsClause_frm.MenuItem2Click(Sender: TObject);
var id, sqlstr:string;
begin
  inherited;
  //TRY
      id :=mt_ContractChild.fieldbyname('ID').AsString;
      sqlstr :='delete from DocumentsFactureChild where ID='+ id;
      dosql(sqlstr);
    mt_ContractChild.Close;
    mt_ContractChild.Open;
  //except
  //end;
end;

procedure TDocumentsClause_frm.GridChildColumns4UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  try
    if strtofloat(value) >0 then
    begin
      mt_ContractChild.Edit;
      mt_ContractChild.fieldbyname('Amount').AsCurrency :=mt_ContractChild.fieldbyname('Price').AsCurrency * strtofloat(value);
    end;
    Count_AmountMoney(mt_Contract.fieldbyname('CID').AsString);
  except
  end;

end;

procedure TDocumentsClause_frm.SGridDblClick(Sender: TObject);
begin
  inherited;
//
  PageContract.ActivePageIndex :=1;
  PageProductDetail.ActivePageIndex :=0;
end;

procedure TDocumentsClause_frm.GridChildExit(Sender: TObject);
begin
  inherited;
    Count_AmountMoney(mt_Contract.fieldbyname('CID').AsString);

end;

procedure TDocumentsClause_frm.MenuClientContractClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TSelectRecord_frm, SelectRecord_frm) ;
   SelectRecord_frm.SelectStr :='select CID, ContractID as 合同号, SignDate as 签约日期, '+
      '(select ClientName from ClientInfo where ClientContract.ClientID=ClientID) as 客户名称 from ClientContract';
   SelectRecord_frm.WheField[0] :='CID';
   SelectRecord_frm.WheField[1] :='';
   SelectRecord_frm.WheField[2] :='ContractID';
   
   SelectRecord_frm.ShowModal;
   if SelectRecord_frm.Flag then
   begin
      New_FromFlow(SelectRecord_frm.Query.Fields[0].AsString, '2');
   end;
   SelectRecord_frm.Free;

end;

procedure TDocumentsClause_frm.MenuQuotedPriceClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TSelectRecord_frm, SelectRecord_frm) ;
   SelectRecord_frm.SelectStr :='select CID, ContractID as 合同号, SignDate as 签约日期, '+
      '(select FactoryName from FactoryInfo where DocumentsFacture.FactoryID=FactoryID) as 客户名称 from DocumentsFacture';
   SelectRecord_frm.WheField[0] :='CID';
   SelectRecord_frm.WheField[1] :='';
   SelectRecord_frm.WheField[2] :='ContractID';
   
   SelectRecord_frm.ShowModal;
   if SelectRecord_frm.Flag then
   begin
      New_FromFlow(SelectRecord_frm.Query.Fields[0].AsString, '1');
   end;
   SelectRecord_frm.Free;

end;

procedure TDocumentsClause_frm.ABtnNewClick(Sender: TObject);
VAR CurPoint:TPoint;
begin
  inherited;
  GetCursorPos(CurPoint);
   PopuNew.Popup(CurPoint.X,CurPoint.Y);//a,b 为显示的位置
end;

procedure TDocumentsClause_frm.btnClientContratClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TSelectRecord_frm, SelectRecord_frm) ;
   SelectRecord_frm.SelectStr :='select ContractID as 合同号, SignDate as 签约日期, IndentID as 订单号,'+
      '(select ClientName from ClientInfo where ClientContract.CompanyID=ClientID) as 客户名称, CreateDate as 录入日期 from ClientContract';
   SelectRecord_frm.WheField[0] :='CID';
   SelectRecord_frm.WheField[1] :='';
   SelectRecord_frm.WheField[2] :='ContractID';

   SelectRecord_frm.ShowModal;
   if SelectRecord_frm.Flag then
   begin
      if mt_Contract.State <> dsedit then
         mt_Contract.Edit;
      mt_Contract.FieldbyName('ClientContractID').AsString :=SelectRecord_frm.Query.Fields[0].AsString ;
   end;
   SelectRecord_frm.Free;

end;

procedure TDocumentsClause_frm.N2Click(Sender: TObject);
begin
  inherited;
  SGridDblClick(nil);
end;

procedure TDocumentsClause_frm.PageContractChange(Sender: TObject);
begin
  inherited;
//
end;

procedure TDocumentsClause_frm.DBLookupComboboxEh4Change(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  sqlstr :='select * from DictPort where CountryID='''+DataModule_frm.Query_Country.FieldByName('DictID').AsString+ '''';
  Get_Query(Query_Port2, sqlstr);

end;

procedure TDocumentsClause_frm.btnClientClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TSelectRecord_frm, SelectRecord_frm) ;
   SelectRecord_frm.SelectStr :='select ClientID as 客户编号,ClientName as 公司名称, Address as 地址, Email as 电子邮件 from ClientInfo';
   SelectRecord_frm.WheField[0] :='ClientID';
   SelectRecord_frm.WheField[1] :='';
   SelectRecord_frm.WheField[2] :='ClientName';

   SelectRecord_frm.ShowModal;
   if SelectRecord_frm.Flag then
   begin
      if mt_Contract.State <> dsedit then
         mt_Contract.Edit;
      mt_Contract.FieldbyName('ProveClient').AsString :=SelectRecord_frm.Query.Fields[0].AsString ;
      txtClientHint.Text :=SelectRecord_frm.Query.Fields[1].AsString ;
      mt_Contract.FieldbyName('ProveProposer').AsString :=SelectRecord_frm.Query.Fields[1].AsString + #13+ SelectRecord_frm.Query.Fields[2].AsString;
      mt_Contract.FieldbyName('ProveMessageMan').AsString :=SelectRecord_frm.Query.Fields[1].AsString+ #13+ SelectRecord_frm.Query.Fields[2].AsString;
   end;
   SelectRecord_frm.Free;

end;

procedure TDocumentsClause_frm.GridChildColumns1EditButtonClick(
  Sender: TObject; var Handled: Boolean);
begin
  inherited;
   application.CreateForm(TDocumentsClauseAdd_frm, DocumentsClauseAdd_frm);
   DocumentsClauseAdd_frm.Flag :='1';
   DocumentsClauseAdd_frm.ShowModal;
   DocumentsClauseAdd_frm.Free;

end;

procedure TDocumentsClause_frm.PageProductDetailChange(Sender: TObject);
begin
  inherited;
//
  if (PageContract.ActivePageIndex =1) and (PageProductDetail.ActivePageIndex =1) then
  begin
    btnAdd.Enabled :=true;
    btnDelete.Enabled :=true;
  end
  else
  begin
    btnAdd.Enabled :=false;
    btnDelete.Enabled :=false;
  end;
end;

procedure TDocumentsClause_frm.GridChildColumns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
//
  try
    if strtofloat(value) >0 then
    begin
      if mt_ContractChild.State <> dsedit then
         mt_ContractChild.Edit;
      mt_ContractChild.fieldbyname('Amount').AsCurrency :=mt_ContractChild.fieldbyname('Price').AsCurrency * strtofloat(value);
    end;
  except
    on e :exception do
    begin
      showmessage('计算单价*数量时出错');
    end;
  end;

end;

procedure TDocumentsClause_frm.GridChildColumns7UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  try
    if strtofloat(value) >0 then
    begin
      if mt_ContractChild.State <> dsedit then
         mt_ContractChild.Edit;
      mt_ContractChild.fieldbyname('Amount').AsCurrency :=mt_ContractChild.fieldbyname('Quantity').AsCurrency * strtofloat(value);
    end;
  except
    on e :exception do
    begin
      showmessage('计算单价*数量时出错');
    end;
  end;

end;

end.
