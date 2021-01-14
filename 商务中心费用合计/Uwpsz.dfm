object F_wpsz: TF_wpsz
  Left = 338
  Top = 183
  Width = 306
  Height = 416
  BorderIcons = [biSystemMenu]
  Caption = #39033#30446#24405#20837
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
  object PageControl1: TPageControl
    Left = 3
    Top = 8
    Width = 289
    Height = 120
    ActivePage = TabSheet1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #29289#21697#24405#20837
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      object Label1: TLabel
        Left = 13
        Top = 20
        Width = 48
        Height = 12
        Caption = #29289#21697#32534#30721
      end
      object Label2: TLabel
        Left = 14
        Top = 46
        Width = 48
        Height = 12
        Caption = #29289#21697#21517#31216
      end
      object Label3: TLabel
        Left = 14
        Top = 72
        Width = 48
        Height = 12
        Caption = #29289#21697#21333#20215
      end
      object edt1: TEdit
        Left = 72
        Top = 17
        Width = 201
        Height = 20
        TabOrder = 0
      end
      object edt2: TEdit
        Left = 72
        Top = 42
        Width = 201
        Height = 20
        TabOrder = 1
        OnKeyDown = edt2KeyDown
      end
      object dxCurrencyEdit1: TdxCurrencyEdit
        Left = 72
        Top = 67
        Width = 199
        TabOrder = 2
        OnKeyDown = dxCurrencyEdit1KeyDown
      end
    end
  end
  object PageControl2: TPageControl
    Left = 3
    Top = 164
    Width = 291
    Height = 221
    ActivePage = TabSheet2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = #39033#30446#26126#32454
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 283
        Height = 194
        Align = alClient
        Ctl3D = False
        DataSource = DSwpsz
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mc'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'danja'
            Width = 98
            Visible = True
          end>
      end
    end
  end
  object Button1: TButton
    Left = 7
    Top = 134
    Width = 88
    Height = 25
    Caption = #28155#21152
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 202
    Top = 133
    Width = 86
    Height = 25
    Caption = #20851#38381
    TabOrder = 3
    OnClick = Button3Click
  end
  object DSwpsz: TDataSource
    DataSet = DM.Qwpsz
    Left = 264
    Top = 8
  end
end
