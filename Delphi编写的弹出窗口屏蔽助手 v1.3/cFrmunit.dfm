object Form2: TForm2
  Left = 293
  Top = 282
  Width = 400
  Height = 96
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #23646#24615
  Color = clBtnFace
  UseDockManager = True
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 14
    Top = 8
    Width = 36
    Height = 12
    Caption = #21517#31216#65306
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 42
    Height = 12
    Caption = 'CLSID'#65306
    Layout = tlCenter
  end
  object Edit1: TEdit
    Left = 48
    Top = 4
    Width = 265
    Height = 20
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 48
    Top = 36
    Width = 265
    Height = 20
    TabOrder = 1
  end
  object Button1: TButton
    Left = 320
    Top = 4
    Width = 57
    Height = 20
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 36
    Width = 57
    Height = 20
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
end
