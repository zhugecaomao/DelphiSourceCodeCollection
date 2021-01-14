object frm_Goods_Requipment_Search: Tfrm_Goods_Requipment_Search
  Left = 19
  Top = 72
  Width = 740
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = #12304#21830#21697#38656#27714#21333#12305#26597#35810
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 732
    Height = 453
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 730
      Height = 99
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 598
        Top = 19
        Width = 13
        Height = 13
        Caption = #21040
        Visible = False
      end
      object CheckBox1: TCheckBox
        Left = 12
        Top = 19
        Width = 91
        Height = 17
        Caption = #25353#24405#21333#26085#26399
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 12
        Top = 45
        Width = 91
        Height = 17
        Caption = #25353#21333#25454#32534#21495
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 368
        Top = 44
        Width = 91
        Height = 17
        Caption = #25353#32463#25163#20154#21592
        TabOrder = 2
        OnClick = CheckBox3Click
      end
      object CheckBox4: TCheckBox
        Left = 368
        Top = 19
        Width = 115
        Height = 17
        Caption = #25353#24405#21333#26085#26399#27573#20174
        TabOrder = 3
        OnClick = CheckBox4Click
      end
      object Edit4: TMaskEdit
        Left = 490
        Top = 16
        Width = 100
        Height = 21
        EditMask = '!9999/99/00;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '    -  -  '
        Visible = False
      end
      object Edit5: TMaskEdit
        Left = 624
        Top = 16
        Width = 100
        Height = 21
        EditMask = '!9999/99/00;1;_'
        MaxLength = 10
        TabOrder = 5
        Text = '    -  -  '
        Visible = False
      end
      object Edit1: TComboBox
        Left = 106
        Top = 16
        Width = 233
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Visible = False
      end
      object Edit2: TComboBox
        Left = 106
        Top = 42
        Width = 233
        Height = 21
        ItemHeight = 13
        TabOrder = 7
        Visible = False
      end
      object Edit3: TComboBox
        Left = 490
        Top = 42
        Width = 233
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        Visible = False
      end
      object Panel2: TPanel
        Left = 2
        Top = 68
        Width = 726
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        Color = clSkyBlue
        TabOrder = 9
        object Cmd_Search: TSpeedButton
          Left = 9
          Top = 2
          Width = 74
          Height = 22
          Caption = #26597#35810
          OnClick = Cmd_SearchClick
        end
      end
      object DateTimePicker1: TDateTimePicker
        Left = 570
        Top = 16
        Width = 19
        Height = 22
        CalAlignment = dtaLeft
        Date = 37991.4137283102
        Time = 37991.4137283102
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 10
        Visible = False
      end
      object DateTimePicker2: TDateTimePicker
        Left = 704
        Top = 16
        Width = 19
        Height = 22
        CalAlignment = dtaLeft
        Date = 37991.4137283102
        Time = 37991.4137283102
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 11
        Visible = False
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 100
      Width = 730
      Height = 352
      Align = alClient
      FixedColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    Left = 216
    Top = 192
  end
end
