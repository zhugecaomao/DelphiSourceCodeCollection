unit InputString;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TfrmInputString = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    edtInput: TEdit;
    labPrompt: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    strResult: string;
  end;

var
  frmInputString: TfrmInputString;

implementation

{$R *.DFM}

procedure TfrmInputString.OKBtnClick(Sender: TObject);
begin
  if edtInput.Text = '' then
  begin
    Application.MessageBox(PChar(labPrompt.Caption + '不能为空, 请重输入!'), PChar(Caption), MB_OK + MB_ICONINFORMATION);
    edtInput.SetFocus;
  end else
  begin
    strResult := edtInput.Text;
    Close;
  end;
end;

procedure TfrmInputString.CancelBtnClick(Sender: TObject);
begin
  strResult := '';
  Close;
end;

end.
