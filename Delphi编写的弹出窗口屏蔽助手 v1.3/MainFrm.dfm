object Form1: TForm1
  Left = 280
  Top = 195
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'NotTroubleMe '#21035#28902#25105' (1.3)'
  ClientHeight = 376
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 9
    Top = 8
    Width = 396
    Height = 24
    Caption = 'NotTroubleMe '#21487#20197#31105#27490#24377#20986#26576#20123#20851#20110'ActiveX'#35748#35777#30340#23545#35805#26694'. '#24403#28982#20320#20063#21487#20197#24377#20986#36825#20123#23545#35805#26694'('#19981#36873#20013#21363#21487').'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 9
    Top = 40
    Width = 48
    Height = 12
    Caption = 'E-mail: '
  end
  object Label3: TLabel
    Left = 55
    Top = 40
    Width = 84
    Height = 12
    Cursor = crHandPoint
    Caption = 'aspcat@163.com'
    OnClick = Label3Click
    OnMouseMove = Label3MouseMove
    OnMouseLeave = Label3MouseLeave
  end
  object ListAdd: TButton
    Left = 8
    Top = 344
    Width = 50
    Height = 25
    Caption = #26032#24314
    TabOrder = 0
    OnClick = ListAddClick
  end
  object ListEdit: TButton
    Left = 60
    Top = 344
    Width = 50
    Height = 25
    Caption = #32534#36753
    Enabled = False
    TabOrder = 1
    OnClick = ListEditClick
  end
  object ListDel: TButton
    Left = 112
    Top = 344
    Width = 50
    Height = 25
    Caption = #21024#38500
    Enabled = False
    TabOrder = 2
    OnClick = ListDelClick
  end
  object UpDown1: TUpDown
    Left = 168
    Top = 340
    Width = 16
    Height = 33
    Max = 200
    ParentShowHint = False
    Position = 100
    ShowHint = False
    TabOrder = 3
    Thousands = False
    OnClick = UpDown1Click
  end
  object ListAll: TButton
    Left = 192
    Top = 344
    Width = 50
    Height = 25
    Caption = #20840#36873
    TabOrder = 4
    OnClick = ListAllClick
  end
  object OK: TButton
    Left = 308
    Top = 344
    Width = 50
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
    OnClick = OKClick
  end
  object Cancel: TButton
    Left = 360
    Top = 344
    Width = 50
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    OnClick = CancelClick
  end
  object ListView1: TListView
    Left = 9
    Top = 64
    Width = 400
    Height = 273
    Hint = #36873#20013#21518#21487#32534#36753#12289#21024#38500#12289#19978#19979#31227#21160#21517#31216#20540
    BevelInner = bvLowered
    Checkboxes = True
    Columns = <
      item
        Caption = #21517#31216
        Width = 140
      end
      item
        Caption = 'CLSID'#20540
        Width = 240
      end>
    ColumnClick = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    ViewStyle = vsReport
    OnDblClick = ListEditClick
    OnSelectItem = ListView1SelectItem
  end
  object ListunAll: TButton
    Left = 248
    Top = 344
    Width = 50
    Height = 25
    Caption = #20840#19981#36873
    TabOrder = 8
    OnClick = ListunAllClick
  end
end
