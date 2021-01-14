unit ftput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB,CheckLst;

type
  Tftpfm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    wjm: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    lj: TBitBtn;
    bcbt: TBitBtn;
    ftpado: TADOQuery;
    scbt: TBitBtn;
    zzbt: TBitBtn;
    yhm: TComboBox;
    Label2: TLabel;
    zjdz: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    sxbt: TBitBtn;
    Timer1: TTimer;
    fwqwjj: TLabeledEdit;
    dlmm: TEdit;
    memo1: TListBox;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bcbtClick(Sender: TObject);
    procedure scbtClick(Sender: TObject);
    procedure NMFTP1ListItem(Listing: String);
    procedure FormCreate(Sender: TObject);
    procedure zjdzChange(Sender: TObject);
    procedure NMFTP1ConnectionFailed(Sender: TObject);
    procedure NMFTP1Connect(Sender: TObject);
    procedure NMFTP1Error(Sender: TComponent; Errno: Word; Errmsg: String);
    procedure NMFTP1InvalidHost(var Handled: Boolean);
    procedure NMFTP1PacketSent(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure memo1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ftpfm: Tftpfm;

implementation

{$R *.dfm}

procedure Tftpfm.SpeedButton1Click(Sender: TObject);
begin
if ftpfm.OpenDialog1.Execute then
wjm.Text:=ftpfm.OpenDialog1.FileName;
end;

procedure Tftpfm.bcbtClick(Sender: TObject);
begin
 with ftpado do
   begin
     close;
     sql.Clear;
     sql.Add('insert into ftp表(用户帐号,密码,主机地址,文件地址,目录) values(:yhzh,:mm,:zjdz,:wjzd,:ml)');
     ftpado.Parameters.ParamByName('yhzh').Value:=trim(yhm.Text);
     ftpado.Parameters.ParamByName('mm').Value:=trim(dlmm.Text);
     ftpado.Parameters.ParamByName('zjdz').Value:=trim(zjdz.Text);
     ftpado.Parameters.ParamByName('wjzd').Value:=trim(wjm.Text);
     ftpado.Parameters.ParamByName('ml').Value:=trim(fwqwjj.Text);
    execsql;
    showmessage('保存成功!');
   end;
end;

procedure Tftpfm.scbtClick(Sender: TObject);
var s,s1,s2:string;
 i:integer;
 num:array[0..100] of string;
 str:string;
begin


end;

procedure Tftpfm.NMFTP1ListItem(Listing: String);
begin
memo1.items.add(listing);

end;

procedure Tftpfm.FormCreate(Sender: TObject);
begin
   with ftpado do
   begin
     close;
     sql.Clear;
      sql.Add('select * from ftp表');
      open;
      first;
      while not eof do
        begin
           zjdz.items.add(fieldbyname('主机地址').AsString);
           next;
        end;
      end;
      Timer1.enabled:=false;
end;

procedure Tftpfm.zjdzChange(Sender: TObject);
begin
with ftpado do
   begin
      close;
      sql.Clear;
       sql.Add('select * from ftp表 where 主机地址=:zjdz');
       ftpado.Parameters.ParamByName('zjdz').Value:=trim(zjdz.Text);
       open;
       yhm.Text:=fieldbyname('用户帐号').AsString;
       dlmm.Text:=fieldbyname('密码').AsString;
      end;
end;

procedure Tftpfm.NMFTP1ConnectionFailed(Sender: TObject);
begin
showmessage('连接失败!');
end;

procedure Tftpfm.NMFTP1Connect(Sender: TObject);
begin
showmessage('连接成功!');
sxbt.Click;
//Timer1.enabled:=true;
end;

procedure Tftpfm.NMFTP1Error(Sender: TComponent; Errno: Word;
  Errmsg: String);
begin
showmessage('连接错误!');
end;

procedure Tftpfm.NMFTP1InvalidHost(var Handled: Boolean);
begin
showmessage('没有服务器!');
end;

procedure Tftpfm.NMFTP1PacketSent(Sender: TObject);
begin
showmessage('传输文件成功!');
end;

procedure Tftpfm.Timer1Timer(Sender: TObject);
begin

memo1.items.clear;

end;

procedure Tftpfm.memo1DblClick(Sender: TObject);
begin
{if pos(memo1.Items.Text,'.')=0 then
begin
fwqwjj.Text:='';
fwqwjj.Text:=memo1.Items.GetText;
lj.Click;
end; }
end;

end.
