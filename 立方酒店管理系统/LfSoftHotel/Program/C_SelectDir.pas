unit C_SelectDir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  ShellCtrls;

type
  TSelectDirForm = class(TStdJdForm)
    Edit1: TEdit;
    stvPath: TShellTreeView;
    procedure stvPathChange(Sender: TObject; Node: TTreeNode);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FDir : string;
  public
    { Public declarations }
  end;

var
  SelectDirForm: TSelectDirForm;

function SelectDir : string;
implementation

{$R *.dfm}

function SelectDir : string;
begin
  SelectDirForm := TSelectDirForm.Create(Application);
  try
    with SelectDirForm do
    begin
      FDir := stvPath.Path;
      ShowModal;
      Result := FDir;
    end;
  finally
    SelectDirForm.Free;
  end;

end;

procedure TSelectDirForm.stvPathChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  Edit1.Text := stvPath.Path;
end;

procedure TSelectDirForm.btnOKClick(Sender: TObject);
begin
  inherited;
  FDir := Edit1.Text;
  Close;
end;

end.
