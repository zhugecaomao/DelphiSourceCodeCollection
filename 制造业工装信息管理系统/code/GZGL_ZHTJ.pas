unit GZGL_ZHTJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Mask,
  DBCtrls, dbcgrids, ComCtrls;

type
  TFrmGZGL_ZHTJ = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Panel7: TPanel;
    Btn_tj: TSpeedButton;
    btn_exit: TSpeedButton;
    GroupBox1: TGroupBox;
    opt_bh_0: TRadioButton;
    opt_bh_2: TRadioButton;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    opt_bh_1: TRadioButton;
    GroupBox2: TGroupBox;
    opt_wgrq: TRadioButton;
    opt_yzrq: TRadioButton;
    opt_dhrq: TRadioButton;
    edt_BH: TEdit;
    CkB_bh: TCheckBox;
    CkB_rq: TCheckBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    EDT_Y1: TEdit;
    EDT_M1: TEdit;
    EDT_Y2: TEdit;
    EDT_M2: TEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    CkB_lb: TCheckBox;
    Cmb_LB: TComboBox;
    Label4: TLabel;
    Label17: TLabel;
    EDT_CZ_min: TEdit;
    CkB_cz: TCheckBox;
    EDT_CZ_max: TEdit;
    Bevel1: TBevel;
    procedure Btn_tjClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EDT_Y1KeyPress(Sender: TObject; var Key: Char);
    procedure EDT_Y1Exit(Sender: TObject);
    procedure EDT_M1KeyPress(Sender: TObject; var Key: Char);
    procedure EDT_M1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_ZHTJ: TFrmGZGL_ZHTJ;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_ZHTJ.FormShow(Sender: TObject);
begin
  with dmd do begin
    tbl_yzjh.open;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_ZHTJ.FormCreate(Sender: TObject);
begin
  ClearEDT(SELF);
end;

procedure TFrmGZGL_ZHTJ.Btn_tjClick(Sender: TObject);
var
  tzdm,RQ1,RQ2:string;
  s,mb:string;
  gshj,czhj:integer;
begin
  memo1.clear;
  if (not ckb_bh.Checked)and(not ckb_rq.Checked)and(not ckb_lb.Checked)and(not ckb_cz.Checked)then exit;
  if (ckb_rq.Checked)and((edt_Y1.text='')or(edt_Y2.text='')or(edt_M1.text='')or(edt_M2.text='')) then exit;
  if (ckb_LB.Checked)and(cmb_lb.text='')then exit;
  if (ckb_cz.Checked)and((edt_cz_min.Text='')or(edt_cz_max.Text=''))then exit;

  s:='where gzbh<>"" ';
  if (ckb_bh.Checked) then begin
    tzdm:=edt_bh.Text;
    s:=s+' and gzbh like ';
    mb:='工装编号';
    if opt_bh_0.Checked then begin
      s:=s+' "'+tzdm+'%" ';
      mb:=mb+'以 '+tzdm+' 打头 ';
    end;
    if opt_bh_1.Checked then begin
      s:=s+' "%'+tzdm+'%" ';
      mb:=mb+'包含 '+tzdm;
    end;
    if opt_bh_2.Checked then begin
      s:=s+' "%'+tzdm+'" ';
      mb:=mb+'以 '+tzdm+' 结尾';
    end;
  end;

  if (ckb_rq.Checked)and(edt_Y1.text<>'')and(edt_Y2.text<>'')and(edt_M1.text<>'')and(edt_M2.text<>'') then begin
    rq1:=edt_Y1.text+'-'+edt_M1.text;
    rq2:=edt_Y2.text+'-'+edt_M2.text;
    if opt_dhrq.Checked then begin
      s:=s+' and(DHRQ>="'+rq1+'-'+'00'+'" and DHRQ<="'+rq2+'-'+'31'+'") ';
      mb:=mb+' 订货日期在 '+rq1+' 和 '+rq2+' 之间 ';
    end;
    if opt_wgrq.Checked then begin
      s:=s+' and(WGRQ>="'+rq1+'-'+'00'+'" and WGRQ<="'+rq2+'-'+'31'+'") ';
      mb:=mb+' 完工日期在 '+rq1+' 和 '+rq2+' 之间 ';
    end;
    if opt_yzrq.Checked then begin
      s:=s+' and(YZRQ>="'+rq1+'-'+'00'+'" and YZRQ<="'+rq2+'-'+'31'+'") ';
      mb:=mb+' 验证日期在 '+rq1+' 和 '+rq2+' 之间 ';
    end;
  End;

  if (ckb_LB.Checked)and(CMB_lb.Text<>'') then begin
      s:=s+' and gzbh like "__'+CMB_lb.Text+'%" ';
      mb:=mb+' 类别为 '+CMB_lb.Text;
  end;

  if (ckb_CZ.Checked) then begin
    mb:=mb+' 产值';
    if edt_cz_min.Text<>'' then begin
      s:=s+' and CZ>='+edt_cz_min.Text+' ';
      mb:=mb+' 大于 '+edt_cz_min.Text;
    end;
    if edt_cz_max.Text<>'' then begin
      s:=s+' and CZ<='+edt_cz_max.Text+' ';
      mb:=mb+' 小于 '+edt_cz_max.Text;
    end;
  end;

  with dmd.qry_temp do begin
    close;
    sql.clear;
    sql.Add('select sum(gs)as 工时合计,sum(cz) as 产值合计 from 工装 '+s);
    memo1.Lines.Add(sql.Text);
    try
      open;
    except
      execsql;
    end;
    gshj:=FieldByName('工时合计').asinteger;
    czhj:=fieldbyname('产值合计').asinteger;
  end;

  with dmd.qry_gz do begin
    close;
    sql.clear;
    sql.Add('select * from 工装 '+s);
    memo1.Lines.Add(sql.Text);
    try
      open;
    except
      execsql;
    end;
    memo1.Lines.add('统计时间：'+datetostr(now));
    memo1.Lines.add('统计目标：'+mb);
    memo1.Lines.add('统计结果：共 '+inttostr(recordcount)+' 套');
    memo1.Lines.add('          工时合计：'+inttostr(gshj)+' 小时');
    memo1.Lines.add('          产值合计：'+inttostr(czhj)+' 元');
  end;
end;

procedure TFrmGZGL_ZHTJ.btn_exitClick(Sender: TObject);
begin
  close;
end;



procedure TFrmGZGL_ZHTJ.EDT_Y1KeyPress(Sender: TObject; var Key: Char);
var
  s:string;
begin
  s:=edt_y1.Text;
  if (key=#13) then begin
    edt_m1.SetFocus;
    edt_m1.SelectAll;
  end;
end;

procedure TFrmGZGL_ZHTJ.EDT_Y1Exit(Sender: TObject);
var
  s:string;
begin
  s:=edt_y1.Text;
  if strlen(pchar(s))<4 then edt_y1.SetFocus;
end;



procedure TFrmGZGL_ZHTJ.EDT_M1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    Btn_tjClick(Sender);
  end;
end;

procedure TFrmGZGL_ZHTJ.EDT_M1Exit(Sender: TObject);
var
  s:string;
begin
  s:=edt_m1.Text;
  if strlen(pchar(s))<2 then edt_m1.SetFocus;

end;

end.
