unit C_PassWord;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

function IfRight: Boolean;

implementation

uses C_JfData;

{$R *.dfm}

function IfRight: Boolean;
begin
  PasswordDlg := TPasswordDlg.Create(Application);
  try
    with PasswordDlg do
    begin
      ShowModal;
      Result := False;
      if ModalResult = mrOK then
        if JfData.IfPass(Password.Text) then
          Result := True;
    end;
  finally
    PasswordDlg.Free;
  end;
end;

end.
 
