inherited BaseDialogFrm: TBaseDialogFrm
  Left = 192
  Top = 210
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'BaseDialogFrm'
  ClientHeight = 253
  ClientWidth = 405
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 405
    Height = 253
    object Panel_button: TPanel
      Left = 0
      Top = 199
      Width = 405
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Bevel_button: TBevel
        Left = 8
        Top = 1
        Width = 385
        Height = 2
      end
      object OKBtn: TDsFancyButton
        Left = 134
        Top = 15
        Width = 81
        Height = 29
        Cursor = crHandPoint
        ButtonColor = clBtnFace
        Caption = #30830#23450'[&O]'
        FrameColor = clGray
        FrameWidth = 6
        CornerRadius = 3
        TextStyle = txRaised
      end
      object CancelBtn: TDsFancyButton
        Left = 224
        Top = 15
        Width = 80
        Height = 29
        Cursor = crHandPoint
        ButtonColor = clBtnFace
        Caption = #21462#28040'[&C]'
        FrameColor = clGray
        FrameWidth = 6
        CornerRadius = 3
        TextStyle = txRaised
        OnClick = CancelBtnClick
      end
    end
  end
end
