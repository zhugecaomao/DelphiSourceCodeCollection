unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

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
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    RoomNum:integer;//储存选择的空房间号
    YDNum:string;//储存选择的预定单号
    RZNum:string;//储存选择的入住单号
    function FindForm(caption: string): bool;//判断子窗体是否已经存在
  end;

var
  Main: TMain;

implementation

{$R *.dfm}
uses RoomTypeForm,RoomInfoForm,ReservationForm,DebtForm,RoomStatusForm,ResideForm,CheckOutForm;
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
      SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
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

//--------------显示【客房类型设置】窗体-------------------
procedure TMain.N2Click(Sender: TObject);
var
newform:TRoomType;
begin
 if FindForm('客房类型设置')=false then
  newform:=TRoomType.Create(application);
  newform.Caption:='客房类型设置';
end;
//--------------显示【客房信息设置】窗体-------------------
procedure TMain.N3Click(Sender: TObject);
var
newform:TRoomInfo;
begin
 if FindForm('客房信息设置')=false then
  newform:=TRoomInfo.Create(application);
  newform.Caption:='客房信息设置';
end;
//--------------显示【预定管理】窗体-------------------
procedure TMain.N5Click(Sender: TObject);
var
newform:TReservation;
begin
 if FindForm('预定管理')=false then
  newform:=TReservation.Create(application);
  newform.Caption:='预定管理';
end;



//--------------显示【入住管理】窗体-------------------
procedure TMain.N6Click(Sender: TObject);
var
newform:TReside;
begin
 if FindForm('入住管理')=false then
  newform:=TReside.Create(application);
  newform.Caption:='入住管理';
end;
//--------------显示【消费记帐】窗体-------------------
procedure TMain.N7Click(Sender: TObject);
var
newform:TDebt;
begin
 if FindForm('消费记帐')=false then
  newform:=TDebt.Create(application);
  newform.Caption:='消费记帐';
end;
//--------------显示【收银退房】窗体-------------------
procedure TMain.N8Click(Sender: TObject);
var
newform:TCheckOut;
begin
 if FindForm('收银退房')=false then
  newform:=TCheckOut.Create(application);
  newform.Caption:='收银退房';
end;
//--------------显示【房态管理】窗体-------------------
procedure TMain.N9Click(Sender: TObject);
var
newform:TRoomStatus;
begin
 if FindForm('房态管理')=false then
  newform:=TRoomStatus.Create(application);
  newform.Caption:='房态管理';

end;
//--------------退出程序-------------------
procedure TMain.N10Click(Sender: TObject);
begin
 close;
end;

end.
