unit fm_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,stdctrls,DBGrids,grids,shellapi;

type
  TfmBase = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBase: TfmBase;

implementation

{$R *.dfm}
procedure TfmBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (ActiveControl is TDBGrid)  then
 case Key of
    VK_ESCAPE: Close;
    VK_RETURN:
      begin
        if Shift = [ssShift] then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_F4, VK_DOWN:
      if (screen.ActiveControl is TCustomEdit) then
        if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          TCustomEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0);
  end;

end;

procedure TfmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfmBase.FormShow(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to self.ComponentCount-1 do
  begin
    if (self.Components[i] is TLabel) then
    begin
      (self.Components[i] as TLabel).Transparent :=true;
    end;
    if (self.Components[i] is tdbgrid) then
    begin
      (self.Components[i] as tdbgrid).ReadOnly:=true;
    end;
    if (self.Components[i] is tstringgrid) then
    begin
      (self.Components[i] as tstringgrid).Ctl3D:=false;
    end;
  end;
end;

end.
