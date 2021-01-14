unit UntSystemset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls,
  DB, Menus, ImgList, DBClient;

type
  TfmSystemset = class(TfmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    GroupBox1: TGroupBox;
    Pc1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnCancel: TBitBtn;
    RdG: TRadioGroup;
    GridBase: TStringGrid;
    GridB: TStringGrid;
    RDg2: TRadioGroup;
    ImageList1: TImageList;
    cdsdata: TClientDataSet;
    TreeBase: TTreeView;
    RBAll: TRadioButton;
    RBclear: TRadioButton;
    MainMenu1: TMainMenu;
    S1: TMenuItem;
    N38: TMenuItem;
    mmi_SetTime: TMenuItem;
    mmi_PrinterSetup: TMenuItem;
    mmi_QuickCode: TMenuItem;
    N37: TMenuItem;
    mmi_kqday: TMenuItem;
    mmi_changePwd: TMenuItem;
    N36: TMenuItem;
    mmi_ChangeOperate: TMenuItem;
    N13: TMenuItem;
    mmi_close: TMenuItem;
    S2: TMenuItem;
    mmi_Agio: TMenuItem;
    mnt_Retail: TMenuItem;
    mmi_saleth: TMenuItem;
    mmi_something: TMenuItem;
    mmi_salejb: TMenuItem;
    mmi_Debt: TMenuItem;
    mmi_CheckDraft: TMenuItem;
    mmi_Todaymoney: TMenuItem;
    mmi_RetailPrint: TMenuItem;
    N14: TMenuItem;
    mmi_QueryDebit: TMenuItem;
    mmi_doback_Qry: TMenuItem;
    mmi_back_Qry: TMenuItem;
    N51: TMenuItem;
    D1: TMenuItem;
    mmi_yoptome: TMenuItem;
    mmi_Order: TMenuItem;
    mmi_sale: TMenuItem;
    mmi_BackGround: TMenuItem;
    mmi_outground: TMenuItem;
    mmi_Gain: TMenuItem;
    mmi_EndCheck: TMenuItem;
    mmi_ordergood: TMenuItem;
    mmi_AwardGuest: TMenuItem;
    N18: TMenuItem;
    mmi_OptometryQuery: TMenuItem;
    mmi_OrderQuery: TMenuItem;
    mmi_Yushou_qry: TMenuItem;
    mmi_debit_Qry: TMenuItem;
    mmi_backgroud_qry: TMenuItem;
    mmi_outmake_qry: TMenuItem;
    mmi_notgain_qry: TMenuItem;
    mmi_gain_qry: TMenuItem;
    N23: TMenuItem;
    mmi_award_qry: TMenuItem;
    O1: TMenuItem;
    mmi_overflow: TMenuItem;
    mmi_scrap: TMenuItem;
    N47: TMenuItem;
    mmi_pan: TMenuItem;
    mmi_stopPan: TMenuItem;
    mmi_Pan_qry: TMenuItem;
    mmi_stopPan_Qry: TMenuItem;
    N25: TMenuItem;
    N31: TMenuItem;
    mmi_WarnLimit: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N42: TMenuItem;
    mmi_stockgoods: TMenuItem;
    mmi_Agood_stockQry: TMenuItem;
    mmiQueryScrap: TMenuItem;
    mmiQryOverflow: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    P1: TMenuItem;
    mmi_shopquehuo: TMenuItem;
    mmi_AskGoodPlan: TMenuItem;
    mmi_PosSendBill: TMenuItem;
    mmi_postQuest: TMenuItem;
    mmi_ReceiveGood: TMenuItem;
    N52: TMenuItem;
    mmi_Qrygetgood: TMenuItem;
    mmi_zfgetgoods_qry: TMenuItem;
    mmi_psgetgoods_qry: TMenuItem;
    mmi_psbackgood_qry: TMenuItem;
    N4: TMenuItem;
    mmi_MoneyBill: TMenuItem;
    mmi_NormalBill: TMenuItem;
    mmi_OtherBill: TMenuItem;
    mmi_DTFS: TMenuItem;
    MMI_DTTX: TMenuItem;
    N50: TMenuItem;
    mmi_cwQry1: TMenuItem;
    mmi_cwQry2: TMenuItem;
    mmi_cwQry3: TMenuItem;
    mmi_cwQry4: TMenuItem;
    mmi_cwQry5: TMenuItem;
    N9: TMenuItem;
    mmi_SingleGuest: TMenuItem;
    mmi_jifen: TMenuItem;
    mmi_water: TMenuItem;
    nni_Guestviisit: TMenuItem;
    mmi_guestAdvice: TMenuItem;
    N20: TMenuItem;
    mmi_Optometry: TMenuItem;
    mmi_GuestAllInfo: TMenuItem;
    mmi_SingleGuestQuery: TMenuItem;
    N12: TMenuItem;
    mmi_ShopBbs: TMenuItem;
    mmi_kaoqing: TMenuItem;
    mmi_yuangong: TMenuItem;
    mmi_ShopLocalInfo: TMenuItem;
    N58: TMenuItem;
    N33: TMenuItem;
    N49: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N11: TMenuItem;
    mmi_stockChange: TMenuItem;
    N41: TMenuItem;
    mmi_SaleSort: TMenuItem;
    mmi_GoodSellSort: TMenuItem;
    mmi_saleTypesort: TMenuItem;
    mmi_SglGoodSort: TMenuItem;
    mmi_CustomerGraph: TMenuItem;
    N39: TMenuItem;
    mmi_PayTotal: TMenuItem;
    N2: TMenuItem;
    mmi_Caculator: TMenuItem;
    mmi_YCanlendar: TMenuItem;
    mmi_AlarmClock: TMenuItem;
    N10: TMenuItem;
    N1: TMenuItem;
    mmi_ShowTip: TMenuItem;
    mmi_About: TMenuItem;
    N3: TMenuItem;
    N19: TMenuItem;
    N26: TMenuItem;
    N34: TMenuItem;
    N40: TMenuItem;
    N44: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridbaseDblClick(Sender: TObject);
    procedure GridbaseSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure RdGClick(Sender: TObject);
    procedure GridBaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RDg2Click(Sender: TObject);
    procedure GridBDblClick(Sender: TObject);
    procedure Pc1Change(Sender: TObject);
    procedure TreeBaseClick(Sender: TObject);
    procedure RBAllClick(Sender: TObject);
    procedure RBclearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    pcol,prow,Mcount:integer;
    qx:array [0..250] of integer;
    qz:string;
    procedure SetGridMenu(menuname:tmainmenu;index:integer);
    procedure SetMenuName(memuname:tmainmenu);
    procedure setqx;
    procedure getqx(Bindex:integer;Eindex:integer;grid:tstringgrid);
    procedure Getfields(grid:tstringgrid;index:integer);
    function ReadTree(Bm:string='';Tnode:TTreeNode=nil):integer;//(1：无数据，2：有数据，3：异常);
    function ReadDone(no:string):boolean;
    procedure WaleAll(index:integer;Flag:boolean;grid:tstringgrid);
  public
    { Public declarations }
  end;

var
  fmSystemset: TfmSystemset;

implementation

uses UntGuestset, untdatadm, func, Main;

{$R *.dfm}
////////////////////////////
procedure TfmSystemset.WaleAll(index:integer;Flag:boolean;grid:tstringgrid);
var
  i,j,p:integer;
  str:string;
begin
  case index of
    0: j:=0;
    1: j:=frm_main.ListView1.Items.Count;
    2: j:=frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
    3: j:=frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
    4: j:=frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
    5: j:=frm_main.ListView5.Items.Count+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
    6: j:=frm_main.ListView5.Items.Count+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count+frm_main.ListView6.Items.Count;
    7..17:
      begin
       j:= frm_main.ListView5.Items.Count+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count;
       if index-7>0 then
       begin
         for i:=1 to index-7 do
         begin
           j:=j+mainmenu1.Items.Items[i-1].Count;
         end;
       end;
      end;
  end;
  if flag then
  begin
    p:=1;
    str:='√';
  end else
  begin
    p:=0;
    str:='';
  end;
  for i:=1 to grid.RowCount-1 do
  begin
    if grid.Cells[1,i]<>'分隔符' then
    begin
      qx[i+j-1]:=p;
      grid.Cells[2,i]:=str;
    end else
    begin
      qx[i+j-1]:=0;
      grid.Cells[2,i]:='';
    end;
  end;
end;
function TfmSystemset.ReadDone(no:string):boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=false;
  sql:='select Done,p_no,employe_name,part,user_pwd,opertype from chang where p_no='+''''+trim(no)+'''';
  cdsdata.Close;
  cdsdata.Data:=null;
  datas:=null;
  try
    datas:=adisp.execSql(sql);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      cdsdata.Open;
      datas:=null;
      if not cdsdata.IsEmpty then
      begin
        qz:=trim(CDSdata.fieldbyname('Done').AsString);
        if qz<>'' then
        begin
          pc1.ActivePageIndex:=0;
          getqx(0,70,gridbase);
          getqx(71,129,gridb);
          getqx(1,gridbase.RowCount-1,gridbase);
        end;
        result:=true;
      end;
    end
  except
  end;
 // cdsdata.Close;
 // cdsdata.Data:=null;
end;
function TfmSystemset.ReadTree(Bm:string='';Tnode:TTreeNode=nil):integer;
var
  sql:widestring;
  node:ttreenode;
  datas:olevariant;
  f,i:integer;
begin
  f:=1;
  if trim(bm)='' then
  begin
    sql:='select part_name as name,part_no as no from part where isnull(one_partno,'+''''+'0'+''''+')='+''''+'0'+'''';
  end else
  begin
    sql:='select p_no as no,employe_name as name from chang where part='+''''+trim(bm)+'''';
  end;
  datas:=null;
  cdsdata.Close;
  cdsdata.Data:=null;
  try
    ipubtemp.ty_query(sql,datas);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      datas:=null;
      cdsdata.Open;
      if not cdsdata.IsEmpty then
      begin
        while not cdsdata.Eof do
        begin
          if trim(bm)='' then
          begin
           node:=treebase.Items.add(tnode,trim(cdsdata.fieldbyname('no').AsString)+'_'+trim(cdsdata.fieldbyname('name').AsString));
          end else
          begin
            if (tnode.Count<cdsdata.RecordCount) and (tnode.Parent=nil) then
            begin
              i:=tnode.Count+1;
              while i<=cdsdata.RecordCount do
              begin
                cdsdata.RecNo:=i;
                node:=treebase.Items.AddChild(tnode,trim(cdsdata.fieldbyname('no').AsString)+'_'+trim(cdsdata.fieldbyname('name').AsString));
                inc(i);
              end;
            end;
          end;
          cdsdata.Next;
        end;
      end else
      begin
        f:=2;
      end;
    end;
  except
    f:=3;
  end;
  cdsdata.Close;
  cdsdata.Data:=null;
  result:=f;
