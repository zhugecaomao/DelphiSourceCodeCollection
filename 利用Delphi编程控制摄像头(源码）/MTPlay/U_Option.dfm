object frm_Option: Tfrm_Option
  Left = 310
  Top = 294
  BorderStyle = bsDialog
  BorderWidth = 6
  Caption = #35774#32622
  ClientHeight = 259
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 212
    Width = 399
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 96
      Top = 16
      Width = 75
      Height = 25
      Caption = #24212#29992'(&A)'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 16
      Width = 75
      Height = 25
      Caption = #20851#38381'(&X)'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 212
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 60
      Height = 12
      Caption = #35270#39057#35774#22791#65306
    end
    object Label4: TLabel
      Left = 16
      Top = 80
      Width = 60
      Height = 12
      Caption = #38899#39057#35774#22791#65306
    end
    object Label3: TLabel
      Left = 16
      Top = 144
      Width = 60
      Height = 12
      Caption = #38899#39057#36755#20837#65306
    end
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 60
      Height = 12
      Caption = #35270#39057#26684#24335#65306
    end
    object Label6: TLabel
      Left = 16
      Top = 112
      Width = 60
      Height = 12
      Caption = #38899#39057#26684#24335#65306
    end
    object Label7: TLabel
      Left = 16
      Top = 176
      Width = 60
      Height = 12
      Caption = #28151#21512#23383#24149#65306
    end
    object CB_VideoCapFilters: TComboBox
      Left = 80
      Top = 16
      Width = 209
      Height = 20
      ItemHeight = 12
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = CB_VideoCapFiltersChange
    end
    object CB_AudioCapFilters: TComboBox
      Left = 80
      Top = 80
      Width = 209
      Height = 20
      ItemHeight = 12
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = CB_AudioCapFiltersChange
    end
    object CB_VideoFormats: TComboBox
      Left = 80
      Top = 48
      Width = 297
      Height = 20
      ItemHeight = 12
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = CB_FormatsChange
    end
    object CB_AudioFormats: TComboBox
      Left = 80
      Top = 112
      Width = 297
      Height = 20
      ItemHeight = 12
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = CB_FormatsChange
    end
    object CB_InputLines: TComboBox
      Left = 80
      Top = 144
      Width = 297
      Height = 20
      ItemHeight = 12
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object Btn_Video_Property: TButton
      Left = 304
      Top = 16
      Width = 75
      Height = 25
      Caption = #35270#39057#23646#24615
      TabOrder = 5
      OnClick = Btn_Video_PropertyClick
    end
    object Btn_Audio_Property: TButton
      Left = 304
      Top = 80
      Width = 75
      Height = 25
      Caption = #38899#39057#23646#24615
      TabOrder = 6
      OnClick = Btn_Audio_PropertyClick
    end
    object E_Text: TEdit
      Left = 80
      Top = 176
      Width = 209
      Height = 20
      TabOrder = 7
      Text = '2CCC.COM'
    end
    object Btn_Font: TButton
      Left = 304
      Top = 176
      Width = 75
      Height = 25
      Caption = #23383#24149#23383#20307
      TabOrder = 8
      OnClick = Btn_FontClick
    end
  end
  object AudioSourceFilter: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph
    Left = 112
    Top = 32
  end
  object VideoSourceFilter: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph
    Left = 80
    Top = 32
  end
  object FilterGraph: TFilterGraph
    GraphEdit = True
    Left = 144
    Top = 32
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 264
    Top = 184
  end
end
