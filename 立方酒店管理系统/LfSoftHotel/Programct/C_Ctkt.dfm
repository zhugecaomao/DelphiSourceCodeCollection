object CtktForm: TCtktForm
  Left = 237
  Top = 194
  Width = 330
  Height = 340
  ActiveControl = DBEdit1
  Caption = #24320#21488
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 31
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object lblTitle: TLabel
      Left = 120
      Top = 5
      Width = 93
      Height = 21
      Caption = #39184#21381#24320#21488
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 322
    Height = 247
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object Label7: TLabel
      Left = 192
      Top = 216
      Width = 12
      Height = 12
      Caption = #20803
      Visible = False
    end
    object Label5: TLabel
      Left = 96
      Top = 216
      Width = 12
      Height = 12
      Caption = #20154
      Visible = False
    end
    object Bevel1: TBevel
      Left = 5
      Top = 5
      Width = 312
      Height = 237
      Align = alClient
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 180
      Top = 80
      Width = 48
      Height = 12
      Caption = #23458#20154#20154#25968
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 120
      Width = 48
      Height = 12
      Caption = #23458#20154#22995#21517
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 48
      Height = 12
      Caption = #29992#39184#26102#38388
    end
    object Label4: TLabel
      Left = 16
      Top = 15
      Width = 48
      Height = 12
      Caption = #39184#21381#21488#21495
    end
    object Label6: TLabel
      Left = 97
      Top = 215
      Width = 30
      Height = 12
      Caption = #20803'/'#26700
      Visible = False
    end
    object Edit3: TEdit
      Left = 112
      Top = 208
      Width = 75
      Height = 20
      TabOrder = 7
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 16
      Top = 208
      Width = 75
      Height = 20
      TabOrder = 6
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
    object DBEdit1: TDBEdit
      Left = 180
      Top = 96
      Width = 124
      Height = 20
      DataField = 'D_KRSL'
      DataSource = dsCtdc
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 136
      Width = 289
      Height = 20
      DataField = 'D_KRXM'
      DataSource = dsCtdc
      TabOrder = 3
    end
    object DBComboBox1: TDBComboBox
      Left = 16
      Top = 96
      Width = 161
      Height = 20
      Style = csDropDownList
      DataField = 'D_SJDM'
      DataSource = dsCtdc
      ItemHeight = 12
      Items.Strings = (
        #26089#19978
        #20013#21320
        #26202#19978)
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 16
      Top = 208
      Width = 75
      Height = 20
      TabOrder = 5
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
    object lstCtmc: TListBox
      Left = 16
      Top = 30
      Width = 289
      Height = 44
      ItemHeight = 12
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 168
      Width = 289
      Height = 33
      Caption = ' '#29992' '#39184' '#26631' '#20934' '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #28857#33756
        #20803'/'#26700
        #20803'/'#20154)
      TabOrder = 4
      OnClick = RadioGroup1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 278
    Width = 322
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      322
      35)
    object btnOK: TBitBtn
      Left = 162
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCanc: TBitBtn
      Left = 242
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object tblCtdc: TTable
    BeforePost = tblCtdcBeforePost
    OnNewRecord = tblCtdcNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDC'
    Left = 40
    Top = 8
    object tblCtdcD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Required = True
      Size = 12
    end
    object tblCtdcD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblCtdcD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Required = True
      Size = 5
    end
    object tblCtdcD_DCLB: TStringField
      FieldName = 'D_DCLB'
      FixedChar = True
      Size = 1
    end
    object tblCtdcD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblCtdcD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblCtdcD_SJDM: TStringField
      FieldName = 'D_SJDM'
      FixedChar = True
      Size = 4
    end
    object tblCtdcD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblCtdcD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Size = 30
    end
    object tblCtdcD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblCtdcD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblCtdcD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Size = 10
    end
    object tblCtdcD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblCtdcD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblCtdcD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblCtdcD_YHJE: TFloatField
      FieldName = 'D_YHJE'
    end
    object tblCtdcD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblCtdcD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Size = 12
    end
    object tblCtdcD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object dsCtdc: TDataSource
    DataSet = tblCtdc
    Left = 72
    Top = 8
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 8
    Top = 8
  end
end
