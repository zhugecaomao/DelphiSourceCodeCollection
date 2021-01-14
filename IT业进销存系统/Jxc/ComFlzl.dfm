inherited frmComFlzl: TfrmComFlzl
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    inherited labSort: TLabel
      Anchors = [akLeft, akTop, akRight]
    end
    inherited labSearch: TLabel
      Anchors = [akLeft, akTop, akRight]
    end
    object CheckBox1: TCheckBox
      Left = 286
      Top = 17
      Width = 57
      Height = 17
      Hint = '是否按选定的类别查看资料 (F2)'
      Caption = '类别:'
      Checked = True
      Color = cl3DLight
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = '宋体'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 344
      Top = 14
      Width = 160
      Height = 23
      DropDownAlign = daCenter
      DropDownRows = 10
      TabOrder = 0
      OnCloseUp = DBLookupComboBox1CloseUp
      OnEnter = DBLookupComboBox1Enter
      OnKeyDown = DBLookupComboBox1KeyDown
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object mnuViewMode: TMenuItem [6]
        Action = aViewMode
      end
      object mnuSetViewMode: TMenuItem [7]
        Action = aSetViewMode
      end
      object LineE3: TMenuItem [8]
        Caption = '-'
      end
    end
  end
  inherited ActionList1: TActionList
    object aViewMode: TAction [9]
      Caption = '按类别查看(&C)'
      Checked = True
      ShortCut = 113
      OnExecute = aViewModeExecute
    end
    object aSetViewMode: TAction [10]
      Caption = '类别设置(&E)'
      ShortCut = 115
      OnExecute = aSetViewModeExecute
    end
  end
end
