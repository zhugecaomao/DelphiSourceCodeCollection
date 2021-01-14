object editper: Teditper
  Left = 215
  Top = 165
  BorderStyle = bsDialog
  Caption = #20154#25165#38656#27714#35268#21010
  ClientHeight = 385
  ClientWidth = 330
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
    Width = 313
    Height = 337
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #22522#26412
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 289
        Height = 65
        Caption = #26631#39064
        TabOrder = 0
        object DBEdit1: TDBEdit
          Left = 16
          Top = 24
          Width = 257
          Height = 20
          DataField = 'ptitle'
          DataSource = person.r_personDataSource
          MaxLength = 49
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 80
        Width = 289
        Height = 137
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 28
          Width = 48
          Height = 12
          Caption = #25152#38656#37096#38376
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 48
          Height = 12
          Caption = #25152#38656#32844#20301
        end
        object Label3: TLabel
          Left = 16
          Top = 100
          Width = 48
          Height = 12
          Caption = #21046#23450#26085#26399
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox
          Left = 72
          Top = 24
          Width = 137
          Height = 20
          DataBinding.DataSource = person.r_personDataSource
          DataBinding.DataField = 'branchid'
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              FieldName = 'branchname'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = person.r_staffbranchDataSource
          Style.LookAndFeel.Kind = lfStandard
          TabOrder = 0
        end
        object cxDBLookupComboBox2: TcxDBLookupComboBox
          Left = 72
          Top = 60
          Width = 137
          Height = 20
          DataBinding.DataSource = person.r_personDataSource
          DataBinding.DataField = 'postid'
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              FieldName = 'postname'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = person.r_staffpostDataSource
          Style.LookAndFeel.Kind = lfStandard
          TabOrder = 1
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 72
          Top = 96
          Width = 137
          Height = 20
          DataBinding.DataSource = person.r_personDataSource
          DataBinding.DataField = 'indate'
          Style.LookAndFeel.Kind = lfStandard
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20854#20182
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 289
        Height = 145
        TabOrder = 0
        object Label4: TLabel
          Left = 16
          Top = 28
          Width = 48
          Height = 12
          Caption = #20154#25165#31867#22411
        end
        object Label5: TLabel
          Left = 16
          Top = 64
          Width = 48
          Height = 12
          Caption = #38656#27714#23398#21382
        end
        object Label6: TLabel
          Left = 16
          Top = 100
          Width = 48
          Height = 12
          Caption = #38656#27714#20154#25968
        end
        object DBComboBox1: TDBComboBox
          Left = 72
          Top = 24
          Width = 145
          Height = 20
          DataField = 'ptype'
          DataSource = person.r_personDataSource
          ItemHeight = 12
          Items.Strings = (
            #25216#26415#31867
            #32463#33829#31649#29702
            #24066#22330#33829#38144
            #26381#21153
            #36130#21153)
          TabOrder = 0
        end
        object DBComboBox2: TDBComboBox
          Left = 72
          Top = 60
          Width = 145
          Height = 20
          DataField = 'pknowledge'
          DataSource = person.r_personDataSource
          ItemHeight = 12
          Items.Strings = (
            #19987#31185
            #22823#26412
            #39640#20013
            #32844#39640
            #21338#22763
            #30805#22763)
          TabOrder = 1
        end
        object cxDBSpinEdit1: TcxDBSpinEdit
          Left = 72
          Top = 96
          Width = 121
          Height = 20
          DataBinding.DataSource = person.r_personDataSource
          DataBinding.DataField = 'pcount'
          Style.LookAndFeel.Kind = lfStandard
          TabOrder = 2
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #22791#27880
      ImageIndex = 2
      object DBMemo1: TDBMemo
        Left = 8
        Top = 8
        Width = 289
        Height = 289
        DataField = 'pmemo'
        DataSource = person.r_personDataSource
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 240
    Top = 352
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 352
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
end
