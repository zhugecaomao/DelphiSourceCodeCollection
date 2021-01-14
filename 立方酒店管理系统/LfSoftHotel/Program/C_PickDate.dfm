inherited PickDateForm: TPickDateForm
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = #36873#25321
  ClientHeight = 253
  ClientWidth = 342
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 342
    inherited lblTitile: TLabel
      Left = 112
      Width = 125
      Caption = #36873#25321#26085#26399
    end
    inherited Image1: TImage
      Left = 71
    end
    object PrevMonthBtn: TSpeedButton
      Left = 6
      Top = 40
      Width = 20
      Height = 20
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3300333333333333330033333300033333003333330003333300333333000333
        3300333333000333330033333300033333003333330003333300333333000333
        3300333300000003330033333000003333003333330003333300333333303333
        33003333333333333300}
      OnClick = PrevMonthBtnClick
    end
    object NextMonthBtn: TSpeedButton
      Left = 316
      Top = 40
      Width = 20
      Height = 20
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3300333333303333330033333300033333003333300000333300333300000003
        3300333333000333330033333300033333003333330003333300333333000333
        3300333333000333330033333300033333003333330003333300333333000333
        33003333333333333300}
      OnClick = NextMonthBtnClick
    end
    object TitleLabel: TLabel
      Left = 46
      Top = 44
      Width = 257
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'February, 1995'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 342
    Height = 152
    inherited Bevel1: TBevel
      Width = 332
      Height = 142
    end
    object Calendar1: TCalendar
      Left = 5
      Top = 5
      Width = 332
      Height = 142
      Align = alClient
      Color = clInfoBk
      StartOfWeek = 0
      TabOrder = 0
      UseCurrentDate = False
      OnChange = Calendar1Change
    end
  end
  inherited Panel3: TPanel
    Top = 212
    Width = 342
    inherited btnOK: TBitBtn
      Left = 182
      ModalResult = 1
    end
    inherited btnCanc: TBitBtn
      Left = 262
      ModalResult = 2
    end
  end
  inherited DosMove1: TDosMove
    Left = 40
  end
end
