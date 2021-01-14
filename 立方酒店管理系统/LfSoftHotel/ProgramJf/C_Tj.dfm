object TjForm: TTjForm
  Left = 137
  Top = 91
  Width = 637
  Height = 393
  Caption = #32479#35745
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 89
    Align = alTop
    TabOrder = 0
    object lblTitle: TLabel
      Left = 232
      Top = 9
      Width = 101
      Height = 24
      Caption = #26597#35810#26465#20214
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 136
      Top = 45
      Width = 72
      Height = 12
      Caption = #24320#22987#26085#26399#26102#38388
    end
    object Label2: TLabel
      Left = 328
      Top = 45
      Width = 72
      Height = 12
      Caption = #32467#26463#26085#26399#26102#38388
    end
    object edtRoom: TLabeledEdit
      Left = 16
      Top = 61
      Width = 119
      Height = 20
      EditLabel.Width = 36
      EditLabel.Height = 12
      EditLabel.Caption = #20998#26426#21495
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
    end
    object dtpBd: TDateTimePicker
      Left = 136
      Top = 61
      Width = 119
      Height = 20
      CalAlignment = dtaLeft
      Date = 37421.3497881944
      Time = 37421.3497881944
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object edtBt: TMaskEdit
      Left = 256
      Top = 61
      Width = 71
      Height = 20
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
    end
    object dtpEd: TDateTimePicker
      Left = 328
      Top = 61
      Width = 120
      Height = 20
      CalAlignment = dtaLeft
      Date = 37421.3500603009
      Time = 37421.3500603009
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object edtEt: TMaskEdit
      Left = 449
      Top = 61
      Width = 71
      Height = 20
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 4
      Text = '  :  '
    end
    object btnQuery: TBitBtn
      Left = 522
      Top = 58
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 5
      OnClick = btnQueryClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 325
    Width = 629
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      629
      41)
    object btnCanc: TBitBtn
      Left = 546
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
    object btnPrint: TBitBtn
      Left = 468
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 629
    Height = 236
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 2
    object Label3: TLabel
      Left = 40
      Top = 16
      Width = 64
      Height = 16
      Caption = #20998#26426#21495#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 54
      Width = 80
      Height = 16
      Caption = #36890#35805#27425#25968#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 56
      Top = 92
      Width = 48
      Height = 16
      Caption = #35805#36153#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 40
      Top = 131
      Width = 64
      Height = 16
      Caption = #38468#21152#36153#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 40
      Top = 169
      Width = 64
      Height = 16
      Caption = #26381#21153#36153#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 40
      Top = 208
      Width = 64
      Height = 16
      Caption = #24635#36153#29992#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 312
      Top = 54
      Width = 48
      Height = 16
      Caption = #24066#35805#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 312
      Top = 92
      Width = 48
      Height = 16
      Caption = #20892#35805#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 312
      Top = 131
      Width = 48
      Height = 16
      Caption = #22269#20869#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 312
      Top = 169
      Width = 48
      Height = 16
      Caption = #22269#38469#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 312
      Top = 208
      Width = 48
      Height = 16
      Caption = #21512#35745#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 280
      Top = 16
      Width = 80
      Height = 16
      Caption = #32479#35745#26102#38388#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFjh: TLabel
      Left = 120
      Top = 16
      Width = 36
      Height = 16
      Caption = 'lblFjh'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTjsj: TLabel
      Left = 376
      Top = 16
      Width = 40
      Height = 16
      Caption = 'lblTjsj'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblThcs: TLabel
      Left = 120
      Top = 54
      Width = 47
      Height = 16
      Caption = 'lblThcs'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHf: TLabel
      Left = 120
      Top = 92
      Width = 30
      Height = 16
      Caption = 'lblHf'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFjf: TLabel
      Left = 120
      Top = 131
      Width = 32
      Height = 16
      Caption = 'lblFjf'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFwf: TLabel
      Left = 120
      Top = 169
      Width = 38
      Height = 16
      Caption = 'lblFwf'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblZfy: TLabel
      Left = 120
      Top = 208
      Width = 37
      Height = 16
      Caption = 'lblZfy'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSh: TLabel
      Left = 376
      Top = 54
      Width = 33
      Height = 16
      Caption = 'lblSh'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNh: TLabel
      Left = 376
      Top = 92
      Width = 34
      Height = 16
      Caption = 'lblNh'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGn: TLabel
      Left = 376
      Top = 131
      Width = 34
      Height = 16
      Caption = 'lblGn'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGj: TLabel
      Left = 376
      Top = 169
      Width = 30
      Height = 16
      Caption = 'lblGj'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHj: TLabel
      Left = 376
      Top = 208
      Width = 30
      Height = 16
      Caption = 'lblHj'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 40
      Width = 609
      Height = 2
      Shape = bsBottomLine
    end
    object Bevel2: TBevel
      Left = 272
      Top = 8
      Width = 3
      Height = 222
      Shape = bsLeftLine
    end
    object Bevel3: TBevel
      Left = 8
      Top = 198
      Width = 609
      Height = 2
      Shape = bsBottomLine
    end
  end
  object qryWork: TQuery
    DatabaseName = 'LFHOTELUSER'
    Left = 448
    Top = 16
  end
end
