inherited FM_SEM: TFM_SEM
  Left = 220
  Top = 112
  Width = 730
  Height = 530
  Caption = '选择原料'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 503
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 720
      Height = 75
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 15
        Top = 2
        Width = 24
        Height = 12
        Caption = '编号'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 105
        Top = 2
        Width = 24
        Height = 12
        Caption = '品名'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 230
        Top = 2
        Width = 24
        Height = 12
        Caption = '规格'
      end
      object Label4: TLabel
        Left = 14
        Top = 36
        Width = 48
        Height = 12
        Caption = '库存重量'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 117
        Top = 36
        Width = 48
        Height = 12
        Caption = '安全存量'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 230
        Top = 36
        Width = 48
        Height = 12
        Caption = '参考进价'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 324
        Top = 36
        Width = 36
        Height = 12
        Caption = '采购别'
      end
      object BitBtn1: TBitBtn
        Left = 447
        Top = 30
        Width = 78
        Height = 28
        Caption = '新增'
        ModalResult = 1
        TabOrder = 7
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 525
        Top = 30
        Width = 78
        Height = 28
        Caption = '选取'
        ModalResult = 1
        TabOrder = 8
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object BitBtn3: TBitBtn
        Left = 603
        Top = 30
        Width = 78
        Height = 28
        Caption = '取消'
        ModalResult = 2
        TabOrder = 9
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
      object Edit1: TEdit
        Tag = 1
        Left = 14
        Top = 14
        Width = 84
        Height = 20
        TabOrder = 0
        OnExit = Edit1Exit
      end
      object Edit2: TEdit
        Tag = 2
        Left = 101
        Top = 14
        Width = 126
        Height = 20
        TabOrder = 1
        OnExit = Edit1Exit
      end
      object Edit3: TEdit
        Tag = 3
        Left = 229
        Top = 14
        Width = 161
        Height = 20
        TabOrder = 2
        OnExit = Edit1Exit
      end
      object Edit4: TEdit
        Left = 13
        Top = 49
        Width = 102
        Height = 20
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 118
        Top = 49
        Width = 109
        Height = 20
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 229
        Top = 49
        Width = 93
        Height = 20
        TabOrder = 5
      end
      object ComboBox1: TComboBox
        Tag = 6
        Left = 324
        Top = 49
        Width = 67
        Height = 20
        ItemHeight = 12
        TabOrder = 6
        OnExit = Edit1Exit
        Items.Strings = (
          '国内'
          '国外')
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 76
      Width = 720
      Height = 426
      Align = alClient
      Color = clInfoBk
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = '宋体'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'F01'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F02'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F03'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F04'
          Title.Alignment = taRightJustify
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F05'
          Title.Alignment = taRightJustify
          Width = 71
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'F06'
          Title.Alignment = taCenter
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F07'
          Title.Alignment = taRightJustify
          Title.Caption = '参考进价'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F12'
          Title.Alignment = taRightJustify
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F08'
          Width = 86
          Visible = True
        end>
    end
  end
  object Query1: TQuery
    AfterScroll = Query1AfterScroll
    DatabaseName = 'STK0311'
    SessionName = 'Default'
    SQL.Strings = (
      'select F01,F02,F03,F04,F05,F06,F07,F08,F12 from T1050'
      'where F01 like :sF01'
      'and F02 like :sF02'
      'and ((F03 like :sF03 ) or (F03 is null) or (F03='#39#39'))'
      ''
      'and ((F06 like :sF06) or (F06 is null))'
      '')
    Left = 96
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'sF01'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'sF02'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'sF03'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'sF06'
        ParamType = ptUnknown
        Value = '%'
      end>
    object Query1F01: TStringField
      DisplayLabel = '编号'
      FieldName = 'F01'
      Origin = 'STK0311.T1050.F01'
      FixedChar = True
      Size = 8
    end
    object Query1F02: TStringField
      DisplayLabel = '品名'
      FieldName = 'F02'
      Origin = 'STK0311.T1050.F02'
      FixedChar = True
      Size = 12
    end
    object Query1F03: TStringField
      DisplayLabel = '规格'
      FieldName = 'F03'
      Origin = 'STK0311.T1050.F03'
      FixedChar = True
      Size = 14
    end
    object Query1F04: TFloatField
      DisplayLabel = '库存重量'
      FieldName = 'F04'
      Origin = 'STK0311.T1050.F04'
    end
    object Query1F05: TFloatField
      DisplayLabel = '安全存量'
      FieldName = 'F05'
      Origin = 'STK0311.T1050.F05'
    end
    object Query1F06: TStringField
      DisplayLabel = '采购别'
      FieldName = 'F06'
      Origin = 'STK0311.T1050.F06'
      FixedChar = True
      Size = 4
    end
    object Query1F07: TFloatField
      DisplayLabel = '叁考进价'
      FieldName = 'F07'
      Origin = 'STK0311.T1050.F07'
    end
    object Query1F08: TStringField
      DisplayLabel = '备注'
      FieldName = 'F08'
      Origin = 'STK0311.T1050.F08'
      FixedChar = True
    end
    object Query1F12: TFloatField
      DisplayLabel = '可分配库存'
      FieldName = 'F12'
      Origin = 'STK0311.T1050.F12'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 136
    Top = 208
  end
  object Qry: TQuery
    DatabaseName = 'STK0311'
    Left = 168
    Top = 200
  end
end
