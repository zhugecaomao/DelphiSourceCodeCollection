object FM_USR: TFM_USR
  Left = 175
  Top = 148
  Width = 828
  Height = 549
  Hint = '使用者设定'
  Caption = '使用者设定'
  Color = clBtnFace
  Font.Charset = CHINESEBIG5_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '新细明体'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object tsDBGrid2: TtsDBGrid
    Left = 181
    Top = 0
    Width = 639
    Height = 522
    Align = alClient
    AutoInsert = False
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    Cols = 9
    DataSource = DataSource2
    DefaultColWidth = 58
    ExactRowCount = True
    FieldState = fsCustomized
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    HeadingFont.Charset = GB2312_CHARSET
    HeadingFont.Color = clNavy
    HeadingFont.Height = -12
    HeadingFont.Name = '宋体'
    HeadingFont.Style = []
    HeadingParentFont = False
    ParentFont = False
    ParentShowHint = False
    RowChangedIndicator = riAutoReset
    RowMoving = False
    ShowHint = True
    TabOrder = 0
    Version = '2.01'
    OnEnter = tsDBGrid2Enter
    OnExit = tsDBGrid2Exit
    DataBound = True
    ColProperties = <
      item
        DataCol = 1
        FieldName = 'D_SN'
        Col.ControlType = ctText
        Col.FieldName = 'D_SN'
        Col.HeadingHorzAlignment = htaLeft
        Col.ReadOnly = True
        Col.HorzAlignment = htaLeft
        Col.Width = 27
        Col.AssignedValues = #3
      end
      item
        DataCol = 2
        FieldName = 'K_SN'
        Col.ControlType = ctText
        Col.FieldName = 'K_SN'
        Col.MaxLength = 24
        Col.ReadOnly = True
        Col.HorzAlignment = htaLeft
        Col.Width = 166
        Col.AssignedValues = '"'
      end
      item
        DataCol = 3
        FieldName = 'F01'
        Col.ControlType = ctCheck
        Col.FieldName = 'F01'
        Col.HeadingHorzAlignment = htaCenter
        Col.HorzAlignment = htaLeft
        Col.Width = 58
        Col.AssignedValues = #2
      end
      item
        DataCol = 4
        FieldName = 'F02'
        Col.ControlType = ctCheck
        Col.FieldName = 'F02'
        Col.HeadingHorzAlignment = htaCenter
        Col.HorzAlignment = htaLeft
        Col.Width = 58
        Col.AssignedValues = #2
      end
      item
        DataCol = 5
        FieldName = 'F03'
        Col.ControlType = ctCheck
        Col.FieldName = 'F03'
        Col.HeadingHorzAlignment = htaCenter
        Col.HorzAlignment = htaLeft
        Col.Width = 58
        Col.AssignedValues = #2
      end
      item
        DataCol = 6
        FieldName = 'F04'
        Col.ControlType = ctCheck
        Col.FieldName = 'F04'
        Col.HeadingHorzAlignment = htaCenter
        Col.HorzAlignment = htaLeft
        Col.Width = 58
        Col.AssignedValues = #2
      end
      item
        DataCol = 7
        FieldName = 'F05'
        Col.ControlType = ctCheck
        Col.FieldName = 'F05'
        Col.HeadingHorzAlignment = htaCenter
        Col.HorzAlignment = htaLeft
        Col.Width = 58
        Col.AssignedValues = #2
      end
      item
        DataCol = 8
        FieldName = 'F06'
        Col.ControlType = ctCheck
        Col.FieldName = 'F06'
        Col.HorzAlignment = htaLeft
        Col.Width = 58
        Col.AssignedValues = #2
      end
      item
        DataCol = 9
        FieldName = 'Memo'
        Col.ControlType = ctText
        Col.FieldName = 'Memo'
        Col.HeadingHorzAlignment = htaCenter
        Col.MaxLength = 50
        Col.HorzAlignment = htaLeft
        Col.Width = 67
        Col.AssignedValues = #2
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 181
    Height = 522
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = '新细明体'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 177
      Height = 43
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 118
        Top = 2
        Width = 57
        Height = 38
        Caption = '离开'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          EE000000424DEE0000000000000076000000280000000F0000000F0000000100
          0400000000007800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888080707E7E70007080880707E7E060078088000000007600808888090E0066
          6080800009901067608080999999107070808099999910006080800009901070
          60808888090F107670808888000E106660808888080FEF0760808888880EFEF0
          708088888800000000808888888888888880}
        Layout = blGlyphTop
        Spacing = 1
      end
      object Button1: TBitBtn
        Left = 2
        Top = 2
        Width = 58
        Height = 38
        Caption = '全部选取'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 1
      end
      object Button2: TBitBtn
        Left = 60
        Top = 2
        Width = 58
        Height = 38
        Cancel = True
        Caption = '全部取消'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 1
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 45
      Width = 177
      Height = 475
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object tsDBGrid1: TtsDBGrid
        Left = 0
        Top = 0
        Width = 147
        Height = 475
        Align = alClient
        AutoInsert = False
        CellSelectMode = cmNone
        CheckBoxStyle = stCheck
        Cols = 2
        DataSource = DataSource1
        ExactRowCount = True
        FieldState = fsCustomized
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '宋体'
        Font.Style = []
        HeadingFont.Charset = GB2312_CHARSET
        HeadingFont.Color = clTeal
        HeadingFont.Height = -12
        HeadingFont.Name = '宋体'
        HeadingFont.Style = []
        HeadingParentFont = False
        ParentFont = False
        ParentShowHint = False
        RowChangedIndicator = riAutoReset
        RowMoving = False
        ShowHint = True
        TabOrder = 0
        Version = '2.01'
        OnEnter = tsDBGrid1Enter
        OnExit = tsDBGrid1Exit
        DataBound = True
        ColProperties = <
          item
            DataCol = 1
            FieldName = 'Nm'
            Col.ControlType = ctText
            Col.FieldName = 'Nm'
            Col.Heading = '使用者'
            Col.MaxLength = 10
            Col.HorzAlignment = htaLeft
            Col.Width = 63
            Col.AssignedValues = #2
          end
          item
            DataCol = 2
            FieldName = 'PW'
            Col.ControlType = ctText
            Col.FieldName = 'PW'
            Col.MaxLength = 10
            Col.HorzAlignment = htaLeft
            Col.Width = 67
            Col.AssignedValues = #2
          end>
      end
      object DBVertNavigator1: TDBVertNavigator
        Left = 147
        Top = 0
        Width = 30
        Height = 475
        DataSource = DataSource1
        VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        TabOrder = 1
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 448
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 544
    Top = 184
  end
  object Table1: TTable
    BeforeInsert = Table1BeforeInsert
    BeforeEdit = Table1BeforeEdit
    BeforePost = Table1BeforePost
    BeforeDelete = Table1BeforeDelete
    AfterScroll = Table1AfterScroll
    AutoRefresh = True
    DatabaseName = 'STK0311'
    IndexName = 'PK_TUser'
    TableName = 'dbo.TUser'
    Left = 416
    Top = 88
    object Table1Nm: TStringField
      DisplayLabel = '使用者名称'
      FieldName = 'Nm'
      FixedChar = True
      Size = 10
    end
    object Table1PW: TStringField
      DisplayLabel = '密码'
      FieldName = 'PW'
      FixedChar = True
      Size = 10
    end
  end
  object Table2: TTable
    BeforeInsert = Table2BeforeInsert
    BeforeDelete = Table2BeforeDelete
    AutoRefresh = True
    DatabaseName = 'STK0311'
    IndexFieldNames = 'NM;D_SN'
    MasterFields = 'Nm'
    MasterSource = DataSource1
    TableName = 'dbo.TUserRight'
    Left = 512
    Top = 184
    object Table2NM: TStringField
      FieldName = 'NM'
      Required = True
      FixedChar = True
      Size = 10
    end
    object Table2K_SN: TStringField
      DisplayLabel = '项目别'
      FieldName = 'K_SN'
      Required = True
      FixedChar = True
      Size = 24
    end
    object Table2D_SN: TIntegerField
      DisplayLabel = '序'
      FieldName = 'D_SN'
    end
    object Table2F01: TBooleanField
      DisplayLabel = '查看'
      FieldName = 'F01'
      Required = True
    end
    object Table2F02: TBooleanField
      DisplayLabel = '新增'
      FieldName = 'F02'
      Required = True
    end
    object Table2F03: TBooleanField
      DisplayLabel = '删除'
      FieldName = 'F03'
      Required = True
    end
    object Table2F04: TBooleanField
      DisplayLabel = '修改'
      FieldName = 'F04'
      Required = True
    end
    object Table2F05: TBooleanField
      DisplayLabel = '列印'
      FieldName = 'F05'
      Required = True
    end
    object Table2F06: TBooleanField
      DisplayLabel = '金额处理'
      FieldName = 'F06'
      Required = True
    end
    object Table2Memo: TStringField
      DisplayLabel = '备注'
      FieldName = 'Memo'
      Size = 50
    end
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 512
    Top = 232
  end
end
