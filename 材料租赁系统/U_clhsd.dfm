object frmclhsd: Tfrmclhsd
  Left = 53
  Top = 63
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #26448#26009#22238#25910#21333
  ClientHeight = 514
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = #27743#33487#27491#21326#24314#35774#38598#22242#20844#21496#31199#36161#31449#21608#36716#26448#26009#22238#25910#21333
    Font.Charset = GB2312_CHARSET
    Font.Color = clTeal
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 706
      Top = 8
      Width = 22
      Height = 21
      Hint = #23547#25214#20013#38388#21495#30721'!......'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000074120000741200001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        884488888888888884448888888888884448888884444884448888844FFFF444
        4888884FFFFFFFF48888884FFF44FFF4888884FFFF44FFFF488884FF444444FF
        488884FF444444FF488884FFFF44FFFF4888884FFF44FFF48888884FFFFFFFF4
        888888844FFFF448888888884444448888888888888888888888}
      OnClick = SpeedButton1Click
    end
    object edtCode: TLabeledEdit
      Left = 624
      Top = 8
      Width = 81
      Height = 20
      Hint = #35831#36755#20837#35201#20462#25913#30340#21333#25454#21495#21518#25353#22238#36710#38190'!.......'
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 16776400
      EditLabel.Width = 21
      EditLabel.Height = 14
      EditLabel.Caption = 'NO:'
      EditLabel.Font.Charset = GB2312_CHARSET
      EditLabel.Font.Color = clRed
      EditLabel.Font.Height = -14
      EditLabel.Font.Name = #23435#20307
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = edtCodeKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 741
    Height = 29
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 296
      Top = 8
      Width = 30
      Height = 12
      Caption = #25688#35201':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 3
      Width = 285
      Height = 22
      DataSource = DM.DS_TBTMP
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Flat = True
      Hints.Strings = (
        #31532#19968#26465#35760#24405
        #19978#19968#26465#35760#24405
        #19979#19968#26465#35760#24405
        #26368#21518#19968#26465#35760#24405
        #22686#21152
        #21024#38500
        #20462#25913
        #20445#23384
        #21462#28040
        #21047#26032#35760#24405)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      BeforeAction = DBNavigator1BeforeAction
    end
    object edtZy: TEdit
      Left = 328
      Top = 4
      Width = 405
      Height = 20
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 495
    Width = 741
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 741
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 7
      Top = 9
      Width = 91
      Height = 14
      Caption = #21608#36716#26448#26009#21517#31216':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 344
      Top = 10
      Width = 63
      Height = 14
      Caption = #22238#25910#26085#26399':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 692
      Top = 11
      Width = 42
      Height = 14
      Caption = #39033#30446#37096
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object dtDate: TDateTimePicker
      Left = 408
      Top = 8
      Width = 105
      Height = 20
      BevelOuter = bvNone
      Date = 38065.000000000000000000
      Time = 38065.000000000000000000
      DateFormat = dfLong
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 104
      Top = 8
      Width = 209
      Height = 20
      TabOrder = 3
      Text = 'edtcl'
      Visible = False
    end
    object cmbCl: TComboBox
      Left = 104
      Top = 8
      Width = 217
      Height = 20
      ItemHeight = 12
      TabOrder = 0
      Text = 'cmbCl'
      OnChange = cmbClChange
    end
    object edtbm: TEdit
      Left = 584
      Top = 8
      Width = 97
      Height = 20
      TabOrder = 4
      Text = 'edtbm'
      Visible = False
    end
    object cmbBm: TComboBox
      Left = 584
      Top = 8
      Width = 105
      Height = 20
      ItemHeight = 12
      TabOrder = 2
      Text = 'cmbBm'
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 102
    Width = 741
    Height = 344
    Align = alClient
    BorderStyle = bsNone
    DataSource = DM.DS_TBTMP
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
    SumList.Active = True
    TabOrder = 4
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        Alignment = taCenter
        Color = 16768925
        EditButtons = <>
        FieldName = 'seri'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #32534#21495
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clTeal
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 30
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'Cl_0'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <
          item
            Value = #21512#35745':'
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_1'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_2'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_3'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_4'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_5'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_6'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_7'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_8'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cl_9'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'clTal'
        Footer.ValueType = fvtSum
        Footers = <
          item
            FieldName = 'clTal'
            ValueType = fvtSum
          end>
        Title.Alignment = taCenter
        Title.Caption = #23567#35745
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -14
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 60
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 471
    Width = 741
    Height = 24
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 5
    object btnSave: TSpeedButton
      Left = 344
      Top = 0
      Width = 65
      Height = 24
      Caption = #23384#30424
      Enabled = False
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF5AFFFFF
        0000000000000FFFF5AFFFF08B000000880B0FFF55FAFFF0B800000088080FFF
        55FAFFF08B000000880B0FFFFFFFFFF0B800000000080FFFFFFFFFF08B8B8B8B
        8B8B0FFFFFFFFFF0B800000000B80FFFFFFFFFF080888888880B0FFFFFFFFFF0
        B088888888080FFFFFFFFFF080888888880B0FFFFFFFFFF0B088888888080FFF
        FFFFFFF08088888888000FFFFFFFFFF0B088888888080FFFFFFFFFF000000000
        00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFF0000}
      OnClick = btnSaveClick
    end
    object btnClose: TSpeedButton
      Left = 584
      Top = 0
      Width = 65
      Height = 24
      Caption = #36864#20986
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBD
        BDBFBDBDBFBDBDBFBFBFBFBEBEBF0000BF0000BF0000BF0000BF0000BFBFBFBF
        0000BF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
        BF0000BF0000BF0000BF0000BFBFBFBF0000BF0000000000BFBFBFBFBFBFBFBF
        BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
        BFBFBF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
        BE6E6EBE6E6EBE6E6EBF0000BFBFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBF
        BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
        BFBFBF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
        BE6E6EBE6E6EBE6E6EBF0000BFBFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBF
        BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
        BFBFBF0000BFBFBFBFBFBF0000FFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
        BE6E6EBE6E6EBE6E6EBF0000BFBFBFBFBFBFBFBFBFBFBFBF0000FF0000FFBFBF
        BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
        BFBFBFBFBF0000FF0000FF0000FF0000FF0000FFBFBFBFBFBDBDBFBEBEBF0000
        BE6E6EBE6E6EBF0000BF0000BFBFBFBFBFBFBFBFBFBFBFBF0000FF0000FFBFBF
        BF0000FFBFBFBFBFBDBDBFBEBEBF0000BE6E6EBF0000BF0000BFBFBFBFBFBFBF
        BFBFBF0000BFBFBFBFBFBF0000FFBFBFBFBFBFBF0000FFBFBDBDBFBEBEBF0000
        BF0000BF0000BFBFBFBFBFBFBFBFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBF
        BFBFBFBF0000FFBFBDBDBFBEBEBF0000BF0000BFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBEBEBF0000
        BF0000BF0000BF0000BF0000BF0000BF0000BF0000000000BFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBDBDBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBDBDBFBDBDBFBDBD}
      OnClick = btnCloseClick
    end
    object SpeedButton2: TSpeedButton
      Left = 503
      Top = 1
      Width = 54
      Height = 22
      Caption = #25171#21360
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFF2000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        00000000000FFFFFFF00FFF0777777777070FFFFFFFFFF000000000000070FFF
        FF00FF07777777FFF77070FFFFFFFF0777777700077000FF0000FF0777777777
        777070FF4E04FF00000000000000770F4D00FFF0777777777708070F1400FFFF
        000000000070800F9001FFFFF0FFFFFFF077080F1000FFFFFF0F0000FF0000FF
        FFFFFFFFFF0FFFFFFF0FFFFFFFFFFFFFFFF0F0000FF0FFFFFFFFFFFFFFF0FFFF
        FFF0FFFFFFFFFFFFFFFF00000000FFFF0000FFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton2Click
    end
    object lblTotal: TLabeledEdit
      Left = 40
      Top = 2
      Width = 94
      Height = 19
      AutoSize = False
      BevelOuter = bvNone
      BorderStyle = bsNone
      EditLabel.Width = 30
      EditLabel.Height = 12
      EditLabel.Caption = #21512#35745':'
      EditLabel.Font.Charset = GB2312_CHARSET
      EditLabel.Font.Color = clRed
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = #23435#20307
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '0.00'
    end
    object lblHtotal: TLabeledEdit
      Left = 198
      Top = 1
      Width = 81
      Height = 20
      BorderStyle = bsNone
      EditLabel.Width = 54
      EditLabel.Height = 12
      EditLabel.Caption = #25442#31639#21512#35745':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pShwomessage: TPanel
    Left = 248
    Top = 232
    Width = 241
    Height = 41
    BevelInner = bvLowered
    Caption = #27491#22312#20445#23384#25968#25454#65292#35831#31245#20505#65281'......'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object Panel5: TPanel
    Left = 0
    Top = 446
    Width = 741
    Height = 25
    Align = alBottom
    AutoSize = True
    BevelInner = bvLowered
    TabOrder = 7
    object edtFhr: TLabeledEdit
      Left = 88
      Top = 2
      Width = 121
      Height = 20
      EditLabel.Width = 78
      EditLabel.Height = 12
      EditLabel.Caption = #31199#36161#31449#25910#36135#20154':'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object edtJzr: TLabeledEdit
      Left = 310
      Top = 2
      Width = 121
      Height = 20
      EditLabel.Width = 42
      EditLabel.Height = 12
      EditLabel.Caption = #35760#24080#20154':'
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object edtJsr: TLabeledEdit
      Left = 548
      Top = 3
      Width = 121
      Height = 20
      EditLabel.Width = 78
      EditLabel.Height = 12
      EditLabel.Caption = #39033#30446#37096#32463#25163#20154':'
      LabelPosition = lpLeft
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 56
    Top = 129
    Width = 601
    Height = 297
    Caption = #35831#36755#20837#35268#26684#22411#21495':'#38271#12289#23485#12289#25968#37327
    Color = 16776400
    ParentColor = False
    TabOrder = 8
    Visible = False
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 14
      Width = 597
      Height = 281
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = DM.DS_GGXHB
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
      ParentFont = False
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyPress = DBGridEh2KeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'long'
          Footers = <
            item
              Value = #21512#35745':'
              ValueType = fvtStaticText
            end>
          Title.Alignment = taCenter
          Title.Caption = #38271
          Title.Color = 16777088
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'weith'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23485
          Title.Color = 16777088
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'number'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Title.Color = 16777088
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'total'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24179#26041#31859
          Title.Color = 16777088
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'bz'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Title.Color = 16777088
          Width = 100
        end>
    end
  end
  object qytmp: TADOQuery
    Connection = frmMain.ADOConnect
    Parameters = <>
    Left = 680
    Top = 128
  end
  object DBSumList1: TDBSumList
    Active = False
    DataSet = DM.ADO_TBTMP
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'clTal'
        GroupOperation = goSum
      end
      item
        GroupOperation = goCount
      end
      item
        GroupOperation = goAvg
      end>
    VirtualRecords = False
    SumListChanged = DBSumList1SumListChanged
    Left = 16
    Top = 8
  end
  object DBSumList2: TDBSumList
    Active = False
    DataSet = DM.ADO_GGXHB
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'total'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    SumListChanged = DBSumList2SumListChanged
    Left = 672
    Top = 464
  end
  object ADOQuery1: TADOQuery
    Connection = frmMain.ADOConnect
    Parameters = <>
    Left = 640
    Top = 201
  end
end
