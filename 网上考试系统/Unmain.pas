unit Unmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ExtCtrls, ImgList, ActnList, DBCtrls,
  DB, StdCtrls,Jpeg, Mask, Buttons, Grids, DBGrids, ExtDlgs, StdActns;

type
  TMainFrm = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N3: TMenuItem;
    N14: TMenuItem;
    N9: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    Timer1: TTimer;
    ImageList1: TImageList;
    ActionList1: TActionList;
    N16: TMenuItem;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    WindowClose1: TWindowClose;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N16Click(Sender: TObject);
  private
  function existsform(MDIFormCaption:String):boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFrm: TMainFrm;
  name:string;
implementation

uses Undm, Unstudent, Unmanerge, Unexam, Unfenpei, Unview, 
  Unchengji, Unabout, Uncount, Unlogin, Unchengjiprint, Unpass;

{$R *.dfm}
function TMainfrm.ExistsForm(MDIFormCaption:String):boolean;
var
  i:byte;
begin
  result:=true;
  for i:=0 to MDIChildCount-1 do
  begin
    if MDIChildren[i].Caption=MDIFormCaption
    then
    result:=false;
  end;
end;

procedure TMainFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure TMainFrm.Timer1Timer(Sender: TObject);
begin
statusbar1.Panels[1].Text:='当前用户：'+name;
StatusBar1.Panels[2].Text:=application.hint;
statusbar1.Panels[3].Text:='现在日期：'+datetostr(date);
statusbar1.Panels[4].Text:='时间：'+timetostr(time);
end;

procedure TMainFrm.N8Click(Sender: TObject);
begin

 if ExistsForm('考员管理') then
 begin
  Application.CreateForm(Tstudentfrm, studentfrm);
  studentfrm.show;
 end
 else
  studentfrm.Show;
studentfrm.pagecontrol1.Align:=alclient;
studentfrm.pagecontrol1.Visible:=true;
studentfrm.pagecontrol1.ActivePageIndex:=0;
end;

procedure TMainFrm.N14Click(Sender: TObject);
begin
 if ExistsForm('考员管理') then
 begin
  Application.CreateForm(Tstudentfrm, studentfrm);
  studentfrm.show;
 end
 else
  studentfrm.Show;
studentfrm.pagecontrol1.Align:=alclient;
studentfrm.pagecontrol1.Visible:=true;
studentfrm.pagecontrol1.ActivePageIndex:=1;
end;



procedure TMainFrm.N13Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TMainFrm.N6Click(Sender: TObject);
begin
if ExistsForm('权限管理') then
 begin
  Application.CreateForm(Toperatorfrm, operatorfrm);
  operatorfrm.show;
 end
 else
  operatorfrm.Show;
operatorfrm.pagecontrol1.Align:=alclient;
operatorfrm.pagecontrol1.Visible:=true;
operatorfrm.pagecontrol1.ActivePageIndex:=0;
end;

procedure TMainFrm.FormShow(Sender: TObject);
begin
loginfrm.ShowModal;
name:=datamodule1.CDSManerge.Fields[0].Value;

end;

procedure TMainFrm.N10Click(Sender: TObject);
begin
if ExistsForm('题库维护') then
 begin
  Application.CreateForm(Ttikufrm, tikufrm);
  tikufrm.show;
 end
 else
  tikufrm.Show;
end;

procedure TMainFrm.N11Click(Sender: TObject);
begin
 if existsform('分配考机') then
  begin
   Application.CreateForm(Tfenpeifrm,fenpeifrm);
   fenpeifrm.Show;
  end
 else
  fenpeifrm.Show;
end;

procedure TMainFrm.N12Click(Sender: TObject);
begin
 if existsform('考机监测') then
  begin
   application.CreateForm(Tviewfrm,viewfrm);
   viewfrm.Show;
  end
 else
  viewfrm.show;
end;

procedure TMainFrm.ToolButton16Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TMainFrm.N3Click(Sender: TObject);
begin
if ExistsForm('权限管理') then
 begin
  Application.CreateForm(Toperatorfrm, operatorfrm);
  operatorfrm.show;
 end
 else
  operatorfrm.Show;
operatorfrm.pagecontrol1.Align:=alclient;
operatorfrm.pagecontrol1.Visible:=true;
operatorfrm.pagecontrol1.ActivePageIndex:=2;
end;

procedure TMainFrm.N9Click(Sender: TObject);
begin
if existsform('成绩查询') then
  begin
   application.CreateForm(Tchengjifrm,chengjifrm);
   chengjifrm.Show;
  end
 else
  chengjifrm.Show;
chengjifrm.PageControl1.ActivePageIndex:=0;
end;

procedure TMainFrm.N5Click(Sender: TObject);
begin
 aboutfrm.ShowModal;
end;

procedure TMainFrm.ToolButton21Click(Sender: TObject);
begin
aboutfrm.ShowModal;
end;

procedure TMainFrm.FormCreate(Sender: TObject);
begin
height:=800;
width:=600;
end;

procedure TMainFrm.N16Click(Sender: TObject);
begin
if existsform('成绩查询') then
  begin
   application.CreateForm(Tchengjifrm,chengjifrm);
   chengjifrm.Show;
  end
 else
  chengjifrm.Show;
  chengjifrm.PageControl1.ActivePageIndex:=1;
end;

end.
