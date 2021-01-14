inherited SelectDirForm: TSelectDirForm
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = #36873#25321
  ClientHeight = 253
  ClientWidth = 320
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 320
    inherited lblTitile: TLabel
      Left = 90
      Width = 125
      Caption = #36873#25321#36335#24452
    end
    inherited Image1: TImage
      Left = 44
    end
  end
  inherited Panel2: TPanel
    Width = 320
    Height = 176
    inherited Bevel1: TBevel
      Width = 310
      Height = 166
    end
    object Edit1: TEdit
      Left = 16
      Top = 144
      Width = 289
      Height = 20
      TabOrder = 0
    end
    object stvPath: TShellTreeView
      Left = 16
      Top = 16
      Width = 289
      Height = 121
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      UseShellImages = True
      AutoRefresh = False
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 1
      OnChange = stvPathChange
    end
  end
  inherited Panel3: TPanel
    Top = 218
    Width = 320
    inherited btnOK: TBitBtn
      Left = 160
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 240
    end
  end
  inherited DosMove1: TDosMove
    Left = 16
  end
end
