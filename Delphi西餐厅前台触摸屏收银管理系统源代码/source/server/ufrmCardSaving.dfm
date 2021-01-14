inherited frmCardSaving: TfrmCardSaving
  Left = 357
  Top = 226
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  ActiveControl = eCardId
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20250#21592#20805#20540
  ClientHeight = 217
  ClientWidth = 326
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 20
    Top = 41
    Width = 65
    Height = 13
    Caption = #23458#25143#22995#21517#65306
  end
  object Label7: TLabel [1]
    Left = 20
    Top = 12
    Width = 65
    Height = 13
    Caption = #20250#21592#21345#21495#65306
  end
  object Label1: TLabel [2]
    Left = 20
    Top = 69
    Width = 65
    Height = 13
    Caption = #24403#21069#20313#39069#65306
  end
  object Label3: TLabel [3]
    Left = 20
    Top = 97
    Width = 65
    Height = 13
    Caption = #20805#20540#37329#39069#65306
  end
  object Label4: TLabel [4]
    Left = 33
    Top = 125
    Width = 52
    Height = 13
    Caption = #24635#37329#39069#65306
  end
  object Label5: TLabel [5]
    Left = 20
    Top = 149
    Width = 65
    Height = 13
    Caption = #20805#20540#26041#24335#65306
  end
  inherited bbtnConfirm: TBitBtn
    Left = 148
    Top = 184
    OnClick = bbtnConfirmClick
  end
  inherited bbtnCancel: TBitBtn
    Left = 232
    Top = 184
  end
  object eCardId: TdxEdit [8]
    Left = 92
    Top = 8
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 2
    MaxLength = 10
    StoredValues = 2
  end
  object eCMName: TdxEdit [9]
    Left = 92
    Top = 35
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 4
    ReadOnly = True
    StoredValues = 64
  end
  object bbtnFindCard: TBitBtn [10]
    Left = 216
    Top = 6
    Width = 85
    Height = 22
    Caption = #26597#25214#20250#21592
    TabOrder = 3
    OnClick = bbtnFindCardClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADAADADADADAD00ADAD000000000910000A0FFFF0FF9F10FF0D0FF00009F10F
      FF0A0F0787701088FF0D0078E7F70FFFFF0A008E878F08888F0D00EFE7E80FFF
      FF0A007FF78708888F0D0F07E770FFFFFF0A0F8000088888FF0D0FFFF0FFFFFF
      FF0A444444444444444D444444444444444A444444444444444D}
  end
  object eOldMoney: TdxCurrencyEdit [11]
    Left = 92
    Top = 63
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 5
    ReadOnly = True
    StoredValues = 64
  end
  object eSavingMoney: TdxCurrencyEdit [12]
    Left = 92
    Top = 91
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 6
    OnKeyDown = eSavingMoneyKeyDown
  end
  object eNowMoney: TdxCurrencyEdit [13]
    Left = 92
    Top = 119
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 8
  end
  object eSavingKind: TdxPickEdit [14]
    Left = 92
    Top = 147
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 7
  end
  object MSComm: TMSComm [15]
    Left = 264
    Top = 48
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED03000001568A64000006000000010000040000
      00020000802500000000080000000000000000003F00000001000000}
  end
  inherited ImageList: TImageList
    Top = 340
  end
  object cardinfoq: TCSADOQuery
    ConnectionString = 'FILE NAME=D:\RunXinProject\'#32654#23481#32654#21457'\source\bin\MRong.udl'
    Parameters = <>
    SQL.Strings = (
      'select * from cardinfo')
    Left = 252
    Top = 264
    object cardinfoqcard_id: TStringField
      FieldName = 'card_id'
      Size = 10
    end
    object cardinfoqcm_id: TStringField
      FieldName = 'cm_id'
      Size = 10
    end
    object cardinfoqkind_id: TIntegerField
      FieldName = 'kind_id'
    end
    object cardinfoqcard_money: TBCDField
      FieldName = 'card_money'
      Precision = 19
    end
    object cardinfoqcard_state: TIntegerField
      FieldName = 'card_state'
    end
    object cardinfoqemp_id: TStringField
      FieldName = 'emp_id'
      Size = 10
    end
    object cardinfoqlogin_id: TStringField
      FieldName = 'login_id'
      Size = 10
    end
  end
  object cardinfod: TDataSource
    DataSet = cardinfoq
    Left = 252
    Top = 296
  end
  object SavingCardq: TCSADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from cardsaving')
    Left = 224
    Top = 56
    object SavingCardqcard_id: TStringField
      FieldName = 'card_id'
      Size = 10
    end
    object SavingCardqbefore_money: TBCDField
      FieldName = 'before_money'
      Precision = 19
    end
    object SavingCardqsaving_money: TBCDField
      FieldName = 'saving_money'
      Precision = 19
    end
    object SavingCardqafter_money: TBCDField
      FieldName = 'after_money'
      Precision = 19
    end
    object SavingCardqsaving_kind: TIntegerField
      FieldName = 'saving_kind'
    end
    object SavingCardqsaving_date: TStringField
      FieldName = 'saving_date'
      Size = 10
    end
    object SavingCardqsaving_time: TStringField
      FieldName = 'saving_time'
      Size = 10
    end
    object SavingCardqlogin_id: TStringField
      FieldName = 'login_id'
      Size = 10
    end
  end
end
