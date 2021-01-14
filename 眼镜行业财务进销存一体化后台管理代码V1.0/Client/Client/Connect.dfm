object frm_Connect: Tfrm_Connect
  Left = 344
  Top = 322
  Width = 308
  Height = 175
  BorderIcons = [biSystemMenu]
  Caption = #26381#21153#22120#37197#32622
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 300
    Height = 148
    Align = alClient
    Caption = #12304#23458#25143#31471#22312#24191#22495#32593#36830#25509#12305
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Image1: TImage
      Left = 9
      Top = 12
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000000000000000000000000
        00000000077777777777777777777777777777700FCCCCCCCCCCCCCCCCCCCCCC
        CCCCCC700FC7F7CFCCFC7F7CFCC7CCC7CCC7CC700FCCFCCFC7FCCFCCFC7F7C7F
        7C7F7C700FCCFCCFCFFCCFCCFCC7CCC7CCC7CC700FCCFCCFFCFCCFCCFCCCCCCC
        CCCCCC700FC7F7CF7CFC7F7FFFCCCCCCCCCCCC700FCCCCCCCCCCCCCCCCCCCCCC
        CCCCCC700F888888888888888888888888888870000000000000000000000000
        0000000000000000AA600000000F88707000000000000000FA7000000000F887
        0700000000000000AA600000000F00887077770000000000FA700000000FF0F8
        8700000700000000AA600000000FBB0F8877777000000000FA70000000000000
        F88FF88700000000AA60000000008000F8700F87000000000000000000008000
        F70000F7070000000800000000008000F70000F7007000070807007700008000
        F870000F000700700800770070008000F8877000007000077877007700008000
        0FFFF70000F7777888887787000F870000000000000F88888888FF88000F8700
        000000000000FFFFFFFF00F8000F8700000000000000000000000000000F8700
        000000000000000000000000000FF70000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFFFFFFF800000010000000000000000000000000000000000000000
        0000000000000000000000000000000080000001FF1FC07FFE0FC03FFE0FC003
        FE0FC000FE0FC000FE0FE200FE0FE200FE0FE218BF1FE2189E0CE2048C006202
        8000620180004183C00041FFE00041FFF00CC1FFFFFFC1FFFFFFC1FFFFFFFFFF
        FFFFFFFF}
    end
    object Label1: TLabel
      Left = 53
      Top = 80
      Width = 126
      Height = 14
      Caption = '('#20063#21487#20197#26159#65321#65328#22320#22336')'
    end
    object Panel1: TPanel
      Left = 5
      Top = 107
      Width = 286
      Height = 2
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 164
      Top = 117
      Width = 63
      Height = 22
      Caption = #30830#23450'(&Y)'
      Default = True
      TabOrder = 1
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 228
      Top = 117
      Width = 63
      Height = 22
      Caption = #21462#28040'(&N)'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object LabeledEdit1: TLabeledEdit
      Left = 138
      Top = 51
      Width = 149
      Height = 20
      EditLabel.Width = 84
      EditLabel.Height = 14
      EditLabel.Caption = #26381#21153#22120#21517#31216#65306
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 3
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
    Left = 16
    Top = 72
  end
end
