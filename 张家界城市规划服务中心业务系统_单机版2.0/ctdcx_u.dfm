object ctdcx: Tctdcx
  Left = 309
  Top = 279
  Caption = #20986#22270#21333#26597#35810
  ClientHeight = 382
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 24
    Top = 33
    Width = 657
    Height = 49
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 128
      Top = 19
      Width = 8
      Height = 13
      Caption = '='
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 16
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = #20986#22270#21333#20301
      Items.Strings = (
        #20986#22270#21333#20301
        #20986#22270#32534#21495
        #22270#21517
        #26085#26399)
    end
    object Edit1: TEdit
      Left = 144
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 464
      Top = 16
      Width = 75
      Height = 25
      Caption = #26597#35810'(&S)'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 569
      Top = 16
      Width = 75
      Height = 25
      Caption = #20851#38381'(&C)'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 88
    Width = 657
    Height = 273
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ctbh'
        Title.Caption = #20986#22270#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctdw'
        Title.Caption = #20986#22270#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tm'
        Title.Caption = #22270#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'blc'
        Title.Caption = #27604#21015#23610
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dz'
        Title.Caption = #22320#22336
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bztfs'
        Title.Caption = #26631#20934#22270#24133#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctzs'
        Title.Caption = #20986#22270#24352#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'je'
        Title.Caption = #37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tfbjr'
        Title.Caption = #22270#24133#32534#36753#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jsfzr'
        Title.Caption = #25216#26415#36127#36131#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'chdz'
        Title.Caption = #27979#32472#38431#38271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rq'
        Title.Caption = #26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jdr'
        Title.Caption = #24314#26723#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jdrq'
        Title.Caption = #24314#26723#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'flag'
        Title.Caption = #26159#21542#24320#25910#36153#21333
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_ctd')
    Left = 32
    object ADOQuery1ctbh: TWideStringField
      FieldName = 'ctbh'
    end
    object ADOQuery1ctdw: TWideStringField
      FieldName = 'ctdw'
      Size = 50
    end
    object ADOQuery1tm: TWideStringField
      FieldName = 'tm'
      Size = 50
    end
    object ADOQuery1blc: TWideStringField
      FieldName = 'blc'
      Size = 10
    end
    object ADOQuery1dz: TWideStringField
      FieldName = 'dz'
      Size = 50
    end
    object ADOQuery1bztfs: TIntegerField
      FieldName = 'bztfs'
    end
    object ADOQuery1ctzs: TIntegerField
      FieldName = 'ctzs'
    end
    object ADOQuery1zbx: TWideStringField
      FieldName = 'zbx'
      Size = 10
    end
    object ADOQuery1zby: TWideStringField
      FieldName = 'zby'
      Size = 10
    end
    object ADOQuery1je: TBCDField
      FieldName = 'je'
      currency = True
      Precision = 19
    end
    object ADOQuery1tfbjr: TWideStringField
      FieldName = 'tfbjr'
      Size = 10
    end
    object ADOQuery1jsfzr: TWideStringField
      FieldName = 'jsfzr'
      Size = 10
    end
    object ADOQuery1chdz: TWideStringField
      FieldName = 'chdz'
      Size = 10
    end
    object ADOQuery1rq: TDateTimeField
      FieldName = 'rq'
    end
    object ADOQuery1jdr: TWideStringField
      FieldName = 'jdr'
      Size = 10
    end
    object ADOQuery1jdrq: TDateTimeField
      FieldName = 'jdrq'
    end
    object ADOQuery1flag: TBooleanField
      FieldName = 'flag'
    end
  end
end
