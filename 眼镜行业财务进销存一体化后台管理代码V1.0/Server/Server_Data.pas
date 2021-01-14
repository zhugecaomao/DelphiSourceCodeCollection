{WG edit 3-11 后台管理数据应用层 old builder zzh}

unit Server_Data;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, GD_Chain_Server_TLB, StdVcl, Provider, DB, ADODB,variants;

type
  TEasy_Dcom_Server = class(TRemoteDataModule, IEasy_Dcom_Server)
    ADOQuery_Server: TADOQuery;
    DataSetProvider_Server: TDataSetProvider;
    Ado_Temp: TADOStoredProc;
    Data_Temp: TDataSetProvider;
    DataSetProvider_Store_Prodc: TDataSetProvider;
    Stored_Sp_Part_set: TADOStoredProc;
    Data_Sp_Part_set: TDataSetProvider;
    Aquery: TADOQuery;
    dspquery: TDataSetProvider;
    aqmain: TADOQuery;
    Aqmain1: TADOQuery;
    Aqmain3: TADOQuery;
    AStock_contract: TADOQuery;
    AReceipt: TADOQuery;
    AStock_contract_detail: TADOQuery;
    dspStock_contract: TDataSetProvider;
    dspReceipt: TDataSetProvider;
    dspStock_contract_detail: TDataSetProvider;
    DspSQL: TDataSetProvider;
    aquery2: TADOQuery;
    dspquery2: TDataSetProvider;
    AStock_Write: TADOQuery;
    AStock_Write_detail: TADOQuery;
    dspStock_Write: TDataSetProvider;
    dspStock_Write_detail: TDataSetProvider;
    AStock_States: TADOQuery;
    dspStock_States: TDataSetProvider;
    AStock_Jion: TADOQuery;
    dspStock_Jion: TDataSetProvider;
    AQuality_Check: TADOQuery;
    dspQuality_Check: TDataSetProvider;
    AQuality_Check_detail: TADOQuery;
    dspQuality_Check_detail: TDataSetProvider;
    ACancel_strip: TADOQuery;
    dspCancel_strip: TDataSetProvider;
    aCanceldetail: TADOQuery;
    dspCanceldetail: TDataSetProvider;
    astockdetail: TADOQuery;
    dspstockdetail: TDataSetProvider;
    apronal: TADOQuery;
    dsppornal: TDataSetProvider;
    aqpart: TADOQuery;
    dsppart: TDataSetProvider;
    aqmain4: TADOQuery;
    AGoods_Requirement: TADOQuery;
    DSPGoods_Requirement: TDataSetProvider;
    AGoods_Requirement_Detail: TADOQuery;
    DSPGoods_Requirement_Detail: TDataSetProvider;
    PubStoredProc: TADOStoredProc;
    CdsDetail: TClientDataSet;
    CdsMaster: TClientDataSet;
    PubProvider: TDataSetProvider;
    PubQuery: TADOQuery;
    AcomponyInfo: TADOQuery;
    dspcompInfo: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function GetRecord(const sql: WideString): OleVariant; safecall;
    function execSql(const Sql: WideString): OleVariant; safecall;
    function resultrecord(const sql: WideString): OleVariant; safecall;
    function receipted(const receipt_no, typed, user_no: WideString;
      Unre: Integer; const Part_no: WideString): OleVariant; safecall;
    function inputstorage(const no: WideString; flag: Integer;
      const shop_id: WideString): OleVariant; safecall;
    function inputMoney(const no: WideString; flag: Integer): OleVariant;
      safecall;
    function updatesql(const sqlpub: WideString): OleVariant; safecall;
    procedure InsertSendBill(var MasterData, DetailData: OleVariant;
      EditMode: Integer; var PsResoult: Integer); safecall;
    procedure InsertGetPlan(var MasterData, DetailData: OleVariant;
      EditMode: Integer; var PsResoult: Integer); safecall;
    function PubBatch(const sqltemp: WideString): OleVariant; safecall;
    function userlogin(const shopID, user, pwd, selfcuid: WideString;
      out outbool: OleVariant): OleVariant; safecall;
    function CancelGoods(const Shopid, Stock_No: WideString): WordBool;
      safecall;
    function UpdateOrder(const TableName: WideString): Integer; safecall;
  public
    { Public declarations }
  end;

implementation

uses Server_Connect, Chain_Data, frm_Public_Func, Unitpubsub;

{$R *.DFM}

class procedure TEasy_Dcom_Server.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TEasy_Dcom_Server.GetRecord(const sql: WideString): OleVariant;
begin
  if queryrecord(aquery,sql) then  //select
  begin
    result:=dspquery.Data;
  end else
  begin
    result:=null;
  end;
  aquery.Close;
end;

function TEasy_Dcom_Server.execSql(const Sql: WideString): OleVariant; //修改提交
begin
  if ExecRecords(aqmain1,sql) then
  begin
    result:=dspSQL.Data;
  end else
  begin
    result:=null;
  end;
  aqmain1.Close;
