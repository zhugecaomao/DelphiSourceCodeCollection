unit QuotedPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIPageControl, SUITabControl,
  SUIGroupBox, SUIImagePanel, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, DBCtrls, SUIButton, GridsEh, ComCtrls, SUIStatusBar, DB,
  ADODB, MemTableDataEh, DataDriverEh, MemTableEh, Grids, DBGrids,
  SUISideChannel, OleCtrls, VCFI, Menus, SUIPopupMenu, PrnDbgeh;

type
  TQuotedPrice_frm = class(TBaseFrm)
    suiPageControl1: TsuiPageControl;
    suiTabSheet1: TsuiTabSheet;
    suiTabSheet2: TsuiTabSheet;
    suiImagePanel1: TsuiImagePanel;
    suiGroupBox1: TsuiGroupBox;
    suiGroupBox2: TsuiGroupBox;
    suiGroupBox3: TsuiGroupBox;
    Label14: TLabel;
    DBPriceCoin: TDBLookupComboboxEh;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label6: TLabel;
    dbGoodsBox: TDBLookupComboboxEh;
    Label7: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label8: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Label9: TLabel;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    Label10: TLabel;
    Label11: TLabel;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    DBEdit4: TDBEdit;
    Label15: TLabel;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    suiImagePanel2: TsuiImagePanel;
    btnSelect: TsuiButton;
    btnAdd: TsuiButton;
    btnDelete: TsuiButton;
    btnSave: TsuiButton;
    btnBrower: TsuiButton;
    btnClose: TsuiButton;
    albtnPrint: TsuiArrowButton;
    suiStatusBar1: TsuiStatusBar;
    Query_QuotedPrice: TADOQuery;
    ds_QuotedPrice: TDataSource;
    MemTab_list: TMemTableEh;
    DataSetDriverEh1: TDataSetDriverEh;
    QueryChild: TADOQuery;
    Query_ShipInfo: TADOQuery;
    ds_ShipInfo: TDataSource;
    Query_ShipInfoPrice: TADOQuery;
    ds_ShipInfoPrice: TDataSource;
    ds_QuotedPriceChild: TDataSource;
    Query_Port2: TADOQuery;
    ds_Port2: TDataSource;
    MemTab_listProductID: TWideStringField;
    MemTab_listQuotedID: TWideStringField;
    MemTab_listSalePrice: TBCDField;
    MemTab_listFreightFee: TBCDField;
    MemTab_listIncidentalFee: TBCDField;
    MemTab_listInsuranceFee: TBCDField;
    MemTab_listCountPrice: TBCDField;
    MemTab_listProfitRate: TBCDField;
    MemTab_listProfitAmount: TBCDField;
    btnNew: TsuiButton;
    DBPriceItem: TDBComboBox;
    suiImagePanel3: TsuiImagePanel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit10: TDBEdit;
    Label5: TLabel;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    Label19: TLabel;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label24: TLabel;
    txtClientName: TEdit;
    GridReport: TDBGridEh;
    suiImagePanel4: TsuiImagePanel;
    suiButton1: TsuiButton;
    btnAdd1: TsuiButton;
    btnDelete1: TsuiButton;
    btnSave1: TsuiButton;
    btnBrower1: TsuiButton;
    suiButton6: TsuiButton;
    suiArrowButton1: TsuiArrowButton;
    suiButton7: TsuiButton;
    MemTab_listInPackage: TWideStringField;
    MemTab_listNotes: TWideStringField;
    suiButton2: TsuiButton;
    ds_Port1: TDataSource;
    Query_Port1: TADOQuery;
    dbFreightFeeLevel: TDBComboBox;
    labGoodsBoxFreight: TButton;
    labGoodsBoxFee: TButton;
    Query: TADOQuery;
    suiPageControl2: TsuiPageControl;
    suiTabSheet3: TsuiTabSheet;
    suiTabSheet4: TsuiTabSheet;
    DBGridCount: TDBGridEh;
    DBGridEh3: TDBGridEh;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    MemTab_listAutoCount: TBooleanField;
    q_Productinfo: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    MemTab_listProductName: TStringField;
    MemTab_listProductEnName: TStringField;
    MemTab_listProductPrice: TFloatField;
    DBGoodsBoxID: TDBComboBox;
    q_QuotebyProduct: TADOQuery;
    ds_QuotebyProduct: TDataSource;
    suiSideChannel1: TsuiSideChannel;
    Button1: TButton;
    VtChart1: TVtChart;
    CountStrGrid: TStringGrid;
    MemTab_listAmount: TFloatField;
    MemTab_listpackageUnit: TStringField;
    MemTab_listInPackageNum: TStringField;
    MemTab_listStereNum: TFloatField;
    MemTab_listNetWeight: TFloatField;
    MemTab_listTotalStereNum: TFloatField;
    MemTab_listTotalNetWeight: TFloatField;
    MemTab_listTotalGrossWeight: TFloatField;
    MemTab_listTotalMoney: TBCDField;
    MemTab_listOutpackageNum: TIntegerField;
    MemTab_listGrossWeight: TFloatField;
    MemTab_listpackageAmount: TIntegerField;
    MemTab_listTotalCommision: TBCDField;
    MemTab_listTotalProfitAmount: TBCDField;
    MemTab_listCountTotalStereNum: TAggregateField;
    MemTab_listCountTotalMoney: TAggregateField;
    MemTab_listCountTotalProfitAmount: TAggregateField;
    DBComboBox1: TDBComboBox;
    MemTab_listInpackageUnit: TStringField;
    MemTab_listOutPackage: TWideStringField;
    MemTab_listRepPrice: TWideStringField;
    Pop_DBGridCount: TsuiPopupMenu;
    N1: TMenuItem;
    cboxWeightVisible: TCheckBox;
    cboxCapacityVisible: TCheckBox;
    PrintGridReport: TPrintDBGridEh;
    MemTab_listAmountUnit: TStringField;
    MemTab_listPriceRate: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBrowerClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure DBLookupComboboxEh7Change(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure labGoodsBoxFreightClick(Sender: TObject);
    procedure labGoodsBoxFeeClick(Sender: TObject);
    procedure QueryChildPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBLookupComboboxEh5Change(Sender: TObject);
    procedure DBPriceItemChange(Sender: TObject);
    procedure DBPriceCoinChange(Sender: TObject);
    procedure DBLookupComboboxEh3Change(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBPriceCoinCloseUp(Sender: TObject; Accept: Boolean);
    procedure ds_QuotedPriceDataChange(Sender: TObject; Field: TField);
    procedure ds_QuotedPriceChildDataChange(Sender: TObject;
      Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure DBGoodsBoxIDChange(Sender: TObject);
    procedure DBGridEh3Columns5UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure N1Click(Sender: TObject);
    procedure cboxWeightVisibleClick(Sender: TObject);
    procedure cboxCapacityVisibleClick(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure DBGridCountColumns3EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure MemTab_listAutoCountChange(Sender: TField);
  private
        InsertFlag :boolean;
        CubageNum, WeightNum :integer;
        CountStereNum, CountGrossWeight:real;
        procedure initialize();
        procedure Get_BoxCountFee();
        procedure Update_CountPrice(ID:string; ProductPrice, PriceRate:real);
        procedure New_ini() ;
        procedure BatchUpdate_Price(Sender: TObject);
        procedure Set_VtChart(num1 :real; num2:integer);
        procedure Group_GoodsBox();
        procedure CountTotalNum(str:string);
        procedure Update_ReportPrice(Query:TADOQuery);
        procedure Chang_ReportPrice(Sender: TObject);
        procedure Query_ReportPrice();
  public
     TabID:string;
     procedure Query_ini(id:string);
     procedure Search_Ini(id:string);
     procedure Insert_QuotedPriceChild(ID, ParentID:string);
     procedure Update_QuotedPriceChild(ID, ParentID:string);
  end;

var
  QuotedPrice_frm: TQuotedPrice_frm;

implementation

uses DataModule, BasePage, QuotedPriceSel, QuotedPriceChildAdd, InfoAdd,
  ShipInfoAdd, ClientInfoSel;

{$R *.dfm}

procedure TQuotedPrice_frm.Query_ini(id:string);
var
    sqlstr, whsql:string;
    i:integer;
begin
  try
     if id <>'' then
     begin
        //whsql :=' where QuotedID='''+ id + '''';
        //Query_QuotedPrice.Close;
        //if  Query_QuotedPrice in

        Query_QuotedPrice.Filter :='QuotedID='''+ id + '''';
        Query_QuotedPrice.Edit;
        //Query_QuotedPrice.Open;
     end;

     MemTab_list.Close;
     {sqlstr :='select a.ProductID,a.QuotedID, AutoCount, ProductName, ProductEnName, AmountUnit, PriceRate, SalePrice, '+
        'FreightFee,IncidentalFee, InsuranceFee, CountPrice, ProfitRate, ProfitAmount, '+
        '(cstr(InPackageNum)+''/''+InPackage) as InPackage, (cstr(OutPackageNum)+''/''+OutPackage) as OutPackage,'''' as notes  from QuotedPriceChild as a '+
        'left join(select ProductID, ProductName, ProductEnName, AmountUnit, InPackageNum, '+
        '(select DictName from DictPackageUnit where DictID=ProductInfo.InPackageUnit) as InPackage, OutPackageNum, '+
        '(select DictName from DictPackageUnit where DictID=ProductInfo.OutPackageUnit) as OutPackage from ProductInfo)b on a.ProductID=b.ProductID '+
        ' where a.QuotedID=''' +Query_QuotedPrice.Fieldbyname('QuotedID').AsString+ '''';   }

     sqlstr :='select * from QuotedPriceChild where QuotedID=''' +Query_QuotedPrice.fieldbyname('QuotedID').AsString+ '''';
     Get_Query(QueryChild, sqlstr);
     MemTab_list.Open;

     //sqlstr :='select * from V_QuotebyProduct where QuotedID=''' +Query_QuotedPrice.fieldbyname('QuotedID').AsString+ '''';
     //Get_Query(q_QuotebyProduct, sqlstr);

     sqlstr:='select WeightNum,CubageNum from DictGoodsBox where DictName='''+ DBGoodsBoxID.text+ '''';
     //Writelog(sqlstr);
     try
       Get_Query(Query, sqlstr);
       if Query.RecordCount >0 then
       begin
         WeightNum :=Query.Fields[0].AsInteger;
         CubageNum :=Query.Fields[1].AsInteger; //DataModule_frm.Query_GoodsBox.FieldByName('CubageNum').AsFloat;
        //Writelog(inttostr(CubageNum));
       end;
     except
        on e:exception do
        begin
          Writelog('读取货柜运费出错'+e.Message);
          CubageNum :=0;
          WeightNum :=0;
        end;
     end;
     

  except
        on E: Exception do showmessage('数据查询出错:' +E.Message);
  end;

end;

procedure TQuotedPrice_frm.Search_Ini(id:string);
begin
  Query_ini(id);
  labGoodsBoxFreight.Caption :=DBGoodsBoxID.Text+'运费';
  labGoodsBoxFee.Caption :=DBGoodsBoxID.Text+'杂费';

  Group_GoodsBox();
end;
procedure TQuotedPrice_frm.initialize();
var   sqlstr, whsql, id:string;
begin

  DataModule_frm.Get_Dict();

  sqlstr :='select ProductID,ProductName,ProductEnName,ProductSpec,ProductEnSpec,FactoryID,BarCode,'+
    'ProductType,ProductPrice,PriceRate,AmountUnit as Units, (select DictName from DictAmountUnit where DictEnName=ProductInfo.AmountUnit)as AmountUnit,'+
    'OutPackageNum,OutPackageUnit,InPackageNum, '+
    'InPackageUnit,NetWeight,GrossWeight,SupplierID,LengthNum,WidthNum,HeightNum,StereNum from ProductInfo '+
    'where 1=1 ';
  Get_Query(q_Productinfo, sqlstr);

  sqlstr :='select * from ShipInfo ';
  Get_Query(Query_ShipInfo, sqlstr);

  sqlstr :='select * from DictPort where CountryID=(select DictID from DictCountry where DictEnName=''CHINA'') ';
  Get_Query(Query_Port1, sqlstr);
  DBGoodsBoxID.OnChange(NIL);
  //*****************设置列表
  CountStrGrid.Cells[0, 1] :='立方';
  CountStrGrid.Cells[0, 2] :='毛重';
  CountStrGrid.Cells[1, 0] :='合计';
  CountStrGrid.Cells[2, 0] :='已用';
  CountStrGrid.Cells[3, 0] :='可用';
  try
    sqlstr :='select * from QuotedPrice ';
    Query_QuotedPrice.Filter :='QuotedID=''''';
    Get_Query(Query_QuotedPrice, sqlstr);
    //Query_QuotedPrice.Open;
    Query_ini('');
  except
    on E: Exception do
    begin
      writelog('数据初始出错'+E.Message);
      showmessage('数据初始出错'+E.Message);
    end;
  end;
end;

procedure TQuotedPrice_frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (Query_QuotedPrice.State in [dsEdit, dsinsert]) or (MemTab_list.State in [dsEdit, dsinsert]) then
  begin
     if application.MessageBox(pchar('是否保存当前数据'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
     begin
        if  Query_QuotedPrice.State in [dsEdit, dsinsert] then
          Query_QuotedPrice.Post;
        if  MemTab_list.State in [dsEdit, dsinsert] then
          MemTab_list.Post;
     end;
  end;

end;

procedure TQuotedPrice_frm.FormCreate(Sender: TObject);
begin
  inherited;
//
end;

procedure TQuotedPrice_frm.FormShow(Sender: TObject);
var sqlstr:string;
begin
  inherited;
//
  initialize();
end;
//插入产品
procedure TQuotedPrice_frm.Insert_QuotedPriceChild(ID, ParentID:string);
var sqlstr:string;
    SalePrice, FreightFee, IncidentalNum, CapacityNum, IncidentalFee, InsuranceFee, CountPrice, ProfitAmount:real;
begin
  try
     {sqlstr:='select ProductID,ProductName,ProductEnName,ProductSpec,ProductEnSpec,FactoryID,BarCode,'+
    'ProductType,ProductPrice,(select USBRate from DictCurrencySort where DictEnName=ProductInfo.PriceRate)as PriceRate,'+
    '(select DictName from DictAmountUnit where DictID=ProductInfo.AmountUnit)as AmountUnit,'+
    'OutPackageNum,OutPackageUnit,InPackageNum, '+
    'InPackageUnit,NetWeight,GrossWeight,SupplierID,LengthNum,WidthNum,HeightNum,StereNum from ProductInfo where ProductID=''' + id + '''';
     Get_Query(Query, sqlstr);
     with MemTab_list do
     if Query.RecordCount >0 then }
     begin
        if MemTab_list.Active =false then exit;
        sqlstr :='select * from QuotedPriceChild where QuotedID='''+ParentID+''' and ProductID=''' +ID+ '''';
        if DoSql_Select(sqlstr)>0 then
        begin
           Application.MessageBox(pchar('此货品已经存在'), '提示信息', mb_ok+mb_iconinformation);
           exit;
        end;
        if MemTab_list.State <> dsInsert then
        begin
        end;
        MemTab_list.Append;
        MemTab_list.FieldByName('QuotedID').AsString :=ParentID;
        MemTab_list.FieldByName('AutoCount').AsBoolean:=true;
        //MemTab_list.FieldByName('ProductName').AsString :=Query.FieldByName('ProductName').AsString;
        //MemTab_list.FieldByName('ProductEnName').AsString :=Query.FieldByName('ProductEnName').AsString;
        //MemTab_list.FieldByName('AmountUnit').AsString :=Query.FieldByName('AmountUnit').AsString;
        Update_CountPrice(ID, 0, 0);
        MemTab_list.FieldByName('Amount').AsFloat :=1;
        CountTotalNum('1');  //计算总数据列
        MemTab_list.Post;
     end;
  except
     on E: Exception do writelog(E.Message);
  end;
end;

//修改产品
procedure TQuotedPrice_frm.Update_QuotedPriceChild(ID, ParentID:string);
var sqlstr:string;
begin
   sqlstr :='select * from QuotedPriceChild where QuotedID='''+ParentID+''' and ProductID=''' +ID+ '''';
   if DoSql_Select(sqlstr)>0 then
   begin
       Application.MessageBox(pchar('此货品已经存在'), '提示信息', mb_ok+mb_iconinformation);
       exit;
   end;
   MemTab_list.Edit;
   Update_CountPrice(ID, 0, 0);
   MemTab_list.Post;
end;

procedure TQuotedPrice_frm.Update_CountPrice(ID:string;ProductPrice, PriceRate:real);
var
    FreightFee, IncidentalNum, SalePrice, DollarRate, CapacityNum, IncidentalFee, InsuranceFee, CountPrice, ProfitAmount:real;
    sqlstr, CountPricestr:string;
    CountStereNum, CountGrossWeight:real;
    Boxnum,realBoxnum:integer;
begin
    CountPrice :=0;SalePrice:=0;  FreightFee:=0; IncidentalNum:=0;
    DollarRate:=0; IncidentalFee:=0;  ProfitAmount:=0;
    sqlstr:='select WeightNum,CubageNum from DictGoodsBox where DictName='''+ DBGoodsBoxID.text+ '''';
    //Writelog(sqlstr);
     try
     Get_Query(Query, sqlstr);
      if Query.RecordCount >0 then
      begin
         WeightNum :=Query.Fields[0].AsInteger;
         CubageNum :=Query.Fields[1].AsInteger; //DataModule_frm.Query_GoodsBox.FieldByName('CubageNum').AsFloat;
         //Writelog(inttostr(CubageNum));
      end;
    except
    on e:exception do
      begin
         Writelog('读取货柜运费出错'+e.Message);
          CubageNum :=0;
        WeightNum :=0;
      end;
    end;

    try
       sqlstr:='select ProductID,ProductName,ProductEnName,ProductSpec,ProductEnSpec,FactoryID,BarCode,'+
         'ProductType,ProductPrice,(select USBRate from DictCurrencySort where DictEnName=ProductInfo.PriceRate)as PriceRate,PriceRate as PriceEnRate,'+
        'ProductInfo.AmountUnit as Units,(select DictName from DictAmountUnit where DictEnName=ProductInfo.AmountUnit)as AmountUnit,'+
        'OutPackageNum,OutPackageUnit,InPackageNum, '+
        'InPackageUnit,NetWeight,GrossWeight,SupplierID,LengthNum,WidthNum,HeightNum,StereNum, Capacity20, Capacity40, Capacity40HQ from ProductInfo where ProductID=''' + id + '''';
      Get_Query(Query, sqlstr);
      if Query.RecordCount >0 then
      begin
        if ProductPrice <=0 then
        begin
          ProductPrice :=Query.FieldByName('ProductPrice').AsFloat;
          PriceRate :=Query.FieldByName('PriceRate').AsFloat;
        end;
        MemTab_list.FieldByName('ProductID').AsString :=ID;
        MemTab_list.FieldByName('PriceRate').AsFloat :=PriceRate;
        MemTab_list.FieldByName('ProductPrice').AsFloat :=ProductPrice;


        if DBGoodsBoxID.ItemIndex=0 then //20尺
        begin
           CapacityNum :=Query.FieldByName('Capacity20').AsFloat;
        end
        else if DBGoodsBoxID.ItemIndex=1 then //40尺
        begin
           CapacityNum :=Query.FieldByName('Capacity40').AsFloat;
        end
        else if DBGoodsBoxID.ItemIndex=2 then //40HQ
        begin
           CapacityNum :=Query.FieldByName('Capacity40HQ').AsFloat;
        end
        else
           CapacityNum :=1000;

        if Query_QuotedPrice.FieldByName('DollarRate').AsFloat >0 then
          DollarRate :=Query_QuotedPrice.FieldByName('DollarRate').AsFloat//报价汇率
        else      DollarRate :=1;
        
        if PriceRate =0 then PriceRate:=1;
        SalePrice :=ProductPrice / PriceRate * DollarRate;

        FreightFee :=Query_QuotedPrice.FieldByName('GoodsBoxCarriage').AsFloat / CapacityNum; //运费
        WriteLog('FreightFee='+floattostr(FreightFee));
        IncidentalFee :=(Query_QuotedPrice.FieldByName('GoodsBoxIE').AsFloat +Query_QuotedPrice.FieldByName('OtherFee').AsFloat) / CapacityNum ;//杂费
        InsuranceFee := SalePrice * (1 +0.1) *0.001;     //保险费

        MemTab_list.FieldByName('InsuranceFee').AsFloat :=InsuranceFee;
        MemTab_list.FieldByName('IncidentalFee').AsFloat :=IncidentalFee;

        MemTab_list.FieldByName('SalePrice').AsFloat :=SalePrice;  //销售价
        MemTab_list.FieldByName('FreightFee').AsFloat :=FreightFee; //运费
        MemTab_list.FieldByName('ProfitRate').AsFloat :=Query_QuotedPrice.FieldByName('ProfitRate').AsFloat; //利润率

        ProfitAmount :=Query_QuotedPrice.FieldByName('ProfitRate').AsFloat * SalePrice; //利润额
        MemTab_list.FieldByName('ProfitAmount').AsFloat :=ProfitAmount;
        if MemTab_list.FieldByName('AutoCount').AsBoolean =True then
        begin
           if DBPriceItem.Text ='FOB' then
           begin
             CountPrice :=SalePrice + IncidentalFee + ProfitAmount ; //产品单价×报价货币＋杂费（其它费用）＋利润额×价格折扣×报价货币
           end
           else if DBPriceItem.Text ='CIF' then
           begin
             CountPrice :=SalePrice + FreightFee + IncidentalFee + InsuranceFee + ProfitAmount ; //CIF价＝产品单价×报价货币＋运费＋杂费（其它费用）＋保险费＋利润额×价格折扣
           end
           else if DBPriceItem.Text ='C&F' then
           begin
             CountPrice :=SalePrice + FreightFee + IncidentalFee + ProfitAmount ; //C&F价＝产品单价×报价货币＋运费＋杂费（其它费用）＋利润额×价格折扣
           end ;
           MemTab_list.FieldByName('CountPrice').AsFloat :=CountPrice;
        end
        else
           MemTab_list.FieldByName('CountPrice').AsFloat :=0;
        Update_ReportPrice(Query);
      end;
    except
        on E: Exception do
        WriteLog('修改数据出错.' +E.Message);
        //showmessage('修改数据出错.' +E.Message);

    end;
end;
procedure TQuotedPrice_frm.Update_ReportPrice(Query:TADOQuery);
var PriceEnRate, Units, CountPricestr, notes:string;
begin
  if Query.Active then
  begin
    try
      PriceEnRate :=Query.FieldByName('PriceEnRate').AsString;
      Units :=Query.FieldByName('Units').AsString;
      MemTab_list.FieldByName('OutPackage').AsString :=Query.FieldByName('OutPackageNum').AsString+Query.FieldByName('Units').AsString+'/'+Query.FieldByName('OutPackageUnit').AsString;
      MemTab_list.FieldByName('InPackage').AsString :=Query.FieldByName('InPackageNum').AsString+Query.FieldByName('Units').AsString+'/'+Query.FieldByName('InPackageUnit').AsString;
      notes :=Format('%dX%dX%d=%f ',
          [Query.FieldByName('LengthNum').AsInteger,
            Query.FieldByName('WidthNum').AsInteger,
            Query.FieldByName('HeightNum').AsInteger,
            Query.FieldByName('StereNum').AsFloat, WeightNum,
            MemTab_list.FieldByName('PackageAmount').AsInteger]);
      //writelog('CapacityVisible='+Query_QuotedPrice.FieldByName('CapacityVisible').AsString);
      //writelog('WeightVisible='+Query_QuotedPrice.FieldByName('WeightVisible').AsString);
      if (Query_QuotedPrice.FieldByName('CapacityVisible').AsBoolean) then
      begin
         notes :=notes + Format('1X%d''=%d ',[CubageNum, MemTab_list.FieldByName('PackageAmount').AsInteger]);
      end;
      if (Query_QuotedPrice.FieldByName('WeightVisible').AsBoolean) then
      begin
         notes :=notes + Format('GW:%.1f NW:%.1f',[Query.FieldByName('GrossWeight').AsFloat, Query.FieldByName('NetWeight').AsFloat]);
      end;
      MemTab_list.FieldByName('Notes').AsString :=notes;
      //writelog(notes);
      CountPricestr :=format('%.'+Query_QuotedPrice.FieldByName('PricePrecision').AsString+'f', [MemTab_list.FieldByName('CountPrice').AsFloat]);
      //MemTab_list.FieldByName('RepPrice').AsString :=Format('%s %.(%d)f/%s', [PriceEnRate, Query_QuotedPrice.FieldByName('PricePrecision').AsString, MemTab_list.FieldByName('CountPrice').AsFloat, Units]);
      MemTab_list.FieldByName('RepPrice').AsString :=PriceEnRate +CountPricestr+'/'+ Units;
    except
      on E: Exception do writelog('数据查询出错:' +E.Message);
    end;
  end;
end;
procedure TQuotedPrice_frm.Group_GoodsBox();
var sqlstr:string;
    Boxnum,realBoxnum:integer;
begin
     try
       IF CubageNum <=0 then exit;
       sqlstr :='select count(1), sum(TotalStereNum) as CountStereNum, sum(TotalGrossWeight) as CountGrossWeight, sum(TotalNetWeight), sum(TotalMoney), sum(TotalProfitAmount) from QuotedPriceChild '+
          'where QuotedID=''' +Query_QuotedPrice.fieldbyname('QuotedID').AsString+ ''' ';
       Get_Query(Query, sqlstr);
       if Query.RecordCount >0 then
       begin
         CountStereNum :=Query.Fields[1].AsFloat;
         CountGrossWeight :=Query.Fields[2].AsFloat;
         //WriteLog('Query.Fields[1].asstring='+Query.Fields[1].asstring);
         //WriteLog('Query.Fields[1].AsFloat='+Floattostr(CountStereNum));
         
         if ((round(CountStereNum) mod CubageNum)=0) and (CountStereNum=round(CountStereNum)) then
           Boxnum:= round(CountStereNum) div CubageNum
         else
           Boxnum:=round(CountStereNum) div CubageNum +1;
         //计算立方数
         CountStrGrid.Cells[1,1] :=Floattostr(Boxnum * CubageNum);
         CountStrGrid.Cells[2,1] :=Floattostr(CountStereNum);
         CountStrGrid.Cells[3,1] :=Floattostr(Boxnum * CubageNum - CountStereNum);

         //计算毛重
         CountStrGrid.Cells[1,2] :=Floattostr(Boxnum * WeightNum);
         CountStrGrid.Cells[1,2] :=Floattostr(CountGrossWeight);
         CountStrGrid.Cells[1,2] :=Floattostr(Boxnum * WeightNum -CountGrossWeight);
         WriteLog('WeightNum='+floattostr(WeightNum));

         Set_VtChart(CountStereNum, CubageNum);
         //txtCountStereNum.Text :=Query.Fields[1].AsString;
         //txtCountStereNum.Text :=Query.Fields[1].AsString;
         //txtCountStereNum.Text :=Query.Fields[1].AsString;
      end;
    except
        on E: Exception do showmessage('数据查询出错:' +E.Message);
    end;
end;

procedure TQuotedPrice_frm.btnAddClick(Sender: TObject);
var sqlstr, maxid:string;
begin
  inherited;
   InsertFlag := false;
   {Application.CreateForm(TInfoAdd_frm, InfoAdd_frm) ;
   InfoAdd_frm.GroupList[0] :='增加报价单';
   InfoAdd_frm.GroupList[1] :='增加报价货品';
   InfoAdd_frm.ShowModal; }

   application.CreateForm(TQuotedPriceChildAdd_frm, QuotedPriceChildAdd_frm);
   if Query_QuotedPrice.Active =false then
   begin
     try
       maxid :=Get_QuotedPriceID('QuotedPrice');
       Query_ini(maxid);
       Query_QuotedPrice.Append;
       Query_QuotedPrice.FieldByName('QuotedID').AsString :=maxid;
       InsertFlag := true;
       btnSave.Enabled :=true;

       //MemTab_list.Append;
       //MemTab_list.FieldByName('QuotedID').AsString :=Query_QuotedPrice.fieldbyname('QuotedID').AsString;
       btnSave.Enabled :=true;
     except
        on E: Exception do showmessage('数据索引出错.' +E.Message);
     end;
   end;
   QuotedPriceChildAdd_frm.ShowModal;
   QuotedPriceChildAdd_frm.Free;
end;

procedure TQuotedPrice_frm.btnSelectClick(Sender: TObject);
begin
  inherited;
//
  application.CreateForm(TQuotedPriceSel_frm, QuotedPriceSel_frm);
  QuotedPriceSel_frm.ShowModal;
  QuotedPriceSel_frm.Free;


end;

procedure TQuotedPrice_frm.btnDeleteClick(Sender: TObject);
var sqlstr, id:string;
begin
  inherited;
   InsertFlag := false;
   Application.CreateForm(TShipInfoAdd_frm, ShipInfoAdd_frm) ;
   ShipInfoAdd_frm.ShowModal;
   if ShipInfoAdd_frm.AddValue ='1' then
   begin
     try
       Query_QuotedPrice.Delete;
       Query_QuotedPrice.Post;
       MemTab_list.Delete;
       MemTab_list.Post;
       Query_ini('000');
     except
        on E: Exception do showmessage('数据索引出错.' +E.Message);
     end;
   end
   else if ShipInfoAdd_frm.AddValue ='2' then
   begin
       MemTab_list.Delete;
       //MemTab_list.Post;
   end;
   ShipInfoAdd_frm.Free;
end;

procedure TQuotedPrice_frm.btnSaveClick(Sender: TObject);
var Insertnum, Updatenum:integer;
begin
   inherited;
//
   Insertnum :=0;
   Updatenum :=0;
   if Query_QuotedPrice.State in[dsInsert] then
   begin
      try
        Query_QuotedPrice.Post;
        Insertnum :=Insertnum +1;
      except
        on ex :exception do showmessage(ex.Message);
      end;
   end
   else if Query_QuotedPrice.State=dsedit then
   begin
     try
        Query_QuotedPrice.Post;
        Updatenum :=Updatenum +1;
        btnsave.Enabled :=false;
     except
        on ex :exception do showmessage(ex.Message);
     end;
   end;
  
   if MemTab_list.State in[dsInsert] then
   begin
      try
        Query_QuotedPrice.Post;
        MemTab_list.UpdateRecord;
        MemTab_list.Post;
        MemTab_list.ApplyUpdates(-1);
        //Insertnum :=Insertnum +1;
      except
        on ex :exception do showmessage(ex.Message);
      end;
   end
   else if MemTab_list.State=dsedit then
   begin
     try
        MemTab_list.UpdateRecord;
        MemTab_list.Post;
        MemTab_list.ApplyUpdates(-1);
        btnSave.Enabled :=false;
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

procedure TQuotedPrice_frm.btnBrowerClick(Sender: TObject);
begin
  inherited;
//
 
  PrintGridReport.Preview;
end;

procedure TQuotedPrice_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
  CLOSE();
end;

procedure TQuotedPrice_frm.DBLookupComboboxEh7Change(Sender: TObject);
var sqlstr:string;
begin
  inherited;
//
  {sqlstr :='select StartPort, b.DicName as StartName, b.DicEnName as StartEnName, b.CountryID as StartCountry '+
        'from ShipInfoPrice as a '+
        ' left join(select DicID, DicName, DicEnName,CountryID from DictPort) as b on a.StartPort=b.DicID '+
        ' where ShipID='''+Query_ShipInfo.Fieldbyname('ShipID').AsString+ ''' '+
        ' group by StartPort, b.DicName, b.DicEnName, b.CountryID';
  Get_Query(Query_Port1, sqlstr);

  sqlstr :='select EndPort, c.DicName as EndName, c.DicEnName as EndEnName, c.CountryID as EndCountry from ShipInfoPrice as a '+
        ' left join(select DicID, DicName, DicEnName,CountryID from DictPort) as c on a.EndPort=c.DicID '+
        ' where ShipID='''+Query_ShipInfo.Fieldbyname('ShipID').AsString+''''+
        ' group by EndPort, c.DicName, c.DicEnName, c.CountryID';
  Get_Query(Query_Port2, sqlstr); }

end;

procedure TQuotedPrice_frm.Get_BoxCountFee();
var sqlstr:string;
begin //计算货柜运费,杂费.
  try
     sqlstr :='select * from ShipInfoPrice as a '+
        ' where ShipID='''+Query_ShipInfo.Fieldbyname('ShipID').AsString+''''+
        ' and StartPort='''+Query_Port1.Fieldbyname('DictEnName').AsString+''''+
        ' and EndPort='''+Query_Port2.Fieldbyname('DictEnName').AsString+'''';
        Writelog(sqlstr);
     Get_Query(Query, sqlstr);
     if   Query.RecordCount >0 then
     begin
        if DBGoodsBoxID.ItemIndex =0 then   //20尺
        begin
           if dbFreightFeeLevel.Text ='一级' then
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD20_1').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB20_1').AsString;
           end
           else
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD20_2').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB20_2').AsString;
           end;
        end
        else if DBGoodsBoxID.ItemIndex =1 then    //40尺
        begin
           if dbFreightFeeLevel.Text ='一级' then
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD40_1').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB40_1').AsString;
           end
           else
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD40_2').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB40_2').AsString;
           end;
        end
        else if DBGoodsBoxID.ItemIndex =2 then  //40HQ
        begin
           if dbFreightFeeLevel.Text ='一级' then
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD40HQ_1').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB40HQ_1').AsString;
           end
           else
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD40HQ_2').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB40HQ_2').AsString;
           end;
        end
        else if DBGoodsBoxID.ItemIndex =3 then //散货
        begin
           if dbFreightFeeLevel.Text ='一级' then
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD00_1').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB00_1').AsString;
           end
           else
           begin
              Query_QuotedPrice.Fieldbyname('GoodsBoxCarriage').AsString :=Query.fieldbyname('PriceUSD00_2').AsString;
              Query_QuotedPrice.Fieldbyname('GoodsBoxIE').AsString :=Query.fieldbyname('PriceRMB00_2').AsString;
           end;
        end
     end;
  except
    on e:exception do
    begin
      Writelog('计算货柜运费,杂费出错:'+e.Message);
      showmessage('计算货柜运费,杂费出错:');
    end;
  end;
end;

procedure TQuotedPrice_frm.btnNewClick(Sender: TObject);
var maxid, sqlstr:string;
begin
  inherited;
//
   try
       maxid :=Get_QuotedPriceID('QuotedPrice');
       Query_ini(maxid);

       Query_QuotedPrice.Append;
       Query_QuotedPrice.FieldByName('QuotedID').AsString :=maxid;
       Query_QuotedPrice.FieldByName('Creator').AsString :=User_ID;
       New_ini();
       InsertFlag := true;
       btnSave.Enabled :=true;

       //MemTab_list.Append;
       //MemTab_list.FieldByName('QuotedID').AsString :=Query_QuotedPrice.fieldbyname('QuotedID').AsString;
   except
        on E: Exception do showmessage('数据索引出错.' +E.Message);
   end;
end;

procedure TQuotedPrice_frm.suiButton2Click(Sender: TObject);
begin
  inherited;
//
  if Query_QuotedPrice.Active then
  begin
     application.CreateForm(TClientInfoSel_frm, ClientInfoSel_frm);
     ClientInfoSel_frm.DataType :='1';
     ClientInfoSel_frm.ShowModal;
     if ClientInfoSel_frm.Flag then
     begin
        Query_QuotedPrice.FieldByName('ClientID').AsString:= ClientInfoSel_frm.Query.FieldByName('ClientID').AsString;
        txtClientName.Text:= ClientInfoSel_frm.Query.FieldByName('ClientName').AsString;
     end;
     ClientInfoSel_frm.Free;
  end;
end;

procedure TQuotedPrice_frm.Label3Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TQuotedPrice_frm.Label5Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TQuotedPrice_frm.Label19Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TQuotedPrice_frm.labGoodsBoxFreightClick(Sender: TObject);
begin
  inherited;
//
  Get_BoxCountFee();
  BatchUpdate_Price(nil);
end;

procedure TQuotedPrice_frm.labGoodsBoxFeeClick(Sender: TObject);
begin
  inherited;
//
    Get_BoxCountFee();
    BatchUpdate_Price(nil);
end;

procedure TQuotedPrice_frm.QueryChildPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
//
  MemTab_list.Delete;
end;

procedure TQuotedPrice_frm.DBLookupComboboxEh5Change(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  {sqlstr :='select * from DictCountry where DictID='''+Query_Port2.FieldByName('EndCountry').AsString+ '''';
  Get_Query(DataModule_frm.Query_Country, sqlstr);
   }

end;

procedure TQuotedPrice_frm.DBPriceItemChange(Sender: TObject);
begin
  inherited;     //FOB  CIF  C&F
  if DBPriceItem.Text ='FOB' then
  begin
     DBGridCount.Columns[10].Title.caption :='FOB价';
     DBGridCount.Columns[12].Visible :=false;
     DBGridCount.Columns[13].Visible :=false;
  end
  else if DBPriceItem.Text ='CIF' then
  begin
     DBGridCount.Columns[10].Title.caption :='CIF价';
     DBGridCount.Columns[12].Visible :=true;
     DBGridCount.Columns[13].Visible :=true;
  end
  else if DBPriceItem.Text ='C&F' then
  begin
     DBGridCount.Columns[10].Title.caption :='C&F价';
     DBGridCount.Columns[12].Visible :=true;
     DBGridCount.Columns[13].Visible :=false;
  end ;
  BatchUpdate_Price(nil);
end;

procedure TQuotedPrice_frm.New_ini();
begin
   if Query_QuotedPrice.Active then
   begin
     try
       Query_QuotedPrice.FieldByName('PriceItem').AsString :='FOB';
       DataModule_frm.Query_CurrencySort.First;
       Query_QuotedPrice.FieldByName('PriceCoin').AsString :=DataModule_frm.Query_CurrencySort.fieldbyname('DictCode').AsString;
       DBPriceCoin.OnCloseUp(nil, true);
       DataModule_frm.Query_GoodsBox.First;
       Query_QuotedPrice.FieldByName('GoodsBoxID').AsString :='20尺柜';
       DBGoodsBoxID.OnChange(nil);
       Query_QuotedPrice.FieldByName('GoodsBoxCarriage').AsFloat :=0;
       Query_QuotedPrice.FieldByName('GoodsBoxIE').AsFloat :=0;
       Query_QuotedPrice.FieldByName('InsuranceRate').AsFloat :=0;
       Query_QuotedPrice.FieldByName('CommisionRate').AsFloat :=0;
       Query_QuotedPrice.FieldByName('OtherFee').AsFloat :=0;
       Query_QuotedPrice.FieldByName('ProfitRate').AsFloat :=0;
       Query_QuotedPrice.FieldByName('PriceDiscount').AsFloat :=100;
       
       //ds_QuotedPriceChild
     except
        on E: Exception do WriteLog('数据索引出错.' +E.Message);
     end;
   end;
end;

procedure TQuotedPrice_frm.DBPriceCoinChange(Sender: TObject);
begin
  inherited;
//
end;

procedure TQuotedPrice_frm.DBLookupComboboxEh3Change(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  sqlstr :='select * from DictPort where CountryID='''+DataModule_frm.Query_Country.FieldByName('DictID').AsString+ '''';
  Get_Query(Query_Port2, sqlstr);

end;

procedure TQuotedPrice_frm.BatchUpdate_Price(Sender: TObject);
var sqlstr:string;
   i:integer;
begin
  if MemTab_list.Active then
  begin
    if MemTab_list.RecordCount >0 then
      MemTab_list.First;
    for i:=0 to MemTab_list.RecordCount -1 do
    begin
      MemTab_list.Edit;
      Update_CountPrice(MemTab_list.FieldByName('ProductID').AsString, MemTab_list.FieldByName('ProductPrice').AsFloat, MemTab_list.FieldByName('PriceRate').AsFloat);
      if MemTab_list.FieldByName('Amount').AsFloat >0 then
        CountTotalNum(MemTab_list.FieldByName('Amount').AsString);  //计算总数据列
      MemTab_list.Next;
    end; 
  end;
end;
procedure TQuotedPrice_frm.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  BatchUpdate_Price(nil);
end;

procedure TQuotedPrice_frm.DBPriceCoinCloseUp(Sender: TObject;
  Accept: Boolean);
begin
  inherited;
  if ds_QuotedPrice.State in[dsInsert, dsEdit] then
    Query_QuotedPrice.FieldByName('DollarRate').AsString:=DataModule_frm.Query_CurrencySort.FieldByName('USBRate').AsString;

end;

procedure TQuotedPrice_frm.ds_QuotedPriceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ds_QuotedPrice.State in[dsInsert, dsEdit] then
  btnSave.Enabled :=true;
end;

procedure TQuotedPrice_frm.ds_QuotedPriceChildDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ds_QuotedPriceChild.State in[dsInsert, dsEdit] then
  btnSave.Enabled :=true;
end;

// 设置尺量图
procedure TQuotedPrice_frm.Set_VtChart(num1 :real; num2:integer);
var i, col:integer;
begin
   if ((trunc(num1) mod num2)=0) and (num1=trunc(num1)) then
       col:= trunc(num1) div num2
   else
       col:=trunc(num1) div num2 +1;
       
   if col <1 then col :=1 ;

   VtChart1.RowCount :=1;
   VtChart1.ColumnCount :=col;
   for i:=1 to col do
   begin
     if (i=col) then
     begin
        VtChart1.Column :=i;
        VtChart1.Data :=Floattostr(num1- ((col-1) * num2));
        VtChart1.TitleText :='柜'+Inttostr(i);
     end
     else
     begin
        VtChart1.Column :=i;
        VtChart1.Data :=Inttostr(num2);
        VtChart1.TitleText :='柜'+Inttostr(i);
     end;
   end;
end;
procedure TQuotedPrice_frm.Button1Click(Sender: TObject);
begin
  inherited;
  //Set_VtChart();
end;

procedure TQuotedPrice_frm.DBGoodsBoxIDChange(Sender: TObject);
var sqlstr:string;
begin
  inherited;
//
  if Query_QuotedPrice.Active then
  begin
    labGoodsBoxFreight.Caption :=DBGoodsBoxID.Text+'运费';
    labGoodsBoxFee.Caption :=DBGoodsBoxID.Text+'杂费';

     sqlstr:='select WeightNum,CubageNum from DictGoodsBox where DictName='''+ DBGoodsBoxID.text+ '''';
     //Writelog(sqlstr);
     try
       Get_Query(Query, sqlstr);
       if Query.RecordCount >0 then
       begin
         WeightNum :=Query.Fields[0].AsInteger;
         CubageNum :=Query.Fields[1].AsInteger; //DataModule_frm.Query_GoodsBox.FieldByName('CubageNum').AsFloat;
         //Writelog('货柜容量:'+inttostr(CubageNum));
       end;
     except
        on e:exception do
        begin
          Writelog('读取货柜运费出错'+e.Message);
          CubageNum :=0;
          WeightNum :=0;
        end;
     end;
    BatchUpdate_Price(nil);
  end;

end;
//修改数量时, 统计数据.
procedure TQuotedPrice_frm.CountTotalNum(str:string);
var value0,value1:real;
    packagenum:integer;
begin
  inherited;
  try
    value0 :=strtofloat(str);
    value1 :=value0 / MemTab_list.FieldByName('OutpackageNum').AsFloat;
    if (value1 =round(value1)) then
    begin
      packagenum :=round(value1) ;
    end
    else
      packagenum :=round(value1) +1  ;
    MemTab_list.FieldByName('PackageAmount').AsInteger :=packagenum;   //外包装数量
    MemTab_list.FieldByName('TotalStereNum').AsFloat :=packagenum * MemTab_list.FieldByName('StereNum').AsFloat;
    MemTab_list.FieldByName('TotalMoney').AsFloat :=value0 * MemTab_list.FieldByName('CountPrice').AsFloat;
    MemTab_list.FieldByName('TotalNetWeight').AsFloat :=packagenum * MemTab_list.FieldByName('NetWeight').AsFloat;
    MemTab_list.FieldByName('TotalGrossWeight').AsFloat :=packagenum * MemTab_list.FieldByName('GrossWeight').AsFloat;
    MemTab_list.FieldByName('TotalProfitAmount').AsFloat :=packagenum * MemTab_list.FieldByName('ProfitAmount').AsFloat;
    //MemTab_list.FieldByName('TotalCommision').AsFloat :=packagenum * MemTab_list.FieldByName('Commision').AsFloat;
  except
  end;

end;
procedure TQuotedPrice_frm.DBGridEh3Columns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  CountTotalNum(text);
  Query_ReportPrice();
end;

procedure TQuotedPrice_frm.N1Click(Sender: TObject);
begin
  inherited;
//
  try 
     MemTab_list.Delete;
     MemTab_list.Post;
  except
  end;
  MemTab_list.Close;
  MemTab_list.Open;

end;

procedure TQuotedPrice_frm.Query_ReportPrice();
var sqlstr:string;
begin
      try
        sqlstr:='select ProductID,ProductName,ProductEnName,ProductSpec,ProductEnSpec,FactoryID,BarCode,'+
          'ProductType,ProductPrice,(select USBRate from DictCurrencySort where DictEnName=ProductInfo.PriceRate)as PriceRate,PriceRate as PriceEnRate,'+
          '(select DictName from DictAmountUnit where DictEnName=ProductInfo.AmountUnit)as AmountUnit,AmountUnit as Units,'+
          'OutPackageNum,OutPackageUnit,InPackageNum, '+
          'InPackageUnit,NetWeight,GrossWeight,SupplierID,LengthNum,WidthNum,HeightNum,StereNum, Capacity20, Capacity40, Capacity40HQ from ProductInfo where ProductID=''' + MemTab_list.fieldbyname('ProductID').AsString + '''';
        Get_Query(Query, sqlstr);
        if Query.RecordCount >0 then
           Update_ReportPrice(Query);
      except
        on e:exception do
          writelog(e.Message);
      end;
end;

procedure TQuotedPrice_frm.Chang_ReportPrice(Sender: TObject);
var sqlstr:string;
   i:integer;
begin
  if MemTab_list.Active then
  begin
    if MemTab_list.RecordCount >0 then
      MemTab_list.First;
    for i:=0 to MemTab_list.RecordCount -1 do
    begin
      MemTab_list.Edit;
      Query_ReportPrice();
      MemTab_list.Next;
    end;
  end;

end;

procedure TQuotedPrice_frm.cboxWeightVisibleClick(Sender: TObject);
begin
  inherited;
  if Query_QuotedPrice.Active then
  begin
     Query_QuotedPrice.Edit;
     Query_QuotedPrice.FieldByName('WeightVisible').AsBoolean :=cboxWeightVisible.Checked;
     Query_QuotedPrice.Post;
     Chang_ReportPrice(nil);
  end;
end;

procedure TQuotedPrice_frm.cboxCapacityVisibleClick(Sender: TObject);
begin
  inherited;
  if Query_QuotedPrice.Active then
  begin
     Query_QuotedPrice.Edit;
     Query_QuotedPrice.FieldByName('CapacityVisible').AsBoolean :=cboxCapacityVisible.Checked;
     Query_QuotedPrice.Post;
     Chang_ReportPrice(nil);
  end;

end;

procedure TQuotedPrice_frm.DBComboBox1Change(Sender: TObject);
begin
  inherited;
  Chang_ReportPrice(nil);

end;
//产品名称单击进行修改
procedure TQuotedPrice_frm.DBGridCountColumns3EditButtonClick(
  Sender: TObject; var Handled: Boolean);
begin
  inherited;
   application.CreateForm(TQuotedPriceChildAdd_frm, QuotedPriceChildAdd_frm);
   QuotedPriceChildAdd_frm.Flag :='1';
   QuotedPriceChildAdd_frm.ShowModal;
   QuotedPriceChildAdd_frm.Free;

end;

procedure TQuotedPrice_frm.MemTab_listAutoCountChange(Sender: TField);
begin
  inherited;
  Update_CountPrice(MemTab_list.FieldByName('ProductID').AsString, 0, 0);

end;

end.
