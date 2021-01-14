unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmConfig = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses Unit1;

{$R *.dfm}

procedure TfrmConfig.Button1Click(Sender: TObject);
begin
  if edit1.Text ='' then
  begin
    MessageBox(Handle, '端口号不能为空。', '提示', MB_ICONASTERISK or MB_OK);
    exit;
  end;
  form1.ini.WriteString('Port','Num1',edit1.Text);
  close;
  MessageBox(Handle, '保存完毕，重起服务将生效。', '提示', MB_ICONASTERISK or MB_OK);
end;

procedure TfrmConfig.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key:=char(0);
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  edit1.Text:=form1.ini.ReadString('Port','Num1','10111');
end;

end.
