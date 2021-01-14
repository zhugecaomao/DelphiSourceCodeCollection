object CDForm: TCDForm
  Left = 20
  Top = 178
  Width = 981
  Height = 519
  Caption = #38470#36816#20449#24687
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
    Width = 973
    Height = 64
    ParentColor = True
    Align = alTop
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 57
      Top = 25
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
    object AALabel3: TAALabel
      Left = 610
      Top = 26
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
      Left = 273
      Top = 26
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #25176#36816#22320#22336
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel5: TAALabel
      Left = 808
      Top = 26
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
      Left = 94
      Top = 23
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
    object Edit4: TEdit
      Left = 333
      Top = 23
      Width = 204
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
      OnKeyPress = Edit4KeyPress
    end
    object Edit5: TEdit
      Left = 840
      Top = 23
      Width = 104
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
    end
    object FlatComboBox1: TFlatComboBox
      Left = 642
      Top = 22
      Width = 103
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
        '20'
        '40'
        '40HC'
        '20X2')
      ParentFont = False
      TabOrder = 2
      ItemIndex = -1
      OnKeyPress = FlatComboBox1KeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 973
    Height = 387
    Align = alClient
    Color = clInfoBk
    Ctl3D = False
    DataSource = DM.LY_XXSource
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
        FieldName = 'LY_ID'
        Title.Alignment = taCenter
        Title.Caption = #32534#21495
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LY_MUDI'
        Title.Alignment = taCenter
        Title.Caption = #25176#36816#22320#22336
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LY_BOX'
        Title.Alignment = taCenter
        Title.Caption = #31665#22411
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LY_PRICE'
        Title.Alignment = taCenter
        Title.Caption = #21333#20215
        Width = 100
        Visible = True
      end>
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 0
    Width = 973
    Height = 41
    ParentColor = True
    Align = alTop
    TabOrder = 2
    object FlatButton5: TFlatButton
      Left = 202
      Top = 2
      Width = 49
      Height = 37
      Caption = #26597#35810
      TabOrder = 0
      OnClick = FlatButton5Click
    end
    object FlatButton6: TFlatButton
      Left = 302
      Top = 2
      Width = 49
      Height = 37
      Caption = #20851#38381
      TabOrder = 1
      OnClick = FlatButton6Click
    end
    object FlatButton4: TFlatButton
      Left = 152
      Top = 2
      Width = 49
      Height = 37
      Caption = #20445#23384
      TabOrder = 2
      OnClick = FlatButton4Click
    end
    object FlatButton3: TFlatButton
      Left = 102
      Top = 2
      Width = 49
      Height = 37
      Caption = #21024#38500
      TabOrder = 3
      OnClick = FlatButton3Click
    end
    object FlatButton2: TFlatButton
      Left = 52
      Top = 2
      Width = 49
      Height = 37
      Caption = #20462#25913
      TabOrder = 4
      OnClick = FlatButton2Click
    end
    object FlatButton1: TFlatButton
      Left = 2
      Top = 2
      Width = 49
      Height = 37
      Caption = #28155#21152
      TabOrder = 5
      OnClick = FlatButton1Click
    end
    object FlatButton7: TFlatButton
      Left = 252
      Top = 1
      Width = 49
      Height = 38
      Caption = #25171#21360
      TabOrder = 6
      OnClick = FlatButton7Click
    end
  end
end
