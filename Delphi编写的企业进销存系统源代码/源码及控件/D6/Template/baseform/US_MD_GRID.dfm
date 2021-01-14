inherited S_MasterDetail_WithGrid: TS_MasterDetail_WithGrid
  Left = 316
  Top = 175
  Caption = 'S_MasterDetail_WithGrid'
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar1: TToolBar
    inherited SB4: TSpeedButton
      Width = 47
      Hint = #32437#21521#25110#27178#21521#25490#21015#34920#26684
      Caption = #27178#21521
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        00003333330FFFFFFFF03399990FFFFFFFF033933300000000003393330BBBBB
        BBB09999930BBBBBBBB039993300000000003393333333333333333333333333
        393300000000003399930BBB0FFFF03999990BBB0FFFF03339330BBB0FFFF033
        39330BBB0FFFF09999330BBB0FFFF03333330000000000333333}
      Layout = blGlyphTop
      Visible = True
      OnClick = SB4Click
    end
    inherited SB6: TSpeedButton
      Left = 609
    end
  end
  inherited Panel1: TPanel
    object Splitter1: TSplitter [0]
      Left = 241
      Top = 1
      Width = 3
      Height = 527
      Cursor = crHSplit
      Beveled = True
    end
    inherited DBGrid1: TDBGrid
      Width = 240
      Align = alLeft
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
    end
    object DBGrid2: TDBGrid
      Left = 244
      Top = 1
      Width = 627
      Height = 527
      Align = alClient
      DataSource = DataSource2
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnEditButtonClick = DBGrid2EditButtonClick
      OnKeyDown = DBGrid2KeyDown
    end
  end
  object Table2: TTable
    BeforePost = Table2BeforePost
    DatabaseName = 'STK0311'
    MasterSource = DataSource1
    Left = 448
    Top = 200
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 488
    Top = 208
  end
end
