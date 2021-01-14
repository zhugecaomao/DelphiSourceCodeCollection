inherited frmHp: TfrmHp
  Left = 146
  Top = 333
  Width = 808
  Height = 576
  Caption = #36135#21697#36164#26009
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter1: TSplitter [0]
    Left = 308
    Top = 82
    Width = 4
    Height = 448
    Cursor = crHSplit
    Align = alRight
    Beveled = True
  end
  inherited DBGrid1: TDBGrid
    Width = 308
    Height = 448
    DataSource = Data.sHp
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aHPLBMC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DW'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HPSXID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aZKCL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JJJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JQJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZT'
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    Width = 800
    inherited Image1: TImage
      Width = 800
    end
    object Label2: TLabel
      Left = 212
      Top = 12
      Width = 75
      Height = 15
      Caption = #26597#30475#26041#24335#65306
      Transparent = True
    end
    object RadioGroup1: TRadioGroup
      Left = 282
      Top = -3
      Width = 297
      Height = 39
      Color = cl3DLight
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '&1.'#20351#29992#20013
        '&2.'#38750#20351#29992#20013
        '&3.'#20840#37096)
      ParentColor = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
  inherited ControlBar1: TControlBar
    Width = 800
    inherited ToolBar1: TToolBar
      Width = 547
      ButtonWidth = 67
      object ToolButton2: TToolButton
        Left = 472
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 480
        Top = 0
        Action = aList
        Caption = #20854#23427#20449#24687
      end
    end
    inherited ToolBar3: TToolBar
      Width = 57
    end
  end
  object pnlList: TPanel [4]
    Left = 312
    Top = 82
    Width = 488
    Height = 448
    Align = alRight
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'pnlList'
    TabOrder = 3
    OnResize = pnlListResize
    object Splitter3: TSplitter
      Left = 291
      Top = 0
      Width = 3
      Height = 444
      Cursor = crHSplit
      Align = alRight
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 291
      Height = 444
      Align = alClient
      Caption = 'Panel6'
      TabOrder = 0
      object StringGrid1: TStringGrid
        Left = 1
        Top = 1
        Width = 289
        Height = 442
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        ColCount = 3
        DefaultRowHeight = 22
        FixedColor = cl3DLight
        FixedCols = 2
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ScrollBars = ssVertical
        TabOrder = 0
        ColWidths = (
          64
          64
          64)
      end
    end
    object Panel7: TPanel
      Left = 294
      Top = 0
      Width = 190
      Height = 444
      Align = alRight
      Caption = 'Panel7'
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 1
        Top = 200
        Width = 188
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel2: TPanel
        Left = 1
        Top = 203
        Width = 188
        Height = 240
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 0
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 186
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Caption = #21806#20215#20449#24687
          TabOrder = 0
        end
        object DBGrid3: TDBGrid
          Tag = 1
          Left = 1
          Top = 23
          Width = 186
          Height = 216
          Align = alClient
          DataSource = Data.sHpSjXx
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'MC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SJ'
              Visible = True
            end>
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 188
        Height = 199
        Align = alTop
        Caption = 'Panel2'
        TabOrder = 1
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 186
          Height = 18
          Align = alTop
          BevelOuter = bvNone
          Caption = #23384#36135#20449#24687
          TabOrder = 0
        end
        object DBGrid2: TDBGrid
          Tag = 1
          Left = 1
          Top = 19
          Width = 186
          Height = 179
          Align = alClient
          DataSource = Data.sHpCkXx
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'MC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'JCS'
              Visible = True
            end>
        end
      end
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N3: TMenuItem [8]
        Caption = '-'
      end
      inherited smnSearch: TMenuItem [9]
      end
      inherited smnAll: TMenuItem [10]
      end
      inherited N2: TMenuItem [11]
      end
      object I1: TMenuItem
        Action = aList
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N6: TMenuItem
      Caption = '-'
    end
    object I2: TMenuItem
      Action = aList
    end
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
    object aList: TAction
      Caption = #20854#23427#20449#24687'(&I)'
      Checked = True
      ImageIndex = 23
      ShortCut = 16457
      OnExecute = aListExecute
    end
  end
end
