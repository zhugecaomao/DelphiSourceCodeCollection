unit ChildFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Menus,math;

type

  TChildForm = class(TForm)
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure WMWindowPosChanging(var msg:TWMWindowPosChanging);
    message WM_WINDOWPOSCHANGING;
    procedure FormResize(Sender: TObject);
  private
    FAsChild: Boolean;
    FTempParent: TWinControl;
    procedure  CentalPanel;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AParent: TWinControl); reintroduce; overload;

    // The method below must be overriden to return either the main menu
    // of the form, or nil.
    function GetFormMenu: TMainMenu; virtual; abstract;
    function CanChange: Boolean; virtual;
  end;

var
  ChildForm: TChildForm;

implementation

{$R *.DFM}
procedure  TChildForm.CentalPanel;
begin

 if panel1.Width < ClientWidth then
  panel1.Left := (ClientWidth - panel1.Width ) div 2
  else
  panel1.Left := 0;
 if panel1.Height <ClientHeight then
  panel1.Top :=(ClientHeight - panel1.Height ) div 2
  else
  panel1.Top := 0;

end;
procedure TChildForm.WMWindowPosChanging(var msg:TWMWindowPosChanging);
var
  CaptionHeight:integer;
begin
   CaptionHeight := GetSystemMetrics(SM_CYCAPTION);
   msg.WindowPos ^.cx :=Max(msg.WindowPos ^.cx,panel1.Width+20);
   msg.WindowPos ^.cy :=Max(msg.WindowPos ^.cy,panel1.Height+20+CaptionHeight);
   inherited;
end;

constructor TChildForm.Create(AOwner: TComponent);
begin
  FAsChild := False;
  inherited Create(AOwner);
end;

constructor TChildForm.Create(AOwner: TComponent; AParent: TWinControl);
begin
  FAsChild := True;
  FTempParent := aParent;
  inherited Create(AOwner);
end;

procedure TChildForm.Loaded;
begin
  inherited;
  if FAsChild then
  begin
    align := alClient;
    BorderStyle := bsNone;
    BorderIcons := [];
    Parent := FTempParent;
    Position := poDefault;
  end;
end;

procedure TChildForm.CreateParams(var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  if FAsChild then
    Params.Style := Params.Style or WS_CHILD;
end;

function TChildForm.CanChange: Boolean;
begin
  Result := True;
end;

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action :=cafree;
end;

procedure TChildForm.FormDestroy(Sender: TObject);
begin
 ChildForm :=nil;
end;

procedure TChildForm.FormResize(Sender: TObject);
begin
  CentalPanel;
end;

end.
