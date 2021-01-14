inherited frmEditUserLogin: TfrmEditUserLogin
  Left = 359
  Top = 310
  Caption = #30331#24405#20449#24687
  ClientHeight = 253
  ClientWidth = 345
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited suiForm: TsuiForm
    Width = 345
    Height = 253
    Caption = #30331#24405#20449#24687
    object Label1: TLabel
      Left = 80
      Top = 56
      Width = 36
      Height = 13
      Caption = #30331#24405#21517
      Transparent = True
    end
    object Label2: TLabel
      Left = 92
      Top = 118
      Width = 24
      Height = 13
      Caption = #23494#30721
      Transparent = True
    end
    object Label3: TLabel
      Left = 68
      Top = 149
      Width = 48
      Height = 13
      Caption = #30830#35748#23494#30721
      Transparent = True
    end
    object Label4: TLabel
      Left = 92
      Top = 87
      Width = 24
      Height = 13
      Caption = #25551#36848
      Transparent = True
    end
    object chkEnabled: TCheckBox
      Left = 136
      Top = 176
      Width = 68
      Height = 17
      Caption = #26159#21542#26377#25928
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object edtUserLoginId: TEdit
      Left = 136
      Top = 52
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtDescription: TEdit
      Left = 136
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtPassword: TEdit
      Left = 136
      Top = 114
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
    end
    object edtPassword1: TEdit
      Left = 136
      Top = 145
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 5
    end
    object btnSave: TsuiButton
      Left = 86
      Top = 200
      Width = 80
      Height = 25
      Caption = #20445#23384
      AutoSize = False
      UIStyle = BlueGlass
      TabOrder = 6
      Transparent = True
      ModalResult = 0
      FocusedRectMargin = 2
      Layout = blGlyphLeft
      Spacing = 4
      MouseContinuouslyDownInterval = 100
      OnClick = btnSaveClick
      ResHandle = 0
    end
    object btnCancel: TsuiButton
      Left = 177
      Top = 200
      Width = 80
      Height = 25
      Caption = #21462#28040
      AutoSize = False
      UIStyle = BlueGlass
      TabOrder = 7
      Transparent = True
      ModalResult = 0
      FocusedRectMargin = 2
      Layout = blGlyphLeft
      Spacing = 4
      MouseContinuouslyDownInterval = 100
      OnClick = btnCancelClick
      ResHandle = 0
    end
  end
end
