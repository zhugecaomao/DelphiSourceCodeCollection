object Score: TScore
  Left = 186
  Top = 102
  Width = 748
  Height = 545
  Caption = #25104#32489#36755#20837
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 737
    Height = 73
    Caption = #32467#26463#36873#35838#65292#29983#25104#31354#25104#32489#21333
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 224
      Top = 32
      Width = 201
      Height = 25
      Caption = #20013#27490#36873#35838#65292#29983#25104#31354#25104#32489#21333
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkNo
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 80
    Width = 737
    Height = 97
    Caption = #36873#25321#35838#31243
    TabOrder = 1
    object Label4: TLabel
      Left = 38
      Top = 25
      Width = 59
      Height = 13
      AutoSize = False
      Caption = #35838#31243#25340#38899
    end
    object Label5: TLabel
      Left = 38
      Top = 57
      Width = 59
      Height = 13
      AutoSize = False
      Caption = #35838#31243#21517#31216
    end
    object Label6: TLabel
      Left = 198
      Top = 25
      Width = 59
      Height = 13
      AutoSize = False
      Caption = #35838#31243#32534#21495
    end
    object Label1: TLabel
      Left = 416
      Top = 16
      Width = 313
      Height = 73
      AutoSize = False
      Caption = 
        #36873#25321#19968#38376#35838#65292#21015#20986#36873#35813#35838#30340#25152#26377#23398#29983#21517#21333#65292#25945#24072#23545#21508#20010#23398#29983#30340#25104#32489#36755#20837#65292#24182#20445#23384#65292#26368#32456#25552#20132#20043#21069#36824#21487#20197#20462#25913#12290#26368#32456#25552#20132#26159#25351#32769#24072#25552#20132#35813#38376#35838#25152#26377#23398 +
        #29983#30340#26368#32456#25104#32489#65292#25552#20132#21518#30340#25104#32489#19981#21487#20462#25913#65292#35838#31243#25340#38899#21644#21517#31216#26159#27169#31946#26597#35810#65292#35838#31243#32534#21495#24517#39035#36755#20837#20934#30830#65292#23454#38469#20013#30001#25945#24072#30331#24405#26102#30340#21517#31216#26597#35810#24471#21040#65292#19981#24517#25163#24037#36755 +
        #20837
      WordWrap = True
    end
    object Edit3: TEdit
      Left = 96
      Top = 53
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 256
      Top = 21
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 96
      Top = 21
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 48
      Width = 89
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888808888888888888800088888888888800088888888888800
        0888888800000000888888800BBB000888888800BBBBB0088888880BBBBBBB08
        8888880BBB0BBB088888880BB080BB0888888800BB0BB008888888800BBB0088
        8888888800000888888888888888888888888888888888888888}
    end
    object BitBtn3: TBitBtn
      Left = 312
      Top = 48
      Width = 89
      Height = 25
      Caption = #26368#32456#25552#20132
      TabOrder = 4
      OnClick = BitBtn3Click
      Kind = bkIgnore
    end
  end
  object GroupBox3: TGroupBox
    Left = 3
    Top = 176
    Width = 737
    Height = 337
    Caption = #35838#31243#25104#32489#36755#20837
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 537
      Height = 313
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
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
          FieldName = #35838#31243#21517#31216
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23398#21495
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22995#21517
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25104#32489
          Visible = True
        end>
    end
    object Edit4: TEdit
      Left = 576
      Top = 117
      Width = 105
      Height = 21
      TabOrder = 1
      OnKeyPress = Edit4KeyPress
    end
    object BitBtn4: TBitBtn
      Left = 584
      Top = 152
      Width = 97
      Height = 25
      Caption = #20462#25913#25104#32489
      TabOrder = 2
      OnClick = BitBtn4Click
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
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 496
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 424
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 456
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=eisbook'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 536
    Top = 8
  end
end
