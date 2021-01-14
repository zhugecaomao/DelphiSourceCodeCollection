inherited TdSelForm: TTdSelForm
  Left = 215
  Top = 127
  ClientHeight = 373
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 392
    Height = 261
    inherited dbgSelect: TDBGrid
      Width = 372
      Height = 241
      Color = clMoneyGreen
      FixedColor = clGradientActiveCaption
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      OnDblClick = dbgSelectDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #22242#38431#21517#31216
          Width = 300
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 392
    inherited lblTitle: TLabel
      Left = 145
      Caption = #36873#25321#22242#38431
    end
    inherited Image1: TImage
      Left = 104
    end
    inherited cmbOption: TComboBox
      ItemIndex = 0
      Text = #21517#31216
      Items.Strings = (
        #21517#31216)
    end
  end
  inherited Panel3: TPanel
    Top = 338
    Width = 392
    inherited btnOK: TBitBtn
      Left = 227
    end
    inherited btnCanc: TBitBtn
      Left = 307
    end
  end
  inherited qrySelect: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRXX where D_KRLX="T"')
  end
  inherited dsSelect: TDataSource
    OnDataChange = dsSelectDataChange
  end
end
