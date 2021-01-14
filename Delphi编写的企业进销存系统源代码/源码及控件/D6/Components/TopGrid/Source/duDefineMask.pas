unit duDefineMask;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
  TdgDefineMask = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btOk: TButton;
    edName: TEdit;
    edPicture: TEdit;
    btCancel: TButton;
    btHelp: TButton;
    procedure btHelpClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure edPictureChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dgDefineMask: TdgDefineMask;

implementation

uses duMaskHelp;

{$R *.dfm}

procedure TdgDefineMask.btHelpClick(Sender: TObject);
begin
  if not Assigned(fmMaskHelp) then
    fmMaskHelp := TfmMaskHelp.Create(Self);
  fmMaskHelp.Show;
end;

procedure TdgDefineMask.FormDestroy(Sender: TObject);
begin
  if Assigned(fmMaskHelp) then
     fmMaskHelp.Free;
end;

procedure TdgDefineMask.edNameChange(Sender: TObject);
begin
  btOk.Enabled := (edName.Text <> '') and (edPicture.Text <> '');
end;

procedure TdgDefineMask.edPictureChange(Sender: TObject);
begin
  btOk.Enabled := (edName.Text <> '') and (edPicture.Text <> '');
end;

end.
