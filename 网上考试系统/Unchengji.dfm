object chengjifrm: Tchengjifrm
  Left = 178
  Top = 62
  Width = 806
  Height = 590
  Caption = #25104#32489#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 798
    Height = 563
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    OnChange = FormShow
    object TabSheet1: TTabSheet
      Caption = #25104#32489#26597#35810
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 57
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 72
          Top = 16
          Width = 64
          Height = 16
          Caption = #26597#25214#39033#30446
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 376
          Top = 16
          Width = 48
          Height = 16
          Caption = #26597#25214#20540
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object ComboBox1: TComboBox
          Left = 152
          Top = 16
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            #20934#32771#35777#21495
            #22995#21517
            #36523#20221#35777#21495)
        end
        object Button1: TButton
          Left = 624
          Top = 16
          Width = 75
          Height = 25
          Caption = #26597#35810
          TabOrder = 1
          OnClick = Button1Click
        end
        object Edit1: TEdit
          Left = 440
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
      object DBGrid1: TDBGrid
        Left = -3
        Top = 56
        Width = 796
        Height = 401
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = #20934#32771#35777#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = #22995#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = #36523#20221#35777#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = #24615#21035
            Visible = True
          end
          item
            Expanded = False
            FieldName = #29366#24577
            Visible = True
          end
          item
            Expanded = False
            FieldName = #24471#20998
            Visible = True
          end
          item
            Expanded = False
            FieldName = #32771#35797#26085#26399
            Visible = True
          end
          item
            Expanded = False
            FieldName = #20303#22336
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25104#32489#25171#21360
      ImageIndex = 2
      object Bevel1: TBevel
        Left = 16
        Top = 16
        Width = 753
        Height = 377
      end
      object GBdate: TGroupBox
        Left = 320
        Top = 152
        Width = 417
        Height = 105
        Caption = #32771#35797#26085#26399
        Enabled = False
        TabOrder = 4
        object Label3: TLabel
          Left = 24
          Top = 48
          Width = 60
          Height = 13
          Caption = #32771#35797#26102#38388#65306
        end
        object DatePick: TDateTimePicker
          Left = 88
          Top = 48
          Width = 186
          Height = 21
          CalAlignment = dtaLeft
          Date = 37773.3846121412
          Time = 37773.3846121412
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object RGid: TRadioGroup
        Left = 320
        Top = 32
        Width = 417
        Height = 105
        Caption = #20934#32771#35777#21495
        ItemIndex = 0
        Items.Strings = (
          #20840#37096
          #20174'                                                 '#21040)
        TabOrder = 1
      end
      object RGselect: TRadioGroup
        Left = 64
        Top = 32
        Width = 129
        Height = 345
        Caption = #25171#21360#36873#39033
        ItemIndex = 0
        Items.Strings = (
          #20934#32771#35777#21495
          #32771#35797#26085#26399
          #21450#19981#21450#26684)
        TabOrder = 0
        OnClick = RGselectClick
      end
      object Edit2: TEdit
        Left = 368
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 528
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object RGpass: TRadioGroup
        Left = 320
        Top = 272
        Width = 417
        Height = 105
        Caption = #21450#19981#21450#26684
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #21450#26684
          #19981#21450#26684)
        TabOrder = 5
      end
      object Button2: TButton
        Left = 232
        Top = 408
        Width = 81
        Height = 25
        Caption = #25171#21360#39044#35272
        TabOrder = 6
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 424
        Top = 408
        Width = 75
        Height = 25
        Caption = #25171#21360
        TabOrder = 7
        OnClick = Button3Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.CDSStudent
    Left = 176
    Top = 216
  end
end
