unit QuotedPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIPageControl, SUITabControl,
  SUIGroupBox, SUIImagePanel, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, DBCtrls, SUIButton, GridsEh, ComCtrls, SUIStatusBar, DB,
  ADODB, MemTableDataEh, DataDriverEh, MemTableEh, Grids, DBGrids,
  EStringGrid, BaseGrid, AdvGrid;

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
    DBLookupComboboxEh4: TDBLookupComboboxEh;
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
    MemTab_listProductName: TWideStringField;
    MemTab_listProductEnName: TWideStringField;
    MemTab_listAmountUnit: TWideStringField;
    MemTab_listPriceRate: TFloatField;
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
    DBEdit12: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label24: TLabel;
    txtClientName: TEdit;
    DBGridEh2: TDBGridEh;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
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
    MemTab_listOutPackage: TWideStringField;
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
    StrGrid: TStringGrid;
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
    procedure dbGoodsBoxChange(Sender: TObject);
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
    procedure DBLookupComboboxEh4Change(Sender: TObject);
    procedure DBLookupComboboxEh3Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure StrGridDblClick(Sender: TObject);
    procedure StrGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
  private
        InsertFlag :boolean;
        procedure initialize();
        procedure Get_BoxCountFee();
        procedure Update_CountPrice(SalePrice, PriceRate, Capacity20, Capacity40, Capacity40HQ:real; rownum:integer);
        procedure BatchUpdate_CountPrice() ;  //批量修改统计金额.
        function Row_CountPrice(CapacityNum, Colnum, Rownum:integer; FeeNum:real):boolean;
        function  Exit_ProductID(id:string):boolean;
        procedure Save_PriceChild(id:string);
  public
     TabID:string;
     procedure Query_ini(id:string);
     procedure Insert_QuotedPriceChild(ID, ParentID:string; RowNum:integer);
  end;

var
  QuotedPrice_frm: TQuotedPrice_frm;

implementation

uses DataModule, BasePage, QuotedPriceSel, QuotedPriceChildAdd, InfoAdd,
  ShipInfoAdd, BasePageForm, ClientInfoSel;

{$R *.dfm}

procedure TQuotedPrice_frm.Query_ini(id:string);
var
    sqlstr, whsql:string;
