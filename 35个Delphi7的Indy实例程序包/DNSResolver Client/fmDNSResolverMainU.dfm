object Form1: TForm1
  Left = 201
  Top = 134
  Width = 750
  Height = 453
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    742
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = 'DNS Server:'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 28
    Height = 13
    Caption = 'Query'
  end
  object gbRequests: TGroupBox
    Left = 8
    Top = 56
    Width = 721
    Height = 137
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Requests'
    TabOrder = 4
    object Label3: TLabel
      Left = 24
      Top = 96
      Width = 116
      Height = 13
      Caption = '(*) Obsolete record types'
    end
    object Label4: TLabel
      Left = 144
      Top = 96
      Width = 138
      Height = 13
      Caption = '(**) Experimental record types'
    end
    object lWarning: TLabel
      Left = 120
      Top = 34
      Width = 362
      Height = 13
      Caption = 
        'WARNING! Few DNS server supports DNS queries for more than one r' +
        'ecord'
    end
    object rbRecord: TRadioButton
      Left = 8
      Top = 32
      Width = 109
      Height = 17
      Caption = 'Specific record(s)'
      TabOrder = 0
      OnClick = rbRecordClick
    end
    object cbA: TCheckBox
      Left = 24
      Top = 48
      Width = 97
      Height = 17
      Caption = 'A record'
      TabOrder = 1
      OnClick = cbAClick
    end
    object cbNS: TCheckBox
      Left = 24
      Top = 64
      Width = 97
      Height = 17
      Caption = 'NS record'
      TabOrder = 2
      OnClick = cbAClick
    end
    object cbMD: TCheckBox
      Left = 24
      Top = 80
      Width = 97
      Height = 17
      Caption = '*MD record'
      TabOrder = 3
      OnClick = cbAClick
    end
    object cbName: TCheckBox
      Left = 144
      Top = 48
      Width = 97
      Height = 17
      Caption = 'NAME record'
      TabOrder = 4
      OnClick = cbAClick
    end
    object cbSOA: TCheckBox
      Left = 144
      Top = 64
      Width = 97
      Height = 17
      Caption = 'SOA record'
      TabOrder = 5
      OnClick = cbAClick
    end
    object cbMB: TCheckBox
      Left = 144
      Top = 80
      Width = 97
      Height = 17
      Caption = '**MB record'
      TabOrder = 6
      OnClick = cbAClick
    end
    object cbMG: TCheckBox
      Left = 248
      Top = 48
      Width = 97
      Height = 17
      Caption = '**MG record'
      TabOrder = 7
      OnClick = cbAClick
    end
    object cbMR: TCheckBox
      Left = 248
      Top = 64
      Width = 97
      Height = 17
      Caption = '**MR record'
      TabOrder = 8
      OnClick = cbAClick
    end
    object cbNULL: TCheckBox
      Left = 248
      Top = 80
      Width = 97
      Height = 17
      Caption = '**RR record'
      TabOrder = 9
      OnClick = cbAClick
    end
    object cbWKS: TCheckBox
      Left = 352
      Top = 48
      Width = 97
      Height = 17
      Caption = 'WKS record'
      TabOrder = 10
      OnClick = cbAClick
    end
    object cbPTR: TCheckBox
      Left = 352
      Top = 64
      Width = 97
      Height = 17
      Caption = 'PTR record'
      TabOrder = 11
      OnClick = cbAClick
    end
    object cbHINFO: TCheckBox
      Left = 352
      Top = 80
      Width = 97
      Height = 17
      Caption = 'HINFO record'
      TabOrder = 12
      OnClick = cbAClick
    end
    object cbMINFO: TCheckBox
      Left = 464
      Top = 48
      Width = 97
      Height = 17
      Caption = 'MINFO record'
      TabOrder = 13
      OnClick = cbAClick
    end
    object cbMX: TCheckBox
      Left = 464
      Top = 64
      Width = 97
      Height = 17
      Caption = 'MX record'
      TabOrder = 14
      OnClick = cbAClick
    end
    object cbTXT: TCheckBox
      Left = 464
      Top = 80
      Width = 97
      Height = 17
      Caption = 'TXT record'
      TabOrder = 15
      OnClick = cbAClick
    end
    object rbAll: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'All records'
      Checked = True
      TabOrder = 16
      TabStop = True
      OnClick = rbAllClick
    end
    object cbMF: TCheckBox
      Left = 568
      Top = 48
      Width = 97
      Height = 17
      Caption = '*MF record'
      TabOrder = 17
      OnClick = cbAClick
    end
  end
  object btnRun: TButton
    Left = 8
    Top = 200
    Width = 75
    Height = 25
    Action = acRun
    TabOrder = 0
  end
  object memoResult: TMemo
    Left = 8
    Top = 232
    Width = 721
    Height = 177
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object edDNS: TEdit
    Left = 72
    Top = 5
    Width = 657
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object edQuery: TEdit
    Left = 72
    Top = 32
    Width = 657
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object IdDNSResolver: TIdDNSResolver
    Port = 53
    ReceiveTimeout = 4000
    QueryRecords = []
    Left = 624
    Top = 72
  end
  object ActionList1: TActionList
    Left = 688
    Top = 72
    object acUpdateQueryParams: TAction
      OnExecute = acUpdateQueryParamsExecute
    end
    object acRun: TAction
      Caption = '&Run'
      OnExecute = acRunExecute
    end
  end
end
