//-------------------------------------------------------------------------
//控 件 包：平滑特效字体控件包
//单元名称：演示程序主窗体单元  　　　　　　　
//单元作者：与月共舞工作室  周劲羽
//下载网址：http://yygw.126.com
//Eamil   ：yygw@163.com; yygw@sina.com
//发布类型：免费单元　　　　　　　　　　　　　　　　　　
//备　　注：该单元演示了控件包的一些功能
//最后更新：2002.06.26
//-------------------------------------------------------------------------
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AAFont, AACtrls, ComCtrls, MPlayer, StdCtrls, Buttons, ExtCtrls,
  AAFontDialog;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    bbtnRandomUpdate: TBitBtn;
    AAScrollText: TAAScrollText;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    AALabel3: TAALabel;
    AALabel4: TAALabel;
    AALabel5: TAALabel;
    AALabel6: TAALabel;
    AALabel8: TAALabel;
    AALabel9: TAALabel;
    AALabel7: TAALabel;
    tbSpeed: TTrackBar;
    AALinkLabel1: TAALinkLabel;
    AALinkLabel2: TAALinkLabel;
    AAFontDialog: TAAFontDialog;
    AALabel10: TAALabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    AALinkLabel3: TAALinkLabel;
    AALinkLabel4: TAALinkLabel;
    AALinkLabel5: TAALinkLabel;
    AAText1: TAAText;
    AALinkLabel6: TAALinkLabel;
    AALinkLabel7: TAALinkLabel;
    AAFadeText1: TAAFadeText;
    Edit: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    AALabel11: TAALabel;
    AALabel12: TAALabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AAScrollTextLabels8GetText(Sender: TUserLabel;
      var Text: String);
    procedure bbtnRandomUpdateClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure tbSpeedChange(Sender: TObject);
    procedure AALabel1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MidName: string;
    MediaPlayer: TMediaPlayer;
    Ver: Integer;
    procedure OnNotify(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

const
  csResName = 'YYGW';
  csResNum = 3;
  csDesMidFile = 'yygw.mid';
  csTitleYygw = 'TitleYygw';
  csTextYygw = 'TextYygw';
  csTextVer = 'TextVer';
  csText2 = 'Text2';

{$R *.DFM}
{$R Mid.RES}

// 窗体显示前
procedure TForm1.FormShow(Sender: TObject);
var
  TempPath: array[0..MAX_PATH] of Char;
begin
  MediaPlayer := TMediaPlayer.Create(Self); // 创建媒体播放器用于播放MIDI
  MediaPlayer.Parent := Self;
  MediaPlayer.Visible := False;
  MediaPlayer.OnNotify := OnNotify;
  GetTempPath(MAX_PATH, TempPath);
  MidName := TempPath + csDesMidFile;
  AAScrollText.Active := True;
end;

// 窗体释放
procedure TForm1.FormDestroy(Sender: TObject);
begin
  MediaPlayer.Close;
  DeleteFile(MidName);
end;

// 双击标签设置字体效果
procedure TForm1.AALabel1DblClick(Sender: TObject);
begin
  AAFontDialog.Effect := AALabel1.Effect.FontEffect;
  AAFontDialog.Font := AALabel1.Font; // 允许直接用赋值符赋值
  if AAFontDialog.Execute then
  begin
    AALabel1.Effect.FontEffect := AAFontDialog.Effect;
    AALabel1.Font := AAFontDialog.Font;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  AALinkLabel1.Click; // 使用TAALinkLabel.Click方法相当于用户点击控件
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  AALinkLabel2.Click;
end;

// 播放器通知
procedure TForm1.OnNotify(Sender: TObject);
begin
  if MediaPlayer.Mode = mpStopped then
    MediaPlayer.Play; // 循环播放
  MediaPlayer.Notify := True;
end;

// 切换页面控制背景MIDI
procedure TForm1.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet4 then
    bbtnRandomUpdateClick(nil)
  else
    MediaPlayer.Close;
end;

// 调节滚动速度
procedure TForm1.tbSpeedChange(Sender: TObject);
begin                      // 如果为0将停止滚动，故加1
  AAScrollText.ScrollDelay := 10 * tbSpeed.Position + 1;
end;
                                   
// 取标签内容（演示用户标签的使用）
procedure TForm1.AAScrollTextLabels8GetText(Sender: TUserLabel;
  var Text: String);
const
  Vers: array[0..2] of string = ('激情版', '伤情版', '深情版');
begin
  Text := Vers[Ver];  // 运行时可更改滚动文本内容，该内容在控件Reset时读取
end;

// 更新作者填词的《与月共舞》并播放MIDI原曲《蝶恋》
procedure TForm1.bbtnRandomUpdateClick(Sender: TObject);
const
  csFontMax = 9;
  csFonts: array[0..csFontMax - 1] of string = ('隶', '楷', '魏', '黑', '美', '圆',
    '黄', '艺', '琥');
var
  i, j: Integer;
  Fonts: TStrings;
  FontName: string;
  ResStream: TResourceStream;
  ResName: string;
  function RandomColor: TColor;   //随机色
  begin
    Result := HSLToRGB(Random, 0.75 + Random * 0.25, 0.3 + Random * 0.25);
  end;
begin
  MediaPlayer.Close;
  try
    Ver := Random(csResNum);
    ResName := csResName + IntToStr(Ver);
    ResStream := TResourceStream.Create(hInstance, PChar(ResName), RT_RCDATA);
    try
      ResStream.SaveToFile(MidName);
      MediaPlayer.FileName := MidName;
      MediaPlayer.Open;
      MediaPlayer.Play;
      MediaPlayer.Notify := True;
    finally
      ResStream.Free;
    end;
  except
    ;
  end;
  Fonts := TStringList.Create;
  try
    AAScrollText.BeginUpdate;  // 开始更新，禁止自动重绘
    try
      for i := 0 to Screen.Fonts.Count - 1 do  // 创建符合条件的字体列表
      begin
        FontName := Screen.Fonts[i];
        if Pos('@', FontName) <= 0 then  // 不是倒放字体
        begin
          for j := 0 to csFontMax - 1 do
            if Pos(csFonts[j], FontName) > 0 then
            begin
              Fonts.Add(FontName);
              Break;
            end;
        end;
      end;
      with AAScrollText.Fonts do   // 设置随机字体
      begin
        if Fonts.Count > 0 then
        begin    // 使用IndexOf来取得字体标签项
          Items[IndexOf(csTitleYygw)].Font.Name := Fonts[Random(Fonts.Count)];
          Items[IndexOf(csTextYygw)].Font.Name := Fonts[Random(Fonts.Count)];
          Items[IndexOf(csTextVer)].Font.Name := Fonts[Random(Fonts.Count)];
          Items[IndexOf(csText2)].Font.Name := Fonts[Random(Fonts.Count)];
        end;    // 设置随机颜色和效果
        Items[IndexOf(csTitleYygw)].Effect.Gradual.StartColor := RandomColor;
        Items[IndexOf(csTitleYygw)].Effect.Gradual.EndColor := RandomColor;
        Items[IndexOf(csTextYygw)].Effect.Gradual.StartColor := RandomColor;
        Items[IndexOf(csTextYygw)].Effect.Gradual.EndColor := RandomColor;
        Items[IndexOf(csTitleYygw)].Effect.Outline := Odd(Random(100));
        Items[IndexOf(csTextVer)].Font.Color := RandomColor;
        Items[IndexOf(csText2)].Font.Color := RandomColor;
        Items[IndexOf(csTitleYygw)].Effect.Gradual.Style :=
          TGradualStyle(Random(Ord(High(TGradualStyle)) + 1));
        Items[IndexOf(csTextYygw)].Effect.Gradual.Style :=
          TGradualStyle(Random(Ord(High(TGradualStyle)) + 1));
      end;
    finally
      AAScrollText.EndUpdate;  // 结束更新
      AAScrollText.Reset;  // 重新绘制文本
    end;
  finally
    Fonts.Free;
  end;
end;

// 渐隐到指定行
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  AAFadeText1.FadeToStr(Edit.Text);
end;

end.
