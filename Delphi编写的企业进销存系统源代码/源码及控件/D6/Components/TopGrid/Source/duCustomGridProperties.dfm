object dgCustomGridProperties: TdgCustomGridProperties
  Left = 231
  Top = 106
  Width = 342
  Height = 327
  Caption = 'Custom Grid Properties'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 259
    Width = 334
    Height = 34
    Align = alBottom
    TabOrder = 0
    object btOk: TButton
      Left = 172
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object btCancel: TButton
      Left = 252
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 259
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 183
      Top = 42
      Width = 150
      Height = 216
      Align = alClient
      Caption = 'Custom Grid Properties '
      TabOrder = 0
      object lbCustomProperties: TListBox
        Left = 2
        Top = 15
        Width = 146
        Height = 199
        Align = alClient
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnDblClick = lbCustomPropertiesDblClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 332
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 303
        Height = 13
        Caption = 
          'Select properties on the left and transfer to your personal cust' +
          'om'
      end
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 98
        Height = 13
        Caption = 'set of grid properties.'
      end
    end
    object gbGridProperties: TGroupBox
      Left = 1
      Top = 42
      Width = 150
      Height = 216
      Align = alLeft
      Caption = 'Grid Properties'
      TabOrder = 2
      object lbGridProperties: TListBox
        Left = 2
        Top = 15
        Width = 146
        Height = 199
        Align = alClient
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnDblClick = lbGridPropertiesDblClick
      end
    end
    object Panel4: TPanel
      Left = 151
      Top = 42
      Width = 32
      Height = 216
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object btPick: TButton
        Left = 4
        Top = 28
        Width = 25
        Height = 25
        Hint = 'Add Grid Property to Custom set'
        Caption = '>'
        TabOrder = 0
        OnClick = btPickClick
      end
      object btUnpick: TButton
        Left = 4
        Top = 60
        Width = 25
        Height = 25
        Hint = 'Remove Grid Property to Custom set'
        Caption = '<'
        TabOrder = 1
        OnClick = btUnpickClick
      end
    end
  end
end
