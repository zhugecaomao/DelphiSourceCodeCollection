unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, jpeg, ExtCtrls, StdActns,
  ActnList;

type
  Tmain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
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
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    StatusBar1: TStatusBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton21: TToolButton;
    N78: TMenuItem;
    Image1: TImage;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N90: TMenuItem;
    N85: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    ActionList1: TActionList;
    WindowCascade1: TWindowCascade;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowMinimizeAll1: TWindowMinimizeAll;
    procedure N50Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N90Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main: Tmain;

implementation

uses xyda_u, jlyda_u, cyzgzda_u, gzgl_u, jlcqktjb_u, lkcycj_u, pxxy_u,
  qsbg_u, wxjl_u, jlczy_u, jlcgzzt_u, pxjyz_u, xydt_u, about_u, kmks1hmc_u,
  kmks2hmc_u;

{$R *.dfm}

procedure Tmain.N50Click(Sender: TObject);
begin
  //Application.CreateForm(txyda,xyda);
  xyda:=txyda.Create(application);
  xyda.Show;
end;

procedure Tmain.N53Click(Sender: TObject);
begin
    //Application.CreateForm(tjlyda,jlyda);
    jlyda:=tjlyda.Create(application);
    jlyda.PageControl1.ActivePageIndex:=1;
    jlyda.Show;
end;

procedure Tmain.N57Click(Sender: TObject);
begin
    //application.CreateForm(tpxxy,pxxy);
    pxxy:=tpxxy.Create(application);
    pxxy.PageControl1.ActivePageIndex:=1;
    pxxy.Show;
end;

procedure Tmain.N63Click(Sender: TObject);
begin
    //application.CreateForm(tcyzgzda,cyzgzda);
    cyzgzda:=tcyzgzda.Create(application);
    cyzgzda.PageControl1.ActivePageIndex:=1;
    cyzgzda.Show;
end;

procedure Tmain.N73Click(Sender: TObject);
begin
    //application.CreateForm(tgzgl,gzgl);
    gzgl:=tgzgl.Create(application);
    gzgl.PageControl1.ActivePageIndex:=1;
    gzgl.Show;
end;

procedure Tmain.N34Click(Sender: TObject);
begin
    //application.CreateForm(tlkcycj,lkcycj);
    lkcycj:=tlkcycj.Create(application);
    lkcycj.Show;
end;

procedure Tmain.N27Click(Sender: TObject);
begin
    //application.createform(twxjl,wxjl);
    wxjl:=twxjl.Create(application);
    wxjl.PageControl1.ActivePageIndex:=1;
    wxjl.Show;
end;

procedure Tmain.N28Click(Sender: TObject);
begin
    wxjl:=twxjl.Create(application);
    wxjl.PageControl1.ActivePageIndex:=2;
    wxjl.Show;
end;

procedure Tmain.N30Click(Sender: TObject);
begin
    //application.CreateForm(tqsbg,qsbg);
    qsbg:=tqsbg.Create(application);
    qsbg.PageControl1.ActivePageIndex:=1;
    qsbg.Show;
end;

procedure Tmain.N11Click(Sender: TObject);
begin
     jlcqktjb:=tjlcqktjb.Create(nil);
     jlcqktjb.PageControl1.ActivePageIndex:=1;
     jlcqktjb.Show;
end;

procedure Tmain.ToolButton2Click(Sender: TObject);
begin
  xyda:=txyda.Create(application);
  xyda.Show;
end;

procedure Tmain.ToolButton3Click(Sender: TObject);
begin
    jlyda:=tjlyda.Create(application);
    jlyda.PageControl1.ActivePageIndex:=1;
    jlyda.Show;
end;

procedure Tmain.ToolButton21Click(Sender: TObject);
begin
   close;
end;

procedure Tmain.N14Click(Sender: TObject);
begin
    //application.CreateForm(tjlczy,jlczy);
    jlczy:=tjlczy.Create(application);
    jlczy.PageControl1.ActivePageIndex:=1;
    jlczy.show;
end;

procedure Tmain.N15Click(Sender: TObject);
begin
    jlczy:=tjlczy.Create(application);
    jlczy.PageControl1.ActivePageIndex:=1;
    jlczy.show;
end;

procedure Tmain.N20Click(Sender: TObject);
begin
    //application.createform(tjlcgzzt,jlcgzzt);
    jlcgzzt:=tjlcgzzt.Create(application);
    jlcgzzt.PageControl1.ActivePageIndex:=1;
    jlcgzzt.Show;
end;

procedure Tmain.N21Click(Sender: TObject);
begin
    jlcgzzt:=tjlcgzzt.Create(application);
    jlcgzzt.PageControl1.ActivePageIndex:=2;
    jlcgzzt.Show;
end;

procedure Tmain.N60Click(Sender: TObject);
begin
    pxjyz:=tpxjyz.Create(application);
    pxjyz.PageControl1.ActivePageIndex:=1;
    pxjyz.Show;
end;

procedure Tmain.N5Click(Sender: TObject);
begin
    xydt:=txydt.Create(application);
    xydt.PageControl1.ActivePageIndex:=1;
    xydt.Show;
end;

procedure Tmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('请确认是否退出本系统1', '提示信息', mb_iconinformation + mb_YesNo) = id_yes then
     application.Terminate;

  {if messagedlg('是否要删除本记录!',mtWarning,[mbYes,mbNo],0)=mrYes then
      application.Terminate;
   }
end;

procedure Tmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {if messagedlg('是否要删除本记录!',mtWarning,[mbYes,mbNo],0)=mrYes then
      application.Terminate;
   }

  if Application.MessageBox('请确认是否退出本系统', '提示信息', mb_iconinformation + mb_YesNo) = id_yes then
     application.Free
  else
     canclose:=false;
end;

procedure Tmain.N90Click(Sender: TObject);
begin
   main.close;
end;

procedure Tmain.N81Click(Sender: TObject);
begin
   application.CreateForm(tabout,about);
   about.ShowModal;
   //about.Create(about);
   //about.ShowModal;
end;

procedure Tmain.N40Click(Sender: TObject);
begin
  kmks1hmc:=tkmks1hmc.Create(application);
  kmks1hmc.Show;
end;

procedure Tmain.N43Click(Sender: TObject);
begin
  kmks2hmc:=tkmks2hmc.Create(application);
  kmks2hmc.Show;
end;

end.
