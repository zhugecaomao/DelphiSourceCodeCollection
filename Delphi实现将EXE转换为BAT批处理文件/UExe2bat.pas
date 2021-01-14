unit UExe2bat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, shellapi;

type
  TForm1 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure WMDROPFILES_L(var Msg: TMessage);
    procedure LBWindowProc(var Message: TMessage);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Exe2BatUnit;

{$R *.dfm}
var
  LWindowProc: TWndMethod;

procedure TForm1.LBWindowProc(var Message: TMessage);
begin
  if Message.Msg = WM_DROPFILES then
    WMDROPFILES_l(Message);
  LWindowProc(Message);
end;

procedure TForm1.WMDROPFILES_L(var Msg: TMessage);
var
  pcFileName: PChar;
  i, iSize, iFileCount: integer;
begin
  pcFileName := '';
  iFileCount := DragQueryFile(Msg.wParam, $FFFFFFFF, pcFileName, 255);
  for i := 0 to iFileCount - 1 do
    begin
      iSize := DragQueryFile(Msg.wParam, i, nil, 0) + 1;
      pcFileName := StrAlloc(iSize);
      DragQueryFile(Msg.wParam, i, pcFileName, iSize);
      if FileExists(pcFileName) then
        begin
          LabeledEdit1.Text := pcFileName;
          LabeledEdit2.Text := ChangeFileExt(pcFileName,'.bat');

         if checkbox1.Checked then   Bat2exe(LabeledEdit1.Text,LabeledEdit2.Text );

        end;
      StrDispose(pcFileName);
    end;
  DragFinish(Msg.wParam);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LWindowProc := WindowProc;
  WindowProc := LBWindowProc;
  DragAcceptFiles(Handle, True);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  WindowProc := LWindowProc;
  DragAcceptFiles(Handle, False);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
try
  Bat2exe(LabeledEdit1.Text,LabeledEdit2.Text );

 if not checkbox1.Checked then showmessage('×ª»»³É¹¦£¡');
except

end;

end;

end.

