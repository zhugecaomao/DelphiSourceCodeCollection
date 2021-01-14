object PriceConfirm: TPriceConfirm
  Left = 173
  Top = 76
  Width = 696
  Height = 525
  Caption = #38376#35786#21010#20215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000999
    9999999999999999999999999990099999999999999999999999999999900999
    9999999999FFFF9999999999999009999999999999FFFF999999999999900999
    9999999999FFFF9999999999999009999999999999FFFF999999999999900999
    9999999999FFFF99999999999990099999999FFFFFFFFFFFFFF9999999900999
    99999FFFFFFFFFFFFFF999999990099999999FFFFFFFFFFFFFF9999999900999
    99999FFFFFFFFFFFFFF99999999009999999999999FFFF999999999999900999
    9999999999FFFF9999999999999009999999999999FFFF999999999999900999
    9999999999FFFF9999999999999009999999999999FFFF999999999999900999
    9999999999999999999999999990099999999999999999999999999999900000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    0000000000000000000000000000099999999999999009999999999999900999
    999FF99999900999999FF999999009999FFFFFF9999009999FFFFFF999900999
    999FF99999900999999FF9999990099999999999999000000000000000000000
    00000000000000000000000000000000000000000000FFFF0000FFFF00000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000FFFF0000FFFF0000FFFF0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 8
    Width = 681
    Height = 97
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 32
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #38376#35786#21495
    end
    object Label2: TLabel
      Left = 264
      Top = 32
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #22995#21517
    end
    object Label3: TLabel
      Left = 440
      Top = 32
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #24615#21035
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 48
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnDropDown = ComboBox1DropDown
    end
    object Edit1: TEdit
      Left = 264
      Top = 48
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 440
      Top = 48
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object StringGrid1: TStringGrid
    Left = 1
    Top = 108
    Width = 681
    Height = 305
    ColCount = 7
    FixedCols = 0
    RowCount = 50
    TabOrder = 1
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
  end
  object Panel2: TPanel
    Left = 1
    Top = 414
    Width = 681
    Height = 81
    BorderStyle = bsSingle
    TabOrder = 2
    object Label4: TLabel
      Left = 216
      Top = 24
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #21307#29983
    end
    object Label5: TLabel
      Left = 80
      Top = 24
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #31185#23460
    end
    object Label6: TLabel
      Left = 352
      Top = 24
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #37329#39069#21512#35745
    end
    object Edit3: TEdit
      Left = 80
      Top = 40
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 216
      Top = 40
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object Edit5: TEdit
      Left = 352
      Top = 40
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 497
      Top = 36
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 3
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000000000000880EE000000880E0880EE000000880E0880EE00000088
        0E0880EE000000000E0880EEEEEEEEEEEE0880EE00000000EE0880E088888888
        0E0880E0888888880E0880E0888888880E0880E0888888880E0880E088888888
        000880E088888888080880000000000000088888888888888888}
    end
    object BitBtn2: TBitBtn
      Left = 585
      Top = 36
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 4
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888748888844444888884788884444888888848888444888888
        8848888448488888884888848884488884788888888884444788888888888888
        8888888888888888888888888888888888888888888888888888}
    end
  end
  object DBGrid1: TDBGrid
    Left = 85
    Top = 80
    Width = 401
    Height = 145
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = #32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24615#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25346#21495#31185#23460
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36153#29992#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25346#21495#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25346#21495#36153#29992
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21307#29983
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#24050#21010#20215
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 72
    Top = 256
    Width = 393
    Height = 120
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Expanded = False
        FieldName = #32534#21495
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21517#31216
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35268#26684
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20301
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20215
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25340#38899#30721
        Visible = True
      end>
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 528
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 592
    Top = 112
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hisbook'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 624
    Top = 112
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = #26159#21542#24050#21010#20215'='#39#21542#39
    Filtered = True
    TableName = #38376#35786#25346#21495
    Left = 562
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    OnDataChange = DataSource1DataChange
    Left = 490
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet1
    Left = 490
    Top = 144
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from v'#25910#36153#39033#30446#21450#33647#21697
    Parameters = <>
    Left = 528
    Top = 144
  end
end
