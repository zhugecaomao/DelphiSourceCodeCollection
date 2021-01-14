unit GZGL_CXGZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, DB, ADODB, dbcgrids, StdCtrls, Mask,
  DBCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TFrmGZGL_CXGZ = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Edt_cx: TEdit;
    Label17: TLabel;
    btn_cx: TSpeedButton;
    Btn_exit: TSpeedButton;
    CkB_mh: TCheckBox;
    CheckBox2: TCheckBox;
    Label18: TLabel;
    Pag1: TPageControl;
    TabSheet1: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
    TabSheet2: TTabSheet;
    Grd_gz: TDBGrid;
    DBCtrlGrid2: TDBCtrlGrid;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Panel4: TPanel;
    Label28: TLabel;
    DBEdit25: TDBEdit;
    Label29: TLabel;
    DBEdit26: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_cxClick(Sender: TObject);
    procedure Btn_exitClick(Sender: TObject);
    procedure Grd_gzDblClick(Sender: TObject);
    procedure Edt_cxKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_CXGZ: TFrmGZGL_CXGZ;

implementation

uses GZGL_DModule, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_CXGZ.FormShow(Sender: TObject);
begin
  with dmd do begin
    tbl_gz.open;
    tbl_gzcp2.open;
    tbl_cp2.open;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_CXGZ.btn_cxClick(Sender: TObject);
var
  bh:string ;
  s1:string;
begin
  bh:=edt_cx.text;
  if bh='' then exit;
  ckb_mh.checked:=False;
  if strlen(pchar(bh))<6 then ckb_mh.checked:=true;
  if ckb_mh.checked then begin
    S1:='Select * from 工装 where gzbh ';
    S1:=s1+'like "%'+bh+'%"'; //模糊查询
    with dmd.qry_gz do begin
      close;
      SQL.CLEAR;
      sql.add(s1);
      try
        open;
      except
        execsql;
      end;
    end; {with}
    pag1.ActivePageIndex:=1
  end else begin
    if not DMD.tbl_gz.locate('gzbh',bh,[]) then begin
      s1:='该工装编号不存在,请检查！';
      MessageBox(application.handle,pchar(s1),'错误',mb_ICONerror+mb_ok);
    end;
    pag1.ActivePageIndex:=0;
  end;{else}
end;

procedure TFrmGZGL_CXGZ.Btn_exitClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGZGL_CXGZ.Grd_gzDblClick(Sender: TObject);
var
  bh:string;
begin
  with (sender as Tdbgrid) do begin
    if FieldCount<1 then exit;
    bh:=Fields[0].Text;//取的所双击记录的图号
  end;
  if bh='' then exit;
  if not DMD.tbl_gz.locate('gzbh',bh,[]) then begin
    bh:='该工装编号不存在,请检查！';
    MessageBox(application.handle,pchar(bh),'错误',mb_ICONerror+mb_ok);
  end else begin
    pag1.ActivePageIndex:=0;
  end;
end;

procedure TFrmGZGL_CXGZ.Edt_cxKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    btn_cxClick(Sender);
end;

end.
