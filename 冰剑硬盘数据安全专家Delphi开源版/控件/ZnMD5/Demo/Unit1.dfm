object Form1: TForm1
  Left = 288
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ZnMd5 - Demo'
  ClientHeight = 76
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Edit1: TEdit
    Left = 15
    Top = 10
    Width = 226
    Height = 20
    TabOrder = 0
    Text = #23545#26412#28436#31034#31243#24207#36827#34892'Md5'#36816#31639
  end
  object Button1: TButton
    Left = 250
    Top = 8
    Width = 65
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button1Click
  end
  object PBar1: TProgressBar
    Left = 15
    Top = 40
    Width = 300
    Height = 16
    TabOrder = 2
  end
  object znMD51: TznMD5
    OnEnd = znMD51End
    OnBegin = znMD51Begin
    OnProcess = znMD51Process
    Left = 14
    Top = 40
  end
end
