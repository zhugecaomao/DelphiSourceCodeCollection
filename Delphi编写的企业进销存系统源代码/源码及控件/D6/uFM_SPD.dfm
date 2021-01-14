inherited FM_SPD: TFM_SPD
  Left = 246
  Top = 155
  Width = 688
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 680
    inherited Label5: TLabel
      Left = 607
    end
    inherited Label3: TLabel
      Left = 218
      Top = 7
      Font.Color = clBlue
      ParentFont = False
    end
    inherited Label2: TLabel
      Left = 104
      Top = 7
      Font.Color = clBlue
      ParentFont = False
    end
    inherited Label1: TLabel
      Left = 26
      Top = 7
      Font.Color = clBlue
      ParentFont = False
    end
    inherited Label4: TLabel
      Left = 311
      Top = 7
    end
    object Label6: TLabel [5]
      Left = 401
      Top = 6
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
    inherited BitBtn1: TBitBtn
      Left = 490
      Width = 35
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 7
    end
    inherited BitBtn2: TBitBtn
      Left = 525
      Width = 35
      TabOrder = 8
    end
    inherited Edit1: TEdit
      Width = 75
      Text = ''
    end
    inherited Edit2: TEdit
      Left = 90
      Width = 111
      Text = ''
    end
    inherited Edit3: TEdit
      Left = 203
      Width = 80
      Text = ''
    end
    inherited Edit4: TEdit
      Left = 285
      Width = 112
      Text = ''
    end
    inherited Edit5: TEdit
      Left = 601
      Width = 38
      Text = ''
    end
    object BitBtn3: TBitBtn
      Left = 455
      Top = 4
      Width = 35
      Height = 40
      Caption = '新增'
      TabOrder = 6
      OnClick = BitBtn3Click
      Glyph.Data = {
        36010000424D3601000000000000760000002800000011000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
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
      Left = 399
      Top = 22
      Width = 52
      Height = 20
      TabOrder = 5
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 680
    Columns = <
      item
        Expanded = False
        FieldName = '型号'
        PickList.Strings = ()
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = '品名'
        PickList.Strings = ()
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = '材质'
        PickList.Strings = ()
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = '规格'
        PickList.Strings = ()
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = '心孔'
        PickList.Strings = ()
        Visible = False
      end
      item
        Expanded = False
        FieldName = '单重'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 72
        Visible = True
      end>
  end
  inherited Query1: TQuery
    SQL.Strings = (
      
        'Select AutoNo,F01 as 型号,F02 as 品名,F03 as 材质,F04 as 规格,F0' +
        '5 as 心孔, F07 as 单重  From T1080'
      'Where F01 Like :sF01'
      'And F02 Like :sF02'
      'And F03 Like :sF03'
      'And ((F04 Like :sF04) or (F04 is null))'
      'And(( F05 Like :sF05) or (F05 is null))')
    object Query1BDEDesigner6: TFloatField
      FieldName = '单重'
      Origin = 'STK0311.T1080.F07'
    end
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 112
    Top = 104
  end
end
