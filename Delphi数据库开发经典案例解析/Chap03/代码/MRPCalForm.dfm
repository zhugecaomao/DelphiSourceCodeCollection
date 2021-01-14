object MRPCal: TMRPCal
  Left = 228
  Top = 325
  Width = 696
  Height = 520
  Caption = 'MRP'#35745#31639
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
    Left = 2
    Top = 8
    Width = 681
    Height = 73
    Caption = #35745#31639#21442#25968
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 16
      Top = 40
      Width = 169
      Height = 17
      Caption = #32771#34385#24211#23384#65292#29983#20135#21644#37319#36141#35746#21333
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 192
      Top = 40
      Width = 89
      Height = 17
      Caption = #32771#34385#25552#21069#26399
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 296
      Top = 40
      Width = 81
      Height = 17
      Caption = #32771#34385#25439#32791
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 392
      Top = 32
      Width = 81
      Height = 25
      Caption = #35745#31639
      Default = True
      ModalResult = 1
      TabOrder = 3
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00887000000000
        7888880888888888088888080808999808888808888888880888880808080808
        0888880888888888088888080808080808888808888888880888880808080808
        0888880888888888088888080000000808888808000E0E080888880800000008
        0888880888888888088888088888888808888870000000007888}
    end
    object BitBtn2: TBitBtn
      Left = 512
      Top = 32
      Width = 81
      Height = 25
      Caption = #32467#26524#21457#24067
      Enabled = False
      TabOrder = 4
      OnClick = BitBtn2Click
      Kind = bkOK
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 88
    Width = 681
    Height = 145
    Caption = #20027#29983#20135#35745#21010
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 665
      Height = 121
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
          FieldName = #29289#26009#32534#21495
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29289#26009#21517#31216
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24180#20221
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24320#22987#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32467#26463#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MPS'#25968#37327
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 240
    Width = 681
    Height = 249
    Caption = 'MRP'#35745#31639#32467#26524'('#29289#26009#38656#27714')'
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 8
      Top = 16
      Width = 665
      Height = 225
      DataSource = DataSource2
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
          FieldName = #29289#26009#32534#21495
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29289#26009#21517#31216
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24180#20221
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26399#21021#24211#23384
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27611#38656#27714
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39044#35745#24211#23384
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20928#38656#27714
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39044#35745#20837#24211
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39044#35745#20986#24211
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#20135#20986
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#25237#20837
          Visible = True
        end>
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.'#29289#26009#21517#31216' from '#20027#29983#20135#35745#21010' a,'#29289#26009#20027#25991#20214' b'
      'where a.'#29289#26009#32534#21495'=b.'#29289#26009#32534#21495)
    Left = 450
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 482
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    OnDataChange = DataSource2DataChange
    Left = 482
    Top = 288
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.'#29289#26009#21517#31216' from mrp'#29289#26009#38656#27714#35745#31639' a,'#29289#26009#20027#25991#20214' b'
      'where a.'#29289#26009#32534#21495'=b.'#29289#26009#32534#21495)
    Left = 450
    Top = 288
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    Parameters = <>
    Left = 610
    Top = 40
  end
end