end;

function TEasy_Dcom_Server.resultrecord(const sql: WideString): OleVariant;  //融合ZZH程序的需要
begin
  if queryrecord(aquery2,sql) then  //select
  begin
    result:=dspquery2.Data;
  end else
  begin
    result:=null;
  end;
  aquery2.Close;
end;

function TEasy_Dcom_Server.receipted(const receipt_no, typed,
  user_no: WideString; Unre: Integer;
  const Part_no: WideString): OleVariant;  //加入部门编号！！
var
    i,reflag,t,j:integer;
    breaked:boolean;
    auditing,subs,Sname,SnameSub:string;
begin
  if unre=1 then  //审核；
  begin
    aqmain.Close;
    aqmain.SQL.Clear;
    aqmain.SQL.Text:=' select * from Level_Set where Receipt_Name='+''''+trim(typed)+'''';
    aqmain.Open;
    auditing:='';
    if not aqmain.IsEmpty then
    begin
      i:=1;
       aqmain3.Close;
       aqmain3.SQL.Clear;
       aqmain3.SQL.Text:='select * from Receipt where Receipt_No='+''''+trim(receipt_no)+''''+' and receipt_name='+''''+trim(typed)+'''';
       aqmain3.Open;
       breaked:=true;
      while i<=aqmain.FieldByName('Level_Count').AsInteger do  //审核身份检查;
      begin
        //////////支持多人审核！！！7-28 WG DO Edited
        auditing:=trim(aqmain.Fields.Fields[i].AsString);
        Sname:=trim(aqmain.Fields.Fields[i+5].AsString);
        j:=pos(',',sname);
        t:=pos(',',auditing);
        if trim(user_no)=trim(auditing) then
        begin
          t:=1;
        end;
        while t>0 do
        begin
          if t=1 then
          begin
            subs:= trim(auditing);
            Snamesub:=trim(Sname);
          end else
          begin
            subs:=copy(auditing,1,t-1);
            Snamesub:=copy(Sname,1,j-1);
          end;
         // if (trim(user_no)=trim(subs)) and (trim(aqmain3.Fields.Fields[i+5].AsString)='') and (trim(aqmain3.fieldbyname('Re_Part').AsString)=trim(part_no)) then  //不得越权审核;
         if (trim(user_no)=trim(subs)) and (trim(aqmain3.Fields.Fields[i+5].AsString)='') then
          begin
            if i>1 then  //一级一级审核，不能越级审核！！！
            begin
              if trim(aqmain3.Fields.Fields[i+5-1].AsString)<>'' then
              begin
                aqmain3.Edit;
                aqmain3.Fields.Fields[i+5].AsString:= trim(snamesub);
                aqmain3.Fieldbyname('Check_Result').AsInteger:=i;
                aqmain3.Post;
                reflag:=10;
                t:=0;
              end else
              begin
                t:=0;
              end;
            end else
            begin
              aqmain3.Edit;
              aqmain3.Fields.Fields[i+5].AsString:= trim(snamesub);
              aqmain3.Fieldbyname('Check_Result').AsInteger:=i;
              aqmain3.Post;
              reflag:=10;
              t:=0;
            end;
          end  else
          begin
            auditing:=copy(auditing,t+1,length(auditing)-t);
            Sname:=copy(sname,j+1,length(sname)-j);
            t:=pos(',',auditing);
            j:=pos(',',sname);
          end;
        end;
         if reflag<>10 then reflag:=2;// 前面还未（反）审核或没有（反）审核权利；
        inc(i);
      end;
      if reflag<>2 then  reflag:=1;//正常审核；
      if (trim(aqmain3.FieldByName('Check_Result').AsString)=trim(aqmain.FieldByName('Level_Count').AsString)) and (i>1) then
      begin
        aqmain3.Edit;
        aqmain3.Fieldbyname('Check_Result').AsInteger:=6; //审核完毕标志;
        aqmain3.Fieldbyname('Flag_Sign').AsString:='单据';
        aqmain3.Post;
        reflag:=3;//审核完毕；
      end;
    end else
    begin //没有指定审核人的情况;
      aqmain3.Edit;
      aqmain3.Fieldbyname('Check_Result').AsInteger:=6; //审核完毕标志;
      aqmain3.Fieldbyname('Flag_Sign').AsString:='单据';
      aqmain3.Post;
      reflag:=3;//审核完毕；
    end;
  end;
  if unre=0 then  //反审核；
  begin
    aqmain.Close;
    aqmain.SQL.Clear;
    aqmain.SQL.Text:=' select * from Level_Set where Receipt_Name='+''''+trim(typed)+'''';
    aqmain.Open;
    if not aqmain.IsEmpty then
    begin
      aqmain3.Close;
      aqmain3.SQL.Clear;
      aqmain3.SQL.Text:='select * from Receipt where Receipt_No='+''''+trim(receipt_no)+'''';
      aqmain3.Open;
      breaked:=true;
      if aqmain.FieldByName('Level_Count').AsInteger<6 then
      begin
        i:=aqmain.FieldByName('Level_Count').AsInteger;
        while i>1 do  //反审核身份检查;
        begin
          if (trim(user_no)=trim(aqmain.Fields.Fields[i].AsString)) and (trim(aqmain3.Fields.Fields[i+5].AsString)<>'')  then  //不得越权审核;
          begin
            aqmain3.Edit;
            aqmain3.Fields.Fields[i+5].AsString:= '';
            aqmain3.Fieldbyname('Check_Result').AsInteger:=aqmain3.Fieldbyname('Check_Result').AsInteger-1;
            aqmain3.Post;
            reflag:=10;
          end ;
          if reflag<>10 then reflag:=2;// 前面还未（反）审核或没有（反）审核权利；
          i:=i-1;
        end;
        if reflag<>2 then reflag:=5; //正常反审核;
        if aqmain3.Fieldbyname('Check_Result').AsInteger=0 then
        begin
          aqmain3.Edit;
          aqmain3.Fieldbyname('Flag_Sign').AsString:='草稿';
          aqmain3.Post;
          reflag:=4;//反审核完毕
        end;
      end else
      begin
        reflag:=6;// 不能反审核；
      end;
    end else
    begin
      aqmain3.Edit;
      aqmain3.Fieldbyname('Check_Result').AsInteger:=0; //审核完毕标志;
      aqmain3.Fieldbyname('Flag_Sign').AsString:='草稿';
      aqmain3.Post;
      reflag:=4;//反审核完毕；
    end;
  end;
  result:=reflag;
