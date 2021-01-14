unit Server_Connect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMenu, Buttons,IniFiles;

type
  Tfrm_Server_Connect = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    Edit4: TLabeledEdit;
    XPMenu1: TXPMenu;
    Image1: TImage;
    Cmd_OK: TSpeedButton;
    Cmd_NO: TSpeedButton;
    procedure Cmd_NOClick(Sender: TObject);
    procedure Cmd_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Server_Connect: Tfrm_Server_Connect;

implementation

uses func;

{$R *.dfm}

procedure Tfrm_Server_Connect.Cmd_NOClick(Sender: TObject);
begin
    system.Halt(0);
end;

procedure Tfrm_Server_Connect.Cmd_OKClick(Sender: TObject);
var
    f:TIniFile;
begin
    f:=TIniFile.Create(ExtractFileDir(application.Exename)+'\Web_Connect.ini');
    //f.WriteString('NetSetting','Server',trim(Edit1.Text));
    f.WriteString('NetSetting','Server',Decrypt(trim(Edit1.Text),'luersoft'));
    f.WriteString('NetSetting','UserName',trim(Edit2.Text));
    f.WriteString('NetSetting','Password',Decrypt(trim(Edit3.Text),'wisesoft'));
    f.WriteString('NetSetting','DataBase_Name',trim(Edit4.Text));
    f.Free;
    Close;
end;

end.
