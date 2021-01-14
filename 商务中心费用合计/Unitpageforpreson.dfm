object F_pageforpreson: TF_pageforpreson
  Left = 370
  Top = 216
  Width = 273
  Height = 243
  BorderIcons = [biSystemMenu]
  Caption = #23458#20154#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 4
    Top = 3
    Width = 260
    Height = 102
    ActivePage = ts1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #25805#20316#21592#22686#21152
      object lbl2: TLabel
        Left = 0
        Top = 48
        Width = 60
        Height = 12
        Caption = #25805#20316#21592#22995#21517
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 1
        Top = 22
        Width = 60
        Height = 24
        Caption = #25805#20316#21592#20195#30721#13#10
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object dbedt2: TDBEdit
        Left = 62
        Top = 45
        Width = 190
        Height = 20
        DataField = 'czyxm'
        DataSource = DataSource1
        TabOrder = 0
        OnKeyDown = dbedt2KeyDown
      end
      object dbedt3: TDBEdit
        Left = 62
        Top = 18
        Width = 190
        Height = 20
        DataField = 'czydm'
        DataSource = DataSource1
        TabOrder = 1
        OnKeyDown = dbedt3KeyDown
        OnKeyPress = dbedt3KeyPress
      end
    end
  end
  object pgc2: TPageControl
    Left = 2
    Top = 107
    Width = 261
    Height = 76
    ActivePage = ts2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ts2: TTabSheet
      Caption = #21475#20196
      object lbl1: TLabel
        Left = 4
        Top = 16
        Width = 60
        Height = 12
        Caption = #25805#20316#21592#21475#20196
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object dbedt1: TDBEdit
        Left = 62
        Top = 11
        Width = 190
        Height = 20
        DataField = 'czykl'
        DataSource = DataSource1
        PasswordChar = '*'
        TabOrder = 0
        OnKeyDown = dbedt1KeyDown
      end
    end
  end
  object btn1: TButton
    Left = 47
    Top = 188
    Width = 102
    Height = 25
    Caption = #28155#21152
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 154
    Top = 188
    Width = 102
    Height = 25
    Caption = #36864#20986
    TabOrder = 3
    OnClick = btn2Click
  end
  object DataSource1: TDataSource
    DataSet = DM.qrypsw
    Left = 168
    Top = 16
  end
end
