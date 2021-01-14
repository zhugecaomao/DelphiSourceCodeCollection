unit Main;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, jpeg, StdCtrls, Mask,
  Grids, ImgList, TeEngine, TeeFunci, Series, TeeProcs,
  Chart,Registry,iniFiles, WinSkinData, fm_icon, Menus;
type
    Tfrm_Main = class(TForm)
    P_anel1: TPanel;
    Panel_Title: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    P1: TPanel;
    Panel4: TPanel;
    ImageList2: TImageList;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ListView2: TListView;
    ListView3: TListView;
    ListView4: TListView;
    Cmd_Stock: TSpeedButton;
    Cmd_Sale: TSpeedButton;
    Cmd_Storage: TSpeedButton;
    Cmd_Money: TSpeedButton;
    Cmd_lead: TSpeedButton;
    Cmd_wholesale: TSpeedButton;
    Cmd_decision: TSpeedButton;
    Cmd_Cancel: TSpeedButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    SpeedButton36: TSpeedButton;
    Image_Title: TImage;
    TabSheet5: TTabSheet;
    ListView5: TListView;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    ImageList3: TImageList;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;

    ListView1: TListView;
    Lab_Title: TPanel;
    Frame11: TFrame1;
    Frame12: TFrame1;
    Frame13: TFrame1;
    Frame14: TFrame1;
    Frame15: TFrame1;
    spbbatch: TSpeedButton;
    TabSheet6: TTabSheet;
    lviewbatch: TListView;
    TabSheet7: TTabSheet;
    ListView6: TListView;
    Frame16: TFrame1;
    Frame17: TFrame1;
    Frame18: TFrame1;
    Frame19: TFrame1;
    Frame110: TFrame1;
    Frame111: TFrame1;
    ImageListView2: TImageList;
    ImageListview3: TImageList;
    Frame118: TFrame1;
    MainMenu1: TMainMenu;
    n40: TMenuItem;
    n41: TMenuItem;
    n42: TMenuItem;
    n43: TMenuItem;
    n44: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    n45: TMenuItem;
    n46: TMenuItem;
    n47: TMenuItem;
    n48: TMenuItem;
    n49: TMenuItem;
    n50: TMenuItem;
    Frame112: TFrame1;
    Frame113: TFrame1;
    Frame114: TFrame1;
    Frame115: TFrame1;
    Frame116: TFrame1;
    Timer1: TTimer;
    Tabcw: TTabSheet;
    ListView7: TListView;
    Frame117: TFrame1;
    N62: TMenuItem;
    Frame119: TFrame1;
    N63: TMenuItem;
    N64: TMenuItem;
    Frame120: TFrame1;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cmd_CancelClick(Sender: TObject);
    procedure Cmd_leadClick(Sender: TObject);
    procedure Cmd_StockClick(Sender: TObject);
    procedure Cmd_StorageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListView1Click(Sender: TObject);
    procedure Cmd_SaleClick(Sender: TObject);
    procedure ListView2Click(Sender: TObject);
    procedure ListView3Click(Sender: TObject);
    procedure ListView4Click(Sender: TObject);
    procedure Cmd_MoneyClick(Sender: TObject);
    procedure Cmd_wholesaleClick(Sender: TObject);
    procedure Cmd_decisionClick(Sender: TObject);
    procedure ListView5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure spbbatchClick(Sender: TObject);
    procedure GroupBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lviewbatchClick(Sender: TObject);
    procedure Frame16Click(Sender: TObject);
    procedure Frame17Click(Sender: TObject);
    procedure Frame18Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure Frame11Click(Sender: TObject);
    procedure Frame12Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure Frame118Click(Sender: TObject);
    procedure Frame15Click(Sender: TObject);
    procedure Frame14Click(Sender: TObject);
    procedure Frame13Click(Sender: TObject);
    procedure Frame19Click(Sender: TObject);
    procedure Frame110Click(Sender: TObject);
    procedure Frame111Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure ListView6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure n45Click(Sender: TObject);
    procedure ListView7Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure Frame17Label1Click(Sender: TObject);
    procedure Frame117Click(Sender: TObject);
    procedure n47Click(Sender: TObject);
    procedure Frame119Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
    DeltaZoom:Integer;
    DisPos: Integer;
    f:TiniFile;
    Land_Type,Land_Name:string;
    procedure Tmycolor(Skinids:integer);
  public
    { Public declarations }
    procedure ShowForm(FormClass: TFormClass);
  end;

var
  frm_Main: Tfrm_Main;
  x,y,i:integer;
  SysInfo: String;
implementation

