inherited FM_SCM: TFM_SCM
  Left = 251
  Top = 147
  Width = 680
  Height = 480
  Caption = ' 客户来料选择窗口'
  OldCreateOrder = True
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 48
    Align = alTop
    BorderWidth = 1
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 7
      Width = 24
      Height = 12
      Caption = '型号'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 108
      Top = 7
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
      Left = 228
      Top = 7
      Width = 24
      Height = 12
      Caption = '材质'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 344
      Top = 7
      Width = 24
      Height = 12
      Caption = '规格'
    end
    object Label5: TLabel
      Left = 621
      Top = 6
      Width = 24
      Height = 12
      Caption = '心孔'
    end
    object Label6: TLabel
      Left = 446
      Top = 7
      Width = 24
      Height = 12
      Caption = '单重'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 537
      Top = 4
      Width = 35
      Height = 40
      Caption = '确定'
      ModalResult = 1
      TabOrder = 7
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 573
      Top = 4
      Width = 35
      Height = 40
      Caption = '取消'
      TabOrder = 8
      Kind = bkCancel
      Layout = blGlyphTop
    end
    object Edit1: TEdit
      Tag = 1
      Left = 13
      Top = 23
      Width = 77
      Height = 20
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Tag = 2
      Left = 92
      Top = 23
      Width = 127
      Height = 20
      TabOrder = 1
      OnExit = Edit1Exit
    end
    object Edit3: TEdit
      Tag = 3
      Left = 221
      Top = 23
      Width = 88
      Height = 20
      TabOrder = 2
      OnExit = Edit1Exit
    end
    object Edit4: TEdit
      Tag = 4
      Left = 311
      Top = 23
      Width = 127
      Height = 20
      TabOrder = 3
      OnExit = Edit1Exit
    end
    object Edit5: TEdit
      Tag = 5
      Left = 613
      Top = 23
      Width = 46
      Height = 20
      TabOrder = 4
      OnExit = Edit1Exit
    end
    object BitBtn3: TBitBtn
      Left = 501
      Top = 4
      Width = 35
      Height = 40
      Caption = '新增'
      ModalResult = 1
      TabOrder = 6
      OnClick = BitBtn3Click
      Glyph.Data = {
        36010000424D3601000000000000760000002800000011000000100000000100
        040000000000C0000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDD88888888888DD0000000DDD000000000008DD0000000DDD0
        FFFFFFFFF08DD0000000DDD0FFFFFFFFF08DD0000000DDD0F7777777F08DD000
        0000DDD0FFFFFFFFF08DD0000000DDD0F7777777F08DD0000000DDD0FFFFFFFF
        F08DD0000000DDD0F7777777F08DD0000000DDD0FFFFFFFFF08DD0000000DDD0
        F7777F0000DDD0000000DDD0FFFFFF080DDDD0000000DDD0FFFFFF00DDDDD000
        0000DDD00000000DDDDDD0000000DDDDDDDDDDDDDDDDD0000000}
      Layout = blGlyphTop
    end
    object Edit6: TEdit
      Left = 440
      Top = 23
      Width = 57
      Height = 20
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 672
    Height = 405
    Align = alClient
    Color = clInfoBk
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = '型号'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = '品名'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = '材质'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = '规格'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = '心孔'
        Visible = False
      end
      item
        Expanded = False
        FieldName = '单重'
        Title.Alignment = taRightJustify
        Width = 89
        Visible = True
      end>
  end
  object Query1: TQuery
    AfterScroll = Query1AfterScroll
    DatabaseName = 'STK0311'
    SQL.Strings = (
      
        'Select AutoNo,F01 as 型号,F02 as 品名,F03 as 材质,F04 as 规格,F0' +
        '5 as 心孔 ,F07 AS 单重  From T1090'
      'Where F01 Like :sF01'
      'And F02 Like :sF02'
      'And F03 Like :sF03'
      'And F04 Like :sF04'
      'And F05 Like :sF05'
      'And F10 Like :sF10'
      'And F11 Like :sF11')
    Left = 280
    Top = 184
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
        Name = 'sF04'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'sF05'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'sF10'
        ParamType = ptUnknown
        Value = '%'
      end
      item
        DataType = ftString
        Name = 'sF11'
        ParamType = ptUnknown
        Value = '%'
      end>
    object Query1AutoNo: TIntegerField
      FieldName = 'AutoNo'
      Origin = 'STK0311.T1070.AutoNo'
    end
    object Query1BDEDesigner: TStringField
      FieldName = '型号'
      Origin = 'STK0311.T1070.F01'
      FixedChar = True
      Size = 4
    end
    object Query1BDEDesigner2: TStringField
      FieldName = '品名'
      Origin = 'STK0311.T1070.F02'
      FixedChar = True
      Size = 12
    end
    object Query1BDEDesigner3: TStringField
      FieldName = '材质'
      Origin = 'STK0311.T1070.F03'
      FixedChar = True
      Size = 6
    end
    object Query1BDEDesigner4: TStringField
      FieldName = '规格'
      Origin = 'STK0311.T1070.F04'
      FixedChar = True
    end
    object Query1BDEDesigner5: TStringField
      FieldName = '心孔'
      Origin = 'STK0311.T1070.F05'
      FixedChar = True
      Size = 5
    end
    object Query1BDEDesigner6: TFloatField
      FieldName = '单重'
      Origin = 'STK0311.T1090.F07'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 344
    Top = 184
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 104
    Top = 80
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 216
    Top = 88
  end
end
