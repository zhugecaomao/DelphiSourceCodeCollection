inherited dlgpriceselect: Tdlgpriceselect
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TGroupBox
    Height = 213
    inherited Cbstorage: TCheckBox
      Visible = False
    end
    inherited Edtstorage: TEdit
      Visible = False
    end
    inherited cbamount: TCheckBox
      Top = 167
    end
    inherited edtamount: TEdit
      Top = 164
    end
    object cbdateprice: TCheckBox
      Left = 10
      Top = 192
      Width = 74
      Height = 17
      Caption = #26368#36817#36827#20215
      TabOrder = 16
      OnClick = cbdatepriceClick
    end
    object edtdateprice: TEdit
      Left = 91
      Top = 189
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 17
    end
    object cbbaseprice: TCheckBox
      Left = 10
      Top = 216
      Width = 74
      Height = 17
      Caption = #25104#26412#22343#20215
      TabOrder = 18
      OnClick = cbbasepriceClick
    end
    object edtbaseprice: TEdit
      Left = 91
      Top = 213
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 19
    end
  end
end
