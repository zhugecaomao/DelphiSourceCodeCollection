object YWYForm: TYWYForm
  Left = 317
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #19994#21153#21592#20449#24687
  ClientHeight = 356
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 356
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 5
      Top = 58
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #32534#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel2: TAALabel
      Left = 143
      Top = 58
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #22995#21517
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 278
      Top = 59
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #24615#21035
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel4: TAALabel
      Left = 408
      Top = 59
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #22791#27880
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object Shape1: TShape
      Left = 2
      Top = 29
      Width = 587
      Height = -1
    end
    object FlatButton1: TFlatButton
      Left = 77
      Top = 2
      Width = 57
      Height = 25
      Caption = #28155#21152
      TabOrder = 0
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 193
      Top = 2
      Width = 57
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
      OnClick = FlatButton2Click
    end
    object FlatButton3: TFlatButton
      Left = 316
      Top = 2
      Width = 57
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = FlatButton3Click
    end
    object FlatButton4: TFlatButton
      Left = 442
      Top = 2
      Width = 57
      Height = 25
      Caption = #20445#23384
      TabOrder = 3
      OnClick = FlatButton4Click
    end
    object FlatComboBox1: TFlatComboBox
      Left = 307
      Top = 55
      Width = 97
      Height = 21
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        #30007
        #22899)
      ParentFont = False
      TabOrder = 4
      ItemIndex = -1
      OnKeyPress = FlatComboBox1KeyPress
    end
    object Edit1: TEdit
      Left = 33
      Top = 56
      Width = 105
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 172
      Top = 56
      Width = 105
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 435
      Top = 56
      Width = 152
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 88
      Width = 589
      Height = 265
      Color = clInfoBk
      Ctl3D = False
      DataSource = DM.YWYSource
      ParentCtl3D = False
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'YWYID'
          Title.Alignment = taCenter
          Title.Caption = #32534#21495
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'YWYNAME'
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'YWYSEX'
          Title.Alignment = taCenter
          Title.Caption = #24615#21035
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'YWYBZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Width = 250
          Visible = True
        end>
    end
  end
end
