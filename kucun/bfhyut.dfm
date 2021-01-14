object sjbffm: Tsjbffm
  Left = 350
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #31995#32479#25968#25454#22791#20221
  ClientHeight = 221
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 339
    Height = 221
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #25968#25454#22791#20221
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 305
        Height = 137
        Caption = #22791#20221#27169#24335
        TabOrder = 0
        object SpeedButton3: TSpeedButton
          Left = 224
          Top = 96
          Width = 23
          Height = 22
          Caption = '>'
          Enabled = False
          OnClick = SpeedButton3Click
        end
        object bflj1: TRadioButton
          Left = 16
          Top = 32
          Width = 113
          Height = 17
          Caption = #40664#35748#22791#20221#25991#20214' '
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = bflj1Click
        end
        object bflj2: TRadioButton
          Left = 16
          Top = 64
          Width = 113
          Height = 17
          Caption = #36873#25321#22791#20221#25991#20214
          TabOrder = 1
          OnClick = bflj2Click
        end
        object Edit1: TEdit
          Left = 40
          Top = 96
          Width = 177
          Height = 21
          Enabled = False
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          TabOrder = 2
        end
      end
      object BitBtn2: TBitBtn
        Left = 64
        Top = 160
        Width = 75
        Height = 25
        Caption = #24320#22987#22791#20221
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 184
        Top = 160
        Width = 75
        Height = 25
        Caption = #20851#38381
        TabOrder = 2
        OnClick = BitBtn3Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25968#25454#36824#21407
      ImageIndex = 1
      object Label1: TLabel
        Left = 40
        Top = 16
        Width = 281
        Height = 17
        AutoSize = False
        Caption = #25968#25454#22791#20221
      end
      object SpeedButton1: TSpeedButton
        Left = 40
        Top = 80
        Width = 113
        Height = 25
        Caption = #22791#20221
        OnClick = SpeedButton1Click
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 331
        Height = 193
        Align = alClient
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 8
          Top = 8
          Width = 307
          Height = 137
          Caption = #22791#20221#27169#24335
          TabOrder = 0
          object SpeedButton5: TSpeedButton
            Left = 224
            Top = 96
            Width = 23
            Height = 22
            Caption = '>'
            Enabled = False
            OnClick = SpeedButton5Click
          end
          object hylj1: TRadioButton
            Left = 16
            Top = 32
            Width = 113
            Height = 17
            Caption = #40664#35748#36824#21407#25991#20214'  '
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = hylj1Click
          end
          object hylj2: TRadioButton
            Left = 16
            Top = 64
            Width = 113
            Height = 17
            Caption = #36873#25321#36824#21407#25991#20214
            TabOrder = 1
            OnClick = hylj2Click
          end
          object Edit2: TEdit
            Left = 40
            Top = 96
            Width = 177
            Height = 21
            Enabled = False
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 2
          end
        end
        object BitBtn8: TBitBtn
          Left = 56
          Top = 160
          Width = 75
          Height = 25
          Caption = #24320#22987#36824#21407
          TabOrder = 1
          OnClick = BitBtn8Click
        end
        object BitBtn5: TBitBtn
          Left = 192
          Top = 160
          Width = 75
          Height = 25
          Caption = #20851#38381
          TabOrder = 2
          OnClick = BitBtn3Click
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.bak'
    Filter = '*.bak|*.bak'
    Left = 236
    Top = 80
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.bak'
    Filter = '*.bak|*.bak'
    Left = 252
    Top = 56
  end
end
