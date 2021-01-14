inherited frmXSth: TfrmXSth
  Left = 16
  Top = 44
  Caption = #38144#21806#36864#36135#21333
  ClientWidth = 983
  OldCreateOrder = True
  PixelsPerInch = 120
  TextHeight = 19
  inherited Panel1: TPanel
    Width = 983
    inherited Label1: TLabel
      Width = 971
      Font.Color = clRed
    end
    object Label14: TLabel [1]
      Left = 10
      Top = 512
      Width = 48
      Height = 19
      Caption = #22791#27880':'
    end
    inherited DBGrid1: TDBGrid
      Top = 146
      Width = 971
      Height = 328
      DataSource = Data.sXsth
      TabOrder = 2
      Columns = <
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'aBH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aPM'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDW'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NSL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cJE'
          ReadOnly = True
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 474
      Width = 971
      object Label7: TLabel [1]
        Left = 763
        Top = 9
        Width = 67
        Height = 19
        Caption = #24635#37329#39069':'
      end
      object DBText1: TDBText [2]
        Left = 831
        Top = 6
        Width = 114
        Height = 23
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sXsthzb
      end
    end
    inherited Panel3: TPanel
      Width = 971
      Height = 111
      TabOrder = 0
      object Label4: TLabel [0]
        Left = 0
        Top = 41
        Width = 88
        Height = 19
        Caption = #23458'    '#25143':'
      end
      object Label9: TLabel [1]
        Left = 250
        Top = 10
        Width = 68
        Height = 19
        Caption = #21333'  '#21495':'
      end
      object btnKhHelp: TSpeedButton [2]
        Left = 223
        Top = 38
        Width = 25
        Height = 23
        Hint = #36873#25321#23458#25143
        Caption = #8230
        ParentShowHint = False
        ShowHint = True
        OnClick = btnKhHelpClick
      end
      inherited Label2: TLabel
        Width = 88
        Caption = #26085'    '#26399':'
      end
      object Label5: TLabel [4]
        Left = 737
        Top = 10
        Width = 67
        Height = 19
        Caption = #19994#21153#21592':'
      end
      object Label6: TLabel [5]
        Left = 479
        Top = 10
        Width = 87
        Height = 19
        Caption = #36864' '#20837' '#20179':'
      end
      object Label11: TLabel [6]
        Left = 0
        Top = 71
        Width = 86
        Height = 19
        Caption = #20184#27454#26041#24335':'
      end
      object Label12: TLabel [7]
        Left = 190
        Top = 71
        Width = 86
        Height = 19
        Caption = #36864#27454#24080#25143':'
      end
      object Label8: TLabel [8]
        Left = 479
        Top = 41
        Width = 86
        Height = 19
        Caption = #36864#27454#31867#22411':'
      end
      object Label10: TLabel [9]
        Left = 479
        Top = 71
        Width = 88
        Height = 19
        Caption = #31080'    '#21495':'
      end
      inherited DBEdit1: TDBEdit
        Left = 91
        Width = 109
        DataField = 'RQ'
        DataSource = Data.sXsthzb
      end
      object DBEdit2: TDBEdit
        Left = 91
        Top = 38
        Width = 129
        Height = 23
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHBH'
        DataSource = Data.sXsthzb
        TabOrder = 4
        OnDblClick = btnKhHelpClick
      end
      object DBEdit7: TDBEdit
        Left = 252
        Top = 38
        Width = 205
        Height = 23
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHMC'
        DataSource = Data.sXsthzb
        ReadOnly = True
        TabOrder = 5
        OnDblClick = btnKhHelpClick
      end
      object DBEdit6: TDBEdit
        Left = 328
        Top = 8
        Width = 129
        Height = 22
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sXsthzb
        TabOrder = 1
      end
      object DBComboBox1: TDBComboBox
        Left = 813
        Top = 5
        Width = 148
        Height = 27
        Color = 15793919
        DataField = 'YWY'
        DataSource = Data.sXsthzb
        ItemHeight = 19
        TabOrder = 3
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 570
        Top = 6
        Width = 146
        Height = 25
        DataField = 'CKID'
        DataSource = Data.sXsthzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sCk
        ParentColor = True
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 570
        Top = 68
        Width = 213
        Height = 23
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'PH'
        DataSource = Data.sXsthzb
        TabOrder = 9
        OnDblClick = btnKhHelpClick
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 91
        Top = 67
        Width = 77
        Height = 25
        DataField = 'SFKFSID'
        DataSource = Data.sXsthzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sSfkfs
        ParentColor = True
        TabOrder = 7
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 281
        Top = 67
        Width = 176
        Height = 25
        DataField = 'ZHID'
        DataSource = Data.sXsthzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sZh
        ParentColor = True
        TabOrder = 8
      end
      object DBComboBox2: TDBComboBox
        Left = 570
        Top = 35
        Width = 214
        Height = 27
        Style = csDropDownList
        DataField = 'aTHLX'
        DataSource = Data.sXsthzb
        ItemHeight = 19
        Items.Strings = (
          #36864#29616#27454#32473#23458#25143
          #36864#27454#36716#20837#23458#25143#39044#25910#27454)
        ParentColor = True
        TabOrder = 6
        OnExit = DBComboBox2Exit
      end
    end
    object DBEdit12: TDBEdit
      Left = 65
      Top = 510
      Width = 405
      Height = 23
      BorderStyle = bsNone
      Color = cl3DLight
      DataField = 'BZ'
      DataSource = Data.sXsthzb
      TabOrder = 3
    end
  end
  inherited ControlBar1: TControlBar
    Width = 983
    inherited ToolBar1: TToolBar
      ButtonWidth = 82
      object ToolButton4: TToolButton
        Left = 352
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 13
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 360
        Top = 0
        Action = aShd
        Caption = #24341#29992#38144#21806#21333
      end
    end
    inherited ToolBar2: TToolBar
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sXsthzb
      end
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object K1: TMenuItem
        Action = aKhXx
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Action = aShd
      end
    end
  end
  inherited ActionList1: TActionList
    object aShd: TAction
      Caption = #24341#29992#38144#21806#21333'(&Z)'
      ImageIndex = 29
      ShortCut = 16474
      OnExecute = aShdExecute
    end
    object aKhXx: TAction
      Caption = #23458#25143#36164#26009'(&K)'
      ImageIndex = 9
      ShortCut = 16459
      OnExecute = aKhXxExecute
    end
  end
end