end;
procedure TfmSystemset.SetGridMenu(menuname:tmainmenu;index:integer);
var
  i,Icount,j,t:integer;
begin
  for i:=1 to gridb.RowCount-1 do
  begin
    gridb.Rows[i].Clear;
  end;
  gridb.RowCount:=2;
  icount:=menuname.Items.Items[index].Count;
  gridb.RowCount:=iCount+1;
  j:=1;
  t:=frm_main.ListView5.Items.Count+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count;
  if index>0 then
  begin
    for i:=1 to index do
    begin
      t:=t+mainmenu1.Items[i-1].Count;
    end;
  end;
  for i:=0 to iCount-1 do
  begin
    gridb.Cells[0,j]:=inttostr(j);
    if trim(menuname.Items.Items[index].Items[i].Caption)<>'-' then
    begin
      //gridb.RowCount:=gridb.RowCount+1;
      gridb.Cells[0,j]:=inttostr(j);
      gridb.Cells[1,j]:=trim(menuname.Items.Items[index].Items[i].Caption);

    end else
    begin
      gridb.Cells[1,j]:=trim('分隔符');
    end;
    inc(j);
  end;
  if trim(qz)<>'' then
  getqx(t,menuname.Items.Items[index].Count,gridb);
end;

procedure TfmSystemset.SetMenuName(memuname:tmainmenu);
var
  i:integer;
