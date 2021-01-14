unit GZGL_LBTJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Buttons;

type
  TFrmGZGL_LBTJ = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel7: TPanel;
    Label17: TLabel;
    Btn_tj: TSpeedButton;
    btn_exit: TSpeedButton;
    Label4: TLabel;
    edt_LB: TComboBox;
    edt_LB2: TEdit;
    procedure Btn_tjClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_LBClick(Sender: TObject);
    procedure edt_LBChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_LBTJ: TFrmGZGL_LBTJ;

implementation

uses GZGL_DModule, GZGL_Main;

{$R *.dfm}
procedure TFrmGZGL_LBTJ.FormCreate(Sender: TObject);
begin
  memo1.clear;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_LBTJ.FormShow(Sender: TObject);
var
  s:string;
begin
  with dmd.Tbl_lb do begin
    if not active then Open;
    first;
    while not eof do begin
      s:=fieldbyname('lbmc').AsString;
      edt_LB.Items.Add(s);
      next;
    end;
  end;
end;
procedure TFrmGZGL_LBTJ.Btn_tjClick(Sender: TObject);
var
  s,tj:string;
  gshj,czhj:integer;
begin
  memo1.clear;
  tj:=edt_lb2.text;
  with dmd.qry_temp do begin
    close;
    sql.clear;
    s:='select sum(gs)as 工时合计,sum(cz) as 产值合计 from 工装 where lb="'+tj+'"';
    sql.Add(s);
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
    s:='select * from 工装 where LB = "'+tj+'" ';
    sql.Add(s);
    try
      open;
    except
      execsql;
    end;
    memo1.Lines.add('统计时间：'+datetostr(now));
    memo1.Lines.add('统计目标：'+edt_LB.text+'的工装情况');
    memo1.Lines.add('统计结果：共 '+inttostr(recordcount)+' 套');
    memo1.Lines.add('          工时合计：'+inttostr(gshj)+' 小时');
    memo1.Lines.add('          产值合计：'+inttostr(czhj)+' 元');
  end;
end;

procedure TFrmGZGL_LBTJ.btn_exitClick(Sender: TObject);
begin
  close;
end;



procedure TFrmGZGL_LBTJ.edt_LBClick(Sender: TObject);
var
  s:string;
begin
  btn_tj.enabled:=true;
  s:=edt_lb.text;
  with dmd.Tbl_lb do begin
    if locate('lbmc',s,[]) then
      edt_LB2.text:=fieldbyname('lbdh').asstring
    else
      edt_LB2.text:=edt_lb.text;
  end;
end;

procedure TFrmGZGL_LBTJ.edt_LBChange(Sender: TObject);
begin
  edt_LBClick(Sender);
end;

end.
