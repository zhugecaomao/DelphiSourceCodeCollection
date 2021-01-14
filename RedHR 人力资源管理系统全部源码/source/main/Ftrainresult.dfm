object trainresult: Ttrainresult
  Left = 191
  Top = 133
  BorderStyle = bsDialog
  Caption = #22521#35757
  ClientHeight = 111
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 65
    Caption = #36873#25321#22521#35757
    TabOrder = 0
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 24
      Top = 24
      Width = 169
      Height = 20
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #22521#35757#21517#31216
          FieldName = 'teachname'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = Main.r_staffteachDataSource
      Style.LookAndFeel.Kind = lfFlat
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 144
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 64
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
end
