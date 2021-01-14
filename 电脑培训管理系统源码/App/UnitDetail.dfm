inherited frmDetail: TfrmDetail
  Left = 199
  Top = 149
  Caption = 'frmDetail'
  ClientHeight = 327
  ClientWidth = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 477
    Height = 327
    inherited Panel_button: TPanel
      Top = 273
      Width = 477
      TabOrder = 1
      inherited Bevel_button: TBevel
        Width = 457
        Anchors = [akLeft, akTop, akRight]
      end
      inherited OKBtn: TDsFancyButton
        Top = 16
        Height = 28
        OnClick = OKBtnClick
      end
      object Button1: TButton
        Left = 40
        Top = 62
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
      end
    end
    object DBMemo1: TDBMemo
      Left = 0
      Top = 0
      Width = 477
      Height = 273
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
