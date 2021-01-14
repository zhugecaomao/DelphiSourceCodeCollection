object fraTechInfoBase: TfraTechInfoBase
  Left = 0
  Top = 0
  Width = 443
  Height = 277
  Align = alClient
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Panel6: TPanel
    Left = 0
    Top = 249
    Width = 443
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel7: TPanel
      Left = 188
      Top = 1
      Width = 254
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 0
      object navTechInfo: TCSDBNavigator
        Left = 102
        Top = 2
        Width = 150
        Height = 22
        DataSource = TechInfod
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        TabOrder = 0
        Captions.Strings = (
          #26368#21069
          #21518#36864
          #21069#36827
          #26368#21518
          #28155#21152
          #21024#38500
          #20462#25913
          #30830#35748
          #21462#28040
          #21047#26032)
      end
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 443
    Height = 249
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
  end
  object TechInfo: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = TechInfoAfterInsert
    Parameters = <>
    Left = 432
    Top = 275
  end
  object TechInfod: TDataSource
    DataSet = TechInfo
    Left = 460
    Top = 275
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 328
    Top = 364
  end
end