uses Stock_Contract, Stock_Enter,
  Stock_Fad, Stock_Pay,  Stock_Report, Umanage_Fad,
   Price_Chang,
   Sale_Contract,
   Goods_Requirement,  Data, 
  Examine_Verify, func, Business_Draft, Quality_Check,
  Goods_Write,  Stock_Enter_Report, Company,
   Login, Unitdwzy, Umoneystock, Usysteminit, fm_Scrap,
  fm_Overflow, fm_Check, Uinstock, Ustockstates, usystem, Uflat, untdatadm,
  fm_BatchGuest, UntAskGoodsPlan, UntPosSendBill, UntPosAskBackBill,
  UntPosQuestBillStr, untPubQueryDB, Untps_query, Untwarn_limit,
  Untsalemoney, dlg_warning_limit, Untcompanyinit, UntSystemset,
  Stock_Fad_Query, Check_Query, untOut_strip, untScrap, untoverflow_query,
  Untwldw, Untbatchiput, untwldwgoodsquery, Untbatchmanager, Untbasegrid,
  UntWldwStaff, UntGoodsStaff, UntMoneyStaff, UntGoodsSale, UntContactwarn,
  Untbcjg, Untbcap, dlgkqdate, Unitkqsj, Untnewshopgoods, UntTotalStaff,
  UKqdatamanager, Ustocking, UPosGoods, UGlassStaff, onlygoods, UStockType,
  UDlgonlygoods, UTotalbreed, UUnPos, UMsgmanager, UntZsManager, Unitbbs,
  USetAgion, w_more, AccountSelect, Y_DealIn, UYdPosBill, UOrderGoods,
  UFlatQuery, Ufinance, UPresent, UNewShopQuery, UStock_cancel, UUnfinance,
  UBacthDataQuery, UBacthstaff;

{$R *.dfm}
///////////////////////////
procedure Tfrm_Main.Tmycolor(Skinids:integer);
var
  i:integer;
begin
  for i:=0 to self.ComponentCount-1 do
  begin
    if  (self.Components[i] is TFrame1) then
    begin
      case Skinids of
      0,2: (self.Components[i] as TFrame1).Color:=$d8e9ec;
      1:   (self.Components[i] as TFrame1).Color:=$F2ded5;
      3:   (self.Components[i] as TFrame1).Color:=$F0F0F0;
      4:   (self.Components[i] as TFrame1).Color:=$E0E0E0;
      5:   (self.Components[i] as TFrame1).Color:=$E8E8E8;
      6:   (self.Components[i] as TFrame1).Color:=$C0C0C0;
      end ;
    end;
  end;
end;
//////////////////////////
procedure Tfrm_Main.ShowForm(FormClass: TFormClass);
begin
  With FormClass.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;


procedure Tfrm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sql:widestring;
begin
  try
    frm_Data.Socket_Connection.Connected:=False;  //释放服务器的连接
    dmmain.socketpublic.Connected:=false;
    detroy;//释放接口;      如果没有释放接口，会导致内存错误;
    //application.Terminate;
    Action:=Cafree;
  except
  end;
end;

procedure Tfrm_Main.Cmd_CancelClick(Sender: TObject);
var
  sql:widestring;
begin
    Image_Title.Top:=Cmd_Cancel.Top + 7;
    if Application.MessageBox(' 确定需要退出【连锁销售管理系统】吗？请确认！','【眼镜连锁销售管理系统】',mb_iconquestion+mb_okcancel)=idok then
    begin
      detroy;//释放接口;
      frm_Data.Socket_Connection.Connected:=False;  //释放服务器的连接
      dmmain.socketpublic.Connected:=false;
      application.Terminate;
    end
    else
    begin
      Cmd_Stock.Click;
    end;;
end;

procedure Tfrm_Main.Cmd_leadClick(Sender: TObject);
begin
    frm_Main.Panel_Title.Caption:='【连锁管理系统】->【基本信息】';
    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=True;
    TabSheet5.TabVisible:=False;
    TabSheet6.TabVisible:=false;
    TabSheet7.TabVisible:=false;
    ListView1.Visible:=False;
    ListView2.Visible:=False;
    ListView3.Visible:=False;
    ListView4.Visible:=True;
    Tabcw.TabVisible:=false;
    Image_Title.Top:=Cmd_lead.Top + 7;
end;

procedure Tfrm_Main.Cmd_StockClick(Sender: TObject);
begin
    frm_Main.Panel_Title.Caption:='【连锁管理系统】->【采购管理】';
    Image_Title.Top:=Cmd_Stock.Top +7;
    TabSheet1.TabVisible:=True;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
    TabSheet5.TabVisible:=False;
    TabSheet6.TabVisible:=false;
    ListView1.Visible:=True;
    ListView2.Visible:=False;
    ListView3.Visible:=False;
    ListView4.Visible:=False;
    TabSheet7.TabVisible:=false;
    Tabcw.TabVisible:=false;
end;

procedure Tfrm_Main.Cmd_StorageClick(Sender: TObject);
begin
    frm_Main.Panel_Title.Caption:='【连锁管理系统】->【库存管理】';
    Image_Title.Top:=Cmd_Storage.Top + 7 ;
    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=True;
    TabSheet4.TabVisible:=False;
    TabSheet5.TabVisible:=False;
    TabSheet6.TabVisible:=false;
    TabSheet7.TabVisible:=false;
    ListView1.Visible:=False;
    ListView2.Visible:=False;
    ListView3.Visible:=True;
    ListView4.Visible:=False;
    Tabcw.TabVisible:=false;
