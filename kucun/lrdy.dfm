object lrdyfm: Tlrdyfm
  Left = 338
  Top = 230
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #27611#21033#28070#25171#21360
  ClientHeight = 207
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 207
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 16
      Width = 409
      Height = 145
      Caption = #36873#25321#25253#34920#25171#21360#26465#20214
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 112
        Width = 393
        Height = 25
        AutoSize = False
        Caption = #25552#31034#65306#22343#25351#24403#24180#30340#21033#28070','#26412#26376#65292#26412#23395#24230#65292#26412#24180#24230#25253#34920#21487#30452#25509#25171#21360
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ayf: TRadioButton
        Left = 40
        Top = 32
        Width = 105
        Height = 17
        Caption = #25353#26376#20221
        TabOrder = 0
        OnClick = ayfClick
      end
      object yf: TComboBox
        Left = 128
        Top = 32
        Width = 145
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 1
        OnChange = yfChange
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12')
      end
      object ajd: TRadioButton
        Left = 40
        Top = 72
        Width = 105
        Height = 17
        Caption = #25353#23395#24230
        TabOrder = 2
        OnClick = ajdClick
      end
      object jd: TComboBox
        Left = 128
        Top = 72
        Width = 145
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 3
        OnChange = jdChange
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '')
      end
    end
    object bybb: TBitBtn
      Left = 8
      Top = 168
      Width = 75
      Height = 25
      Caption = #26412#26376#25253#34920
      TabOrder = 1
      OnClick = bybbClick
    end
    object bjdbb: TBitBtn
      Left = 88
      Top = 168
      Width = 75
      Height = 25
      Caption = #26412#23395#24230#25253#34920
      TabOrder = 2
      OnClick = bjdbbClick
    end
    object tjbb: TBitBtn
      Left = 248
      Top = 168
      Width = 75
      Height = 25
      Caption = #26465#20214#25253#34920
      TabOrder = 3
      OnClick = tjbbClick
    end
    object bnbb: TBitBtn
      Left = 168
      Top = 168
      Width = 75
      Height = 25
      Caption = #26412#24180#25253#34920
      TabOrder = 4
      OnClick = bnbbClick
    end
    object BitBtn1: TBitBtn
      Left = 328
      Top = 168
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 5
      OnClick = BitBtn1Click
    end
  end
end
