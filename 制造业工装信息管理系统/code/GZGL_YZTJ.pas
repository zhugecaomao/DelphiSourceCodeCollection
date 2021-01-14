unit GZGL_YZTJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Buttons;

type
  TFrmGZGL_YZTJ = class(TForm)
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EDT_Y: TEdit;
    EDT_M: TEdit;
    procedure Btn_tjClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EDT_YExit(Sender: TObject);
    procedure EDT_YKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_MKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_MExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_YZTJ: TFrmGZGL_YZTJ;

implementation

uses GZGL_DModule, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_YZTJ.Btn_tjClick(Sender: TObject);
var
  s,tj:string;
begin
  memo1.clear;
  tj:=edt_Y.text+'-'+edt_M.text;
  s:='select * from 工装 where YZRQ like "'+tj+'%" ';
  with dmd.qry_gz do begin
    close;
    sql.clear;
    sql.Add(s);
    try
      open;
    except
      execsql;
    end;
    memo1.Lines.add('统计时间：'+datetostr(now));
    memo1.Lines.add('统计目标：'+edt_Y.text+'年'+edt_M.text+'月'+'验证合格工装');
    memo1.Lines.add('统计结果：共 '+inttostr(recordcount)+' 套');
  end;
end;

procedure TFrmGZGL_YZTJ.btn_exitClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGZGL_YZTJ.FormCreate(Sender: TObject);
begin
  edt_Y.text:='';
  edt_M.text:='';
  memo1.clear;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;

end;

procedure TFrmGZGL_YZTJ.EDT_YKeyPress(Sender: TObject; var Key: Char);
var
  s:string;
begin
  s:=edt_y.Text;
  if (key=#13) then begin
    edt_m.SetFocus;
    edt_m.SelectAll;
  end;
end;

procedure TFrmGZGL_YZTJ.EDT_YExit(Sender: TObject);
var
  s:string;
begin
  s:=edt_y.Text;
  if strlen(pchar(s))<4 then edt_y.SetFocus;
end;



procedure TFrmGZGL_YZTJ.EDT_MKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    Btn_tjClick(Sender);
  end;

end;

procedure TFrmGZGL_YZTJ.EDT_MExit(Sender: TObject);
var
  s:string;
begin
  s:=edt_m.Text;
  if strlen(pchar(s))<2 then edt_m.SetFocus;

end;

end.
