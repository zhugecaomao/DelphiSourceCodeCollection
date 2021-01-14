unit GZGL_WGDJ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, jpeg;

type
  TFrmGZGL_WGDJ = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Btn_OK: TSpeedButton;
    Btn_EXIT: TSpeedButton;
    Edt_gzbh: TEdit;
    Edt_cz: TEdit;
    Edt_bz: TEdit;
    Edt_gs: TEdit;
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label17: TLabel;
    Lst_dj: TListBox;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Edt_gzmc: TEdit;
    Label18: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edt_WGRQ_Y: TEdit;
    Edt_WGRQ_M: TEdit;
    Edt_WGRQ_D: TEdit;
    procedure Btn_EXITClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edt_gzbhExit(Sender: TObject);
    procedure Edt_gzbhKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_WGRQ_YExit(Sender: TObject);
    procedure Edt_WGRQ_MExit(Sender: TObject);
  private
    procedure saveData;
    procedure showdata(bh:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_WGDJ: TFrmGZGL_WGDJ;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main ;

{$R *.DFM}

//显示窗体时配置数据
procedure TFrmGZGL_WGDJ.FormShow(Sender: TObject);
begin
  with dmd do begin
    if not Tbl_GZ.active then Tbl_GZ.open;
    if not Tbl_GZCP.active then Tbl_GZCP.Open;
  end;

  clearEdt(self);
  lst_dj.Clear;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_WGDJ.Edt_gzbhExit(Sender: TObject);
begin
  showdata(edt_gzbh.Text);
end;

//保存所输入数据到数据库
procedure TFrmGZGL_WGDJ.saveData;
var
  WGRQ:String;
begin
  WGRQ:=Edt_WGRQ_Y.Text+'-'+Edt_WGRQ_M.Text+'-'+Edt_WGRQ_D.Text;
  with dmd.tbl_GZ do begin
    edit;
    FieldValues['WGRQ'] := wgrq;
    if Edt_gs.text<>'' then
      FieldValues['GS'] := strtoint(Edt_gs.text);
    if Edt_cz.text<>'' then
      FieldValues['CZ'] := strtoint(Edt_cz.text);
    FieldValues['BZ'] := Edt_bz.text;
    Post;
  end;
end;


//确定
procedure TFrmGZGL_WGDJ.Btn_OKClick(Sender: TObject);
var
  bh,s:string;
  WGRQ:String;
begin
  bh:=Edt_gzbh.Text;
  WGRQ:=Edt_WGRQ_Y.Text+'-'+Edt_WGRQ_M.Text+'-'+Edt_WGRQ_D.Text;
  if bh='' then begin
    exit;
  end;
  if strlen(pchar(WGRQ))<10 then begin
    if strlen(pchar(WGRQ))=2 then begin
      s:='喂，连日期都没有，完什么工！';
      messagebox(handle,pchar(s),'错误',mb_iconerror +mb_ok);
    end;
    s:='老兄，日期残废，请医治！';
    messagebox(handle,pchar(s),'错误',mb_iconerror +mb_ok);
  end;

  with dmd.tbl_GZ do begin
    if Locate('gzbh',bh,[]) then begin
      savedata;
      lst_dj.Items.Add(bh);
      clearEdt(self);
    end else begin
      s:='工装编号不存在或该工装未订货，请检查！';
      messagebox(handle,pchar(s),'错误',mb_iconerror +mb_ok);
      exit;
    end;
  end;

end;

procedure TFrmGZGL_WGDJ.showdata(bh:string);
var
  s:string;
begin
  if bh='' then exit;
  with dmd.tbl_gz do begin
    if locate('gzbh',bh,[]) then begin
      s:=fieldbyname('yzrq').asstring;
      edt_gzmc.text:=fieldbyname('gzmc').asstring;
      edt_wgrq_Y.text:=copy(s,1,4);
      edt_wgrq_M.text:=copy(s,6,2);
      edt_wgrq_D.text:=copy(s,9,2);
      edt_gs.text:=fieldbyname('gs').asstring;
      edt_cz.text:=fieldbyname('cz').asstring;
      edt_bz.text:=fieldbyname('bz').asstring;
    end else begin
      s:='工装编号不存在或该工装未订货，请检查！';
      messagebox(handle,pchar(s),'错误',mb_iconerror +mb_ok);
      edt_gzbh.setfocus;
      exit;
    end;
  end;
end;



//退出
procedure TFrmGZGL_WGDJ.Btn_EXITClick(Sender: TObject);
begin
  close;
end;
procedure TFrmGZGL_WGDJ.Edt_gzbhKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then { 判断是按执行键}
  Begin 
    key:=#0;
    perform(WM_NEXTDLGCTL,0,0);{移动到下一个控件}
  end;
end;

procedure TFrmGZGL_WGDJ.Edt_WGRQ_YExit(Sender: TObject);
var
  s:string;
begin
  s:=(sender as tedit).Text;
  if (strlen(pchar(s))<4)and(strlen(pchar(s))>0) then (sender as tedit).SetFocus;
end;

procedure TFrmGZGL_WGDJ.Edt_WGRQ_MExit(Sender: TObject);
var
  s:string;
begin
  s:=(sender as tedit).Text;
  if (strlen(pchar(s))<2)and(strlen(pchar(s))>0) then (sender as tedit).SetFocus;
end;

initialization
  //dmd.Tbl_GZ.Open;
  //dmd.Tbl_GZCP.Open;
finalization
  //dmd.Tbl_GZ.Close;
  //dmd.Tbl_GZCP.Close;

end.
