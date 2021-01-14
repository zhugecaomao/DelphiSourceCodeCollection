object frmGgxh: TfrmGgxh
  Left = 296
  Top = 196
  Width = 389
  Height = 321
  BorderIcons = []
  Caption = #35268#26684#22411#21495#35745#31639
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object btnOk: TBitBtn
    Left = 80
    Top = 294
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 6
    TabOrder = 0
    Visible = False
    OnClick = btnOkClick
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
  object btnCancel: TBitBtn
    Left = 270
    Top = 264
    Width = 61
    Height = 25
    Caption = #20851#38381
    TabOrder = 1
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 369
    Height = 249
    Caption = #35831#36755#20837#35268#26684#22411#21495':'#38271#12289#23485#12289#25968#37327
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 14
      Width = 365
      Height = 233
      Align = alClient
      BorderStyle = bsNone
      DataSource = DM.DS_GGXHB
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
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
          Width = 60
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
          Width = 60
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
  object edtTotal: TEdit
    Left = 16
    Top = 296
    Width = 57
    Height = 20
    TabOrder = 3
    Visible = False
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 264
    Width = 230
    Height = 25
    DataSource = DM.DS_GGXHB
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
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
    TabOrder = 4
    BeforeAction = DBNavigator1BeforeAction
  end
  object DBSumList1: TDBSumList
    Active = False
    DataSet = DM.ADO_GGXHB
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'total'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    SumListChanged = DBSumList1SumListChanged
    Left = 8
    Top = 248
  end
end
