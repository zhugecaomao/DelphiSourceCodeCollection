object baker_form: Tbaker_form
  Left = 298
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25968#25454#24211#22788#29702
  ClientHeight = 216
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 326
    Height = 169
    Align = alTop
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 2
      Top = 15
      Width = 322
      Height = 152
      ActivePage = TabSheet1
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #25968#25454#22791#20221
        object Label1: TLabel
          Left = 0
          Top = 16
          Width = 121
          Height = 13
          AutoSize = False
          Caption = #25968#25454#24211#22791#20221#36335#24452'(&P) '#65306
        end
        object SpeedButton1: TSpeedButton
          Left = 254
          Top = 31
          Width = 49
          Height = 22
          Caption = #27983#35272'...'
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 0
          Top = 64
          Width = 89
          Height = 22
          Caption = #24320#22987#22791#20221' (&B)'
          OnClick = SpeedButton2Click
        end
        object Edit1: TEdit
          Left = 0
          Top = 32
          Width = 241
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ReadOnly = True
          TabOrder = 0
        end
        object ProgressBar1: TProgressBar
          Left = 0
          Top = 98
          Width = 313
          Height = 16
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = #25968#25454#21387#32553
        ImageIndex = 1
        object SpeedButton3: TSpeedButton
          Left = 96
          Top = 48
          Width = 105
          Height = 25
          Caption = #21387#32553#25968#25454#24211' (&C)'
          OnClick = SpeedButton3Click
        end
        object Label2: TLabel
          Left = 8
          Top = 88
          Width = 297
          Height = 13
          AutoSize = False
        end
      end
      object TabSheet3: TTabSheet
        Caption = #25968#25454#24674#22797
        ImageIndex = 2
        object SpeedButton4: TSpeedButton
          Left = 0
          Top = 64
          Width = 89
          Height = 22
          Caption = #24320#22987#24674#22797' (&R)'
          OnClick = SpeedButton4Click
        end
        object Label3: TLabel
          Left = 0
          Top = 16
          Width = 121
          Height = 13
          AutoSize = False
          Caption = #25968#25454#24211' '#24674#22797#36335#24452'(&P) '#65306
        end
        object SpeedButton5: TSpeedButton
          Left = 254
          Top = 32
          Width = 49
          Height = 21
          Caption = #27983#35272'...'
          OnClick = SpeedButton5Click
        end
        object Edit2: TEdit
          Left = 0
          Top = 32
          Width = 241
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 123
    Top = 181
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object OpenDialog1: TOpenDialog
    FileName = 'database.bak'
    Filter = #25968#25454#24211#22791#20221#25991#20214'(*.bak)|*.bak'
    Left = 224
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = Timer1Timer
    Left = 150
    Top = 106
  end
end
