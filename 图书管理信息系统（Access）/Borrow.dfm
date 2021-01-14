object BorrowForm: TBorrowForm
  Left = 136
  Top = 93
  Width = 572
  Height = 462
  Caption = #20511#38405#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 317
    Top = 403
    Width = 67
    Height = 22
    Caption = #20511#20986'&L'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 454
    Top = 403
    Width = 67
    Height = 22
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 386
    Top = 403
    Width = 67
    Height = 22
    Caption = #24402#36824'&B'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Panel2: TPanel
    Left = 21
    Top = 39
    Width = 524
    Height = 354
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Bevel1: TBevel
      Left = 11
      Top = 37
      Width = 486
      Height = 10
      Shape = bsBottomLine
    end
    object StaticText1: TStaticText
      Left = 18
      Top = 21
      Width = 30
      Height = 16
      Caption = #20070#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 8
      Top = 57
      Width = 513
      Height = 296
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object Bevel2: TBevel
        Left = 7
        Top = 199
        Width = 482
        Height = 10
        Shape = bsBottomLine
      end
      object StaticText2: TStaticText
        Left = 10
        Top = 14
        Width = 28
        Height = 17
        Caption = #20070#21517
        TabOrder = 0
      end
      object StaticText3: TStaticText
        Left = 10
        Top = 38
        Width = 28
        Height = 17
        Caption = #20316#32773
        TabOrder = 2
      end
      object StaticText4: TStaticText
        Left = 9
        Top = 60
        Width = 40
        Height = 17
        Caption = #20986#29256#31038
        TabOrder = 3
      end
      object StaticText5: TStaticText
        Left = 304
        Top = 36
        Width = 52
        Height = 17
        Caption = #20986#29256#26085#26399
        TabOrder = 4
      end
      object StaticText7: TStaticText
        Left = 354
        Top = 59
        Width = 46
        Height = 17
        Caption = #20215#26684'('#20803')'
        TabOrder = 5
      end
      object StaticText8: TStaticText
        Left = 10
        Top = 83
        Width = 37
        Height = 17
        Caption = #22791#27880' : '
        TabOrder = 6
      end
      object StaticText9: TStaticText
        Left = 13
        Top = 229
        Width = 52
        Height = 17
        Caption = #20511#20070#35777#21495
        TabOrder = 7
      end
      object ReaderIDEdit: TEdit
        Left = 90
        Top = 227
        Width = 121
        Height = 21
        MaxLength = 10
        TabOrder = 1
        OnChange = ReaderIDEditChange
      end
      object StaticText10: TStaticText
        Left = 11
        Top = 263
        Width = 70
        Height = 17
        Caption = #25345#26377#26102#38388'('#22825')'
        TabOrder = 8
      end
      object OwnTimeEdit: TEdit
        Left = 90
        Top = 258
        Width = 121
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
      end
      object StaticText11: TStaticText
        Left = 250
        Top = 260
        Width = 46
        Height = 17
        Caption = #32602#37329'('#20803')'
        TabOrder = 10
      end
      object FineEdit: TEdit
        Left = 339
        Top = 258
        Width = 142
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 11
      end
      object StaticText6: TStaticText
        Left = 233
        Top = 229
        Width = 88
        Height = 17
        Caption = #25345#26377#20070#31821#30340#25968#30446
        TabOrder = 12
      end
      object TotalEdit: TEdit
        Left = 339
        Top = 226
        Width = 142
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 13
      end
      object DBName: TDBEdit
        Left = 88
        Top = 8
        Width = 393
        Height = 21
        DataSource = DataSource1
        TabOrder = 14
      end
      object DBAuthor: TDBEdit
        Left = 88
        Top = 32
        Width = 193
        Height = 21
        DataSource = DataSource1
        TabOrder = 15
      end
      object DBPress: TDBEdit
        Left = 88
        Top = 56
        Width = 257
        Height = 21
        DataSource = DataSource1
        TabOrder = 16
      end
      object DBOutDate: TDBEdit
        Left = 360
        Top = 32
        Width = 121
        Height = 21
        DataSource = DataSource1
        TabOrder = 17
      end
      object DBCost: TDBEdit
        Left = 400
        Top = 56
        Width = 81
        Height = 21
        DataSource = DataSource1
        TabOrder = 18
      end
      object DBMemo: TDBMemo
        Left = 88
        Top = 87
        Width = 393
        Height = 98
        DataSource = DataSource1
        TabOrder = 19
      end
    end
    object ComboBox1: TComboBox
      Left = 96
      Top = 16
      Width = 129
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox1Change
      OnKeyDown = ComboBox1KeyDown
    end
  end
  object Panel3: TPanel
    Left = 21
    Top = 11
    Width = 524
    Height = 25
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object StaticText12: TStaticText
      Left = 13
      Top = 5
      Width = 52
      Height = 17
      Caption = #22270#20070#20511#36824
      TabOrder = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModuleADO.ADOTable1
    Left = 379
    Top = 48
  end
  object tempADOQuery1: TADOQuery
    Connection = DataModuleADO.ADOConnection1
    Parameters = <>
    Left = 285
    Top = 47
  end
  object tempADOQuery2: TADOQuery
    Connection = DataModuleADO.ADOConnection1
    Parameters = <>
    Left = 333
    Top = 47
  end
end
