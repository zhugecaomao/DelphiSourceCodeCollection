object frmCLBM_FZLR: TfrmCLBM_FZLR
  Left = 259
  Top = 259
  Width = 726
  Height = 415
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #26448#26009#36741#21161#24405#20837
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #26999#20307'_GB2312'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 316
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 714
      Height = 312
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = #26999#20307'_GB2312'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'MatCode'
          Title.Alignment = taCenter
          Title.Caption = #26448#26009#32534#30721
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MatName'
          Title.Alignment = taCenter
          Title.Caption = #26448#26009#21517#31216
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Size'
          Title.Alignment = taCenter
          Title.Caption = #35268#26684#22411#21495
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 139
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUnit'
          Title.Alignment = taCenter
          Title.Caption = #35745#37327#21333#20301
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prize'
          Title.Alignment = taCenter
          Title.Caption = #35745#21010#21333#20215
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PUnit'
          Title.Alignment = taCenter
          Title.Caption = #21333#20215#21333#20301
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SceNum'
          Title.Alignment = taCenter
          Title.Caption = #35745#21010#26399#38656#37327
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OptDays'
          Title.Alignment = taCenter
          Title.Caption = #26368#20248#20648#22791#22825#25968
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LimitedDays'
          Title.Alignment = taCenter
          Title.Caption = #26497#38480#20648#22791#22825#25968
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OptNum'
          Title.Alignment = taCenter
          Title.Caption = #26368#20248#20648#22791#37327
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LimitedNum'
          Title.Alignment = taCenter
          Title.Caption = #26497#38480#20648#22791#37327
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quitiety'
          Title.Alignment = taCenter
          Title.Caption = #19981#22343#21248#31995#25968
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Title.Color = 749860
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 350
    Width = 718
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object btnOK: TSpeedButton
      Left = 549
      Top = 4
      Width = 70
      Height = 23
      Caption = #30830' '#23450
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = btnOKClick
    end
    object btnCancel: TSpeedButton
      Left = 629
      Top = 4
      Width = 70
      Height = 23
      Caption = #21462' '#28040
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      OnClick = btnCancelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 316
    Width = 718
    Height = 34
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 11
      Width = 77
      Height = 16
      Caption = #26448#26009#32534#30721':'
    end
    object Label2: TLabel
      Left = 185
      Top = 11
      Width = 77
      Height = 16
      Caption = #26448#26009#21517#31216':'
    end
    object Label3: TLabel
      Left = 415
      Top = 11
      Width = 77
      Height = 16
      Caption = #35268#26684#22411#21495':'
    end
    object btnQuery: TSpeedButton
      Left = 627
      Top = 8
      Width = 71
      Height = 22
      Caption = #26597#35810
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
      OnClick = btnQueryClick
    end
    object Edit1: TEdit
      Left = 82
      Top = 7
      Width = 87
      Height = 24
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 280
      Top = 7
      Width = 114
      Height = 24
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 496
      Top = 7
      Width = 130
      Height = 24
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = aqCLBM
    Left = 219
    Top = 34
  end
  object aqCLBM: TADOQuery
    Active = True
    Connection = dmWarehouse.ACWarehouse
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CLBM')
    Left = 304
    Top = 32
  end
end
