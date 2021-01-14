unit GZGL_YHDJ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, jpeg;

type
  TFrmGZGL_YHDJ = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Btn_OK: TSpeedButton;
    Btn_EXIT: TSpeedButton;
    Edt_gzbh: TEdit;
    Edt_gzmc: TEdit;
    Edt_bz: TEdit;
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label17: TLabel;
    Lst_dj: TListBox;
    Label3: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Edt_YZRQ_Y: TEdit;
    Edt_YZRQ_M: TEdit;
    Edt_YZRQ_D: TEdit;
    procedure Btn_EXITClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edt_gzbhExit(Sender: TObject);
  private
    procedure saveData;
    procedure showdata(bh:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_YHDJ: TFrmGZGL_YHDJ;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main ;

{$R *.DFM}

//显示窗体时配置数据
procedure TFrmGZGL_YHDJ.FormShow(Sender: TObject);
begin
  with dmd do begin
    if not Tbl_GZ.active then Tbl_GZ.open;
  end;

  clearEdt(self);
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_YHDJ.Edt_gzbhExit(Sender: TObject);
begin
  showdata(edt_gzbh.text);
end;

//保存所输入数据到数据库
procedure TFrmGZGL_YHDJ.saveData;
var
  YZRQ:String;
begin
  YZRQ:=Edt_YZRQ_Y.Text+'-'+Edt_YZRQ_M.Text+'-'+Edt_YZRQ_D.Text;
  with dmd.tbl_GZ do begin
    edit;
    FieldValues['YZRQ'] := yzrq;
    FieldValues['BZ'] := Edt_bz.text;
    Post;
  end;
end;


//确定
procedure TFrmGZGL_YHDJ.Btn_OKClick(Sender: TObject);
var
  bh,s:string;
begin
  bh:=Edt_gzbh.Text;
  if bh='' then begin
    exit;
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




procedure TFrmGZGL_YHDJ.showdata(bh: string);
var
  s:string;
begin
  if bh='' then exit;
  with dmd.tbl_gz do begin
    if locate('gzbh',bh,[]) then begin
      S:=fieldbyname('YZRQ').asstring;
      edt_gzmc.text:=fieldbyname('gzmc').asstring;
      edt_YZRQ_Y.text:=copy(s,1,4);
      edt_YZRQ_M.text:=copy(s,6,2);
      edt_YZRQ_D.text:=copy(s,9,2);
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
procedure TFrmGZGL_YHDJ.Btn_EXITClick(Sender: TObject);
begin
  close;
end;

initialization
  //dmd.Tbl_GZ.Open;
  //dmd.Tbl_GZCP.Open;
finalization
  //dmd.Tbl_GZ.Close;
  //dmd.Tbl_GZCP.Close;

end.
