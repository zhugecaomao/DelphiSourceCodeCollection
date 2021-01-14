object ypjgview: Typjgview
  Left = 301
  Top = 58
  BorderStyle = bsSingle
  Caption = #33647#21697#20215#26684#26174#31034
  ClientHeight = 143
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 363
    Height = 161
    Align = alTop
    Color = clInfoBk
    DataSource = DMmzsf.DSQyp
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = #32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #33647#21697#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21806#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26368#23567#20215#26684
        Visible = True
      end>
  end
  object DBEmc: TDBEdit
    Left = 72
    Top = 104
    Width = 97
    Height = 21
    DataField = #33647#21697#21517#31216
    DataSource = DMmzsf.DSQyp
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 1
    Visible = False
  end
  object DBEsj: TDBEdit
    Left = 176
    Top = 104
    Width = 33
    Height = 21
    DataField = #21806#20215
    DataSource = DMmzsf.DSQyp
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 2
    Visible = False
  end
  object DBEzxjg: TDBEdit
    Left = 216
    Top = 104
    Width = 25
    Height = 21
    DataField = #26368#23567#20215#26684
    DataSource = DMmzsf.DSQyp
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 3
    Visible = False
  end
  object DBEbh: TDBEdit
    Left = 16
    Top = 104
    Width = 49
    Height = 21
    DataField = #32534#21495
    DataSource = DMmzsf.DSQyp
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 4
    Visible = False
  end
end
