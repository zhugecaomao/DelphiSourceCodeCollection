object ExportRecord_frm: TExportRecord_frm
  Left = 256
  Top = 184
  Width = 563
  Height = 451
  Caption = #23548#20986#35760#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 555
    Height = 113
    Align = alTop
    Caption = #35831#36755#20837
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 42
      Width = 56
      Height = 14
      Caption = #23548#20986#26465#20214
    end
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 28
      Height = 14
      Caption = #34920#21517
    end
    object btnGetfield: TSpeedButton
      Left = 256
      Top = 16
      Width = 65
      Height = 22
      Caption = #35835#21462#23383#27573
      OnClick = btnGetfieldClick
    end
    object txtwheresql: TEdit
      Left = 72
      Top = 42
      Width = 249
      Height = 22
      ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
      TabOrder = 0
    end
    object txtTabID: TEdit
      Left = 72
      Top = 16
      Width = 177
      Height = 22
      ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
      TabOrder = 1
      Text = 'tabinfo'
    end
    object lboxfield: TCheckListBox
      Left = 328
      Top = 16
      Width = 225
      Height = 95
      Align = alRight
      Columns = 2
      ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
      ItemHeight = 14
      TabOrder = 2
    end
    object RG_Type: TRadioGroup
      Left = 40
      Top = 60
      Width = 281
      Height = 49
      Caption = 'RG_Type'
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Export'
        'Select'
        'Update'
        'Delete')
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 383
    Width = 555
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnRun: TBitBtn
      Left = 64
      Top = 8
      Width = 89
      Height = 25
      Caption = #29983' '#25104
      TabOrder = 0
      OnClick = btnRunClick
    end
    object btnClose: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851' '#38381
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnexp: TBitBtn
      Left = 200
      Top = 8
      Width = 89
      Height = 25
      Caption = #23548#20986'SQL'#35821#21477
      TabOrder = 2
      OnClick = btnexpClick
    end
  end
  object memosql: TMemo
    Left = 0
    Top = 113
    Width = 555
    Height = 270
    Align = alClient
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    Lines.Strings = (
      'memosql')
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule_frm.ADOConnection1
    Parameters = <>
    Left = 216
    Top = 176
  end
  object SaveDialog1: TSaveDialog
    Left = 272
    Top = 112
  end
end
