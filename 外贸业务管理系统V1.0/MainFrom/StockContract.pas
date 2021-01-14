unit StockContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ComCtrls, SUIStatusBar, SUIPageControl, SUITabControl,
  ExtCtrls, SUIForm, StdCtrls, Mask, DBCtrlsEh, SUIImagePanel, SUIGroupBox,
  GridsEh, DBGridEh, DBLookupEh, SUIButton, MemTableDataEh, Db, ADODB,
  DataDriverEh, MemTableEh, Menus, SUIPopupMenu, DBCtrls;

type
  TStockContract_frm = class(TBaseFrm)
    PageContract: TsuiPageControl;
    Tab_Brower: TsuiTabSheet;
    Tab_Edit: TsuiTabSheet;
    suiStatusBar1: TsuiStatusBar;
    PageControl2: TsuiPageControl;
    TabSStock: TsuiTabSheet;
    suiTabSheet2: TsuiTabSheet;
    GridChild: TDBGridEh;
    Label8: TLabel;
    Label10: TLabel;
    dbClient: TDBEditEh;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    DBEditEh1: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
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
    T_Contract: TADOTable;
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
    DBMemo3: TDBMemo;
    mt_Contract: TMemTableEh;
    Label5: TLabel;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    Label6: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label17: TLabel;
    DBEditEh7: TDBEditEh;
    btnClientSel: TsuiButton;
    txtConpanyname: TEdit;
    DBMemo1: TDBMemo;
    mt_ContractChildDealQuantity: TFloatField;
    mt_ContractChildDealDate: TDateField;
    btnClient: TsuiButton;
    PopuNew: TsuiPopupMenu;
    ABtnNew: TsuiArrowButton;
    MenuQuotedPrice: TMenuItem;
    MenuClientContract: TMenuItem;
    Splitter1: TSplitter;
    N2: TMenuItem;
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
    procedure GridChildColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure SGridDblClick(Sender: TObject);
    procedure GridChildExit(Sender: TObject);
    procedure MenuClientContractClick(Sender: TObject);
    procedure MenuQuotedPriceClick(Sender: TObject);
    procedure ABtnNewClick(Sender: TObject);
    procedure btnClientClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PageContractChange(Sender: TObject);
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
  StockContract_frm: TStockContract_frm;

implementation

uses DataModule, ClientContractAdd, BasePage, PubSelModule, SelectRecord,
  StockContractAdd;

{$R *.dfm}

procedure TStockContract_frm.initialize();
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

   mt_Contract.Active :=true;
   mt_ContractChild.Active :=true;
end;

procedure TStockContract_frm.New_ini();
begin
  mt_Contract.FieldByName('SignDate').AsString :=formatdatetime('yyyy-MM-dd', date);
  mt_Contract.FieldByName('Creator').AsString :=User_ID;
  mt_Contract.FieldByName('CreateDate').AsString :=formatdatetime('yyyy-MM-dd', date);
  if DataModule_frm.Query_CompanyInfo.RecordCount >0 then  DataModule_frm.Query_CompanyInfo.First;

end;

procedure TStockContract_frm.Query_ini(id:string);
begin
  mt_Contract.Active :=true;
  mt_ContractChild.Active :=false;
  mt_ContractChild.Filtered :=false;
  mt_ContractChild.Filter :='CID='+ mt_Contract.FieldByName('CID').AsString ;
  mt_ContractChild.Filtered :=true;
  mt_ContractChild.Active :=true;
end;

procedure TStockContract_frm.Search_Ini(id:string);
begin
end;

