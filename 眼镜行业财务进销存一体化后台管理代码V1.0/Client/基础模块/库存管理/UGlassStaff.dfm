inherited fmGlassStaff: TfmGlassStaff
  Caption = #38236#29255#24211#23384#20998#24067
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 119
    inherited Label1: TLabel
      Width = 161
      Caption = #38236#29255#24211#23384#19968#35272#34920
    end
    inherited Label2: TLabel
      Left = 216
      Visible = False
    end
    inherited cmbtop: TComboBox
      Left = 280
      Visible = False
    end
    inherited Panel4: TPanel
      Top = 33
      inherited Label5: TLabel
        Left = 168
      end
      inherited Label6: TLabel
        Left = 421
        Top = 39
      end
      inherited CBType: TComboBox
        Color = clWindow
        ItemIndex = 0
        Text = #38236#29255
        Items.Strings = (
          #38236#29255)
      end
      inherited ckbtype: TCheckBox
        Checked = True
        State = cbChecked
      end
      inherited cbamount: TCheckBox
        Left = 11
        Visible = False
      end
      inherited edtamount: TEdit
        Left = 83
        Width = 66
        Visible = False
      end
      inherited cbball: TCheckBox
        Left = 11
      end
      inherited edtBbegin: TEdit
        Left = 89
      end
      inherited edtBEND: TEdit
        Left = 183
      end
      inherited cbpoll: TCheckBox
        Left = 266
        Top = 38
      end
      inherited EDTPBEGIN: TEdit
        Left = 339
        Top = 36
      end
      inherited EDTPEND: TEdit
        Left = 441
        Top = 36
      end
      inherited cbnroms: TCheckBox
        Left = 530
        Top = 35
      end
      inherited EDTNORMS: TEdit
        Left = 605
        Top = 34
        Width = 122
      end
      inherited Cbmstorage: TCheckBox
        Top = 61
      end
      inherited cmbmstorage: TComboBox
        Top = 59
      end
      inherited cbstorages: TCheckBox
        Left = 202
        Top = 61
      end
      inherited cmbstorages: TComboBox
        Left = 279
        Top = 59
      end
    end
  end
  inherited Panel2: TPanel
    Top = 119
    Height = 326
    inherited DBGrid1: TDBGrid
      Height = 326
      Visible = False
    end
    inherited StringGrid1: TStringGrid
      Height = 326
      ColCount = 42
      RowCount = 43
      Visible = True
      ColWidths = (
        64
        56
        56
        62
        63
        56
        52
        51
        52
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
  end
  inherited Panel3: TPanel
    inherited BitBtn1: TBitBtn
      Left = 507
      Top = 9
    end
    inherited BitBtn2: TBitBtn
      Left = 581
      Top = 9
      OnClick = BitBtn3Click
    end
    inherited BitBtn3: TBitBtn
      Left = 16
      Visible = False
    end
    inherited btnpagedown: TBitBtn
      Left = 113
      Visible = False
    end
    inherited btnprint: TBitBtn
      Left = 432
      Top = 9
    end
  end
  inherited PopupMenu2: TPopupMenu
    inherited N3: TMenuItem
      Caption = #26174#31034'6.00'
    end
    inherited N4: TMenuItem
      Caption = #26174#31034'10.00'
    end
  end
end
