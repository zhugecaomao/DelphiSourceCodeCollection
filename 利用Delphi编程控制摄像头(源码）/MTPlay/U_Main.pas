{
    MTPlay V1.0 Write by ZHONG WAN at 2003.11

      -'`"_         -'`" \
     /     \       /      "
    /     /\\__   /  ___   \
   |      | \  -"`.-(   \   |
   |      |  |     | \"  |  |      ÍòÖØ
   |     /  /  "-"  \  \    |
    \___/  /  (o o)  \  (__/       µçÓÊ(email):
         __| _     _ |__           mantousoft@163.com
        (      ( )      )
         \_\.-.___.-./_/           ÍøÖ·(homepage):
           __  | |  __             http://www.delphibox.com
          |  \.| |./  |
          | '#.   .#' |            OICQ: 163932
          |__/ '"" \__|
        -/             \-          2003.11

}

unit U_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Menus, ImgList, DSPack, DSUtil, DirectShow9, ToolWin, ActnList,
  jpeg;

type
  Tfrm_Main = class(TForm)
    VideoWindow1: TVideoWindow;
    ImageList: TImageList;
    Timer1: TTimer;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Play1: TMenuItem;
    Stop1: TMenuItem;
    N1: TMenuItem;
    Capture1: TMenuItem;
    Bitmap1: TMenuItem;
    N2: TMenuItem;
    FullScreen1: TMenuItem;
    OnTop1: TMenuItem;
    N3: TMenuItem;
    Close1: TMenuItem;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Play2: TMenuItem;
    ActionList1: TActionList;
    A_Option: TAction;
    A_Play: TAction;
    A_Stop: TAction;
    P1: TMenuItem;
    S1: TMenuItem;
    StatusBar1: TStatusBar;
    A_Capture: TAction;
    A_OnTop: TAction;
    A_FullScreen: TAction;
    A_Bitmap: TAction;
    N4: TMenuItem;
    C1: TMenuItem;
    B1: TMenuItem;
    N5: TMenuItem;
    F1: TMenuItem;
    T1: TMenuItem;
    A_Exit: TAction;
    O1: TMenuItem;
    N6: TMenuItem;
    X1: TMenuItem;
    SampleGrabber1: TSampleGrabber;
    SaveDialog2: TSaveDialog;
    OpenDialog1: TOpenDialog;
    A_File: TAction;
    E1: TMenuItem;
    N7: TMenuItem;
    E2: TMenuItem;
    Image1: TImage;
    ASFWriter1: TASFWriter;
    procedure A_OptionExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure A_PlayExecute(Sender: TObject);
    procedure A_StopExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure A_CaptureExecute(Sender: TObject);
    procedure A_OnTopExecute(Sender: TObject);
    procedure A_FullScreenExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure A_ExitExecute(Sender: TObject);
    procedure A_BitmapExecute(Sender: TObject);
    procedure A_FileExecute(Sender: TObject);
  private
    CapFName: WideString;
    procedure VMRTextOut(AText: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation

uses U_Option;

{$R *.dfm}

procedure Tfrm_Main.A_OptionExecute(Sender: TObject);
begin
  frm_Option.ShowModal;
end;

procedure Tfrm_Main.Timer1Timer(Sender: TObject);
var
  Position: int64;
  Rate: Double;
  Hour, Min, Sec, MSec: Word;
const
  MiliSecInOneDay = 86400000;
begin
  if frm_Option.FilterGraph.Active then
  begin
    with frm_Option.FilterGraph as IMediaSeeking do
    begin
      GetCurrentPosition(Position);
      GetRate(Rate);
    end;
    DecodeTime(Position div 10000 / MiliSecInOneDay, Hour, Min, Sec, MSec);
    StatusBar1.SimpleText := Format('%d:%d:%d:%d', [Hour, Min, Sec, MSec]);
  end;
end;

procedure Tfrm_Main.VMRTextOut(AText: string);
var
  VMRBitmap: TVMRBitmap;
begin
  if AText = '' then exit;
  VMRBitmap := TVMRBitmap.Create(VideoWindow1);
  with VMRBitmap, Canvas do
  begin
    LoadEmptyBitmap(VideoWindow1.Width, VideoWindow1.Height, pf24bit, clSilver);
    Source := VMRBitmap.Canvas.ClipRect;
    Options := VMRBitmap.Options + [vmrbSrcColorKey];
    ColorKey := clSilver;
    Brush.Color := clSilver;
    Font := frm_Option.AFont;
    TextOut(0, 0, AText);
    DrawTo(0, 0, 1, 1, 0.5);
  end;
  VMRBitmap.Free;
end;

procedure Tfrm_Main.A_PlayExecute(Sender: TObject);
var
  Multiplexer: IBaseFilter;
  Writer: IFileSinkFilter;
  PinList: TPinList;
  i: integer;
  FSize: TPoint;
begin
  with frm_Option do
  begin
    // Change Form size
    if CB_VideoFormats.ItemIndex <> -1 then
    begin
      FSize := GetMediaTypeOfSize(VideoMediaTypes.Items[CB_VideoFormats.ItemIndex].AMMediaType^);
      if FSize.X <> 0 then
        frm_Main.Width := FSize.X + 8;
      if FSize.Y <> 0 then
        frm_Main.Height := FSize.Y + 94;
    end;
    // Change mode
    FilterGraph.Mode := gmCapture;
    // Activate the filter graph, at this stage the source filters are added to the graph
    FilterGraph.Active := true;
    // configure output Audio media type + source
    if AudioSourceFilter.FilterGraph <> nil then
    begin
      PinList := TPinList.Create(AudioSourceFilter as IBaseFilter);
      i := 0;
      while i < PinList.Count do
        if PinList.PinInfo[i].dir = PINDIR_OUTPUT then
        begin
          if CB_AudioFormats.ItemIndex <> -1 then
            with (PinList.Items[i] as IAMStreamConfig) do
              SetFormat(AudioMediaTypes.Items[CB_AudioFormats.ItemIndex].AMMediaType^);
          PinList.Delete(i);
        end else inc(i);
      if CB_InputLines.ItemIndex <> -1 then
        with (PinList.Items[CB_InputLines.ItemIndex] as IAMAudioInputMixer) do
          put_Enable(true);
      PinList.Free;
    end;
    // configure output Video media type
    if VideoSourceFilter.FilterGraph <> nil then
    begin
      PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
      if CB_VideoFormats.ItemIndex <> -1 then
        with (PinList.First as IAMStreamConfig) do
          SetFormat(VideoMediaTypes.Items[CB_VideoFormats.ItemIndex].AMMediaType^);
      PinList.Free;
    end;
    // now render streams
    with FilterGraph as IcaptureGraphBuilder2 do
    begin
      // Connect Video preview (VideoWindow)
      if VideoSourceFilter.BaseFilter.DataLength > 0 then
        RenderStream(@PIN_CATEGORY_PREVIEW, nil, VideoSourceFilter as IBaseFilter,
          nil, VideoWindow1 as IBaseFilter);
      // In capture mode
      if A_Capture.Checked then
      begin
        // set the output filename
        SetOutputFileName(MEDIASUBTYPE_Avi, PWideChar(CapFName), Multiplexer, Writer);
        // Connect Video capture streams
        if VideoSourceFilter.FilterGraph <> nil then
          RenderStream(@PIN_CATEGORY_CAPTURE, nil, VideoSourceFilter as IBaseFilter,
            nil, Multiplexer as IBaseFilter);
        // Connect Audio capture streams
        if AudioSourceFilter.FilterGraph <> nil then
        begin
          RenderStream(nil, nil, AudioSourceFilter as IBaseFilter,
            nil, Multiplexer as IBaseFilter);
        end;
      end;
    end;
    FilterGraph.Play;
    VMRTextOut(frm_Option.E_Text.Text); //×ÖÄ»
    Timer1.Enabled := true;
  end;
  A_Play.Checked := True;
  A_Capture.Enabled := True;
end;

procedure Tfrm_Main.A_StopExecute(Sender: TObject);
begin
  Timer1.Enabled := False;
  A_Play.Checked := False;
  frm_Option.FilterGraph.Stop;
  frm_Option.FilterGraph.Active := False;
  
  VideoWindow1.Canvas.Lock;
  try
    VideoWindow1.Canvas.StretchDraw(VideoWindow1.Canvas.ClipRect, Image1.Picture.Graphic);
  finally
    VideoWindow1.Canvas.Unlock;
  end;
end;

procedure Tfrm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  A_Stop.Execute;
end;

procedure Tfrm_Main.A_CaptureExecute(Sender: TObject);
begin
  A_Stop.Execute;
  if CapFName = '' then
  begin
    if not SaveDialog1.Execute then Exit;
    A_Capture.Checked := True;
    CapFName := SaveDialog1.FileName;
  end else
  begin
    A_Capture.Checked := False;
    CapFName := '';
  end;
  A_Play.Execute;
end;

procedure Tfrm_Main.A_OnTopExecute(Sender: TObject);
begin
  A_OnTop.Checked := not A_OnTop.Checked;
  if A_OnTop.Checked then
    SetWindowPos(handle, HWND_TOPMOST, Left, Top, Width, Height, 0) else
    SetWindowPos(handle, HWND_NOTOPMOST, Left, Top, Width, Height, 0);
end;

procedure Tfrm_Main.A_FullScreenExecute(Sender: TObject);
begin
  A_FullScreen.Checked := not A_FullScreen.Checked;
  VideoWindow1.FullScreen := A_FullScreen.Checked;
end;

procedure Tfrm_Main.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Esc exit full screen mode
  if Key = 27 then
  begin
    A_FullScreen.Checked := True;
    A_FullScreen.Execute;
  end;
end;

procedure Tfrm_Main.A_ExitExecute(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Main.A_BitmapExecute(Sender: TObject);
var
  ABitmap: TBitmap;
//  AStream: TMemoryStream;
begin
  if not SaveDialog2.Execute then exit;
  ABitmap := TBitmap.Create;
//  AStream := TMemoryStream.Create;
  try
//    VideoWindow1.VMRGetBitmap(AStream);
    SampleGrabber1.GetBitmap(ABitmap);
//    AStream.SaveToFile(SaveDialog2.FileName);
    ABitmap.SaveToFile(SaveDialog2.FileName);
  finally
//    AStream.Free;
    ABitmap.Free;
  end;
end;

procedure Tfrm_Main.A_FileExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    A_Stop.Execute; //Í£Ö¹
//    frm_Option.FilterGraph.Mode := gmNormal;
    frm_Option.FilterGraph.Active := True;
    frm_Option.FilterGraph.RenderFile(OpenDialog1.FileName);
    frm_Option.FilterGraph.Play;
    VMRTextOut(frm_Option.E_Text.Text); //×ÖÄ»
    Timer1.Enabled := True;
    A_Play.Checked := True;
    A_Capture.Enabled := False;
  end;
end;

end.