begin
   rdg2.Items.Clear;
  for i:=0 to memuname.Items.Count-1 do
  begin
    rdg2.Items.Add(memuname.Items.Items[i].Caption);
  end;
  rdg2.ItemIndex:=0;
end;
procedure TfmSystemset.setqx;
var
  i:integer;
begin
  for i:=0 to 250 do
  begin
    if i=0 then
    begin
      qz:=qz+'CG';
    end;
    if i=(frm_main.ListView1.Items.Count) then
    begin
      qz:=qz+'ST';
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count) then
    begin
      qz:=qz+'PS';
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count) then
    begin
      qz:=qz+'BASE';
    end;
     if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count) then
    begin
      qz:=qz+'Sys';
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count) then
    begin
      qz:=qz+'Mon';
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count++frm_main.ListView6.Items.Count) then
    begin
      qz:=qz+'Cw';
    end;
    //////////////////////////////门店
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count) then
    begin
      qz:=qz+'Msys';      //0
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count) then
    begin
      qz:=qz+'MLs';   //1
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count) then
    begin
      qz:=qz+'MYw'; //2
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count) then
    begin
      qz:=qz+'MKc'; //3
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count+mainmenu1.Items.Items[3].count) then
    begin
      qz:=qz+'MPs'; //4
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count+mainmenu1.Items.Items[3].count+mainmenu1.Items.Items[4].count) then
    begin
      qz:=qz+'MCw'; //5
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count+mainmenu1.Items.Items[3].count+mainmenu1.Items.Items[4].count+mainmenu1.Items.Items[5].count) then
    begin
      qz:=qz+'MKh';  //6
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count+mainmenu1.Items.Items[3].count+mainmenu1.Items.Items[4].count+mainmenu1.Items.Items[5].count+mainmenu1.Items.Items[6].count) then
    begin
      qz:=qz+'MGl';   //7
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count+mainmenu1.Items.Items[3].count+mainmenu1.Items.Items[4].count+mainmenu1.Items.Items[5].count+mainmenu1.Items.Items[6].count+mainmenu1.Items.Items[7].count) then
    begin
      qz:=qz+'MJc'; //8
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count+mainmenu1.Items.Items[3].count+mainmenu1.Items.Items[4].count+mainmenu1.Items.Items[5].count+mainmenu1.Items.Items[6].count+mainmenu1.Items.Items[7].count+mainmenu1.Items.Items[8].count) then
    begin
      qz:=qz+'MHlep'; //10
    end;
    if i=(frm_main.ListView1.Items.Count+frm_main.ListView3.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count+mainmenu1.Items.Items[0].count+mainmenu1.Items.Items[1].count+mainmenu1.Items.Items[2].count+mainmenu1.Items.Items[3].count+mainmenu1.Items.Items[4].count+mainmenu1.Items.Items[5].count+mainmenu1.Items.Items[6].count+mainmenu1.Items.Items[7].count+mainmenu1.Items.Items[8].count+mainmenu1.Items.Items[9].count) then
    begin
      qz:=qz+'MTs';
    end;
    ///////////////////////////////////////////////
    qz:=qz+inttostr(qx[i]);
  end;
  //showmessage(qz);