end;

procedure Tfrm_Main.FormShow(Sender: TObject);
var
    tmp: integer;
    FWidth,i:integer;
    s:string;
begin
    lab_title.Top:=PageControl1.Top;
    TabSheet1.TabVisible:=True;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
    Tmycolor(Skinid);//设置颜色；
    Cmd_stock.Click;
    tmp := 0;
    Scaled:=TRUE;
    DeltaZoom:=5;
    Lab_Title.Width:=self.Width;
    StatusBar1.Panels[0].Text:='当前操作员：'+trim(Handle_Man);
    StatusBar1.Panels[1].Text:='部门编号：'+trim(Handle_Part);
    StatusBar1.Panels[2].Text:='使用仓库编号：'+trim(shopid);
    getlock(qx,1,listview1.items.count);
    getlock(qx,2,listview3.items.count);
    getlock(qx,3,lviewbatch.items.count);
    getlock(qx,4,listview4.items.count);
    getlock(qx,5,listview5.items.count);
    getlock(qx,6,listview6.items.count);
    getlock(qx,7,listview7.items.count);
    qxstr:='';
      //////////////////////////////////////
end;

procedure Tfrm_Main.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (shift = [ssAlt]) and (key = vk_F4) then
    begin
        shift := [];
        key := 0;
    end;
end;

procedure Tfrm_Main.ListView1Click(Sender: TObject);
begin
    if listview1.Selected <> nil then
    begin
      if loginlock[listview1.Selected.Index ]=0 then exit;
        case listview1.ItemIndex of
        0://商品需求
        begin
            Public_Do:='';
            Public_Do:='Goods_Requirement_str';
            Public_Do_Result:='';
            frm_Goods_Requirement:=Tfrm_Goods_Requirement.Create(self);
            frm_Goods_Requirement.ShowModal;
            frm_Goods_Requirement.Free;
        end;
        1: //采购合同
        begin
            Public_Do:='';
            Public_Do:='Stock_0002';
            Public_Do_Result:='';
            frm_Stock_Contract:=Tfrm_Stock_Contract.Create(self);
            frm_Stock_Contract.ShowModal;
            frm_Stock_Contract.Free;
        end;
        2: //来货登记
        begin
            Public_Do:='';
            Public_Do:='Stock_0008';
            Public_Do_Result:='';
            frm_Goods_Write:=Tfrm_Goods_Write.Create(self);
            frm_Goods_Write.ShowModal;
            frm_Goods_Write.Free;
        end;
        3: //质量验收
        begin
            Public_Do:='';
            Public_Do:='Stock_0007';
            Public_Do_Result:='';
            frm_Quality_Check:=Tfrm_Quality_Check.Create(self);
            frm_Quality_Check.ShowModal;
            frm_Quality_Check.Free;
        end;
        4: //采购退货管理
        begin
            Public_Do:='';
            Public_Do:='Stock_0004';
            Public_Do_Result:='';
            frm_Stock_Fad:=Tfrm_Stock_Fad.Create(self);
            frm_Stock_Fad.ShowModal;
            frm_Stock_Fad.Free;
        end;
        5: //采购入库
        begin
            Public_Do:='';
            Public_Do:='Stock_0003';
            Public_Do_Result:='';
            frm_Stock_Enter:=Tfrm_Stock_Enter.Create(self);
            frm_Stock_Enter.ShowModal;
            frm_Stock_Enter.Free;
        end;
        6:      //财务入库
        begin
            Public_Do:='money_stock';
            frmmoneystock:=tfrmmoneystock.Create(self);
            frmmoneystock.ShowModal;
            frmmoneystock.Free;
        end;
        7:  //采购付款
        begin
            Public_Do:='';
            Public_Do:='Stock_0005';
            Public_Do_Result:='';
            frm_Stock_Pay:=Tfrm_Stock_Pay.Create(self);
            frm_Stock_Pay.ShowModal;
            frm_Stock_Pay.Free;
        end;
        8:   //委托
        begin
        end;
        end;
    end;
end;

procedure Tfrm_Main.Cmd_SaleClick(Sender: TObject);
begin
    frm_Main.Panel_Title.Caption:='【连锁管理系统】->【销售管理】';
    Image_Title.Top:=Cmd_Sale.Top +7;
    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=True;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
    TabSheet5.TabVisible:=False;


    ListView1.Visible:=False;
    ListView2.Visible:=True;
    ListView3.Visible:=False;
    ListView4.Visible:=False;

end;

