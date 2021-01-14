{-----------------------------------------------------------------------------
 Unit Name: pppp
 Author:    水石工作室 
 Purpose:
 History:
-----------------------------------------------------------------------------}
unit GZGL_print_YBB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   DBGrids, StdCtrls, ComCtrls, Buttons, ExtCtrls, Grids
  ;

type
  TFrmGZGL_Print_YBB = class(TForm)
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
    Tab3: TTabSheet;
    btn_preview: TSpeedButton;
    btn_print: TSpeedButton;
    Panel10: TPanel;
    SpeedButton9: TSpeedButton;
    btn_back3: TSpeedButton;
    Btn_exit: TSpeedButton;
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
  FrmGZGL_Print_YBB: TFrmGZGL_Print_YBB;

implementation

uses GZGL_DModule, GZGL_Main, GZGL_reports;

{$R *.dfm}

procedure TFrmGZGL_Print_YBB.FormShow(Sender: TObject);
var
  s:string;
begin
  pag1.ActivePageIndex:=0;
  with dmd do begin
    if not Tbl_GZ.Active then Tbl_gz.Open;
    if not Tbl_lb.Active then Tbl_lB.Open;
    if not Tbl_YBB.Active then Tbl_YBB.Open;
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

  EmptyTbl;
end;

{-----------------------------------------------------------------------------
  开始操作列表框
-----------------------------------------------------------------------------}
//添加单个
procedure TFrmGZGL_Print_YBB.btn_add1Click(Sender: TObject);
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
procedure TFrmGZGL_Print_YBB.btn_del1Click(Sender: TObject);
var
  i:integer;
begin
  i:=lst2.ItemIndex;
  if i>=0 then
    lst2.Items.Delete(I)
end;
//添加所有
procedure TFrmGZGL_Print_YBB.btn_addALLClick(Sender: TObject);
begin
  lst2.Items:=lst1.items;
end;
procedure TFrmGZGL_Print_YBB.btn_delALLClick(Sender: TObject);
begin
  lst2.Clear;
end;
procedure TFrmGZGL_Print_YBB.lst1DblClick(Sender: TObject);
begin
  btn_add1Click(Sender);
end;
procedure TFrmGZGL_Print_YBB.Lst2DblClick(Sender: TObject);
begin
  btn_DEL1Click(Sender);
end;
{-----------------------------------------------------------------------------
  结束操作列表框
-----------------------------------------------------------------------------}

procedure TFrmGZGL_Print_YBB.btn_getdataClick(Sender: TObject);
var
  s:string;
begin
  if lst2.Count<1 then begin
    s:='喂，喂，懂不懂呵，连车型都没有报什么表！';
    pag1.ActivePageIndex:=0;
    MessageBox(application.handle,pchar(s),'错误',mb_ICONerror+mb_ok);
    exit;
  end;
  if (strlen(pchar(edt_y.Text))<>4)or(strlen(pchar(edt_m.Text))<>2) then begin
    s:='伙计，烦劳您输够4位日期和2位月份！';
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
//
procedure TFrmGZGL_Print_YBB.btn_previewClick(Sender: TObject);
begin
  with frmGZGL_Reports do begin
    Lab_Y.Caption:=EDT_Y.text+'年'+edt_m.text+'月';
    Lab_Y2.Caption:=Lab_Y.Caption;
  end;
  try
    FrmGZGL_Reports.QR_YBB.Preview;
  except

  end;
end;
//
procedure TFrmGZGL_Print_YBB.btn_printClick(Sender: TObject);
begin
  try
    //FrmGZGL_Reports.QR_YBB.print;
  except

  end;
end;
//
procedure TFrmGZGL_Print_YBB.btn_fixdataClick(Sender: TObject);
begin
  FixGetedData;
end;
//
procedure TFrmGZGL_Print_YBB.emptyTbl;
var
  s:string;
begin
  if dmd.Tbl_YBB.RecordCount<1 then exit;
  with dmd.qry_temp do begin
    s:='delete from 月末报表 ';
    if active then close;
    sql.Clear;
    sql.Add(s);
    execsql;
    dmd.Tbl_YBB.close;
    dmd.Tbl_YBB.open;
  end;
end;


procedure TFrmGZGL_Print_YBB.GetBaseData;
var
  s,s1:string; //sql语句前段，后段
  BBRQ,lbdh,lbmc:string; //报表日期，类别代号，类别名称
  gshj,czhj:integer;//工时合计，产值合计
  n,i:integer;//控制lst2循环，控制ok数组循环
  ok:array[1..15]of integer;//统计好的各字段值
