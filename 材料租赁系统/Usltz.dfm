object frmSltz: TfrmSltz
  Left = 305
  Top = 150
  BorderStyle = bsSingle
  Caption = #26448#26009#25968#37327#35843#25972#21333
  ClientHeight = 465
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 38
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object btnAdd: TSpeedButton
      Left = 16
      Top = 0
      Width = 33
      Height = 38
      Caption = #22686#21152
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000015000000140000000100
        040000000000F0000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFF000FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFF000FFFF
        FFFFFFFFFFFFFFFFF000FFFFF00000000000FFFFF000FFFFF0FFFFFFFFF0FFFF
        F000FFFFF0FFFFFFFFF0FFFFF000FFFFF0FFFFFFFFF0FFFFF000FFFFF0FFFFFF
        FFF0FFFFF000FFFFF0FFFFFFFFF0FFFFF000FFFFF0FFFFFFFFF0FFFFF000FFFF
        F0FFFFFFFFF0FFFFF000FFFFF0FFFFFFFFF0FFFFF000FFFFF0FFFFFF0000FFFF
        F000FFFFF0FFFFFF0F0FFFFFF000FFFFF0FFFFFF00FFFFFFF000FFFFF0000000
        0FFFFFFFF000FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFF000FFFF
        FFFFFFFFFFFFFFFFF000}
      Layout = blGlyphTop
      OnClick = btnAddClick
    end
    object btnSave: TSpeedButton
      Left = 120
      Top = 0
      Width = 33
      Height = 38
      Caption = #20445#23384
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
      Layout = blGlyphTop
      OnClick = btnSaveClick
    end
    object btnDele: TSpeedButton
      Left = 168
      Top = 0
      Width = 33
      Height = 38
      Caption = #21024#38500
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F0000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
        FFFFFF99FFFFF9FFC0C0FFFFFFFFFF999FFF9FFFC0C0FFFFFFFFFFF99FF99FFF
        C0C0FF00000000000999FFFFC0C0FF0FFFFFFFFF999FFFFFC0C0FF0F00F00F08
        9999FFFFC0C0FF0FFFFFFFF998899FFFC0C0FF0CCCCCC79CCCCFF9FFC0C0FFFC
        FFFFF97FFFCFFFFFC0C0FFFCF00F00F00FCFFFFFC0C0FFFCFFFFFFFFFFCFFFFF
        C0C0FFFCCCCCCCCCCCCFFFFFC0C0FFFC8CC8CC8CC8CFFFFFC0C0FFFCCCCCCCCC
        CCCFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
        FFFFFFFFFFFFFFFFC0C0}
      Layout = blGlyphTop
      OnClick = btnDeleClick
    end
    object btnClose: TSpeedButton
      Left = 272
      Top = 0
      Width = 33
      Height = 38
      Caption = #20851#38381
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
      Layout = blGlyphTop
      OnClick = btnCloseClick
    end
    object btnEdit: TSpeedButton
      Left = 72
      Top = 0
      Width = 33
      Height = 38
      Caption = #20462#25913
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F0000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
        F0F0F0F0FFFFFFFFC0C0FFFFFFFFFFF00FFFFFFFC0C0FFFFFFFFFFF000FFFFFF
        C0C0FFF000000000B70FFFFFC0C0FFF0FFFFFFF0B80FFFFFC0C0FFF0F00F00F0
        0B70FFFFC0C0FFF0FFFFFFFF0B80FFFFC0C0FFF0CCCCCCCCC0B70FFFC0C0FFFF
        CFFFFFFFF0B00FFFC0C0FFFFCF00F00F000110FFC0C0FFFFCFFFFFFFFF000FFF
        C0C0FFFFCCCCCCCCCCCCFFFFC0C0FFFFC8CC8CC8CC8CFFFFC0C0FFFFCCCCCCCC
        CCCCFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
        FFFFFFFFFFFFFFFFC0C0}
      Layout = blGlyphTop
      OnClick = btnEditClick
    end
    object btnPrint: TSpeedButton
      Left = 216
      Top = 0
      Width = 33
      Height = 38
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
      Layout = blGlyphTop
      OnClick = btnPrintClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 38
    Width = 584
    Height = 121
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 56
      Height = 14
      Caption = #26085'   '#26399':'
    end
    object Label2: TLabel
      Left = 248
      Top = 24
      Width = 56
      Height = 14
      Caption = #37096'   '#38376':'
    end
    object Label3: TLabel
      Left = 24
      Top = 60
      Width = 63
      Height = 14
      Caption = #26448#26009#32534#30721':'
    end
    object SpeedButton1: TSpeedButton
      Left = 178
      Top = 56
      Width = 21
      Height = 22
      Caption = '....'
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 248
      Top = 60
      Width = 63
      Height = 14
      Caption = #26448#26009#21517#31216':'
    end
    object Label5: TLabel
      Left = 24
      Top = 94
      Width = 63
      Height = 14
      Caption = #21333'    '#20301':'
    end
    object Label7: TLabel
      Left = 248
      Top = 92
      Width = 63
      Height = 14
      Caption = #25968'    '#37327':'
    end
    object dtdate: TDBDateTimeEditEh
      Left = 88
      Top = 19
      Width = 121
      Height = 22
      DataField = 'sdate'
      DataSource = DM.DS_CLJXB
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 308
      Top = 20
      Width = 139
      Height = 22
      DataField = 'bmbh'
      DataSource = DM.DS_CLJXB
      EditButtons = <>
      KeyField = 'bmbh'
      ListField = 'bmname'
      ListSource = DM.DS_BMBMK
      TabOrder = 1
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 88
      Top = 56
      Width = 89
      Height = 22
      Hint = #35831#36755#20837#26448#26009#32534#30721#21518#25353#22238#36710#38190'!........'
      DataField = 'spbh'
      DataSource = DM.DS_CLJXB
      EditButtons = <>
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 312
      Top = 57
      Width = 97
      Height = 22
      DataField = 'spmc'
      DataSource = DM.DS_CLJXB
      EditButtons = <>
      Font.Charset = GB2312_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Visible = True
    end
    object DBEditEh4: TDBEditEh
      Left = 88
      Top = 89
      Width = 97
      Height = 22
      DataField = 'jldw'
      DataSource = DM.DS_CLJXB
      EditButtons = <>
      Font.Charset = GB2312_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Visible = True
    end
    object DBEditEh6: TDBEditEh
      Left = 313
      Top = 87
      Width = 97
      Height = 22
      DataField = 'fcsl'
      DataSource = DM.DS_CLJXB
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 446
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 159
    Width = 584
    Height = 287
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 584
      Height = 287
      Align = alClient
      DataSource = DM.DS_CLJXB
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clBlack
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
      ParentFont = False
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'sdate'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -14
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 96
        end
        item
          EditButtons = <>
          FieldName = 'bmbh'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -14
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
        end
        item
          EditButtons = <>
          FieldName = 'spbh'
          Footers = <
            item
              Value = #21512#35745':'
              ValueType = fvtStaticText
            end>
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#21495
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -14
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 105
        end
        item
          EditButtons = <>
          FieldName = 'spmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -14
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 172
        end
        item
          EditButtons = <>
          FieldName = 'jldw'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -14
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'fcsl'
          Footers = <
            item
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -14
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 80
        end>
    end
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = []
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 2.000000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 520
    Top = 46
    BeforeGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C71635C6C616E67323035325C625C66305C667332305C2762645C276164
      5C2763625C2764355C2764355C2766645C2762625C2761615C2762645C276138
      5C2763395C2765385C2762635C2761665C2763645C2763355C2762395C276162
      5C2763625C2762655C62305C66315C66733136200D0A5C706172207D0D0A00}
  end
end