procedure TStockContract_frm.Insert_ProductDetail(ID, ParentID:string);
var sqlstr:string;
begin
   if mt_ContractChild.Active =false then exit;
   ParentID :=mt_Contract.fieldbyname('CID').AsString;
   sqlstr :='select * from StockContractChild where CID='+ParentID+' and ProductID=''' +ID+ '''';
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

procedure TStockContract_frm.Update_ProductDetail(ID, ParentID:string);
var sqlstr:string;
begin
   if mt_ContractChild.Active =false then exit;
   ParentID :=mt_Contract.fieldbyname('CID').AsString;
   sqlstr :='select * from StockContractChild where CID='+ParentID+' and ProductID=''' +ID+ '''';
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
procedure TStockContract_frm.New_FromFlow(CID:string; Flag:string);
var i:integer;
   sqlstr:string;
begin
  if flag ='1' then
  begin 
     sqlstr :='Select * from StockContract where CID='+ CID + '';
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

procedure TStockContract_frm.Count_AmountMoney(CID:string);
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

procedure TStockContract_frm.btnClientSelClick(Sender: TObject);
begin
  inherited;
//
   Application.CreateForm(TPubSelModule_frm, PubSelModule_frm) ;
   PubSelModule_frm.SelectStr :='select FactoryID as 工厂编号, FactoryName as 工厂名称 from FactoryInfo';
   PubSelModule_frm.WheField[0] :='FactoryID';
   PubSelModule_frm.WheField[1] :=mt_Contract.FieldbyName('FactoryID').AsString;
   PubSelModule_frm.WheField[2] :='FactoryName';
   PubSelModule_frm.WheField[3] :=txtConpanyname.Text;

   PubSelModule_frm.ShowModal;
   if PubSelModule_frm.Flag then
   begin
      if mt_Contract.State <> dsedit then
         mt_Contract.Edit;
      mt_Contract.FieldbyName('FactoryID').AsString :=PubSelModule_frm.Query.Fields[0].AsString ;
      txtConpanyname.Text :=PubSelModule_frm.Query.Fields[1].AsString ;
   end;
   PubSelModule_frm.Free;

end;

procedure TStockContract_frm.btnNewClick(Sender: TObject);
begin
  inherited;
//
  mt_Contract.Append();
  mt_Contract.FieldByName('CID').AsInteger :=Get_MaxID('StockContract', 'CID');
  New_ini();
  //mt_ContractChild.Filter :='CID='+ mt_Contract.FieldByName('CID').AsString ;
  //mt_ContractChild.Filtered :=true;
  mt_ContractChild.Active :=true;
  btnSave.Enabled :=true;
end;

procedure TStockContract_frm.btnAddClick(Sender: TObject);
begin
  inherited;
   application.CreateForm(TStockContractAdd_frm, StockContractAdd_frm);
   StockContractAdd_frm.ShowModal;
   StockContractAdd_frm.Free;
end;

procedure TStockContract_frm.btnDeleteClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TStockContract_frm.btnSaveClick(Sender: TObject);
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
        mt_Contract.UpdateRecord;
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
        Count_AmountMoney(mt_Contract.fieldbyname('CID').AsString);

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

procedure TStockContract_frm.btnBrowerClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TStockContract_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TStockContract_frm.bntSelClick(Sender: TObject);
var whstr:string;
begin
  inherited;
//
  whstr :='1=1 ';
  if txtContractID.Text <>'' THEN
  begin
     whstr :=whstr + ' and ContractID like '''+ TXTContractID.Text + '%''';
  end;
  if TXTClientID.Text <>'' THEN
  begin
     whstr :=whstr + ' and FactoryID ='''+ TXTClientID.Text + '''';
  end;
  if txtSignDate1.Text <> '    -  -  ' THEN
  begin
     whstr :=whstr + ' and SignDate >='''+ txtSignDate1.Text + '''';
  end;
  if txtSignDate2.Text <> '    -  -  ' THEN
  begin
     whstr :=whstr + ' and SignDate <='''+ txtSignDate2.Text + '''';
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

procedure TStockContract_frm.FormShow(Sender: TObject);
begin
  inherited;
  //
  Set_ImeName(tobject(TabSStock));
  Set_ImeName(tobject(Tab_Edit));
  Set_ImeName(tobject(Tab_Brower));
  initialize();
  PageContract.ActivePageIndex :=0;
end;

procedure TStockContract_frm.FormClose(Sender: TObject;
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

procedure TStockContract_frm.btnClientSelectClick(Sender: TObject);
begin
  inherited;

   Application.CreateForm(TPubSelModule_frm, PubSelModule_frm) ;
   PubSelModule_frm.SelectStr :='select FactoryID as 工厂编号, FactoryName as 工厂名称 from FactoryInfo';
   PubSelModule_frm.WheField[0] :='FactoryID';
   PubSelModule_frm.WheField[1] :=txtClientID.Text;
   PubSelModule_frm.WheField[2] :='FactoryName';
   PubSelModule_frm.WheField[3] :=txtClientName.Text;
   
   PubSelModule_frm.ShowModal;
   if PubSelModule_frm.Flag then
   begin
      txtClientID.Text :=PubSelModule_frm.Query.Fields[0].AsString ;
      txtClientName.Text :=PubSelModule_frm.Query.Fields[1].AsString ;
   end;
   PubSelModule_frm.Free;
end;

procedure TStockContract_frm.btnClearClick(Sender: TObject);
begin
  inherited;
   txtContractID.Clear;
   txtClientID.Clear;
   txtClientName.Clear;
   txtSignDate1.Text :='    -  -  ';
   txtSignDate2.Text :='    -  -  ';
end;

procedure TStockContract_frm.N1Click(Sender: TObject);
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
           sqlstr :='delete from StockContract where CID='+ SGrid.SelectedRows.DataSet.fieldbyname('CID').AsString;
           dosql(sqlstr);
           sqlstr :='delete from StockContractChild where CID='+ SGrid.SelectedRows.DataSet.fieldbyname('CID').AsString;
           dosql(sqlstr);
        end;
        SGrid.DataSource.DataSet.Close;
        SGrid.DataSource.DataSet.Open;
    end;
  except
  end;
end;

procedure TStockContract_frm.MenuItem1Click(Sender: TObject);
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
           sqlstr :='delete from StockContractChild where ID='+ id;
           dosql(sqlstr);
        end;
        SGridChild.DataSource.DataSet.Close;
        SGridChild.DataSource.DataSet.Open;
    end;
  except
  end;

end;

procedure TStockContract_frm.ds_ContractDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if btnSave.Enabled =false then
    btnSave.Enabled :=true;
end;

procedure TStockContract_frm.ds_ContractChildDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if btnSave.Enabled =false then
    btnSave.Enabled :=true;

end;

procedure TStockContract_frm.MenuItem2Click(Sender: TObject);
var id, sqlstr:string;
begin
  inherited;
  //TRY
      id :=mt_ContractChild.fieldbyname('ID').AsString;
      sqlstr :='delete from StockContractChild where ID='+ id;
      dosql(sqlstr);
    mt_ContractChild.Close;
    mt_ContractChild.Open;
  //except
  //end;
end;

procedure TStockContract_frm.GridChildColumns4UpdateData(Sender: TObject;
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

procedure TStockContract_frm.GridChildColumns1EditButtonClick(
  Sender: TObject; var Handled: Boolean);
begin
  inherited;
  //
   application.CreateForm(TStockContractAdd_frm, StockContractAdd_frm);
   StockContractAdd_frm.Flag :='1';
   StockContractAdd_frm.ShowModal;
   StockContractAdd_frm.Free;

end;

procedure TStockContract_frm.SGridDblClick(Sender: TObject);
begin
  inherited;
//
  PageContract.ActivePageIndex :=1;
end;

procedure TStockContract_frm.GridChildExit(Sender: TObject);
begin
  inherited;
    Count_AmountMoney(mt_Contract.fieldbyname('CID').AsString);

end;

procedure TStockContract_frm.MenuClientContractClick(Sender: TObject);
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

procedure TStockContract_frm.MenuQuotedPriceClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TSelectRecord_frm, SelectRecord_frm) ;
   SelectRecord_frm.SelectStr :='select CID, ContractID as 合同号, SignDate as 签约日期, '+
      '(select FactoryName from FactoryInfo where StockContract.FactoryID=FactoryID) as 客户名称 from StockContract';
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

procedure TStockContract_frm.ABtnNewClick(Sender: TObject);
VAR CurPoint:TPoint;
begin
  inherited;
  GetCursorPos(CurPoint);
   PopuNew.Popup(CurPoint.X,CurPoint.Y);//a,b 为显示的位置
end;

procedure TStockContract_frm.btnClientClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TSelectRecord_frm, SelectRecord_frm) ;
   SelectRecord_frm.SelectStr :='select ContractID as 合同号, SignDate as 签约日期, '+
      '(select ClientName from ClientInfo where ClientContract.ClientID=ClientID) as 客户名称 from ClientContract';
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

procedure TStockContract_frm.N2Click(Sender: TObject);
begin
  inherited;
  SGridDblClick(nil);
end;

procedure TStockContract_frm.PageContractChange(Sender: TObject);
begin
  inherited;
//
  PageControl2.ActivePageIndex :=0;
end;

end.