end;

function TEasy_Dcom_Server.inputstorage(const no: WideString;
  flag: Integer; const shop_id: WideString): OleVariant; //写物流出入库存 edit 7-21 orders
var
  reflag:integer;
  orderId:string;
begin
  if flag=1 then
  begin
    orderid:='';
    aqmain.Close;
    aqmain.SQL.Clear;
    aqmain.SQL.Text:=' select * from Stock_Jion_detail where stock_no='+''''+trim(no)+'''';
    aqmain.Open;
    if not aqmain.IsEmpty then
    begin
      while not aqmain.Eof do   //写入对应的库存 7-29修改
      begin
        orderid:=trim(aqmain.fieldbyname('orders').AsString);
        aqmain3.Close;
        aqmain3.SQL.Clear;
        if trim(shop_id)<>'' then
        begin
          aqmain3.SQL.Text:='select * from stock_states where Goods_NO=:no and storage_no=:shopid';
          aqmain3.Parameters[0].Value:=trim(aqmain.fieldbyname('goods_no').AsString);
          aqmain3.Parameters[1].Value:=trim(shop_id);
          aqmain3.Prepared;
        end else
        begin
          aqmain3.SQL.Text:='select * from stock_states where Goods_NO=:no and storage_no is null';
          aqmain3.Parameters[0].Value:=trim(aqmain.fieldbyname('goods_no').AsString);
          aqmain3.Prepared;
        end;
        aqmain3.Open;
        if aqmain3.IsEmpty then
        begin
          aqmain3.Insert;
          aqmain3.FieldByName('goods_no').AsString:=trim(aqmain.fieldbyname('goods_no').AsString);
          aqmain3.FieldByName('storage_no').AsString:=trim(shop_id); //仓库或分店编号;
          aqmain3.FieldByName('IN_Amount').Asinteger:=aqmain.fieldbyname('Amount').Asinteger;
          aqmain3.FieldByName('out_Amount').Asinteger:=0;
          aqmain3.Post;
        end else
        begin
          aqmain3.Edit;
          aqmain3.FieldByName('IN_Amount').Asinteger:=aqmain3.FieldByName('IN_Amount').Asinteger+aqmain.fieldbyname('Amount').Asinteger;
          if aqmain3.FieldByName('Order_Amount').Asinteger >0 then
          begin
            aqmain3.FieldByName('Order_Amount').Asinteger:=aqmain3.FieldByName('Order_Amount').Asinteger-aqmain.fieldbyname('Amount').Asinteger;
          end;
          aqmain3.Post;
        end;
         if trim(orderid)<>'' then
         begin
           aqmain4.Close;
           aqmain4.SQL.Clear;
           aqmain4.SQL.Text:='update GetGoodsPlan set IGetStatus=1 where VcGetGoodsPlanID in (select VcGetGoodsPlanID from GetGoodsPlanmaster where VcBillNo='+''''+trim(orderid)+''''+')';
           aqmain4.ExecSQL;
           aqmain4.Close;
         end;
        aqmain.Next;
      end;
      reflag:=3; //
    end;
  end else
  begin   //出库
    //reflag:=0;
    aqmain.Close;
    aqmain.SQL.Clear;
    aqmain.SQL.Text:=' select * from Out_strip_detail where out_no='+''''+trim(no)+'''';
    aqmain.Open;
    if not aqmain.IsEmpty then
    begin
      while not aqmain.Eof do   //写入对应的出库库存
      begin
        aqmain3.Close;
        aqmain3.SQL.Clear;
        if trim(shop_id)<>'' then
        begin
          aqmain3.SQL.Text:='select * from stock_states where Goods_NO=:no and storage_no=:shopid';
          aqmain3.Parameters[0].Value:=trim(aqmain.fieldbyname('goods_no').AsString);
          aqmain3.Parameters[1].Value:=trim(shop_id);
          aqmain3.Prepared;
        end else
        begin
          aqmain3.SQL.Text:='select * from stock_states where Goods_NO=:no and storage_no is null';
          aqmain3.Parameters[0].Value:=trim(aqmain.fieldbyname('goods_no').AsString);
          aqmain3.Prepared;
        end;
        aqmain3.Open;
        aqmain3.Edit;
        aqmain3.FieldByName('out_Amount').Asinteger:=aqmain3.FieldByName('out_Amount').Asinteger+aqmain.fieldbyname('Amount').Asinteger;
        aqmain3.Post;
        aqmain.Next;
      end;
      reflag:=3; //  完成出库
    end;
  end;
  result:=reflag;
