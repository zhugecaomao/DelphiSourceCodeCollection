object BuildSQL_frm: TBuildSQL_frm
  Left = 260
  Top = 164
  Width = 452
  Height = 387
  Caption = #25191#34892'SQL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object gboxsql: TGroupBox
    Left = 0
    Top = 0
    Width = 444
    Height = 288
    Align = alClient
    Caption = #29983#25104#30340'SQL'#35821#21477
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object MemoSQL: TMemo
      Left = 2
      Top = 15
      Width = 440
      Height = 271
      Align = alClient
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 288
    Width = 444
    Height = 72
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnexp: TBitBtn
      Left = 216
      Top = 8
      Width = 89
      Height = 25
      Caption = #23548#20986'SQL'#35821#21477
      TabOrder = 1
      OnClick = btnexpClick
    end
    object btnRun: TBitBtn
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      Caption = #25191#34892'SQL'
      TabOrder = 0
      OnClick = btnRunClick
    end
    object btnClose: TBitBtn
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 53
      Width = 444
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 50
        end>
      SimplePanel = False
    end
    object btnonerun: TBitBtn
      Left = 120
      Top = 8
      Width = 81
      Height = 25
      Caption = #36880#34892#25191#34892'SQL'
      TabOrder = 4
      OnClick = btnonerunClick
    end
  end
  object ADOCommand1: TADOCommand
    Connection = DataModule_frm.ADOConnection1
    Parameters = <>
    Left = 232
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 272
    Top = 112
  end
end
