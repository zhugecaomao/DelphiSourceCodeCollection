{TCoolWhistlerWindowPopup is submenu class for CoolMenus Pro package...}

unit CoolMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, CoolMenuPro;

type
  TUserMenu = class(TCoolWhistlerWindowPopup)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var 
  UserMenu: TUserMenu;

implementation

uses mainfrm;

{$R *.DFM}

end.