end;

function TEasy_Dcom_Server.inputMoney(const no: WideString;
  flag: Integer): OleVariant;  //财务入库
  VAR
    values:integer;
begin
  values:=0;
  if flag=1 then
  begin
    aqmain.Close;
    aqmain.SQL.Clear;
    aqmain.SQL.Text:=' select a.*,b.Shop_no from moneyinput_detail as a,moneyinput as b where a.stock_no=b.stock_no and a.stock_no='+''''+trim(no)+'''';
    aqmain.Open;
    if not aqmain.IsEmpty then
    begin
      while not aqmain.Eof do   //写入对应的库存
      begin
        aqmain3.Close;
        aqmain3.SQL.Clear;
        aqmain3.SQL.Text:='select * from goods_prices where Goods_NO=:no';
        aqmain3.Parameters[0].Value:=trim(aqmain.fieldbyname('goods_no').AsString);
        aqmain3.Prepared;
        aqmain3.Open;
        aqmain4.Close;
        aqmain4.SQL.Clear;
        aqmain4.SQL.Text:='select sum(stock_amount) as stock_amount from stock_states where Goods_NO=:no group by Goods_no';
        aqmain4.Parameters[0].Value:=trim(aqmain.fieldbyname('goods_no').AsString);//总公司该商品的成本变化
        aqmain4.Prepared;
        aqmain4.Open;
        if aqmain3.IsEmpty then
        begin
          aqmain3.Insert;
          aqmain3.FieldByName('goods_no').AsString:=trim(aqmain.fieldbyname('goods_no').AsString);
          aqmain3.FieldByName('baseprice').AsString:=trim(aqmain.fieldbyname('baseprice').AsString); //直接写单价;
          aqmain3.Post;
        end else
        begin
          aqmain3.Edit;
          aqmain3.FieldByName('baseprice').Asfloat:=(aqmain3.FieldByName('baseprice').Asfloat*(aqmain4.fieldbyname('stock_Amount').Asinteger-aqmain.fieldbyname('Amount').Asinteger)+aqmain.FieldByName('money').Asfloat)/aqmain4.fieldbyname('stock_Amount').Asinteger; //（原单价*原数量+入库数量*新单价）/总数量
          aqmain3.Post;
        end;
        aqmain.Next;
      end;
      values:=3; //
    end;
  end else
  begin
    values:=0;
  end;
  result:=values;
end;
function TEasy_Dcom_Server.updatesql(const sqlpub: WideString): OleVariant;
var
  r:boolean;
begin
  r:=executesql(aqmain4,sqlpub);
  if r then
  begin
    result:='1';
  end else
  begin
    result:='0';
  end;
end;

procedure TEasy_Dcom_Server.InsertSendBill(var MasterData,
  DetailData: OleVariant; EditMode: Integer; var PsResoult: Integer);
var
  iRow: Integer;
  pBillId: string;
