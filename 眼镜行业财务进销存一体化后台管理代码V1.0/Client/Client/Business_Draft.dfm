object frm_Business_Draft: Tfrm_Business_Draft
  Left = 32
  Top = 89
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = #24453#21150#21333#25454
  ClientHeight = 436
  ClientWidth = 733
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 733
    Height = 57
    Align = alTop
    Color = cl3DLight
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 80
      Height = 19
      Caption = #24453#21150#21333#25454
      Font.Charset = ANSI_CHARSET
      Font.Color = clFuchsia
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 167
      Top = 34
      Width = 84
      Height = 14
      Caption = #21333#25454#23457#26680#36807#28388
      Transparent = True
    end
    object Label3: TLabel
      Left = 409
      Top = 34
      Width = 56
      Height = 14
      Caption = #21333#25454#31579#36873
      Transparent = True
    end
    object ComboBox1: TComboBox
      Left = 253
      Top = 30
      Width = 150
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        #26410#23457#26680)
    end
    object ComboBox2: TComboBox
      Left = 467
      Top = 30
      Width = 150
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 1
      OnChange = ComboBox2Change
      Items.Strings = (
        #12304#25152#26377#21333#25454#12305
        #21830#21697#38656#27714#21333
        #37319#36141#21512#21516
        #26469#36135#30331#35760#21333
        #36136#37327#39564#25910#21333
        #37319#36141#20837#24211#21333
        #37319#36141#36864#36135#21333
        #37319#36141#20184#27454#21333
        #24211#23384#25253#28322#21333
        #24211#23384#25253#25439#21333
        #24211#23384#36864#36135#21333
        #36130#21153#36864#36135#21333
        #38750#33829#19994#24615#20986#24211#21333
        #38750#33829#19994#24615#20837#24211#21333
        #22871#39184#23450#20041
        #26032#24215#38138#36135
        #36192#21697#23450#20041
        #37197#36865#21333
        #37197#36865#36864#36135#21333
        #29616#37329#36153#29992#21333
        #19968#33324#36153#29992#21333
        #20854#20182#25910#20837#21333
        #24453#25674#36153#29992#21457#29983#21333
        #24453#25674#36153#29992#25674#38144#21333
        #24212#20184#27454#22686#21152
        #24212#25910#27454#22686#21152
        #24212#20184#27454#20943#23569
        #24212#25910#27454#20943#23569)
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 57
    Width = 733
    Height = 379
    Align = alClient
    Color = clMenu
    ParentColor = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 16
      Width = 729
      Height = 320
      Align = alClient
      Color = clWhite
      DataSource = dsquery
      FixedColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -14
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Copy_Date'
          Title.Alignment = taCenter
          Title.Caption = #24405#21333#26085#26399
          Width = 132
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Receipt_Name'
          Title.Alignment = taCenter
          Title.Caption = #21333#25454#21517#31216
          Width = 154
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Receipt_No'
          Title.Alignment = taCenter
          Title.Caption = #21333#25454#32534#21495
          Width = 370
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Condense'
          Title.Alignment = taCenter
          Title.Caption = #25688#35201
          Width = 254
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'proposer'
          Title.Alignment = taCenter
          Title.Caption = #21046#21333#20154
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Level_Count'
          Title.Alignment = taCenter
          Title.Caption = #23457#26680#32423#25968
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'E1'
          Title.Alignment = taCenter
          Title.Caption = #19968#32423#26159#21542#23457#26680
          Width = 127
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'E2'
          Title.Alignment = taCenter
          Title.Caption = #20108#32423#26159#21542#23457#26680
          Width = 123
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'E3'
          Title.Alignment = taCenter
          Title.Caption = #19977#32423#26159#21542#23457#26680
          Width = 141
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'E4'
          Title.Alignment = taCenter
          Title.Caption = #22235#32423#26159#21542#23457#26680
          Width = 121
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'E5'
          Title.Alignment = taCenter
          Title.Caption = #20116#32423#26159#21542#23457#26680
          Width = 111
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 336
      Width = 729
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        729
        41)
      object BitBtn5: TBitBtn
        Left = 651
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #20851#38381
        TabOrder = 0
        OnClick = BitBtn5Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
      end
      object BtnDelete: TBitBtn
        Left = 576
        Top = 8
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 1
        OnClick = BtnDeleteClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  object dsquery: TDataSource
    DataSet = dmmain.CDSquery
    Left = 416
    Top = 48
  end
end