procedure Tfrm_Main.ListView2Click(Sender: TObject);
var i:integer;
begin
    if listview2.Selected <> nil then
    begin
    ///ydy 2004-5-20 modify
    i := listview2.Selected.Index;
        if  listview2.Items[i].Caption = '销售合同' then
        begin
            frm_Sale_Contract:=Tfrm_Sale_Contract.Create(self);
            frm_Sale_Contract.ShowModal;
            frm_Sale_Contract.Free;
            exit;
        end;
        if  listview2.Items[i].Caption = '库存状况' then
        begin
        end;
  end;
end;

procedure Tfrm_Main.ListView3Click(Sender: TObject);
begin
    if listview3.Selected <> nil then
    begin
      if loginlock[listview3.Selected.Index+listview1.Items.Count]=0 then exit;
        case listview3.ItemIndex of
        0:  //非运营性出库
        begin
            Public_Do:='';
            Public_Do:='Storage_Umanage_Fad';
            Public_Do_Result:='';
            frm_Umanage_Fad:=Tfrm_Umanage_Fad.Create(self);
            frm_Umanage_Fad.ShowModal;
            frm_Umanage_Fad.Free;
        end;
        1:
        begin
           Public_Do:='instock_0001';  //入库
           Public_Do_Result:='';
           frmin_stock:=Tfrmin_stock.Create(self);
           frmin_stock.ShowModal;
           frmin_stock.Free;
        end;
        2: //商品报损
        begin
          Public_Do:='';
          Public_Do:='damage_0001';
          fmscrap:=tfmscrap.Create(self);
          fmscrap.ShowModal;
          fmscrap.Free;
        end;
        3:
        begin
          Public_Do:='';
          Public_Do:='Overflow_0001';
          fmOverflow:=tfmOverflow.Create(self);
          fmOverflow.ShowModal;
          fmOverflow.Free;
        end;
        4:  //套餐定义
        begin
          public_do:='';
          public_do:='flatnew';  
          fmflat:=tfmflat.Create(self);
          fmflat.ShowModal;
          fmflat.Free;  
        end;
        5:
        begin   //库存盘点
          Public_Do:='check_001';  //盘点
          fmcheck:=tfmcheck.Create(self);
          fmcheck.ShowModal;
          fmcheck.Free;
        end;
        6:  //库存状况
        begin
          try
          frmstockstates:=Tfrmstockstates.create(self);
          frmstockstates.ShowModal;
          finally
          frmstockstates.Free;
          end;
        end;
        7:     // 预警管理
        begin
          fm_limit_warning:=tfm_limit_warning.Create(self);
          fm_limit_warning.ShowModal;
          fm_limit_warning.Free;
        end;
        8:  //上下限管理
        begin
            fmstockwarnlimit:=Tfmstockwarnlimit.Create(self);
            fmstockwarnlimit.ShowModal;
            fmstockwarnlimit.Free;
        end;
        9:  //价格管理
        begin
          fmsalemoney:=Tfmsalemoney.Create(self);
          fmsalemoney.ShowModal;
          fmsalemoney.Free;
        end;
        10:  //镜片矩形分布
        begin
          fmGlassStaff:=TfmGlassStaff.Create(self);
          fmGlassStaff.ShowModal;
          fmGlassStaff.Free;
        end;
        11:  //赠送商品管理
        begin
          Public_Do:='';
          Public_Do:='new';
          Public_Do_Result:='';
          fmZSmanager:=TfmZSmanager.Create(self);
          fmZSmanager.ShowModal;
          fmZSmanager.Free;
        end;
        12:  //库存退货
        begin
          Public_Do:='';
          FmCancel:=tFmCancel.Create(self);
          FmCancel.ShowModal;
          FmCancel.Free;
        end;
        13:  //财务退货
        begin
          Public_Do:='';
          fmfinanceUnpos:=tfmfinanceUnpos.Create(self);
          fmfinanceUnpos.ShowModal;
          fmfinanceUnpos.Free;
        end;
        end;
    end;
end;

procedure Tfrm_Main.ListView4Click(Sender: TObject);
begin
    if listview4.Selected <> nil then
    begin
      if loginlock[listview4.Selected.Index+listview3.Items.Count+lviewbatch.Items.Count+listview1.Items.Count ]=0 then exit;
        case listview4.ItemIndex of
        0:
        begin
          fmbatchguest:=tfmbatchguest.Create(self);
          try
           fmbatchguest.ShowModal;
          finally
           fmbatchguest.Free;
          end;
        end;
        1:
        begin
          frmzyll:=tfrmzyll.Create(self);
          frmzyll.ShowModal;
          frmzyll.Free;
        end;
        2:
        begin
          fmwldw:=tfmwldw.Create(self);
          fmwldw.ShowModal;
          fmwldw.free;
        end;
        3:
        begin
          fmBatchmanager:=tfmBatchmanager.Create(self);
          fmBatchmanager.ShowModal;
          fmBatchmanager.Free; 
        end;
        4:
        begin
            
         frmsysteminit:=tfrmsysteminit.Create(self);
         frmsysteminit.ShowModal;
         frmsysteminit.Free;    
        end;
        5:
        begin
          fmBasegrid:=TfmBasegrid.Create(self);
          fmBasegrid.ShowModal;
          fmBasegrid.Free;
        end;
        7:
        begin
          fm_company:=Tfm_company.Create(self);
          fm_company.ShowModal;
          fm_company.Free;
        end;
        8:
        begin
          fmBcJg:=tfmBcJg.Create(self);
          fmBcJg.ShowModal;
          fmBcJg.Free;
        end;
        9:
        begin
          fmBcap:=tfmBcap.Create(self);
          fmBcap.ShowModal;
          fmBcap.Free;
        end;
        10:
        begin
          frmkqsj:=tfrmkqsj.Create(self);
          frmkqsj.ShowModal;
          frmkqsj.Free;
        end;
        11:
        begin
          fmKqManager:=tfmKqManager.Create(self);
          fmKqManager.ShowModal;
          fmKqManager.Free;
        end;
        12:
        begin
          dlgkqdata:=tdlgkqdata.Create(self);
          dlgkqdata.ShowModal;
          dlgkqdata.Free;
        end;
        end;
    end;