begin  //写陪送单,TYPE：501：配送收获单；502：变价配送；503：申请配送单；506：退货申请单；505:退货出库；507：退货入库;
  try
    CdsMaster.Close;
    CdsDetail.Close;
    CdsMaster.Data := MasterData;
    CdsDetail.Data := DetailData;
    //CONN.BeginTrans;
    //frm_Chain_Data.ADO_Connection.BeginTrans;
    PubStoredProc.Close;
    PubStoredProc.Parameters.Clear;
    PubStoredProc.ProcedureName := 'InsertSendMaster;1';
    PsResoult := 0;
    PubStoredProc.Parameters.Refresh;

    PubStoredProc.Parameters.ParamByName('@vcSendBillId').Value := CdsMaster.FieldByName('vcSendBillId').Value;
    PubStoredProc.Parameters.ParamByName('@VcSourceId').Value := CdsMaster.FieldByName('VcSourceId').Value;
    PubStoredProc.Parameters.ParamByName('@iBIlltype').Value := CdsMaster.FieldByName('iBIlltype').Value;
    PubStoredProc.Parameters.ParamByName('@vcSendStockID').Value := CdsMaster.FieldByName('vcSendStockID').Value;
    PubStoredProc.Parameters.ParamByName('@vcRecvStockID').Value := CdsMaster.FieldByName('vcRecvStockID').Value;
    PubStoredProc.Parameters.ParamByName('@dtDrawDate').Value := CdsMaster.FieldByName('dtDrawDate').Value;
    PubStoredProc.Parameters.ParamByName('@dtOutStockDate').Value := CdsMaster.FieldByName('dtOutStockDate').Value;
    PubStoredProc.Parameters.ParamByName('@vcEId').Value := CdsMaster.FieldByName('vcEId').Value;
    PubStoredProc.Parameters.ParamByName('@vcListerId').Value := CdsMaster.FieldByName('vcListerId').Value;
    PubStoredProc.Parameters.ParamByName('@vcAssessorId').Value := CdsMaster.FieldByName('vcAssessorId').Value;
    PubStoredProc.Parameters.ParamByName('@NSumQty').Value := CdsMaster.FieldByName('NSumQty').Value;
    PubStoredProc.Parameters.ParamByName('@nuCess').Value := CdsMaster.FieldByName('nuCess').Value;
    PubStoredProc.Parameters.ParamByName('@nuTax').Value := CdsMaster.FieldByName('nuTax').Value;
    PubStoredProc.Parameters.ParamByName('@nuIncTaxSum').Value := CdsMaster.FieldByName('nuIncTaxSum').Value;
    PubStoredProc.Parameters.ParamByName('@nuTotalMoney').Value := CdsMaster.FieldByName('nuTotalMoney').Value;
    PubStoredProc.Parameters.ParamByName('@nuUnTaxSum').Value := CdsMaster.FieldByName('nuUnTaxSum').Value;
    PubStoredProc.Parameters.ParamByName('@BillStatus').Value := CdsMaster.FieldByName('BillStatus').Value;
    PubStoredProc.Parameters.ParamByName('@inVoucherSign').Value := CdsMaster.FieldByName('inVoucherSign').Value;
    PubStoredProc.Parameters.ParamByName('@inIsReadSign').Value := CdsMaster.FieldByName('inIsReadSign').Value;
    PubStoredProc.Parameters.ParamByName('@vcOutHouseReadBillId').Value := CdsMaster.FieldByName('vcOutHouseReadBillId').Value;
    PubStoredProc.Parameters.ParamByName('@inByReadSign').Value := CdsMaster.FieldByName('inByReadSign').Value;
    PubStoredProc.Parameters.ParamByName('@vcExplain').Value := CdsMaster.FieldByName('vcExplain').Value;
    PubStoredProc.Parameters.ParamByName('@SendStatus').Value := CdsMaster.FieldByName('SendStatus').Value;
    PubStoredProc.Parameters.ParamByName('@accountFlog').Value := CdsMaster.FieldByName('accountFlog').Value;
    PubStoredProc.Parameters.ParamByName('@AccountMoney').Value := CdsMaster.FieldByName('AccountMoney').Value;
    PubStoredProc.Parameters.ParamByName('@BillNo').Value := CdsMaster.FieldByName('BillNo').Value;
    PubStoredProc.Parameters.ParamByName('@ObjectID').Value := CdsMaster.FieldByName('ObjectID').Value;
    PubStoredProc.Parameters.ParamByName('@EditMode').Value := EditMode;
    PubStoredProc.Parameters.ParamByName('@Rst').Value := 0;
    PubStoredProc.ExecProc;
    if EditMode = 0 then
      pBillId := PubStoredProc.Parameters.ParamByName('@vcSendBillId').Value;
    PsResoult := PubStoredProc.Parameters.ParamByName('@Rst').Value;
    if PsResoult <> 0 then raise Exception.Create('写入主表失败');
    CdsDetail.First;
    for iRow := 1 to CdsDetail.RecordCount do
    begin
      PubStoredProc.Close;
      PubStoredProc.Parameters.Clear;
      PubStoredProc.ProcedureName := 'InsertSendDetail;1';
      PubStoredProc.Parameters.Refresh;
      if EditMode = 0 then
        PubStoredProc.Parameters.ParamByName('@vcSendBillId').Value := pBillId
      else
        PubStoredProc.Parameters.ParamByName('@vcSendBillId').Value := CdsDetail.FieldByName('vcSendBillId').Value;
      PubStoredProc.Parameters.ParamByName('@ord').Value := CdsDetail.FieldByName('ord').Value;
      PubStoredProc.Parameters.ParamByName('@InOrderId').Value := CdsDetail.FieldByName('InOrderId').Value;
      PubStoredProc.Parameters.ParamByName('@vcPtypeid').Value := CdsDetail.FieldByName('vcPtypeid').Value;
      PubStoredProc.Parameters.ParamByName('@VcSendStockID').Value := CdsDetail.FieldByName('VcSendStockID').Value;
      PubStoredProc.Parameters.ParamByName('@VcRecvStockID').Value := CdsDetail.FieldByName('VcRecvStockID').Value;
      PubStoredProc.Parameters.ParamByName('@vcBatch').Value := CdsDetail.FieldByName('vcBatch').Value;
      PubStoredProc.Parameters.ParamByName('@vcGoodUnitId').Value := CdsDetail.FieldByName('vcGoodUnitId').Value;
      PubStoredProc.Parameters.ParamByName('@nuOutQuantity').Value := CdsDetail.FieldByName('nuOutQuantity').Value;
      PubStoredProc.Parameters.ParamByName('@SendPrice').Value := CdsDetail.FieldByName('SendPrice').Value;
      PubStoredProc.Parameters.ParamByName('@SendTotal').Value := CdsDetail.FieldByName('SendTotal').Value;
      PubStoredProc.Parameters.ParamByName('@nuCess').Value := CdsDetail.FieldByName('nuCess').Value;
      PubStoredProc.Parameters.ParamByName('@nuIncTaxPrice').Value := CdsDetail.FieldByName('nuIncTaxPrice').Value;
      PubStoredProc.Parameters.ParamByName('@nuTax').Value := CdsDetail.FieldByName('nuTax').Value;
      PubStoredProc.Parameters.ParamByName('@NTaxTotal').Value := CdsDetail.FieldByName('NTaxTotal').Value;
      PubStoredProc.Parameters.ParamByName('@nuCostPrice').Value := CdsDetail.FieldByName('nuCostPrice').Value;
      PubStoredProc.Parameters.ParamByName('@NCastTotal').Value := CdsDetail.FieldByName('NCastTotal').Value;
      PubStoredProc.Parameters.ParamByName('@NRate').Value := CdsDetail.FieldByName('NRate').Value;
      PubStoredProc.Parameters.ParamByName('@iUnit').Value := CdsDetail.FieldByName('iUnit').Value;
      PubStoredProc.Parameters.ParamByName('@Rst').Value := 0;
      PubStoredProc.Parameters.ParamByName('@EditMode').Value := EditMode;
      PubStoredProc.Parameters.ParamByName('@GoodsMemo').Value := CdsDetail.FieldByName('GOODSMEMO').Value;  //7-2 预定
      PubStoredProc.ExecProc;
      PsResoult := PubStoredProc.Parameters.ParamByName('@Rst').Value;
      if PsResoult <> 0 then raise Exception.Create('写入明细表失败');
      CdsDetail.Next;
    end;
    //frm_Chain_Data.ADO_Connection.CommitTrans;
  except
    //frm_Chain_Data.ADO_Connection.RollbackTrans;
    PsResoult := -1;
  end;

