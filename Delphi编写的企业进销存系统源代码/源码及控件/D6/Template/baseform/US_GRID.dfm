inherited S_SingleDBGrid: TS_SingleDBGrid
  Left = 193
  Top = 186
  Caption = 'S_SingleDBGrid'
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel [1]
    Left = 0
    Top = 44
    Width = 872
    Height = 529
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 870
      Height = 527
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'ËÎÌו'
      TitleFont.Style = []
      OnEditButtonClick = DBGrid1EditButtonClick
      OnKeyDown = DBGrid1KeyDown
    end
  end
end
