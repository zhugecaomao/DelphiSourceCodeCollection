inherited frmXsThgc: TfrmXsThgc
  Left = 5
  Top = 29
  Caption = '销售订单提货过程'
  ClientWidth = 776
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 776
    inherited Label1: TLabel
      Width = 764
    end
    inherited DBGrid1: TDBGrid
      Top = 61
      Width = 764
      DataSource = Data.sXsThgc
      Columns = <
        item
          Expanded = False
          FieldName = 'RQ'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJBH'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BH'
          PickList.Strings = ()
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PM'
          PickList.Strings = ()
          Width = 288
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DW'
          PickList.Strings = ()
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
          FieldName = 'NSL'
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
      Top = 389
      Width = 764
      inherited Label3: TLabel
        Top = 6
      end
      object DBText1: TDBText
        Left = 275
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sXsddzb
      end
      object Label6: TLabel
        Left = 198
        Top = 7
        Width = 68
        Height = 15
        Caption = '订单金额:'
      end
      object Label7: TLabel
        Left = 393
        Top = 7
        Width = 68
        Height = 15
        Caption = '已提金额:'
      end
      object labJEA: TLabel
        Tag = 1
        Left = 461
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJEA'
      end
      object Label8: TLabel
        Left = 585
        Top = 7
        Width = 68
        Height = 15
        Caption = '未提金额:'
      end
      object labJEB: TLabel
        Tag = 1
        Left = 653
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJEB'
      end
    end
    inherited Panel3: TPanel
      Width = 764
      Height = 32
      inherited Label2: TLabel
        Left = 144
        Caption = '订购单号:'
      end
      object Label4: TLabel [1]
        Left = 0
        Top = 8
        Width = 38
        Height = 15
        Caption = '日期:'
      end
      object Label5: TLabel [2]
        Left = 348
        Top = 8
        Width = 38
        Height = 15
        Caption = '客户:'
      end
      inherited DBEdit1: TDBEdit
        Left = 218
        Width = 102
        DataSource = Data.sXsddzb
      end
      object DBEdit2: TDBEdit
        Left = 42
        Top = 6
        Width = 86
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'RQ'
        DataSource = Data.sXsddzb
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 480
        Top = 6
        Width = 188
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHMC'
        DataSource = Data.sXsddzb
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 390
        Top = 6
        Width = 86
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHBH'
        DataSource = Data.sXsddzb
        TabOrder = 3
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 776
    inherited ToolBar2: TToolBar
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sXsddzb
      end
    end
  end
end
