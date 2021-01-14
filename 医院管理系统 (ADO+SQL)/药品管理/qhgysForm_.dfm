object Formqhgys: TFormqhgys
  Left = 150
  Top = 131
  Width = 544
  Height = 287
  Caption = #27424#36135#20379#24212#21830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 536
    Height = 260
    Align = alClient
    Caption = #27424#36135#20379#24212#21830
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 136
      Width = 24
      Height = 13
      Caption = 'aaaa'
      Color = clBlack
      ParentColor = False
    end
    object DBNavigator3: TDBNavigator
      Left = 64
      Top = 24
      Width = 225
      Height = 25
      DataSource = DMypgl.DSqhgys
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Flat = True
      TabOrder = 0
    end
    object DBGrid4: TDBGrid
      Left = 2
      Top = 56
      Width = 532
      Height = 202
      Align = alBottom
      DataSource = DMypgl.DSqhgys
      FixedColor = clMenu
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object BitBtn_qhgys_print: TBitBtn
      Left = 328
      Top = 24
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 2
      OnClick = BitBtn_qhgys_printClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 136
      Width = 89
      Height = 21
      DataField = #37038#32534
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 3
      Visible = False
    end
    object DBEdit2: TDBEdit
      Left = 232
      Top = 136
      Width = 89
      Height = 21
      BevelInner = bvLowered
      DataField = #22269#23478
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      Visible = False
    end
    object DBEdit3: TDBEdit
      Left = 416
      Top = 136
      Width = 89
      Height = 21
      BevelInner = bvLowered
      DataField = #22320#21306
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      Visible = False
    end
    object DBEdit4: TDBEdit
      Left = 72
      Top = 168
      Width = 89
      Height = 21
      BevelInner = bvLowered
      DataField = #22478#24066
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      Visible = False
    end
    object DBEdit5: TDBEdit
      Left = 232
      Top = 168
      Width = 89
      Height = 21
      BevelInner = bvLowered
      DataField = #22320#22336
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      Visible = False
    end
    object DBEdit6: TDBEdit
      Left = 72
      Top = 200
      Width = 89
      Height = 21
      BevelInner = bvLowered
      DataField = #32852#31995#20154#22995#21517
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 8
      Visible = False
    end
    object DBEdit7: TDBEdit
      Left = 232
      Top = 200
      Width = 121
      Height = 21
      BevelInner = bvLowered
      DataField = #33647#21697#21517#31216
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 432
      Top = 24
      Width = 75
      Height = 25
      Caption = #20652#36135
      TabOrder = 10
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
        77F07F773FF3333F77370FFF77FFFF77FFF07F33773FFF7733370FFFFF0000FF
        FFF07F333F77773FF3F70FFF70EEEE07F9F07F3F7733337737F70F707FFFFFF7
        97F07F7733333FFF7737007EEEE3000EE70977FFFFFF777FFF37077777307080
        77907777777737377773307EE307088809033773FF7F7FF37733337030070088
        07333337777F77377FFF33337008080809993333377F7F737777333330080088
        03333333377F77337FF333333308088809333333337373F3773F333333308080
        33933333333737F7337333333333000333393333333377733337}
      NumGlyphs = 2
    end
    object DBEdit8: TDBEdit
      Left = 416
      Top = 168
      Width = 89
      Height = 21
      BevelInner = bvLowered
      DataField = #20379#24212#21830#21517#31216
      DataSource = DMypgl.DSqhgys
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 11
      Visible = False
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
    Left = 416
    Top = 16
  end
end
