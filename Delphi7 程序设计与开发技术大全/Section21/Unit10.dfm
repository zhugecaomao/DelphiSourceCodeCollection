object Form10: TForm10
  Left = 725
  Top = 312
  Width = 665
  Height = 449
  Caption = #26597#35810#20010#20154#24773#20917#12289#24402#36824#22270#20070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 16
    Width = 625
    Height = 385
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 32
      Width = 96
      Height = 13
      Caption = #35831#36755#20837#20320#30340#23398#21495#65306
    end
    object Label2: TLabel
      Left = 56
      Top = 64
      Width = 108
      Height = 13
      Caption = #20320#30340#20511#38405#24773#20917#22914#19979#65306
    end
    object Label3: TLabel
      Left = 416
      Top = 104
      Width = 24
      Height = 13
      Caption = #20070#21517
    end
    object Label4: TLabel
      Left = 416
      Top = 144
      Width = 24
      Height = 13
      Caption = #20316#32773
    end
    object Label5: TLabel
      Left = 416
      Top = 192
      Width = 36
      Height = 13
      Caption = #20986#29256#31038
    end
    object Label6: TLabel
      Left = 56
      Top = 248
      Width = 120
      Height = 13
      Caption = #36873#25321#35201#24402#36824#30340#22270#20070#21495#65306
    end
    object Edit1: TEdit
      Left = 176
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 440
      Top = 24
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 104
      Top = 312
      Width = 97
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 336
      Top = 312
      Width = 97
      Height = 25
      Caption = #36820#22238
      TabOrder = 3
      OnClick = Button3Click
    end
    object DBGrid2: TDBGrid
      Left = 32
      Top = 96
      Width = 361
      Height = 120
      DataSource = DataModule2.QueryDS
      TabOrder = 4
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
          FieldName = 'BorrowDate'
          Title.Caption = #20511#20070#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ReturnDate'
          Title.Caption = #36824#20070#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Delayed'
          Title.Caption = #26159#21542#36926#26399
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 472
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 472
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 472
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 184
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 8
    end
  end
end
