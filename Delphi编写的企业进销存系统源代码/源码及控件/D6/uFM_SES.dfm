inherited FM_SES: TFM_SES
  Left = 288
  Top = 152
  Width = 680
  Height = 480
  Caption = '半成品选择窗口'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 44
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 509
      Top = 5
      Width = 24
      Height = 12
      Caption = '心孔'
      Visible = False
    end
    object Label4: TLabel
      Left = 349
      Top = 5
      Width = 24
      Height = 12
      Caption = '规格'
    end
    object Label3: TLabel
      Left = 243
      Top = 5
      Width = 24
      Height = 12
      Caption = '材质'
    end
    object Label2: TLabel
      Left = 138
      Top = 5
      Width = 24
      Height = 12
      Caption = '品名'
    end
    object Label1: TLabel
      Left = 34
      Top = 5
      Width = 24
      Height = 12
      Caption = '型号'
    end
    object BitBtn1: TBitBtn
      Left = 419
      Top = 3
      Width = 38
      Height = 38
      Caption = '确定'
      ModalResult = 1
      TabOrder = 5
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
      Spacing = 1
    end
    object BitBtn2: TBitBtn
      Left = 456
      Top = 3
      Width = 38
      Height = 38
      Caption = '取消'
      TabOrder = 6
      Kind = bkCancel
      Layout = blGlyphTop
      Spacing = 1
    end
    object Edit1: TEdit
      Tag = 1
      Left = 14
      Top = 18
      Width = 77
      Height = 20
      TabOrder = 0
      Text = 'Edit1'
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Tag = 2
      Left = 93
      Top = 18
      Width = 121
      Height = 20
      TabOrder = 1
      Text = 'Edit2'
      OnExit = Edit1Exit
    end
    object Edit3: TEdit
      Tag = 3
      Left = 216
      Top = 18
      Width = 97
      Height = 20
      TabOrder = 2
      Text = 'Edit3'
      OnExit = Edit1Exit
    end
    object Edit4: TEdit
      Tag = 4
      Left = 315
      Top = 18
      Width = 100
      Height = 20
      TabOrder = 3
      Text = 'Edit4'
      OnExit = Edit1Exit
    end
    object Edit5: TEdit
      Tag = 5
      Left = 504
      Top = 18
      Width = 46
      Height = 20
      TabOrder = 4
      Text = 'Edit5'
      Visible = False
      OnExit = Edit1Exit
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 44
    Width = 672
    Height = 409
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
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = '品名'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = '材质'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = '规格'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = '心孔'
        Visible = False
      end>
  end
  object Query1: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      
        'Select AutoNo,F01 as 型号,F02 as 品名,F03 as 材质,F04 as 规格,F0' +
        '5 as 心孔  From T1070'
      'Where F01 Like :sF01'
      'And F02 Like :sF02'
      'And F03 Like :sF03'
      'And(( F04 Like :sF04) or (F04 is null))'
      'And ((F05 Like :sF05) or (F05 is null))')
    Left = 288
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
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 344
    Top = 184
  end
end
