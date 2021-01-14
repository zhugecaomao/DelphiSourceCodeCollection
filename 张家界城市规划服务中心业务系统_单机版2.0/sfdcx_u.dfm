object sfdcx: Tsfdcx
  Left = 309
  Top = 279
  Caption = #25910#36153#21333#26597#35810
  ClientHeight = 373
  ClientWidth = 685
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
    Left = 16
    Top = 41
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
      Text = #24314#35774#21333#20301
      Items.Strings = (
        #24314#35774#21333#20301
        #25910#36153#32534#21495
        #22270#24133#37329#39069
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
    Left = 16
    Top = 96
    Width = 657
    Height = 265
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
        FieldName = 'sfbh'
        Title.Caption = #25910#36153#21333#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctbh'
        Title.Caption = #20986#22270#21333#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jsdw'
        Title.Caption = #24314#35774#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tfs'
        Title.Caption = #22270#24133#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tfje'
        Title.Caption = #22270#24133#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jbr'
        Title.Caption = #32463#21150#20154
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
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 'FILE NAME=E:\tjz\delphi_app\ghj\'#25910#36153#36890#30693#21333'\conn.udl'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_sfd')
    Left = 32
    object ADOQuery1sfbh: TWideStringField
      FieldName = 'sfbh'
    end
    object ADOQuery1ctbh: TWideStringField
      FieldName = 'ctbh'
    end
    object ADOQuery1jsdw: TWideStringField
      FieldName = 'jsdw'
      Size = 50
    end
    object ADOQuery1tfs: TFloatField
      FieldName = 'tfs'
    end
    object ADOQuery1tfje: TBCDField
      FieldName = 'tfje'
      currency = True
      Precision = 19
    end
    object ADOQuery1fzzs: TIntegerField
      FieldName = 'fzzs'
    end
    object ADOQuery1fzje: TBCDField
      FieldName = 'fzje'
      currency = True
      Precision = 19
    end
    object ADOQuery1jbr: TWideStringField
      FieldName = 'jbr'
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
    object ADOQuery1bz: TWideMemoField
      FieldName = 'bz'
      BlobType = ftWideMemo
    end
  end
end
