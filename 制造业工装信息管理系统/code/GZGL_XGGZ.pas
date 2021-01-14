unit GZGL_XGGZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, dbcgrids,
  ComCtrls, Buttons, jpeg;

type
  TFrmGZGL_XGGZ = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label18: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    btn_cx: TSpeedButton;
    Btn_exit: TSpeedButton;
    Edt_cx: TEdit;
    Panel4: TPanel;
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
    Panel8: TPanel;
    DBNavigator2: TDBNavigator;
    procedure Btn_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cxClick(Sender: TObject);
    procedure Edt_cxKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_cxEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_XGGZ: TFrmGZGL_XGGZ;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main;

{$R *.dfm}
procedure TFrmGZGL_XGGZ.FormShow(Sender: TObject);
begin
  clearedt(self);
  with dmd do begin
    if not tbl_gz.Active then tbl_gz.Open;
    if not tbl_gzcp2.Active then tbl_gzcp2.Open;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;
procedure TFrmGZGL_XGGZ.btn_cxClick(Sender: TObject);
var
  bh:string ;
  s1:string;
begin
  bh:=edt_cx.text;
  if bh='' then exit;
  if not DMD.tbl_gz.locate('gzbh',bh,[]) then begin
    s1:='该工装编号不存在,请检查！';
    MessageBox(application.handle,pchar(s1),'错误',mb_ICONerror+mb_ok);
    edt_cx.SetFocus;
    exit;
  end;
end;

procedure TFrmGZGL_XGGZ.Btn_exitClick(Sender: TObject);
begin
  try
    dmd.Tbl_GZ.Next;
  except
    dmd.Tbl_GZ.Prior;
  end;
  close;
end;

procedure TFrmGZGL_XGGZ.Edt_cxKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    key:=#0;
    perform(WM_NEXTDLGCTL,0,0);
    if (sender is tedit) then
      if (sender as tedit)=edt_cx then
        btn_cxClick(Sender);
  end;
end;

procedure TFrmGZGL_XGGZ.Edt_cxEnter(Sender: TObject);
begin
  if (sender is tedit) then
    (sender as tedit).SelectAll;
end;

end.
