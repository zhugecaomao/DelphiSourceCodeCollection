unit Spalsh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  Tfrm_Spalsh = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Splash: Tfrm_Splash;

implementation

uses Login;

{$R *.dfm}

procedure Tfrm_Spalsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frm_Spalsh.Update;
end;

procedure Tfrm_Splash.FormShow(Sender: TObject);
begin
    frm_Spalsh.DoubleBuffered:=True;
end;

end.
