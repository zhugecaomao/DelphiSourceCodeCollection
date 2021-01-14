unit GZGL_NewGzxx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, jpeg;

type
  TFrmGZGL_NewGzxx = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Btn_OK: TSpeedButton;
    Btn_EXIT: TSpeedButton;
    Edt_gzbh: TEdit;
    Edt_gzmc: TEdit;
    Edt_rwsh: TEdit;
    Edt_dhsl: TEdit;
    Edt_dhdw: TComboBox;
    Edt_sjdw: TComboBox;
    Edt_zzdw: TComboBox;
    Edt_cz: TEdit;
    Edt_bz: TEdit;
    Edt_gs: TEdit;
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Edt_sydw: TComboBox;
    Label17: TLabel;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Btn_addZJ: TSpeedButton;
    Btn_delZJ: TSpeedButton;
    Lst_ZJ: TListBox;
    Edt_zj: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Edt_rwrq_Y: TEdit;
    Edt_rwrq_M: TEdit;
    Edt_rwrq_D: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edt_dhrq_Y: TEdit;
    Edt_dhrq_M: TEdit;
    Edt_dhrq_D: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edt_WGRQ_Y: TEdit;
    Edt_WGRQ_M: TEdit;
    Edt_WGRQ_D: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edt_YZRQ_Y: TEdit;
    Edt_YZRQ_M: TEdit;
    Edt_YZRQ_D: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Edt_LB: TComboBox;
    EDT_LB2: TEdit;
    procedure Btn_EXITClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_addZJClick(Sender: TObject);
    procedure Btn_delZJClick(Sender: TObject);
    procedure Edt_rwrq_YExit(Sender: TObject);
    procedure Edt_rwrq_MExit(Sender: TObject);
    procedure Edt_LBClick(Sender: TObject);
    procedure Edt_zjKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_gzbhKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_gzbhExit(Sender: TObject);
  private
    procedure saveData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_NewGzxx: TFrmGZGL_NewGzxx;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main ;

{$R *.DFM}

//显示窗体
procedure TFrmGZGL_NewGzxx.FormShow(Sender: TObject);
var
  s:string;
begin
  with dmd do begin
    if not Tbl_GZ.active then Tbl_GZ.open;
    if not Tbl_GZCP.active then Tbl_GZCP.Open;
    if not Tbl_dw.active then Tbl_dw.Open;
    if not Tbl_lb.active then Tbl_lb.Open;
  end;

  clearEdt(self);
  with dmd.Tbl_dw do begin
    first;
    while not eof do begin
      s:=fieldbyname('dwmc').AsString;
      edt_dhdw.Items.Add(s);
      next;
    end;
    edt_sjdw.Items:=edt_dhdw.Items;
    edt_zzdw.Items:=edt_dhdw.Items;
    edt_sydw.Items:=edt_dhdw.Items;
  end;
  with dmd.Tbl_lb do begin
    first;
    while not eof do begin
      s:=fieldbyname('LBmc').AsString;
      edt_LB.Items.Add(s);
      next;
    end;
  end;
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;
//退出
procedure TFrmGZGL_NewGzxx.Btn_EXITClick(Sender: TObject);
begin
  close;
end;
//保存所输入数据到数据库
procedure TFrmGZGL_NewGzxx.saveData;
var
  i:integer;
  RWRQ,DHRQ,WGRQ,YZRQ:String;
begin
  rwrq:=Edt_rwRQ_Y.Text+'-'+Edt_rwRQ_M.Text+'-'+Edt_rwRQ_D.Text;
  dhrq:=Edt_dhRQ_Y.Text+'-'+Edt_dhRQ_M.Text+'-'+Edt_dhRQ_D.Text;
  WGRQ:=Edt_WGRQ_Y.Text+'-'+Edt_WGRQ_M.Text+'-'+Edt_WGRQ_D.Text;
  YZRQ:=Edt_YZRQ_Y.Text+'-'+Edt_YZRQ_M.Text+'-'+Edt_YZRQ_D.Text;
  with dmd.tbl_GZ do begin
    Append;
    FieldValues['GZBH'] := Edt_gzbh.text;
    FieldValues['GZMC'] := Edt_gzmc.text;
    FieldValues['RWSH'] := Edt_rwsh.text;
    FieldValues['DHDW'] := Edt_dhdw.text;
    FieldValues['RWRQ'] := RWRQ;
    FieldValues['DHRQ'] := DHRQ;
    if Edt_dhsl.text<>'' then
      FieldValues['DHSL'] := strtoint(Edt_dhsl.text);
    FieldValues['SJDW'] := Edt_sjdw.text;
    FieldValues['ZZDW'] := Edt_zzdw.text;
    FieldValues['SYDW'] := Edt_sydw.text;
    FieldValues['WGRQ'] := WGRQ;
    FieldValues['YZRQ'] := YZRQ;
    if Edt_gs.text<>'' then
      FieldValues['GS'] := strtoint(Edt_gs.text);
    if Edt_cz.text<>'' then
      FieldValues['CZ'] := strtoint(Edt_cz.text);
    FieldValues['lb'] := Edt_lb2.text;
    FieldValues['BZ'] := Edt_bz.text;
    Post;
  end;

  if lst_zj.Items.Count>0 then begin
    with dmd.Tbl_GZCP do begin
      for i:=0 to lst_zj.Items.Count-1 do begin
        Append;
        FieldValues['cpbh']:=lst_zj.Items[i];
        FieldValues['GZBH']:=Edt_gzbh.text;
        post;
      end;
    end;
  end;
