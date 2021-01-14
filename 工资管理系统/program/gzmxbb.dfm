inherited Form85: TForm85
  Left = 150
  Top = 219
  Caption = #24037#36164#26126#32454#25253#34920
  ClientHeight = 214
  ClientWidth = 628
  Font.Height = -11
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited asa: TPanel
    Width = 628
    Height = 214
    object Panel1: TPanel
      Left = 7
      Top = 7
      Width = 340
      Height = 32
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 33
        Top = 9
        Width = 96
        Height = 13
        Caption = #35831#36873#25321#26597#35810#26465#20214#65306
      end
      object ComboBox1: TComboBox
        Left = 134
        Top = 5
        Width = 93
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnChange = ComboBox1Change
        OnKeyPress = ComboBox1KeyPress
        Items.Strings = (
          #21592#24037#32534#21495
          #21592#24037#22995#21517)
      end
      object ComboBox2: TComboBox
        Left = 232
        Top = 5
        Width = 93
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          #21592#24037#32534#21495
          #21592#24037#22995#21517)
      end
      object CheckBox2: TCheckBox
        Left = 11
        Top = 7
        Width = 15
        Height = 17
        TabOrder = 2
      end
    end
    object Panel2: TPanel
      Left = 349
      Top = 7
      Width = 271
      Height = 32
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 10
        Top = 9
        Width = 33
        Height = 13
        AutoSize = False
        Caption = #26085#26399
      end
      object SpeedButton1: TSpeedButton
        Left = 143
        Top = 5
        Width = 55
        Height = 23
        Caption = #26597#35810
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 204
        Top = 5
        Width = 55
        Height = 23
        Caption = #25171#21360
        Enabled = False
        OnClick = SpeedButton2Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 46
        Top = 4
        Width = 89
        Height = 21
        Date = 37974.618414583330000000
        Format = 'yyyy-MM'
        Time = 37974.618414583330000000
        ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
        TabOrder = 0
      end
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 42
      Width = 613
      Height = 165
      DataSource = DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#20840#25340
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlue
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #21592#24037#32534#21495
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #21592#24037#22995#21517
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #22522#26412#24037#36164
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #32844#21153#24037#36164
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #24037#40836#24037#36164
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #20859#32769#20445#38505#37329
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #21152#29677#22825#25968
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #21152#29677#24037#36164
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #20107#20551#22825#25968
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #20107#20551#25187#27454
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #20010#20154#25152#24471#31246
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #20303#25151#34917#21161
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #20445#38505#36153
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #29983#27963#34917#21161
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #24212#21457#37329#39069
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #23454#21457#37329#39069
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = #20313#39069
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    Left = 138
    Top = 114
  end
  object aa: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = aaPrint
    Left = 106
    Top = 114
  end
end