begin
  bbrq:=edt_y.Text+'-'+edt_m.Text;
  for n:=0 to lst2.count-1 do begin
    application.ProcessMessages;
    lbmc:=lst2.Items[n];
    lab_info.Caption:='获取报表数据'+lbmc;
    dmd.tbl_lb.Locate('lbmc',lbmc,[]);
    lbdh:=dmd.tbl_lb.fieldbyname('lbdh').AsString;
    for i:=1 to 15 do begin
      application.ProcessMessages;
      s1:='select gzbh from 工装 where lb="'+lbdh+'" ';
      case i of
        1 :s:=' and gzbh like "__[0][8]%" and DHRQ like "'+bbrq+'%"';//焊具 0
        2 :s:=' and gzbh like "__[0][8]%" and WGRQ like "'+bbrq+'%"';
        3 :s:=' and gzbh like "__[0][8]%" and YZRQ like "'+bbrq+'%"';
        4 :s:=' and gzbh like "__[1]%" and DHRQ like "'+bbrq+'%"';//模具 1
        5 :s:=' and gzbh like "__[1]%" and WGRQ like "'+bbrq+'%"';
        6 :s:=' and gzbh like "__[1]%" and YZRQ like "'+bbrq+'%"';
        7 :s:=' and gzbh like "__[268]%" and DHRQ like "'+bbrq+'%"';//刀辅量 2 6 8
        8 :s:=' and gzbh like "__[268]%" and WGRQ like "'+bbrq+'%"';
        9 :s:=' and gzbh like "__[268]%" and YZRQ like "'+bbrq+'%"';
        10:s:=' and gzbh like "__[7]%" and DHRQ like "'+bbrq+'%"';//夹具 7
        11:s:=' and gzbh like "__[7]%" and WGRQ like "'+bbrq+'%"';
        12:s:=' and gzbh like "__[7]%" and YZRQ like "'+bbrq+'%"';
        13:
        begin
          s:=' and gzbh like "__[0][0-79]%" and DHRQ like "'+bbrq+'%"';//其它 [0][^8]
          s:=' and gzbh like "__[3459]%" and DHRQ like "'+bbrq+'%"';//其它 [3459]
        end;
        14:
        begin
          s:=' and gzbh like "__[0][0-79]%" and WGRQ like "'+bbrq+'%"';//其它 [0][^8]
          s:=' and gzbh like "__[3459]%" and WGRQ like "'+bbrq+'%"';//其它 [3459]
        end;
        15:
        begin
          s:=' and gzbh like "__[0][0-79]%" and YZRQ like "'+bbrq+'%"';//其它 [0][^8]
          s:=' and gzbh like "__[3459]%" and YZRQ like "'+bbrq+'%"';//其它 [3459]
        end;
      end;
      s:=s1+s;
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
    with dmd.Tbl_YBB do begin
      Append;
      FieldByName('车型').Asstring:=lbmc;
      FieldByName('焊具订货').Asinteger:=ok[1];
      FieldByName('焊具完工').Asinteger:=ok[2];
      FieldByName('焊具验证').Asinteger:=ok[3];

      FieldByName('模具订货').Asinteger:=ok[4];
      FieldByName('模具完工').Asinteger:=ok[5];
      FieldByName('模具验证').Asinteger:=ok[6];

      FieldByName('刀辅量订货').Asinteger:=ok[7];
      FieldByName('刀辅量完工').Asinteger:=ok[8];
      FieldByName('刀辅量验证').Asinteger:=ok[9];

      FieldByName('夹具订货').Asinteger:=ok[10];
      FieldByName('夹具完工').Asinteger:=ok[11];
      FieldByName('夹具验证').Asinteger:=ok[12];

      FieldByName('其它订货').Asinteger:=ok[13];
      FieldByName('其它完工').Asinteger:=ok[14];
      FieldByName('其它验证').Asinteger:=ok[15];

      FieldByName('订货小计').Asinteger:=ok[1]+ok[4]+ok[7]+ok[10]+ok[13];
      FieldByName('完工小计').Asinteger:=ok[2]+ok[5]+ok[8]+ok[11]+ok[14];
      FieldByName('验证小计').Asinteger:=ok[3]+ok[6]+ok[9]+ok[12]+ok[15];

      FieldByName('工时小计').Asinteger:=gshj;
      FieldByName('产值小计').Asinteger:=czhj;
      post;
    end;
  end;{for n}
end;

procedure TFrmGZGL_Print_YBB.FixGetedData;
var
  s:string;
begin
  with dmd.qry_temp do begin
    s:='delete from 月末报表 where 车型<>"合计" and ';
    s:=s+'焊具订货+模具订货+夹具订货+刀辅量订货+其它订货+';
    s:=s+'焊具完工+模具完工+夹具完工+刀辅量完工+其它完工+';
    s:=s+'焊具验证+模具验证+夹具验证+刀辅量验证+其它验证=0';
    if active then close;
    sql.Clear;
    sql.Add(s);
    execsql;
    dmd.Tbl_YBB.close;
    dmd.Tbl_YBB.open;
  end;
end;

procedure TFrmGZGL_Print_YBB.CountGetedData;
var
  s:string;
