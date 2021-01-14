unit GZGL_XGGZ_CP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, DB, ADODB, dbcgrids, StdCtrls, Mask,
  DBCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TFrmGZGL_XGGZ_cp = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    Edt_cx: TEdit;
    Label17: TLabel;
    btn_cx: TSpeedButton;
    Label18: TLabel;
    Btn_exit: TSpeedButton;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
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
    procedure FormShow(Sender: TObject);
    procedure btn_cxClick(Sender: TObject);
    procedure Btn_exitClick(Sender: TObject);
    procedure Edt_cxKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_XGGZ_cp: TFrmGZGL_XGGZ_cp;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_XGGZ_CP.FormShow(Sender: TObject);
begin
  clearedt(self);
  with dmd do begin
    if not tbl_cp.Active then tbl_gz.Open;
    if not tbl_gzcp3.Active then tbl_gzcp3.Open;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_XGGZ_CP.btn_cxClick(Sender: TObject);
var
  bh:string ;
  s1:string;
begin
  bh:=edt_cx.text;
  if bh='' then exit;
  if not DMD.tbl_cp.locate('cpth',bh,[]) then begin
    s1:='该产品图号不存在,请检查！';
    MessageBox(application.handle,pchar(s1),'错误',mb_ICONerror+mb_ok);
    edt_cx.SetFocus;
    exit;
  end;
end;

procedure TFrmGZGL_XGGZ_CP.Btn_exitClick(Sender: TObject);
begin
  try
    dmd.Tbl_cp.Next;
  except
    dmd.Tbl_cp.Prior;
  end;
  close;
end;

procedure TFrmGZGL_XGGZ_CP.Edt_cxKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    key:=#0;
    perform(WM_NEXTDLGCTL,0,0);
    if (sender is tedit) then
      if (sender as tedit)=edt_cx then
        btn_cxClick(Sender);
  end;
end;

end.

