inherited XtszForm: TXtszForm
  Width = 640
  Height = 400
  Caption = #31995#32479
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 632
    inherited lblTitile: TLabel
      Left = 237
      Width = 125
      Caption = #31995#32479#35774#32622
    end
    inherited Image1: TImage
      Left = 182
    end
  end
  inherited Panel2: TPanel
    Width = 632
    Height = 296
    inherited Bevel1: TBevel
      Width = 622
      Height = 286
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 622
      Height = 286
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #31995#32479
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 48
          Height = 12
          Caption = #23486#39302#21517#31216
        end
        object Label13: TLabel
          Left = 8
          Top = 48
          Width = 108
          Height = 12
          Caption = #30005#35805#35745#36153#25968#25454#24211#36335#24452
        end
        object Label15: TLabel
          Left = 8
          Top = 164
          Width = 72
          Height = 12
          Caption = #35835#20889#22120#31471#21475#21495
        end
        object SpeedButton1: TSpeedButton
          Left = 248
          Top = 60
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 248
          Top = 97
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 248
          Top = 136
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton3Click
        end
        object edtBgmc: TEdit
          Left = 8
          Top = 24
          Width = 265
          Height = 20
          TabOrder = 0
        end
        object GroupBox1: TGroupBox
          Left = 280
          Top = 8
          Width = 161
          Height = 249
          Caption = ' '#25151' '#24577' '#30424' '#35774' '#32622' '
          TabOrder = 1
          object Label2: TLabel
            Left = 22
            Top = 24
            Width = 24
            Height = 12
            Caption = #31354#25151
          end
          object Label3: TLabel
            Left = 22
            Top = 48
            Width = 24
            Height = 12
            Caption = #25955#23458
          end
          object Label4: TLabel
            Left = 22
            Top = 96
            Width = 24
            Height = 12
            Caption = #20813#36153
          end
          object Label5: TLabel
            Left = 22
            Top = 120
            Width = 24
            Height = 12
            Caption = #32500#20462
          end
          object Label6: TLabel
            Left = 22
            Top = 72
            Width = 24
            Height = 12
            Caption = #22242#38431
          end
          object Label7: TLabel
            Left = 22
            Top = 144
            Width = 24
            Height = 12
            Caption = #33039#31354
          end
          object Label8: TLabel
            Left = 22
            Top = 168
            Width = 24
            Height = 12
            Caption = #23383#20307
          end
          object Label9: TLabel
            Left = 22
            Top = 192
            Width = 24
            Height = 12
            Caption = #32972#26223
          end
          object CheckBox1: TCheckBox
            Left = 24
            Top = 224
            Width = 113
            Height = 17
            Caption = #25151#24577#30424#26174#31034#22270#26631
            TabOrder = 0
          end
          object ColorBox1: TColorBox
            Left = 48
            Top = 16
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 1
          end
          object ColorBox2: TColorBox
            Left = 48
            Top = 40
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 2
          end
          object ColorBox3: TColorBox
            Left = 48
            Top = 64
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 3
          end
          object ColorBox4: TColorBox
            Left = 48
            Top = 88
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 4
          end
          object ColorBox5: TColorBox
            Left = 48
            Top = 112
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 5
          end
          object ColorBox6: TColorBox
            Left = 48
            Top = 136
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 6
          end
          object ColorBox7: TColorBox
            Left = 48
            Top = 160
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 7
          end
          object ColorBox8: TColorBox
            Left = 48
            Top = 184
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 8
          end
          object CheckBox4: TCheckBox
            Left = 24
            Top = 208
            Width = 129
            Height = 17
            Caption = #25151#24577#30424#26174#31034#21040#24215#22825#25968
            TabOrder = 9
          end
        end
        object edtJf: TEdit
          Left = 8
          Top = 61
          Width = 241
          Height = 20
          TabOrder = 2
        end
        object cmbPortNum: TComboBox
          Left = 8
          Top = 180
          Width = 81
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 3
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
        object CheckBox2: TCheckBox
          Left = 8
          Top = 210
          Width = 153
          Height = 17
          Caption = #26412#26426#22120#26159#21542#20801#35768#22812#23457
          TabOrder = 4
        end
        object edtSdir: TLabeledEdit
          Left = 8
          Top = 98
          Width = 241
          Height = 20
          EditLabel.Width = 72
          EditLabel.Height = 12
          EditLabel.Caption = #25968#25454#24211#28304#36335#24452
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 5
        end
        object edtDdir: TLabeledEdit
          Left = 8
          Top = 136
          Width = 241
          Height = 20
          EditLabel.Width = 84
          EditLabel.Height = 12
          EditLabel.Caption = #25968#25454#24211#22791#20221#36335#24452
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 6
        end
        object CheckBox3: TCheckBox
          Left = 8
          Top = 232
          Width = 129
          Height = 17
          Caption = #26159#21542#28165#31354#30005#35805#36153
          TabOrder = 7
        end
        object GroupBox2: TGroupBox
          Left = 448
          Top = 8
          Width = 153
          Height = 121
          Caption = ' '#39044' '#23450' '#39184' '#39278' '#35774' '#32622' '
          TabOrder = 8
          object Label10: TLabel
            Left = 14
            Top = 24
            Width = 24
            Height = 12
            Caption = #32972#26223
          end
          object Label11: TLabel
            Left = 14
            Top = 48
            Width = 24
            Height = 12
            Caption = #23383#20307
          end
          object Label12: TLabel
            Left = 14
            Top = 72
            Width = 24
            Height = 12
            Caption = #39044#23450
          end
          object Label14: TLabel
            Left = 14
            Top = 96
            Width = 24
            Height = 12
            Caption = #30830#35748
          end
          object ColorBox9: TColorBox
            Left = 45
            Top = 16
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 0
          end
          object ColorBox10: TColorBox
            Left = 45
            Top = 40
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 1
          end
          object ColorBox11: TColorBox
            Left = 45
            Top = 64
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 2
          end
          object ColorBox12: TColorBox
            Left = 45
            Top = 88
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 3
          end
        end
        object GroupBox3: TGroupBox
          Left = 448
          Top = 136
          Width = 153
          Height = 121
          Caption = ' '#39044' '#23450' '#20250' '#22330' '#35774' '#32622' '
          TabOrder = 9
          object Label16: TLabel
            Left = 14
            Top = 24
            Width = 24
            Height = 12
            Caption = #32972#26223
          end
          object Label17: TLabel
            Left = 14
            Top = 48
            Width = 24
            Height = 12
            Caption = #23383#20307
          end
          object Label18: TLabel
            Left = 14
            Top = 72
            Width = 24
            Height = 12
            Caption = #39044#23450
          end
          object Label19: TLabel
            Left = 14
            Top = 96
            Width = 24
            Height = 12
            Caption = #30830#35748
          end
          object ColorBox13: TColorBox
            Left = 45
            Top = 16
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 0
          end
          object ColorBox14: TColorBox
            Left = 45
            Top = 40
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 1
          end
          object ColorBox15: TColorBox
            Left = 45
            Top = 64
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 2
          end
          object ColorBox16: TColorBox
            Left = 45
            Top = 88
            Width = 100
            Height = 22
            ItemHeight = 16
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 338
    Width = 632
    inherited btnOK: TBitBtn
      Left = 472
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 552
    end
  end
end
