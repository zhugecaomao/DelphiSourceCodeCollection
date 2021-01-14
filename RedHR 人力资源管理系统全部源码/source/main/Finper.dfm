object inper: Tinper
  Left = 231
  Top = 162
  BorderStyle = bsDialog
  Caption = #24212#32856#20154#21592#30331#35760
  ClientHeight = 376
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 297
    Height = 329
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #22522#26412
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 273
        Height = 281
        TabOrder = 0
        object Label1: TLabel
          Left = 48
          Top = 32
          Width = 24
          Height = 12
          Caption = #22995#21517
        end
        object Label2: TLabel
          Left = 48
          Top = 64
          Width = 24
          Height = 12
          Caption = #24615#21035
        end
        object Label3: TLabel
          Left = 36
          Top = 128
          Width = 36
          Height = 12
          BiDiMode = bdLeftToRight
          Caption = #36523#20221#35777
          ParentBiDiMode = False
        end
        object Label4: TLabel
          Left = 24
          Top = 160
          Width = 48
          Height = 12
          Caption = #20986#29983#26085#26399
        end
        object Label5: TLabel
          Left = 24
          Top = 224
          Width = 48
          Height = 12
          Caption = #25919#27835#38754#30446
        end
        object Label6: TLabel
          Left = 48
          Top = 192
          Width = 24
          Height = 12
          Caption = #36523#39640
        end
        object Label7: TLabel
          Left = 160
          Top = 192
          Width = 24
          Height = 12
          Caption = #35270#21147
        end
        object Label8: TLabel
          Left = 160
          Top = 64
          Width = 24
          Height = 12
          Caption = #27665#26063
        end
        object Label17: TLabel
          Left = 48
          Top = 96
          Width = 24
          Height = 12
          Caption = #23130#23035
        end
        object DBEdit1: TDBEdit
          Left = 78
          Top = 28
          Width = 115
          Height = 20
          DataField = 'name'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 0
        end
        object DBComboBox1: TDBComboBox
          Left = 78
          Top = 60
          Width = 65
          Height = 20
          DataField = 'sex'
          DataSource = person.p_inpersonDataSource
          ItemHeight = 12
          Items.Strings = (
            #30007
            #22899)
          TabOrder = 1
        end
        object DBComboBox2: TDBComboBox
          Left = 190
          Top = 60
          Width = 65
          Height = 20
          DataField = 'nation'
          DataSource = person.p_inpersonDataSource
          ItemHeight = 12
          Items.Strings = (
            #27721#26063
            #20643#26063
            #33495#26063
            #22766#26063
            #32500#26063
            #34255#26063
            #22238#26063)
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 78
          Top = 124
          Width = 131
          Height = 20
          DataField = 'idnum'
          DataSource = person.p_inpersonDataSource
          MaxLength = 30
          TabOrder = 3
          OnKeyPress = DBEdit2KeyPress
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 78
          Top = 156
          Width = 121
          Height = 20
          DataBinding.DataSource = person.p_inpersonDataSource
          DataBinding.DataField = 'birthday'
          Style.LookAndFeel.Kind = lfStandard
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 78
          Top = 188
          Width = 67
          Height = 20
          DataField = 'psize'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 5
        end
        object DBEdit4: TDBEdit
          Left = 190
          Top = 188
          Width = 65
          Height = 20
          DataField = 'peye'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 6
        end
        object DBComboBox3: TDBComboBox
          Left = 78
          Top = 220
          Width = 99
          Height = 20
          DataField = 'pnut'
          DataSource = person.p_inpersonDataSource
          ItemHeight = 12
          Items.Strings = (
            #22242#21592
            #20826#21592
            #27665#20027#20154#22763)
          TabOrder = 7
        end
        object DBComboBox6: TDBComboBox
          Left = 78
          Top = 92
          Width = 65
          Height = 20
          DataField = 'marriage'
          DataSource = person.p_inpersonDataSource
          ItemHeight = 12
          Items.Strings = (
            #26410#23130
            #24050#23130)
          TabOrder = 8
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #19987#19994
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 273
        Height = 209
        TabOrder = 0
        object Label9: TLabel
          Left = 24
          Top = 32
          Width = 48
          Height = 12
          Caption = #26368#39640#23398#21382
        end
        object Label10: TLabel
          Left = 24
          Top = 64
          Width = 48
          Height = 12
          Caption = #27605#19994#38498#26657
        end
        object Label11: TLabel
          Left = 24
          Top = 96
          Width = 48
          Height = 12
          Caption = #25152#23398#19987#19994
        end
        object Label12: TLabel
          Left = 24
          Top = 128
          Width = 48
          Height = 12
          Caption = #25216#26415#29305#38271
        end
        object Label13: TLabel
          Left = 36
          Top = 160
          Width = 36
          Height = 12
          Caption = #21407#21333#20301
        end
        object DBComboBox4: TDBComboBox
          Left = 78
          Top = 28
          Width = 83
          Height = 20
          DataField = 'pknowledge'
          DataSource = person.p_inpersonDataSource
          ItemHeight = 12
          Items.Strings = (
            #21021#20013
            #39640#20013
            #32844#39640
            #22823#19987
            #26412#31185
            #30805#22763
            #21338#22763)
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 78
          Top = 60
          Width = 171
          Height = 20
          DataField = 'pschool'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 1
        end
        object DBComboBox5: TDBComboBox
          Left = 78
          Top = 92
          Width = 107
          Height = 20
          DataField = 'speciality'
          DataSource = person.p_inpersonDataSource
          ItemHeight = 12
          Items.Strings = (
            #35745#31639#26426#21450#24212#29992
            #39277#24215#31649#29702
            #36130#21153#20250#35745
            #32463#33829#31649#29702
            #24066#22330#33829#38144
            #24215#38138#33829#36816)
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 78
          Top = 124
          Width = 171
          Height = 20
          DataField = 'pworktime'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 3
        end
        object DBEdit7: TDBEdit
          Left = 78
          Top = 156
          Width = 171
          Height = 20
          DataField = 'ocorp'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 4
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #32852#31995
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 273
        Height = 137
        TabOrder = 0
        object Label14: TLabel
          Left = 24
          Top = 32
          Width = 48
          Height = 12
          Caption = #32852#31995#30005#35805
        end
        object Label15: TLabel
          Left = 24
          Top = 64
          Width = 48
          Height = 12
          Caption = #30005#23376#37038#20214
        end
        object Label16: TLabel
          Left = 24
          Top = 96
          Width = 48
          Height = 12
          Caption = #36890#35759#22320#22336
        end
        object DBEdit8: TDBEdit
          Left = 78
          Top = 28
          Width = 171
          Height = 20
          DataField = 'tel'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 78
          Top = 60
          Width = 171
          Height = 20
          DataField = 'email'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 1
        end
        object DBEdit10: TDBEdit
          Left = 78
          Top = 92
          Width = 171
          Height = 20
          DataField = 'add'
          DataSource = person.p_inpersonDataSource
          MaxLength = 40
          TabOrder = 2
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #22791#27880
      ImageIndex = 3
      object DBMemo1: TDBMemo
        Left = 8
        Top = 16
        Width = 273
        Height = 265
        DataField = 'memo'
        DataSource = person.p_inpersonDataSource
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 224
    Top = 344
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 344
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
end
