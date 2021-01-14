object bran: Tbran
  Left = 204
  Top = 213
  Width = 361
  Height = 386
  Caption = #37096#38376#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 65
    Caption = #21517#31216
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 305
      Height = 20
      MaxLength = 50
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 200
    Width = 337
    Height = 121
    Caption = #35828#26126
    TabOrder = 1
    object Memo1: TMemo
      Left = 16
      Top = 24
      Width = 305
      Height = 81
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 184
    Top = 328
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 328
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 80
    Width = 337
    Height = 113
    Caption = #20687#24449#22270#26631
    TabOrder = 4
    object ListView1: TListView
      Left = 16
      Top = 24
      Width = 305
      Height = 65
      Columns = <>
      HotTrack = True
      IconOptions.Arrangement = iaLeft
      IconOptions.AutoArrange = True
      Items.Data = {
        C50000000900000000000000FFFFFFFFFFFFFFFF000000000000000000010000
        00FFFFFFFFFFFFFFFF00000000000000000002000000FFFFFFFFFFFFFFFF0000
        0000000000000003000000FFFFFFFFFFFFFFFF00000000000000000004000000
        FFFFFFFFFFFFFFFF00000000000000000005000000FFFFFFFFFFFFFFFF000000
        00000000000006000000FFFFFFFFFFFFFFFF00000000000000000007000000FF
        FFFFFFFFFFFFFF00000000000000000008000000FFFFFFFFFFFFFFFF00000000
        0000000000}
      LargeImages = Main.Branchimage
      ReadOnly = True
      TabOrder = 0
    end
  end
end
