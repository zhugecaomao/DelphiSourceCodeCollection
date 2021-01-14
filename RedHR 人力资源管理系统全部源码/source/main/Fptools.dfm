object ptools: Tptools
  Left = 329
  Top = 169
  BorderStyle = bsDialog
  Caption = #24037#20316#29992#21697#35774#32622
  ClientHeight = 347
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 297
    Height = 297
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #22522#26412
      object GroupBox1: TGroupBox
        Left = 16
        Top = 16
        Width = 257
        Height = 153
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 32
          Width = 24
          Height = 12
          Caption = #21517#31216
        end
        object Label2: TLabel
          Left = 24
          Top = 72
          Width = 24
          Height = 12
          Caption = #21333#20215
        end
        object Label3: TLabel
          Left = 24
          Top = 112
          Width = 24
          Height = 12
          Caption = #25968#37327
        end
        object DBEdit1: TDBEdit
          Left = 56
          Top = 28
          Width = 177
          Height = 20
          DataField = 'w_name'
          DataSource = pworks.DataSource1
          MaxLength = 49
          TabOrder = 0
        end
        object cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Left = 56
          Top = 68
          Width = 121
          Height = 20
          DataBinding.DataSource = pworks.DataSource1
          DataBinding.DataField = 'w_pay'
          Style.LookAndFeel.Kind = lfStandard
          TabOrder = 1
        end
        object cxDBSpinEdit1: TcxDBSpinEdit
          Left = 56
          Top = 108
          Width = 121
          Height = 20
          DataBinding.DataSource = pworks.DataSource1
          DataBinding.DataField = 'w_account'
          Style.LookAndFeel.Kind = lfStandard
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35828#26126
      ImageIndex = 1
      object DBMemo1: TDBMemo
        Left = 16
        Top = 24
        Width = 257
        Height = 201
        DataField = 'w_memo'
        DataSource = pworks.DataSource1
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 224
    Top = 312
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 312
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
end
