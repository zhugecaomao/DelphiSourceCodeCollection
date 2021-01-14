object Form_employee: TForm_employee
  Left = 97
  Top = 88
  Width = 657
  Height = 395
  Caption = #26032#22686#38599#21592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 153
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 647
      Height = 151
      Align = alClient
      Caption = #38599#21592#20449#24687
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 48
        Height = 13
        Caption = #21592#24037#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 48
        Height = 13
        Caption = #21592#24037#22995#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 72
        Width = 45
        Height = 13
        Caption = #24615'       '#21035
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 96
        Width = 45
        Height = 13
        Caption = #24180'       '#40836
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 224
        Top = 24
        Width = 48
        Height = 13
        Caption = #23398'        '#21382
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 224
        Top = 48
        Width = 48
        Height = 13
        Caption = #32844'        '#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 224
        Top = 72
        Width = 48
        Height = 13
        Caption = #31185#23460#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 224
        Top = 96
        Width = 48
        Height = 13
        Caption = #21592#24037#30005#35805
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 440
        Top = 24
        Width = 48
        Height = 13
        Caption = #20837#32844#26102#38388
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit_no: TEdit
        Left = 72
        Top = 24
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
        OnChange = Edit_noChange
      end
      object Edit_name: TEdit
        Left = 72
        Top = 48
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 1
      end
      object Edit_age: TEdit
        Left = 72
        Top = 96
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 2
      end
      object Edit_xueli: TEdit
        Left = 288
        Top = 24
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 3
      end
      object Edit_zhiwei: TEdit
        Left = 288
        Top = 48
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 4
      end
      object Edit_phone: TEdit
        Left = 288
        Top = 96
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 5
      end
      object Tdatetime_rz: TDateTimePicker
        Left = 504
        Top = 24
        Width = 129
        Height = 21
        CalAlignment = dtaLeft
        Date = 37739
        Time = 37739
        DateFormat = dfShort
        DateMode = dmComboBox
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        Kind = dtkDate
        ParseInput = False
        TabOrder = 6
      end
      object BTaddemployee: TBitBtn
        Left = 544
        Top = 64
        Width = 89
        Height = 25
        Caption = #30830#23450#26032#22686
        Enabled = False
        TabOrder = 7
        OnClick = BTaddemployeeClick
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
      end
      object BTcancelemployee: TBitBtn
        Left = 544
        Top = 96
        Width = 89
        Height = 25
        Caption = #21462#28040#26032#22686
        TabOrder = 8
        OnClick = BTcancelemployeeClick
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
      object ComBox_sex: TComboBox
        Left = 72
        Top = 72
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 9
        Items.Strings = (
          #30007
          #22899)
      end
      object ComBox_ks: TComboBox
        Left = 288
        Top = 72
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 10
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 160
    Width = 649
    Height = 208
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object Label11: TLabel
      Left = 464
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Label11'
    end
    object DBGrid1: TDBGrid
      Left = 9
      Top = 41
      Width = 624
      Height = 160
      DataSource = DMgzdagl.DSemployee
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #21592#24037#32534#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21592#24037#22995#21517
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24615#21035
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23398#21382
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32844#20301
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24180#40836
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = #31185#23460#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20837#32844#26102#38388
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30005#35805
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 72
      Top = 8
      Width = 318
      Height = 25
      DataSource = DMgzdagl.DSemployee
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
      Flat = True
      TabOrder = 1
    end
  end
end
