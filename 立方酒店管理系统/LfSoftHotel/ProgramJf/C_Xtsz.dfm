object XtszForm: TXtszForm
  Left = 238
  Top = 114
  Width = 388
  Height = 279
  Caption = #31995#32479#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 49
    Align = alTop
    ParentColor = True
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 8
      Width = 101
      Height = 24
      Caption = #31995#32479#35774#32622
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 380
    Height = 162
    Align = alClient
    ParentColor = True
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 378
      Height = 160
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #31471#21475#35774#32622
        object Label2: TLabel
          Left = 16
          Top = 24
          Width = 72
          Height = 12
          Caption = #35745#36153#31471#21475#21495#65306
        end
        object ComboBox1: TComboBox
          Left = 104
          Top = 16
          Width = 145
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 0
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8')
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 211
    Width = 380
    Height = 41
    Align = alBottom
    ParentColor = True
    TabOrder = 2
    object btnClose: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
