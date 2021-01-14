object zycsf: Tzycsf
  Left = 172
  Top = 113
  Width = 589
  Height = 411
  BorderIcons = [biSystemMenu]
  Caption = #20303#38498#22788#25910#36153
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel8: TPanel
    Left = 8
    Top = 8
    Width = 569
    Height = 369
    TabOrder = 0
    object Label62: TLabel
      Left = 24
      Top = 24
      Width = 38
      Height = 13
      AutoSize = False
      Caption = #30149#20154'id'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label63: TLabel
      Left = 8
      Top = 64
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #30149#20154#22995#21517
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label64: TLabel
      Left = 24
      Top = 104
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #24212#20132#36153
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label65: TLabel
      Left = 208
      Top = 104
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #23454#20132#36153
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label66: TLabel
      Left = 392
      Top = 104
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #25214#34917
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit30: TDBEdit
      Left = -56
      Top = 216
      Width = 97
      Height = 21
      DataField = #25276#37329
      DataSource = DMzygl.DSbab
      MaxLength = 10
      ReadOnly = True
      TabOrder = 0
      Visible = False
    end
    object DBGrid2: TDBGrid
      Left = 208
      Top = 176
      Width = 345
      Height = 177
      DataSource = DMzygl.DSzysf
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #30149#20154'id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20303#38498#36153
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20132#36153#26102#38388
          Visible = True
        end>
    end
    object Edit1: TEdit
      Left = 72
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 72
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 3
      OnKeyPress = Edit2KeyPress
    end
    object Button9: TButton
      Left = 208
      Top = 20
      Width = 75
      Height = 25
      Caption = #26597#35810
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 208
      Top = 52
      Width = 75
      Height = 25
      Caption = #26597#35810
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button10Click
    end
    object Eyjf: TEdit
      Left = 72
      Top = 96
      Width = 121
      Height = 28
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnKeyPress = EyjfKeyPress
    end
    object Esjf: TEdit
      Left = 264
      Top = 96
      Width = 121
      Height = 28
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnKeyPress = EsjfKeyPress
    end
    object Ezb: TEdit
      Left = 432
      Top = 96
      Width = 121
      Height = 28
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object Button11: TButton
      Left = 104
      Top = 136
      Width = 75
      Height = 25
      Caption = #25552#20132
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = Button11Click
    end
    object BitBtn1: TBitBtn
      Left = 208
      Top = 136
      Width = 73
      Height = 25
      Caption = #25764#28040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = BitBtn1Click
    end
    object DBEdit1: TDBEdit
      Left = -24
      Top = 192
      Width = 65
      Height = 21
      DataField = #30149#20154'id'
      DataSource = DMzygl.DSbab
      TabOrder = 11
      Visible = False
    end
    object DBEdit4: TDBEdit
      Left = -24
      Top = 168
      Width = 65
      Height = 21
      DataField = #22995#21517
      DataSource = DMzygl.DSbab
      TabOrder = 12
      Visible = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = -40
      Top = 144
      Width = 81
      Height = 21
      CalAlignment = dtaLeft
      Date = 37729
      Time = 37729
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 13
      Visible = False
    end
    object REzycsf: TRichEdit
      Left = 8
      Top = 176
      Width = 185
      Height = 177
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '     '#20303#38498#22788#25910#36153#34920
        ' ---------------------'
        '  '#24212#20132#36153'  '#23454#20132#36153'  '#25214#38646)
      ParentFont = False
      TabOrder = 14
    end
    object BitBtn2: TBitBtn
      Left = 312
      Top = 136
      Width = 65
      Height = 25
      Caption = #25171#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      OnClick = BitBtn2Click
    end
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
    Left = 352
    Top = 72
  end
end
