object QemuVers: TQemuVers
  Left = 242
  Top = 186
  BorderStyle = bsDialog
  Caption = 'Qemu Version Control'
  ClientHeight = 410
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 777
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
    Width = 777
    Height = 381
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Qemu Version Control'
      object Splitter1: TSplitter
        Left = 241
        Top = 0
        Height = 353
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
        Width = 241
        Height = 353
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
        Left = 244
        Top = 0
        Width = 525
        Height = 353
        ActivePage = TabSheet2
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 1
        Visible = False
        object TabSheet2: TTabSheet
          Caption = 'Qemu Version Control'
          object HLV: TTntListView
            Left = 0
            Top = 0
            Width = 517
            Height = 322
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
