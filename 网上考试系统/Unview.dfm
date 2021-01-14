object viewfrm: Tviewfrm
  Left = 160
  Top = 124
  Width = 642
  Height = 434
  Caption = #32771#22330#30417#27979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 793
    Height = 505
    DataSource = DataSource1
    FixedColor = clActiveBorder
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #20934#32771#35777#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24615#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36523#20221#35777#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32771#35797#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24471#20998
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20303#22336
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.DSStudent
    Left = 160
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 96
    object N1: TMenuItem
      Caption = #32456#27490#32771#35797
      OnClick = N1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 160
    Top = 128
  end
end
