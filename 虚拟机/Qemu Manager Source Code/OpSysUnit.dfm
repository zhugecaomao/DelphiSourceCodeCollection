object Opsys: TOpsys
  Left = 261
  Top = 223
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Operating Systems'
  ClientHeight = 408
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 741
    Height = 29
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = Main.Mil2
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = 'Add New'
      Caption = 'ToolButton1'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Hint = 'Delete Selected'
      Caption = 'ToolButton2'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton4: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 54
      Top = 0
      Hint = 'Edit Selected'
      Caption = 'ToolButton3'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
    object ToolButton5: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 12
      Style = tbsSeparator
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 741
    Height = 379
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Operating Systems'
      object Splitter1: TSplitter
        Left = 209
        Top = 0
        Height = 351
      end
      object Label1: TLabel
        Left = 352
        Top = 128
        Width = 256
        Height = 13
        Caption = 'Please select an operating system to view it'#39's contents'
      end
      object TV: TTntTreeView
        Left = 0
        Top = 0
        Width = 209
        Height = 351
        Align = alLeft
        HideSelection = False
        Images = Main.MIL
        Indent = 19
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        OnClick = TVClick
      end
      object PC2: TPageControl
        Left = 212
        Top = 0
        Width = 521
        Height = 351
        ActivePage = TabSheet2
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 1
        Visible = False
        object TabSheet2: TTabSheet
          Caption = 'Operating Systems'
          object HLV: TTntListView
            Left = 0
            Top = 0
            Width = 513
            Height = 320
            Align = alClient
            Columns = <
              item
                Caption = 'Option'
                Width = 200
              end
              item
                Caption = 'Setting'
                Width = 300
              end>
            ReadOnly = True
            RowSelect = True
            SmallImages = Main.MIL
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
  end
end
