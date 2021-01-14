object TabInfo_frm: TTabInfo_frm
  Left = 199
  Top = 145
  Width = 706
  Height = 492
  Caption = 'TabInfo_frm'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 698
    Height = 29
    ButtonWidth = 91
    Caption = 'ToolBar1'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      AutoSize = True
      Caption = #22686#21152#34920
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object ToolButton6: TToolButton
      Left = 53
      Top = 2
      AutoSize = True
      Caption = #21024#38500#34920
      ImageIndex = 5
      OnClick = ToolButton6Click
    end
    object ToolButton2: TToolButton
      Left = 106
      Top = 2
      Caption = #21019#24314#34920'Create'
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 197
      Top = 2
      AutoSize = True
      Caption = #23548#20986#34920#35760#24405
      ImageIndex = 2
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 278
      Top = 2
      Hint = #25191#34892'SQL'#35821#21477
      AutoSize = True
      Caption = #25191#34892'SQL'#35821#21477
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
    object ToolButton5: TToolButton
      Left = 366
      Top = 2
      AutoSize = True
      Caption = #34920#27169#26495#35774#32622
      ImageIndex = 4
      OnClick = ToolButton5Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 29
    Width = 698
    Height = 436
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 185
      Top = 0
      Height = 436
    end
    object tablistPanel: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 436
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'tablistPanel'
      TabOrder = 0
      object TreeTabInfo: TTreeView
        Left = 0
        Top = 0
        Width = 185
        Height = 395
        Align = alClient
        Indent = 19
        PopupMenu = PopupMenu1
        RowSelect = True
        TabOrder = 0
        OnChange = TreeTabInfoChange
      end
      object Panel4: TPanel
        Left = 0
        Top = 395
        Width = 185
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object btnTabInfoadd: TBitBtn
          Left = 16
          Top = 8
          Width = 49
          Height = 25
          Caption = #22686#21152
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnMouseDown = btnTabInfoaddMouseDown
        end
        object btnTabInfosave: TBitBtn
          Left = 64
          Top = 8
          Width = 49
          Height = 25
          Caption = #20445#23384
          TabOrder = 1
          OnClick = btnTabInfosaveClick
        end
      end
    end
    object Panel1: TPanel
      Left = 188
      Top = 0
      Width = 510
      Height = 436
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 510
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 48
          Top = 15
          Width = 35
          Height = 14
          Caption = #34920' '#21517
        end
        object Label2: TLabel
          Left = 240
          Top = 13
          Width = 42
          Height = 14
          Caption = #34920#25551#36848
        end
        object Label3: TLabel
          Left = 32
          Top = 52
          Width = 56
          Height = 14
          Caption = #27169#22359#21517#31216
        end
        object Label4: TLabel
          Left = 232
          Top = 52
          Width = 56
          Height = 14
          Caption = #32034#24341#23383#27573
        end
        object tabid: TEdit
          Left = 96
          Top = 8
          Width = 121
          Height = 22
          ImeMode = imClose
          ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
          TabOrder = 0
          OnChange = tabidChange
        end
        object tabname: TEdit
          Left = 296
          Top = 8
          Width = 121
          Height = 22
          ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
          TabOrder = 1
        end
        object indexkey: TEdit
          Left = 296
          Top = 48
          Width = 121
          Height = 22
          ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
          TabOrder = 2
        end
        object moduleID: TComboBox
          Left = 96
          Top = 48
          Width = 121
          Height = 22
          ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
          ItemHeight = 14
          TabOrder = 3
          Text = 'moduleID'
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 81
        Width = 510
        Height = 355
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel6'
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 480
          Height = 355
          Align = alClient
          Caption = #34920#20869#23383#27573#21015#34920
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 2
            Top = 16
            Width = 476
            Height = 304
            Align = alClient
            DataSource = DataSource1
            ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -14
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDblClick = DBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Orderby'
                Title.Caption = #24207#21495
                Width = 32
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FieldID'
                Title.Caption = #23383#27573#21517
                Width = 104
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FieldName'
                Title.Caption = #23383#27573#25551#36848
                Width = 116
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fieldtype'
                Title.Caption = #31867#22411
                Width = 53
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FieldLength'
                Title.Caption = #38271#24230
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IfNull'
                Title.Caption = #26159#21542#31354
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DefaultValue'
                Title.Caption = #40664#35748#20540
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DicTAB'
                Title.Caption = #20851#32852#34920#21517
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DICfieldid'
                Title.Caption = #20851#32852#20027#38190
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dicfieldname'
                Title.Caption = #20851#32852#25551#36848
                Width = 72
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 2
            Top = 320
            Width = 476
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object btnTabInfoFieldadd: TBitBtn
              Left = 8
              Top = 4
              Width = 75
              Height = 25
              Caption = #22686#21152#23383#27573
              TabOrder = 0
              OnClick = btnTabInfoFieldaddClick
            end
            object btnTabInfoFieldedit: TBitBtn
              Left = 96
              Top = 4
              Width = 75
              Height = 25
              Caption = #20462#25913#23383#27573
              TabOrder = 1
              OnClick = btnTabInfoFieldeditClick
            end
            object btnTabInfoFielddel: TBitBtn
              Left = 192
              Top = 4
              Width = 75
              Height = 25
              Caption = #21024#38500#23383#27573
              TabOrder = 2
              OnClick = btnTabInfoFielddelClick
            end
            object btnClose: TBitBtn
              Left = 376
              Top = 4
              Width = 75
              Height = 25
              Caption = #36864' '#20986
              TabOrder = 3
              OnClick = btnCloseClick
            end
            object btnStyleSet: TBitBtn
              Left = 280
              Top = 4
              Width = 80
              Height = 25
              Caption = #34920#27169#26495#35774#32622
              TabOrder = 4
              OnClick = btnStyleSetClick
            end
          end
        end
        object Panel7: TPanel
          Left = 480
          Top = 0
          Width = 30
          Height = 355
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object btnmoveup: TSpeedButton
            Left = 2
            Top = 88
            Width = 23
            Height = 22
            Caption = #8593
            OnClick = btnmoveupClick
          end
          object btnmovedown: TSpeedButton
            Left = 2
            Top = 171
            Width = 23
            Height = 22
            Caption = #8595
            OnClick = btnmovedownClick
          end
          object SpeedButton1: TSpeedButton
            Left = 2
            Top = 128
            Width = 23
            Height = 22
            Caption = '='
            OnClick = SpeedButton1Click
          end
        end
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule_frm.ADOConnection1
    Parameters = <>
    Left = 32
    Top = 80
  end
  object ADOQuery2: TADOQuery
    Connection = DataModule_frm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select FieldID, FieldName, Fieldtype, FieldLength from TabInfoFi' +
        'eld')
    Left = 200
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 208
    Top = 248
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 224
    object N4: TMenuItem
      Caption = #21047#26032
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #22686#21152#27169#22359
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#27169#22359
      OnClick = N2Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #22686#21152#34920
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #21024#38500#34920
      OnClick = N11Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Create1: TMenuItem
      Caption = #21019#24314#34920'Create'
      OnClick = Create1Click
    end
    object Alter1: TMenuItem
      Caption = #20462#25913#34920'Alter'
    end
    object N17: TMenuItem
      Caption = #23548#20986#34920#35760#24405
      OnClick = N17Click
    end
    object SQL1: TMenuItem
      Caption = #25191#34892'SQL'#35821#21477
      OnClick = SQL1Click
    end
    object N19: TMenuItem
      Caption = #35774#32622#20851#38190#23383#27573#26368#22823#20540
      OnClick = N19Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #34920#27169#26495#35774#32622
      OnClick = N7Click
    end
    object N18: TMenuItem
      Caption = #22686#21152#34920#35760#24405
      OnClick = N18Click
    end
    object N8: TMenuItem
      Caption = #34920#31383#20307'-Add'
      OnClick = N8Click
    end
    object Add1: TMenuItem
      Caption = #34920#31383#20307'-Update'
      OnClick = Add1Click
    end
  end
  object ADOCommand1: TADOCommand
    Connection = DataModule_frm.ADOConnection1
    Parameters = <>
    Left = 96
    Top = 40
  end
  object ADOQuery3: TADOQuery
    Connection = DataModule_frm.ADOConnection1
    Parameters = <>
    Left = 80
    Top = 112
  end
  object PopupMenu2: TPopupMenu
    Left = 80
    Top = 272
    object N12: TMenuItem
      Caption = #22686#21152#27169#22359
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #21024#38500#27169#22359
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Caption = #22686#21152#34920
      OnClick = N15Click
    end
    object N16: TMenuItem
      Caption = #21024#38500#34920
      OnClick = N16Click
    end
  end
  object ImageList1: TImageList
    Left = 608
    Top = 48
  end
end
