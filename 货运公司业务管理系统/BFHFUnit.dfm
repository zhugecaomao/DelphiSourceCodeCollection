object BFHFForm: TBFHFForm
  Left = 199
  Top = 133
  BorderStyle = bsDialog
  Caption = #25968#25454#22791#20221#19982#24674#22797
  ClientHeight = 243
  ClientWidth = 434
  Color = clInactiveBorder
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 436
    Height = 244
    ActivePage = TabSheet2
    TabIndex = 1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #22791#20221
      object Label1: TLabel
        Left = 144
        Top = 8
        Width = 51
        Height = 13
        Caption = #22791#20221#36335#24452':'
      end
      object Label2: TLabel
        Left = 202
        Top = 8
        Width = 44
        Height = 13
        Caption = 'E:\'#31995#32479'\'
      end
      object Label3: TLabel
        Left = 200
        Top = 64
        Width = 27
        Height = 13
        Caption = #21517#31216':'
      end
      object Label4: TLabel
        Left = 323
        Top = 64
        Width = 39
        Height = 13
        Caption = #25193#23637#21517':'
      end
      object DriveComboBox1: TDriveComboBox
        Left = 6
        Top = 51
        Width = 130
        Height = 19
        Ctl3D = False
        DirList = DirectoryListBox1
        ParentCtl3D = False
        TabOrder = 0
      end
      object DirectoryListBox1: TDirectoryListBox
        Left = 4
        Top = 72
        Width = 130
        Height = 120
        Ctl3D = False
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 1
        OnChange = DirectoryListBox1Change
      end
      object Edit1: TEdit
        Left = 144
        Top = 23
        Width = 270
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 168
        Top = 88
        Width = 105
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object Edit3: TEdit
        Left = 296
        Top = 88
        Width = 105
        Height = 19
        Color = cl3DLight
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        Text = '.CHBCK'
      end
      object FlatButton1: TFlatButton
        Left = 232
        Top = 152
        Width = 87
        Height = 22
        Caption = #22791#20221#25968#25454#24211
        TabOrder = 5
        OnClick = FlatButton1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24674#22797
      ImageIndex = 1
      object AALabel1: TAALabel
        Left = 79
        Top = 32
        Width = 98
        Height = 13
        ParentEffect.ParentFont = False
        Caption = #22791#20221#25968#25454#24211#24211#21517':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
      end
      object Edit4: TEdit
        Left = 69
        Top = 54
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object FlatButton2: TFlatButton
        Left = 232
        Top = 53
        Width = 41
        Height = 19
        Caption = '....'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = FlatButton2Click
      end
      object FlatButton3: TFlatButton
        Left = 160
        Top = 122
        Width = 81
        Height = 23
        Caption = #24674#22797#25968#25454#24211
        TabOrder = 2
        OnClick = FlatButton3Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 368
    Top = 104
  end
end