end;

procedure Tfrm_Main.Cmd_MoneyClick(Sender: TObject);
begin
  Image_Title.Top:=Cmd_Money.Top +7;
  frm_Main.Panel_Title.Caption:='【连锁管理系统】->【财务管理】';
  TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=False;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
  TabSheet5.TabVisible:=false;
  TabSheet6.TabVisible:=false;
  ListView1.Visible:=False;
  ListView2.Visible:=False;
  ListView3.Visible:=False;
  ListView4.Visible:=false;
  ListView5.Visible:=false;
  TabSheet7.TabVisible:=false;
  Tabcw.TabVisible:=true;
  listview7.Visible:=true;
end;

procedure Tfrm_Main.Cmd_wholesaleClick(Sender: TObject);
begin
  frm_Main.Panel_Title.Caption:='【连锁管理系统】->【决策支持】';
  Image_Title.Top:=Cmd_wholesale.Top +7;
  TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=False;
  TabSheet3.TabVisible:=false;
  TabSheet4.TabVisible:=False;
  TabSheet5.TabVisible:=False;
  TabSheet6.TabVisible:=false;
  TabSheet7.TabVisible:=true;
  Tabcw.TabVisible:=false;
end;

procedure Tfrm_Main.Cmd_decisionClick(Sender: TObject);
begin
    Image_Title.Top:=Cmd_decision.Top +7;
    frm_Main.Panel_Title.Caption:='【连锁管理系统】->【系统维护】';
    TabSheet1.TabVisible:=False;
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
    TabSheet5.TabVisible:=True;
    TabSheet6.TabVisible:=false;
    ListView1.Visible:=False;
    ListView2.Visible:=False;
    ListView3.Visible:=False;
    ListView4.Visible:=false;
    ListView5.Visible:=True;
    TabSheet7.TabVisible:=false;
    Tabcw.TabVisible:=false;
end;

procedure Tfrm_Main.ListView5Click(Sender: TObject);
var
  sql:widestring;
begin
    if listview5.Selected <> nil then
    begin
      if loginlock[listview5.Selected.Index+listview4.Items.Count+listview3.Items.Count+lviewbatch.Items.Count+listview1.Items.Count ]=0 then exit;
        case listview5.ItemIndex of
        0:
        begin
          frm_Login := Tfrm_Login.Create(self);
          frm_Login.model:=1;
          frm_Login.ShowModal;
          frm_Login.Free;
        end;
        1:
        begin
          fm_system:=tfm_system.Create(self);
          fm_system.ShowModal;
          fm_system.Free;
          Tmycolor(SKinid);
        end;
        2:
        begin
          frmbbs:=tfrmbbs.Create(self);
          frmbbs.ShowModal;
          frmbbs.Free; 
        end;
        3:
        begin

           sql:='select * from vpart_storage';
            dmmain.CDSquery.Close;
            dmmain.CDSquery.Data:=null;
            try
              dmmain.CDSquery.Data:=adisp.GetRecord(sql);
              dmmain.CDSquery.Open;
            except
            end;
            fmSystemSet:=TfmSystemSet.Create(self);
            fmSystemSet.ShowModal;
            fmSystemSet.Free;
        end;
        4:
        begin
            fmSetAgion:=TfmSetAgion.Create(self);
            fmSetAgion.ShowModal;
            fmSetAgion.Free;
        end;
        5:
        begin
          fmMsgmanager:=tfmMsgmanager.Create(self);
          fmMsgmanager.ShowModal;
          fmMsgmanager.Free; 
        end;
        6:
        begin
            frm_Examine_Verify:=Tfrm_Examine_Verify.Create(self);
            frm_Examine_Verify.ShowModal;
            frm_Examine_Verify.Free;
        end;
        7:
        begin
          Fm_RemoteDb:=tFm_RemoteDb.create(self);
          Fm_RemoteDb.ShowModal;
          Fm_RemoteDb.Free;
        end;
        end;
    end;
end;

