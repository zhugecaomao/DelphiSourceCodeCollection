inherited frmDict: TfrmDict
  Left = 152
  Top = 147
  Caption = 'frmDict'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    inherited ToolBar1: TToolBar
      inherited DN: TDBNavigator
        DataSource = DS
        Hints.Strings = ()
      end
      inherited ToolButton4: TToolButton
        OnClick = ToolButton4Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 83
      Width = 562
      Height = 254
      Align = alClient
      DataSource = DS
      FixedColor = 14935011
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object Panel1: TPanel
      Left = 0
      Top = 57
      Width = 562
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
      object cbDict: TComboBox
        Left = 11
        Top = 2
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnClick = cbDictClick
      end
    end
  end
  object DS: TDataSource
    Left = 128
    Top = 104
  end
end
