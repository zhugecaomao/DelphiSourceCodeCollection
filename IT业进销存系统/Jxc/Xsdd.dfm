inherited frmXsdd: TfrmXsdd
  Left = 7
  Top = 18
  Caption = '销售订单'
  ClientWidth = 776
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited ControlBar1: TControlBar [0]
    Width = 776
    inherited ToolBar1: TToolBar
      Width = 428
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
        Action = aGc
        Caption = '提货过程'
      end
    end
    inherited ToolBar2: TToolBar
      Left = 452
      Width = 80
      Align = alNone
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sXsddzb
      end
    end
    inherited ToolBar3: TToolBar
      Left = 545
    end
  end
  inherited Panel1: TPanel [1]
    Width = 776
    inherited Label1: TLabel
      Width = 764
    end
    object Label14: TLabel [1]
      Left = 8
      Top = 404
      Width = 38
      Height = 15
      Caption = '备注:'
    end
    inherited DBGrid1: TDBGrid
      Top = 109
      Width = 764
      Height = 258
      DataSource = Data.sXsdd
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
          FieldName = 'NSL'
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
          FieldName = 'aYTSL'
          PickList.Strings = ()
          ReadOnly = True
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 367
      Width = 764
      object Label7: TLabel [1]
        Left = 602
        Top = 7
        Width = 53
        Height = 15
        Caption = '总金额:'
      end
      object DBText1: TDBText [2]
        Left = 656
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sXsddzb
      end
    end
    inherited Panel3: TPanel
      Width = 764
      Height = 80
      TabOrder = 0
      object Label4: TLabel [0]
        Left = 0
        Top = 32
        Width = 70
        Height = 15
        Caption = '客    户:'
      end
      object Label9: TLabel [1]
        Left = 198
        Top = 8
        Width = 70
        Height = 15
        Caption = '单    号:'
      end
      object btnKhHelp: TSpeedButton [2]
        Left = 182
        Top = 30
        Width = 20
        Height = 18
        Hint = '选择客户'
        Caption = '…'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnKhHelpClick
      end
      inherited Label2: TLabel
        Width = 70
        Caption = '日    期:'
      end
      object Label6: TLabel [4]
        Left = 0
        Top = 56
        Width = 68
        Height = 15
        Caption = '交货日期:'
        FocusControl = DBEdit4
      end
      object Label8: TLabel [5]
        Left = 198
        Top = 56
        Width = 68
        Height = 15
        Caption = '交货地点:'
        FocusControl = DBEdit8
      end
      object Label5: TLabel [6]
        Left = 420
        Top = 32
        Width = 53
        Height = 15
        Caption = '业务员:'
      end
      inherited DBEdit1: TDBEdit
        Left = 78
        Width = 86
        DataField = 'RQ'
        DataSource = Data.sXsddzb
      end
      object DBEdit2: TDBEdit
        Left = 78
        Top = 30
        Width = 102
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHBH'
        DataSource = Data.sXsddzb
        TabOrder = 2
        OnDblClick = btnKhHelpClick
      end
      object DBEdit7: TDBEdit
        Left = 205
        Top = 30
        Width = 175
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHMC'
        DataSource = Data.sXsddzb
        ReadOnly = True
        TabOrder = 3
        OnDblClick = btnKhHelpClick
      end
      object DBEdit6: TDBEdit
        Left = 278
        Top = 6
        Width = 102
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        DataSource = Data.sXsddzb
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 78
        Top = 54
        Width = 86
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'JHRQ'
        DataSource = Data.sXsddzb
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 278
        Top = 54
        Width = 323
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'JHDD'
        DataSource = Data.sXsddzb
        TabOrder = 6
      end
      object DBComboBox1: TDBComboBox
        Left = 480
        Top = 28
        Width = 123
        Height = 23
        Color = 15793919
        DataField = 'YWY'
        DataSource = Data.sXsddzb
        ItemHeight = 15
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
      DataSource = Data.sXsddzb
      TabOrder = 3
    end
    object pnlZt: TPanel
      Left = 644
      Top = 15
      Width = 115
      Height = 49
      BevelOuter = bvNone
      Caption = 'pnlZt'
      ParentColor = True
      TabOrder = 4
      Visible = False
      object spZt: TShape
        Left = 0
        Top = 0
        Width = 115
        Height = 49
        Align = alClient
        Brush.Color = 15793919
        Pen.Color = clGreen
        Pen.Width = 3
        Shape = stEllipse
      end
      object labZt: TLabel
        Left = 6
        Top = 6
        Width = 103
        Height = 37
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = '执行完毕'
        Font.Charset = GB2312_CHARSET
        Font.Color = clGreen
        Font.Height = -24
        Font.Name = '隶书'
        Font.Style = []
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
    end
    object DBCheckBox1: TDBCheckBox
      Left = 648
      Top = 84
      Width = 109
      Height = 17
      Caption = '订单中止执行'
      DataField = 'ZT'
      DataSource = Data.sXsddzb
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
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
      object H1: TMenuItem
        Action = aGc
      end
    end
  end
  inherited ActionList1: TActionList
    object aKhXx: TAction
      Caption = '客户资料(&K)'
      ImageIndex = 9
      ShortCut = 16459
      OnExecute = aKhXxExecute
    end
    object aGc: TAction
      Caption = '提货过程(&H)'
      ImageIndex = 26
      ShortCut = 16456
      OnExecute = aGcExecute
    end
  end
end
