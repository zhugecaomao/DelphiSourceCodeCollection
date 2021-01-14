unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Modeless:TForm;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ModalForm:TForm;
begin
  //创建TModalForm的实例
  ModalForm:=TForm.Create(Application);
  ModalForm.Caption:='模式窗体';
  try
    if ModalForm.ShowModal=mrOk then     //显示这个窗体
      {执行一些代码}
  finally
    ModalForm.Free;
    ModalForm:=nil;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not Assigned(Modeless) then
    Modeless:=TForm.Create(Application);    //创建窗体
  Modeless.Caption:='非模式窗体';
  Modeless.Show;                            //显示非模式窗体
end;

end.
