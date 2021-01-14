unit StaticLoad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Add10(number:integer):integer;stdcall;external 'MyFirstDLL.DLL';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  temp:integer;
begin
  try
    temp := StrToInt(Edit1.Text );
    Edit1.Text := IntToStr(add10(temp));
  except
    ShowMessage('请输入一个整数！');
  end;

end;

end.
