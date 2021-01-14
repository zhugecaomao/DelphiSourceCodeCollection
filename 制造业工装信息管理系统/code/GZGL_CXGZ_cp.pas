unit GZGL_CXGZ_cp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, DB, ADODB, dbcgrids, StdCtrls, Mask,
  DBCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TFrmGZGL_CXGZ_cp = class(TForm)
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
    Panel9: TPanel;
    Edt_cx: TEdit;
    Label17: TLabel;
    btn_cx: TSpeedButton;
    CkB_mh: TCheckBox;
    CheckBox2: TCheckBox;
    Label18: TLabel;
    Pag1: TPageControl;
    TabSheet1: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    TabSheet2: TTabSheet;
    Grd_gz: TDBGrid;
    Btn_exit: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBCtrlGrid2: TDBCtrlGrid;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label29: TLabel;
    DBEdit26: TDBEdit;
    Label30: TLabel;
    DBEdit27: TDBEdit;
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
  FrmGZGL_CXGZ_cp: TFrmGZGL_CXGZ_cp;

implementation

uses GZGL_DModule;

{$R *.dfm}

procedure TFrmGZGL_CXGZ_cp.FormShow(Sender: TObject);
begin
  dmd.tbl_cp.open;
  dmd.tbl_gzcp3.open;
  dmd.tbl_gz3.open;
end;

procedure TFrmGZGL_CXGZ_cp.btn_cxClick(Sender: TObject);
var
  bh:string ;
  s1:string;
begin
  bh:=edt_cx.text;
  if bh='' then exit;
  if strlen(pchar(bh))<9 then ckb_mh.checked:=true;
  if ckb_mh.checked then begin
    S1:='Select * from 产品 where cpth ';
    S1:=s1+'like "%'+bh+'%"'; //模糊查询
    with dmd.qry_cp do begin
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
    if not DMD.tbl_cp.locate('cpth',bh,[]) then begin
      s1:='该产品图号不存在,请检查！';
      MessageBox(application.handle,pchar(s1),'错误',mb_ICONerror+mb_ok);
    end;
    pag1.ActivePageIndex:=0;
  end;{else}
end;

procedure TFrmGZGL_CXGZ_cp.Btn_exitClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGZGL_CXGZ_cp.Grd_gzDblClick(Sender: TObject);
var
  bh:string;
begin
  with (sender as Tdbgrid) do begin
    if FieldCount<1 then exit;
    bh:=Fields[0].Text;//取的所双击记录的图号
  end;
  if bh='' then exit;
  if not DMD.tbl_cp.locate('cpth',bh,[]) then begin
    bh:='该产品图号不存在,请检查！';
    MessageBox(application.handle,pchar(bh),'错误',mb_ICONerror+mb_ok);
  end else begin
    pag1.ActivePageIndex:=0;
  end;
end;

procedure TFrmGZGL_CXGZ_cp.Edt_cxKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    btn_cxClick(Sender);
end;

end.
