unit Password;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls;

type
  TfrmPassword = class(TForm)
    Label3: TLabel;
    Edit3: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Image1: TImage;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPassword: TfrmPassword;
  usercs1,passcs1:integer;

implementation

uses Dm, Main, Common;

{$R *.DFM}

procedure TfrmPassword.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmPassword.btnOkClick(Sender: TObject);
begin
  if Edit1.Text <> pstrUserPassword  Then
    Application.Messagebox('原口令输入错误，不能成功修改！','更改密码',MB_OK+MB_ICONWARNING)
  else if Edit2.Text <> Edit3.Text Then
    Application.Messagebox('口令核对错误，不能成功修改！','更改密码',MB_OK+MB_ICONWARNING)
  else
  begin
    with Data.Tmpf do
    begin
      Close;
      CommandText := 'update AppUser ' +
        'set uPassword = ''' + Edit2.Text + '''' +
        'where uCode = ''' + pstrUserCode + '''';
      Execute;
      pstrUserPassword := Edit2.Text;
      Application.Messagebox('口令已成功修改，请紧记！', '更改密码', MB_OK+MB_ICONINFORMATION);
    end;
  end;
end;

end.
