unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls;

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
    N11: TMenuItem;
    N12: TMenuItem;
    N10: TMenuItem;
    StatusBar1: TStatusBar;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
    function FindForm(caption: string): bool;//判断子窗体是否已经存在
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses MedInfoForm,ChargeItmForm,ClinicRegForm,PriceConfirmForm,CashForm,StoreSearchForm,RegSearchForm,MedSendForm;
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

//--------------显示【药品信息】窗体-------------------
procedure TMain.N2Click(Sender: TObject);
var
newform:TMedInfo;
begin
 if FindForm('药品信息')=false then
  newform:=TMedInfo.Create(application);
  newform.Caption:='药品信息';
end;

//--------------显示【收费项目】窗体-------------------
procedure TMain.N3Click(Sender: TObject);
var
newform:TChargeItm;
begin
 if FindForm('收费项目')=false then
  newform:=TChargeItm.Create(application);
  newform.Caption:='收费项目';
end;
//--------------显示【门诊挂号】窗体-------------------
procedure TMain.N5Click(Sender: TObject);
var
newform:TClinicReg;
begin
 if FindForm('门诊挂号')=false then
  newform:=TClinicReg.Create(application);
  newform.Caption:='门诊挂号';
end;

//--------------显示【门诊划价】窗体-------------------
procedure TMain.N6Click(Sender: TObject);
var
newform:TPriceConfirm;
begin
 if FindForm('门诊划价')=false then
  newform:=TPriceConfirm.Create(application);
  newform.Caption:='门诊划价';
end;
//--------------显示【门诊收费】窗体-------------------
procedure TMain.N7Click(Sender: TObject);
var
newform:TCash;
begin
 if FindForm('门诊收费')=false then
  newform:=TCash.Create(application);
  newform.Caption:='门诊收费';
end;
//--------------显示【药房发药】窗体-------------------
procedure TMain.N8Click(Sender: TObject);
var
newform:TMedSend;
begin
 if FindForm('药房发药')=false then
  newform:=TMedSend.Create(application);
  newform.Caption:='药房发药';
end;

//--------------显示【科室挂号量】窗体-------------------
procedure TMain.N11Click(Sender: TObject);
var
newform:TRegSearch;
begin
 if FindForm('科室挂号量')=false then
  newform:=TRegSearch.Create(application);
  newform.Caption:='科室挂号量';
end;

//--------------显示【药品库存量】窗体-------------------
procedure TMain.N12Click(Sender: TObject);
var
newform:TStoreSearch;
begin
 if FindForm('药品库存量')=false then
  newform:=TStoreSearch.Create(application);
  newform.Caption:='药品库存量';
end;

//--------------退出程序-------------------
procedure TMain.N10Click(Sender: TObject);
begin
 close;
end;












end.
