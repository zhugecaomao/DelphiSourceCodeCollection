inherited fm_system: Tfm_system
  Left = 191
  Top = 133
  Caption = #31995#32479#37197#32622
  ClientHeight = 302
  ClientWidth = 484
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object PageC1: TPageControl
    Left = 0
    Top = 0
    Width = 484
    Height = 302
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    object Tab1: TTabSheet
      Caption = #31995#32479#21442#25968
      object GroupBox1: TGroupBox
        Left = 9
        Top = 12
        Width = 216
        Height = 73
        Caption = #35774#32622#31995#32479#20010#24615#30028#38754
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 24
          Width = 65
          Height = 13
          Caption = #30028#38754#30382#32932#65306
        end
        object cmbskin: TComboBox
          Left = 75
          Top = 20
          Width = 118
          Height = 21
          Style = csDropDownList
          Color = clCream
          ItemHeight = 13
          TabOrder = 0
          OnChange = cmbskinChange
          Items.Strings = (
            #33609#21407#32511
            #23041#28023#34013
            #36827#20837'XP'
            #33529#26524
            #27963#36291#32043
            #28608#24773#40644
            #22810#24425)
        end
      end
      object rbwarning: TRadioGroup
        Left = 9
        Top = 90
        Width = 216
        Height = 75
        Caption = #24211#23384#19978#19979#38480#26816#27979
        ItemIndex = 1
        Items.Strings = (
          #31995#32479#21551#21160#26102#26816#27979
          #19968#30452#20851#38381)
        TabOrder = 1
      end
      object btnOk: TBitBtn
        Left = 327
        Top = 249
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 2
        OnClick = btnOkClick
        Kind = bkOK
      end
      object btnCancel: TBitBtn
        Left = 401
        Top = 249
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 3
        OnClick = btnCancelClick
        Kind = bkCancel
      end
      object GroupBox2: TGroupBox
        Left = 232
        Top = 11
        Width = 238
        Height = 73
        Caption = #21442#25968#35774#32622
        TabOrder = 4
        object edtfloat: TLabeledEditint
          Left = 92
          Top = 20
          Width = 137
          Height = 21
          EditLabel.Width = 78
          EditLabel.Height = 13
          EditLabel.Caption = #40664#35748#23567#25968#20301#25968
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 0
        end
        object edtaddjf: TLabeledEditint
          Left = 92
          Top = 45
          Width = 137
          Height = 21
          Hint = #40664#35748#22686#38271#30340#23458#25143#28040#36153#31215#20998#65288#27599#28040#36153#20154#27665#24065'1'#22278#65289
          EditLabel.Width = 78
          EditLabel.Height = 13
          EditLabel.Caption = #40664#35748#22686#38271#31215#20998
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object RDGEdit: TRadioGroup
        Left = 234
        Top = 90
        Width = 238
        Height = 75
        Caption = #25968#25454#20462#25913#35774#32622
        ItemIndex = 1
        Items.Strings = (
          #20165#21046#21333#20154#20462#25913
          #23457#26680#26102#21487#20197#20462#25913)
        TabOrder = 5
      end
    end
    object TabSheet1: TTabSheet
      Caption = #38376#24215#21442#25968#35774#32622
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 457
        Height = 233
        Caption = #22522#26412#21442#25968#35774#32622
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 24
          Width = 130
          Height = 13
          Caption = #40664#35748#12304#21518#21488#22788#29702#12305#26102#38388
        end
        object Label3: TLabel
          Left = 280
          Top = 24
          Width = 104
          Height = 13
          Caption = #40664#35748#12304#21462#38236#12305#26102#38388
        end
        object Label4: TLabel
          Left = 16
          Top = 88
          Width = 143
          Height = 13
          Caption = #40664#35748#12304#22806#21152#24037#21462#22238#12305#26102#38388
        end
        object Label5: TLabel
          Left = 272
          Top = 88
          Width = 117
          Height = 13
          Caption = #26159#21542#25910#27454#21518#30452#25509#25171#21360
        end
        object CmbDays: TComboBox
          Left = 16
          Top = 48
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = #24403#22825
          Items.Strings = (
            #24403#22825
            '1'#22825
            '2'#22825
            '3'#22825
            '4'#22825
            '5'#22825
            '6'#22825
            '7'#22825
            '8'#22825)
        end
        object cmbtime: TComboBox
          Left = 274
          Top = 48
          Width = 135
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = #21322#23567#26102
          Items.Strings = (
            #21322#23567#26102
            '1'#23567#26102
            '2'#23567#26102
            '3'#23567#26102
            '4'#23567#26102
            '5'#23567#26102
            '6'#23567#26102
            '7'#23567#26102
            '8'#23567#26102
            '9'#23567#26102
            '10'#23567#26102
            '11'#23567#26102
            '12'#23567#26102)
        end
        object CmbWDay: TComboBox
          Left = 16
          Top = 112
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = #24403#22825
          Items.Strings = (
            #24403#22825
            '1'#22825
            '2'#22825
            '3'#22825
            '4'#22825
            '5'#22825
            '6'#22825
            '7'#22825
            '8'#22825)
        end
        object CmbReport: TComboBox
          Left = 274
          Top = 112
          Width = 138
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = #26159
          Items.Strings = (
            #26159
            #21542)
        end
      end
      object BitBtn1: TBitBtn
        Left = 327
        Top = 249
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 1
        OnClick = btnOkClick
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 401
        Top = 249
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 2
        OnClick = btnCancelClick
        Kind = bkCancel
      end
    end
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 256
  end
end
