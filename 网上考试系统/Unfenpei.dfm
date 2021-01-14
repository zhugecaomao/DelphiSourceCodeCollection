object fenpeifrm: Tfenpeifrm
  Left = -17
  Top = 126
  Width = 801
  Height = 517
  Caption = #20998#37197#26426#22120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    AutoSize = False
    Caption = #24453#20998#37197#32771#29983
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 480
    Top = 8
    Width = 65
    Height = 25
    AutoSize = False
    Caption = #32771#22330#36164#26009
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 24
    Width = 417
    Height = 449
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
        FieldName = #20934#32771#35777#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36523#20221#35777#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24615#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20303#22336
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 472
    Top = 24
    Width = 320
    Height = 449
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #26426#22120#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20934#32771#35777#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = #26426#22120#29366#24577
        Width = 58
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 424
    Top = 24
    Width = 49
    Height = 449
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 88
      Width = 33
      Height = 33
      Hint = #20998#37197
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 136
      Width = 33
      Height = 33
      Hint = #25764#38144#20998#37197
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.CDSStudent
    Left = 88
    Top = 120
  end
  object DataSource2: TDataSource
    DataSet = DataModule1.CDSInformation
    Left = 520
    Top = 80
  end
end
