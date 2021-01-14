unit Fbranmessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls;

type
  Tbranmessage = class(TForm)
    DBMemo1: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  branmessage: Tbranmessage;

implementation

uses fmain;
{$R *.dfm}

procedure Tbranmessage.Button1Click(Sender: TObject);
begin
  main.r_staffbranchedit.Cancel;
  close
end;

procedure Tbranmessage.Button2Click(Sender: TObject);
begin
  main.r_staffbranchedit.Post;
  close;
end;

end.
