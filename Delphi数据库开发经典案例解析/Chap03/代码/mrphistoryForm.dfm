object mrphistory: Tmrphistory
  Left = 309
  Top = 170
  Width = 696
  Height = 480
  Caption = 'MRP'#21382#21490#26597#35810
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
    Width = 683
    Height = 41
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object Label6: TLabel
      Left = 87
      Top = 13
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #29289#26009#32534#21495
    end
    object Label7: TLabel
      Left = 274
      Top = 13
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #24180#20221
    end
    object Label8: TLabel
      Left = 458
      Top = 13
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #35745#21010#26399
    end
    object BitBtn12: TBitBtn
      Left = 2
      Top = 2
      Width = 79
      Height = 33
      Caption = #25628#32034
      TabOrder = 0
      OnClick = BitBtn12Click
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
      Left = 143
      Top = 10
      Width = 100
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 1
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 330
      Top = 10
      Width = 100
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 2
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 514
      Top = 10
      Width = 100
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 3
      OnKeyPress = Edit3KeyPress
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 52
    Width = 684
    Height = 125
    BorderStyle = bsSingle
    TabOrder = 1
    object Label1: TLabel
      Left = 21
      Top = 20
      Width = 64
      Height = 13
      Align = alCustom
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20135#21697#32534#21495
    end
    object Label2: TLabel
      Left = 250
      Top = 19
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20135#21697#21517#31216
    end
    object Label3: TLabel
      Left = 20
      Top = 51
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24180#20221
    end
    object Label4: TLabel
      Left = 250
      Top = 51
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #35745#21010#26399
    end
    object Label5: TLabel
      Left = 19
      Top = 83
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26399#21021#24211#23384
    end
    object Label9: TLabel
      Left = 250
      Top = 83
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27611#38656#27714
    end
    object Label10: TLabel
      Left = 459
      Top = 52
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #39044#35745#24211#23384
    end
    object Label12: TLabel
      Left = 459
      Top = 21
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #39044#35745#20986#24211
    end
    object Label13: TLabel
      Left = 459
      Top = 84
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20928#38656#27714
    end
    object DBEdit1: TDBEdit
      Left = 86
      Top = 16
      Width = 121
      Height = 21
      DataField = #29289#26009#32534#21495
      DataSource = DataSource1
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 318
      Top = 16
      Width = 121
      Height = 21
      DataField = #29289#26009#21517#31216
      DataSource = DataSource1
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 86
      Top = 48
      Width = 121
      Height = 21
      DataField = #24180#20221
      DataSource = DataSource1
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 318
      Top = 48
      Width = 121
      Height = 21
      DataField = #35745#21010#26399
      DataSource = DataSource1
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 86
      Top = 80
      Width = 121
      Height = 21
      DataField = #26399#21021#24211#23384
      DataSource = DataSource1
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 318
      Top = 80
      Width = 121
      Height = 21
      DataField = #27611#38656#27714
      DataSource = DataSource1
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 526
      Top = 48
      Width = 121
      Height = 21
      DataField = #39044#35745#24211#23384
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 526
      Top = 16
      Width = 121
      Height = 21
      DataField = #39044#35745#20986#24211
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 526
      Top = 80
      Width = 121
      Height = 21
      DataField = #20928#38656#27714
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 8
    end
  end
  object Panel3: TPanel
    Left = 3
    Top = 184
    Width = 681
    Height = 257
    BorderStyle = bsSingle
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 657
      Height = 241
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
          FieldName = #21457#24067#26102#38388
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29289#26009#32534#21495
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
      'select a.*,b.'#29289#26009#21517#31216' from mrp'#29289#26009#38656#27714#21382#21490' a,'#29289#26009#20027#25991#20214' b'
      'where a.'#29289#26009#32534#21495'=b.'#29289#26009#32534#21495)
    Left = 448
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 408
    Top = 40
  end
end
