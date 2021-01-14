object config: Tconfig
  Left = 191
  Top = 52
  BorderStyle = bsDialog
  Caption = #31995#32479#35774#32622
  ClientHeight = 398
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 337
    Height = 353
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #30028#38754
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 313
        Height = 105
        Caption = #24037#20855#26639
        TabOrder = 0
        object CheckBox1: TCheckBox
          Left = 16
          Top = 32
          Width = 97
          Height = 17
          Caption = #25968#25454#24211#25511#21046
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 16
          Top = 64
          Width = 97
          Height = 17
          Caption = #34920#26684#32534#36753
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 120
        Width = 313
        Height = 73
        Caption = #34920#26684#32534#36753
        TabOrder = 1
        object RadioButton1: TRadioButton
          Left = 16
          Top = 32
          Width = 113
          Height = 17
          Caption = #40664#35748#26679#24335
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButton2: TRadioButton
          Left = 144
          Top = 32
          Width = 81
          Height = 17
          Caption = 'XP'#26679#24335
          TabOrder = 1
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #27169#29256
      ImageIndex = 2
      object Label18: TLabel
        Left = 8
        Top = 272
        Width = 108
        Height = 12
        Caption = #27880#65306#31995#32479#21306#20998#22823#23567#20889
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 313
        Height = 257
        Caption = #23450#20041#27169#29256#23383#31526
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 32
          Width = 48
          Height = 12
          Caption = #22995#12288#12288#21517
        end
        object Label2: TLabel
          Left = 176
          Top = 32
          Width = 48
          Height = 12
          Caption = #24615#12288#12288#21035
        end
        object Label3: TLabel
          Left = 36
          Top = 56
          Width = 36
          Height = 12
          Caption = #33521#25991#21517
        end
        object Label4: TLabel
          Left = 176
          Top = 56
          Width = 48
          Height = 12
          Caption = #23130#12288#12288#21542
        end
        object Label5: TLabel
          Left = 24
          Top = 80
          Width = 48
          Height = 12
          Caption = #20986#29983#26085#26399
        end
        object Label6: TLabel
          Left = 176
          Top = 80
          Width = 48
          Height = 12
          Caption = #31821#12288#12288#36143
        end
        object Label7: TLabel
          Left = 24
          Top = 104
          Width = 48
          Height = 12
          Caption = #27665#12288#12288#26063
        end
        object Label8: TLabel
          Left = 176
          Top = 104
          Width = 48
          Height = 12
          Caption = #36523#20221#35777#20214
        end
        object Label9: TLabel
          Left = 24
          Top = 128
          Width = 48
          Height = 12
          Caption = #25143#21475#25152#22312
        end
        object Label10: TLabel
          Left = 176
          Top = 128
          Width = 48
          Height = 12
          Caption = #23398#12288#12288#21382
        end
        object Label11: TLabel
          Left = 24
          Top = 152
          Width = 48
          Height = 12
          Caption = #27605#19994#38498#26657
        end
        object Label12: TLabel
          Left = 176
          Top = 152
          Width = 48
          Height = 12
          Caption = #22806#35821#35821#31181
        end
        object Label13: TLabel
          Left = 24
          Top = 176
          Width = 48
          Height = 12
          Caption = #22806#35821#31243#24230
        end
        object Label14: TLabel
          Left = 164
          Top = 200
          Width = 60
          Height = 12
          Caption = #32039#24613#32852#31995#20154
        end
        object Label15: TLabel
          Left = 24
          Top = 200
          Width = 48
          Height = 12
          Caption = #32039#24613#30005#35805
        end
        object Label16: TLabel
          Left = 176
          Top = 176
          Width = 48
          Height = 12
          Caption = #32852#31995#30005#35805
        end
        object Label17: TLabel
          Left = 24
          Top = 224
          Width = 48
          Height = 12
          Caption = #30005#23376#20449#31665
        end
        object XM: TEdit
          Left = 80
          Top = 28
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 0
          OnKeyPress = XMKeyPress
        end
        object XB: TEdit
          Left = 232
          Top = 28
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 1
          OnKeyPress = XMKeyPress
        end
        object YWM: TEdit
          Left = 80
          Top = 52
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 2
          OnKeyPress = XMKeyPress
        end
        object HF: TEdit
          Left = 232
          Top = 52
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 3
          OnKeyPress = XMKeyPress
        end
        object SR: TEdit
          Left = 80
          Top = 76
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 4
          OnKeyPress = XMKeyPress
        end
        object JG: TEdit
          Left = 232
          Top = 76
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 5
          OnKeyPress = XMKeyPress
        end
        object MZ: TEdit
          Left = 80
          Top = 100
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 6
          OnKeyPress = XMKeyPress
        end
        object ZJ: TEdit
          Left = 232
          Top = 100
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 7
          OnKeyPress = XMKeyPress
        end
        object HK: TEdit
          Left = 80
          Top = 124
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 8
          OnKeyPress = XMKeyPress
        end
        object XL: TEdit
          Left = 232
          Top = 124
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 9
          OnKeyPress = XMKeyPress
        end
        object BY: TEdit
          Left = 80
          Top = 148
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 10
          OnKeyPress = XMKeyPress
        end
        object WY: TEdit
          Left = 232
          Top = 148
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 11
          OnKeyPress = XMKeyPress
        end
        object CD: TEdit
          Left = 80
          Top = 172
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 12
          OnKeyPress = XMKeyPress
        end
        object JR: TEdit
          Left = 232
          Top = 196
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 13
          OnKeyPress = XMKeyPress
        end
        object JD: TEdit
          Left = 80
          Top = 196
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 14
          OnKeyPress = XMKeyPress
        end
        object DH: TEdit
          Left = 232
          Top = 172
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 15
          OnKeyPress = XMKeyPress
        end
        object DY: TEdit
          Left = 80
          Top = 220
          Width = 57
          Height = 20
          MaxLength = 10
          TabOrder = 16
          OnKeyPress = XMKeyPress
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #20854#20182
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 313
        Height = 105
        Caption = #31995#32479#36864#20986
        TabOrder = 0
        object CheckBox3: TCheckBox
          Left = 16
          Top = 32
          Width = 97
          Height = 17
          Caption = #33258#21160#20445#23384#20462#25913
          TabOrder = 0
        end
        object CheckBox4: TCheckBox
          Left = 16
          Top = 64
          Width = 97
          Height = 17
          Caption = #25552#31034#23545#35805#26694
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
    end
  end
  object Button1: TButton
    Left = 264
    Top = 368
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 368
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
end