begin
  try
     if id <>'' then
     begin
        whsql :=' where QuotedID='''+ id + '''';
     end;
     sqlstr :='select * from QuotedPrice '+whsql;
     Get_Query(Query_QuotedPrice, sqlstr);

     //MemTab_list.Close;
     {sqlstr :='select a.ProductID,a.QuotedID, AutoCount, ProductName, ProductEnName, AmountUnit, PriceRate, SalePrice, '+
        'FreightFee,IncidentalFee, InsuranceFee, CountPrice, ProfitRate, ProfitAmount, '+
        '(cstr(InPackageNum)+''/''+InPackage) as InPackage, (cstr(OutPackageNum)+''/''+OutPackage) as OutPackage,'''' as notes  from QuotedPriceChild as a '+
        'left join(select ProductID, ProductName, ProductEnName, AmountUnit, InPackageNum, '+
        '(select DictName from DictPackageUnit where DictID=ProductInfo.InPackageUnit) as InPackage, OutPackageNum, '+
        '(select DictName from DictPackageUnit where DictID=ProductInfo.OutPackageUnit) as OutPackage from ProductInfo)b on a.ProductID=b.ProductID '+
        ' where a.QuotedID=''' +Query_QuotedPrice.Fieldbyname('QuotedID').AsString+ ''''; }
        
     {sqlstr :='select * from V_QuotedPriceChild where QuotedID=''' +Query_QuotedPrice.Fieldbyname('QuotedID').AsString+ '''';
     Get_Query(QueryChild, sqlstr);
     MemTab_list.Open;}
  except
        on E: Exception do showmessage('数据查询出错:' +E.Message);
  end;
end;

procedure TQuotedPrice_frm.initialize();
var   sqlstr, whsql, id:string;
begin
  with StrGrid do
  begin
    cells[0,0]:='';
    cells[1,0]:='';
    cells[2,0]:='货号';
    cells[3,0]:='中文名称';
    cells[4,0]:='英文名称';
    cells[5,0]:='数量单位';
    cells[6,0]:='报价汇率';
    cells[7,0]:='出售价';
    cells[8,0]:='合计单价';
    cells[9,0]:='杂费';
    cells[10,0]:='运输费';
    cells[11,0]:='保险费';
    cells[12,0]:='利润率';
    cells[13,0]:='利润额';
  end;  
  DataModule_frm.Get_Dict();

  sqlstr :='select * from ShipInfo ';
  Get_Query(Query_ShipInfo, sqlstr);
  
  sqlstr :='select * from DictPort where CountryID=(select DictID from DictCountry where DictEnName=''CHINA'') ';
  Get_Query(Query_Port1, sqlstr);

  Query_ini('');
end;

procedure TQuotedPrice_frm.FormClose(Sender: TObject; var Action: TCloseAction);
var sqlstr,QuotedID:string;
begin
  inherited;
  if (Query_QuotedPrice.State in [dsEdit, dsinsert]) then
  begin
     if application.MessageBox(pchar('是否保存当前数据'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
     begin
       try
         DataModule_frm.ADOConnection1.BeginTrans;
         Save_PriceChild(Query_QuotedPrice.fieldbyname('QuotedID').AsString);
         Query_QuotedPrice.Post;
       except
        on ex :exception do
        begin
           DataModule_frm.ADOConnection1.RollbackTrans;
           showmessage(ex.Message);
           exit;
        end;
       end;
     end
     else
     begin
       {try
         Query_QuotedPrice.Close;
         QueryChild.Close;
         sqlstr :='select * from QuotedPrice where QuotedID='''+ QuotedID +'''';
         showmessage(sqlstr);
         if (DoSql_Select(sqlstr)= 0) then
         begin
           sqlstr :='delete from QuotedPriceChild where QuotedID='''+ QuotedID +'''';
           showmessage(sqlstr);
           dosql(sqlstr);
         end;
         exit;
       except
           exit;

       end;}
     end;
     //if  MemTab_list.State in [dsEdit, dsinsert] then
     //   MemTab_list.Post;
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


function TQuotedPrice_frm.Exit_ProductID(id:string):boolean;
var i:integer;
begin
   result :=false;
   for i:=1 to StrGrid.RowCount do
   begin
      if (StrGrid.Cells[2, i] = id) then
      begin
        result :=true;
        break;
      end;
   end;
end;
//插入产品
procedure TQuotedPrice_frm.Insert_QuotedPriceChild(ID, ParentID:string; RowNum:integer);
var sqlstr:string;
    SalePrice, FreightFee, IncidentalNum, CapacityNum, IncidentalFee, InsuranceFee, CountPrice, ProfitAmount:real;
    i,j:integer;
    PriceRate:real;
begin
  try
     //j :=StrGrid.RowCount-1;
     if id ='' then exit;
     sqlstr:='select * from ProductInfo where ProductID=''' + id + '''';
     Get_Query(Query, sqlstr);
     if Query.RecordCount >0 then
     begin
        if Exit_ProductID(ID) then
        begin
           Application.MessageBox(pchar('此货品已经存在'), '提示信息', mb_ok+mb_iconinformation);
           exit;
        end;
        StrGrid.Cells[1, RowNum] :=inttostr(RowNum);
        StrGrid.Cells[2, RowNum] :=id;
        StrGrid.Cells[3, RowNum] :=Query.FieldByName('ProductName').AsString;
        StrGrid.Cells[4, RowNum] :=Query.FieldByName('ProductEnName').AsString;
        StrGrid.Cells[5, RowNum] :=Query.FieldByName('AmountUnit').AsString;
        if Query.FieldByName('PriceRate').AsString ='0' then
          StrGrid.Cells[6, RowNum] :='0'
        else
          StrGrid.Cells[6, RowNum] :=Query.FieldByName('PriceRate').AsString;   //报价货币
        StrGrid.Cells[7, RowNum] :=Query.FieldByName('AmountUnit').AsString;  //采购单价
        StrGrid.Cells[8, RowNum] :=Query.FieldByName('SalePrice').AsString;   //出售价
        {StrGrid.Cells[8, j] :=Query.FieldByName('CountPrice').AsString;  //合计单价
        StrGrid.Cells[9, j] :=Query.FieldByName('IncidentalFee').AsString;//杂费
        StrGrid.Cells[10, j] :=Query.FieldByName('FreightFee').AsString; //运输费
        StrGrid.Cells[11, j] :=Query.FieldByName('SalePrice').AsString;  //保险费
        StrGrid.Cells[12, j] :=Query.FieldByName('SalePrice').AsString;  //利润率
        StrGrid.Cells[13, j] :=Query.FieldByName('SalePrice').AsString;}  //利润额
        SalePrice :=Query.FieldByName('SalePrice').AsFloat;

        PriceRate :=Query.FieldByName('PriceRate').AsFloat;
        if PriceRate=0 then PriceRate :=1;
        Update_CountPrice(SalePrice, PriceRate,Query.FieldByName('Capacity20').AsFloat,Query.FieldByName('Capacity40').AsFloat,Query.FieldByName('Capacity40HQ').AsFloat, RowNum);
        //StrGrid.RowCount :=StrGrid.RowCount + 1;
     end;
  except
     on E: Exception do writelog(E.Message);
  end;
end;

  //批量修改统计金额.
procedure TQuotedPrice_frm.BatchUpdate_CountPrice();
var sqlstr:string;
   i:integer;
   PriceRate, SalePrice:real;
begin
  inherited;
  try
     if QueryChild.Active then
     begin
       if QueryChild.RecordCount >0 then
          QueryChild.First;
       for i:=0 to QueryChild.RecordCount-1 do
       begin
         sqlstr:='select * from ProductInfo where ProductID=''' + QueryChild.fieldbyname('ProductID').AsString + '''';
         Get_Query(Query, sqlstr);
         SalePrice :=Query.FieldByName('SalePrice').AsFloat;
         if (Query.FieldByName('PriceRate').AsFloat =0) or (Query.FieldByName('PriceRate').AsString='') then
            PriceRate :=1
         else
            PriceRate :=Query.FieldByName('PriceRate').AsFloat;
         if SalePrice <0 then continue;
         Update_CountPrice(SalePrice, PriceRate,Query.FieldByName('Capacity20').AsFloat,Query.FieldByName('Capacity40').AsFloat,Query.FieldByName('Capacity40HQ').AsFloat, i);
       end;
     end;
  except
  end;

end;
//单行计算总价格
function TQuotedPrice_frm.Row_CountPrice(CapacityNum, Colnum, Rownum:integer; FeeNum:real):boolean;
var i:integer;
    FreightFee, IncidentalNum, IncidentalFee, InsuranceFee, CountPrice, ProfitAmount:real;
begin
   case Colnum of
      9: //杂费。
         StrGrid.Cells[9,Rownum] :=FormatFloat('0.0000',FeeNum / CapacityNum);   //杂费
      10:
         StrGrid.Cells[10,Rownum] :=FormatFloat('0.0000',FeeNum);   //运费
      11:
         StrGrid.Cells[11,Rownum] :=FormatFloat('0.0000',FeeNum);   //保险费
   end;
      begin
         if 1=1 then
         begin
           if DBPriceItem.Text ='FOB' then
           begin
             CountPrice :=StrToFloatDef(StrGrid.Cells[7,Rownum])*StrToFloatDef(StrGrid.Cells[6,Rownum])+
                        StrToFloatDef(StrGrid.Cells[9,Rownum]) + StrToFloatDef(StrGrid.Cells[13,Rownum])*Query_QuotedPrice.FieldByName('PriceDiscount').AsFloat*StrToFloatDef(StrGrid.Cells[6,Rownum]); //产品单价×报价货币＋杂费（其它费用）＋利润额×价格折扣×报价货币
           end
           else if DBPriceItem.Text ='CIF' then
           begin
             CountPrice :=StrToFloatDef(StrGrid.Cells[7,Rownum])*StrToFloatDef(StrGrid.Cells[6,Rownum])+
                          StrToFloatDef(StrGrid.Cells[10,Rownum])+ StrToFloatDef(StrGrid.Cells[9,Rownum]) +
                          StrToFloatDef(StrGrid.Cells[11,Rownum])+ StrToFloatDef(StrGrid.Cells[13,Rownum])*Query_QuotedPrice.FieldByName('PriceDiscount').AsFloat*StrToFloatDef(StrGrid.Cells[6,Rownum]);
             //CIF价＝产品单价×报价货币＋运费＋杂费（其它费用）＋保险费＋利润额×价格折扣
           end
           else if DBPriceItem.Text ='C&F' then
           begin
             CountPrice :=StrToFloatDef(StrGrid.Cells[7,Rownum])*StrToFloatDef(StrGrid.Cells[6,Rownum])+
                      StrToFloatDef(StrGrid.Cells[10,Rownum])+ StrToFloatDef(StrGrid.Cells[9,Rownum])+
                      StrToFloatDef(StrGrid.Cells[13,Rownum])*Query_QuotedPrice.FieldByName('PriceDiscount').AsFloat*StrToFloatDef(StrGrid.Cells[6,Rownum]);
             //C&F价＝产品单价×报价货币＋运费＋杂费（其它费用）＋利润额×价格折扣
           end ;
           StrGrid.Cells[8, rownum]:=FormatFloat('0.0000', CountPrice);
         end;
      end;
   result :=false;
   
end;

  //单个修改统计金额.
procedure TQuotedPrice_frm.Update_CountPrice(SalePrice, PriceRate, Capacity20, Capacity40, Capacity40HQ:real; rownum:integer);
var
    FreightFee, IncidentalNum, CapacityNum, IncidentalFee, InsuranceFee, CountPrice, ProfitAmount:real;
begin
    CapacityNum :=0.00;
    if SalePrice <0 then exit;
    //try
        StrGrid.Row :=rownum;
        
        if Pos('20尺', dbGoodsBox.Text)>0 then
        begin
           CapacityNum :=Capacity20;
        end
        else if Pos('40尺', dbGoodsBox.Text)>0 then
        begin
           CapacityNum :=Capacity40;
        end
        else if Pos('40HQ', dbGoodsBox.Text)>0 then
        begin
           CapacityNum :=Capacity40HQ;
        end;
        if CapacityNum =0 then exit;
        if Query_QuotedPrice.FieldByName('GoodsBoxCarriage').AsFloat >0 then
           FreightFee :=Query_QuotedPrice.FieldByName('GoodsBoxCarriage').AsFloat / CapacityNum //运费
        else
           FreightFee :=0;
        //杂费   
        if (Query_QuotedPrice.FieldByName('GoodsBoxIE').AsFloat >=0) and (Query_QuotedPrice.FieldByName('OtherFee').AsFloat >=0) then
           IncidentalFee :=(Query_QuotedPrice.FieldByName('GoodsBoxIE').AsFloat +Query_QuotedPrice.FieldByName('OtherFee').AsFloat) / CapacityNum  //杂费
        else
           IncidentalFee :=0;

        //保险费
        InsuranceFee := SalePrice * (1 +0.1) * 0.001;     //保险费

        //利润率
        if  (Query_QuotedPrice.FieldByName('ProfitRate').AsFloat >=0) and (Query_QuotedPrice.FieldByName('ProfitRate').AsFloat >=0) then
           ProfitAmount :=Query_QuotedPrice.FieldByName('ProfitRate').AsFloat* SalePrice * Query_QuotedPrice.FieldByName('ProfitRate').AsFloat
        else
           ProfitAmount :=0;

        StrGrid.Cells[9, rownum]:=FormatFloat('0.0000', IncidentalFee);
        StrGrid.Cells[10, rownum]:=FormatFloat('0.0000', FreightFee);
        StrGrid.Cells[11, rownum] :=FormatFloat('0.0000', InsuranceFee);
        if Query_QuotedPrice.FieldByName('ProfitRate').AsFloat >=0 then
           StrGrid.Cells[12, rownum] :=Query_QuotedPrice.FieldByName('ProfitRate').AsString
        else
           StrGrid.Cells[12, rownum] :='0';
        StrGrid.Cells[13, rownum] :=FormatFloat('0.0000', ProfitAmount);

        //if QueryChild.FieldByName('AutoCount').AsBoolean =true then
        begin
           if DBPriceItem.Text ='FOB' then
           begin
             CountPrice :=SalePrice / PriceRate * Query_QuotedPrice.FieldByName('DollarRate').AsFloat + IncidentalFee + ProfitAmount ; //产品单价×报价货币＋杂费（其它费用）＋利润额×价格折扣×报价货币
           end
           else if DBPriceItem.Text ='CIF' then
           begin
             CountPrice :=SalePrice / PriceRate * Query_QuotedPrice.FieldByName('DollarRate').AsFloat + FreightFee + IncidentalFee + InsuranceFee + ProfitAmount ; //CIF价＝产品单价×报价货币＋运费＋杂费（其它费用）＋保险费＋利润额×价格折扣
           end
           else if DBPriceItem.Text ='C&F' then
           begin
             CountPrice :=SalePrice / PriceRate * Query_QuotedPrice.FieldByName('DollarRate').AsFloat + FreightFee + IncidentalFee + ProfitAmount ; //C&F价＝产品单价×报价货币＋运费＋杂费（其它费用）＋利润额×价格折扣
           end ;
           StrGrid.Cells[8, rownum]:=FormatFloat('0.0000', CountPrice);
        end
       // else
       //    StrGrid.Cells[8, rownum]:='0';
    //except
    //end;
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
       sqlstr :='delete from QuotedPriceChild where QuotedID='''+Query_QuotedPrice.fieldbyname('QuotedID').AsString+'''';
       dosql(sqlstr);
       Query_QuotedPrice.Delete;
       Query_QuotedPrice.Post;
       Query_ini('000');
     except
        on E: Exception do showmessage('数据索引出错.' +E.Message);
     end;
   end
   else if ShipInfoAdd_frm.AddValue ='2' then
   begin
       sqlstr :='delete from QuotedPriceChild where QuotedID='''+Query_QuotedPrice.fieldbyname('QuotedID').AsString+''' and ProductID='''+StrGrid.Cells[1, StrGrid.Row]+'''';
       dosql(sqlstr);
       delete_row_current(StrGrid);
   end;
   ShipInfoAdd_frm.Free;
end;
procedure TQuotedPrice_frm.Save_PriceChild(id:string);
var i, j:integer;
   sqlstr:string;
begin
  for i:=1 to StrGrid.RowCount do
  begin
    if StrGrid.Cells[1, i] <>'' then
    begin
      try
         sqlstr :='Insert into QuotedPriceChild(QuotedID,ProductID,PriceRate,SalePrice,CountPrice,IncidentalFee,FreightFee,InsuranceFee,ProfitRate,ProfitAmount) values(''';
         sqlstr:=sqlstr + id + ''', '''+ ReplaceStr(StrGrid.Cells[1, i]) + ''', '+ StrGrid.Cells[5, i]+', '+StrGrid.Cells[6, i]+', ' +
               StrGrid.Cells[7, i]+', '+StrGrid.Cells[8, i]+', '+StrGrid.Cells[9, i]+', '+StrGrid.Cells[10, i]+', '+
               StrGrid.Cells[11, i]+', '+StrGrid.Cells[12, i]+')';
         writelog(sqlstr);
         Dosql(sqlstr);
      except
         continue;
      end;
    end;
  end;
end;

procedure TQuotedPrice_frm.btnSaveClick(Sender: TObject);
begin
  inherited;
//
  if Query_QuotedPrice.State in[dsInsert, dsedit] then
  begin
      try
        DataModule_frm.ADOConnection1.BeginTrans;
        Save_PriceChild(Query_QuotedPrice.fieldbyname('QuotedID').AsString);
        Query_QuotedPrice.Post;
      except
        on ex :exception do
        begin
           DataModule_frm.ADOConnection1.RollbackTrans;
           showmessage(ex.Message);
           exit;
        end;
      end;
      DataModule_frm.ADOConnection1.CommitTrans;
      btnNew.Caption :='新建';
      btnNew.Tag :=0;
      btnsave.Enabled :=false;
      if application.MessageBox(pchar('保存成功'),'提示信息',mb_ok+mb_iconinformation)=IDYES then
      begin
        Query_QuotedPrice.Close;
        Query_QuotedPrice.Open;

      end;
      
  {end
  else if Query_QuotedPrice.State=dsedit then
  begin
    try
       Query_QuotedPrice.Post;
       btnsave.Enabled :=false;
    except
       on ex :exception do showmessage(ex.Message);
    end;}
  end;
  
end;

procedure TQuotedPrice_frm.btnBrowerClick(Sender: TObject);
begin
  inherited;
//
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

procedure TQuotedPrice_frm.dbGoodsBoxChange(Sender: TObject);
begin
  inherited;
//

  with DataModule_frm.Query_GoodsBox do
  if DataModule_frm.Query_GoodsBox.Active then
  begin
    labGoodsBoxFreight.Caption :=DataModule_frm.Query_GoodsBox.Fieldbyname('DictName').AsString+'运费';
    labGoodsBoxFee.Caption :=DataModule_frm.Query_GoodsBox.Fieldbyname('DictName').AsString+'杂费';
  end;
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
        if Pos('20尺', dbGoodsBox.Text)>0 then
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
        else if Pos('40尺', dbGoodsBox.Text)>0 then
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
        else if Pos('40HQ', dbGoodsBox.Text)>0 then
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
        else if Pos('散货', dbGoodsBox.Text)>0 then
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
     if btnNew.Tag =1 then
     begin
       if Query_QuotedPrice.Active then
       begin
         Query_QuotedPrice.Delete;
         Query_QuotedPrice.Post;
       end;
        btnNew.Tag :=0;
        btnNew.Caption :='新建';
        btnSave.Enabled :=false;
        clear_row_all(StrGrid);
     end
     else
     begin
       maxid :=Get_QuotedPriceID('QuotedPrice');
       //Query_ini(maxid);

       Query_QuotedPrice.Append;
       Query_QuotedPrice.FieldByName('QuotedID').AsString :=maxid;
       Query_QuotedPrice.FieldByName('PriceCoin').AsString:=DataModule_frm.Query_CurrencySort.FieldByName('DictCode').AsString;
       Query_QuotedPrice.FieldByName('DollarRate').AsString :=DataModule_frm.Query_CurrencySort.FieldByName('USBRate').AsString;
       Query_QuotedPrice.FieldByName('GoodsBoxID').AsString:=DataModule_frm.Query_GoodsBox.FieldByName('DictName').AsString;
       DBLookupComboboxEh4.SelStart :=0;
       DBPriceItem.ItemIndex :=0;
       Query_QuotedPrice.FieldByName('GoodsBoxCarriage').AsFloat :=0.00;
       Query_QuotedPrice.FieldByName('GoodsBoxIE').AsFloat :=0.00;
       Query_QuotedPrice.FieldByName('InsuranceRate').AsFloat :=0.00;
       Query_QuotedPrice.FieldByName('CommisionRate').AsFloat :=0.00;
       Query_QuotedPrice.FieldByName('OtherFee').AsFloat :=0.00;
       Query_QuotedPrice.FieldByName('ProfitRate').AsFloat :=0.00;
       Query_QuotedPrice.FieldByName('PriceDiscount').AsFloat :=0.00;
       InsertFlag := true;
       btnNew.Tag :=1;
       btnNew.Caption :='取消';
       btnSave.Enabled :=true;
       clear_row_all(StrGrid);
    end

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
end;

procedure TQuotedPrice_frm.labGoodsBoxFeeClick(Sender: TObject);
begin
  inherited;
//
    Get_BoxCountFee();
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
     DBGridCount.Columns[9].Title.caption :='FOB价';
     DBGridCount.Columns[11].Visible :=false;
     DBGridCount.Columns[12].Visible :=false;
  end
  else if DBPriceItem.Text ='CIF' then
  begin
     DBGridCount.Columns[9].Title.caption :='CIF价';
     DBGridCount.Columns[11].Visible :=true;
     DBGridCount.Columns[12].Visible :=true;
  end
  else if DBPriceItem.Text ='C&F' then
  begin
     DBGridCount.Columns[9].Title.caption :='C&F价';
     DBGridCount.Columns[11].Visible :=true;
     DBGridCount.Columns[12].Visible :=false;
  end
end;

procedure TQuotedPrice_frm.DBLookupComboboxEh4Change(Sender: TObject);
begin
  inherited;
//
  Query_QuotedPrice.FieldByName('DollarRate').AsString:=DataModule_frm.Query_CurrencySort.FieldByName('USBRate').AsString;
end;

procedure TQuotedPrice_frm.DBLookupComboboxEh3Change(Sender: TObject);
var sqlstr:string;
begin
  inherited;
  sqlstr :='select * from DictPort where CountryID='''+DataModule_frm.Query_Country.FieldByName('DictID').AsString+ '''';
  WRITElog(sqlstr);
  Get_Query(Query_Port2, sqlstr);

end;

procedure TQuotedPrice_frm.DBEdit3Change(Sender: TObject);
begin
  inherited;
  BatchUpdate_CountPrice();//

end;

procedure TQuotedPrice_frm.StrGridDblClick(Sender: TObject);
var i:integer;
begin
  inherited;
//
  if StrGrid.Col =2 then
  begin
     application.CreateForm(TQuotedPriceChildAdd_frm, QuotedPriceChildAdd_frm);
     if StrGrid.Cells[2,StrGrid.Row] <>'' then
     begin
       QuotedPriceChildAdd_frm.ProductID :=StrGrid.Cells[2,StrGrid.Row];
     end;
     if StrGrid.Cells[2, StrGrid.RowCount-1] <>'' then
     begin
        StrGrid.RowCount :=StrGrid.RowCount + 1;
     end;
     QuotedPriceChildAdd_frm.Flag :='1';  //'1'时,插入指定行. 否则往最后一行插入记录
     QuotedPriceChildAdd_frm.ShowModal;

     QuotedPriceChildAdd_frm.Free;
    
  end;
end;

procedure TQuotedPrice_frm.StrGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var ch:tcheckbox;
begin
  inherited;
  if ACol in [3..5,7..13] then
  begin
    canselect:=false;
  end;
  if StrGrid.Cells[2, StrGrid.RowCount-1] <>'' then
  begin
    StrGrid.RowCount :=StrGrid.RowCount + 1;
  end;
  {if acol in [8] then canselect:=false;
  if acol in [4..6,9] then
  begin
    if strgrid.Cells [1,strgrid.Row ]='√' then
       canselect:=true
    else
      canselect:=false;
  end;   if acol in [7] then
    if (strgrid.Cells[3,strgrid.RowCount-1 ]<>'') then
    begin
      begin
        strgrid.RowCount :=strgrid.RowCount+1;
        strgrid.Row :=strgrid.RowCount-1;

        acol:=1;
      end;
    end; 
   nowrow:=arow;
   nowcol:=acol;

  sumdata(strgrid,7,8,ncount,sl,je);
  totals.Text :=floattostr(je);
  statusbar1.Panels [0].Text :='记录数为:'+floattostr(ncount);
  }
end;

procedure TQuotedPrice_frm.StrGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
   if acol =8 then
   with strgrid do
   begin
     if (cells[7,arow]<>'') then
     begin
       //cells[9,arow]:=floattostr(strtofloatdef(cells[7,arow])*strtofloatdef(cells[8,arow]));
     end;
   end;

end;

end.
