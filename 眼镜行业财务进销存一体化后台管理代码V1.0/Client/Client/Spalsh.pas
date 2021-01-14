unit Spalsh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, XPMenu;

type
  Tfrm_Spalsh = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Spalsh: Tfrm_Spalsh;

implementation

uses Login;

{$R *.dfm}

procedure Tfrm_Spalsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frm_spalsh.Update;
end;

procedure Tfrm_Spalsh.FormShow(Sender: TObject);
begin
    frm_spalsh.DoubleBuffered:=True;
end;

procedure Tfrm_Spalsh.FormCreate(Sender: TObject);
begin
    //´°Ìå½¥½¥³öÏÖ
    //AnimateWindow(Handle,1000,AW_CENTER);
end;

end.
