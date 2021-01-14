inherited S_SingleDBEdit: TS_SingleDBEdit
  Left = 322
  Top = 279
  Caption = 'S_SingleDBEdit'
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel [0]
    Left = 0
    Top = 44
    Width = 872
    Height = 529
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 10089158
    TabOrder = 1
    object DBEdit1: TDBEdit
      Left = 16
      Top = 16
      Width = 121
      Height = 20
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  inherited ToolBar1: TToolBar
    inherited SB6: TSpeedButton
      Width = 81
    end
  end
  inherited DataSource1: TDataSource
    OnStateChange = DataSource1StateChange
    Left = 528
    Top = 104
  end
  inherited Qry1: TQuery
    Left = 472
    Top = 56
  end
end
