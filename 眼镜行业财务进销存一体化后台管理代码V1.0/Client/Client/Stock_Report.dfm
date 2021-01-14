object frm_Stock_Report: Tfrm_Stock_Report
  Left = 101
  Top = 188
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #37319#36141#25253#34920
  ClientHeight = 147
  ClientWidth = 380
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
    Width = 380
    Height = 147
    Align = alClient
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 380
      Height = 147
      ActivePage = TabSheet2
      Align = alClient
      TabIndex = 1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #37319#36141#26085#25253#34920
        object Shape1: TShape
          Left = 37
          Top = 58
          Width = 161
          Height = 2
        end
        object Label1: TLabel
          Left = 37
          Top = 35
          Width = 65
          Height = 13
          Caption = #26597#35810#26085#26399#65306
        end
        object MaskEdit1: TMaskEdit
          Left = 104
          Top = 29
          Width = 98
          Height = 21
          EditMask = '!9999/99/00;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '    -  -  '
        end
        object DateTimePicker1: TDateTimePicker
          Left = 181
          Top = 30
          Width = 20
          Height = 21
          CalAlignment = dtaLeft
          Date = 37903.6634027894
          Time = 37903.6634027894
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
          OnChange = DateTimePicker1Change
        end
        object BitBtn3: TBitBtn
          Left = 40
          Top = 69
          Width = 75
          Height = 25
          Caption = #30830#23450
          TabOrder = 2
          OnClick = BitBtn3Click
          Kind = bkOK
        end
        object BitBtn4: TBitBtn
          Left = 139
          Top = 69
          Width = 75
          Height = 25
          Caption = #21462#28040
          TabOrder = 3
          OnClick = BitBtn2Click
          Kind = bkCancel
        end
      end
      object TabSheet2: TTabSheet
        Caption = #37319#36141#26376#25253#34920
        ImageIndex = 1
        object Shape2: TShape
          Left = 42
          Top = 58
          Width = 161
          Height = 2
        end
        object Label2: TLabel
          Left = 42
          Top = 35
          Width = 65
          Height = 13
          Caption = #26597#35810#26085#26399#65306
        end
        object MaskEdit2: TMaskEdit
          Left = 109
          Top = 29
          Width = 98
          Height = 21
          EditMask = '!9999/99;1;_'
          MaxLength = 7
          TabOrder = 0
          Text = '    -  '
        end
        object dtpmonth: TDateTimePicker
          Left = 186
          Top = 30
          Width = 20
          Height = 21
          CalAlignment = dtaLeft
          Date = 37903.6634027894
          Time = 37903.6634027894
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
          OnChange = dtpmonthChange
        end
        object BitBtn1: TBitBtn
          Left = 45
          Top = 69
          Width = 75
          Height = 25
          Caption = #30830#23450
          TabOrder = 2
          OnClick = BitBtn1Click
          Kind = bkOK
        end
        object BitBtn2: TBitBtn
          Left = 134
          Top = 69
          Width = 75
          Height = 25
          Caption = #21462#28040
          TabOrder = 3
          OnClick = BitBtn2Click
          Kind = bkCancel
        end
      end
      object TabSheet3: TTabSheet
        Caption = #37319#36141#25253#34920
        ImageIndex = 2
        object GroupBox1: TGroupBox
          Left = 3
          Top = 0
          Width = 286
          Height = 115
          Caption = #35831#36755#20837#24320#22987#21644#25130#27490#26085#26399
          Font.Charset = ANSI_CHARSET
          Font.Color = clFuchsia
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label4: TLabel
            Left = 136
            Top = 30
            Width = 14
            Height = 14
            Caption = #21040
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object MaskEdit3: TMaskEdit
            Left = 17
            Top = 26
            Width = 110
            Height = 22
            EditMask = '!9999/99/00;1;_'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            Text = '    -  -  '
          end
          object MaskEdit4: TMaskEdit
            Left = 158
            Top = 26
            Width = 110
            Height = 22
            EditMask = '!9999/99/00;1;_'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 1
            Text = '    -  -  '
          end
          object DateTimePicker2: TDateTimePicker
            Left = 104
            Top = 27
            Width = 20
            Height = 20
            CalAlignment = dtaLeft
            Date = 37903.6634027894
            Time = 37903.6634027894
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 2
            OnChange = DateTimePicker2Change
          end
          object DateTimePicker3: TDateTimePicker
            Left = 245
            Top = 27
            Width = 20
            Height = 20
            CalAlignment = dtaLeft
            Date = 37903.6634027894
            Time = 37903.6634027894
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 3
            OnChange = DateTimePicker3Change
          end
          object TGroupBox
            Left = 6
            Top = 55
            Width = 272
            Height = 56
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object CheckBox1: TCheckBox
              Left = 38
              Top = 24
              Width = 200
              Height = 17
              Caption = #33258#21160#20445#25345#26412#27425#36755#20837#26085#26399#65288'&S'#65289
              TabOrder = 0
            end
          end
        end
        object btnOk: TBitBtn
          Left = 294
          Top = 5
          Width = 75
          Height = 25
          Caption = #30830#23450
          TabOrder = 1
          OnClick = btnOkClick
          Kind = bkOK
        end
        object btnCancel: TBitBtn
          Left = 295
          Top = 37
          Width = 75
          Height = 25
          Caption = #21462#28040
          TabOrder = 2
          OnClick = BitBtn2Click
          Kind = bkCancel
        end
      end
    end
  end
end
