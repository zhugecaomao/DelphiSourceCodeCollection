unit ImageBrower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, Menus, SUIPopupMenu, ExtCtrls, SUIForm;

type
  TImageBrower_frm = class(TBaseFrm)
    Image1: TImage;
    suiPopupMenu1: TsuiPopupMenu;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     ImagePath, ImageFileName:string;
  end;

var
  ImageBrower_frm: TImageBrower_frm;

implementation

{$R *.dfm}

procedure TImageBrower_frm.FormShow(Sender: TObject);
begin
  inherited;
  //
  if (fileexists(ImagePath + ImageFileName)) then
  begin
     Image1.Picture.LoadFromFile(ImagePath + ImageFileName);
  end;
end;

end.
