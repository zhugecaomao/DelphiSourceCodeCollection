object frmDict: TfrmDict
  Left = 313
  Top = 142
  Width = 432
  Height = 305
  Caption = #23383#20856#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 6
    Width = 62
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #29992#25143#21517':'
  end
  object Label2: TLabel
    Left = 217
    Top = 2
    Width = 72
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #23494#30721#21015#34920':'
  end
  object user_l: TLabel
    Left = 53
    Top = 257
    Width = 62
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object pass_l: TLabel
    Left = 291
    Top = 255
    Width = 62
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object user_list: TMemo
    Left = 12
    Top = 22
    Width = 190
    Height = 230
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Administrator'
      'sa'
      'Guest')
    ParentFont = False
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
    OnChange = user_listChange
  end
  object pass_list: TMemo
    Left = 219
    Top = 20
    Width = 196
    Height = 231
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '1111'
      '123'
      '1234'
      '12345'
      '888888'
      'abcd'
      'pass'
      'internet'
      'password'
      'admin'
      'server'
      'super'
      'root'
      '123456')
    ParentFont = False
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
    OnChange = pass_listChange
  end
  object Button1: TButton
    Left = 181
    Top = 257
    Width = 58
    Height = 20
    Caption = #36864#20986
    TabOrder = 2
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 299
    Top = 1
    Width = 97
    Height = 17
    Caption = #20351#29992#20869#23450#23494#30721
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 105
    object N1: TMenuItem
      Caption = #23548#20837'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #23548#20986'...'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #23548#20837#20849#20139':'#29992#25143#36164#26009
    end
    object N4: TMenuItem
      Caption = #28165#31354
      OnClick = N4Click
    end
  end
end
