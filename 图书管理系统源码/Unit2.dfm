object Form2: TForm2
  Left = 210
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form2'
  ClientHeight = 356
  ClientWidth = 497
  Color = clAqua
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 96
    Height = 13
    Caption = #35831#36755#20837#29992#25143#21517#65306'    '
  end
  object Label3: TLabel
    Left = 48
    Top = 160
    Width = 60
    Height = 29
    Caption = #37325'  '
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 48
    Top = 187
    Width = 60
    Height = 29
    Caption = #32622'  '
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 48
    Top = 214
    Width = 60
    Height = 29
    Caption = #29992'  '
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 48
    Top = 241
    Width = 60
    Height = 29
    Caption = #25143'  '
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 48
    Top = 268
    Width = 60
    Height = 29
    Caption = #26435'  '
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 48
    Top = 296
    Width = 60
    Height = 29
    Caption = #38480'  '
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 144
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object DBGrid1: TDBGrid
    Left = 144
    Top = 48
    Width = 337
    Height = 233
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = #30331#38470#29992#25143#21517
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #21592#24037#22995#21517
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #21592#24037#24615#21035
        Visible = True
      end>
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 56
    Width = 97
    Height = 17
    Caption = #26597#30475#26435#38480
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 32
    Top = 80
    Width = 97
    Height = 17
    Caption = #28155#21152#26435#38480
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 32
    Top = 104
    Width = 97
    Height = 17
    Caption = #26356#26032#26435#38480
    TabOrder = 4
  end
  object CheckBox4: TCheckBox
    Left = 32
    Top = 128
    Width = 97
    Height = 17
    Caption = #21024#38500#26435#38480
    TabOrder = 5
  end
  object Button1: TButton
    Left = 400
    Top = 296
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 296
    Width = 75
    Height = 25
    Caption = #24212#29992#35774#32622
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 12
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 8
    OnClick = Button3Click
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    Active = True
    ControlUseTrueXPStyle = True
    BtnRoundArc = 5
    BtnOutLineBorderColor = 7552000
    BtnInnerBorderMoveColor = 3257087
    BtnInnerBorderFocusColor = 15183500
    BtnSurfaceNormalColor = 16251903
    BtnSurfaceDownColor = 14608359
    BtnSurfaceBottomLineColor = 14608359
    BtnSurfaceDownBottomLineColor = 15199215
    RdoChkControlChkColor = 41472
    ComboBoxChkColor = 9201994
    ComboboxSurfaceMoveColor = 16771030
    ControlDisabledBorderColor = 11913158
    Left = 224
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 264
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 192
    Top = 16
  end
end
