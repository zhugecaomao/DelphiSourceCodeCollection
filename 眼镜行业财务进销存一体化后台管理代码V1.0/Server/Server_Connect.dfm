object frm_Server_Connect: Tfrm_Server_Connect
  Left = 210
  Top = 219
  Width = 297
  Height = 188
  BorderIcons = [biSystemMenu]
  Caption = #12304#26381#21153#22120#12290#12290#12290#25968#25454#24211#37197#32622#12305
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 161
    Align = alClient
    Caption = 'Panel1'
    Color = clSkyBlue
    TabOrder = 0
    object Cmd_OK: TSpeedButton
      Left = 70
      Top = 136
      Width = 100
      Height = 22
      Caption = #30830#23450'(&Y)'
      OnClick = Cmd_OKClick
    end
    object Cmd_NO: TSpeedButton
      Left = 178
      Top = 136
      Width = 100
      Height = 22
      Caption = #21462#28040'(&N)'
      OnClick = Cmd_NOClick
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 287
      Height = 130
      Align = alTop
      TabOrder = 0
      object Image1: TImage
        Left = 6
        Top = 86
        Width = 32
        Height = 32
        AutoSize = True
        Center = True
        Picture.Data = {
          055449636F6E0000010002001010100001000400280100002600000020201000
          01000400E80200004E0100002800000010000000200000000100040000000000
          C000000000000000000000001000000000000000000000000000800000800000
          00808000800000008000800080800000C0C0C000808080000000FF0000FF0000
          00FFFF00FF000000FF00FF00FFFF0000FFFFFF000000000000000000008FFFFF
          FFFFF700000807070707070087778080808080888FFFF80000000080888888F7
          77777808877778F088887880877778F066687880877778F0E668788087FFF8F0
          00007880870008FFFFFF78808777A787777777808FFFFFF88888888087777770
          0000000008888888000000000000000000000000C003FFFFC001FFFF0000FFFF
          0000FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
          0000FFFF0001FFFF00FFFFFF80FFFFFFFFFFFFFF280000002000000040000000
          0100040000000000800200000000000000000000000000000000000000000000
          000080000080000000808000800000008000800080800000C0C0C00080808000
          0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000
          0000000000000000000000000000877777777777777777777777800000008FFF
          FFFFFFFFFFFFFFFFFFFF7800000008F80880880880880880880888800000008F
          80F80F80F80F80F80F80F8808F777777F80F80F80F80F80F80F80F088F777777
          77000008FF777788000000008F7777777700000000000000000000008FFFFFFF
          FF088888888888888888880088888888880F77777777777777A778808F777777
          778F7FFFFFFFFFFFFFFF78808F777777778F788888888888888F78808F777777
          778F706666000000668F78808F777777778F7066668FFFF0668F78808F777777
          778F7066008FFFF0668F78808F777777778F70668F8FFFF0668F78808F777777
          778F70668F4CCCC0668F78808F777777778F706E8FFFF066668F78808F777777
          778F706E00000066668F78808F777777778F706666666666668F78808F7FFFFF
          FF8F700000000000008F78808F700000008F788888888888888F78808F7FFFFF
          778F777777777777777778808F7000007A78FFFFFFFFFFFFFFFFF8808F777777
          777787777777777777777F808FFFFFFFFFFF888888888888888888808F777777
          7777F880000000000000000008F7777777777F800000000000000000008F7777
          777777F000000000000000000008888888888888000000000000000000000000
          00000000000000000000000000000000000000000000000000000000F8000007
          F0000003F0000001F80000000000000000000000000E007F0000000300000001
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000010000FFFF8000FFFFC000FFFFE000FFFFFFFFFFFFFFFFFFFF}
        Stretch = True
      end
      object Edit1: TLabeledEdit
        Left = 128
        Top = 18
        Width = 150
        Height = 22
        EditLabel.Width = 112
        EditLabel.Height = 14
        EditLabel.Caption = #26381#21153#22120#65321#65328#22320#22336#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 0
      end
      object Edit2: TLabeledEdit
        Left = 128
        Top = 44
        Width = 150
        Height = 22
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #29992#25143#21517#31216#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 1
      end
      object Edit3: TLabeledEdit
        Left = 128
        Top = 71
        Width = 150
        Height = 22
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #29992#25143#21475#20196#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        PasswordChar = '*'
        TabOrder = 2
      end
      object Edit4: TLabeledEdit
        Left = 128
        Top = 98
        Width = 150
        Height = 22
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #25968#25454#24211#21517#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 3
        Text = 'Gd_Glasses'
      end
    end
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = True
    Active = True
    ControlUseTrueXPStyle = True
    BtnRoundArc = 5
    BtnOutLineBorderColor = 7552000
    BtnInnerBorderMoveColor = 3257087
    BtnInnerBorderFocusColor = 15183500
    BtnSurfaceNormalColor = 16251903
    BtnSurfaceDownColor = 14608359
    BtnSurfaceBottomLineColor = 14608359
    BtnSurfaceDownBottomLineColor = 15199215
    RdoChkControlChkColor = 41472
    ComboBoxChkColor = 9201994
    ComboboxSurfaceMoveColor = 16771030
    ControlDisabledBorderColor = 11913158
    Left = 48
    Top = 80
  end
end
