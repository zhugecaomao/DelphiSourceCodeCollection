inherited frmPrintOneOrMore: TfrmPrintOneOrMore
  Left = 218
  Top = 158
  Caption = #25171#21360
  ClientHeight = 134
  ClientWidth = 270
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 270
    Height = 134
    inherited Panel_button: TPanel
      Top = 80
      Width = 270
      inherited Bevel_button: TBevel
        Width = 249
      end
      inherited OKBtn: TDsFancyButton
        Left = 46
        OnClick = OKBtnClick
      end
      inherited CancelBtn: TDsFancyButton
        Left = 144
      end
    end
    object rOne: TRadioButton
      Left = 40
      Top = 24
      Width = 185
      Height = 17
      Caption = #25171#21360#24403#21069#25152#36873#25321#30340#35760#24405
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rMore: TRadioButton
      Left = 40
      Top = 48
      Width = 161
      Height = 17
      Caption = #25171#21360#25152#26597#35810#21040#30340#25152#39069#35760#24405
      TabOrder = 2
    end
  end
end
