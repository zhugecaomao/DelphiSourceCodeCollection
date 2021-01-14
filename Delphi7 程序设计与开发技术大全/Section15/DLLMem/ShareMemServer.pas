unit ShareMemServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  procedure SetShareData(value:integer);stdcall;external 'DLLMem.dll';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  temp:integer;
begin
  try
    temp := StrToInt(Edit1.Text);
    SetShareData(temp); 
  except
    ShowMessage('请输入一个整数');
    Edit1.Text := '0'; 
  end;  
end;

end.
