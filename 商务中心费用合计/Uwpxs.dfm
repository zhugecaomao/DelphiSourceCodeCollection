object F_wuxs: TF_wuxs
  Left = 302
  Top = 168
  Width = 397
  Height = 455
  BorderIcons = [biSystemMenu]
  Caption = #29289#21697#39046#29992
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 6
    Top = 160
    Width = 381
    Height = 266
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #29289#21697#39046#29992#26126#32454
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 373
        Height = 238
        Align = alClient
        Ctl3D = False
        DataSource = dswply
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'bm'
            Title.Caption = #29289#21697#32534#30721
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mc'
            Title.Caption = #29289#21697#21517#31216
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'danja'
            Title.Caption = #29289#21697#21333#20215
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'shuliang'
            Title.Caption = #29289#21697#25968#37327
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rq'
            Title.Caption = #39046#29992#26085#26399
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lx'
            Title.Caption = #31867#22411
            Visible = True
          end>
      end
    end
  end
  object pgc2: TPageControl
    Left = 9
    Top = 8
    Width = 378
    Height = 144
    ActivePage = ts3
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ts2: TTabSheet
      Caption = #39046#29992
      object lbl1: TLabel
        Left = 5
        Top = 7
        Width = 48
        Height = 12
        Caption = #29289#21697#32534#21495
      end
      object lbl2: TLabel
        Left = 179
        Top = 6
        Width = 48
        Height = 12
        Caption = #29289#21697#21517#31216
      end
      object lbl3: TLabel
        Left = 3
        Top = 32
        Width = 48
        Height = 12
        Caption = #29289#21697#21333#20215
      end
      object lbl4: TLabel
        Left = 179
        Top = 32
        Width = 48
        Height = 12
        Caption = #39046#29992#25968#37327
      end
      object lbl5: TLabel
        Left = 3
        Top = 59
        Width = 48
        Height = 12
        Caption = #39046#29992#26085#26399
      end
      object btn1: TSpeedButton
        Left = 351
        Top = 3
        Width = 18
        Height = 19
        Caption = '>'
        OnClick = btn1Click
      end
      object dtp1: TDateTimePicker
        Left = 55
        Top = 55
        Width = 261
        Height = 20
        Date = 39398.000000000000000000
        Time = 39398.000000000000000000
        TabOrder = 0
        OnKeyDown = dtp1KeyDown
      end
      object edtbh: TEdit
        Left = 53
        Top = 3
        Width = 121
        Height = 20
        TabOrder = 1
      end
      object edtmc: TEdit
        Left = 228
        Top = 4
        Width = 121
        Height = 20
        TabOrder = 2
      end
      object dxCurrencyEdit1: TdxCurrencyEdit
        Left = 54
        Top = 29
        Width = 121
        TabOrder = 3
      end
      object edtsl: TEdit
        Left = 229
        Top = 28
        Width = 126
        Height = 20
        TabOrder = 4
        Text = '0'
        OnExit = edtslExit
        OnKeyDown = edtslKeyDown
      end
      object btn2: TButton
        Left = 24
        Top = 88
        Width = 105
        Height = 25
        Caption = #39046#29992
        TabOrder = 5
        OnClick = btn2Click
      end
      object btn3: TButton
        Left = 239
        Top = 87
        Width = 99
        Height = 25
        Caption = #36864#20986
        TabOrder = 6
        OnClick = btn3Click
      end
    end
    object ts3: TTabSheet
      Caption = #38144#21806
      ImageIndex = 1
      object lbl6: TLabel
        Left = 8
        Top = 10
        Width = 48
        Height = 12
        Caption = #29289#21697#32534#21495
      end
      object lbl7: TLabel
        Left = 191
        Top = 10
        Width = 48
        Height = 12
        Caption = #29289#21697#21517#31216
      end
      object lbl8: TLabel
        Left = 6
        Top = 34
        Width = 48
        Height = 12
        Caption = #29289#21697#21333#20215
      end
      object lbl9: TLabel
        Left = 191
        Top = 34
        Width = 48
        Height = 12
        Caption = #38144#21806#25968#37327
      end
      object lbl10: TLabel
        Left = 6
        Top = 58
        Width = 48
        Height = 12
        Caption = #38144#21806#26085#26399
      end
      object btn4: TSpeedButton
        Left = 339
        Top = 8
        Width = 21
        Height = 18
        Caption = '>'
        OnClick = btn4Click
      end
      object edtxbh: TEdit
        Left = 64
        Top = 6
        Width = 121
        Height = 20
        TabOrder = 0
      end
      object edtxmc: TEdit
        Left = 244
        Top = 7
        Width = 91
        Height = 20
        TabOrder = 1
      end
      object dxCurrencyEdit2: TdxCurrencyEdit
        Left = 64
        Top = 31
        Width = 121
        TabOrder = 2
      end
      object edtxsl: TEdit
        Left = 244
        Top = 31
        Width = 121
        Height = 20
        TabOrder = 3
        Text = '0'
        OnExit = edtxslExit
        OnKeyDown = edtxslKeyDown
      end
      object dtp2: TDateTimePicker
        Left = 64
        Top = 55
        Width = 242
        Height = 20
        Date = 39398.000000000000000000
        Time = 39398.000000000000000000
        TabOrder = 4
        OnKeyDown = dtp2KeyDown
      end
      object btn5: TBitBtn
        Left = 24
        Top = 88
        Width = 107
        Height = 25
        Caption = #38144#21806
        TabOrder = 5
        OnClick = btn5Click
      end
      object btn6: TBitBtn
        Left = 225
        Top = 87
        Width = 107
        Height = 25
        Caption = #36864#20986
        TabOrder = 6
        OnClick = btn6Click
      end
    end
  end
  object dswply: TDataSource
    DataSet = DM.qrylymx
    Left = 354
    Top = 224
  end
end
