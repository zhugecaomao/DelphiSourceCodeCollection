unit Unit1;

interface

uses
  Windows, Messages,mmsystem, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var 
  i: Integer; 
  C: String; 
  DType: Integer; 
  DriveString: String; 
  driver:pchar;
  sec1, byt1, cl1, cl2:longword;
begin
  //通过循环依次判断各盘符的类型
  for i := 65 to 90 do
  begin
    C := chr(i)+':\'; 
    DType := GetDriveType(PChar(C));
    case DType of
      0: DriveString := C+' 不能判断的驱动器类型.';
      1: if chr(i)>'C' then
           Exit
         else
           DriveString := C+' 根目录不存在.';
      DRIVE_REMOVABLE: DriveString :=
         C+' 这是一个可移动驱动器';
      DRIVE_FIXED: DriveString :=
         C+' 这是硬盘驱动器.';
      DRIVE_REMOTE: DriveString := 
         C+' 这是一个网络驱动器.';
      DRIVE_CDROM: DriveString := C+' 这是一个光盘驱动器.';
      DRIVE_RAMDISK: DriveString := C+' 这是一个虚拟硬盘.';
    end;
    Memo1.Lines.Add(DriveString);
    driver:=pchar(c);//要显示的驱动器名
    GetDiskFreeSpace(driver, sec1, byt1, cl1, cl2);
    cl1 := cl1*sec1 * byt1;
    cl2 := cl2*sec1 * byt1;
    Memo1.Lines.add('该驱动器总共容量' + Formatfloat('###,##0',cl2) + '字节');
    Memo1.Lines.add('该驱动器可用容量' + Formatfloat('###,##0',cl1) + '字节');
    Memo1.Lines.Add('');
  end;
end; 


end.