end;

procedure TEasy_Dcom_Server.InsertGetPlan(var MasterData,
  DetailData: OleVariant; EditMode: Integer; var PsResoult: Integer);
var
  iRow: Integer;
  pBillId: string;
begin  //写要货计划；
  try
    CdsMaster.Close;
    CdsDetail.Close;
    CdsMaster.Data := MasterData;
    CdsDetail.Data := DetailData;
    //frm_Chain_Data.ADO_Connection.BeginTrans;
    PubStoredProc.Close;
    PubStoredProc.Parameters.Clear;
    PubStoredProc.ProcedureName := 'InsertGetPlanMaster;1';
    PsResoult := 0;
    PubStoredProc.Parameters.Refresh;

    PubStoredProc.Parameters.ParamByName('@VcGetGoodsPlanID').Value := CdsMaster.FieldByName('VcGetGoodsPlanID').Value;
    PubStoredProc.Parameters.ParamByName('@VcBillNo').Value := CdsMaster.FieldByName('VcBillNo').Value;
    PubStoredProc.Parameters.ParamByName('@iBIlltype').Value := CdsMaster.FieldByName('iBIlltype').Value;
    PubStoredProc.Parameters.ParamByName('@VCOfficeID').Value := CdsMaster.FieldByName('VCOfficeID').Value;
    PubStoredProc.Parameters.ParamByName('@VcStockID').Value := CdsMaster.FieldByName('VcStockID').Value;
    PubStoredProc.Parameters.ParamByName('@DGetDate').Value := CdsMaster.FieldByName('DGetDate').Value;
    PubStoredProc.Parameters.ParamByName('@VcEID').Value := CdsMaster.FieldByName('VcEID').Value;
    PubStoredProc.Parameters.ParamByName('@vcCheckE').Value := CdsMaster.FieldByName('vcCheckE').Value;
    PubStoredProc.Parameters.ParamByName('@Memo').Value := CdsMaster.FieldByName('Memo').Value;
    PubStoredProc.Parameters.ParamByName('@IPlanStatus').Value := CdsMaster.FieldByName('IPlanStatus').Value;

    PubStoredProc.Parameters.ParamByName('@EditMode').Value := EditMode;
    PubStoredProc.Parameters.ParamByName('@Rst').Value := 0;
    PubStoredProc.ExecProc;
    if EditMode = 0 then
      pBillId := PubStoredProc.Parameters.ParamByName('@VcGetGoodsPlanID').Value;
    PsResoult := PubStoredProc.Parameters.ParamByName('@Rst').Value;
    if PsResoult <> 0 then raise Exception.Create('写入主表失败');
    CdsDetail.First;
    for iRow := 1 to CdsDetail.RecordCount do
    begin
      PubStoredProc.Close;
      PubStoredProc.Parameters.Clear;
      PubStoredProc.ProcedureName := 'InsertGetPlanDetail;1';
      PubStoredProc.Parameters.Refresh;
      if EditMode = 0 then
        PubStoredProc.Parameters.ParamByName('@VcGetGoodsPlanID').Value := pBillId
      else
        PubStoredProc.Parameters.ParamByName('@VcGetGoodsPlanID').Value := CdsDetail.FieldByName('VcGetGoodsPlanID').Value;
      PubStoredProc.Parameters.ParamByName('@ord').Value := CdsDetail.FieldByName('ord').Value;
      PubStoredProc.Parameters.ParamByName('@VCPtyieID').Value := CdsDetail.FieldByName('VCPtyieID').Value;
      PubStoredProc.Parameters.ParamByName('@vcGoodUnitId').Value := CdsDetail.FieldByName('vcGoodUnitId').Value;
      PubStoredProc.Parameters.ParamByName('@NQty').Value := CdsDetail.FieldByName('NQty').Value;
      PubStoredProc.Parameters.ParamByName('@NSendQty').Value := CdsDetail.FieldByName('NSendQty').Value;
      PubStoredProc.Parameters.ParamByName('@NEndQty').Value := CdsDetail.FieldByName('NEndQty').Value;
      PubStoredProc.Parameters.ParamByName('@IGetStatus').Value := CdsDetail.FieldByName('IGetStatus').Value;
      PubStoredProc.Parameters.ParamByName('@NRate').Value := CdsDetail.FieldByName('NRate').Value;
      PubStoredProc.Parameters.ParamByName('@iUnit').Value := CdsDetail.FieldByName('iUnit').Value;
      PubStoredProc.Parameters.ParamByName('@Rst').Value := 0;
      PubStoredProc.Parameters.ParamByName('@EditMode').Value := EditMode;
      PubStoredProc.Parameters.ParamByName('@GoodsMemo').Value := CdsDetail.FieldByName('GOODSMEMO').Value; //7-2 预定
      PubStoredProc.ExecProc;
      PsResoult := PubStoredProc.Parameters.ParamByName('@Rst').Value;
      if PsResoult <> 0 then raise Exception.Create('写入明细表失败');
      CdsDetail.Next;
    end;
    //frm_Chain_Data.ADO_Connection.CommitTrans;
  except
    //frm_Chain_Data.ADO_Connection.RollbackTrans;
    PsResoult := -1;
  end;

