object input: Tinput
  Left = 189
  Top = 221
  Width = 722
  Height = 480
  Caption = #36827#36135#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 32
    Top = 400
    Width = 56
    Height = 13
    AutoSize = False
    Caption = #21512#35745#37329#39069
  end
  object Label6: TLabel
    Left = 232
    Top = 400
    Width = 73
    Height = 13
    AutoSize = False
    Caption = #19981#21547#31246#37329#39069
  end
  object Label7: TLabel
    Left = 456
    Top = 400
    Width = 32
    Height = 13
    AutoSize = False
    Caption = #31246#39069
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 705
    Height = 89
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36827#36135#26085#26399
    end
    object Label2: TLabel
      Left = 216
      Top = 16
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #21046#21333#20154
    end
    object Label3: TLabel
      Left = 400
      Top = 16
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #19994#21153#21592
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20379#36135#21830
    end
    object Edit1: TEdit
      Left = 80
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 264
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 448
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object ComboBox2: TComboBox
      Left = 80
      Top = 48
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnDropDown = ComboBox2DropDown
    end
    object Edit3: TEdit
      Left = 224
      Top = 48
      Width = 329
      Height = 21
      Enabled = False
      TabOrder = 4
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 144
    Width = 713
    Height = 217
    ColCount = 11
    RowCount = 21
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    TabOrder = 1
    OnDblClick = StringGrid1DblClick
    OnMouseDown = StringGrid1MouseDown
    OnSelectCell = StringGrid1SelectCell
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object ComboBox3: TComboBox
    Left = 616
    Top = 320
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Visible = False
    OnSelect = ComboBox3Select
  end
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 121
    Height = 25
    Caption = #20445#23384#36827#36135#21333
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 96
    Top = 400
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 312
    Top = 400
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object Edit6: TEdit
    Left = 496
    Top = 400
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object Button2: TButton
    Left = 160
    Top = 8
    Width = 121
    Height = 25
    Caption = #26174#31034#36827#36135#21333#25253#34920
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 8
    Width = 129
    Height = 25
    Caption = #25171#21360#36827#36135#21333#24182#35760#24080
    TabOrder = 8
    OnClick = Button3Click
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '#22995#21517' from '#29992#25143#28165#21333)
    Left = 624
    Top = 48
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    Parameters = <>
    Left = 656
    Top = 48
  end
end
