{-----------------------------------------------------------------------------
 Unit Name: pppp
 Author:    水石工作室 
 Purpose:
 History:
-----------------------------------------------------------------------------}
unit GZGL_print_NBB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Grids, DBGrids, StdCtrls, ComCtrls,  Buttons, ExtCtrls
  ;

type
  TFrmGZGL_Print_NBB = class(TForm)
    Panel4: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    pag1: TPageControl;
    Tab1: TTabSheet;
    Pnl_lst: TPanel;
    Lst1: TListBox;
    lst2: TListBox;
    Pnl_contralBar: TPanel;
    btn_del1: TSpeedButton;
    btn_add1: TSpeedButton;
    btn_delALL: TSpeedButton;
    btn_addALL: TSpeedButton;
    Panel8: TPanel;
    btn_next1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Tab2: TTabSheet;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EDT_Y: TEdit;
    EDT_M: TEdit;
    Panel6: TPanel;
    btn_next2: TSpeedButton;
    btn_back2: TSpeedButton;
    btn_fixdata: TSpeedButton;
    lab_info: TLabel;
    lab_start: TLabel;
    lab_over: TLabel;
    btn_getdata: TSpeedButton;
    Tab3: TTabSheet;
    btn_preview: TSpeedButton;
    btn_print: TSpeedButton;
    Btn_exit: TSpeedButton;
    Panel10: TPanel;
    SpeedButton9: TSpeedButton;
    btn_back3: TSpeedButton;
    procedure lst2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_del1Click(Sender: TObject);
    procedure btn_add1Click(Sender: TObject);
    procedure btn_delALLClick(Sender: TObject);
    procedure btn_addALLClick(Sender: TObject);
    procedure Lst1DblClick(Sender: TObject);
    procedure btn_previewClick(Sender: TObject);
    procedure btn_fixdataClick(Sender: TObject);
    procedure btn_next2Click(Sender: TObject);
    procedure Tab1Show(Sender: TObject);
    procedure EDT_YKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pag1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btn_back2Click(Sender: TObject);
    procedure btn_back3Click(Sender: TObject);
    procedure btn_getdataClick(Sender: TObject);
    procedure btn_next1Click(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure Btn_exitClick(Sender: TObject);
    procedure EDT_YKeyPress(Sender: TObject; var Key: Char);
  private
    procedure emptyTbl;
    procedure GetBaseData;
    procedure FixGetedData;
    procedure CountGetedData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_Print_NBB: TFrmGZGL_Print_NBB;

implementation

uses GZGL_DModule, GZGL_Main, GZGL_reports;

{$R *.dfm}

procedure TFrmGZGL_Print_NBB.FormShow(Sender: TObject);
var
  s:string;
begin
  pag1.ActivePageIndex:=0;
  with dmd do begin
    if not Tbl_GZ.Active then Tbl_gz.Open;
    if not Tbl_lb.Active then Tbl_lB.Open;
    if not Tbl_NBB.Active then Tbl_NBB.Open;
  end;
  //添加车型列表
  with dmd.TbL_lb do begin
    first;
    while not eof do begin
      s:=fieldbyname('lbmc').AsString;
      if s<>'' then begin
        lst1.Items.Add(s);
      end;
      next
    end;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;

  emptyTbl;
end;

{-----------------------------------------------------------------------------
  开始操作列表框
-----------------------------------------------------------------------------}
//添加单个
procedure TFrmGZGL_Print_NBB.btn_add1Click(Sender: TObject);
var
  i,id:integer;
  s:string;
begin
  id:=lst1.ItemIndex;
  if id>=0 then begin
    s:=lst1.items[id];
    for i:=0 to lst2.Count-1 do begin
      if s=lst2.Items[i] then begin
        exit;
      end;
    end;
    lst2.Items.Add(lst1.items[id]);
  end;
end;
//删除添加单个
procedure TFrmGZGL_Print_NBB.btn_del1Click(Sender: TObject);
var
  i:integer;
begin
  i:=lst2.ItemIndex;
  if i>=0 then
    lst2.Items.Delete(I)
end;
//添加所有
procedure TFrmGZGL_Print_NBB.btn_addALLClick(Sender: TObject);
begin
  lst2.Items:=lst1.items;
end;
procedure TFrmGZGL_Print_NBB.btn_delALLClick(Sender: TObject);
begin
  lst2.Clear;
end;
procedure TFrmGZGL_Print_NBB.lst1DblClick(Sender: TObject);
begin
  btn_add1Click(Sender);
end;
procedure TFrmGZGL_Print_NBB.Lst2DblClick(Sender: TObject);
begin
  btn_DEL1Click(Sender);
end;
{-----------------------------------------------------------------------------
  结束操作列表框
-----------------------------------------------------------------------------}
procedure TFrmGZGL_Print_NBB.btn_getdataClick(Sender: TObject);
var
  s:string;
begin
  if lst2.Count<1 then begin
    s:='喂，喂，懂不懂呵，连车型都没有报什么表！';
    pag1.ActivePageIndex:=0;
    MessageBox(application.handle,pchar(s),'错误',mb_ICONerror+mb_ok);
    exit;
  end;
  if (strlen(pchar(edt_y.Text))<>4) then begin
    s:='伙计，烦劳您输够4位日期！';
    MessageBox(application.handle,pchar(s),'错误',mb_ICONerror+mb_ok);
    pag1.ActivePageIndex:=0;
    exit;
  end;
  pag1.ActivePageIndex:=1;
  lab_start.Caption:='开始于：'+timetostr(now);
  lab_over.Caption:='结束于：';
  lab_info.Caption:='正在处理数据......';
  self.Refresh;
  lab_info.Caption:='初始化报表......';
  emptyTbl;
  lab_info.Caption:='获取报表数据......';
  GetBaseData;
  lab_info.Caption:='整理获得数据......';
  CountGetedData;

  lab_over.Caption:='结束于：'+timetostr(now);
  lab_info.Caption:='数据处理完毕';
end;

procedure TFrmGZGL_Print_NBB.btn_previewClick(Sender: TObject);
begin
  with frmGZGL_Reports do begin
    Lab_N.Caption:=EDT_Y.text+'年';
    Lab_N2.Caption:=Lab_N.Caption;
  end;
  try
    FrmGZGL_Reports.QR_NBB.Preview;
  except
    //QRListForm.close;
  end;
end;

procedure TFrmGZGL_Print_NBB.btn_printClick(Sender: TObject);
begin
  try
    //FrmGZGL_Reports.QR_NBB.print;
  except
    //QRListForm.close;
  end;
end;

procedure TFrmGZGL_Print_NBB.btn_fixdataClick(Sender: TObject);
begin
  FixGetedData;
end;

procedure TFrmGZGL_Print_NBB.emptyTbl;
var
  s:string;
begin
  if dmd.Tbl_NBB.RecordCount<1 then exit;
  with dmd.qry_temp do begin
    s:='delete from 年终报表 ';
    if active then close;
    sql.Clear;
    sql.Add(s);
    execsql;
    dmd.Tbl_NBB.close;
    dmd.Tbl_NBB.open;
  end;
end;


procedure TFrmGZGL_Print_NBB.GetBaseData;
var
  s,s1:string; //sql语句前段，后段
  BBRQ,lbdh,lbmc:string; //报表日期，类别代号，类别名称
  gshj,czhj,xj:integer;//工时合计，产值合计
  n,i:integer;//控制lst2循环，控制ok数组循环
  ok:array[1..36]of integer;//统计好的各字段值
begin
  bbrq:=edt_y.Text;
  for n:=0 to lst2.count-1 do begin
    application.ProcessMessages;
    lbmc:=lst2.Items[n];
    lab_info.Caption:='正在处理：'+lbmc;
    dmd.tbl_lb.Locate('lbmc',lbmc,[]);
    lbdh:=dmd.tbl_lb.fieldbyname('lbdh').AsString;
    for i:=1 to 36 do begin
      application.ProcessMessages;
      s1:='select gzbh from 工装 where lb="'+lbdh+'" ';
      case i of
        1 :s:=' and DHRQ like "'+bbrq+'-01-%"';
        2 :s:=' and DHRQ like "'+bbrq+'-02-%"';
        3 :s:=' and DHRQ like "'+bbrq+'-03-%"';
        4 :s:=' and DHRQ like "'+bbrq+'-04-%"';
        5 :s:=' and DHRQ like "'+bbrq+'-05-%"';
        6 :s:=' and DHRQ like "'+bbrq+'-06-%"';
        7 :s:=' and DHRQ like "'+bbrq+'-07-%"';
        8 :s:=' and DHRQ like "'+bbrq+'-08-%"';
        9 :s:=' and DHRQ like "'+bbrq+'-09-%"';
        10:s:=' and DHRQ like "'+bbrq+'-10-%"';
        11:s:=' and DHRQ like "'+bbrq+'-11-%"';
        12:s:=' and DHRQ like "'+bbrq+'-12-%"';

        13:s:=' and WGRQ like "'+bbrq+'-01-%"';
        14:s:=' and WGRQ like "'+bbrq+'-02-%"';
        15:s:=' and WGRQ like "'+bbrq+'-03-%"';
        16:s:=' and WGRQ like "'+bbrq+'-04-%"';
        17:s:=' and WGRQ like "'+bbrq+'-05-%"';
        18:s:=' and WGRQ like "'+bbrq+'-06-%"';
        19:s:=' and WGRQ like "'+bbrq+'-07-%"';
        20:s:=' and WGRQ like "'+bbrq+'-08-%"';
        21:s:=' and WGRQ like "'+bbrq+'-09-%"';
        22:s:=' and WGRQ like "'+bbrq+'-10-%"';
        23:s:=' and WGRQ like "'+bbrq+'-11-%"';
        24:s:=' and WGRQ like "'+bbrq+'-12-%"';

        25:s:=' and YZRQ like "'+bbrq+'-01-%"';
        26:s:=' and YZRQ like "'+bbrq+'-02-%"';
        27:s:=' and YZRQ like "'+bbrq+'-03-%"';
        28:s:=' and YZRQ like "'+bbrq+'-04-%"';
        29:s:=' and YZRQ like "'+bbrq+'-05-%"';
        30:s:=' and YZRQ like "'+bbrq+'-06-%"';
        31:s:=' and YZRQ like "'+bbrq+'-07-%"';
        32:s:=' and YZRQ like "'+bbrq+'-08-%"';
        33:s:=' and YZRQ like "'+bbrq+'-09-%"';
        34:s:=' and YZRQ like "'+bbrq+'-10-%"';
        35:s:=' and YZRQ like "'+bbrq+'-11-%"';
        36:s:=' and YZRQ like "'+bbrq+'-12-%"';
      end;
      s:=s1+s; //合成SQL语句
      with dmd.Qry_temp do begin
        close;
        sql.Clear;
        sql.Add(s);
        try
          open;
        except
          execsql;
        end;
        ok[i]:=recordcount; //一切只为这一句....
      end;
    end;{for i}
    //工时合计,产值合计
    with dmd.qry_temp do begin
      close;
      sql.clear;
      s1:='select sum(gs) as 工时合计,sum(cz) as 产值合计 from 工装 where lb="'+lbdh+'" ';
      s:=' and WGRQ like "'+bbrq+'%"';
      sql.Add(s1+s);
      try
        open;
      except
        execsql;
      end;
      gshj:=FieldByName('工时合计').asinteger;
      czhj:=fieldbyname('产值合计').asinteger;
    end;
    with dmd.Tbl_NBB do begin
      Append;
      FieldByName('车型').Asstring:=lbmc;
      FieldByName('一月订货').Asinteger:=ok[1];
      FieldByName('二月订货').Asinteger:=ok[2];
      FieldByName('三月订货').Asinteger:=ok[3];
      FieldByName('四月订货').Asinteger:=ok[4];
      FieldByName('五月订货').Asinteger:=ok[5];
      FieldByName('六月订货').Asinteger:=ok[6];
      FieldByName('七月订货').Asinteger:=ok[7];
      FieldByName('八月订货').Asinteger:=ok[8];
      FieldByName('九月订货').Asinteger:=ok[9];
      FieldByName('十月订货').Asinteger:=ok[10];
      FieldByName('十一月订货').Asinteger:=ok[11];
      FieldByName('十二月订货').Asinteger:=ok[12];

      FieldByName('一月完工').Asinteger:=ok[13];
      FieldByName('二月完工').Asinteger:=ok[14];
      FieldByName('三月完工').Asinteger:=ok[15];
      FieldByName('四月完工').Asinteger:=ok[16];
      FieldByName('五月完工').Asinteger:=ok[17];
      FieldByName('六月完工').Asinteger:=ok[18];
      FieldByName('七月完工').Asinteger:=ok[19];
      FieldByName('八月完工').Asinteger:=ok[20];
      FieldByName('九月完工').Asinteger:=ok[21];
      FieldByName('十月完工').Asinteger:=ok[22];
      FieldByName('十一月完工').Asinteger:=ok[23];
      FieldByName('十二月完工').Asinteger:=ok[24];

      FieldByName('一月验证').Asinteger:=ok[25];
      FieldByName('二月验证').Asinteger:=ok[26];
      FieldByName('三月验证').Asinteger:=ok[27];
      FieldByName('四月验证').Asinteger:=ok[28];
      FieldByName('五月验证').Asinteger:=ok[29];
      FieldByName('六月验证').Asinteger:=ok[30];
      FieldByName('七月验证').Asinteger:=ok[31];
      FieldByName('八月验证').Asinteger:=ok[32];
      FieldByName('九月验证').Asinteger:=ok[33];
      FieldByName('十月验证').Asinteger:=ok[34];
      FieldByName('十一月验证').Asinteger:=ok[35];
      FieldByName('十二月验证').Asinteger:=ok[36];

      xj:=0;
      for i:=1 to 12 do
        xj:=xj+ok[i];
      FieldByName('订货小计').Asinteger:=xj;

      xj:=0;
      for i:=13 to 24 do
        xj:=xj+ok[i];
      FieldByName('完工小计').Asinteger:=xj;

      xj:=0;
      for i:=25 to 36 do
        xj:=xj+ok[i];
      FieldByName('验证小计').Asinteger:=xj;

      FieldByName('工时小计').Asinteger:=gshj;
      FieldByName('产值小计').Asinteger:=czhj;
      post;
    end;
  end;{for n}
end;

procedure TFrmGZGL_Print_NBB.FixGetedData;
var
  s:string;
begin
  with dmd.qry_temp do begin
    s:='delete from 年终报表 where 车型<>"合计" and ';
    s:=s+'订货小计+完工小计+验证小计=0';
    if active then close;
    sql.Clear;
    sql.Add(s);
    execsql;
    dmd.Tbl_NBB.close;
    dmd.Tbl_NBB.open;
  end;
end;

procedure TFrmGZGL_Print_NBB.CountGetedData;
var
  s:string;
begin
  //计算、添加合计
  with dmd.qry_temp do begin
    close;
    sql.clear;
    s:='select ';
    s:=s+' sum(一月订货)  as dh1, sum(一月完工)  as wg1, sum(一月验证)  as yz1,';
    s:=s+' sum(二月订货)  as dh2, sum(二月完工)  as wg2, sum(二月验证)  as yz2,';
    s:=s+' sum(三月订货)  as dh3, sum(三月完工)  as wg3, sum(三月验证)  as yz3,';
    s:=s+' sum(四月订货)  as dh4, sum(四月完工)  as wg4, sum(四月验证)  as yz4,';
    s:=s+' sum(五月订货)  as dh5, sum(五月完工)  as wg5, sum(五月验证)  as yz5,';
    s:=s+' sum(六月订货)  as dh6, sum(六月完工)  as wg6, sum(六月验证)  as yz6,';
    s:=s+' sum(七月订货)  as dh7, sum(七月完工)  as wg7, sum(七月验证)  as yz7,';
    s:=s+' sum(八月订货)  as dh8, sum(八月完工)  as wg8, sum(八月验证)  as yz8,';
    s:=s+' sum(九月订货)  as dh9, sum(九月完工)  as wg9, sum(九月验证)  as yz9,';
    s:=s+' sum(十月订货)  as dh10,sum(十月完工)  as wg10,sum(十月验证)  as yz10,';
    s:=s+' sum(十一月订货)as dh11,sum(十一月完工)as wg11,sum(十一月验证)as yz11,';
    s:=s+' sum(十二月订货)as dh12,sum(十二月完工)as wg12,sum(十二月验证)as yz12,';
    s:=s+' sum(订货小计)  as dh13,sum(完工小计)  as wg13,sum(验证小计)  as yz13,';
    s:=s+' sum(工时小计)  as gsxj,sum(产值小计)as czxj from 年终报表';
   sql.Add(s);
    try
      open;
    except
      execsql;
    end;
  end;
  with dmd.Tbl_NBB do begin
    Append;
    FieldByName('车型').Asstring:='合计';
    FieldByName('一月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh1').AsInteger;
    FieldByName('二月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh2').AsInteger;
    FieldByName('三月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh3').AsInteger;
    FieldByName('四月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh4').AsInteger;
    FieldByName('五月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh5').AsInteger;
    FieldByName('六月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh6').AsInteger;
    FieldByName('七月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh7').AsInteger;
    FieldByName('八月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh8').AsInteger;
    FieldByName('九月订货').Asinteger:= dmd.Qry_temp.fieldbyname('dh9').AsInteger;
    FieldByName('十月订货').Asinteger:=dmd.Qry_temp.fieldbyname('dh10').AsInteger;
    FieldByName('十一月订货').Asinteger:=dmd.Qry_temp.fieldbyname('dh11').AsInteger;
    FieldByName('十二月订货').Asinteger:=dmd.Qry_temp.fieldbyname('dh12').AsInteger;
    FieldByName('订货小计').Asinteger:=dmd.Qry_temp.fieldbyname('dh13').AsInteger;

    FieldByName('一月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg1').AsInteger;
    FieldByName('二月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg2').AsInteger;
    FieldByName('三月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg3').AsInteger;
    FieldByName('四月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg4').AsInteger;
    FieldByName('五月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg5').AsInteger;
    FieldByName('六月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg6').AsInteger;
    FieldByName('七月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg7').AsInteger;
    FieldByName('八月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg8').AsInteger;
    FieldByName('九月完工').Asinteger:= dmd.Qry_temp.fieldbyname('wg9').AsInteger;
    FieldByName('十月完工').Asinteger:=dmd.Qry_temp.fieldbyname('wg10').AsInteger;
    FieldByName('十一月完工').Asinteger:=dmd.Qry_temp.fieldbyname('wg11').AsInteger;
    FieldByName('十二月完工').Asinteger:=dmd.Qry_temp.fieldbyname('wg12').AsInteger;
    FieldByName('完工小计').Asinteger:=dmd.Qry_temp.fieldbyname('wg13').AsInteger;

    FieldByName('一月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz1').AsInteger;
    FieldByName('二月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz2').AsInteger;
    FieldByName('三月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz3').AsInteger;
    FieldByName('四月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz4').AsInteger;
    FieldByName('五月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz5').AsInteger;
    FieldByName('六月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz6').AsInteger;
    FieldByName('七月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz7').AsInteger;
    FieldByName('八月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz8').AsInteger;
    FieldByName('九月验证').Asinteger:= dmd.Qry_temp.fieldbyname('yz9').AsInteger;
    FieldByName('十月验证').Asinteger:=dmd.Qry_temp.fieldbyname('yz10').AsInteger;
    FieldByName('十一月验证').Asinteger:=dmd.Qry_temp.fieldbyname('yz11').AsInteger;
    FieldByName('十二月验证').Asinteger:=dmd.Qry_temp.fieldbyname('yz12').AsInteger;
    FieldByName('验证小计').Asinteger:=dmd.Qry_temp.fieldbyname('yz13').AsInteger;

    FieldByName('工时小计').Asinteger:=dmd.Qry_temp.fieldbyname('gsxj').AsInteger;
    FieldByName('产值小计').Asinteger:=dmd.Qry_temp.fieldbyname('czxj').AsInteger;
    post;
  end;
end;

procedure TFrmGZGL_Print_NBB.btn_next2Click(Sender: TObject);
begin
  pag1.ActivePageIndex:=2;
end;

procedure TFrmGZGL_Print_NBB.Tab1Show(Sender: TObject);
begin
  edt_y.SetFocus;
  edt_y.SelectAll;
end;

procedure TFrmGZGL_Print_NBB.EDT_YKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if strlen(pchar(edt_y.Text))=4 then begin
  //  edt_m.SetFocus;
  //  edt_m.SelectAll;
  //end;

end;

procedure TFrmGZGL_Print_NBB.pag1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  if (pag1.ActivePageIndex=0)and((lst2.Count<1)or(strlen(pchar(edt_y.Text))<>4)) then
    AllowChange:=false;
end;

procedure TFrmGZGL_Print_NBB.btn_back2Click(Sender: TObject);
begin
  pag1.ActivePageIndex:=0;
end;

procedure TFrmGZGL_Print_NBB.btn_back3Click(Sender: TObject);
begin
  pag1.ActivePageIndex:=1;
end;


procedure TFrmGZGL_Print_NBB.btn_next1Click(Sender: TObject);
begin
  if (pag1.ActivePageIndex=0)and((lst2.Count<1)or(strlen(pchar(edt_y.Text))<>4)) then
  else begin
    pag1.ActivePageIndex:=1;
    btn_getdataClick(Sender)
  end;  
end;


procedure TFrmGZGL_Print_NBB.Btn_exitClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGZGL_Print_NBB.EDT_YKeyPress(Sender: TObject; var Key: Char);
begin
  if strlen(pchar(EDT_Y.Text))<>4 then EDT_Y.SetFocus;
end;

end.