procedure Tfrm_Main.SpeedButton2Click(Sender: TObject);
begin
    frm_Business_Draft:=Tfrm_Business_Draft.Create(self);
    frm_Business_Draft.ShowModal;
    frm_Business_Draft.Free;
end;

procedure Tfrm_Main.spbbatchClick(Sender: TObject);
begin
  frm_Main.Panel_Title.Caption:='【连锁管理系统】->【配送管理】';
  Image_Title.Top:=spbbatch.Top +7;
  TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=False;
  TabSheet3.TabVisible:=false;
  TabSheet4.TabVisible:=False;
  TabSheet5.TabVisible:=False;
  TabSheet6.TabVisible:=true;
  TabSheet7.TabVisible:=false;
  Tabcw.TabVisible:=false;
end;

procedure Tfrm_Main.GroupBox3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  i:Integer;
begin
  for i:=0 to componentcount-1 do
  begin
    if self.Components[i] is TFrame1 then
    if TFrame1(Components[i]).Color=$00FFBFBF then
    begin
      TFrame1(Components[i]).Color:=SELF.Color;
      TFrame1(Components[i]).Label1.Font.Color:=clActiveCaption;
    end;
  end;
end;

procedure Tfrm_Main.lviewbatchClick(Sender: TObject);    //配送管理
begin
  if lviewbatch.Selected <>nil then
    if loginlock[lviewbatch.Selected.Index+listview3.Items.Count+listview1.Items.Count ]=0 then exit;
  case lviewbatch.ItemIndex of
    0:
    begin
      ShowAskGoodsPlanFm('','',501);;//配送申请单；
    end;
    1:
    begin
      fmps_query:=tfmps_query.Create(self); //缺货分析
      fmps_query.ShowModal;
      fmps_query.Free;
    end;
    2:
    begin
      fmPosGoods:=tfmPosGoods.Create(self); //数量找平
      fmPosGoods.ShowModal;
      fmPosGoods.Free;
    end;
    3:
    begin
      ShowFmPosSendbill('','',503);//配送单；
    end;
    4:
    begin
      ShowYDPosSendbill('','',503)//预定配送
    end;
    5:
    begin
      //配送收货;
      fmbatchinput:=tfmbatchinput.Create(self);
      fmbatchinput.ShowModal;
      fmbatchinput.Free; 
    end;
    6:
    begin
      ShowUNPosSendbill('','',505);
    end;
    7:     //新店铺货
    begin
      //
      Public_Do:='';
      fmshopgoods:=tfmshopgoods.Create(self);
      fmshopgoods.ShowModal;
      fmshopgoods.Free;
    end;
     8:     //数据查询
    begin

      fmBacthQuery:=tfmBacthQuery.Create(self);
      fmBacthQuery.ShowModal;
      fmBacthQuery.Free;
    end;
     9:     //数据对比//
    begin

      fmBacthStaff:=tfmBacthStaff.Create(self);
      fmBacthStaff.ShowModal;
      fmBacthStaff.Free;
    end;
  end;
end;

procedure Tfrm_Main.Frame16Click(Sender: TObject);
begin
  Frame16.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame17Click(Sender: TObject);
begin
  Frame17.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame18Click(Sender: TObject);
begin
  Frame18.FrameClick(Sender);
end;

procedure Tfrm_Main.N40Click(Sender: TObject);
begin
  frm_Stock_Enter_Report:=Tfrm_Stock_Enter_Report.Create(self);
  frm_Stock_Enter_Report.Caption:='【采购入库统计查询】';
  frm_Stock_Enter_Report.flag:=0;
  frm_Stock_Enter_Report.ShowModal;
  frm_Stock_Enter_Report.Free;
end;

procedure Tfrm_Main.Frame11Click(Sender: TObject);
begin
  Frame11.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame12Click(Sender: TObject);
begin
  Frame12.FrameClick(Sender);
end;

procedure Tfrm_Main.N41Click(Sender: TObject);
begin
  frmStock_Fad_Query:=TfrmStock_Fad_Query.Create(self);
  frmStock_Fad_Query.Caption:='【采购退货统计查询】';
  frmStock_Fad_Query.ShowModal;
  frmStock_Fad_Query.Free;
end;

procedure Tfrm_Main.N42Click(Sender: TObject);
begin
  frm_Stock_Report:=Tfrm_Stock_Report.Create(self);
  frm_Stock_Report.Caption:='采购报日报';
  frm_Stock_Report.Height:=155;
  frm_Stock_Report.Width:=294;
  frm_Stock_Report.TabSheet1.TabVisible:=True;
  frm_Stock_Report.TabSheet2.TabVisible:=False;
  frm_Stock_Report.TabSheet3.TabVisible:=False;
  frm_Stock_Report.ShowModal;
  frm_Stock_Report.Free;
end;

