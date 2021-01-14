object frmUserProp: TfrmUserProp
  Left = 338
  Top = 303
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = #23646#24615
  ClientHeight = 214
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 251
    Height = 214
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24120#35268
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 12
        Height = 12
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 8
        Top = 52
        Width = 24
        Height = 12
        Caption = #26165#31216
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 24
        Height = 12
        Caption = #24615#21035
      end
      object Label4: TLabel
        Left = 8
        Top = 124
        Width = 24
        Height = 12
        Caption = #20027#26426
      end
      object Label5: TLabel
        Left = 8
        Top = 160
        Width = 12
        Height = 12
        Caption = 'IP'
      end
      object Edit1: TEdit
        Left = 42
        Top = 16
        Width = 121
        Height = 20
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 42
        Top = 52
        Width = 121
        Height = 20
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 42
        Top = 88
        Width = 121
        Height = 20
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 42
        Top = 124
        Width = 121
        Height = 20
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 42
        Top = 160
        Width = 121
        Height = 20
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
      end
      object Button2: TButton
        Left = 167
        Top = 130
        Width = 73
        Height = 25
        Cancel = True
        Caption = #21021#22987#21270#23494#30721
        TabOrder = 5
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 167
        Top = 159
        Width = 73
        Height = 25
        Cancel = True
        Caption = #20851#38381
        ModalResult = 2
        TabOrder = 6
      end
    end
  end
end
