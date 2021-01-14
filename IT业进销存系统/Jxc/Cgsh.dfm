inherited frmCgsh: TfrmCgsh
  Left = 17
  Top = -4
  Caption = #37319#36141#25910#36135#21333
  ClientWidth = 983
  OldCreateOrder = True
  PixelsPerInch = 120
  TextHeight = 19
  inherited Panel1: TPanel
    Width = 983
    inherited Label1: TLabel
      Width = 971
    end
    object Label14: TLabel [1]
      Left = 10
      Top = 512
      Width = 48
      Height = 19
      Caption = #22791#27880':'
    end
    inherited DBGrid1: TDBGrid
      Top = 176
      Width = 971
      Height = 296
      DataSource = Data.sCgsh
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
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cJE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cDDBH'
          ReadOnly = True
          Width = 132
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 472
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
        DataSource = Data.sCgshzb
      end
    end
    inherited Panel3: TPanel
      Width = 971
      Height = 141
      TabOrder = 0
      object Label4: TLabel [0]
        Left = 0
        Top = 41
        Width = 87
        Height = 19
        Caption = #20379' '#24212' '#21830':'
      end
      object Label9: TLabel [1]
        Left = 269
        Top = 10
        Width = 68
        Height = 19
        Caption = #21333'  '#21495':'
      end
      object btnGysHelp: TSpeedButton [2]
        Left = 223
        Top = 38
        Width = 25
        Height = 23
        Hint = #36873#25321#20379#24212#21830
        Caption = #8230
        ParentShowHint = False
        ShowHint = True
        OnClick = btnGysHelpClick
      end
      inherited Label2: TLabel
        Width = 88
        Caption = #26085'    '#26399':'
      end
      object Label5: TLabel [4]
        Left = 494
        Top = 41
        Width = 87
        Height = 19
        Caption = #19994' '#21153' '#21592':'
      end
      object Label6: TLabel [5]
        Left = 269
        Top = 71
        Width = 67
        Height = 19
        Caption = #36827#36135#20179':'
      end
      object Label8: TLabel [6]
        Left = 0
        Top = 71
        Width = 86
        Height = 19
        Caption = #21457#31080#31867#22411':'
      end
      object Label15: TLabel [7]
        Left = 494
        Top = 10
        Width = 86
        Height = 19
        Caption = #37319#36141#31867#22411':'
      end
      object Label18: TLabel [8]
        Left = 0
        Top = 101
        Width = 88
        Height = 19
        Caption = #31080'    '#21495':'
      end
      object Label16: TLabel [9]
        Left = 494
        Top = 71
        Width = 86
        Height = 19
        Caption = #20184#27454#26041#24335':'
      end
      object Label17: TLabel [10]
        Left = 684
        Top = 71
        Width = 86
        Height = 19
        Caption = #20184#27454#26469#28304':'
      end
      object Label12: TLabel [11]
        Left = 269
        Top = 101
        Width = 86
        Height = 19
        Caption = #25910#27454#26399#38480':'
      end
      object Label13: TLabel [12]
        Left = 414
        Top = 101
        Width = 19
        Height = 19
        Caption = #22825
      end
      inherited DBEdit1: TDBEdit
        Left = 91
        Width = 109
        DataField = 'RQ'
        DataSource = Data.sCgshzb
      end
      object DBEdit2: TDBEdit
        Left = 91
        Top = 38
        Width = 129
        Height = 23
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aGYSBH'
        DataSource = Data.sCgshzb
        TabOrder = 3
        OnDblClick = btnGysHelpClick
      end
      object DBEdit7: TDBEdit
        Left = 252
        Top = 38
        Width = 220
        Height = 23
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aGYSMC'
        DataSource = Data.sCgshzb
        ReadOnly = True
        TabOrder = 4
        OnDblClick = btnGysHelpClick
      end
      object DBEdit6: TDBEdit
        Left = 343
        Top = 8
        Width = 129
        Height = 22
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sCgshzb
        TabOrder = 1
      end
      object DBComboBox1: TDBComboBox
        Left = 585
        Top = 35
        Width = 123
        Height = 27
        Color = 15793919
        DataField = 'YWY'
        DataSource = Data.sCgshzb
        ItemHeight = 19
        TabOrder = 5
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 342
        Top = 67
        Width = 130
        Height = 25
        DataField = 'CKID'
        DataSource = Data.sCgshzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sCk
        ParentColor = True
        TabOrder = 7
      end
      object DBComboBox2: TDBComboBox
        Left = 91
        Top = 66
        Width = 160
        Height = 27
        Style = csDropDownList
        DataField = 'aFPLX'
        DataSource = Data.sCgshzb
        ItemHeight = 19
        Items.Strings = (
          #25910#25454
          #26222#36890#21457#31080
          #22686#20540#31246#21457#31080)
        ParentColor = True
        TabOrder = 6
        OnChange = DBComboBox2Change
      end
      object DBComboBox3: TDBComboBox
        Left = 585
        Top = 5
        Width = 123
        Height = 27
        Style = csDropDownList
        DataField = 'aCGLX'
        DataSource = Data.sCgshzb
        ItemHeight = 19
        Items.Strings = (
          #29616#27454
          #25346#24080)
        ParentColor = True
        TabOrder = 2
        OnChange = DBComboBox2Change
      end
      object DBEdit5: TDBEdit
        Left = 91
        Top = 99
        Width = 157
        Height = 23
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'PH'
        DataSource = Data.sCgshzb
        TabOrder = 10
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 585
        Top = 67
        Width = 77
        Height = 25
        DataField = 'SFKFSID'
        DataSource = Data.sCgshzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sSfkfs
        ParentColor = True
        TabOrder = 8
        OnKeyDown = DBLookupComboBoxDelete
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 775
        Top = 67
        Width = 191
        Height = 25
        DataField = 'ZHID'
        DataSource = Data.sCgshzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sZh
        ParentColor = True
        TabOrder = 9
        OnKeyDown = DBLookupComboBoxDelete
      end
      object DBEdit4: TDBEdit
        Left = 360
        Top = 99
        Width = 47
        Height = 23
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'FKQX'
        DataSource = Data.sCgshzb
        TabOrder = 11
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
      DataSource = Data.sCgshzb
      TabOrder = 3
    end
    object pnlZt: TPanel
      Left = 816
      Top = 19
      Width = 145
      Height = 62
      BevelOuter = bvNone
      Caption = 'pnlZt'
      ParentColor = True
      TabOrder = 4
      Visible = False
      DesignSize = (
        145
        62)
      object spZt: TShape
        Left = 0
        Top = 0
        Width = 145
        Height = 62
        Align = alClient
        Brush.Color = 15793919
        Pen.Color = clGreen
        Pen.Width = 3
        Shape = stEllipse
      end
      object labZt: TLabel
        Left = 8
        Top = 8
        Width = 130
        Height = 46
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = #20184#27454#23436#27605
        Font.Charset = GB2312_CHARSET
        Font.Color = clGreen
        Font.Height = -30
        Font.Name = #38582#20070
        Font.Style = []
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 983
    inherited ToolBar1: TToolBar
      ButtonWidth = 67
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
        Action = aXzdd
        Caption = #36873#25321#35746#21333
      end
      object ToolButton2: TToolButton
        Left = 427
        Top = 0
        Action = aFkgc
        Caption = #20184#27454#36807#31243
      end
    end
    inherited ToolBar2: TToolBar
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sCgshzb
      end
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Action = aXzdd
      end
      object H1: TMenuItem
        Action = aFkgc
      end
    end
  end
  inherited ActionList1: TActionList
    object aXzdd: TAction
      Caption = #36873#25321#35746#21333'(&Z)'
      ImageIndex = 29
      ShortCut = 16474
      OnExecute = aXzddExecute
    end
    object aFkgc: TAction
      Caption = #20184#27454#36807#31243'(&H)'
      ImageIndex = 26
      ShortCut = 16456
      OnExecute = aFkgcExecute
    end
  end
end
