object dgCustomMasks: TdgCustomMasks
  Left = 192
  Top = 107
  Width = 314
  Height = 279
  Caption = 'Custom Masks'
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
    Top = 0
    Width = 306
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 287
      Height = 13
      Caption = 'Select masks on the left and transfer to your personal custom'
    end
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 97
      Height = 13
      Caption = 'set of known masks.'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 213
    Width = 306
    Height = 32
    Align = alBottom
    TabOrder = 1
    object btOk: TButton
      Left = 136
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object btCancel: TButton
      Left = 216
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 306
    Height = 172
    Align = alClient
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 128
      Height = 170
      Align = alLeft
      Caption = 'Known Masks '
      TabOrder = 0
      object lbKnownMasks: TListBox
        Left = 2
        Top = 15
        Width = 124
        Height = 153
        Align = alClient
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnDblClick = lbKnownMasksDblClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 161
      Top = 1
      Width = 144
      Height = 170
      Align = alClient
      Caption = 'Custom Masks '
      TabOrder = 1
      object lbCustomMasks: TListBox
        Left = 2
        Top = 15
        Width = 140
        Height = 153
        Align = alClient
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnDblClick = lbCustomMasksDblClick
      end
    end
    object Panel4: TPanel
      Left = 129
      Top = 1
      Width = 32
      Height = 170
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object btPick: TButton
        Left = 4
        Top = 20
        Width = 25
        Height = 25
        Hint = 'Add Grid Property to Custom set'
        Caption = '>'
        TabOrder = 0
        OnClick = btPickClick
      end
      object btUnpick: TButton
        Left = 4
        Top = 56
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
