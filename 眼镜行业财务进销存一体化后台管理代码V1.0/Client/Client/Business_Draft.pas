unit Business_Draft;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, Buttons, ExtCtrls;

type
  Tfrm_Business_Draft = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    dsquery: TDataSource;
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BtnDelete: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure settitle;    //设置网格标题
    function DeleteStock(No:string):boolean;
  public
    { Public declarations }
  end;

var
  frm_Business_Draft: Tfrm_Business_Draft;

implementation

uses Stock_Contract, Data, func, Stock_Enter, Stock_Fad, Stock_Pay,
  Goods_Write, Quality_Check, Umanage_Fad,
 untdatadm, Umoneystock, fm_Scrap, fm_Overflow,
  Uinstock, Goods_Requirement, Uflat, Untnewshopgoods,
  UntZsManager, UUnPos, w_more, UYdPosBill, UntPosSendBill, UStock_cancel,
  UUnfinance;

{$R *.dfm}

procedure Tfrm_business_Draft.settitle;     //设置网格标题
begin
    DBGrid1.Columns[0].Width:=80;   DBGrid1.Columns[1].Width:=100;    DBGrid1.Columns[2].Width:=200;
    DBGrid1.Columns[3].Width:=80;   DBGrid1.Columns[4].Width:=60;    DBGrid1.Columns[5].Width:=100;
    DBGrid1.Columns[6].Width:=60;    DBGrid1.Columns[7].Width:=100;
    DBGrid1.Columns[8].Width:=100;  DBGrid1.Columns[9].Width:=100;   DBGrid1.Columns[10].Width:=100;
end;

function Tfrm_Business_Draft.DeleteStock(No:string):boolean;
var
  sql:widestring;
begin
  result:=false;
  sql:='delete from receipt where receipt_no='+''''+trim(no)+''''; //删除草稿！！！
  try
    adisp.updatesql(sql); 
    result:=true;
  except
  end;
end;
//////////////////
procedure Tfrm_Business_Draft.FormShow(Sender: TObject);
var
  subsql:widestring;
  olevalue:olevariant;
