object frmStaticBase: TfrmStaticBase
  Left = 192
  Top = 133
  Width = 696
  Height = 480
  Caption = 'frmStaticBase'
  Color = clGradientActiveCaption
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 688
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 605
      Top = 2
      Width = 81
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnClose: TBitBtn
        Left = 4
        Top = 2
        Width = 75
        Height = 22
        Caption = #20851#38381'(&C)'
        TabOrder = 0
        OnClick = bbtnCloseClick
      end
    end
  end
end
