inherited frmComDczl: TfrmComDczl
  Height = 566
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter1: TSplitter [0]
    Left = 388
    Top = 83
    Width = 4
    Height = 437
    Cursor = crHSplit
    Align = alRight
    Beveled = True
  end
  inherited DBGrid1: TDBGrid
    Width = 388
    Height = 437
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnEnter = DBGrid1Enter
    OnExit = DBGrid1Exit
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar1: TToolBar
      Width = 533
      object ToolButton2: TToolButton
        Left = 472
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object btnDetail: TToolButton
        Left = 480
        Top = 0
        Action = aDetail
        Caption = '明细'
      end
    end
  end
  object pnlDetail: TPanel [4]
    Left = 392
    Top = 83
    Width = 398
    Height = 437
    Align = alRight
    BevelOuter = bvNone
    Caption = 'pnlDetail'
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 398
      Height = 437
      Align = alClient
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = '宋体'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = aModifyExecute
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object LineE4: TMenuItem
        Caption = '-'
      end
      object smnDetail: TMenuItem
        Action = aDetail
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N6: TMenuItem
      Caption = '-'
    end
    object pmnDetail: TMenuItem
      Action = aDetail
    end
  end
  inherited ActionList1: TActionList
    object aDetail: TAction
      Caption = '明细资料(&I)'
      Checked = True
      ImageIndex = 23
      ShortCut = 16457
      OnExecute = aDetailExecute
    end
  end
end
