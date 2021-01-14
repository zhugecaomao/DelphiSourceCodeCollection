object frmComSysOption: TfrmComSysOption
  Left = 140
  Top = 78
  BorderStyle = bsDialog
  Caption = '系统设置'
  ClientHeight = 406
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = '宋体'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object OKBtn: TButton
    Left = 239
    Top = 372
    Width = 87
    Height = 28
    Anchors = [akRight, akBottom]
    Caption = '确认(&O)'
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 347
    Top = 372
    Width = 87
    Height = 28
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '取消(&C)'
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object DefBtn: TButton
    Left = 6
    Top = 372
    Width = 87
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = '默认值'
    ModalResult = 1
    TabOrder = 2
    OnClick = DefBtnClick
  end
  object cPageControl: TPageControl
    Left = 6
    Top = 6
    Width = 427
    Height = 358
    ActivePage = cTab1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object cTab1: TTabSheet
      Caption = 'cTab1'
    end
  end
end
