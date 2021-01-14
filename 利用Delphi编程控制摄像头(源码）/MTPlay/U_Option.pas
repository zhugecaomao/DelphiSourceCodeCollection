unit U_Option;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DSPack, DSUtil, ComCtrls, DirectShow9, Inifiles;

type
  Tfrm_Option = class(TForm)
    AudioSourceFilter: TFilter;
    VideoSourceFilter: TFilter;
    FilterGraph: TFilterGraph;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CB_VideoCapFilters: TComboBox;
    CB_AudioCapFilters: TComboBox;
    CB_VideoFormats: TComboBox;
    CB_AudioFormats: TComboBox;
    CB_InputLines: TComboBox;
    Btn_Video_Property: TButton;
    Btn_Audio_Property: TButton;
    Label7: TLabel;
    E_Text: TEdit;
    Button1: TButton;
    Button2: TButton;
    Btn_Font: TButton;
    FontDialog1: TFontDialog;
    procedure FormCreate(Sender: TObject);
    procedure CB_VideoCapFiltersChange(Sender: TObject);
    procedure CB_AudioCapFiltersChange(Sender: TObject);
    procedure CB_FormatsChange(Sender: TObject);
    procedure Btn_Video_PropertyClick(Sender: TObject);
    procedure Btn_Audio_PropertyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Btn_FontClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    AFont: TFont;
    VideoSysDev: TSysDevEnum;
    AudioSysDev: TSysDevEnum;
    VideoMediaTypes: TEnumMediaType;
    AudioMediaTypes: TEnumMediaType;
    function GetMediaTypeOfSize(MediaType: TAMMediaType): TPoint;
    { Public declarations }
  end;

var
  frm_Option: Tfrm_Option;

implementation

{$R *.dfm}

function Tfrm_Option.GetMediaTypeOfSize(MediaType: TAMMediaType): TPoint;
begin
  if IsEqualGUID(MediaType.formattype, FORMAT_VideoInfo) or
    IsEqualGUID(MediaType.formattype, FORMAT_VideoInfo2) or
    IsEqualGUID(MediaType.formattype, FORMAT_MPEGVideo) or
    IsEqualGUID(MediaType.formattype, FORMAT_MPEG2Video) then
  begin
    if ((MediaType.cbFormat > 0) and assigned(MediaType.pbFormat)) then
      with PVideoInfoHeader(MediaType.pbFormat)^.bmiHeader do
        Result := Point(biWidth, biHeight);
  end else
    Result := Point(0, 0);
end;

procedure Tfrm_Option.FormCreate(Sender: TObject);
var
  i: integer;
begin
  VideoSysDev := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  for i := 0 to VideoSysDev.CountFilters - 1 do
    CB_VideoCapFilters.Items.Add(VideoSysDev.Filters[i].FriendlyName);
  CB_VideoCapFilters.ItemIndex := 0;
  AudioSysDev := TSysDevEnum.Create(CLSID_AudioInputDeviceCategory);
  for i := 0 to AudioSysDev.CountFilters - 1 do
    CB_AudioCapFilters.Items.Add(AudioSysDev.Filters[i].FriendlyName);
  CB_AudioCapFilters.ItemIndex := 0;

  AFont := TFont.Create;
  AFont.Color := clWhite;
  AFont.Style := [fsBold];
  AFont.Size := 30;
  AFont.Name := 'ËÎÌו';
  AFont.Charset:= GB2312_CHARSET;

  VideoMediaTypes := TEnumMediaType.Create;
  AudioMediaTypes := TEnumMediaType.Create;

  CB_VideoCapFiltersChange(nil);
  CB_AudioCapFiltersChange(nil);

  with TInifile.Create(ExtractFilePath(ParamStr(0))+ChangeFileExt(ExtractFileName(ParamStr(0)),'.ini')) do
  begin
//    E_Port.Text:=ReadString('comm','port','3333');
    E_Text.Text:=ReadString('comm','text','2CCC.COM');
  end;
end;

// Select the video Source

procedure Tfrm_Option.CB_VideoCapFiltersChange(Sender: TObject);
var
  PinList: TPinList;
  i: integer;
begin
  VideoSysDev.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if CB_VideoCapFilters.ItemIndex <> -1 then
  begin
    VideoSourceFilter.BaseFilter.Moniker := VideoSysDev.GetMoniker(CB_VideoCapFilters.ItemIndex);
    VideoSourceFilter.FilterGraph := FilterGraph;
    FilterGraph.Active := true;
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    CB_VideoFormats.Clear;
    VideoMediaTypes.Assign(PinList.First);
    for i := 0 to VideoMediaTypes.Count - 1 do
      CB_VideoFormats.Items.Add(VideoMediaTypes.MediaDescription[i]);
    CB_VideoFormats.ItemIndex := 0;
    FilterGraph.Active := false;
    PinList.Free;
  end;
end;

// Select the audio Source

procedure Tfrm_Option.CB_AudioCapFiltersChange(Sender: TObject);
var
  PinList: TPinList;
  i, LineIndex: integer;
  ABool: LongBool;
begin
  AudioSysDev.SelectGUIDCategory(CLSID_AudioInputDeviceCategory);
  if CB_AudioCapFilters.ItemIndex <> -1 then
  begin
    AudioSourceFilter.BaseFilter.Moniker := AudioSysDev.GetMoniker(CB_AudioCapFilters.ItemIndex);
    AudioSourceFilter.FilterGraph := FilterGraph;
    FilterGraph.Active := true;
    PinList := TPinList.Create(AudioSourceFilter as IBaseFilter);
    CB_AudioFormats.Clear;
    i := 0;
    while i < PinList.Count do
      if PinList.PinInfo[i].dir = PINDIR_OUTPUT then
      begin
        AudioMediaTypes.Assign(PinList.Items[i]);
        PinList.Delete(i);
      end else inc(i);

    for i := 0 to AudioMediaTypes.Count - 1 do
    begin
      CB_AudioFormats.Items.Add(AudioMediaTypes.MediaDescription[i]);
    end;
    CB_AudioFormats.ItemIndex := 0;

    FilterGraph.Active := false;
    CB_InputLines.Clear;
    LineIndex := -1;
    for i := 0 to PinList.Count - 1 do
    begin
      CB_InputLines.Items.Add(PinList.PinInfo[i].achName);
      with (PinList.Items[i] as IAMAudioInputMixer) do get_Enable(ABool);
      if ABool then LineIndex := i;
    end;
    CB_InputLines.ItemIndex := LineIndex;
    PinList.Free;
  end;
end;

procedure Tfrm_Option.CB_FormatsChange(Sender: TObject);
begin
  (Sender as TComboBox).Hint := (Sender as TComboBox).Text;
end;

procedure Tfrm_Option.Btn_Video_PropertyClick(Sender: TObject);
begin
  FilterGraph.Active := True;
  ShowFilterPropertyPage(Self.Handle, VideoSourceFilter as IBaseFilter);
//  FilterGraph.Active := False;
end;

procedure Tfrm_Option.Btn_Audio_PropertyClick(Sender: TObject);
begin
  FilterGraph.Active := True;
  ShowFilterPropertyPage(Self.Handle, AudioSourceFilter as IBaseFilter);
//  FilterGraph.Active := False;
end;

procedure Tfrm_Option.FormDestroy(Sender: TObject);
begin
  FilterGraph.ClearGraph;
  FilterGraph.Active := False;

  VideoMediaTypes.Free;
  AudioMediaTypes.Free;
  VideoSysDev.Free;
  AudioSysDev.Free;
end;

procedure Tfrm_Option.Btn_FontClick(Sender: TObject);
begin
  FontDialog1.Font := AFont;
  if FontDialog1.Execute then
    AFont := FontDialog1.Font;
end;

procedure Tfrm_Option.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Option.Button1Click(Sender: TObject);
begin
  with TInifile.Create(ExtractFilePath(ParamStr(0))+ChangeFileExt(ExtractFileName(ParamStr(0)),'.ini')) do
  begin
//    WriteString('comm','port',E_Port.Text);
    WriteString('comm','text',E_Text.Text);
  end;
end;

end.

