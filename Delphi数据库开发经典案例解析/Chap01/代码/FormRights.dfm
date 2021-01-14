object rights: Trights
  Left = 62
  Top = 20
  Width = 570
  Height = 414
  Caption = #26435#38480#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 8
    Width = 481
    Height = 169
    Caption = #29992#25143#26435#38480#27983#35272
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 24
      Width = 165
      Height = 13
      Caption = #36873#25321#35201#27983#35272#26435#38480#30340#29992#25143#21517'           '
    end
    object Label2: TLabel
      Left = 280
      Top = 24
      Width = 135
      Height = 13
      Caption = #35813#29992#25143#25152#25317#26377#30340#26435#38480'         '
    end
    object ListBox1: TListBox
      Left = 280
      Top = 48
      Width = 121
      Height = 113
      ItemHeight = 13
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 88
      Top = 48
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 192
    Width = 481
    Height = 153
    Caption = #29992#25143#26435#38480#20462#25913
    TabOrder = 1
    object Panel1: TPanel
      Left = 24
      Top = 16
      Width = 257
      Height = 121
      BorderStyle = bsSingle
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 16
        Top = 8
        Width = 105
        Height = 17
        Caption = #21830#21697#36164#26009#32500#25252
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 32
        Width = 113
        Height = 17
        Caption = #20379#36135#21830#36164#26009#32500#25252
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 56
        Width = 97
        Height = 17
        Caption = #23458#25143#36164#26009#32500#25252' '
        TabOrder = 2
      end
      object CheckBox4: TCheckBox
        Left = 16
        Top = 80
        Width = 97
        Height = 17
        Caption = #36827#36135#21333
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Left = 144
        Top = 8
        Width = 97
        Height = 17
        Caption = #38144#21806#21333
        TabOrder = 4
      end
      object CheckBox6: TCheckBox
        Left = 144
        Top = 32
        Width = 97
        Height = 17
        Caption = #24211#23384#26597#35810
        TabOrder = 5
      end
      object CheckBox7: TCheckBox
        Left = 144
        Top = 56
        Width = 97
        Height = 17
        Caption = #26435#38480#31649#29702
        TabOrder = 6
      end
    end
    object Button1: TButton
      Left = 336
      Top = 24
      Width = 75
      Height = 25
      Caption = #30830#35748#20462#25913
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '#22995#21517' from '#29992#25143#28165#21333)
    Left = 48
    Top = 88
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    Parameters = <>
    Left = 80
    Top = 88
  end
  object ADOQuery3: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    Parameters = <>
    Left = 464
    Top = 216
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    Parameters = <>
    Left = 464
    Top = 240
  end
end
