object CourseElect: TCourseElect
  Left = 219
  Top = 103
  Width = 709
  Height = 559
  Caption = #23398#29983#36873#35838
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
    Width = 697
    Height = 81
    Caption = #23398#29983#20449#24687#65288#36755#20837#23398#21495#21518#22238#36710#65289
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 40
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #23398#21495
    end
    object Label2: TLabel
      Left = 232
      Top = 40
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #22995#21517
    end
    object Label3: TLabel
      Left = 416
      Top = 40
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #29677#32423
    end
    object Edit1: TEdit
      Left = 79
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 263
      Top = 37
      Width = 106
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 447
      Top = 37
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 87
    Width = 697
    Height = 202
    Caption = #24050#36873#35838#31243
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 681
      Height = 177
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
          FieldName = #23398#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35838#24207#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35838#31243#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25945#24072
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24320#35838#31995#21035
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#35838#26102#38388#22825
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#35838#26102#38388#33410
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#35838#22320#28857
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 2
    Top = 295
    Width = 697
    Height = 234
    Caption = #35838#31243#20449#24687
    TabOrder = 2
    object Panel1: TPanel
      Left = 8
      Top = 16
      Width = 681
      Height = 73
      BorderStyle = bsSingle
      TabOrder = 0
      object Label4: TLabel
        Left = 14
        Top = 17
        Width = 59
        Height = 13
        AutoSize = False
        Caption = #35838#31243#25340#38899
      end
      object Label5: TLabel
        Left = 14
        Top = 49
        Width = 59
        Height = 13
        AutoSize = False
        Caption = #35838#31243#21517#31216
      end
      object Label6: TLabel
        Left = 174
        Top = 17
        Width = 59
        Height = 13
        AutoSize = False
        Caption = #35838#31243#32534#21495
      end
      object Label7: TLabel
        Left = 182
        Top = 49
        Width = 59
        Height = 13
        AutoSize = False
        Caption = #35838#24207#21495
      end
      object Edit4: TEdit
        Left = 72
        Top = 13
        Width = 89
        Height = 21
        TabOrder = 0
      end
      object Edit5: TEdit
        Left = 72
        Top = 45
        Width = 105
        Height = 21
        TabOrder = 1
      end
      object Edit6: TEdit
        Left = 232
        Top = 13
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object Edit7: TEdit
        Left = 232
        Top = 45
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object BitBtn1: TBitBtn
        Left = 400
        Top = 8
        Width = 75
        Height = 25
        Caption = #26597#35810
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
      object BitBtn2: TBitBtn
        Left = 496
        Top = 8
        Width = 75
        Height = 25
        Caption = #36873#35838
        Enabled = False
        TabOrder = 5
        OnClick = BitBtn2Click
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
      object BitBtn3: TBitBtn
        Left = 400
        Top = 40
        Width = 75
        Height = 25
        Caption = #21024#35838
        Enabled = False
        TabOrder = 6
        OnClick = BitBtn3Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888881F88881F8888888888888991F8888889F8888191F88888
          1F888888199F88891F8888888191F819F88888888819199F88888888888919F8
          888888888891911F888888888191F89F88888889191F88819F88881919F88888
          19F88891F8888888819F88888888888888888888888888888888}
      end
      object BitBtn4: TBitBtn
        Left = 496
        Top = 40
        Width = 75
        Height = 25
        Caption = #30475#35838#34920
        Enabled = False
        TabOrder = 7
        OnClick = BitBtn4Click
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
    end
    object DBGrid2: TDBGrid
      Left = 8
      Top = 96
      Width = 681
      Height = 128
      DataSource = DataSource2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #35838#24207#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35838#31243#32534#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35838#31243#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25945#24072
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24320#35838#31995#21035
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25340#38899#30721
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#35838#26102#38388#22825
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#35838#26102#38388#33410
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#35838#22320#28857
          Visible = True
        end>
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 368
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=eisbook;Use Procedure for Prepare=1;Aut' +
      'o Translate=True;Packet Size=4096;Workstation ID=ME109;Use Encry' +
      'ption for Data=False;Tag with column collation when possible=Fal' +
      'se'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 640
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 456
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.'#23398#21495',b.'#35838#31243#32534#21495',b.'#35838#31243#21517#31216',b.'#25945#24072',b.'#24320#35838#31995#21035',c.'#19978#35838#26102#38388#22825',c.'#19978#35838#26102#38388#33410',c.'#19978#35838#22320#28857
      'from '#36873#35838#34920' a,'#35838#31243#20449#24687' b,'#35838#31243#34920' c'
      
        'where (a.'#23398#21495'='#39'20021340000002'#39')and(a.'#35838#24207#21495'=c.'#35838#24207#21495')and('#39'200400000'#39'+b.'#35838 +
        #31243#32534#21495'=a.'#35838#24207#21495')')
    Left = 424
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery3
    Left = 536
    Top = 8
  end
  object ADOQuery3: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.'#35838#24207#21495',a.'#35838#31243#32534#21495',b.'#35838#31243#21517#31216',b.'#25945#24072',b.'#24320#35838#31995#21035',b.'#25340#38899#30721',a.'#19978#35838#26102#38388#22825',a.'#19978#35838#26102#38388#33410',a.'#19978 +
        #35838#22320#28857
      'from '#35838#31243#34920' a,'#35838#31243#20449#24687' b'
      'where (b.'#26412#23398#26399#35838#31243'='#39'Y'#39')and(a.'#35838#31243#32534#21495'=b.'#35838#31243#32534#21495')')
    Left = 504
    Top = 8
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 608
    Top = 8
  end
end
