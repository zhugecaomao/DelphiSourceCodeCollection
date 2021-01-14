object frmRightSetting: TfrmRightSetting
  Left = 295
  Top = 237
  BorderStyle = bsDialog
  Caption = #26435#38480#35774#32622#19982#31649#29702
  ClientHeight = 409
  ClientWidth = 581
  Color = 4013343
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 11
    Width = 214
    Height = 24
    Caption = #26435#38480#35774#32622#19982#31649#29702'...'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCancel: TSpeedButton
    Left = 448
    Top = 369
    Width = 105
    Height = 33
    Caption = #36864' '#20986
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnCancelClick
  end
  object Panel3: TPanel
    Left = -16
    Top = 40
    Width = 609
    Height = 321
    BevelInner = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 30
      Top = 20
      Width = 259
      Height = 285
      Caption = #29992#25143#21015#34920
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object ListView1: TListView
        Left = 6
        Top = 23
        Width = 247
        Height = 226
        Columns = <
          item
            Caption = #29992#25143#21517
            Width = 100
          end
          item
            Caption = #29992#25143#26435#38480
            Width = 100
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnChange = ListView1Change
        OnClick = ListView1Click
      end
      object btnDelete: TButton
        Left = 185
        Top = 258
        Width = 67
        Height = 22
        Caption = #21024#38500
        TabOrder = 1
        OnClick = btnDeleteClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 312
      Top = 20
      Width = 262
      Height = 285
      Caption = #32534#36753#29992#25143
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object GroupBox4: TGroupBox
        Left = 12
        Top = 80
        Width = 238
        Height = 169
        Caption = #36873#39033
        TabOrder = 0
        object edtUsername: TEdit
          Left = 93
          Top = 36
          Width = 121
          Height = 28
          TabOrder = 0
        end
        object edtPassword: TEdit
          Left = 93
          Top = 74
          Width = 121
          Height = 28
          PasswordChar = '*'
          TabOrder = 1
        end
        object StaticText1: TStaticText
          Left = 19
          Top = 39
          Width = 67
          Height = 24
          Caption = #29992#25143#21517
          TabOrder = 2
        end
        object StaticText2: TStaticText
          Left = 19
          Top = 77
          Width = 46
          Height = 24
          Caption = #21475#20196
          TabOrder = 3
        end
        object StaticText3: TStaticText
          Left = 19
          Top = 114
          Width = 46
          Height = 24
          Caption = #26435#38480
          TabOrder = 4
        end
        object cmbLevel: TComboBox
          Left = 93
          Top = 111
          Width = 121
          Height = 28
          Style = csDropDownList
          ItemHeight = 20
          ItemIndex = 0
          TabOrder = 5
          Text = #36229#32423#29992#25143
          Items.Strings = (
            #36229#32423#29992#25143
            #31649#29702#21592#29992#25143)
        end
      end
      object btnOK: TButton
        Left = 177
        Top = 258
        Width = 67
        Height = 22
        Caption = #30830#23450
        TabOrder = 1
        OnClick = btnOKClick
      end
      object chkNewUser: TCheckBox
        Left = 16
        Top = 32
        Width = 153
        Height = 33
        Caption = #26032#24314#29992#25143
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkNewUserClick
      end
    end
  end
end
