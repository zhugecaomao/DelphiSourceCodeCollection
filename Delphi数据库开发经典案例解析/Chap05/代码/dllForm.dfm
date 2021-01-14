object dllSec: TdllSec
  Left = 162
  Top = 153
  Width = 696
  Height = 480
  Caption = #36873#25321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 72
    Width = 681
    Height = 377
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = #20070#21517
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20316#32773
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26465#24418#30721
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32534#21495
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35793#32773
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISBN'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#29256#31038
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39029#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20070#26550#21517#31216
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29616#23384#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24211#23384#24635#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#26102#38388
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25805#20316#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31616#20171
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20511#20986#27425#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#27880#38144
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 2
    Width = 681
    Height = 65
    BorderStyle = bsSingle
    TabOrder = 1
    object Label4: TLabel
      Left = 262
      Top = 23
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #20316#32773
      Transparent = True
    end
    object Label3: TLabel
      Left = 102
      Top = 23
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #20070#21517
    end
    object Label5: TLabel
      Left = 406
      Top = 23
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #31867#22411
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #25628#32034
      Default = True
      ModalResult = 1
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
    end
    object Edit1: TEdit
      Left = 163
      Top = 20
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 315
      Top = 20
      Width = 81
      Height = 21
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 459
      Top = 20
      Width = 81
      Height = 21
      TabOrder = 3
    end
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    CursorType = ctStatic
    TableName = #22270#20070#20449#24687
    Left = 616
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 552
    Top = 16
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    Parameters = <>
    Left = 584
    Top = 18
  end
end
