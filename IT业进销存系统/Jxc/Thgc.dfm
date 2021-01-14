inherited frmThgc: TfrmThgc
  Left = 77
  Top = 21
  Caption = '退还过程'
  ClientWidth = 682
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 682
    inherited Label1: TLabel
      Width = 670
    end
    inherited Panel2: TPanel [1]
      Left = 161
      Top = 355
      Width = 56
      Align = alNone
      Visible = False
    end
    inherited DBGrid1: TDBGrid [2]
      Top = 85
      Width = 670
      Height = 335
      DataSource = Data.sThgc
      TabOrder = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'RQ'
          PickList.Strings = ()
          Width = 94
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'aBH'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aPM'
          PickList.Strings = ()
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDW'
          PickList.Strings = ()
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SL'
          PickList.Strings = ()
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      Width = 670
      Height = 56
      TabOrder = 0
      object Label9: TLabel [0]
        Left = 143
        Top = 8
        Width = 38
        Height = 15
        Caption = '单号:'
      end
      inherited Label2: TLabel
        Width = 38
        Caption = '日期:'
      end
      object Label6: TLabel [2]
        Left = 306
        Top = 8
        Width = 68
        Height = 15
        Caption = '变动仓库:'
      end
      object Label4: TLabel [3]
        Left = 0
        Top = 32
        Width = 98
        Height = 15
        Caption = '库存变动类型:'
      end
      object Label10: TLabel [4]
        Left = 234
        Top = 32
        Width = 98
        Height = 15
        Caption = '出入仓库类型:'
        FocusControl = DBEdit5
      end
      inherited DBEdit1: TDBEdit
        Left = 42
        Width = 86
        DataField = 'RQ'
        DataSource = Data.sQtkcbdzb
        ReadOnly = True
      end
      object DBEdit6: TDBEdit
        Left = 187
        Top = 6
        Width = 102
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sQtkcbdzb
        ReadOnly = True
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 378
        Top = 5
        Width = 85
        Height = 21
        DataField = 'CKID'
        DataSource = Data.sQtkcbdzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sCk
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 336
        Top = 30
        Width = 128
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aCRLX'
        DataSource = Data.sQtkcbdzb
        ReadOnly = True
        TabOrder = 4
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 102
        Top = 29
        Width = 113
        Height = 21
        DataField = 'QTKCBDLXID'
        DataSource = Data.sQtkcbdzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sQtkcbdlx
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 682
    inherited ToolBar1: TToolBar
      ButtonWidth = 67
      object ToolButton1: TToolButton
        Left = 352
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 360
        Top = 0
        Action = aThgc
        Caption = '全部还清'
      end
    end
    inherited ToolBar2: TToolBar
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sQtkcbdzb
      end
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object T1: TMenuItem
        Action = aThgc
      end
    end
  end
  inherited ActionList1: TActionList
    inherited aNew: TAction
      Tag = 1
    end
    inherited aDel: TAction
      Tag = 1
    end
    object aThgc: TAction
      Caption = '全部还清(&A)'
      ImageIndex = 29
      ShortCut = 16449
      OnExecute = aThgcExecute
    end
  end
end
