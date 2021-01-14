unit person;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls,shellAPI;

type
  Tperson_form = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    procedure Image2Click(Sender: TObject);
    procedure Label15MouseLeave(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label15MouseEnter(Sender: TObject);
    procedure Label16MouseEnter(Sender: TObject);
    procedure Label16MouseLeave(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  person_form: Tperson_form;

implementation

{$R *.dfm}

{URL连接函数定义}
procedure URlink(URL:pchar);
begin
 shellexecute(0,nil,URL,nil,nil,sw_normal);
end;

procedure Tperson_form.Image2Click(Sender: TObject);
begin
close;
end;

procedure Tperson_form.Label15MouseLeave(Sender: TObject);
begin
Label15.Font.Color:=clwhite;
end;

procedure Tperson_form.Label15Click(Sender: TObject);
begin
URlink(Pchar(Label15.Caption));
end;

procedure Tperson_form.Label15MouseEnter(Sender: TObject);
begin
Label15.Font.Color:=clred;
end;

procedure Tperson_form.Label16MouseEnter(Sender: TObject);
begin
Label16.Font.Color:=clred;
end;

procedure Tperson_form.Label16MouseLeave(Sender: TObject);
begin
Label16.Font.Color:=clwhite;
end;

procedure Tperson_form.Label16Click(Sender: TObject);
begin
URlink(Pchar('mailto:'+Label16.Caption+'?subject=朋友,你好'));
end;

procedure Tperson_form.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
if (ssleft in shift) then
  begin
    releasecapture;
    perform(wm_syscommand, $f012, 0);
  end;
end;

end.
