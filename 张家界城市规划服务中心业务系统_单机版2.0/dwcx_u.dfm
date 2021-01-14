object frm_dwcx: Tfrm_dwcx
  Left = 309
  Top = 279
  Caption = #21333#20301#26597#35810
  ClientHeight = 328
  ClientWidth = 674
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
    Left = 8
    Top = 32
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
      ItemIndex = 0
      TabOrder = 0
      Text = #21333#20301
      Items.Strings = (
        #21333#20301
        #39033#30446#21517#31216
        #36127#36131#20154)
    end
    object Edit1: TEdit
      Left = 144
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 392
      Top = 16
      Width = 75
      Height = 25
      Caption = #26597#35810'(&S)'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 481
      Top = 16
      Width = 75
      Height = 25
      Caption = #36873#25321
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 569
      Top = 16
      Width = 75
      Height = 25
      Caption = #20851#38381'(&C)'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 657
    Height = 225
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'dw'
        Title.Caption = #21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'xmmc'
        Title.Caption = #39033#30446#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fzr'
        Title.Caption = #36127#36131#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bgdh'
        Title.Caption = #21150#20844#30005#35805
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sj'
        Title.Caption = #25163#26426
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
        FieldName = 'email'
        Title.Caption = #37038#31665
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
      '')
    Left = 32
  end
end