end;

function TEasy_Dcom_Server.PubBatch(const sqltemp: WideString): OleVariant;
begin
  if queryrecord(PubQuery,sqltemp) then  //select 配送
  begin
    result:=PubProvider.Data;
  end else
  begin
    result:=null;
  end;
end;

function TEasy_Dcom_Server.userlogin(const shopID, user, pwd,
  selfcuid: WideString; out outbool: OleVariant): OleVariant;
  var
  done,sql:string;
begin //人员登陆,成功返回仓库编号和权限;
  if selfcuid='{7E6276E9-C01C-473E-8092-88F21674E6DD}' then
  begin
    if (user<>'administrator') then
    begin
      done:='';
      aqmain3.Close;
      aqmain3.SQL.Clear;
      aqmain3.SQL.Text:='select * from [Vpart_storage] where p_no=:user and User_Pwd=:pwd and p_iswork=1';
      aqmain3.Parameters[0].Value:=trim(user);
      aqmain3.Parameters[1].Value:=trim(pwd);
      aqmain3.Open;
      if aqmain3.IsEmpty then
      begin
        outbool:='0';
      end else
      begin
        outbool:=trim(aqmain3.fieldbyname('storageid').AsString);
        done:=trim(aqmain3.fieldbyname('done').AsString);
      end;
    end else
    begin
      outbool:='CJ0000001'; //返回仓库编号；
      done:='CG11111111ST1111111111PS111BASE111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    end;
    result:=done;
  end;
end;

function TEasy_Dcom_Server.CancelGoods(const Shopid,
  Stock_No: WideString): WordBool;  //库存退货
  var
    id:string;
    sqls,make:string;
    i:integer;