procedure Tfrm_Main.N43Click(Sender: TObject);
begin
  frm_Stock_Report:=Tfrm_Stock_Report.Create(self);
  frm_Stock_Report.Caption:='采购月报';
  frm_Stock_Report.Height:=155;
  frm_Stock_Report.Width:=294;
  frm_Stock_Report.TabSheet2.TabVisible:=True;
  frm_Stock_Report.TabSheet1.TabVisible:=False;
  frm_Stock_Report.TabSheet3.TabVisible:=False;
  frm_Stock_Report.ShowModal;
  frm_Stock_Report.Free;
end;

procedure Tfrm_Main.N44Click(Sender: TObject);
begin
   frm_Stock_Report:=Tfrm_Stock_Report.Create(self);
  frm_Stock_Report.Caption:='采购报表(任意时间段)';
  frm_Stock_Report.Height:=174;
  frm_Stock_Report.Width:=410;
  frm_Stock_Report.TabSheet3.TabVisible:=True;
  frm_Stock_Report.TabSheet2.TabVisible:=False;
  frm_Stock_Report.TabSheet1.TabVisible:=False;
  frm_Stock_Report.ShowModal;
  frm_Stock_Report.Free;
end;

procedure Tfrm_Main.N50Click(Sender: TObject);
begin
   frmcheck_query:=Tfrmcheck_query.Create(self);
  try
    frmcheck_query.ShowModal;
  finally
    frmcheck_query.Free;
  end;
end;

procedure Tfrm_Main.N46Click(Sender: TObject);
begin
  frm_Out_strip_Query:=Tfrm_Out_strip_Query.Create(self);
  frm_Out_strip_Query.Caption:='【出库单查询】';
  frm_Out_strip_Query.ShowModal;
  frm_Out_strip_Query.Free;
end;

procedure Tfrm_Main.N48Click(Sender: TObject);
begin
  fm_Scrap_Query:=Tfm_Scrap_Query.Create(self);
  fm_Scrap_Query.Caption:='【报损单查询】';
  fm_Scrap_Query.ShowModal;
  fm_Scrap_Query.Free;
end;

procedure Tfrm_Main.N49Click(Sender: TObject);
begin
  fm_OverFlow_Query:=Tfm_OverFlow_Query.Create(self);
  fm_OverFlow_Query.Caption:='【报溢单查询】';
  fm_OverFlow_Query.ShowModal;
  fm_OverFlow_Query.Free;
end;

procedure Tfrm_Main.Frame118Click(Sender: TObject);
begin
  Frame118.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame15Click(Sender: TObject);
begin
  Frame15.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame14Click(Sender: TObject);
begin
  Frame14.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame13Click(Sender: TObject);
begin
  Frame13.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame19Click(Sender: TObject);
begin
  Frame19.FrameClick(Sender);
end;

procedure Tfrm_Main.Frame110Click(Sender: TObject);
begin
  Frame110.FrameClick(Sender);

end;

procedure Tfrm_Main.Frame111Click(Sender: TObject);
begin
  Frame111.FrameClick(Sender);

end;

procedure Tfrm_Main.N61Click(Sender: TObject);
begin
  fmwldwgoodsquery:=tfmwldwgoodsquery.Create(self);
  fmwldwgoodsquery.ShowModal;
  fmwldwgoodsquery.Free; 
end;

procedure Tfrm_Main.ListView6Click(Sender: TObject);

begin
  if ListView6.Selected <>nil then
    if loginlock[ListView6.Selected.Index+listview5.Items.Count+listview4.Items.Count+listview3.Items.Count+lviewbatch.Items.Count+listview1.Items.Count ]=0 then exit;
  case ListView6.ItemIndex of  //供应商业务分析；

    0:begin
      fmWldwStaff:=tfmWldwStaff.Create(self);
      fmWldwStaff.ShowModal;
      fmWldwStaff.Free;
      end;
    1:begin   //往来业务
        fmWldwStaff:=tfmWldwStaff.Create(self);
        fmWldwStaff.PageC1.ActivePageIndex:=3;
        fmWldwStaff.TabGoods.TabVisible:=false;
        fmWldwStaff.TabBackGoods.TabVisible:=false;
        fmWldwStaff.TabFinace.TabVisible:=false;
        fmWldwStaff.ShowModal;
        fmWldwStaff.Free;
      end;

    3:begin   //商品销售排行榜
        fmGoodsSale:=tfmGoodsSale.Create(self);
        fmGoodsSale.ShowModal;
        fmGoodsSale.Free;
      end;
    4:begin   //单品销售排行榜
        fmonlygoods:=tfmonlygoods.Create(self);
        fmonlygoods.ShowModal;
        fmonlygoods.Free;

      end;
    5:begin   //零售旬月年查询;
        fmTotalStaff:=tfmTotalStaff.Create(self);
        fmTotalStaff.ShowModal;
        fmTotalStaff.Free; 
      end;
    6: begin   // 库存状况分析
        try
        frmstockstates:=Tfrmstockstates.create(self);
        frmstockstates.ShowModal;
        finally
        frmstockstates.Free;
        end;
       end;
     7: begin   // 库存总量分析
        try
        FmStockType:=TFmStockType.create(self);
        FmStockType.ShowModal;
        finally
        FmStockType.Free;
        end;
       end;
    8: begin   // 库存变化分析 （全能进销存）
        try
        fmstocking:=Tfmstocking.create(self);
        fmstocking.ShowModals:=0;
        fmstocking.ShowModal;
        finally
        fmstocking.Free;
        end;
       end;
    9: begin   // 库存变化分析 （全能进销存）
        try
        fmTotalBreed:=TfmTotalBreed.create(self);
        fmTotalBreed.ShowModal;
        finally
        fmTotalBreed.Free;
        end;
       end;
    10: begin   // 库存结构分析
        try
        fmStockAmountStaff:=TfmStockAmountStaff.create(self);
        fmStockAmountStaff.ShowModal;
        finally
        fmStockAmountStaff.Free;
        end;
       end;
    11: begin   // 信用报警
        try
        fmContactWarn:=TfmContactWarn.create(self);
        fmContactWarn.ShowModal;
        finally
        fmContactWarn.Free;
        end;
       end;
  end;
