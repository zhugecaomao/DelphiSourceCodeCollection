object frmBmda_fzlr: TfrmBmda_fzlr
  Left = 304
  Top = 292
  Width = 544
  Height = 375
  Caption = #37096#38376#26723#26696
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 310
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 532
      Height = 306
      Align = alClient
      DataSource = dsBMDA
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGridTitleClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DepCode'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #37096#38376#32534#30721
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DepName'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #37096#38376#21517#31216
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'Admin'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #36127#36131#20154#22995#21517
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DepAttr'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #37096#38376#23646#24615
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'Tel'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #32852#31995#30005#35805
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'Postion'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #22320#22336
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'Memo'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 310
    Width = 536
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 394
      Top = 5
      Width = 59
      Height = 22
      Caption = #30830#23450
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 466
      Top = 5
      Width = 59
      Height = 22
      Caption = #21462#28040
      Flat = True
      OnClick = SpeedButton2Click
    end
  end
  object dsBMDA: TDataSource
    DataSet = aqBMDA
    Left = 80
    Top = 48
  end
  object aqBMDA: TADOQuery
    Active = True
    Connection = dmWarehouse.ACWarehouse
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from BMDA order by DepCode')
    Left = 144
    Top = 56
  end
end
