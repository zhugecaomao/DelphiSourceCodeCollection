unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmUserProp = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Button2: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserProp: TfrmUserProp;

implementation

uses ChatSource;

{$R *.dfm}

procedure TfrmUserProp.Button2Click(Sender: TObject);
var
  s:string;

  function MakePWS:string;
  begin
    Randomize;
    result:=inttostr(Random(999999));
  end;
begin
  s:=MakePWS;

  Chat.RealTemp.Close;
  Chat.RealTemp.SQL.Clear;
  Chat.RealTemp.SQL.Text:='Update UserInfo'+#13+
                          'set PasswordA=:PWS'+#13+
                          'where ID=:ID';
  Chat.RealTemp.Parameters[0].Value:=s;
  Chat.RealTemp.Parameters[1].Value:=edit1.Text;
  Chat.RealTemp.ExecSQL;

  MessageBox(Handle, pchar('密码初始化为'+s), '提示', MB_ICONASTERISK or MB_OK)
end;

end.
