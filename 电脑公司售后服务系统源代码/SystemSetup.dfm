object FrmSystemSetup: TFrmSystemSetup
  Left = 322
  Top = 169
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmSystemSetup'
  ClientHeight = 369
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object SystemSetupTitle: TFlatTitlebar
    Left = 0
    Top = 0
    Width = 385
    Height = 25
    ActiveTextColor = clYellow
    InactiveTextColor = clMoneyGreen
    TitlebarColor = clGreen
    Align = alTop
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    Caption = #31995#32479#21442#25968#35774#32622
    object BtnExit: TFlatButton
      Left = 360
      Top = 0
      Width = 25
      Height = 25
      Color = clGreen
      ColorFocused = clGreen
      ColorDown = clGreen
      ColorBorder = clGreen
      ColorHighLight = clLime
      Caption = #215
      Font.Charset = GB2312_CHARSET
      Font.Color = clYellow
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ParentColor = False
      TabOrder = 0
      OnClick = BtnExitClick
    end
  end
  object Panel1: TFlatPanel
    Left = 0
    Top = 25
    Width = 385
    Height = 344
    ParentColor = True
    ColorHighLight = clGreen
    ColorShadow = clGreen
    Align = alClient
    TabOrder = 1
    object BtnOk: TFlatButton
      Left = 96
      Top = 304
      Width = 65
      Height = 25
      ColorBorder = clGreen
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnExit1: TFlatButton
      Left = 224
      Top = 304
      Width = 65
      Height = 25
      ColorBorder = clGreen
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BtnExitClick
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 16
      Width = 369
      Height = 273
      ActivePage = Tab_basicInfo
      Style = tsButtons
      TabHeight = 25
      TabIndex = 0
      TabOrder = 2
      object Tab_basicInfo: TTabSheet
        Caption = #20844#21496#22522#26412#20449#24687
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 361
          Height = 238
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 20
            Width = 60
            Height = 12
            Caption = #20844#21496#21517#31216#65306
          end
          object Label2: TLabel
            Left = 16
            Top = 52
            Width = 60
            Height = 12
            Caption = #20844#21496#22320#22336#65306
          end
          object Label3: TLabel
            Left = 16
            Top = 84
            Width = 60
            Height = 12
            Caption = #38144#21806#30005#35805#65306
          end
          object Label4: TLabel
            Left = 16
            Top = 148
            Width = 60
            Height = 12
            Caption = #20844#21496#20256#30495#65306
          end
          object Label5: TLabel
            Left = 16
            Top = 212
            Width = 60
            Height = 12
            Caption = #20844#21496#32593#22336#65306
          end
          object Label6: TLabel
            Left = 16
            Top = 116
            Width = 60
            Height = 12
            Caption = #26381#21153#30005#35805#65306
          end
          object Label7: TLabel
            Left = 16
            Top = 180
            Width = 60
            Height = 12
            Caption = #20844#21496#30005#37038#65306
          end
          object EditInc: TFlatEdit
            Left = 80
            Top = 16
            Width = 265
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            Enabled = False
            TabOrder = 0
            Text = 'EditInc'
          end
          object EditAddr: TFlatEdit
            Left = 80
            Top = 48
            Width = 265
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 1
            Text = 'EditAddr'
          end
          object EditPhone: TFlatEdit
            Left = 80
            Top = 80
            Width = 265
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 2
            Text = 'EditPhone'
          end
          object EditFax: TFlatEdit
            Left = 80
            Top = 144
            Width = 265
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 3
            Text = 'EditFax'
          end
          object EditWeb: TFlatEdit
            Left = 80
            Top = 208
            Width = 265
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 4
            Text = 'EditWeb'
          end
          object EditPhone1: TFlatEdit
            Left = 80
            Top = 112
            Width = 265
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 5
            Text = 'EditPhone1'
          end
          object EditMail: TFlatEdit
            Left = 80
            Top = 176
            Width = 265
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 6
            Text = 'EditMail'
          end
        end
      end
      object Tab_CNInfo: TTabSheet
        Caption = #20844#21496#25215#35834#20449#24687#35774#32622
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 361
          Height = 238
          Align = alClient
          TabOrder = 0
          object Label8: TLabel
            Left = 16
            Top = 28
            Width = 48
            Height = 12
            Caption = #25215#35834#9312#65306
          end
          object Label9: TLabel
            Left = 16
            Top = 60
            Width = 48
            Height = 12
            Caption = #25215#35834#9313#65306
          end
          object Label10: TLabel
            Left = 16
            Top = 92
            Width = 48
            Height = 12
            Caption = #25215#35834#9314#65306
          end
          object Label11: TLabel
            Left = 16
            Top = 136
            Width = 36
            Height = 12
            Caption = #35828#26126#65306
          end
          object Label12: TLabel
            Left = 24
            Top = 160
            Width = 312
            Height = 36
            Caption = 
              '    '#26412#39033#35774#32622#20027#35201#26159#29992#20110#25171#21360' '#23458#25143#20445#20462#21333' '#26102#30340#20844#21496#25215#35834#35774#32622#65292#30001#20110#19981#21516#30340#30005#33041#20844#21496#30340#25215#35834#20063#19981#21516#12290#25152#20197#31995#32479#37319#29992#33258#23450#20041#35774#32622#30340#26041#24335#12290#26412#31995 +
              #32479#20805#35768#35774#32622#26368#22810#19977#26465#20449#24687#12290
            WordWrap = True
          end
          object EditCN1: TFlatEdit
            Left = 64
            Top = 24
            Width = 281
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 0
            Text = 'EditCN1'
          end
          object EditCN2: TFlatEdit
            Left = 64
            Top = 56
            Width = 281
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 1
            Text = 'EditCN2'
          end
          object EditCN3: TFlatEdit
            Left = 64
            Top = 88
            Width = 281
            Height = 18
            ColorBorder = clGreen
            ColorFlat = clBtnFace
            ParentColor = True
            TabOrder = 2
            Text = 'EditCN3'
          end
        end
      end
    end
  end
  object ADOConnection1: TADOConnection
    Left = 8
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 8
  end
end
