inherited frmComDczb: TfrmComDczb
  Caption = 'frmComDczb'
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    TabOrder = 2
  end
  inherited ControlBar1: TControlBar
    TabOrder = 3
  end
  inherited pnlDetail: TPanel
    TabOrder = 1
    OnExit = pnlDetailExit
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object smnView: TMenuItem [3]
        Action = aView
      end
    end
  end
  inherited ActionList1: TActionList
    object aView: TAction [7]
      Caption = '²é¿´(&V)'
      ImageIndex = 9
      OnExecute = aViewExecute
    end
  end
end