end;
procedure TfmSystemset.getqx(Bindex:integer;Eindex:integer;grid:tstringgrid);
var
  s:string;
  i,j:integer;
begin
  if pos('CG',qz)<>0 then
  begin
    s:=copy(qz,pos('CG',qz)+2,(frm_main.ListView1.Items.Count));
  end;
  if pos('ST',qz)<>0 then
  begin
    s:=s+copy(qz,pos('ST',qz)+2,(frm_main.ListView3.Items.Count));
  end;
  if pos('PS',qz)<>0 then
  begin
    s:=s+copy(qz,pos('PS',qz)+2,(frm_main.Lviewbatch.Items.Count));
  end;
  if pos('BASE',qz)<>0 then
  begin
    s:=s+copy(qz,pos('BASE',qz)+4,(frm_main.ListView4.Items.Count));
  end;
  if pos('Sys',qz)<>0 then
  begin
    s:=s+copy(qz,pos('Sys',qz)+3,(frm_main.ListView5.Items.Count));
  end;
  if pos('Mon',qz)<>0 then
  begin
    s:=s+copy(qz,pos('Mon',qz)+3,(frm_main.ListView6.Items.Count));
  end;
  if pos('Cw',qz)<>0 then
  begin
    s:=s+copy(qz,pos('Cw',qz)+2,(frm_main.ListView7.Items.Count));
  end;
  ///////////////门店
  if pos('Msys',qz)<>0 then
  begin
    s:=s+copy(qz,pos('Msys',qz)+4,(mainmenu1.Items.Items[0].count));
  end;
   if pos('MLs',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MLs',qz)+3,(mainmenu1.Items.Items[1].count));
  end;
   if pos('MYw',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MYw',qz)+3,(mainmenu1.Items.Items[2].count));
  end;
  if pos('MKc',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MKc',qz)+3,(mainmenu1.Items.Items[3].count));
  end;
  if pos('MPs',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MPs',qz)+3,(mainmenu1.Items.Items[4].count));
  end;
   if pos('MCw',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MCw',qz)+3,(mainmenu1.Items.Items[5].count));
  end;
   if pos('MKh',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MKh',qz)+3,(mainmenu1.Items.Items[6].count));
  end;
   if pos('MGl',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MGl',qz)+3,(mainmenu1.Items.Items[7].count));
  end;
   if pos('MJc',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MJc',qz)+3,(mainmenu1.Items.Items[8].count));
  end;
   if pos('MHlep',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MHlep',qz)+5,(mainmenu1.Items.Items[9].count));
  end;
   if pos('MTs',qz)<>0 then
  begin
    s:=s+copy(qz,pos('MTs',qz)+3,(mainmenu1.Items.Items[10].count));
  end;
  ////////////////////////
 // if Bindex=0 then i:=1 else i:=Bindex;
  for i:=1 to eindex do
  begin
    try
    if (i+bindex)<= length(s) then
    begin
    qx[i+bindex-1]:=strtoint(copy(s,(i+bindex),1));
    if qx[i+bindex-1]=1 then
    begin
      grid.Cells[2,i]:='√';
    end else
    begin
      grid.Cells[2,i]:='';
    end;
    end else
    begin
      qx[i+bindex-1]:=0;
    end;
    except
    end;
    //inc(i);
  end;
end;

procedure tfmsystemset.Getfields(grid:tstringgrid;index:integer);
var
  i:integer;
begin
  for i:=1 to grid.RowCount -1 do
  begin
    grid.Rows[i].Clear;
  end;
  grid.RowCount:=2;
  case index of
    0: begin
         grid.RowCount:=frm_main.ListView1.Items.Count+1;
         for i:=1 to grid.RowCount-1 do
         begin
           grid.Cells[0,i]:=inttostr(i);
           grid.Cells[1,i]:=trim(frm_main.ListView1.Items.Item[i-1].Caption);
         end;
         if trim(qz)<>'' then
         getqx(0,frm_main.ListView1.Items.Count,gridbase);
       end;
    1: begin
         grid.RowCount:=frm_main.ListView3.Items.Count+1;
         for i:=1 to grid.RowCount-1 do
         begin
           grid.Cells[0,i]:=inttostr(i);
           grid.Cells[1,i]:=trim(frm_main.ListView3.Items.Item[i-1].Caption);
         end;
         if trim(qz)<>'' then
         getqx(frm_main.ListView1.Items.Count,frm_main.ListView3.Items.Count,gridbase);
       end;
    2: begin
         grid.RowCount:=frm_main.lviewbatch.Items.Count+1;
         for i:=1 to grid.RowCount-1 do
         begin
           grid.Cells[0,i]:=inttostr(i);
           grid.Cells[1,i]:=trim(frm_main.lviewbatch.Items.Item[i-1].Caption);
         end;
         if trim(qz)<>'' then
         getqx(frm_main.ListView3.Items.Count+frm_main.ListView1.Items.Count,frm_main.Lviewbatch.Items.Count,gridbase);
       end;
    3: begin
         grid.RowCount:=frm_main.ListView4.Items.Count+1;
         for i:=1 to grid.RowCount-1 do
         begin
           grid.Cells[0,i]:=inttostr(i);
           grid.Cells[1,i]:=trim(frm_main.ListView4.Items.Item[i-1].Caption);
         end;
         if trim(qz)<>'' then
         getqx(frm_main.ListView3.Items.Count+frm_main.ListView1.Items.Count+frm_main.Lviewbatch.Items.Count,frm_main.ListView4.Items.Count,gridbase);
       end;
    4: begin
          grid.RowCount:=frm_main.ListView5.Items.Count+1;
         for i:=1 to grid.RowCount-1 do
         begin
           grid.Cells[0,i]:=inttostr(i);
           grid.Cells[1,i]:=trim(frm_main.ListView5.Items.Item[i-1].Caption);
         end;
         if trim(qz)<>'' then
         getqx(frm_main.ListView3.Items.Count+frm_main.ListView1.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count,frm_main.ListView5.Items.Count,gridbase);
       end;
    5: begin
          grid.RowCount:=frm_main.ListView6.Items.Count+1;
         for i:=1 to grid.RowCount-1 do
         begin
           grid.Cells[0,i]:=inttostr(i);
           grid.Cells[1,i]:=trim(frm_main.ListView6.Items.Item[i-1].Caption);
         end;
         if trim(qz)<>'' then
         getqx(frm_main.ListView3.Items.Count+frm_main.ListView1.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count,frm_main.ListView6.Items.Count,gridbase);
       end;
    6: begin
          grid.RowCount:=frm_main.ListView7.Items.Count+1;
         for i:=1 to grid.RowCount-1 do
         begin
           grid.Cells[0,i]:=inttostr(i);
           grid.Cells[1,i]:=trim(frm_main.ListView7.Items.Item[i-1].Caption);
         end;
         if trim(qz)<>'' then
         getqx(frm_main.ListView3.Items.Count+frm_main.ListView1.Items.Count+frm_main.Lviewbatch.Items.Count+frm_main.ListView4.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView6.Items.Count,frm_main.ListView7.Items.Count,gridbase);
       end;
  end;
end;

/////////////////////////////////////////////
procedure TfmSystemset.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmSystemset.btnAddClick(Sender: TObject);
begin
  inherited;
  qz:='';
  SETQX;
  fmguestset:=tfmguestset.Create(self);
  fmguestset.editmode:=1;
  fmguestset.done:=qz;
  fmguestset.ShowModal;
  fmguestset.Free;
end;

procedure TfmSystemset.btnEditClick(Sender: TObject);
begin
  inherited;
  if TreeBase.Selected.Parent= nil then
  begin
    application.MessageBox('请选择具体的部门职员！',pchar(application.Title),mb_iconinformation);
    treebase.SetFocus;
    exit;
  end;
  qz:='';
  SETQX;
  fmguestset:=tfmguestset.Create(self);
  fmguestset.editmode:=2;
  fmguestset.cmbpart.Text:=trim(CDSdata.fieldbyname('part').AsString);
  fmguestset.cmbno.Text:=trim(CDSdata.fieldbyname('p_no').AsString);
  fmguestset.cmbname.Text:=trim(CDSdata.fieldbyname('employe_name').AsString);
  fmguestset.edtpwd.Text:=trim(CDSdata.fieldbyname('user_pwd').AsString);
  fmguestset.cmbtype.Text:=trim(CDSdata.fieldbyname('opertype').AsString);
  fmguestset.done:=qz;
  fmguestset.ShowModal;
  fmguestset.Free;
end;

procedure TfmSystemset.FormShow(Sender: TObject);
var
  i:integer;
begin
  inherited;
  gridbase.ColWidths[0]:=30;
  gridbase.ColWidths[2]:=60;
  gridbase.ColWidths[1]:=120;
  gridbase.Cells[0,0]:='序号';
  gridbase.Cells[1,0]:='功能名';
  gridbase.Cells[2,0]:='是否可用';
  gridb.ColWidths[0]:=30;
  gridb.ColWidths[2]:=60;
  gridb.ColWidths[1]:=120;
  gridb.Cells[0,0]:='序号';
  gridb.Cells[1,0]:='功能名';
  gridb.Cells[2,0]:='是否可用';
  setmenuname(mainmenu1);
  //getqx(0,60,gridbase);
  //getqx(61,98,gridb);
  pc1.ActivePageIndex:=0;
  ReadTree('',nil);
  qz:='';
  Mcount:=0;
  rdgclick(rdg);
end;

procedure TfmSystemset.GridbaseDblClick(Sender: TObject);
var
  pointx:integer;
begin
  inherited;
  if pcol=2 then
  begin
    if prow=0 then exit;
    CASE rdg.ItemIndex OF
    0: begin
         pointx:=prow;
       end;
    1: begin
         pointx:=prow+frm_main.ListView1.Items.Count;
       end;
    2: begin
         pointx:=prow+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
       end;
    3: begin
         pointx:=prow+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
       end;
    4: begin
         pointx:=prow+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
       end;
    5: begin
         pointx:=prow+frm_main.ListView5.Items.Count+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
       end;
    6: begin
         pointx:=prow+frm_main.ListView6.Items.Count+frm_main.ListView5.Items.Count+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count;
       end;

    END;
    if trim(gridbase.Cells[2,prow])='' then
    begin
      gridbase.Cells[2,prow]:='√';
      qx[pointx-1]:=1;
    end else
    begin
      gridbase.Cells[2,prow]:='';
      qx[pointx-1]:=0;
    end;
  end;
end;

procedure TfmSystemset.GridbaseSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
end;

procedure TfmSystemset.RdGClick(Sender: TObject);
begin
  inherited;
  Getfields(gridbase,rdg.ItemIndex);
  rball.Checked:=false;
  rbclear.Checked:=false;
end;

procedure TfmSystemset.GridBaseDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
  with Sender as Tstringgrid do
  begin
  if gdSelected in State then
  Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
  Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
  if gdFocused in State then
  Canvas.DrawFocusRect(Rect);
  end;
  with Sender as Tstringgrid do
  begin
    Canvas.FillRect(Rect);
    s:=Cells[ACol,ARow];
    r:=Rect;
    DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;

end;

procedure TfmSystemset.RDg2Click(Sender: TObject);
begin
  inherited;
  SetGridMenu(mainmenu1,rdg2.ItemIndex);
  rball.Checked:=false;
  rbclear.Checked:=false;
end;

procedure TfmSystemset.GridBDblClick(Sender: TObject);
var
  pointx,i,counts,t:integer;
begin
  inherited;
  if pcol=2 then
  begin
    if prow=0 then exit;
    if trim(gridb.Cells[1,prow])='分隔符'  then exit;
    t:= frm_main.ListView5.Items.Count+frm_main.ListView4.Items.Count+frm_main.lviewbatch.Items.Count+frm_main.listview3.Items.Count+frm_main.ListView1.Items.Count+frm_main.ListView6.Items.Count+frm_main.ListView7.Items.Count;
    if  rdg2.ItemIndex>0 then
    begin
      for i:=1 to rdg2.ItemIndex do
      begin
        t:=t+ mainmenu1.Items[i-1].Count;
      end;
    end;
    pointx:=prow+t-1;
    if trim(gridb.Cells[2,prow])='' then
    begin
      gridb.Cells[2,prow]:='√';
      qx[pointx]:=1;
    end else
    begin
      gridb.Cells[2,prow]:='';
      qx[pointx]:=0;
    end;
  end;

end;

procedure TfmSystemset.Pc1Change(Sender: TObject);
begin
  inherited;
  if pc1.ActivePageIndex=1 then
  begin
    Mcount:=rdg.Items.Count;
    rdg2click(rdg2);
  end else
  begin
    Mcount:=0;
  end;
end;

procedure TfmSystemset.TreeBaseClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if treebase.Selected<>nil then
  begin
    i:=ReadTree(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1),treebase.Selected);
    qz:='';
    if treebase.Selected.Parent<>nil then
    begin
      readDONE(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1));
    end;
  end;

end;

procedure TfmSystemset.RBAllClick(Sender: TObject);
begin
  inherited;
  if pc1.ActivePageIndex=0  then
  begin
    WaleAll(rDG.ItemIndex+mCOUNT,TRUE,GRIDBASE);
  end else
  begin
    WaleAll(rDG2.ItemIndex+mCOUNT,TRUE,GRIDB);
  end;
end;

procedure TfmSystemset.RBclearClick(Sender: TObject);
begin
  inherited;
  if pc1.ActivePageIndex=0  then
  begin
    WaleAll(rDG.ItemIndex+mCOUNT,FALSE,GRIDBASE);
  end else
  begin
    WaleAll(rDG2.ItemIndex+mCOUNT,FALSE,GRIDB);
  end;
end;

procedure TfmSystemset.FormCreate(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i:=0 to 200 do
  begin
    qx[i]:=0;
  end;
end;

procedure TfmSystemset.btnDeleteClick(Sender: TObject);
var
  sql:widestring;
begin
  inherited;
  if TreeBase.Selected.Parent= nil then
  begin
    application.MessageBox('请选择具体的部门职员！',pchar(application.Title),mb_iconinformation);
    treebase.SetFocus;
    exit;
  end;
  if application.MessageBox('是否确定删除该员工的登陆设置？',pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
  begin
    sql:='delete from chang where p_no='+''''+trim(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1))+'''';
    try
      adisp.updatesql(sql);
      treebase.Items.Delete(treebase.Selected);
    except
      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
  end;
end;

end.
