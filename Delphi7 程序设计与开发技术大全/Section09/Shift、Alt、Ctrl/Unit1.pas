unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Shift>=[ssShift] then // 如果按下了S h i f t键则在第一个面板上显示S h i f t
     StatusBar1.Panels[0].Text:='Shift';
   if Shift>=[ssAlt] then // 如果按下了A l t键则在第二个面板上显示A l t
     StatusBar1.Panels[1].Text:='Alt';
   if shift>=[ssCtrl] then // 如果按下了C t r l键则在第三个面板上显示C t r l
     StatusBar1.Panels[2].Text:='Ctrl';
end;

end.
