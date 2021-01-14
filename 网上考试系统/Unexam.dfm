object tikufrm: Ttikufrm
  Left = 67
  Top = 74
  Width = 795
  Height = 515
  Caption = #39064#24211#32500#25252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 32
    Height = 16
    Caption = #39064#21495
    FocusControl = DBEdit1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 96
    Top = 40
    Width = 32
    Height = 16
    Caption = #39064#30446
    FocusControl = DBMemo1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 777
    Height = 41
    BevelInner = bvLowered
    TabOrder = 8
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 89
    Height = 433
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #39064#21495
        Width = 56
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 136
    Top = 8
    Width = 134
    Height = 21
    DataField = #39064#21495
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 136
    Top = 40
    Width = 641
    Height = 329
    DataField = #39064#30446
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 448
    Width = 224
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 448
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 4
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 456
    Top = 448
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 5
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 624
    Top = 448
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 6
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object GroupBox1: TGroupBox
    Left = 88
    Top = 376
    Width = 689
    Height = 57
    Caption = #31572#26696
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Label3: TLabel
      Left = 104
      Top = 25
      Width = 40
      Height = 16
      Caption = #31572#26696'A'
      FocusControl = DBEdit2
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 192
      Top = 25
      Width = 40
      Height = 16
      Caption = #31572#26696'B'
      FocusControl = DBEdit3
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 280
      Top = 25
      Width = 40
      Height = 16
      Caption = #31572#26696'C'
      FocusControl = DBEdit4
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 376
      Top = 25
      Width = 40
      Height = 16
      Caption = #31572#26696'D'
      FocusControl = DBEdit5
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 472
      Top = 25
      Width = 40
      Height = 16
      Caption = #31572#26696'E'
      FocusControl = DBEdit6
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBEdit2: TDBEdit
      Left = 152
      Top = 20
      Width = 25
      Height = 24
      DataField = #31572#26696'A'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 240
      Top = 20
      Width = 25
      Height = 24
      DataField = #31572#26696'B'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 328
      Top = 20
      Width = 25
      Height = 24
      DataField = #31572#26696'C'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 424
      Top = 20
      Width = 25
      Height = 24
      DataField = #31572#26696'D'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 520
      Top = 20
      Width = 25
      Height = 24
      DataField = #31572#26696'E'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.CDSExam
    Left = 256
    Top = 176
  end
end
