object frmKCPD: TfrmKCPD
  Left = 246
  Top = 450
  Width = 773
  Height = 464
  Caption = #24211#23384#30424#28857
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 68
    Align = alTop
    BevelInner = bvLowered
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 66
      Height = 12
      Caption = #35831#36873#25321#20179#24211':'
    end
    object Label2: TLabel
      Left = 492
      Top = 11
      Width = 66
      Height = 12
      Caption = #24403#21069#30424#24215#21495':'
    end
    object Label3: TLabel
      Left = 240
      Top = 11
      Width = 54
      Height = 12
      Caption = #30424#28857#26085#26399':'
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 66
      Height = 12
      Caption = #30424'  '#28857'  '#20154':'
      FocusControl = DBEdit1
    end
    object Label5: TLabel
      Left = 240
      Top = 40
      Width = 54
      Height = 12
      Caption = #22791'    '#27880':'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 74
      Top = 36
      Width = 124
      Height = 20
      DataField = #30424#28857#20154
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 294
      Top = 36
      Width = 339
      Height = 20
      DataField = #22791#27880
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 74
      Top = 8
      Width = 124
      Height = 20
      Style = csDropDownList
      DataField = #20179#24211#21517#31216
      ItemHeight = 12
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 294
      Top = 8
      Width = 121
      Height = 20
      DataField = #30424#28857#26085#26399
      MaxLength = 10
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 560
      Top = 8
      Width = 72
      Height = 20
      DataField = #30424#28857#32534#21495
      MaxLength = 9
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 68
    Width = 676
    Height = 343
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 672
      Height = 339
      Align = alClient
      DataSource = DataSource2
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #26448#26009#32534#30721
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26448#26009#21517#31216
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23454#23384#25968#37327
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Color = clGray
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = 8404992
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30424#28857#25968#37327
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Color = clGray
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = 8404992
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#37327#21333#20301
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#21333#20215
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20215#21333#20301
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35268#26684#22411#21495
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 129
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 411
    Width = 765
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 676
    Top = 68
    Width = 89
    Height = 343
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 11
      Top = 6
      Width = 71
      Height = 40
      Caption = #26032#30424#28857
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000F0000000E0000000100
        04000000000070000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8880888888888888888088888888888888808888880008888880888888070888
        8880888888070888888088800007000088808880777777708880888000070000
        8880888888070888888088888807088888808888880008888880888888888888
        88808888888888888880}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 11
      Top = 86
      Width = 71
      Height = 40
      Caption = #20869#21152#29289#36164
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton4: TSpeedButton
      Left = 11
      Top = 166
      Width = 71
      Height = 40
      Caption = #25972#29702
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton7: TSpeedButton
      Left = 11
      Top = 206
      Width = 71
      Height = 40
      Caption = #20445#23384#30424#28857
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000000000000880330000008803088033000000880308803300000088
        0308803300000000030880333333333333088033000000003308803088888888
        0308803088888888030880308888888803088030888888880308803088888888
        0008803088888888080880000000000000088888888888888888}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = SpeedButton7Click
    end
    object SpeedButton8: TSpeedButton
      Left = 11
      Top = 126
      Width = 71
      Height = 40
      Caption = #38468#21152#29289#36164
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton8Click
    end
    object SpeedButton5: TSpeedButton
      Left = 11
      Top = 246
      Width = 71
      Height = 40
      Caption = #21462#28040#30424#28857
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 11
      Top = 46
      Width = 71
      Height = 40
      Caption = #32534#36753#30424#28857
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton6Click
    end
  end
  object BitBtn3: TBitBtn
    Left = 178
    Top = 38
    Width = 18
    Height = 16
    Caption = #8230
    TabOrder = 4
    Visible = False
    OnClick = BitBtn3Click
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CKXX'
    Left = 24
    Top = 163
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 123
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 152
    Top = 123
  end
  object ClientDataSet_index: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_KCPD'
    Left = 200
    Top = 20
  end
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 148
    object N1: TMenuItem
      Caption = #21024#38500#29289#36164
      OnClick = N1Click
    end
  end
end
