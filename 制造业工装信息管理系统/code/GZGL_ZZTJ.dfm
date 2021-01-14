object FrmGZGL_ZZTJ: TFrmGZGL_ZZTJ
  Left = 44
  Top = 136
  Width = 633
  Height = 426
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'FrmGZGL_ZZTJ'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 0
    object Label16: TLabel
      Left = 22
      Top = 12
      Width = 91
      Height = 14
      Caption = #22312#21046#24037#35013#32479#35745
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 474
      Top = 1
      Width = 150
      Height = 46
      Align = alRight
      AutoSize = True
      Stretch = True
    end
    object Label1: TLabel
      Left = 54
      Top = 30
      Width = 336
      Height = 12
      Caption = #32479#35745#30446#21069#22312#21046#24037#35013#24773#20917#65292#24182#21487#20197#26681#25454#38656#35201#28155#21152#35760#24405#21040#21046#36896#35745#21010#20013
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 302
    Width = 625
    Height = 97
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel2'
    TabOrder = 1
    object Memo1: TMemo
      Left = 2
      Top = 2
      Width = 621
      Height = 93
      Align = alClient
      Lines.Strings = (
        'Memo1')
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 48
    Width = 625
    Height = 254
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel3'
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 621
      Height = 250
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      TabIndex = 0
      TabOrder = 0
      TabWidth = 70
      object TabSheet1: TTabSheet
        Caption = #21333#35760#24405
        object Label18: TLabel
          Left = 492
          Top = 81
          Width = 108
          Height = 132
          Caption = 
            #28155#21152#35745#21010#65306#13#10'    '#28155#21152#24403#21069#35760#24405#21040#21046#36896#35745#21010#13#10#13#10#28155#21152#25152#26377#65306#13#10'    '#28155#21152#32479#35745#21040#30340#25152#26377#35760#24405#21040#21046#36896#35745#21010#13#10#13#10'    '#22810#35760#24405#20013 +
            #21487#20197#21452#20987#35760#24405#28155#21152#21040#21046#36896#35745#21010
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object btn_addJH: TSpeedButton
          Left = 486
          Top = 9
          Width = 115
          Height = 25
          Caption = #28155#21152#35745#21010
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
          OnClick = btn_addJHClick
        end
        object Btn_addall: TSpeedButton
          Left = 486
          Top = 41
          Width = 115
          Height = 25
          Caption = #28155#21152#25152#26377
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
          OnClick = Btn_addallClick
        end
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 0
          Top = 0
          Width = 475
          Height = 223
          Align = alLeft
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          DataSource = dmd.SrcQry_GZ
          PanelBorder = gbNone
          PanelHeight = 223
          PanelWidth = 457
          TabOrder = 0
          RowCount = 1
          object Label2: TLabel
            Left = 21
            Top = 14
            Width = 48
            Height = 12
            Caption = #24037#35013#32534#21495
            FocusControl = DBEdit1
          end
          object Label3: TLabel
            Left = 21
            Top = 37
            Width = 48
            Height = 12
            Caption = #24037#35013#21517#31216
            FocusControl = DBEdit2
          end
          object Label4: TLabel
            Left = 21
            Top = 61
            Width = 48
            Height = 12
            Caption = #20219#21153#20070#21495
            FocusControl = DBEdit3
          end
          object Label5: TLabel
            Left = 9
            Top = 84
            Width = 60
            Height = 12
            Caption = #20219#21153#25968#26085#26399
            FocusControl = DBEdit4
          end
          object Label6: TLabel
            Left = 21
            Top = 108
            Width = 48
            Height = 12
            Caption = #35746#36135#21333#20301
            FocusControl = DBEdit5
          end
          object Label7: TLabel
            Left = 21
            Top = 131
            Width = 48
            Height = 12
            Caption = #35746#36135#26085#26399
            FocusControl = DBEdit6
          end
          object Label8: TLabel
            Left = 21
            Top = 155
            Width = 48
            Height = 12
            Caption = #35746#36135#25968#37327
            FocusControl = DBEdit7
          end
          object Label9: TLabel
            Left = 22
            Top = 178
            Width = 48
            Height = 12
            Caption = #35774#35745#21333#20301
            FocusControl = DBEdit8
          end
          object Label10: TLabel
            Left = 236
            Top = 11
            Width = 48
            Height = 12
            Caption = #21046#36896#21333#20301
            FocusControl = DBEdit9
          end
          object Label11: TLabel
            Left = 236
            Top = 34
            Width = 48
            Height = 12
            Caption = #20351#29992#21333#20301
            FocusControl = DBEdit10
          end
          object Label12: TLabel
            Left = 236
            Top = 57
            Width = 48
            Height = 12
            Caption = #23436#24037#26085#26399
            FocusControl = DBEdit11
          end
          object Label13: TLabel
            Left = 236
            Top = 80
            Width = 48
            Height = 12
            Caption = #39564#35777#26085#26399
            FocusControl = DBEdit12
          end
          object Label14: TLabel
            Left = 260
            Top = 103
            Width = 24
            Height = 12
            Caption = #24037#26102
            FocusControl = DBEdit13
          end
          object Label15: TLabel
            Left = 260
            Top = 126
            Width = 24
            Height = 12
            Caption = #20135#20540
            FocusControl = DBEdit14
          end
          object Label17: TLabel
            Left = 45
            Top = 202
            Width = 24
            Height = 12
            Caption = #22791#27880
            FocusControl = DBEdit15
          end
          object Label28: TLabel
            Left = 260
            Top = 149
            Width = 24
            Height = 12
            Caption = #31867#21035
            FocusControl = DBEdit25
          end
          object Label29: TLabel
            Left = 260
            Top = 173
            Width = 24
            Height = 12
            Caption = #29366#24577
            FocusControl = DBEdit26
          end
          object DBEdit1: TDBEdit
            Left = 80
            Top = 8
            Width = 140
            Height = 20
            DataField = 'GZBH'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 31
            Width = 140
            Height = 20
            DataField = 'GZMC'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 80
            Top = 55
            Width = 140
            Height = 20
            DataField = 'RWSH'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 80
            Top = 79
            Width = 140
            Height = 20
            DataField = 'RWRQ'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 80
            Top = 102
            Width = 140
            Height = 20
            DataField = 'DHDW'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 80
            Top = 126
            Width = 140
            Height = 20
            DataField = 'DHRQ'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 80
            Top = 150
            Width = 140
            Height = 20
            DataField = 'DHSL'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 6
          end
          object DBEdit8: TDBEdit
            Left = 80
            Top = 174
            Width = 140
            Height = 20
            DataField = 'SJDW'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 7
          end
          object DBEdit9: TDBEdit
            Left = 294
            Top = 6
            Width = 140
            Height = 20
            DataField = 'ZZDW'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 8
          end
          object DBEdit10: TDBEdit
            Left = 294
            Top = 29
            Width = 140
            Height = 20
            DataField = 'SYDW'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 9
          end
          object DBEdit11: TDBEdit
            Left = 294
            Top = 52
            Width = 140
            Height = 20
            DataField = 'WGRQ'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 10
          end
          object DBEdit12: TDBEdit
            Left = 294
            Top = 75
            Width = 140
            Height = 20
            DataField = 'YZRQ'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 11
          end
          object DBEdit13: TDBEdit
            Left = 294
            Top = 98
            Width = 140
            Height = 20
            DataField = 'GS'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 12
          end
          object DBEdit14: TDBEdit
            Left = 294
            Top = 121
            Width = 140
            Height = 20
            DataField = 'CZ'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 13
          end
          object DBEdit15: TDBEdit
            Left = 80
            Top = 196
            Width = 269
            Height = 20
            DataField = 'BZ'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 14
          end
          object DBEdit25: TDBEdit
            Left = 294
            Top = 144
            Width = 140
            Height = 20
            DataField = 'LB'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 15
          end
          object DBEdit26: TDBEdit
            Left = 294
            Top = 168
            Width = 140
            Height = 20
            DataField = 'ZT'
            DataSource = dmd.SrcQry_GZ
            TabOrder = 16
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #22810#35760#24405
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 613
          Height = 223
          Align = alClient
          DataSource = dmd.SrcQry_GZ
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = #21046#36896#35745#21010
        ImageIndex = 2
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 613
          Height = 223
          Align = alClient
          DataSource = dmd.Src_zzjh
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
        end
      end
    end
  end
end
