inherited YdxxSelForm: TYdxxSelForm
  ClientHeight = 423
  ClientWidth = 512
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Top = 76
    Width = 512
    Height = 309
    Anchors = [akLeft, akRight]
    inherited dbgSelect: TDBGrid
      Width = 492
      Height = 289
      Color = clWhite
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
          Title.Caption = #22995#21517#25110#21333#20301
          Width = 200
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DWMC'
          Title.Alignment = taCenter
          Title.Caption = #23545#26041#32852#31995#20154
          Width = 140
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LXR'
          Title.Alignment = taCenter
          Title.Caption = #23486#39302#32852#31995#20154
          Width = 100
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 512
    Height = 76
    inherited lblTitle: TLabel
      Left = 189
      Width = 156
      Caption = #39044#23450#20154#36873#25321
    end
    inherited Image1: TImage
      Left = 130
    end
    inherited cmbOption: TComboBox
      Top = 49
      ItemIndex = 0
      Text = #22995#21517#25110#21333#20301
      Items.Strings = (
        #22995#21517#25110#21333#20301
        #23545#26041#32852#31995#20154)
    end
    inherited cmbExpress: TComboBox
      Top = 49
    end
    inherited edtValue: TEdit
      Top = 49
    end
    inherited btnLoca: TBitBtn
      Top = 46
      OnClick = btnLocaClick
    end
    object CheckBox1: TCheckBox
      Left = 392
      Top = 52
      Width = 97
      Height = 17
      Caption = #20170#26085#39044#23450#20154
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
  end
  inherited Panel3: TPanel
    Top = 385
    Width = 512
    Height = 38
    inherited btnOK: TBitBtn
      Left = 347
      Top = 8
    end
    inherited btnCanc: TBitBtn
      Left = 427
      Top = 8
    end
    object btnNew: TBitBtn
      Left = 10
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #26032#22686'(&N)'
      TabOrder = 2
      OnClick = btnNewClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
    end
  end
  inherited qrySelect: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YDXX order by D_KRBH')
  end
  inherited dsSelect: TDataSource
    OnDataChange = dsSelectDataChange
  end
end
