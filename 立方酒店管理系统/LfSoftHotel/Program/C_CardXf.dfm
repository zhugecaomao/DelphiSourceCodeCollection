inherited CardXfForm: TCardXfForm
  Left = 169
  Top = 66
  Height = 434
  Caption = #21047#21345
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitile: TLabel
      Width = 156
      Caption = #36149#23486#21345#21047#21345
    end
  end
  inherited Panel2: TPanel
    Height = 330
    inherited Bevel1: TBevel
      Height = 320
    end
    object Label4: TLabel
      Left = 16
      Top = 278
      Width = 36
      Height = 12
      Caption = #35831#36873#25321
    end
    object btnReadCard: TBitBtn
      Left = 16
      Top = 16
      Width = 193
      Height = 73
      Caption = #35835#21345
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnReadCardClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object memRead: TMemo
      Left = 16
      Top = 96
      Width = 193
      Height = 121
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 217
      Top = 16
      Width = 305
      Height = 113
      Caption = ' '#36149#23486#21345#20449#24687' '
      TabOrder = 2
      object edtRCardId: TLabeledEdit
        Left = 16
        Top = 40
        Width = 265
        Height = 20
        Color = cl3DLight
        EditLabel.Width = 60
        EditLabel.Height = 12
        EditLabel.Caption = #36149#23486#21345#21345#21495
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 0
      end
      object edtRCardJe: TLabeledEdit
        Left = 16
        Top = 80
        Width = 265
        Height = 20
        Color = cl3DLight
        EditLabel.Width = 60
        EditLabel.Height = 12
        EditLabel.Caption = #36149#23486#21345#20313#39069
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 217
      Top = 136
      Width = 305
      Height = 177
      Caption = ' '#21047#21345#20449#24687' '
      TabOrder = 3
      object edtXfje: TLabeledEdit
        Left = 16
        Top = 29
        Width = 265
        Height = 20
        Color = cl3DLight
        EditLabel.Width = 48
        EditLabel.Height = 12
        EditLabel.Caption = #28040#36153#37329#39069
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 0
      end
      object edtKcje: TLabeledEdit
        Left = 16
        Top = 67
        Width = 265
        Height = 20
        Color = cl3DLight
        EditLabel.Width = 48
        EditLabel.Height = 12
        EditLabel.Caption = #25187#38500#37329#39069
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 1
      end
      object edtKnye: TLabeledEdit
        Left = 16
        Top = 104
        Width = 265
        Height = 20
        Color = cl3DLight
        EditLabel.Width = 48
        EditLabel.Height = 12
        EditLabel.Caption = #21345#20869#20313#39069
        LabelPosition = lpAbove
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 2
      end
      object edtKrxm: TLabeledEdit
        Left = 16
        Top = 144
        Width = 265
        Height = 20
        EditLabel.Width = 60
        EditLabel.Height = 12
        EditLabel.Caption = #21047#21345#20154#31614#21517
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 3
      end
    end
    object radJzfs: TRadioGroup
      Left = 14
      Top = 224
      Width = 195
      Height = 51
      Caption = ' '#20313#39069#32467#24080#26041#24335' '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080)
      TabOrder = 4
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 14
      Top = 292
      Width = 195
      Height = 20
      AutoDropDown = True
      ItemHeight = 12
      Sorted = True
      TabOrder = 5
    end
  end
  inherited Panel3: TPanel
    Top = 372
    inherited btnOK: TBitBtn
      Caption = #20889#21345'(&O)'
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      ModalResult = 2
      OnClick = btnCancClick
    end
  end
  object tblCard: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CARD'
    Left = 392
    Top = 16
  end
  object tblCardXf: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CARDXF'
    Left = 424
    Top = 16
  end
end