begin
  //计算、添加合计
  with dmd.qry_temp do begin
    close;
    sql.clear;
    s:='select ';
    s:=s+' sum(订货小计)as dhxj,sum(焊具订货)as hjdh,sum(模具订货)as mjdh,sum(夹具订货)as qjdh,sum(刀辅量订货)as dfldh,sum(其它订货)as qtdh,';
    s:=s+' sum(完工小计)as wgxj,sum(焊具完工)as hjwg,sum(模具完工)as mjwg,sum(夹具完工)as qjwg,sum(刀辅量完工)as dflwg,sum(其它完工)as qtwg,';
    s:=s+' sum(验证小计)as yzxj,sum(焊具验证)as hjyz,sum(模具验证)as mjyz,sum(夹具验证)as qjyz,sum(刀辅量验证)as dflyz,sum(其它验证)as qtyz,';
    s:=s+' sum(工时小计)as gsxj,sum(产值小计)as czxj  from 月末报表';
    sql.Add(s);
    try
      open;
    except
      execsql;
    end;
  end;
  with dmd.Tbl_YBB do begin
    Append;
    FieldByName('车型').Asstring:='合计';
    FieldByName('焊具订货').Asinteger:=dmd.Qry_temp.fieldbyname('hjdh').AsInteger;
    FieldByName('焊具完工').Asinteger:=dmd.Qry_temp.fieldbyname('hjwg').AsInteger;
    FieldByName('焊具验证').Asinteger:=dmd.Qry_temp.fieldbyname('hjyz').AsInteger;

    FieldByName('模具订货').Asinteger:=dmd.Qry_temp.fieldbyname('mjdh').AsInteger;
    FieldByName('模具完工').Asinteger:=dmd.Qry_temp.fieldbyname('mjwg').AsInteger;
    FieldByName('模具验证').Asinteger:=dmd.Qry_temp.fieldbyname('mjyz').AsInteger;

    FieldByName('刀辅量订货').Asinteger:=dmd.Qry_temp.fieldbyname('dfldh').AsInteger;
    FieldByName('刀辅量完工').Asinteger:=dmd.Qry_temp.fieldbyname('dflwg').AsInteger;
    FieldByName('刀辅量验证').Asinteger:=dmd.Qry_temp.fieldbyname('dflyz').AsInteger;

    FieldByName('夹具订货').Asinteger:=dmd.Qry_temp.fieldbyname('qjdh').AsInteger;
    FieldByName('夹具完工').Asinteger:=dmd.Qry_temp.fieldbyname('qjwg').AsInteger;
    FieldByName('夹具验证').Asinteger:=dmd.Qry_temp.fieldbyname('qjyz').AsInteger;

    FieldByName('其它订货').Asinteger:=dmd.Qry_temp.fieldbyname('qtdh').AsInteger;
    FieldByName('其它完工').Asinteger:=dmd.Qry_temp.fieldbyname('qtwg').AsInteger;
    FieldByName('其它验证').Asinteger:=dmd.Qry_temp.fieldbyname('qtyz').AsInteger;

    FieldByName('订货小计').Asinteger:=dmd.Qry_temp.fieldbyname('dhxj').AsInteger;
    FieldByName('完工小计').Asinteger:=dmd.Qry_temp.fieldbyname('wgxj').AsInteger;
    FieldByName('验证小计').Asinteger:=dmd.Qry_temp.fieldbyname('yzxj').AsInteger;

    FieldByName('工时小计').Asinteger:=dmd.Qry_temp.fieldbyname('gsxj').AsInteger;
    FieldByName('产值小计').Asinteger:=dmd.Qry_temp.fieldbyname('czxj').AsInteger;
    post;
  end;
end;

procedure TFrmGZGL_Print_YBB.btn_next2Click(Sender: TObject);
begin
  pag1.ActivePageIndex:=2;
end;

procedure TFrmGZGL_Print_YBB.Tab1Show(Sender: TObject);
begin
  edt_y.SetFocus;
  edt_y.SelectAll;
end;

procedure TFrmGZGL_Print_YBB.EDT_YKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if strlen(pchar(edt_y.Text))=4 then begin
    edt_m.SetFocus;
    edt_m.SelectAll;
  end;

end;

procedure TFrmGZGL_Print_YBB.pag1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  if (pag1.ActivePageIndex=0)and((lst2.Count<1)or(strlen(pchar(edt_y.Text))<>4)or(strlen(pchar(edt_m.Text))<>2)) then
    AllowChange:=false;
end;

procedure TFrmGZGL_Print_YBB.btn_back2Click(Sender: TObject);
begin
  pag1.ActivePageIndex:=0;
end;

procedure TFrmGZGL_Print_YBB.btn_back3Click(Sender: TObject);
begin
  pag1.ActivePageIndex:=1;
end;


procedure TFrmGZGL_Print_YBB.btn_next1Click(Sender: TObject);
begin
  if (pag1.ActivePageIndex=0)and((lst2.Count<1)or(strlen(pchar(edt_y.Text))<>4)or(strlen(pchar(edt_m.Text))<>2)) then
  else begin
    pag1.ActivePageIndex:=1;
    btn_getdataClick(Sender)
  end;  
end;

procedure TFrmGZGL_Print_YBB.Btn_exitClick(Sender: TObject);
begin
  close;
end;

end.

