unit inportantform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, Menus, jpeg, ExtCtrls, Buttons,
  CoolTrayIcon;

type
  Tf_inportantform = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ToolButton6: TToolButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_inportantform: Tf_inportantform;

implementation
uses UDM,Unitsumdepartment,Unitmain,Unitsumvalues,timetoviewtherepot,UnitME,Unitxztjt,Unitaddmx,Urbb,Uwpsz,Uwpxs,Upersonal
,Ugjt,Uchangemx,Uczmx,UnitSUMALL,Ujiage;
{$R *.dfm}

procedure Tf_inportantform.ToolButton5Click(Sender: TObject);
begin
  if  Application.MessageBox('确认要退出系统吗？','系统提示',MB_ICONQUESTION+MB_OKCANCEL)=IDOK then
      Application.Terminate;
end;

procedure Tf_inportantform.ToolButton1Click(Sender: TObject);
begin
  F_sumdepartment:=TF_sumdepartment.Create(SELF);
  F_sumdepartment.ShowModal;
  FREEANDNIL(F_sumdepartment);
end;

procedure Tf_inportantform.ToolButton2Click(Sender: TObject);
begin
  f_main:=Tf_main.Create(self);
  f_main.ShowModal;
  freeandnil(f_main);
end;

procedure Tf_inportantform.Timer1Timer(Sender: TObject);
begin
 statusBar1.Panels[1].Text:='当前时间：'+formatdatetime('yyyy "年" m "月" d "日 " dddd'  +'hh:mm:ss',now);
end;

procedure Tf_inportantform.FormShow(Sender: TObject);
begin
 statusBar1.Panels[0].Text:='当前操作员：'+dm.qrypsw.fieldbyname('czyxm').AsString;
 dm.qrytime.Open;
end;

procedure Tf_inportantform.ToolButton3Click(Sender: TObject);
begin
 F_sumvalues:=TF_sumvalues.Create(Self);
  F_sumvalues.ShowModal;
  FreeAndNil(F_sumvalues);
end;

procedure Tf_inportantform.ToolButton6Click(Sender: TObject);
begin
   F_ME:=TF_ME.Create(Self);
   F_ME.ShowModal;
   FreeAndNil(F_ME);
end;

procedure Tf_inportantform.N6Click(Sender: TObject);
begin
   ToolButton5Click(Sender);
end;

procedure Tf_inportantform.N2Click(Sender: TObject);
begin
  ToolButton1Click(Sender);
end;

procedure Tf_inportantform.N4Click(Sender: TObject);
begin
   ToolButton2Click(Sender);
end;

procedure Tf_inportantform.ToolButton7Click(Sender: TObject);
begin
  Formxztjt:=TFormxztjt.Create(Self);
  Formxztjt.ShowModal;
  FreeAndNil(Formxztjt);
end;

procedure Tf_inportantform.ToolButton8Click(Sender: TObject);
begin
 //--------------个人明细录入信息查询-------------
 Fpersonal:=TFpersonal.Create(Self);
 Fpersonal.ShowModal;
 FreeAndNil(Fpersonal);
end;

procedure Tf_inportantform.N7Click(Sender: TObject);
begin
  //------------显示商务中心日报表内容---------------
   F_rbb:=TF_rbb.Create(Self);
   F_rbb.ShowModal;
   FreeAndNil(F_rbb);
end;

procedure Tf_inportantform.N10Click(Sender: TObject);
begin
 //--------------地图,明信片,邮票销售情况-----------
    F_wpsz:=TF_wpsz.Create(Self);
    dm.Qwpsz.Open;
    F_wpsz.ShowModal;
    FreeAndNil(F_wpsz);

end;

procedure Tf_inportantform.N11Click(Sender: TObject);
begin
 //----------物品领用明细---------------------------
 F_wuxs:=TF_wuxs.Create(Self);
 DM.qrylymx.Open;
 F_wuxs.Caption:='领用';
 F_wuxs.ShowModal;
 FreeAndNil(F_wuxs);

end;

procedure Tf_inportantform.N12Click(Sender: TObject);
begin
 //-------物品销售明细----------------
 F_wuxs:=TF_wuxs.Create(Self);
 DM.qrylymx.Open;
 F_wuxs.Caption:='销售';
 F_wuxs.ShowModal;
 FreeAndNil(F_wuxs);

end;

procedure Tf_inportantform.N14Click(Sender: TObject);
begin
 //--------------个人明细录入信息查询-------------
 Fpersonal:=TFpersonal.Create(Self);
 Fpersonal.ShowModal;
 FreeAndNil(Fpersonal);
end;

procedure Tf_inportantform.N15Click(Sender: TObject);
begin
  //技术当前工作日把时间相后推一天
  FGJT:=TFGJT.Create(self);
  FGJT.ShowModal;
  FreeAndNil(FGJT);
end;

procedure Tf_inportantform.N16Click(Sender: TObject);
begin
  Fchangemx:=TFchangemx.Create(Self);
  dm.ADOalllname.Open;
  Fchangemx.ShowModal;
  FreeAndNil(Fchangemx);
end;

procedure Tf_inportantform.N17Click(Sender: TObject);
begin
 //查询操作记录
 Fczmx:=TFczmx.Create(Self);
 Fczmx.ShowModal;
 FreeAndNil(Fczmx);
end;

procedure Tf_inportantform.N8Click(Sender: TObject);
begin
  FormSUMALL:=TFormSUMALL.Create(Self);
  FormSUMALL.ShowModal;
  FreeAndNil(FormSUMALL);
end;

procedure Tf_inportantform.N18Click(Sender: TObject);
begin
 //设置部门客人纸张的各个明细
 Fjiage:=TFjiage.Create(self);
 Fjiage.ShowModal;
 FreeAndNil(Fjiage);
end;

end.
