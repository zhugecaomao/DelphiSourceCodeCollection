inherited frmCkdb: TfrmCkdb
  Left = 9
  Top = 6
  Caption = '仓库调拨单'
  ClientWidth = 717
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 717
    inherited Label1: TLabel
      Width = 705
    end
    object Label14: TLabel [1]
      Left = 8
      Top = 404
      Width = 38
      Height = 15
      Caption = '备注:'
    end
    inherited DBGrid1: TDBGrid
      Top = 61
      Width = 705
      Height = 306
      DataSource = Data.sCkdb
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
        end>
    end
    inherited Panel2: TPanel
      Top = 367
      Width = 705
      object Label7: TLabel [1]
        Left = 542
        Top = 7
        Width = 53
        Height = 15
        Caption = '总金额:'
      end
      object DBText1: TDBText [2]
        Left = 596
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sCkdbzb
      end
    end
    inherited Panel3: TPanel
      Width = 705
      Height = 32
      TabOrder = 0
      object Label9: TLabel [0]
        Left = 155
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
        Left = 330
        Top = 8
        Width = 53
        Height = 15
        Caption = '调出仓:'
      end
      object Label4: TLabel [3]
        Left = 531
        Top = 8
        Width = 53
        Height = 15
        Caption = '调入仓:'
      end
      inherited DBEdit1: TDBEdit
        Left = 42
        Width = 86
        DataField = 'RQ'
        DataSource = Data.sCkdbzb
      end
      object DBEdit6: TDBEdit
        Left = 199
        Top = 6
        Width = 102
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sCkdbzb
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 390
        Top = 5
        Width = 113
        Height = 21
        DataField = 'DCCID'
        DataSource = Data.sCkdbzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sCk
        ParentColor = True
        TabOrder = 2
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 591
        Top = 5
        Width = 113
        Height = 21
        DataField = 'DRCID'
        DataSource = Data.sCkdbzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sCk
        ParentColor = True
        TabOrder = 3
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
      DataSource = Data.sCkdbzb
      TabOrder = 3
    end
  end
  inherited ControlBar1: TControlBar
    Width = 717
    inherited ToolBar2: TToolBar
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sCkdbzb
      end
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = '选择订单(&Z)'
        ImageIndex = 29
        ShortCut = 16474
      end
      object H1: TMenuItem
        Caption = '付款过程(&H)'
        ImageIndex = 26
        ShortCut = 16456
      end
    end
  end
end
