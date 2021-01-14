object Cash: TCash
  Left = 231
  Top = 122
  Width = 682
  Height = 520
  Caption = #38376#35786#25910#36153
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 97
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #21010#20215#32534#21495
    end
    object Label2: TLabel
      Left = 72
      Top = 56
      Width = 41
      Height = 17
      AutoSize = False
      Caption = #22995#21517
    end
    object Label3: TLabel
      Left = 240
      Top = 24
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #24320#22987#26102#38388
    end
    object Label4: TLabel
      Left = 240
      Top = 56
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #32467#26463#26102#38388
    end
    object Edit1: TEdit
      Left = 104
      Top = 24
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 104
      Top = 56
      Width = 113
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 304
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      OnDblClick = Edit3DblClick
    end
    object Edit4: TEdit
      Left = 304
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 3
      OnDblClick = Edit4DblClick
    end
    object BitBtn1: TBitBtn
      Left = 464
      Top = 36
      Width = 75
      Height = 25
      Caption = #25628#32034
      Default = True
      ModalResult = 1
      TabOrder = 4
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 673
    Height = 137
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        FieldName = #31185#23460
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21307#29983
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21010#20215#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21010#20215#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21010#20215#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#25910#36153
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25910#36153#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25910#36153#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25346#21495#32534#21495
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 232
    Width = 673
    Height = 145
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 1
    Top = 384
    Width = 673
    Height = 97
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    TabOrder = 3
    object Label5: TLabel
      Left = 56
      Top = 32
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #21512#35745#37329#39069
    end
    object Label6: TLabel
      Left = 200
      Top = 32
      Width = 41
      Height = 17
      AutoSize = False
      Caption = #25910#27454
    end
    object Label7: TLabel
      Left = 320
      Top = 32
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #25214#38646
    end
    object Edit5: TEdit
      Left = 56
      Top = 48
      Width = 113
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 200
      Top = 48
      Width = 89
      Height = 21
      TabOrder = 1
      OnChange = Edit6Change
      OnKeyPress = Edit6KeyPress
    end
    object Edit7: TEdit
      Left = 320
      Top = 48
      Width = 97
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 448
      Top = 44
      Width = 75
      Height = 25
      Caption = #25910#27454
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    OnDataChange = DataSource1DataChange
    Left = 498
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hisbook'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 528
    Top = 8
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select a.* ,b.'#22995#21517',b.'#24615#21035' from '#38376#35786#21010#20215' a, '#38376#35786#25346#21495' b'#13#10'where (a.'#25346#21495#32534#21495'=b.'#32534#21495')an' +
      'd(a.'#26159#21542#25910#36153'='#39#21542#39')'
    Parameters = <>
    Left = 560
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource2DataChange
    Left = 592
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 624
    Top = 8
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 456
    Top = 8
  end
end
