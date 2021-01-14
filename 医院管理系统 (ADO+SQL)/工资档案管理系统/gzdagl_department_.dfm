object Form_department: TForm_department
  Left = 86
  Top = 160
  Width = 649
  Height = 344
  Caption = #28155#21152#31185#23460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 89
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 639
      Height = 87
      Align = alClient
      Caption = #31185#23460#20449#24687
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 17
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #31185#23460#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 42
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #31185#23460#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 256
        Top = 17
        Width = 49
        Height = 13
        AutoSize = False
        Caption = #31185#23460#20027#20219
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 256
        Top = 42
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #31185#23460#39044#31639
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit_no: TEdit
        Left = 72
        Top = 17
        Width = 150
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
        OnChange = Edit_noChange
      end
      object Edit_name: TEdit
        Left = 72
        Top = 42
        Width = 150
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 1
      end
      object Edit_man: TEdit
        Left = 312
        Top = 17
        Width = 150
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 2
      end
      object BTadddepartment: TBitBtn
        Left = 488
        Top = 14
        Width = 120
        Height = 25
        Caption = #30830#23450#26032#22686#31185#23460
        Enabled = False
        TabOrder = 3
        OnClick = BTadddepartmentClick
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
      object BTcanceldepartment: TBitBtn
        Left = 488
        Top = 42
        Width = 120
        Height = 25
        Caption = #21462#28040#26032#22686#31185#23460
        TabOrder = 4
        OnClick = BTcanceldepartmentClick
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
      object MaskEdit_yusuan: TMaskEdit
        Left = 312
        Top = 42
        Width = 150
        Height = 21
        EditMask = '000000.00;1;_'
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        MaxLength = 9
        TabOrder = 5
        Text = '      .  '
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 96
    Width = 641
    Height = 221
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object Label5: TLabel
      Left = 472
      Top = 8
      Width = 65
      Height = 17
      AutoSize = False
      Caption = 'label5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 40
      Width = 635
      Height = 176
      Align = alBottom
      DataSource = DMgzdagl.DSdepartment
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
          FieldName = #31185#23460#32534#21495
          Width = 157
          Visible = True
        end
        item
          Expanded = False
          FieldName = #31185#23460#21517#31216
          Width = 177
          Visible = True
        end
        item
          Expanded = False
          FieldName = #31185#23460#20027#20219
          Width = 167
          Visible = True
        end
        item
          Expanded = False
          FieldName = #31185#23460#39044#31639
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 24
      Top = 9
      Width = 366
      Height = 25
      DataSource = DMgzdagl.DSdepartment
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
      Flat = True
      TabOrder = 1
    end
  end
end
