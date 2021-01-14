object Fgysmc: TFgysmc
  Left = 277
  Top = 212
  Width = 459
  Height = 225
  Caption = #20379#24212#21517#31216
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
    Width = 451
    Height = 198
    Align = alClient
    Color = clMoneyGreen
    DataSource = DMypgl.DSQgys
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
        FieldName = #20379#24212#21830#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20379#24212#21830#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32852#31995#20154#22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32852#31995#20154#22836#34900
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22320#22336
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22478#24066
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22320#21306
        Visible = True
      end
      item
        Expanded = False
        FieldName = #37038#32534
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22269#23478
        Visible = True
      end
      item
        Expanded = False
        FieldName = #30005#35805
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20256#30495
        Visible = True
      end>
  end
  object DEgysbh: TDBEdit
    Left = 80
    Top = 104
    Width = 121
    Height = 21
    DataField = #20379#24212#21830#32534#21495
    DataSource = DMypgl.DSQgys
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 1
  end
  object DEgysmc: TDBEdit
    Left = 240
    Top = 104
    Width = 121
    Height = 21
    DataField = #20379#24212#21830#21517#31216
    DataSource = DMypgl.DSQgys
    ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
    TabOrder = 2
  end
end
