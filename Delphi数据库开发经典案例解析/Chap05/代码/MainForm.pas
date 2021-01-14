unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Menus;

type
  TMain = class(TForm)
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
    StatusBar1: TStatusBar;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    storestr:string;
    function FindForm(caption: string): bool;

  end;

var
  Main: TMain;

implementation

{$R *.dfm}
uses UserSettingForm,UserDocuForm,BookSettingForm,BookDocuForm,BookOrderForm,BookBorrowForm,BookReturnForm,BookOverdueForm,ForfeitForm;

//-----------通过用户定义的函数，判断窗体是否已存在--------------------
function TMain.FindForm(caption: string): bool;
var
i:integer;
begin
 for i:=0 to main.MDIChildCount do
  begin
   // 通过对窗体标题判断窗体是否存在
    if main.MDIChildren[i].Caption=caption then
     begin
      //如果窗体已存在，则恢复窗体，并返回true
      SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_Maximize, 0);
      mdichildren[i].Enabled:=true;
      mdichildren[i].Show;
      mdichildren[i].SetFocus;
      result:=true;
      break;
     end
     else
     //如窗体不存在，则返回false，程序将创建窗体
      result:=false;
  end
end;

//-------------打开读者类别设置窗体----------
procedure TMain.N2Click(Sender: TObject);
Var
 newform:TUserSetting;
begin
 if FindForm('读者类别设置')=false then
  begin
   newform:=TUserSetting.Create(application);
   newform.Caption:='读者类别设置';
  end;

end;
//-------------打开读者档案管理窗体----------
procedure TMain.N3Click(Sender: TObject);
Var
 newform:TUserDocu;
begin
 if FindForm('读者档案管理')=false then
  begin
   newform:=TUserDocu.Create(application);
   newform.Caption:='读者档案管理';
  end;

end;
//-------------打开图书类别设置窗体----------
procedure TMain.N5Click(Sender: TObject);
Var
 newform:TBookSetting;
begin
 if FindForm('图书类别设置')=false then
  begin
   newform:=TBookSetting.Create(application);
   newform.Caption:='图书类别设置';
  end;

end;
//-------------打开图书档案管理窗体----------
procedure TMain.N6Click(Sender: TObject);
Var
 newform:TBookDocu;
begin
 if FindForm('图书档案管理')=false then
  begin
   newform:=TBookDocu.Create(application);
   newform.Caption:='图书档案管理';
  end;

end;
//-------------打开图书征订窗体----------
procedure TMain.N8Click(Sender: TObject);
Var
 newform:TBookOrder;
begin
 if FindForm('图书征订')=false then
  begin
   newform:=TBookOrder.Create(application);
   newform.Caption:='图书征订';
  end;
end;


//-------------打开图书借阅窗体----------
procedure TMain.N9Click(Sender: TObject);
Var
 newform:TBookBorrow;
begin
 if FindForm('图书借阅')=false then
  begin
   newform:=TBookBorrow.Create(application);
   newform.Caption:='图书借阅';
  end;
end;
//-------------打开图书归还窗体----------
procedure TMain.N10Click(Sender: TObject);
var
 newform:TBookReturn;
begin
  if FindForm('图书归还')=false then
   begin
    newform:=TBookReturn.Create(application);
    newform.Caption:='图书归还';
   end;
end;
//-------------查看逾期图书----------
procedure TMain.N11Click(Sender: TObject);
var
 newform:TBookOverdue;
begin
  if FindForm('逾期清单')=false then
   begin
    newform:=TBookOverdue.Create(application);
    newform.Caption:='逾期清单';
   end;
end;
//-------------收回图书罚款----------
procedure TMain.N12Click(Sender: TObject);
var
 newform:TForfeit;
begin
  if FindForm('图书罚款')=false then
   begin
    newform:=TForfeit.Create(application);
    newform.Caption:='图书罚款';
   end;
end;

procedure TMain.N13Click(Sender: TObject);
begin
close;
end;

end.
