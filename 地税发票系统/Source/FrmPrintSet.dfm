object PrintSet: TPrintSet
  Left = 298
  Top = 194
  Width = 299
  Height = 268
  Caption = #25171#21360#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnOK: TButton
    Left = 209
    Top = 52
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object CancelBB: TButton
    Left = 209
    Top = 84
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object SetupBB: TButton
    Left = 209
    Top = 116
    Width = 75
    Height = 25
    Caption = #35774#32622
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 3
    Width = 281
    Height = 36
    Caption = #36873#25321#25171#21360#26426
    TabOrder = 0
    object PrinterLabel: TLabel
      Left = 10
      Top = 15
      Width = 250
      Height = 13
      AutoSize = False
      Caption = '(none)'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 167
    Width = 184
    Height = 65
    Caption = #36873#39033
    TabOrder = 5
    object CopiesLabel: TLabel
      Left = 17
      Top = 19
      Width = 24
      Height = 13
      Caption = #20221#25968
    end
    object CopiesED: TEdit
      Left = 18
      Top = 35
      Width = 49
      Height = 21
      TabOrder = 1
    end
    object CollateCK: TCheckBox
      Left = 115
      Top = 17
      Width = 51
      Height = 17
      Caption = #20998#39029
      TabOrder = 0
    end
    object DuplexCK: TCheckBox
      Left = 115
      Top = 40
      Width = 52
      Height = 17
      Caption = #21452#38754
      TabOrder = 2
    end
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 40
    Width = 193
    Height = 121
    ActivePage = TabSheet2
    Style = tsButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      TabVisible = False
      object DestGB: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 111
        Align = alClient
        Caption = #36755#20986#25253#34920#21040
        TabOrder = 0
        object FileNameSB: TSpeedButton
          Left = 160
          Top = 54
          Width = 20
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000FFFF0003030000
            00000000FFFF000300FFFF000303000000000000FFFF000300FFFF0003030000
            00000000FFFF000300FFFF0003030000000000000000000300FFFF0003030303
            030303030303030300FFFF0003030000000000000000030300FFFF000300FFFF
            FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
            FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
            FFFFFFFFFFFF000000FFFF000300FFFFFFFFFFFFFFFF00FF00FFFF0000000000
            000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 82
          Width = 24
          Height = 13
          Caption = #26684#24335
        end
        object PrinterRB: TRadioButton
          Left = 8
          Top = 16
          Width = 153
          Height = 17
          Caption = #25171#21360#26426
          TabOrder = 0
        end
        object PreviewRB: TRadioButton
          Left = 8
          Top = 36
          Width = 153
          Height = 17
          Caption = #39044#35272
          TabOrder = 1
        end
        object FileRB: TRadioButton
          Left = 8
          Top = 56
          Width = 153
          Height = 17
          Caption = #25991#20214
          TabOrder = 3
        end
        object editFileName: TEdit
          Left = 64
          Top = 54
          Width = 95
          Height = 20
          TabOrder = 2
        end
        object cboxFormat: TComboBox
          Left = 64
          Top = 79
          Width = 116
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          Text = 'Rave Format (NDR)'
          Items.Strings = (
            'Rave Format (NDR)'
            'Native Printer Output')
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      TabVisible = False
      object RangeGB: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 111
        Align = alClient
        Caption = 'Print Range'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object FromLabel: TLabel
          Left = 8
          Top = 84
          Width = 23
          Height = 13
          Caption = 'From'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SelectionLabel: TLabel
          Left = 8
          Top = 84
          Width = 44
          Height = 13
          Caption = 'Selection'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ToLabel: TLabel
          Left = 88
          Top = 84
          Width = 9
          Height = 13
          Caption = 'to'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SelectionED: TEdit
          Left = 56
          Top = 80
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object AllRB: TRadioButton
          Left = 8
          Top = 16
          Width = 153
          Height = 17
          Caption = 'All'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
        end
        object SelectionRB: TRadioButton
          Left = 8
          Top = 36
          Width = 153
          Height = 17
          Caption = 'Selection'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object PagesRB: TRadioButton
          Left = 8
          Top = 56
          Width = 153
          Height = 17
          Caption = 'Pages'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object FromED: TEdit
          Left = 40
          Top = 80
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object ToED: TEdit
          Left = 104
          Top = 80
          Width = 57
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
    end
  end
  object dlogSave: TSaveDialog
    DefaultExt = 'ndr'
    Filter = 'All Files|*.*'
    Options = [ofOverwritePrompt, ofPathMustExist, ofNoReadOnlyReturn]
    Left = 240
    Top = 8
  end
end
