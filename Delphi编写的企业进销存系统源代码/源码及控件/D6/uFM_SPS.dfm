inherited FM_SPS: TFM_SPS
  Left = 221
  Top = 118
  Caption = '成品半成品点选'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 872
    Height = 573
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '选取原料'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 39
        Width = 864
        Height = 507
        Align = alClient
        Color = clInfoBk
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = '宋体'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 864
        Height = 39
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object BitBtn1: TBitBtn
          Left = 66
          Top = 6
          Width = 88
          Height = 27
          Caption = '确  定'
          ModalResult = 1
          TabOrder = 0
          OnClick = BitBtn1Click
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
          NumGlyphs = 2
        end
        object BitBtn2: TBitBtn
          Left = 292
          Top = 6
          Width = 88
          Height = 27
          Caption = '取  消'
          TabOrder = 1
          Kind = bkCancel
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '选取半成品'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 39
        Width = 864
        Height = 507
        Align = alClient
        Color = clInfoBk
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = '宋体'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = '单号'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = '型号'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = '品名'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = '材质'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = '规格'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = '心孔'
            Visible = False
          end
          item
            Expanded = False
            FieldName = '可入数量'
            Width = 85
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 864
        Height = 39
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object BitBtn3: TBitBtn
          Left = 66
          Top = 6
          Width = 88
          Height = 27
          Caption = '确  定'
          ModalResult = 1
          TabOrder = 0
          OnClick = BitBtn3Click
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
          NumGlyphs = 2
        end
        object BitBtn4: TBitBtn
          Left = 292
          Top = 6
          Width = 88
          Height = 27
          Caption = '取  消'
          TabOrder = 1
          Kind = bkCancel
        end
      end
    end
  end
  object Query1: TQuery
    AutoRefresh = True
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select T.F01 AS  单号,T.F02 AS 原料编号,M.F02 AS 品名,'
      'M.F03 AS 规格,T.F03 -T.F04 AS  可入重量'
      'from T2130A as T'
      'left join T1050 AS M on T.F02=M.F01 '
      'where T.F03 >T.F04')
    Left = 52
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 76
    Top = 152
  end
  object Query2: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select T.F01 AS  单号,T.F02 AS 编号,S.F01 AS 型号,S.F02 AS 品名,'
      
        'S.F03 AS 材质 ,S.F04 AS 规格,S.F05 AS 心孔 ,T.F03 -T.F04 AS 可入' +
        '数量'
      'from T2140A AS T'
      'left join T1070 as S on T.F02=S.AutoNo'
      'where T.F03 > T.F04')
    Left = 276
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 308
    Top = 160
  end
end
