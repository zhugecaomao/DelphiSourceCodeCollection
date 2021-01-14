unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Nb30, StdCtrls,StrUtils,DateUtils,IniFiles;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function NBGetAdapterAddress(a:integer):string;
    function CreateLogin(AdapterAddress:string):string;
    function GetLogin(LoginID:String):string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

function TForm1.NBGetAdapterAddress(a: integer): string;
var
 NCB:TNCB;//netBios控制块
   ADAPTER:TADAPTERSTATUS;//取网卡状态
  LANAENUM:TLANAENUM;
  intIdx:Integer;//临时变量
  cRC:Char;//netBios返回值
  strTemp:String;//临时变量

begin
 Result:='';
  Try
    //内存清零
    ZeroMemory(@NCB,sizeof(NCB));
    NCB.ncb_Command:=chr(NCBENUM);
    cRC:=netBios(@NCB);
    NCB.ncb_buffer:=@LANAENUM;
    ncb.NCB_length:=Sizeof(LANAENUM);
    cRC:=NetBios(@NCB);
    if ord(cRc)<>0 then exit;
    //初始化网卡地址
    ZeroMemory(@NCB,SizeOf(NCB));
    NCb.ncb_Command:=chr(NCBRESET);
    NCB.ncb_lana_num:=LANAENUM.lana[a];
    cRC:=NetBios(@NCB);
    if Ord(cRC)<>0 then exit;
    //得到网卡地址
    ZeroMemory(@NCB,SizeOf(NCB));
    NCb.ncb_Command:=chr(NCBASTAT);
    NCB.ncb_lana_num:=LANAENUM.lana[a];
    strpcopy(NCB.ncb_callname,'*');
    NCB.ncb_buffer:=@ADAPTER;
    NCB.ncb_length:=sizeof(ADAPTER);
    cRC:=NetBios(@NCB);
    //将网卡地址转换成某种格式字符串
    strTemp:='';
      For intIdx:=0 to 5 do
         strTemp:=Strtemp+inttohex(integer(ADAPTER.adapter_address[intIdx]),2);
         Result:=strTemp;
      Finally
      End;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  Name:PChar;
  Size:DWORD;
begin
  GetMem(Name,255);
  Size:=255;
  GetComputerName(Name,Size);
  Label2.Caption:=Name+'    ';
  Label4.Caption:=NBGetAdapterAddress(0);
  FreeMem(Name);
end;

function TForm1.CreateLogin(AdapterAddress: string): string;
var
  i:Integer;
  High,Low,Year:string;
begin
  High:=LeftStr(AdapterAddress,Length(AdapterAddress)-4);
  Low:=RightStr(AdapterAddress,4);
  Year:=IntToStr(YearOf(Now));
  for i:=1 to 4 do
  begin
    High:=High+Low[i]+Year[i];
  end;
  Result := High;
end;

function TForm1.GetLogin(LoginID: String): string;
var
  RunStr:string;
  i:Integer;
begin
  i:=1;
  while i<Length(LoginID) do
  begin
    if RunStr='' then
      RunStr:=RunStr+copy(LoginID,i,4)
    else
      RunStr:=RunStr+'-'+copy(LoginID,i,4);
    i:=i+4;
  end;
  Result := RunStr;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label6.Caption:=GetLogin(CreateLogin(NBGetAdapterAddress(0)));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  IniFile:TIniFile;
  LoginID:string;
begin
  IniFile:=TIniFile.Create('.\Login.ini');
  LoginID:=Edit1.Text+Edit2.Text+Edit3.Text+Edit4.Text;
  if LoginID <> CreateLogin(NBGetAdapterAddress(0)) then
  begin
    Application.MessageBox('序列号不正确！','明日科技');
  end
  else
  begin
    IniFile.WriteString('Login','ID',LoginID);
    Application.MessageBox('注册成功！','明日科技');
  end;
  IniFile.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

end.
