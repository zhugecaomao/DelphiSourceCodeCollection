inherited frmXsddHelp: TfrmXsddHelp
  Left = 63
  Top = 61
  Width = 648
  Caption = '选择订单'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 532
  end
  inherited Label1: TLabel
    Left = 57
    Caption = '客户'
  end
  inherited Label2: TLabel
    Left = 249
    Top = 22
    Width = 45
    Caption = '订单号'
  end
  inherited Bevel3: TBevel
    Left = 544
    Top = 183
  end
  inherited Bevel2: TBevel
    Left = 544
    Top = 231
  end
  object labRqa: TLabel [5]
    Left = 231
    Top = 54
    Width = 15
    Height = 15
    Caption = '至'
    Transparent = True
  end
  object Label3: TLabel [6]
    Left = 27
    Top = 54
    Width = 60
    Height = 15
    Alignment = taRightJustify
    Caption = '落单日期'
  end
  inherited Edit1: TEdit
    Left = 90
    Width = 137
    Hint = '%aKHMC'
    TabOrder = 0
  end
  inherited DBGrid1: TDBGrid
    Width = 532
    Height = 163
    DataSource = Data.sXsddHelp
    TabOrder = 7
    Columns = <
      item
        Expanded = False
        FieldName = 'DJBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JHRQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aKHMC'
        PickList.Strings = ()
        Width = 132
        Visible = True
      end>
  end
  inherited Edit2: TEdit
    Left = 297
    Top = 18
    Width = 89
    Hint = 'DJBH'
    TabOrder = 8
  end
  inherited btnOk: TBitBtn
    Left = 545
    TabOrder = 1
  end
  inherited btnCancel: TBitBtn
    Left = 545
    TabOrder = 2
  end
  inherited btnNew: TBitBtn
    Tag = 1
    Left = 545
    Top = 60
    TabOrder = 3
  end
  inherited btnModify: TBitBtn
    Tag = 1
    Left = 545
    Top = 102
    TabOrder = 4
  end
  inherited btnDel: TBitBtn
    Tag = 1
    Left = 545
    Top = 144
    TabOrder = 6
  end
  inherited Animate1: TAnimate
    Left = 569
    Top = 2
  end
  inherited btnSetColumn: TBitBtn
    Left = 544
    Top = 193
    TabOrder = 5
  end
  object DBGrid2: TDBGrid
    Left = 6
    Top = 252
    Width = 532
    Height = 163
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Data.sXsdd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = '宋体'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = '宋体'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'aPM'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aDW'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SL'
        Title.Caption = '订购数量'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aYTSL'
        Title.Caption = '已收货数量'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aMTSL'
        Width = 75
        Visible = True
      end>
  end
  object dtpRqa: TDateTimePicker
    Left = 90
    Top = 50
    Width = 137
    Height = 23
    CalAlignment = dtaLeft
    Date = 36153.3852850694
    Time = 36153.3852850694
    DateFormat = dfLong
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 11
    OnChange = SetFilter
  end
  object dtpRqb: TDateTimePicker
    Left = 250
    Top = 50
    Width = 137
    Height = 23
    CalAlignment = dtaLeft
    Date = 36153.3852850694
    Time = 36153.3852850694
    DateFormat = dfLong
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 12
    OnChange = SetFilter
  end
end
