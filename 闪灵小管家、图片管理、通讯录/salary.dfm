object salary_form: Tsalary_form
  Left = 216
  Top = 127
  Width = 775
  Height = 559
  Caption = #26085#24120#25910#25903#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 205
    Height = 532
    Align = alLeft
    BevelOuter = bvNone
    Color = clBackground
    TabOrder = 0
    object Panel2: TPanel
      Left = 8
      Top = 24
      Width = 185
      Height = 140
      BevelOuter = bvNone
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 24
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 6
          Width = 183
          Height = 22
          AutoSize = False
          Caption = '  '#26085#24120#25910#20837#25903#20986'(&E)'
          OnClick = Label1Click
        end
        object SpeedButton1: TSpeedButton
          Left = 160
          Top = 1
          Width = 23
          Height = 22
          Caption = #9650
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 38656
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = Label1Click
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 24
        Width = 185
        Height = 116
        BevelOuter = bvNone
        Color = clCream
        TabOrder = 1
        object SpeedButton2: TSpeedButton
          Left = 8
          Top = 24
          Width = 155
          Height = 22
          Caption = #26085#24120#25910#20837#37329#39069
          Flat = True
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 8
          Top = 64
          Width = 155
          Height = 22
          Caption = #26085#24120#25903#20986#37329#39069
          Flat = True
          OnClick = SpeedButton3Click
        end
      end
    end
    object Panel5: TPanel
      Left = 8
      Top = 192
      Width = 185
      Height = 140
      BevelOuter = bvNone
      TabOrder = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 24
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 1
          Top = 6
          Width = 183
          Height = 22
          AutoSize = False
          Caption = '  '#25910#25903#26597#35810#32479#35745'(&L)'
          OnClick = Label2Click
        end
        object SpeedButton4: TSpeedButton
          Left = 160
          Top = 1
          Width = 23
          Height = 22
          Caption = #9650
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 38656
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = Label2Click
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 24
        Width = 185
        Height = 116
        BevelOuter = bvNone
        Color = clCream
        TabOrder = 1
        object SpeedButton5: TSpeedButton
          Left = 8
          Top = 24
          Width = 155
          Height = 22
          Caption = #33258#23450#20041#25910#25903#26597#35810
          Flat = True
          OnClick = SpeedButton5Click
        end
        object SpeedButton6: TSpeedButton
          Left = 8
          Top = 64
          Width = 155
          Height = 22
          Caption = #33258#23450#20041'SQL'#39640#32423#26597#35810
          Flat = True
          OnClick = SpeedButton6Click
        end
      end
    end
    object Panel8: TPanel
      Left = 8
      Top = 361
      Width = 185
      Height = 140
      BevelOuter = bvNone
      TabOrder = 2
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 24
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 1
          Top = 5
          Width = 183
          Height = 22
          AutoSize = False
          Caption = '  '#25968#25454#25972#29702'(&M)'
          OnClick = Label3Click
        end
        object SpeedButton7: TSpeedButton
          Left = 160
          Top = 1
          Width = 23
          Height = 22
          Caption = #9650
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 38656
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = Label3Click
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 24
        Width = 185
        Height = 116
        BevelOuter = bvNone
        Color = clCream
        TabOrder = 1
        object SpeedButton8: TSpeedButton
          Left = 8
          Top = 64
          Width = 155
          Height = 22
          Caption = #36864#20986#31995#32479
          Flat = True
          OnClick = SpeedButton8Click
        end
        object SpeedButton9: TSpeedButton
          Left = 8
          Top = 24
          Width = 155
          Height = 22
          Caption = #25968#25454#28165#31354
          Flat = True
          OnClick = SpeedButton9Click
        end
      end
    end
  end
  object Panel11: TPanel
    Left = 205
    Top = 0
    Width = 12
    Height = 532
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel12: TPanel
    Left = 217
    Top = 0
    Width = 550
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Notebook1: TNotebook
      Left = 0
      Top = 0
      Width = 550
      Height = 532
      Align = alClient
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'in'
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 550
          Height = 201
          Align = alTop
          Caption = #25910#20837#21015#34920
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 2
            Top = 15
            Width = 546
            Height = 184
            Align = alClient
            DataSource = DataSource1
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentShowHint = False
            PopupMenu = PopupMenu1
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'subject'
                Title.Caption = #26469#28304
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'money'
                Title.Caption = #37329#39069' ['#20803']'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date'
                Title.Caption = #26085#26399
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'note'
                Title.Caption = #22791#27880
                Width = 400
                Visible = True
              end>
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 201
          Width = 550
          Height = 16
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 217
          Width = 550
          Height = 176
          Align = alTop
          TabOrder = 2
          object Label4: TLabel
            Left = 16
            Top = 24
            Width = 60
            Height = 13
            Caption = #25910#20837#26469#28304#65306
          end
          object Label5: TLabel
            Left = 16
            Top = 53
            Width = 60
            Height = 13
            Caption = #25910#20837#37329#39069#65306
          end
          object Label6: TLabel
            Left = 16
            Top = 82
            Width = 60
            Height = 13
            Caption = #25910#20837#26085#26399#65306
          end
          object Label7: TLabel
            Left = 16
            Top = 112
            Width = 60
            Height = 13
            Caption = #25910#20837#27880#37322#65306
          end
          object Edit1: TEdit
            Left = 80
            Top = 19
            Width = 292
            Height = 21
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            MaxLength = 200
            TabOrder = 0
          end
          object Edit2: TEdit
            Left = 80
            Top = 48
            Width = 112
            Height = 21
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 1
            OnKeyPress = Edit2KeyPress
          end
          object Memo1: TMemo
            Left = 80
            Top = 112
            Width = 385
            Height = 54
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 2
          end
          object DateTimePicker1: TDateTimePicker
            Left = 80
            Top = 78
            Width = 114
            Height = 21
            Date = 38588.485583530090000000
            Time = 38588.485583530090000000
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 3
          end
        end
        object BitBtn1: TBitBtn
          Left = 80
          Top = 424
          Width = 100
          Height = 25
          Caption = #28155#21152'(&A)'
          Default = True
          TabOrder = 3
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
        object BitBtn2: TBitBtn
          Left = 216
          Top = 424
          Width = 100
          Height = 25
          Cancel = True
          Caption = #28165#31354'(&C)'
          TabOrder = 4
          OnClick = BitBtn2Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 1
        Caption = 'out'
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 550
          Height = 177
          Align = alTop
          Caption = #33258#23450#20041#26597#35810#32467#26524
          TabOrder = 0
          object DBGrid3: TDBGrid
            Left = 2
            Top = 15
            Width = 546
            Height = 160
            Align = alClient
            DataSource = DataSource1
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
                FieldName = 'subject'
                Title.Caption = #20027#39064
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'money'
                Title.Caption = #37329#39069
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date'
                Title.Caption = #26085#26399
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'note'
                Title.Caption = #27880#37322
                Visible = True
              end>
          end
        end
        object Panel15: TPanel
          Left = 0
          Top = 177
          Width = 550
          Height = 16
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 193
          Width = 550
          Height = 112
          Align = alTop
          Caption = #33258#23450#20041#26597#35810#32479#35745
          TabOrder = 2
          object Label12: TLabel
            Left = 137
            Top = 18
            Width = 60
            Height = 13
            Caption = #36215#22987#26102#38388#65306
          end
          object Label13: TLabel
            Left = 332
            Top = 18
            Width = 60
            Height = 13
            Caption = #32467#26463#26102#38388#65306
          end
          object Label14: TLabel
            Left = 136
            Top = 60
            Width = 60
            Height = 13
            Caption = #26597#35810#24180#20221#65306
          end
          object Label15: TLabel
            Left = 286
            Top = 60
            Width = 60
            Height = 13
            Caption = #26597#35810#26376#20221#65306
          end
          object Label16: TLabel
            Left = 432
            Top = 59
            Width = 60
            Height = 13
            Caption = #26597#35810#26085#26399#65306
          end
          object Panel16: TPanel
            Left = 16
            Top = 24
            Width = 121
            Height = 81
            BevelOuter = bvNone
            TabOrder = 0
            object RadioButton1: TRadioButton
              Left = 3
              Top = 13
              Width = 113
              Height = 17
              Caption = #26102#38388#27573#26597#35810#32479#35745
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton1Click
            end
            object RadioButton2: TRadioButton
              Left = 3
              Top = 54
              Width = 113
              Height = 17
              Caption = #33258#23450#20041#26597#35810#32479#35745
              TabOrder = 1
              OnClick = RadioButton2Click
            end
          end
          object DateTimePicker3: TDateTimePicker
            Left = 136
            Top = 32
            Width = 144
            Height = 21
            Date = 38590.616741527780000000
            Time = 38590.616741527780000000
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 1
          end
          object DateTimePicker4: TDateTimePicker
            Left = 332
            Top = 32
            Width = 144
            Height = 21
            Date = 38590.616897604170000000
            Time = 38590.616897604170000000
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 2
          end
          object ComboBox1: TComboBox
            Left = 136
            Top = 74
            Width = 120
            Height = 21
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ItemHeight = 13
            TabOrder = 3
            OnChange = ComboBox1Change
          end
          object ComboBox2: TComboBox
            Left = 284
            Top = 74
            Width = 120
            Height = 21
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ItemHeight = 13
            TabOrder = 4
            OnChange = ComboBox2Change
            Items.Strings = (
              '01'
              '02'
              '03'
              '04'
              '05'
              '06'
              '07'
              '08'
              '09'
              '10'
              '11'
              '12')
          end
          object ComboBox3: TComboBox
            Left = 432
            Top = 74
            Width = 120
            Height = 21
            Style = csDropDownList
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ItemHeight = 13
            TabOrder = 5
            Items.Strings = (
              '01'
              '02'
              '03'
              '04'
              '05'
              '06'
              '07'
              '08'
              '09'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19'
              '20'
              '21'
              '22'
              '23'
              '24'
              '25'
              '26'
              '27'
              '28'
              '29'
              '30'
              '31')
          end
        end
        object BitBtn5: TBitBtn
          Left = 24
          Top = 456
          Width = 105
          Height = 25
          Caption = #26597#35810'(&S)'
          Default = True
          TabOrder = 3
          OnClick = BitBtn5Click
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
        object Panel17: TPanel
          Left = 0
          Top = 305
          Width = 550
          Height = 10
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 315
          Width = 550
          Height = 126
          Align = alTop
          Caption = #26597#35810#32467#26524
          TabOrder = 5
          object Memo3: TMemo
            Left = 2
            Top = 15
            Width = 546
            Height = 109
            Align = alClient
            Ctl3D = True
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 2
        Caption = 'search'
        object GroupBox3: TGroupBox
          Left = 0
          Top = 217
          Width = 550
          Height = 184
          Align = alTop
          TabOrder = 0
          object Label8: TLabel
            Left = 16
            Top = 24
            Width = 60
            Height = 13
            Caption = #25903#20986#39033#30446#65306
          end
          object Label9: TLabel
            Left = 16
            Top = 53
            Width = 60
            Height = 13
            Caption = #25903#20986#37329#39069#65306
          end
          object Label10: TLabel
            Left = 16
            Top = 82
            Width = 60
            Height = 13
            Caption = #25903#20986#26085#26399#65306
          end
          object Label11: TLabel
            Left = 16
            Top = 112
            Width = 60
            Height = 13
            Caption = #25903#20986#27880#37322#65306
          end
          object Edit3: TEdit
            Left = 80
            Top = 19
            Width = 292
            Height = 21
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            MaxLength = 200
            TabOrder = 0
          end
          object Edit4: TEdit
            Left = 80
            Top = 48
            Width = 112
            Height = 21
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 1
            OnKeyPress = Edit2KeyPress
          end
          object Memo2: TMemo
            Left = 80
            Top = 112
            Width = 385
            Height = 54
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 2
          end
          object DateTimePicker2: TDateTimePicker
            Left = 80
            Top = 78
            Width = 114
            Height = 21
            Date = 38588.485583530090000000
            Time = 38588.485583530090000000
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 3
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 550
          Height = 201
          Align = alTop
          Caption = #25903#20986#21015#34920
          TabOrder = 1
          object DBGrid2: TDBGrid
            Left = 2
            Top = 15
            Width = 546
            Height = 184
            Align = alClient
            DataSource = DataSource1
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
                FieldName = 'subject'
                Title.Caption = #26469#28304
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'money'
                Title.Caption = #37329#39069' ['#20803']'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date'
                Title.Caption = #26085#26399
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'note'
                Title.Caption = #22791#27880
                Width = 400
                Visible = True
              end>
          end
        end
        object BitBtn3: TBitBtn
          Left = 80
          Top = 424
          Width = 100
          Height = 25
          Caption = #28155#21152'(&A)'
          Default = True
          TabOrder = 2
          OnClick = BitBtn3Click
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
        object BitBtn4: TBitBtn
          Left = 216
          Top = 424
          Width = 100
          Height = 25
          Cancel = True
          Caption = #28165#31354'(&C)'
          TabOrder = 3
          OnClick = BitBtn4Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object Panel14: TPanel
          Left = 0
          Top = 201
          Width = 550
          Height = 16
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 3
        Caption = 'sqlsearch'
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 550
          Height = 225
          Align = alTop
          Caption = #26597#35810#32479#35745#32467#26524
          TabOrder = 0
          object DBGrid4: TDBGrid
            Left = 2
            Top = 15
            Width = 546
            Height = 208
            Align = alClient
            DataSource = DataSource1
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
        object Panel18: TPanel
          Left = 0
          Top = 225
          Width = 550
          Height = 12
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
        object GroupBox9: TGroupBox
          Left = 0
          Top = 237
          Width = 550
          Height = 76
          Align = alTop
          Caption = 'SQL '#26597#35810#35821#21477
          TabOrder = 2
          object Memo4: TMemo
            Left = 2
            Top = 15
            Width = 546
            Height = 59
            Align = alClient
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            PopupMenu = PopupMenu2
            TabOrder = 0
          end
        end
        object BitBtn6: TBitBtn
          Left = 48
          Top = 344
          Width = 97
          Height = 25
          Caption = #26597#35810
          Default = True
          TabOrder = 3
          OnClick = BitBtn6Click
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
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 237
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Connection = main_form.ADOConnection1
    Parameters = <>
    Left = 269
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 409
    Top = 120
    object N1: TMenuItem
      Caption = #21024#38500
      ShortCut = 16452
      OnClick = N1Click
    end
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Color = clBtnFace
    DrawMenuBar = False
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    UseDimColor = False
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    XPControls = [xcMainMenu, xcPopupMenu]
    Active = True
    Left = 600
    Top = 96
  end
  object ADOQuery2: TADOQuery
    Connection = main_form.ADOConnection1
    Parameters = <>
    Left = 313
    Top = 48
  end
  object PopupMenu2: TPopupMenu
    Left = 441
    Top = 269
    object select1: TMenuItem
      Caption = 'select'
      OnClick = select1Click
    end
    object N2: TMenuItem
      Caption = #23383#27573
      object N3: TMenuItem
        Caption = '*'
        OnClick = N3Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #20027#39064
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #37329#39069
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #26085#26399
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #27880#37322
        OnClick = N7Click
      end
    end
    object N15: TMenuItem
      Caption = #34920#21517
      OnClick = N15Click
    end
    object N8: TMenuItem
      Caption = #26465#20214
      object where1: TMenuItem
        Caption = 'where'
        OnClick = where1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object and1: TMenuItem
        Caption = 'and'
        OnClick = and1Click
      end
      object or1: TMenuItem
        Caption = 'or'
        OnClick = or1Click
      end
      object like1: TMenuItem
        Caption = 'like'
        OnClick = like1Click
      end
      object N14: TMenuItem
        Caption = '!='
        OnClick = N14Click
      end
    end
    object N9: TMenuItem
      Caption = #25490#21015
      object N10: TMenuItem
        Caption = 'Asc'
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = 'Desc'
        OnClick = N11Click
      end
    end
  end
end
