object frmComUserOption: TfrmComUserOption
  Left = 140
  Top = 78
  BorderStyle = bsDialog
  Caption = '我的设置'
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
      Caption = '显示'
      object GroupBox1: TGroupBox
        Left = 6
        Top = 6
        Width = 199
        Height = 145
        Caption = '表格'
        TabOrder = 0
        object Label1: TLabel
          Left = 15
          Top = 30
          Width = 38
          Height = 15
          Caption = '字体:'
          Layout = tlCenter
        end
        object Label2: TLabel
          Left = 15
          Top = 78
          Width = 38
          Height = 15
          Caption = '底色:'
          Layout = tlCenter
        end
        object Bevel1: TBevel
          Left = 12
          Top = 60
          Width = 175
          Height = 7
          Shape = bsTopLine
        end
        object Bevel2: TBevel
          Left = 12
          Top = 108
          Width = 175
          Height = 7
          Shape = bsTopLine
        end
        object Panel1: TPanel
          Left = 59
          Top = 23
          Width = 92
          Height = 28
          Cursor = crHandPoint
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = '宋体'
          Color = clWhite
          TabOrder = 0
        end
        object Button1: TButton
          Left = 150
          Top = 23
          Width = 19
          Height = 28
          Hint = '设置字体'
          Caption = '…'
          TabOrder = 1
        end
        object Panel2: TPanel
          Left = 59
          Top = 71
          Width = 92
          Height = 28
          Cursor = crHandPoint
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 2
        end
        object Button2: TButton
          Left = 150
          Top = 71
          Width = 19
          Height = 28
          Hint = '设置字体'
          Caption = '…'
          TabOrder = 3
        end
        object CheckBox1: TCheckBox
          Left = 33
          Top = 120
          Width = 55
          Height = 17
          Caption = '横线'
          TabOrder = 4
        end
        object CheckBox2: TCheckBox
          Left = 111
          Top = 120
          Width = 55
          Height = 17
          Caption = '坚线'
          TabOrder = 5
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 216
        Top = 6
        Width = 199
        Height = 103
        Caption = '栏目布局'
        Items.Strings = (
          '先询问，再保存'
          '不询问，自动保存'
          '不询问，不保存')
        TabOrder = 1
      end
      object RadioGroup2: TRadioGroup
        Left = 6
        Top = 162
        Width = 199
        Height = 49
        Caption = '数据排序'
        Columns = 2
        Items.Strings = (
          '保存'
          '不保存')
        TabOrder = 2
      end
      object RadioGroup3: TRadioGroup
        Left = 6
        Top = 222
        Width = 199
        Height = 49
        Caption = '操作提示'
        Columns = 2
        Items.Strings = (
          '显示'
          '不显示')
        TabOrder = 3
      end
    end
  end
end