begin   // wy edit 3-14
    ComboBox1.ItemIndex:=0;
    ComboBox2.ItemIndex:=0;
    subsql:='Select Copy_Date,Receipt_Name,Receipt_No,Condense,Proposer,Level_Count,Level_Name1,E1,E2,E3,E4,E5,check_result as 审核级数 from '+
    '[V_Stock_Level]'+
    ' where Check_Result<=5 and Flag_sign='+''''+'草稿'+''''+' and ( Examine_Man1 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man2 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man3 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man4 like'+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man5 like '+''''+trim('%'+Handle_No+'%')+''''
    +') and  (e1 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e1 is null) and (e2 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e2 is null) and (e3 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e3 is null) and (e4 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e4 is null )and (e5 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e5 is null) and re_part='+''''+trim(Handle_part)+'''';
    dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
    olevalue:=adisp.GetRecord(subsql);
    if not varisnull(olevalue) then  //wg edit 3-14
    begin
      dmmain.CDSquery.Data:=olevalue;
      dmmain.CDSquery.Open;
      olevalue:=null;
      DBGrid1.Enabled:=True;
      settitle;    //设置网格标题
      dbgrid1.Refresh;
   end;
end;

procedure Tfrm_Business_Draft.DBGrid1DblClick(Sender: TObject);
begin
    //如果草稿单据的条数不为空则
    if not (dmmain.CDSquery.Active) then  exit;
    DBGRID1.DataSource.DataSet.DisableControls;
    if (dmmain.CDSquery.FieldByName('审核级数').AsString='6') then
    begin
      application.MessageBox('单据已过帐，不能操作！',pchar(application.Title),mb_iconinformation);
      exit;
    end;
    List_No:=trim(dmmain.CDSquery.Fieldbyname('Receipt_No').AsString);//单据编号
    LevelType:=trim(dmmain.CDSquery.Fieldbyname('Receipt_Name').AsString);//单据名称
    if Trim(LevelType)<>'' then
    begin
        Public_Do:='';
        if LevelType='商品需求单' then //单据名称
        begin
            Public_Do:='Requirement_0001';//商品需求单
            frm_Goods_Requirement:=Tfrm_Goods_Requirement.Create(self);
            frm_Goods_Requirement.ShowModal;
            frm_Goods_Requirement.Free;
        end;
        if LevelType='采购合同' then //单据名称
        begin
            Public_Do:='Business_Draft_0002';//采购合同
            frm_Stock_Contract:=Tfrm_Stock_Contract.Create(self);
            frm_Stock_Contract.ShowModal;
            frm_Stock_Contract.Free;
        end;
        if LevelType='采购入库单' then //单据名称
        begin
            Public_Do:='Business_Draft_0001';// 采购入库单
            frm_Stock_Enter:=Tfrm_Stock_Enter.Create(self);
            frm_Stock_Enter.ShowModal;
            frm_Stock_Enter.Free;
        end;
        if LevelType='采购退货单' then //单据名称
        begin
            Public_Do:='Business_Draft_0003';// 采购退货单
            frm_Stock_Fad:=Tfrm_Stock_Fad.Create(self);
            frm_Stock_Fad.ShowModal;
            frm_Stock_Fad.Free;
        end;
        if LevelType='采购付款单' then //单据名称
        begin
            Public_Do:='Business_Draft_0004';// 采购付款单
            frm_Stock_Pay:=Tfrm_Stock_Pay.Create(self);
            frm_Stock_Pay.SpeedButton6.Enabled:=false;
            frm_Stock_Pay.SpeedButton9.Enabled:=false;
            frm_Stock_Pay.ShowModal;
            frm_Stock_Pay.Free;
        end;
        if LevelType='来货登记单' then //单据名称
        begin
            Public_Do:='Business_Draft_0005';// 来货登记单
            frm_Goods_Write:=Tfrm_Goods_Write.Create(self);
            frm_Goods_Write.ShowModal;
            frm_Goods_Write.Free;
        end;
        if LevelType='质量验收单' then //单据名称
        begin
            Public_Do:='Business_Draft_0006';// 质量验收单
            Public_Do_Result:='';
            frm_Quality_Check:=Tfrm_Quality_Check.Create(self);
            frm_Quality_Check.ShowModal;
            frm_Quality_Check.Free;
        end;
        if LevelType='库存报损单' then //单据名称
        begin
            Public_Do:='damage_0002';// 库存报损单
            Public_Do_Result:='';
             fmscrap:=tfmscrap.Create(self);
            fmscrap.ShowModal;
            fmscrap.Free;
        end;
        if LevelType='非营业性出库单' then //单据名称
        begin
            Public_Do:='Business_Storage_Out';// 出库单
            Public_Do_Result:='';
            frm_Umanage_Fad:=Tfrm_Umanage_Fad.Create(self);
            frm_Umanage_Fad.ShowModal;
            frm_Umanage_Fad.Free;
        end;
        if LevelType='财务入库单' then //单据名称
        begin
          Public_Do:='Business_money';// 同价调拨单
          Public_Do_Result:='';
          frmmoneystock:=tfrmmoneystock.Create(self);
          frmmoneystock.ShowModal;
          frmmoneystock.Free;
        end;
        if LevelType='库存报溢单' then //单据名称
        begin
            Public_Do:='stock_outed';// 受托代销入库单
            Public_Do_Result:='';
           fmOverflow:=tfmOverflow.Create(self);
            fmOverflow.ShowModal;
            fmOverflow.Free;
        end;
        if LevelType='非营业性入库单' then //单据名称
        begin
            Public_Do:='Business_Storage_in';// 受托代销入库单
            Public_Do_Result:='';
             frmin_stock:=Tfrmin_stock.Create(self);
           frmin_stock.ShowModal;
           frmin_stock.Free;
        end;
        if LevelType='套餐定义' then //单据名称
        begin
          Public_Do:='flatedit';// 受托代销入库单
          Public_Do_Result:='';
          fmflat:=Tfmflat.Create(self);
          fmflat.ShowModal;
          fmflat.Free;
        end;
       if LevelType='配送单' then //单据名称
        begin
          ShowFmPosSendbill('1','1',503);//配送单；
        end;
        if LevelType='预定商品配送单' then //单据名称
        begin
          ShowYDPosSendbill('1','1',503)//预定配送//预定商品配送单；
        end;
        if LevelType='配送退货单' then //单据名称
        begin
          ShowUNPosSendbill('1','1',505);//配送退货单；
        end;
        if LevelType='新店铺货' then //单据名称
        begin
          Public_Do:='edited';// 受托代销入库单
          Public_Do_Result:='';
          fmshopgoods:=tfmshopgoods.Create(self);
          fmshopgoods.ShowModal;
          fmshopgoods.Free;
        end;
        if LevelType='赠品定义单' then //单据名称
        begin
          Public_Do:='edited';// 受托代销入库单
          Public_Do_Result:='';
          fmZSmanager:=tfmZSmanager.Create(self);
          fmZSmanager.ShowModal;
          fmZSmanager.Free;
        end;
        if LevelType='现金费用单' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),1,false);
        end;
        if LevelType='一般费用单' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),2,false);
        end;
        if LevelType='其它收入单' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),3,false);
        end;
        if LevelType='待摊费用发生单' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),4,false);
        end;
        if LevelType='待摊费用摊销单' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),5,false);
        end;
        if LevelType='库存退货单' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do:='Edited';
          FmCancel:=tFmCancel.Create(self);
          FmCancel.ShowModal;
          FmCancel.Free;
        end;
        if LevelType='财务退货单' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do:='Edited';
          fmfinanceUnpos:=tfmfinanceUnpos.Create(self);
          fmfinanceUnpos.ShowModal;
          fmfinanceUnpos.Free;
        end;
        if LevelType='应付款增加' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),6,false);
        end;
        if LevelType='应收款增加' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),7,false);
        end;
        if LevelType='应付款减少' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),8,false);
        end;
        if LevelType='应收款减少' then //单据名称
        begin
          Public_Do:='';// 受托代销入库单
          Public_Do_Result:='';
          w_skBill('Edit',trim(dmmain.CDSquery.fieldbyname('receipt_no').asstring),9,false);
        end;
    end;
    if Trim(LevelType)='' then   //如果草稿单据的条数为空
    begin
        Exit;
    end;
    try
    dmmain.cdsquery.Refresh;
    DBGRID1.Refresh;
    DBGRID1.DataSource.DataSet.EnableControls;
    except
      DBGRID1.DataSource.DataSet.EnableControls;
    end;
