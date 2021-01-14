object info_form: Tinfo_form
  Left = 231
  Top = 132
  Width = 696
  Height = 480
  Caption = 'info_form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 320
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 350
      Top = 0
      Height = 320
      Align = alRight
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 350
      Height = 320
      Align = alClient
      Caption = #23454#25928#26399#25552#37266#39033#30446
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 346
        Height = 303
        Align = alClient
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        PopupMenu = PopupMenu2
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
            FieldName = 'id'
            Title.Caption = #32534#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date'
            Title.Caption = #25552#37266#26102#38388
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'content'
            Title.Caption = #25552#37266#20869#23481
            Visible = True
          end>
      end
    end
    object GroupBox2: TGroupBox
      Left = 353
      Top = 0
      Width = 335
      Height = 320
      Align = alRight
      Caption = #36807#26399#25552#37266#39033#30446
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 2
        Top = 15
        Width = 331
        Height = 303
        Align = alClient
        DataSource = DataSource2
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        PopupMenu = PopupMenu1
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
            FieldName = ' id'
            Title.Caption = #32534#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date'
            Title.Caption = #25552#37266#26102#38388
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'content'
            Title.Caption = #25552#37266#20869#23481
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 320
    Width = 688
    Height = 133
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object Label1: TLabel
      Left = 368
      Top = 33
      Width = 105
      Height = 13
      AutoSize = False
      Caption = '* '#19981#33021#36229#36807'80'#23383
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 189
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object DateTimePicker1: TDateTimePicker
      Left = 8
      Top = 8
      Width = 129
      Height = 21
      Date = 38573.843993472220000000
      Time = 38573.843993472220000000
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 92
      Width = 75
      Height = 25
      Caption = #28155#21152
      Default = True
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Memo1: TMemo
      Left = 8
      Top = 34
      Width = 353
      Height = 49
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      MaxLength = 80
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 128
      Top = 93
      Width = 75
      Height = 25
      Caption = '  '#36864#20986'(&C)'
      TabOrder = 3
      Kind = bkCancel
    end
  end
  object ADOQuery1: TADOQuery
    Connection = main_form.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 281
    Top = 33
  end
  object ADOQuery2: TADOQuery
    Connection = main_form.ADOConnection1
    Parameters = <>
    Left = 408
    Top = 33
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 281
    Top = 65
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 408
    Top = 65
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 129
    object N3: TMenuItem
      Caption = #21024#38500
      ShortCut = 49220
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 217
    Top = 129
    object N1: TMenuItem
      Caption = #20462#25913
      ShortCut = 16453
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      ShortCut = 16452
      OnClick = N2Click
    end
  end
end
