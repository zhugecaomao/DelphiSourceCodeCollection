inherited BqjTjForm: TBqjTjForm
  Left = 136
  Top = 63
  Width = 600
  Height = 450
  Caption = #32479#35745
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    inherited lblTitle: TLabel
      Left = 224
      Width = 156
      Caption = #21322#20840#20215#32479#35745
    end
    inherited Image1: TImage
      Left = 180
    end
  end
  inherited Panel2: TPanel
    Width = 592
    Height = 346
    object Chart1: TChart
      Left = 5
      Top = 5
      Width = 582
      Height = 336
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.Direction = gdFromTopLeft
      Gradient.EndColor = 16744576
      LeftWall.Brush.Color = clWhite
      Title.Color = clWhite
      Title.Font.Charset = GB2312_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -12
      Title.Font.Name = #23435#20307
      Title.Font.Style = []
      Title.Frame.Style = psDash
      Title.Frame.Visible = True
      Title.Text.Strings = (
        #21322#20840#20215#32047#35745)
      BottomAxis.LabelsFont.Charset = GB2312_CHARSET
      BottomAxis.LabelsFont.Color = clBlack
      BottomAxis.LabelsFont.Height = -12
      BottomAxis.LabelsFont.Name = #23435#20307
      BottomAxis.LabelsFont.Style = []
      LeftAxis.LabelsFont.Charset = GB2312_CHARSET
      LeftAxis.LabelsFont.Color = clBlack
      LeftAxis.LabelsFont.Height = -12
      LeftAxis.LabelsFont.Name = #23435#20307
      LeftAxis.LabelsFont.Style = []
      Legend.Alignment = laBottom
      Legend.Font.Charset = GB2312_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -12
      Legend.Font.Name = #23435#20307
      Legend.Font.Style = []
      Legend.Frame.Color = 33023
      View3D = False
      Align = alClient
      BorderStyle = bsSingle
      Color = clWhite
      TabOrder = 0
      object Series1: THorizBarSeries
        Marks.ArrowLength = 20
        Marks.BackColor = 33023
        Marks.Font.Charset = GB2312_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -12
        Marks.Font.Name = #23435#20307
        Marks.Font.Style = []
        Marks.Style = smsLabelValue
        Marks.Transparent = True
        Marks.Visible = True
        SeriesColor = clRed
        XValues.DateTime = False
        XValues.Name = 'Bar'
        XValues.Multiplier = 1
        XValues.Order = loNone
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
    end
  end
  inherited Panel3: TPanel
    Top = 388
    Width = 592
    inherited btnHelp: TBitBtn
      Left = 432
    end
    inherited btnClose: TBitBtn
      Left = 512
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 13
      Width = 97
      Height = 17
      Caption = #19977#32500
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object btnPrint: TBitBtn
      Left = 352
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 3
      OnClick = btnPrintClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888F8800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
  end
  object qryBqjtj: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select sum(D_BJS),sum(D_QJS),sum(D_JJFJ) from BQJ')
    Left = 40
    Top = 8
  end
end