end;

procedure Tfrm_Business_Draft.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmmain.cdsquery.Close;
  dmmain.cdsquery.Data:=null;
  Action:=cafree;
end;

procedure Tfrm_Business_Draft.ComboBox1Change(Sender: TObject);
var
    tempstr:widestring;
begin
    tempstr:='';
    if Combobox1.ItemIndex=0 then
    begin
        tempstr:='Select Copy_Date,Receipt_Name,Receipt_No,Condense,Proposer,Level_Count,Examine_Man1,Examine_Man2,Examine_Man3,Examine_Man4,Examine_Man5,Level_Name1,Level_Name2,Level_Name3,Level_Name4,Level_Name5,E1,E2,E3,E4,E5,check_result as 审核级数 from'
        +' [V_Stock_Level]'
        +' where Check_Result<>6 and Flag_sign='+''''+trim('草稿')+''''+' and ( Examine_Man1 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man2 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man3 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man4 like'+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man5 like '+''''+trim('%'+Handle_No+'%')+''''
    +') and  (e1 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e1 is null) and (e2 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e2 is null) and (e3 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e3 is null) and (e4 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e4 is null )and (e5 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e5 is null) and RE_Part='+''''+trim(Handle_part)+'''';
    end;
    dmmain.CDSquery.Data:=null;
    dmmain.CDSquery.Close;
     //wg edit 3-14   begin
    try
    dmmain.CDSquery.Data:=ADISP.getrecord(tempstr);
    except
    end;
    dmmain.CDSquery.Open;
    settitle;   //设置网格标题
    ComboBox2.ItemIndex:=0;
//Receipt_No,Receipt_Name,Level_Count,Condense,Proposer,Examine_Man1,Examine_Man2,Examine_Man3,Examine_Man4,Examine_Man5,Check_Result

end;

procedure Tfrm_Business_Draft.ComboBox2Change(Sender: TObject);
var
    tempstr:widestring;

begin
    tempstr:='';
    if Combobox2.ItemIndex=0 then
    begin
        tempstr:='Select Copy_Date,Receipt_Name,Receipt_No,Condense,Proposer,Level_Count,';
        tempstr:=tempstr+'E1,E2,E3,E4,E5,check_result as 审核级数 from [V_Stock_Level]'+' where  Check_Result<> 6 and Flag_sign=''草稿'''+' and ( Examine_Man1 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man2 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man3 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man4 like'+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man5 like '+''''+trim('%'+Handle_No+'%')+''''
    +') and  (e1 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e1 is null) and (e2 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e2 is null) and (e3 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e3 is null) and (e4 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e4 is null )and (e5 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e5 is null) and RE_Part='+''''+trim(Handle_part)+'''';
    end
    else
    begin
        tempstr:='Select Copy_Date,Receipt_Name,Receipt_No,Condense,Proposer,Level_Count,';
        tempstr:=tempstr+'E1,E2,E3,E4,E5,check_result as 审核级数 from [V_Stock_Level]'+' where Check_Result<> 6 and Receipt_Name='''+Trim(ComboBox2.Text)+''' and Flag_sign=''草稿'''+' and ( Examine_Man1 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man2 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man3 like '+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man4 like'+''''+trim('%'+Handle_No+'%')+''''+' or Examine_Man5 like '+''''+trim('%'+Handle_No+'%')+''''
    +') and  (e1 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e1 is null) and (e2 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e2 is null) and (e3 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e3 is null) and (e4 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e4 is null )and (e5 not like '+''''+trim('%'+Handle_Man+'%')+''''+' or e5 is null) and RE_Part='+''''+trim(Handle_part)+'''';
    end;
    dmmain.CDSquery.Close;
 //wg edit 3-14   begin
    dmmain.CDSquery.Data:=adisp.getrecord(tempstr);
    dmmain.CDSquery.Open;
    settitle;
   ComboBox1.ItemIndex:=0;
end;


procedure Tfrm_Business_Draft.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Business_Draft.BtnDeleteClick(Sender: TObject);
begin
   if not (dmmain.CDSquery.Active) then  exit;

  if application.MessageBox(pchar('是否确定删除待办单据：['+trim(dmmain.CDSquery.Fieldbyname('Receipt_No').AsString)+']?'),pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
  begin
    try
      DBGRID1.DataSource.DataSet.DisableControls;
      DeleteStock(trim(dmmain.CDSquery.Fieldbyname('Receipt_No').AsString));
      dmmain.cdsquery.Refresh;
      DBGRID1.Refresh;
      DBGRID1.DataSource.DataSet.EnableControls;
    except
    end;
  end;
end;

procedure Tfrm_Business_Draft.DBGrid1TitleClick(Column: TColumn);
begin
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,dbgrid1,column);
end;

end.
