inherited frmTl: TfrmTl
  Left = 9
  Top = 6
  Caption = #36864#26009#21333
  ClientWidth = 908
  OldCreateOrder = True
  PixelsPerInch = 120
  TextHeight = 19
  inherited Panel1: TPanel
    Width = 908
    inherited Label1: TLabel
      Width = 896
    end
    object Label14: TLabel [1]
      Left = 10
      Top = 512
      Width = 48
      Height = 19
      Caption = #22791#27880':'
    end
    inherited DBGrid1: TDBGrid
      Top = 85
      Width = 896
      Height = 387
      DataSource = Data.sTl
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
          FieldName = 'cJE'
          ReadOnly = True
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 472
      Width = 896
      object Label7: TLabel [1]
        Left = 687
        Top = 9
        Width = 67
        Height = 19
        Caption = #24635#37329#39069':'
      end
      object DBText1: TDBText [2]
        Left = 755
        Top = 6
        Width = 114
        Height = 23
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sTlzb
      end
    end
    inherited Panel3: TPanel
      Width = 896
      Height = 50
      TabOrder = 0
      object Label9: TLabel [0]
        Left = 196
        Top = 10
        Width = 48
        Height = 19
        Caption = #21333#21495':'
      end
      inherited Label2: TLabel
        Width = 48
        Caption = #26085#26399':'
      end
      object Label5: TLabel [2]
        Left = 676
        Top = 10
        Width = 67
        Height = 19
        Caption = #36864#26009#20154':'
      end
      object Label6: TLabel [3]
        Left = 418
        Top = 10
        Width = 67
        Height = 19
        Caption = #36864#26009#20179':'
      end
      inherited DBEdit1: TDBEdit
        Left = 53
        Width = 109
        DataField = 'RQ'
        DataSource = Data.sTlzb
      end
      object DBEdit6: TDBEdit
        Left = 252
        Top = 8
        Width = 129
        Height = 22
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sTlzb
        TabOrder = 1
      end
      object DBComboBox1: TDBComboBox
        Left = 752
        Top = 5
        Width = 144
        Height = 27
        Color = 15793919
        DataField = 'JSR'
        DataSource = Data.sTlzb
        ItemHeight = 19
        TabOrder = 3
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 494
        Top = 6
        Width = 143
        Height = 25
        DataField = 'CKID'
        DataSource = Data.sTlzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sCk
        ParentColor = True
        TabOrder = 2
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
      DataSource = Data.sTlzb
      TabOrder = 3
    end
  end
  inherited ControlBar1: TControlBar
    Width = 908
    inherited ToolBar2: TToolBar
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sTlzb
      end
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #36873#25321#35746#21333'(&Z)'
        ImageIndex = 29
        ShortCut = 16474
      end
      object H1: TMenuItem
        Caption = #20184#27454#36807#31243'(&H)'
        ImageIndex = 26
        ShortCut = 16456
      end
    end
  end
end
