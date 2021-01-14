object Form9: TForm9
  Left = 288
  Top = 405
  Width = 709
  Height = 501
  Caption = #26597#35810#12289#20511#38405#12289#39044#32422#22270#20070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 16
    Top = 16
    Width = 673
    Height = 433
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #25353#20070#21517#26597#35810
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 64
        Top = 32
        Width = 121
        Height = 13
        AutoSize = False
        Caption = #35831#36755#20837#26597#35810#30340#20070#21517#65306
      end
      object Label2: TLabel
        Left = 80
        Top = 304
        Width = 48
        Height = 13
        Caption = #22270#20070#21495#65306
      end
      object Label3: TLabel
        Left = 56
        Top = 336
        Width = 96
        Height = 13
        Caption = #35831#36755#20837#20320#30340#23398#21495#65306
      end
      object Edit1: TEdit
        Left = 200
        Top = 32
        Width = 137
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object Button1: TButton
        Left = 432
        Top = 32
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 1
        OnClick = Button1Click
      end
      object DBGrid1: TDBGrid
        Left = 64
        Top = 80
        Width = 497
        Height = 120
        DataSource = DataModule2.BookDS
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'BookNo'
            Title.Caption = #20070#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BookName'
            Title.Caption = #20070#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Author'
            Title.Caption = #20316#32773
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Publish'
            Title.Caption = #20986#29256#31038
            Visible = True
          end>
      end
      object RadioGroup1: TRadioGroup
        Left = 160
        Top = 216
        Width = 201
        Height = 49
        Columns = 2
        Items.Strings = (
          #20511#38405#22270#20070
          #39044#32422#22270#20070)
        TabOrder = 3
      end
      object Edit3: TEdit
        Left = 176
        Top = 336
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'Edit3'
      end
      object Button2: TButton
        Left = 400
        Top = 288
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 5
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 400
        Top = 336
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 6
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 552
        Top = 312
        Width = 75
        Height = 25
        Caption = #36820#22238
        TabOrder = 7
        OnClick = Button4Click
      end
      object DBCheckBox1: TDBCheckBox
        Left = 40
        Top = 232
        Width = 97
        Height = 17
        Caption = #24050#34987#39044#32422
        DataField = 'Ordered'
        DataSource = DataModule2.BookDS
        TabOrder = 8
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBEdit1: TDBEdit
        Left = 176
        Top = 296
        Width = 121
        Height = 21
        DataField = 'BookNo'
        DataSource = DataModule2.BookDS
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25353#20316#32773#26597#35810
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label4: TLabel
        Left = 64
        Top = 32
        Width = 108
        Height = 13
        Caption = #35831#36755#20837#26597#35810#30340#20316#32773#65306
      end
      object Label5: TLabel
        Left = 56
        Top = 336
        Width = 96
        Height = 13
        Caption = #35831#36755#20837#20320#30340#23398#21495#65306
      end
      object Label6: TLabel
        Left = 80
        Top = 304
        Width = 48
        Height = 13
        Caption = #22270#20070#21495#65306
      end
      object Edit4: TEdit
        Left = 200
        Top = 32
        Width = 137
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object Button5: TButton
        Left = 432
        Top = 32
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 1
        OnClick = Button5Click
      end
      object RadioGroup2: TRadioGroup
        Left = 160
        Top = 216
        Width = 201
        Height = 49
        Columns = 2
        Items.Strings = (
          #20511#38405#22270#20070
          #39044#32422#22270#20070)
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 176
        Top = 336
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'Edit3'
      end
      object Button6: TButton
        Left = 400
        Top = 272
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 4
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 400
        Top = 320
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 5
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 552
        Top = 296
        Width = 75
        Height = 25
        Caption = #36820#22238
        TabOrder = 6
        OnClick = Button8Click
      end
      object DBCheckBox2: TDBCheckBox
        Left = 40
        Top = 232
        Width = 97
        Height = 17
        Caption = #24050#34987#39044#32422
        DataField = 'Ordered'
        DataSource = DataModule2.BookDS
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBEdit2: TDBEdit
        Left = 176
        Top = 296
        Width = 121
        Height = 21
        DataField = 'BookNo'
        DataSource = DataModule2.BookDS
        TabOrder = 8
      end
      object DBGrid2: TDBGrid
        Left = 64
        Top = 80
        Width = 497
        Height = 120
        DataSource = DataModule2.BookDS
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'BookNo'
            Title.Caption = #20070#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BookName'
            Title.Caption = #20070#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Author'
            Title.Caption = #20316#32773
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Publish'
            Title.Caption = #20986#29256#31038
            Visible = True
          end>
      end
    end
  end
end
