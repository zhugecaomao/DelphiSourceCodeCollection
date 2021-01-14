unit rjzcut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,inifiles;

type
  Trjzcfm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    zcbt: TBitBtn;
    gbbt: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    jqm: TEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    zcm: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure gbbtClick(Sender: TObject);
    procedure zcbtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rjzcfm: Trjzcfm;

implementation

uses mainut;

{$R *.dfm}

procedure Trjzcfm.gbbtClick(Sender: TObject);
begin
close;
end;

procedure Trjzcfm.zcbtClick(Sender: TObject);
var
 filename,Fn:string;
 myinifile:Tinifile;
 pass:string;
 num:string;
 I:integer;
 Dir: array [0..255] of Char;
 Vserial,Serial,regflag:string;
begin
GetSystemDirectory(@Dir, 255);
//Vserial:=mainfm.GetHDSerialNumber('C');
 For I := 0 to 255 do
   begin
     if Ord(Dir[I]) = 0 then Break;
       Fn := Fn + Dir[I];
   end;
  Fn:=application.GetNamePath+'ini/data.ini';
  filename:=Fn;
  myinifile:=Tinifile.Create(filename);
  regflag:=mainfm.decrypt1(myinifile.readstring(mainfm.encrypt1('regflag'),mainfm.encrypt1('regflag'),mainfm.encrypt1('')));
  Serial:=mainfm.decrypt(myinifile.readstring(mainfm.encrypt('Serial'),mainfm.encrypt('Serial'),mainfm.encrypt('')));
  Vserial:=mainfm.GetHDSerialNumber('C:\');
  Vserial:=mainfm.encrypt0(Vserial);
 if  regflag=Vserial then
   begin
     zcbt.Caption:='软件已注册';
     zcbt.Enabled:=false;
     gbbt.Caption:='关闭';
     exit;
   end;
 if zcm.Text=Vserial then
   begin
     myinifile.WriteString(mainfm.encrypt1('regflag'),mainfm.encrypt1('regflag'),mainfm.encrypt1(Vserial));
     myinifile.WriteString(mainfm.encrypt('datenum'),mainfm.encrypt('datenum'),mainfm.encrypt('0'));
     showmessage('注册成功，软件下次启动便自动生效,谢谢你的支持！！');
     mainfm.regflag:='  软件已注册!!';
     mainfm.datenum:='';
     zcbt.Caption:='软件已注册';
     zcbt.Enabled:=false;
     gbbt.Caption:='关闭';
     close;
  end
else
  begin
    showmessage('注册码错误，注册失败！！');
    exit;
  end;
end;

procedure Trjzcfm.FormCreate(Sender: TObject);
begin
jqm.Text:=(mainfm.GetHDSerialNumber('C:\'));
end;

end.
