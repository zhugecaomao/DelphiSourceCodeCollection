{TCoolWhistlerWindowPopup is submenu class for CoolMenus Pro package...}

unit PopMenufrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, CoolMenuPro;

type
  TPopMenu = class(TCoolWhistlerWindowPopup)
    CoolItem951: TCoolItem95;
    CoolItem952: TCoolItem95;
    CoolItem953: TCoolItem95;
    CoolItemSeparator20001: TCoolItemSeparator2000;
    CoolItem954: TCoolItem95;
    CoolItem955: TCoolItem95;
    CoolItem956: TCoolItem95;
    CoolItem957: TCoolItem95;
    procedure CoolWhistlerWindowPopupShow(Sender: TObject);
    procedure CoolWhistlerWindowPopupCreate(Sender: TObject);
    procedure CoolItem951MouseLeave(Sender: TObject; Shift: TShiftState);
  private
    { Private declarations }
  protected

  public
    { Public declarations }
  end;

var 
  PopMenu: TPopMenu;

implementation

uses mainfrm;

{$R *.DFM}

procedure TPopMenu.CoolWhistlerWindowPopupShow(Sender: TObject);
begin
  CoolItem951.Enabled :=not frmmain.Logined;
  if not frmmain.Logined then
    CoolItem951.ImageIndex :=0
  else
    CoolItem951.ImageIndex :=10;

  CoolItem952.Enabled :=frmmain.Logined;
  if frmmain.Logined then
    CoolItem952.ImageIndex :=1
  else
    CoolItem952.ImageIndex :=11;

  CoolItem957.Enabled :=frmmain.Logined;
  if frmmain.Logined then
    CoolItem957.ImageIndex :=22
  else
    CoolItem957.ImageIndex :=23;
end;

procedure TPopMenu.CoolWhistlerWindowPopupCreate(Sender: TObject);
begin
  CoolItem951.OnClick :=frmmain.GPLogin.Items[0].OnClick;
  CoolItem952.OnClick :=frmmain.GPLogin.Items[1].OnClick;
  CoolItem953.OnClick :=frmmain.GPLogin.Items[2].OnClick;
  CoolItem954.OnClick :=frmmain.RzGroup1.Items[0].OnClick;
  CoolItem955.OnClick :=frmmain.RzGroup1.Items[1].OnClick;
  CoolItem956.OnClick :=frmmain.RzGroup1.Items[2].OnClick;
  CoolItem957.OnClick :=frmmain.RzGroup1.Items[3].OnClick;  
end;

procedure TPopMenu.CoolItem951MouseLeave(Sender: TObject;
  Shift: TShiftState);
var
  FPoint:TPoint;
begin
  FPoint:=ScreenToClient(Mouse.CursorPos);
  if ((FPoint.y<2) or (FPoint.y>Height-5))
    or ((FPoint.X<2) or (FPoint.X>Width-5)) then
    self.HideMenu;
end;

end.
