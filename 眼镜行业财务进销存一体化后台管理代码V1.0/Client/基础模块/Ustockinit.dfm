inherited frmstockinit: Tfrmstockinit
  Left = 197
  Top = 145
  Caption = #20179#24211#36164#26009
  ClientHeight = 280
  ClientWidth = 421
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 421
    Height = 280
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 69
      Width = 52
      Height = 13
      Caption = #20179#24211#31867#22411
    end
    object Label2: TLabel
      Left = 227
      Top = 69
      Width = 52
      Height = 13
      Caption = #31649#29702#20154#21592
    end
    object Label3: TLabel
      Left = 19
      Top = 120
      Width = 52
      Height = 13
      Caption = #25152#23646#22320#21306
    end
    object edtno: TLabeledEdit
      Left = 73
      Top = 16
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #20179#24211#32534#21495
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 0
    end
    object edtname: TLabeledEdit
      Left = 280
      Top = 16
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #20179#24211#21517#31216
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 1
    end
    object edtphone: TLabeledEdit
      Left = 280
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #32852#31995#30005#35805
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 2
    end
    object edtdx: TLabeledEdit
      Left = 73
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #20179#24211#22823#23567
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 3
    end
    object f_no: TLabeledEdit
      Left = 280
      Top = 120
      Width = 121
      Height = 21
      Color = clCream
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #29238#31867#32534#21495
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 4
    end
    object edtzip: TLabeledEdit
      Left = 72
      Top = 92
      Width = 123
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #37038#25919#32534#30721
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 5
    end
    object edtfax: TLabeledEdit
      Left = 280
      Top = 92
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #20256#30495#21495#30721
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 6
    end
    object cmbtype: TComboBox
      Left = 73
      Top = 67
      Width = 123
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      OnKeyPress = cmbtypeKeyPress
      Items.Strings = (
        #37197#36865#20013#24515
        #22320#21306#32423#20179#24211
        #38376#24215#20179#24211)
    end
    object cmbry: TComboBox
      Left = 280
      Top = 66
      Width = 123
      Height = 21
      ItemHeight = 13
      TabOrder = 8
    end
    object edtaddress: TLabeledEdit
      Left = 72
      Top = 144
      Width = 329
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #35814#32454#22320#22336
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 9
    end
    object R1: TRadioButton
      Left = 72
      Top = 184
      Width = 74
      Height = 17
      Caption = #34394#25311#20179#24211
      Enabled = False
      TabOrder = 10
      Visible = False
    end
    object R2: TRadioButton
      Left = 248
      Top = 184
      Width = 73
      Height = 17
      Caption = #23454#29289#20179#24211
      Checked = True
      Enabled = False
      TabOrder = 11
      TabStop = True
      Visible = False
    end
    object cmbdq: TComboBox
      Left = 73
      Top = 118
      Width = 123
      Height = 21
      ItemHeight = 13
      TabOrder = 12
      Items.Strings = (
        #28246#21271
        #27827#21335
        #28246#21335
        #27743#33487
        #27827#21271
        #24191#19996'      '
        #22235#24029'      '
        #24191#35199'      '
        #36149#24030'      '
        #20113#21335'      '
        #40657#40857#27743'    '
        #23665#35199'      '
        #21513#26519'      '
        #27993#27743'      '
        #35199#34255'      '
        #29976#32899'      '
        #23425#22799'      '
        #28595#38376'      '
        #27827#21335'      '
        #19978#28023'      '
        #27743#35199'  '
        #23665#19996'      '
        #26032#24394'      '
        #36797#23425'      '
        #21271#20140'      '
        #23433#24509'      '
        #31119#24314'      '
        #38738#28023'      '
        #20869#33945#21476'    '
        #22825#27941'      '
        #37325#24198'      '
        #39321#28207'      '
        #21488#28286)
    end
    object btsave: TBitBtn
      Left = 56
      Top = 248
      Width = 75
      Height = 25
      Caption = #30830#23450'(&O)'
      TabOrder = 13
      OnClick = btsaveClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btexit: TBitBtn
      Left = 288
      Top = 248
      Width = 75
      Height = 25
      Caption = #21462#28040'(&C)'
      TabOrder = 14
      OnClick = btexitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