begin
  result:=false;
  with aqmain do
  begin
    Close;
    sql.Clear;
    sql.Text:='select a.storage_no,a.wldw,a.proposer,a.transactor,a.shop_no,a.Contract_NO,b.* from [Cancel_strip] as a ,[Cancel_strip_detail] as b where a.stock_no=b.stock_no and  a.Stock_No= ' +''''+trim(stock_no)+'''';
    open;
    if not IsEmpty then
    begin
      id:='';
      sqls:='select max(right(Out_NO,4)) from out_strip where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+''''+' and part_no='+''''+trim(fieldbyname('shop_no').AsString)+'''';
      make:='OSK-'+trim(fieldbyname('shop_no').AsString)+formatdatetime('yymmdd',date);
      id:=addid(aqmain4,sqls,make);
      aqmain3.Close;  //*  写出库单
      aqmain3.SQL.Clear;
      aqmain3.SQL.Text:='insert into  out_strip (out_no,storage_no,transactor,copy_date,proposer,part_no,condense,Out_Name,Gatrher_monad) values (:code,:shop,:operater,:newdate,:newman,:part,:resume,:names,:wldwno)';
      aqmain3.Parameters[0].Value:=trim(id);
      aqmain3.Parameters[1].Value:=trim(shopid);
      aqmain3.Parameters[2].Value:=trim(fieldbyname('transactor').AsString);
      aqmain3.Parameters[3].Value:=formatdatetime('yyyy''-''mm''-''dd',date);
      aqmain3.Parameters[4].Value:=trim(fieldbyname('proposer').AsString);
      aqmain3.Parameters[5].Value:=trim(fieldbyname('Shop_no').AsString);// bumen
      aqmain3.Parameters[6].Value:='仓库:'+shopid+'向['+trim(fieldbyname('wldw').AsString)+']退货出库';
      aqmain3.Parameters[7].Value:='库存退货出库单';
      aqmain3.Parameters[8].Value:=trim(fieldbyname('Contract_NO').AsString);// bumen
      aqmain3.Prepared;
      aqmain3.ExecSQL;
      First;
      i:=0;
      while not Eof do
      begin
        aqmain3.Close;  //写出库明细
        aqmain3.SQL.Clear;
        aqmain3.SQL.Text:='insert into out_strip_detail (out_no,goods_no,goods_name,amount,price,money,ord) values (:od_ocode,:od_ccode,:od_cname,:od_count,:od_cprice,:od_money,:ord)';
        aqmain3.Parameters[0].Value:=trim(id);
        aqmain3.Parameters[1].Value:=fieldbyname('goods_no').AsString;
        aqmain3.Parameters[2].Value:=fieldbyname('quality').AsString;
        aqmain3.Parameters[3].Value:=fieldbyname('amount').AsInteger;
        aqmain3.Parameters[4].Value:=fieldbyname('price').AsString;
        aqmain3.Parameters[5].Value:=fieldbyname('amount').Asfloat*fieldbyname('price').Asfloat;
        aqmain3.Parameters[6].Value:=i;
        aqmain3.Prepared;
        aqmain3.ExecSQL;
        aqmain4.Close;  //*
        aqmain4.SQL.Clear;
        aqmain4.SQL.Text:='update stock_states set out_amount=out_amount+'+trim(fieldbyname('amount').AsString)+' where  goods_no=:no and Storage_NO=:shopid ';  //取件后修改定单状态
        aqmain4.Parameters[0].Value:=trim(fieldbyname('goods_no').AsString);
        aqmain4.Parameters[1].Value:=trim(fieldbyname('storage_no').AsString);
        aqmain4.Prepared;
        aqmain4.ExecSQL;
        Next;
        inc(i);
      end;
      result:=true;
    end;
  end;

end;

function TEasy_Dcom_Server.UpdateOrder(
  const TableName: WideString): Integer; //修改库存定单数量
begin
  result:=2;
  try
  aqmain.Close;
  aqmain.SQL.Clear;
  aqmain.SQL.Text:=trim(tablename);
  aqmain.Open;
  if not aqmain.IsEmpty then
  begin
    while not aqmain.Eof do
    begin
      aqmain3.Close;
      aqmain3.SQL.Clear;
      aqmain3.SQL.Text:='update stock_states set order_amount='+trim(aqmain.fieldbyname('amount').AsString)+' where storage_no='+''''+trim(aqmain.fieldbyname('storage_no').AsString)+''''+' and goods_no='+''''+trim(aqmain.fieldbyname('goods_no').AsString)+'''';
      aqmain3.ExecSQL;
      aqmain.Next;
    end;
  end;
    result:=3;
  except
  end;
  aqmain.Close;
  aqmain3.Close;
end;

initialization
  TComponentFactory.Create(ComServer, TEasy_Dcom_Server,
    Class_Easy_Dcom_Server, ciMultiInstance, tmApartment);
end.
