object YHGLForm: TYHGLForm
  Left = 252
  Top = 201
  BorderStyle = bsDialog
  Caption = #29992#25143#31649#29702
  ClientHeight = 299
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 179
    Width = 400
    Height = 120
    Align = alBottom
    Color = clInfoBk
    Ctl3D = False
    DataSource = DM.UseNameSource
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
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
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PASS'
        Title.Alignment = taCenter
        Title.Caption = #21475#20196
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'POPEDOM'
        Title.Alignment = taCenter
        Title.Caption = #26435#38480
        Width = 100
        Visible = True
      end>
  end
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 179
    ParentColor = True
    Align = alClient
    TabOrder = 1
    object AALabel1: TAALabel
      Left = 80
      Top = 34
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #29992#25143#21517#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel2: TAALabel
      Left = 84
      Top = 71
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #21475' '#20196#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 85
      Top = 109
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26435' '#38480#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object Edit1: TEdit
      Left = 159
      Top = 32
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 160
      Top = 68
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object FlatGroupBox1: TFlatGroupBox
      Left = 0
      Top = 145
      Width = 357
      Height = 26
      TabOrder = 2
      object FlatButton1: TFlatButton
        Left = 23
        Top = 2
        Width = 35
        Height = 22
        Caption = #28155#21152
        TabOrder = 0
        OnClick = FlatButton1Click
      end
      object FlatButton3: TFlatButton
        Left = 201
        Top = 2
        Width = 35
        Height = 22
        Caption = #21024#38500
        TabOrder = 1
        OnClick = FlatButton3Click
      end
      object FlatButton2: TFlatButton
        Left = 111
        Top = 2
        Width = 35
        Height = 22
        Caption = #20462#25913
        TabOrder = 2
        OnClick = FlatButton2Click
      end
      object FlatButton4: TFlatButton
        Left = 297
        Top = 2
        Width = 35
        Height = 22
        Caption = #20445#23384
        TabOrder = 3
        OnClick = FlatButton4Click
      end
    end
    object FlatComboBox1: TFlatComboBox
      Left = 160
      Top = 104
      Width = 120
      Height = 20
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      Items.Strings = (
        #31649#29702#21592
        #26469#23486)
      ParentFont = False
      TabOrder = 3
      ItemIndex = -1
    end
  end
end
