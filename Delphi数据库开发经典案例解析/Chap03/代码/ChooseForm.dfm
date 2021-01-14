object choose: Tchoose
  Left = 281
  Top = 159
  Width = 600
  Height = 500
  Caption = #36873#25321#29289#26009'('#21452#20987#36873#21462#25968#25454')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 0
    Width = 586
    Height = 41
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 98
      Top = 10
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #29289#26009#32534#21495
    end
    object Label2: TLabel
      Left = 250
      Top = 10
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #29289#26009#21517#31216
    end
    object Label3: TLabel
      Left = 410
      Top = 10
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #29289#26009#25340#38899
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 2
      Width = 81
      Height = 33
      Caption = #25628#32034
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880008888
        8000888880808888808088888000788870008888800000000000000000800008
        00000888808000080000080080000000000008888800008000080CCCCCC00CCC
        00888C888880088800888C800800080800888C8888888888C8888CCCCCCCCCCC
        C8888C8CC8CC8CC8C8888CCCCCCCCCCCC8888888888888888888}
      Layout = blGlyphRight
      Spacing = 3
    end
    object Edit1: TEdit
      Left = 154
      Top = 10
      Width = 80
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 1
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 306
      Top = 10
      Width = 80
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 2
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 466
      Top = 10
      Width = 80
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 3
      OnKeyPress = Edit3KeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 40
    Width = 587
    Height = 433
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = #29289#26009#32534#21495
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#26009#21517#31216
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25340#38899#32534#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35745#37327#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35268#26684#22411#21495
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35745#21010#31867#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577#31867#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24402#23646#31867#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20215#20540#31867#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#26009#29305#24615'a'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#26009#29305#24615'b'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#26009#29305#24615'c'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#26009#29305#24615'd'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #38271
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23485
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39640
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20928#37325
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21697#29260
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39068#33394
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31561#32423
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36827#36135#25552#21069#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20934#22791#21608#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29983#20135#21608#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26368#23567#21253#35013#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26368#20302#38144#21806#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25209#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26368#39640#24211#23384
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26368#20302#24211#23384
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24211#23384#26399#38480
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24405#20837#32773
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24405#20837#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20302#23618#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25351#23450#20379#36135#21830
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23450#36135#31574#30053
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29983#20135#36710#38388
        Visible = True
      end>
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    CursorType = ctStatic
    TableName = #29289#26009#20027#25991#20214
    Left = 496
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 464
    Top = 48
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    Parameters = <>
    Left = 528
    Top = 48
  end
end
