inherited frmCgfk: TfrmCgfk
  Left = 76
  Caption = #37319#36141#20184#27454#21333
  ClientWidth = 799
  OldCreateOrder = True
  PixelsPerInch = 120
  TextHeight = 19
  inherited Panel1: TPanel
    Width = 799
    inherited Label1: TLabel
      Width = 787
    end
    object Label14: TLabel [1]
      Left = 10
      Top = 512
      Width = 48
      Height = 19
      Caption = #22791#27880':'
    end
    inherited DBGrid1: TDBGrid
      Top = 184
      Width = 787
      Height = 258
      DataSource = Data.sCgfk
      TabOrder = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'aDDBH'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDDRQ'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDDJE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aYFJE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aMFJE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JE'
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 442
      Width = 787
      Height = 68
      inherited Label3: TLabel
        Top = 24
      end
      object Label7: TLabel [1]
        Left = 63
        Top = 8
        Width = 87
        Height = 19
        Caption = #24635' '#37329' '#39069':'
      end
      inherited Shape2: TShape
        Height = 112
      end
      object Label10: TLabel
        Left = 63
        Top = 38
        Width = 86
        Height = 19
        Caption = #24050#20184#24635#39069':'
      end
      object Label11: TLabel
        Left = 308
        Top = 38
        Width = 86
        Height = 19
        Caption = #26411#20184#24635#39069':'
      end
      object Label12: TLabel
        Left = 551
        Top = 38
        Width = 86
        Height = 19
        Caption = #20184#27454#24635#39069':'
      end
      object labJEA: TLabel
        Left = 152
        Top = 8
        Width = 114
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJEA'
      end
      object labJEB: TLabel
        Left = 152
        Top = 38
        Width = 114
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJEB'
      end
      object labJEC: TLabel
        Left = 394
        Top = 38
        Width = 114
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJEC'
      end
      object labJED: TLabel
        Left = 638
        Top = 38
        Width = 114
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJED'
      end
      object Shape1: TShape
        Left = 151
        Top = 29
        Width = 116
        Height = 1
      end
      object Shape3: TShape
        Left = 151
        Top = 60
        Width = 116
        Height = 1
      end
      object Shape4: TShape
        Left = 393
        Top = 60
        Width = 116
        Height = 1
      end
      object Shape5: TShape
        Left = 637
        Top = 60
        Width = 117
        Height = 1
      end
    end
    inherited Panel3: TPanel
      Width = 787
      Height = 149
      TabOrder = 0
      object Label4: TLabel [0]
        Left = 0
        Top = 41
        Width = 87
        Height = 19
        Caption = #20379' '#24212' '#21830':'
      end
      object Label9: TLabel [1]
        Left = 243
        Top = 10
        Width = 88
        Height = 19
        Caption = #21333'    '#21495':'
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
      object Label6: TLabel [4]
        Left = 0
        Top = 71
        Width = 86
        Height = 19
        Caption = #20184#27454#26041#24335':'
      end
      object Label8: TLabel [5]
        Left = 494
        Top = 41
        Width = 88
        Height = 19
        Caption = #31080'    '#21495':'
      end
      object Label13: TLabel [6]
        Left = 494
        Top = 10
        Width = 86
        Height = 19
        Caption = #20184#27454#31867#22411':'
      end
      object Label15: TLabel [7]
        Left = 448
        Top = 71
        Width = 86
        Height = 19
        Caption = #20184#27454#37329#39069':'
      end
      object Label5: TLabel [8]
        Left = 182
        Top = 71
        Width = 86
        Height = 19
        Caption = #20184#27454#26469#28304':'
      end
      inherited DBEdit1: TDBEdit
        Left = 91
        Width = 109
        DataField = 'RQ'
        DataSource = Data.sCgfkzb
      end
      object DBEdit2: TDBEdit
        Left = 91
        Top = 38
        Width = 129
        Height = 23
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aGYSBH'
        DataSource = Data.sCgfkzb
        TabOrder = 3
        OnDblClick = btnGysHelpClick
      end
      object DBEdit7: TDBEdit
        Left = 252
        Top = 38
        Width = 212
        Height = 23
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aGYSMC'
        DataSource = Data.sCgfkzb
        ReadOnly = True
        TabOrder = 4
        OnDblClick = btnGysHelpClick
      end
      object DBEdit6: TDBEdit
        Left = 334
        Top = 8
        Width = 130
        Height = 22
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sCgfkzb
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 91
        Top = 67
        Width = 77
        Height = 25
        DataField = 'SFKFSID'
        DataSource = Data.sCgfkzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sSfkfs
        ParentColor = True
        TabOrder = 6
      end
      object DBEdit3: TDBEdit
        Left = 585
        Top = 38
        Width = 198
        Height = 23
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'PH'
        DataSource = Data.sCgfkzb
        TabOrder = 5
        OnDblClick = btnGysHelpClick
      end
      object DBComboBox2: TDBComboBox
        Left = 585
        Top = 5
        Width = 114
        Height = 27
        Style = csDropDownList
        DataField = 'aFKLX'
        DataSource = Data.sCgfkzb
        ItemHeight = 19
        Items.Strings = (
          #24212#20184#27454
          #39044#20184#27454)
        ParentColor = True
        TabOrder = 2
        OnChange = DBComboBox2Change
      end
      object DBEdit4: TDBEdit
        Left = 540
        Top = 68
        Width = 114
        Height = 23
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'JE'
        DataSource = Data.sCgfkzb
        TabOrder = 8
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 274
        Top = 67
        Width = 160
        Height = 25
        DataField = 'ZHID'
        DataSource = Data.sCgfkzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sZh
        ParentColor = True
        TabOrder = 7
      end
      object pnlHint: TPanel
        Left = 0
        Top = 99
        Width = 784
        Height = 31
        BevelInner = bvLowered
        Color = 16776172
        TabOrder = 9
        object Label16: TLabel
          Left = 8
          Top = 8
          Width = 163
          Height = 19
          Caption = #32467#20313#27454'('#21547#39044#20184#27454'):'
        end
        object Label20: TLabel
          Left = 312
          Top = 8
          Width = 105
          Height = 19
          Caption = #21487#29992#24635#37329#39069':'
        end
        object Label17: TLabel
          Left = 555
          Top = 8
          Width = 105
          Height = 19
          Caption = #20184#27454#21518#20313#39069':'
        end
        object labJYJ: TLabel
          Left = 175
          Top = 8
          Width = 115
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'labJYJ'
        end
        object labKYZJE: TLabel
          Left = 418
          Top = 8
          Width = 115
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'labKYZJE'
        end
        object labFKHYE: TLabel
          Left = 661
          Top = 8
          Width = 115
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'labFKHYE'
        end
      end
      object DBCheckBox2: TDBCheckBox
        Left = 661
        Top = 68
        Width = 123
        Height = 23
        Caption = #20351#29992#32467#20313#27454
        DataField = 'SYJY'
        DataSource = Data.sCgfkzb
        TabOrder = 10
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = DBCheckBox2Click
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
      DataSource = Data.sCgfkzb
      TabOrder = 3
    end
    object pnlTs: TPanel
      Left = 143
      Top = 238
      Width = 511
      Height = 153
      BevelInner = bvLowered
      Color = 16776172
      TabOrder = 4
      Visible = False
      object Label18: TLabel
        Left = 23
        Top = 46
        Width = 384
        Height = 19
        Caption = #21487#29992#24635#37329#39069' = '#20184#27454#37329#39069' + '#32467#20313#27454'('#21547#39044#20184#27454')'
      end
      object Label19: TLabel
        Left = 23
        Top = 76
        Width = 478
        Height = 19
        Caption = #20184#27454#21518#20313#39069' = '#21487#29992#24635#37329#39069' - '#20184#27454#24635#39069#65288#26412#27425#20184#27454#21512#35745#65289
      end
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 507
        Height = 27
        Align = alTop
        Alignment = taLeftJustify
        Caption = ' '#35828#26126
        Color = clTeal
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindow
        Font.Height = -18
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          507
          27)
        object SpeedButton1: TSpeedButton
          Left = 478
          Top = 3
          Width = 27
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'X'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -18
          Font.Name = '@System'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnCloseTsClick
        end
      end
      object btnCloseTs: TButton
        Left = 215
        Top = 106
        Width = 95
        Height = 32
        Caption = #20851#38381
        Default = True
        TabOrder = 1
        OnClick = btnCloseTsClick
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 799
    inherited ToolBar1: TToolBar
      ButtonWidth = 83
      object ToolButton1: TToolButton
        Left = 352
        Top = 0
        Action = aZdfk
        Caption = #20184#27454'('#25152#26377')'
      end
      object ToolButton2: TToolButton
        Left = 435
        Top = 0
        Action = aZdfkB
        Caption = #20184#27454'('#24403#21069')'
      end
    end
    inherited ToolBar2: TToolBar
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sCgfkzb
      end
    end
  end
  inherited MainMenu1: TMainMenu
    Left = 24
    Top = 282
    inherited smnEdit: TMenuItem
      inherited N4: TMenuItem
        Visible = False
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Action = aCKGJD
      end
      object N8: TMenuItem
        Action = aZdfk
      end
      object N13: TMenuItem
        Action = aZdfkB
      end
    end
    inherited Stool: TMenuItem
      object N14: TMenuItem
        Caption = '-'
      end
      object N15: TMenuItem
        Action = aTs
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 24
    Top = 330
  end
  inherited ActionList1: TActionList
    Left = 24
    Top = 234
    inherited aInsert: TAction
      Visible = False
    end
    inherited aDelete: TAction
      Visible = False
    end
    object aCKGJD: TAction
      Caption = #26597#30475#36141#36827#21333'(&H)'
      ImageIndex = 9
      ShortCut = 16456
      OnExecute = aCKGJDExecute
    end
    object aZdfk: TAction
      Caption = #33258#21160#20184#27454'('#25152#26377')'
      ImageIndex = 29
      ShortCut = 16460
      OnExecute = aZdfkExecute
    end
    object aZdfkB: TAction
      Caption = #33258#21160#20184#27454'('#24403#21069#25910#36135#21333')'
      ImageIndex = 12
      ShortCut = 16450
      OnExecute = aZdfkBExecute
    end
    object aTs: TAction
      Caption = #35828#26126'...'
      OnExecute = aTsExecute
    end
  end
end
