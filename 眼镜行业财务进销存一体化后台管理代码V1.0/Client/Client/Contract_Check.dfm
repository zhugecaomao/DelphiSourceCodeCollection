object frm_Contract_Check: Tfrm_Contract_Check
  Left = 181
  Top = 96
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #12304#21512#21516#36873#25321')'#12305
  ClientHeight = 326
  ClientWidth = 508
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 326
    Align = alClient
    Caption = 'Panel1'
    Color = clSkyBlue
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 506
      Height = 324
      Align = alClient
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 154
        Width = 502
        Height = 168
        Align = alBottom
        DataSource = dsdata
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDblClick = Cmd_CheckClick
        Columns = <
          item
            Expanded = False
            FieldName = 'receipt_No'
            Title.Alignment = taCenter
            Title.Caption = #21333#25454#32534#21495
            Width = 159
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'receipt_Name'
            Title.Alignment = taCenter
            Title.Caption = #21333#25454#31867#22411
            Width = 146
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Copy_Date'
            Title.Alignment = taCenter
            Title.Caption = #21046#21333#26085#26399
            Width = 101
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'proposer'
            Title.Alignment = taCenter
            Title.Caption = #21046#21333#20154
            Width = 120
            Visible = True
          end>
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 15
        Width = 393
        Height = 90
        Caption = #21512#21516#36807#28388
        TabOrder = 1
        object CheckBox1: TCheckBox
          Left = 13
          Top = 15
          Width = 97
          Height = 17
          Caption = #25353#21512#21516#21517#31216
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 13
          Top = 38
          Width = 97
          Height = 17
          Caption = #25353#24405#21333#26085#26399
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 13
          Top = 61
          Width = 97
          Height = 17
          Caption = #25353#21512#21516#32534#21495
          TabOrder = 2
        end
        object ComboBox1: TComboBox
          Left = 104
          Top = 12
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 3
        end
        object ComboBox2: TComboBox
          Left = 104
          Top = 35
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 4
        end
        object ComboBox3: TComboBox
          Left = 104
          Top = 58
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 5
        end
      end
      object Edit1: TLabeledEdit
        Left = 86
        Top = 106
        Width = 121
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = #21512#21516#21517#31216#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 2
      end
      object Edit2: TLabeledEdit
        Left = 283
        Top = 107
        Width = 115
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = #21333#25454#32534#21495#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 3
      end
      object Edit3: TLabeledEdit
        Left = 86
        Top = 130
        Width = 121
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = #24405#21333#26085#26399#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 4
      end
      object GroupBox2: TGroupBox
        Left = 405
        Top = 15
        Width = 95
        Height = 132
        TabOrder = 5
        object Cmd_Check: TSpeedButton
          Left = 8
          Top = 18
          Width = 80
          Height = 22
          Caption = #65339#36873#25321#65341
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333FF3FF3333333333CC30003333333333773777333333333C33
            3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
            33003377333337F33377333333333C333300333F333337F33377339333333C33
            3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
            330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
            330077F377F337F33377993399333C33330077FF773337F33377399993333C33
            33333777733337F333FF333333333C33300033333333373FF7773333333333CC
            3000333333333377377733333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = Cmd_CheckClick
        end
        object Cmd_Close: TSpeedButton
          Left = 8
          Top = 43
          Width = 80
          Height = 22
          Caption = #65339#20851#38381#65341
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333333333333333333FFF33FF333FFF339993370733
            999333777FF37FF377733339993000399933333777F777F77733333399970799
            93333333777F7377733333333999399933333333377737773333333333990993
            3333333333737F73333333333331013333333333333777FF3333333333910193
            333333333337773FF3333333399000993333333337377737FF33333399900099
            93333333773777377FF333399930003999333337773777F777FF339993370733
            9993337773337333777333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = Cmd_CloseClick
        end
      end
    end
  end
  object dsdata: TDataSource
    DataSet = dmmain.CDSexecsql
    Left = 432
    Top = 56
  end
end
