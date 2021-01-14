object FrmGZGL_XGGZ_cp: TFrmGZGL_XGGZ_cp
  Left = 160
  Top = 119
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_XGGZ_cp'
  ClientHeight = 335
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 2
    object Label16: TLabel
      Left = 28
      Top = 11
      Width = 121
      Height = 14
      Caption = #20462#25913#20135#21697#24037#35013#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 416
      Top = 1
      Width = 150
      Height = 46
      Align = alRight
      AutoSize = True
      Stretch = True
    end
    object Label18: TLabel
      Left = 60
      Top = 30
      Width = 276
      Height = 12
      Caption = #36755#20837#20135#21697#22270#21495#65292#23450#20301#21518#20462#25913#20135#21697#20449#24687#21450#25152#29992#24037#35013#20449#24687
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 567
    Height = 250
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 287
      Height = 246
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 0
      object Label1: TLabel
        Left = 22
        Top = 35
        Width = 24
        Height = 12
        Caption = 'CPTH'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 22
        Top = 55
        Width = 24
        Height = 12
        Caption = 'CPMC'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 34
        Top = 75
        Width = 12
        Height = 12
        Caption = 'SL'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 34
        Top = 96
        Width = 12
        Height = 12
        Caption = 'LX'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 34
        Top = 116
        Width = 12
        Height = 12
        Caption = 'CX'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 34
        Top = 136
        Width = 12
        Height = 12
        Caption = 'FZ'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 34
        Top = 157
        Width = 12
        Height = 12
        Caption = 'BZ'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 22
        Top = 177
        Width = 24
        Height = 12
        Caption = 'YSXH'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 16
        Top = 197
        Width = 30
        Height = 12
        Caption = 'TYJLX'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 22
        Top = 218
        Width = 24
        Height = 12
        Caption = 'SCZT'
        FocusControl = DBEdit10
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 287
        Height = 19
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #20135#21697#20449#24687
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 55
        Top = 29
        Width = 200
        Height = 20
        DataField = 'CPTH'
        DataSource = dmd.Src_CP
        TabOrder = 1
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit2: TDBEdit
        Left = 55
        Top = 49
        Width = 200
        Height = 20
        DataField = 'CPMC'
        DataSource = dmd.Src_CP
        TabOrder = 2
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 55
        Top = 70
        Width = 200
        Height = 20
        DataField = 'SL'
        DataSource = dmd.Src_CP
        TabOrder = 3
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit4: TDBEdit
        Left = 55
        Top = 91
        Width = 200
        Height = 20
        DataField = 'LX'
        DataSource = dmd.Src_CP
        TabOrder = 4
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit5: TDBEdit
        Left = 55
        Top = 111
        Width = 200
        Height = 20
        DataField = 'CX'
        DataSource = dmd.Src_CP
        TabOrder = 5
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit6: TDBEdit
        Left = 55
        Top = 132
        Width = 200
        Height = 20
        DataField = 'FZ'
        DataSource = dmd.Src_CP
        TabOrder = 6
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit7: TDBEdit
        Left = 55
        Top = 153
        Width = 200
        Height = 20
        DataField = 'BZ'
        DataSource = dmd.Src_CP
        TabOrder = 7
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit8: TDBEdit
        Left = 55
        Top = 173
        Width = 200
        Height = 20
        DataField = 'YSXH'
        DataSource = dmd.Src_CP
        TabOrder = 8
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit9: TDBEdit
        Left = 55
        Top = 194
        Width = 200
        Height = 20
        DataField = 'TYJLX'
        DataSource = dmd.Src_CP
        TabOrder = 9
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit10: TDBEdit
        Left = 55
        Top = 215
        Width = 200
        Height = 20
        DataField = 'SCZT'
        DataSource = dmd.Src_CP
        TabOrder = 10
        OnKeyPress = Edt_cxKeyPress
      end
    end
    object Panel5: TPanel
      Left = 289
      Top = 2
      Width = 276
      Height = 246
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel5'
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 20
        Width = 276
        Height = 206
        TabStop = False
        Align = alClient
        DataSource = dmd.Src_GZCP3
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 276
        Height = 20
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #20135#21697#25152#29992#24037#35013
        TabOrder = 1
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 226
        Width = 276
        Height = 20
        DataSource = dmd.Src_GZCP3
        VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
        Align = alBottom
        Flat = True
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 48
    Width = 567
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label17: TLabel
      Left = 26
      Top = 13
      Width = 48
      Height = 12
      Caption = #20135#21697#22270#21495
    end
    object btn_cx: TSpeedButton
      Left = 255
      Top = 6
      Width = 93
      Height = 25
      Caption = #23450' '#20301
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF003232320032323200323232003232320032323200323232003232
        3200323232003232320032323200FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF003232320086868600B6B6B600DADADA00DADADA00DADADA00DADADA00DADA
        DA00DADADA00CECECE00323232002626260026262600FF00FF00FF00FF003232
        3200F2F2F2004A4A4A00B6B6B600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
        E600E6E6E600626262000049DC0025AAFF000031960026262600323232008686
        86004A4A4A0062626200E6E6E600E6E6E600F2F2F200F2F2F200F2F2F200F2F2
        F200626262000049DC008ED4FF008E8EFF000049DC002626260032323200DADA
        DA00E6E6E600E6E6E600E6E6E600E6E6E600DADADA00AAAAAA00AAAAAA006262
        62000049DC008ED4FF008E8EFF000049DC0026262600FF00FF0032323200E6E6
        E600E6E6E600E6E6E600C2C2C2006E6E6E004A4A4A004A4A4A004A4A4A004A4A
        4A008ED4FF008E8EFF000049DC0026262600FF00FF00FF00FF0032323200E6E6
        E600E6E6E600C2C2C2006E6E6E00FFC66B00FFC66B00FFC66B00FFB84800FF8F
        6B002557FF000049DC0026262600FF00FF00FF00FF00FF00FF0032323200E6E6
        E600C2C2C2006E6E6E00AAAAAA00FFE2B100FFFF8E00FFFF8E00FFC66B00FFB8
        4800FF8F6B004A4A4A0032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600C2C2C2006E6E6E00FFE2B100FFFFD400FFFFB100FFFF8E00FFFF8E00FFC6
        6B00FFB848004A4A4A0032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600C2C2C2006E6E6E00FFE2B100FFFFD400FFFFB100FFFFB100FFFF8E00FFFF
        8E00FFB848004A4A4A0032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600C2C2C2006E6E6E00FFE2B100FFFFD400FFFFB100FFFFB100FFFFB100FFFF
        8E00FFB848004A4A4A0032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600DADADA006E6E6E00C2C2C200FFE2B100FFFFD400FFFFB100FFFFB100FFE2
        B100AAAAAA004A4A4A0032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600DADADA00C2C2C2006E6E6E00C2C2C200FFE2B100FFE2B100FFE2B100AAAA
        AA0026262600C2C2C20032323200FF00FF00FF00FF00FF00FF0032323200E6E6
        E600DADADA00DADADA00C2C2C2006E6E6E006E6E6E006E6E6E006E6E6E006E6E
        6E00C2C2C200E6E6E60032323200FF00FF00FF00FF00FF00FF0032323200F2F2
        F200E6E6E600E6E6E600E6E6E600E6E6E600C2C2C200C2C2C200C2C2C200C2C2
        C200E6E6E600E6E6E60032323200FF00FF00FF00FF00FF00FF00323232003232
        3200323232003232320032323200323232003232320032323200323232003232
        3200323232003232320032323200FF00FF00FF00FF00FF00FF00}
      OnClick = btn_cxClick
    end
    object Btn_exit: TSpeedButton
      Left = 408
      Top = 6
      Width = 93
      Height = 25
      Caption = #36864' '#20986
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        00001B1BCB000807BE000807BE0000000000FF00FF00FF00FF00000000000505
        BC000505BC0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000393ADF005F5FF8004B4CEA0000000000FF00FF00000000001313C5006867
        FD006B6BFF002827D30000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000504FED006464FA006B6BFF004343E500000000001313C5005B5BF5006B6B
        FF006B6BFF00393ADF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000393ADF005B5BF5005B5BF5006867FD004343E5005B5BF5006464FA006867
        FD005F5FF800201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000393ADF005352EF005555F100605FF8006464FA005555F1006464
        FA004B4CEA00201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000393ADF00504FED005352EF005555F1006464FA004B4C
        EA00201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000004B4CEA004343E5004B4CEA004B4CEA004B4C
        EA00201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000004343E500393ADF004343E5004343E5004B4C
        EA004343E50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000504FED002D2DD6003738DD00393ADF004343
        E5004343E5001B1BCB0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000003434DB003434DB002D2DD6003434DB003434DB003434
        DB003D3DE1004343E5001313C50000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000003434DB003434DB002222CF002827D300504FED004343
        E5003434DB003738DD003738DD001313C50000000000FF00FF00FF00FF00FF00
        FF00000000005352EF00393ADF001B1BCB003434DB003D3DE100000000002D2D
        D6003D3DE1003434DB004343E5001313C50000000000FF00FF00FF00FF00FF00
        FF0000000000504FED004343E5004343E5004343E5003434DB00000000000000
        00002222CF00393ADF003D3DE1002D2DD60000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000504FED004B4CEA004B4CEA0000000000FF00FF00FF00
        FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = Btn_exitClick
    end
    object Edt_cx: TEdit
      Left = 91
      Top = 9
      Width = 133
      Height = 20
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'EDT_CX'
      OnKeyPress = Edt_cxKeyPress
    end
  end
end
