unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons, ToolWin, ComCtrls, jpeg;

type
  Tmain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BOM1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    MPS1: TMenuItem;
    MRP1: TMenuItem;
    MRP2: TMenuItem;
    StatusBar1: TStatusBar;
    Image1: TImage;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BOM1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure MPS1Click(Sender: TObject);
    procedure MRP1Click(Sender: TObject);
    procedure MRP2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
   
    
  private
    { Private declarations }
  public
    { Public declarations }
//各个MDI子窗体间通过主窗体定义的公共变量来传递数据
    str,str2,str3,str4:string;
//标示是哪个子窗体来使用上面的四个公共变量
//bomflag=1表示BOM窗体使用上面的变量,bomflag=2,3表示主需求窗体使用
    bomflag:integer;
  end;

var
  main: Tmain;


implementation

{$R *.dfm}
uses MaterialsForm,BomForm,CalendarForm,mainrequireForm,mainproduceform,MRPCalForm,mrphistoryForm;

//---------------打开物料主文件管理子窗口---------------------
procedure Tmain.N4Click(Sender: TObject);
var
newform:Tmaterials;
i,flag:integer;
begin
//flag＝0表示该窗体不存在
  flag:=0;
  for i:=0 to main.MDIChildCount do
 begin
// 通过对窗体标题判断窗体是否存在
  if main.MDIChildren[i].Caption='物料主文件维护' then
   begin
   //如果窗体已存在，则恢复窗体
     SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
     mdichildren[i].Show;
     mdichildren[i].Enabled:=true;
     flag:=1;
   //退出循环
   break;
   end;
   end;
  //若窗体不存在，则创建窗体
   if flag=0 then
 begin
 newform:=Tmaterials.Create(application);
 newform.Caption:='物料主文件维护';
 end;
end;

//----------关闭主窗体----------------------
procedure Tmain.N3Click(Sender: TObject);
begin
main.Close;
end;

//----------------打开物料清单(BOM)子窗体------------------------
procedure Tmain.BOM1Click(Sender: TObject);
var
newform:Tbom;
i,flag:integer;
begin
  flag:=0;
  for i:=0 to main.MDIChildCount do
 begin
// 通过对窗体标题判断窗体是否存在
  if main.MDIChildren[i].Caption='物料清单(BOM)' then
   begin
   //如果窗体已存在，则恢复窗体
     SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
     mdichildren[i].Show;
     mdichildren[i].Enabled:=true;
    //标识窗体已存在
     flag:=1;
   //退出循环
   break;
   end;
   end;
  //若窗体不存在，则创建窗体
   if flag=0 then
 begin
 newform:=Tbom.Create(application);
 newform.Caption:='物料清单(BOM)';
 end;
end;

//--------------------------------------------------------------------
//  *********** 这里是【物料主文件】菜单选项和【物料清单(BOM)】菜单选项的单击事件响应处理代码，其他子窗体相对应的菜单选项处理代码和上面的代码基本一致。
//   读者请参考随书光盘
//--------------------------------------------------------------------

procedure Tmain.N5Click(Sender: TObject);
var
newform:TCalendar;
i,flag:integer;
begin
  flag:=0;
  for i:=0 to main.MDIChildCount do
 begin
  if main.MDIChildren[i].Caption='工厂日历' then
   begin
     SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
     mdichildren[i].Show;
     mdichildren[i].Enabled:=true;
     flag:=1;
   break;
   end;
   end;
  //若窗体不存在，则创建窗体
if flag=0 then
 begin
 newform:=Tcalendar.Create(application);
 newform.Caption:='工厂日历';
 end;
end;


procedure Tmain.N6Click(Sender: TObject);
var
newform:Tmainrequire;
i,flag:integer;
begin
  flag:=0;
  for i:=0 to main.MDIChildCount do
 begin
  if main.MDIChildren[i].Caption='主需求计划' then
   begin
     SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
     mdichildren[i].Enabled:=true;
     mdichildren[i].Focused;
     mdichildren[i].Show;

     flag:=1;
   break;
   end;
   end;

if flag=0 then
 begin
 newform:=Tmainrequire.Create(application);
 newform.Caption:='主需求计划';
 end;
end;

procedure Tmain.MPS1Click(Sender: TObject);
var
newform:Tmainproduce;
i,flag:integer;
begin
  flag:=0;
  for i:=0 to main.MDIChildCount do
 begin
  if main.MDIChildren[i].Caption='主生产计划' then
   begin
     SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
     mdichildren[i].Show;
     mdichildren[i].Enabled:=true;
     flag:=1;
   break;
   end;
   end;

if flag=0 then
 begin
 newform:=Tmainproduce.Create(application);
 newform.Caption:='主生产计划';
 end;
end;

procedure Tmain.MRP1Click(Sender: TObject);
var
newform:Tmrpcal;
i,flag:integer;
begin
  flag:=0;
  for i:=0 to main.MDIChildCount do
 begin
  if main.MDIChildren[i].Caption='MRP计算' then
   begin
     SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
     mdichildren[i].Show;
     mdichildren[i].Enabled:=true;
     flag:=1;
   break;
   end;
   end;

if flag=0 then
 begin
 newform:=Tmrpcal.Create(application);
 newform.Caption:='MRP计算';
 end;
end;

procedure Tmain.MRP2Click(Sender: TObject);
var
newform:Tmrphistory;
i,flag:integer;
begin
  flag:=0;
  for i:=0 to main.MDIChildCount do
 begin
  if main.MDIChildren[i].Caption='MRP历史查询' then
   begin
     SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
     mdichildren[i].Show;
     mdichildren[i].Enabled:=true;
     flag:=1;
   break;
   end;
   end;

if flag=0 then
 begin
 newform:=Tmrphistory.Create(application);
 newform.Caption:='MRP历史查询';
 end;
end;


//平铺各个子窗体
procedure Tmain.N8Click(Sender: TObject);
begin
 Tile;
end;
//层叠各个子窗体
procedure Tmain.N9Click(Sender: TObject);
begin
  Cascade;
end;



end.
