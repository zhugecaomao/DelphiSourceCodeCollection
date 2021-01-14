object Form3: TForm3
  Left = 238
  Top = 196
  Width = 430
  Height = 407
  Caption = #21697#21517#31649#29702
  Color = 12711880
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    422
    373)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 64
    Top = 64
    Width = 280
    Height = 14
    Caption = '  '#28155#21152'   '#21024#38500'   '#20462#25913'   '#30830#35748'   '#21462#28040'  '#21047#26032
  end
  object Label2: TLabel
    Left = 30
    Top = 22
    Width = 42
    Height = 14
    Caption = #21697#21517#65306
  end
  object Label3: TLabel
    Left = 272
    Top = 20
    Width = 42
    Height = 14
    Caption = #21333#20215#65306
  end
  object Label4: TLabel
    Left = 397
    Top = 21
    Width = 14
    Height = 14
    Caption = #20803
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 120
    Width = 385
    Height = 243
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = #21697#21517
        PickList.Strings = (
          '23445'
          '345'
          '345')
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20215
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 79
    Top = 17
    Width = 178
    Height = 22
    DataField = #21697#21517
    DataSource = DataSource1
    TabOrder = 0
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 320
    Top = 16
    Width = 73
    Height = 22
    DataField = #21333#20215
    DataSource = DataSource1
    TabOrder = 1
    OnKeyPress = DBEdit2KeyPress
  end
  object DBNavigator1: TDBNavigator
    Left = 64
    Top = 80
    Width = 294
    Height = 33
    DataSource = DataSource1
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Hints.Strings = (
      'First record'
      'Prior record'
      'Next record'
      'Last record'
      #28155#21152
      #21024#38500
      #20462#25913
      #30830#35748
      #21462#28040
      #21047#26032)
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = DBNavigator1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 168
    Top = 144
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    BeforePost = ADOQuery1BeforePost
    Parameters = <>
    SQL.Strings = (
      'select id,product as '#21697#21517',dj as '#21333#20215' from '#21697#21517' order by product')
    Left = 200
    Top = 144
  end
end
