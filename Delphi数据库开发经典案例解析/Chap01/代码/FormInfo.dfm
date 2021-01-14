object Info: TInfo
  Left = 266
  Top = 180
  Width = 705
  Height = 332
  Caption = #36164#26009#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 352
    Top = 3
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #21830#21697#25340#38899
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 689
    Height = 241
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 424
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 552
    Top = 0
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 3
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 8
    object N1: TMenuItem
      Caption = #36164#26009#31649#29702
      object N2: TMenuItem
        Caption = #21830#21697#36164#26009#32500#25252
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #20379#36135#21830#36164#26009#32500#25252
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #23458#25143#36164#26009#32500#25252
        OnClick = N4Click
      end
    end
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 272
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 248
  end
end
