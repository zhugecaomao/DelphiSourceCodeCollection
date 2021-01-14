object Login: TLogin
  Left = 192
  Top = 133
  BorderStyle = bsDialog
  Caption = 'RedHr-Office'
  ClientHeight = 111
  ClientWidth = 192
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 65
    Caption = #36755#20837#21475#20196
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 145
      Height = 20
      PasswordChar = '*'
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 104
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOTable1: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_manage'
    Left = 65528
    Top = 112
  end
end
