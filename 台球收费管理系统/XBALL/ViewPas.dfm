object ViewForm: TViewForm
  Left = 126
  Top = 90
  Width = 604
  Height = 427
  Caption = #27983#35272#27969#27700#24080#25968#25454#31383#21475
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    596
    400)
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 7
    Top = 329
    Width = 582
    Height = 6
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object DBGrid1: TDBGrid
    Left = 15
    Top = 16
    Width = 567
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object Button1: TButton
    Left = 15
    Top = 346
    Width = 81
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #27969#27700#24080#35760#24405
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 102
    Top = 346
    Width = 81
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #37202#27700#35760#24405
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 189
    Top = 346
    Width = 81
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #25130#38047#35760#24405
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button5: TButton
    Left = 505
    Top = 346
    Width = 77
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #36864#20986'(&X)'
    ModalResult = 2
    TabOrder = 4
  end
  object Button4: TButton
    Left = 277
    Top = 346
    Width = 81
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #20250#21592#35760#24405
    TabOrder = 5
    OnClick = Button1Click
  end
  object SB: TStatusBar
    Left = 0
    Top = 381
    Width = 596
    Height = 19
    Font.Charset = GB2312_CHARSET
    Font.Color = clBtnText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Pitch = fpVariable
    Font.Style = []
    Panels = <
      item
        Width = 200
      end
      item
        Alignment = taCenter
        Width = 50
      end>
    SimplePanel = False
    UseSystemFont = False
  end
  object Query1: TQuery
    BeforeDelete = Query1BeforeDelete
    RequestLive = True
    Left = 216
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 248
    Top = 64
  end
end