end;

procedure Tfrm_Main.Timer1Timer(Sender: TObject);
begin
  simpe(frm_data.Socket_Connection,frm_data.Simple);
  simpe(dmmain.socketpublic,frm_data.Simple);
end;

procedure Tfrm_Main.n45Click(Sender: TObject);
begin
  frm_Stock_Enter_Report:=Tfrm_Stock_Enter_Report.Create(self);
  frm_Stock_Enter_Report.Caption:='【入库单统计查询】';
  frm_Stock_Enter_Report.flag:=1;
  frm_Stock_Enter_Report.ShowModal;
  frm_Stock_Enter_Report.Free;
end;

procedure Tfrm_Main.ListView7Click(Sender: TObject);
var
  a1,a2,a3:string;
begin
  if listview7.Selected<>nil then
  begin
    if loginlock[ListView6.Items.Count+listview5.Items.Count+listview4.Items.Count+listview3.Items.Count+lviewbatch.Items.Count+listview1.Items.Count+listview7.Selected.Index]=0 then exit;
    case listview7.ItemIndex of
    0:  begin
          w_skBill('','',4,false); //待摊发生
        end;
    1:  begin
          w_skBill('','',5,false); //摊销
        end;
    2: begin
         w_skBill('','',1,false); //现金
       end;
    3:  begin
          w_skBill('','',2,false); //一般
        end;
    4:  begin
          w_skBill('','',3,false); //其他
        end;
    5:  begin
          DealinFmshow('gain',''); //经营
        end;
    6:  begin
          DealinFmshow('asset','');
        end;
    7:  begin
          DealinFmshow('bassert','');
        end;
    8: begin
          a1:='00000';a2:='00000';a3:='00000';
          AccountSelectShow(a1,a2,a3,'');
       end;
     9: begin
          financeFmshow('gain','')     //门店独立财务(经营状况表)；
        end;
    10: begin   // 库存变化分析 （全能进销存+金额）
        try
        fmstocking:=Tfmstocking.create(self);
        fmstocking.ShowModals:=1;
        fmstocking.ShowModal;
        finally
        fmstocking.Free;
        end;
        end;
     11:  begin
          w_skBill('','',6,false); //应付增加
        end;
     12:  begin
          w_skBill('','',7,false); //应收增加
        end;
     13:  begin
          w_skBill('','',8,false); //应付减少
        end;
     14:  begin
          w_skBill('','',9,false); //应收减少
        end;
    end;
  end;
end;

procedure Tfrm_Main.N62Click(Sender: TObject);
begin
  fmOrderQuery:=tfmOrderQuery.Create(self);
  fmOrderQuery.ShowModal;
  fmOrderQuery.Free; 
end;

procedure Tfrm_Main.Frame17Label1Click(Sender: TObject);
begin
  Frame17.FrameClick(Sender);

end;

procedure Tfrm_Main.Frame117Click(Sender: TObject);
begin
  Frame117.FrameClick(Sender);
end;

procedure Tfrm_Main.n47Click(Sender: TObject);
begin
  fmFlatQuery:=tfmFlatQuery.Create(self);
  fmFlatQuery.ShowModal;
  fmFlatQuery.Free; 
end;

procedure Tfrm_Main.Frame119Click(Sender: TObject);
begin
  Frame119.FrameClick(Sender);
end;

procedure Tfrm_Main.N63Click(Sender: TObject);
begin
  FmPresentQuery:=tFmPresentQuery.Create(self);
  FmPresentQuery.ShowModal;
  FmPresentQuery.Free;
end;

procedure Tfrm_Main.N64Click(Sender: TObject);
begin
  fmNewShopQuery:=TfmNewShopQuery.Create(Self);
  fmNewShopQuery.ShowModal;
  fmNewShopQuery.Free; 
end;

procedure Tfrm_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  application.Terminate;
end;

end.
