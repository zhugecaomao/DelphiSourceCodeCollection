object DLForm: TDLForm
  Left = 67
  Top = 291
  Width = 1018
  Height = 595
  Caption = #20195#29702#31383#20307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 41
    Width = 1010
    Height = 103
    ParentColor = True
    Align = alTop
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 27
      Top = 29
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
      Left = 183
      Top = 29
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #20844#21496#21517#31216
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 26
      Top = 69
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #31665#22411
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel4: TAALabel
      Left = 482
      Top = 30
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #30446#30340#28207
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel5: TAALabel
      Left = 735
      Top = 29
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #30446#30340#22320
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel6: TAALabel
      Left = 201
      Top = 67
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #21333#20215
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object Edit1: TEdit
      Left = 61
      Top = 26
      Width = 110
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 246
      Top = 27
      Width = 217
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyPress = Edit2KeyPress
    end
    object Edit4: TEdit
      Left = 530
      Top = 27
      Width = 184
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnKeyPress = Edit4KeyPress
    end
    object Edit5: TEdit
      Left = 248
      Top = 65
      Width = 110
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object Edit6: TEdit
      Left = 787
      Top = 27
      Width = 185
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnKeyPress = Edit6KeyPress
    end
    object FlatComboBox1: TFlatComboBox
      Left = 60
      Top = 64
      Width = 111
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ItemHeight = 13
      Items.Strings = (
        '20'
        '40'
        '40HC'
        '20X2')
      TabOrder = 4
      ItemIndex = -1
      OnKeyPress = FlatComboBox1KeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 144
    Width = 1010
    Height = 424
    Align = alClient
    Color = clInfoBk
    Ctl3D = False
    DataSource = DM.DL_XXSource
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'DL_ID'
        Title.Alignment = taCenter
        Title.Caption = #32534#21495
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DL_GONGSI'
        Title.Alignment = taCenter
        Title.Caption = #20844#21496#21517#31216
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DL_END'
        Title.Alignment = taCenter
        Title.Caption = #30446#30340#28207
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DL_MUDI'
        Title.Alignment = taCenter
        Title.Caption = #30446#30340#22320
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DL_BOX'
        Title.Alignment = taCenter
        Title.Caption = #31665#22411
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DL_PRICE'
        Title.Alignment = taCenter
        Title.Caption = #21333#20215
        Width = 100
        Visible = True
      end>
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 41
    ParentColor = True
    Align = alTop
    TabOrder = 2
    object FlatButton1: TFlatButton
      Left = 2
      Top = 2
      Width = 48
      Height = 37
      Caption = #28155#21152
      TabOrder = 0
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 51
      Top = 2
      Width = 48
      Height = 37
      Caption = #20462#25913
      TabOrder = 1
      OnClick = FlatButton2Click
    end
    object FlatButton3: TFlatButton
      Left = 100
      Top = 2
      Width = 48
      Height = 37
      Caption = #21024#38500
      TabOrder = 2
      OnClick = FlatButton3Click
    end
    object FlatButton4: TFlatButton
      Left = 149
      Top = 2
      Width = 48
      Height = 37
      Caption = #20445#23384
      TabOrder = 3
      OnClick = FlatButton4Click
    end
    object FlatButton5: TFlatButton
      Left = 294
      Top = 2
      Width = 48
      Height = 37
      Caption = #20851#38381
      TabOrder = 4
      OnClick = FlatButton5Click
    end
    object FlatButton6: TFlatButton
      Left = 198
      Top = 2
      Width = 48
      Height = 37
      Caption = #26597#35810
      TabOrder = 5
      OnClick = FlatButton6Click
    end
    object FlatButton7: TFlatButton
      Left = 247
      Top = 2
      Width = 46
      Height = 37
      Caption = #25171#21360
      TabOrder = 6
      OnClick = FlatButton7Click
    end
  end
end
