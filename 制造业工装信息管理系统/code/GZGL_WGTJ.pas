unit GZGL_WGTJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Mask,
  DBCtrls, dbcgrids, ComCtrls;

type
  TFrmGZGL_WGTJ = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel7: TPanel;
    Label17: TLabel;
    Btn_tj: TSpeedButton;
    btn_exit: TSpeedButton;
    EDT_Y: TEdit;
    Label2: TLabel;
    EDT_M: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Pag1: TPageControl;
    TabSheet1: TTabSheet;
    Label18: TLabel;
    btn_addJH: TSpeedButton;
    Btn_addall: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    CkB_FL: TCheckBox;
    EDT_dm: TEdit;
    Label23: TLabel;
    procedure Btn_tjClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EDT_YKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_YExit(Sender: TObject);
    procedure EDT_MKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_MExit(Sender: TObject);
    procedure btn_addJHClick(Sender: TObject);
    procedure Btn_addallClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_WGTJ: TFrmGZGL_WGTJ;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_WGTJ.FormShow(Sender: TObject);
begin
  with dmd do begin
    if not Tbl_YZJH.active then Tbl_GZ.open;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_WGTJ.FormCreate(Sender: TObject);
begin
  ClearEDT(SELF);
end;
procedure TFrmGZGL_WGTJ.Btn_tjClick(Sender: TObject);
var
  s,tj,tzdm:string;
  gshj,czhj,FLtj:integer;
begin
  pag1.Enabled:=true;
  memo1.clear;
  tj:=edt_Y.text+'-'+edt_M.text;
  tzdm:=edt_dm.text;
  with dmd.qry_temp do begin
    close;
    sql.clear;
    s:='select sum(gs)as 工时合计,sum(cz) as 产值合计 from 工装 where WGRQ like "'+tj+'%"';
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
    s:='select * from 工装 where WGRQ like "'+tj+'%" ';
    sql.Add(s);
    try
      open;
    except
      execsql;
    end;
    memo1.Lines.add('统计时间：'+datetostr(now));
    memo1.Lines.add('统计目标：'+edt_Y.text+'年'+edt_M.text+'月'+'完工工装');
    memo1.Lines.add('统计结果：共 '+inttostr(recordcount)+' 套');
    memo1.Lines.add('          工时合计：'+inttostr(gshj)+' 小时');
    memo1.Lines.add('          产值合计：'+inttostr(czhj)+' 元');
  end;
  If (ckb_FL.Checked)and(tzdm<>'') then begin
    with dmd.qry_temp do begin
      close;
      sql.clear;
      s:='select * from 工装 where WGRQ like "'+tj+'%" and gzbh like "__'+tzdm+'%" ';
      sql.Add(s);
      try
        open;
      except
        execsql;
      end;
      fltj:=recordcount;
      memo1.Lines.add('          其中特征代码为 '+tzdm+' 的工装有 '+inttostr(fltj)+' 套');
    end;
  end;
end;

procedure TFrmGZGL_WGTJ.btn_exitClick(Sender: TObject);
begin
  close;
end;



procedure TFrmGZGL_WGTJ.EDT_YKeyPress(Sender: TObject; var Key: Char);
var
  s:string;
begin
  s:=edt_y.Text;
  if (key=#13) then begin
    edt_m.SetFocus;
    edt_m.SelectAll;
  end;
end;

procedure TFrmGZGL_WGTJ.EDT_YExit(Sender: TObject);
var
  s:string;
begin
  s:=edt_y.Text;
  if strlen(pchar(s))<4 then edt_y.SetFocus;
end;



procedure TFrmGZGL_WGTJ.EDT_MKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    Btn_tjClick(Sender);
  end;
end;

procedure TFrmGZGL_WGTJ.EDT_MExit(Sender: TObject);
var
  s:string;
begin
  s:=edt_m.Text;
  if strlen(pchar(s))<2 then edt_m.SetFocus;

end;

procedure TFrmGZGL_WGTJ.btn_addJHClick(Sender: TObject);
begin
  with dmd do begin
    if qry_gz.fieldValues['GZBH']<>'' then begin
      tbl_YZjh.Append;
      tbl_YZjh.FieldValues['GZBH'] := qry_gz.FieldValues['GZBH'];
      tbl_YZjh.FieldValues['GZMC'] := qry_gz.FieldValues['GZMC'];
      tbl_YZjh.FieldValues['RWSH'] := qry_gz.FieldValues['RWSH'];
      tbl_YZjh.FieldValues['DHDW'] := qry_gz.FieldValues['DHDW'];
      tbl_YZjh.Post;
    end;
  end;
end;

procedure TFrmGZGL_WGTJ.Btn_addallClick(Sender: TObject);
begin
  with dmd do begin
    qry_gz.first;
    while not qry_gz.Eof do begin
      if qry_gz.fieldValues['GZBH']<>'' then begin
        tbl_YZjh.Append;
        tbl_YZjh.FieldValues['GZBH'] := qry_gz.FieldValues['GZBH'];
        tbl_YZjh.FieldValues['GZMC'] := qry_gz.FieldValues['GZMC'];
        tbl_YZjh.FieldValues['RWSH'] := qry_gz.FieldValues['RWSH'];
        tbl_YZjh.FieldValues['DHDW'] := qry_gz.FieldValues['DHDW'];
        tbl_YZjh.Post;
      end;
      qry_gz.Next;
    end;
  end;
end;

procedure TFrmGZGL_WGTJ.DBGrid1DblClick(Sender: TObject);
begin
  btn_addJHClick(Sender);
end;


end.
