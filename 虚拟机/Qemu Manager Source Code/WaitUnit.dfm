object Wait: TWait
  Left = 254
  Top = 270
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Please Wait'
  ClientHeight = 52
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 20
  object WaitTxt: TTntLabel
    Left = 49
    Top = 14
    Width = 482
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = 'One Moment Please......'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