end;


//确定
procedure TFrmGZGL_NewGzxx.Btn_OKClick(Sender: TObject);
var
  bh,s:string;
begin
  bh:=Edt_gzbh.Text;
  if bh='' then
  begin
    messagebox(handle,pchar('您连工装编号都不输入吗?'),'错误',mb_iconerror +mb_ok);
    exit;
  end;
  with dmd.tbl_GZ do begin
    if Locate('gzbh',bh,[]) then begin
      s:='工装编号重复，请检查！';
      messagebox(handle,pchar(s),'错误',mb_iconerror +mb_ok);
      edt_gzbh.setfocus;
      exit;
    end;
  end;
  saveData;
  clearEdt(self);
end;


//添加制件列表
procedure TFrmGZGL_NewGzxx.Btn_addZJClick(Sender: TObject);
var
  ZJ: string;
begin
  ZJ:=Edt_zj.Text;
  if zj='' then exit;
  Lst_zj.Items.Add(zj);
end;
//删除制件列表
procedure TFrmGZGL_NewGzxx.Btn_delZJClick(Sender: TObject);
begin
  if lst_zj.ItemIndex=-1 then exit;
  lst_zj.Items.Delete(lst_zj.itemindex);
end;


procedure TFrmGZGL_NewGzxx.Edt_rwrq_YExit(Sender: TObject);
var
  s:string;
begin
  s:=(sender as tedit).Text;
  if (strlen(pchar(s))<4)and(strlen(pchar(s))>0) then (sender as tedit).SetFocus;
end;

procedure TFrmGZGL_NewGzxx.Edt_rwrq_MExit(Sender: TObject);
Var
  s:string;
begin
  s:=(sender as tedit).Text;
  if (strlen(pchar(s))<2)and(strlen(pchar(s))>0) then (sender as tedit).SetFocus;
end;

procedure TFrmGZGL_NewGzxx.Edt_LBClick(Sender: TObject);
var
  s:string;
begin
  s:=edt_lb.text;
  with dmd.Tbl_lb do begin
    if locate('lbmc',s,[]) then
      edt_LB2.text:=fieldbyname('lbdh').asstring;
  end;
end;

procedure TFrmGZGL_NewGzxx.Edt_zjKeyPress(Sender: TObject; var Key: Char);
begin
  IF key=#13 then begin
    if edt_zj.Text<>'' then
      lst_zj.Items.Add(edt_zj.Text);
    key:=#0;
  end;
end;

procedure TFrmGZGL_NewGzxx.Edt_gzbhKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then { 判断是按执行键}
  Begin 
    key:=#0;
    perform(WM_NEXTDLGCTL,0,0);{移动到下一个控件}
  end;
end;

procedure TFrmGZGL_NewGzxx.Edt_gzbhExit(Sender: TObject);
var
  s,bh:string;
begin
  bh:=Edt_gzbh.Text;
  with dmd.tbl_GZ do begin
    if Locate('gzbh',bh,[]) then begin
      s:='工装编号重复，请检查！';
      messagebox(handle,pchar(s),'错误',mb_iconerror +mb_ok);
      edt_gzbh.setfocus;
      exit;
    end;
  end;
end;

initialization
  //dmd.Tbl_GZ.Open;
  //dmd.Tbl_GZCP.Open;
finalization
  //dmd.Tbl_GZ.Close;
  //dmd.Tbl_GZCP.Close;

end.
