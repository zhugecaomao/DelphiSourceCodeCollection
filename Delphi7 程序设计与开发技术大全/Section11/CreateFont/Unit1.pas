unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormPaint(Sender: TObject);
var
  FLogFont : tagLogFontA;         //逻辑字体--结构体类型
  hTempFont, hPrevFont: HFONT;    //字体句柄
  hTempDC: HDC;                   //设备描述表或图形设备句柄
  TempString: string;             //输出的文字
begin
  FLogFont.lfHeight := 100;       //字高
  FLogFont.lfWidth := 50;         //字宽
  FLogFont.lfWeight := 5;         //字体笔划粗细程度
  FLogFont.lfUnderline := 0;      //没有下划线
  FLogFont.lfStrikeOut := 0;      //没有删除线
  FLogFont.lfItalic := 0;         //斜体效果否
  FLogFont.lfCharSet := GB2312_CHARSET; //字符集
  FLogfont.lfEscapement := 450;   //倾斜度
  FLogFont.lfOrientation := 450;  //方向与倾斜度取值同
  FLogFont.lfFaceName := '隶书';  //字体名称
  //创建逻辑字体
  hTempFont := CreateFontIndirect(FLogFont);
  TempString := '倾斜';
  //取得窗口的设备句柄
  hTempDC := GetDC(Handle);
  //取出窗口设备的当前字体，并替换为新字体
  hPrevFont := SelectObject(hTempDC, hTempFont);
  //设置设备窗口的文字色彩
  SetTextColor(hTempDc, clRed);
  //输出文字
  TextOut(hTempDc, 100 , 150, PChar(TempString), Length(TempString));
  //恢复原有的字体
  SelectObject(hTempDc, hPrevFont);
  //删除逻辑字体
  DeleteObject(hTempFont);
  //释放设备接口
  ReleaseDC(Handle, hTempDC);
end;

end.
