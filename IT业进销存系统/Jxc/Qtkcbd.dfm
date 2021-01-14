inherited frmQtkcbd: TfrmQtkcbd
  Left = 10
  Top = 22
  Caption = '其它库存变动'
  ClientWidth = 760
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 760
    inherited Label1: TLabel
      Width = 748
    end
    object Label14: TLabel [1]
      Left = 8
      Top = 404
      Width = 38
      Height = 15
      Caption = '备注:'
    end
    inherited DBGrid1: TDBGrid
      Top = 85
      Width = 748
      Height = 282
      DataSource = Data.sQtkcbd
      TabOrder = 2
      Columns = <
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
        end
        item
          Expanded = False
          FieldName = 'DJ'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cJE'
          PickList.Strings = ()
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'THSL'
          PickList.Strings = ()
          ReadOnly = True
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 367
      Width = 748
      object Label7: TLabel [1]
        Left = 584
        Top = 7
        Width = 53
        Height = 15
        Caption = '总金额:'
      end
      object DBText1: TDBText [2]
        Left = 638
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sQtkcbdzb
      end
    end
    inherited Panel3: TPanel
      Width = 748
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
      object Label5: TLabel [2]
        Left = 480
        Top = 6
        Width = 68
        Height = 15
        Caption = '相关信息:'
      end
      object Label6: TLabel [3]
        Left = 303
        Top = 8
        Width = 68
        Height = 15
        Alignment = taRightJustify
        Caption = '变动仓库:'
      end
      object Label4: TLabel [4]
        Left = 0
        Top = 32
        Width = 98
        Height = 15
        Caption = '库存变动类型:'
      end
      object Label10: TLabel [5]
        Left = 234
        Top = 32
        Width = 98
        Height = 15
        Caption = '出入仓库类型:'
        FocusControl = DBEdit5
      end
      object Label11: TLabel [6]
        Left = 480
        Top = 30
        Width = 98
        Height = 15
        Caption = '是否需要退还:'
        FocusControl = DBEdit7
      end
      inherited DBEdit1: TDBEdit
        Left = 42
        Width = 86
        DataField = 'RQ'
        DataSource = Data.sQtkcbdzb
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
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 378
        Top = 5
        Width = 86
        Height = 21
        DataField = 'CKID'
        DataSource = Data.sQtkcbdzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sCk
        ParentColor = True
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 553
        Top = 6
        Width = 193
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'XGXX'
        DataSource = Data.sQtkcbdzb
        TabOrder = 3
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
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 583
        Top = 28
        Width = 48
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aTH'
        DataSource = Data.sQtkcbdzb
        ReadOnly = True
        TabOrder = 6
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
        TabOrder = 4
      end
    end
    object DBEdit12: TDBEdit
      Left = 51
      Top = 403
      Width = 320
      Height = 18
      BorderStyle = bsNone
      Color = cl3DLight
      DataField = 'BZ'
      DataSource = Data.sQtkcbdzb
      TabOrder = 3
    end
  end
  inherited ControlBar1: TControlBar
    Width = 760
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
        Caption = '退还过程'
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
      object N12: TMenuItem
        Caption = '-'
      end
      object T1: TMenuItem
        Action = aThgc
      end
    end
  end
  inherited ActionList1: TActionList
    object aThgc: TAction
      Caption = '退还过程(&T)'
      ImageIndex = 29
      ShortCut = 16468
      OnExecute = aThgcExecute
    end
  end
end
