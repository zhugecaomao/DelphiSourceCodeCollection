inherited frmQtsr: TfrmQtsr
  Left = 68
  Top = 39
  Caption = '其它收入'
  ClientWidth = 663
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 663
    inherited Label1: TLabel
      Width = 651
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
      Width = 651
      Height = 282
      DataSource = Data.sQtsr
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
          FieldName = 'aMC'
          PickList.Strings = ()
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZY'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JE'
          PickList.Strings = ()
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 367
      Width = 651
      object Label7: TLabel [1]
        Left = 488
        Top = 7
        Width = 53
        Height = 15
        Caption = '总金额:'
      end
      object DBText1: TDBText [2]
        Left = 542
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sQtsrzb
      end
    end
    inherited Panel3: TPanel
      Width = 651
      Height = 56
      TabOrder = 0
      object Label9: TLabel [0]
        Left = 179
        Top = 8
        Width = 70
        Height = 15
        Caption = '单    号:'
      end
      inherited Label2: TLabel
        Width = 70
        Caption = '日    期:'
      end
      object Label5: TLabel [2]
        Left = 426
        Top = 8
        Width = 53
        Height = 15
        Caption = '经办人:'
      end
      object Label18: TLabel [3]
        Left = 426
        Top = 32
        Width = 54
        Height = 15
        Caption = '票  号:'
      end
      object Label16: TLabel [4]
        Left = 1
        Top = 32
        Width = 68
        Height = 15
        Caption = '收款方式:'
      end
      object Label17: TLabel [5]
        Left = 179
        Top = 32
        Width = 68
        Height = 15
        Caption = '收款去向:'
      end
      inherited DBEdit1: TDBEdit
        Left = 72
        Width = 86
        DataField = 'RQ'
        DataSource = Data.sQtsrzb
      end
      object DBEdit6: TDBEdit
        Left = 253
        Top = 6
        Width = 102
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sQtsrzb
        TabOrder = 1
      end
      object DBComboBox1: TDBComboBox
        Left = 486
        Top = 4
        Width = 97
        Height = 23
        Color = 15793919
        DataField = 'JSR'
        DataSource = Data.sQtsrzb
        ItemHeight = 15
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 486
        Top = 30
        Width = 163
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'PH'
        DataSource = Data.sQtsrzb
        TabOrder = 5
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 72
        Top = 29
        Width = 86
        Height = 21
        DataField = 'SFKFSID'
        DataSource = Data.sQtsrzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sSfkfs
        ParentColor = True
        TabOrder = 3
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 253
        Top = 29
        Width = 151
        Height = 21
        DataField = 'ZHID'
        DataSource = Data.sQtsrzb
        KeyField = 'ID'
        ListField = 'MC'
        ListSource = Data.sZh
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
      DataSource = Data.sQtsrzb
      TabOrder = 3
    end
  end
  inherited ControlBar1: TControlBar
    Width = 663
    inherited ToolBar2: TToolBar
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sQtsrzb
      end
    end
  end
end
