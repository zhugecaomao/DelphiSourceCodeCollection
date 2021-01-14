object TabInfoStyle_frm: TTabInfoStyle_frm
  Left = 262
  Top = 136
  Width = 591
  Height = 442
  Caption = 'TabInfoStyle_frm'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object StatusBar1: TStatusBar
    Left = 0
    Top = 396
    Width = 583
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 355
    Width = 583
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btninistyle: TBitBtn
      Left = 208
      Top = 8
      Width = 89
      Height = 25
      Caption = #21021#22987#21270#27169#26495
      TabOrder = 0
      OnClick = btninistyleClick
    end
    object btnsavestyle: TBitBtn
      Left = 312
      Top = 8
      Width = 97
      Height = 25
      Caption = #20445#23384#24403#21069#26800#26495
      TabOrder = 1
      OnClick = btnsavestyleClick
    end
    object btnexpstyle: TBitBtn
      Left = 104
      Top = 8
      Width = 89
      Height = 25
      Caption = #23548#20986#34920#27169#26495
      TabOrder = 2
      OnClick = btnexpstyleClick
    end
    object btnclosestyle: TBitBtn
      Left = 424
      Top = 8
      Width = 57
      Height = 25
      Caption = #36864' '#20986
      TabOrder = 3
      OnClick = btnclosestyleClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 583
    Height = 355
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelKind = bkFlat
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object ParentPanel: TPanel
      Left = 8
      Top = 4
      Width = 377
      Height = 249
      BevelInner = bvLowered
      TabOrder = 0
      OnMouseDown = ParentPanelMouseDown
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule_frm.ADOConnection1
    Parameters = <>
    Left = 112
    Top = 304
  end
end
