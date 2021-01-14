object frm_ChildShop_Select: Tfrm_ChildShop_Select
  Left = 146
  Top = 146
  Width = 534
  Height = 353
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = #12304#24215#38754#36873#25321#12305
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 426
      Height = 326
      Align = alClient
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 96
        Width = 422
        Height = 228
        Align = alClient
        Color = clWhite
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDblClick = SpeedButton1Click
      end
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 422
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        Color = clSkyBlue
        TabOrder = 1
        object Label1: TLabel
          Left = 9
          Top = 16
          Width = 65
          Height = 13
          Caption = #24215#38754#32534#21495#65306
        end
        object Label2: TLabel
          Left = 9
          Top = 47
          Width = 65
          Height = 13
          Caption = #24215#38754#21517#31216#65306
        end
        object ComboBox1: TComboBox
          Left = 77
          Top = 12
          Width = 205
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object ComboBox2: TComboBox
          Left = 76
          Top = 43
          Width = 206
          Height = 21
          ItemHeight = 13
          TabOrder = 1
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 426
      Top = 0
      Width = 100
      Height = 326
      Align = alRight
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 8
        Top = 32
        Width = 80
        Height = 25
        Caption = #12304#36873#25321#12305
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 8
        Top = 69
        Width = 80
        Height = 25
        Caption = #12304#28155#21152#12305
      end
      object SpeedButton3: TSpeedButton
        Left = 8
        Top = 106
        Width = 80
        Height = 25
        Caption = #12304#21462#28040#12305
      end
      object SpeedButton4: TSpeedButton
        Left = 8
        Top = 144
        Width = 80
        Height = 25
        Caption = #12304#20851#38381#12305
        OnClick = SpeedButton4Click
      end
      object LabeledEdit1: TLabeledEdit
        Left = 8
        Top = 200
        Width = 90
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = #24215#38754#32534#21495
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 0
      end
      object LabeledEdit2: TLabeledEdit
        Left = 8
        Top = 240
        Width = 90
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = #24215#38754#21517#31216
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 1
      end
    end
  end
end
