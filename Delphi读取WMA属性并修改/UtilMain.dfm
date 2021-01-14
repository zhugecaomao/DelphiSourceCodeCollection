object Form1: TForm1
  Left = 250
  Top = 186
  Width = 732
  Height = 524
  Caption = #26597#30475'wma'#25991#20214#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageCtrlMain: TPageControl
    Left = 0
    Top = 0
    Width = 724
    Height = 497
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #25209#37327#35774#32622
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 161
        Height = 469
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Button7: TButton
          Left = 8
          Top = 16
          Width = 145
          Height = 25
          Caption = #35013#36733#25991#20214#22841
          TabOrder = 0
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 8
          Top = 104
          Width = 145
          Height = 25
          Caption = #26356#26032#25968#25454#24211'wma'#20449#24687
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 8
          Top = 168
          Width = 145
          Height = 25
          Caption = #20462#25913#25152#26377' '#26631#20934'tag'
          TabOrder = 2
          OnClick = Button9Click
        end
        object Button10: TButton
          Left = 8
          Top = 192
          Width = 145
          Height = 25
          Caption = #20462#25913#25152#26377'tag('#26631#20934'&&'#25193#23637')'
          TabOrder = 3
          OnClick = Button10Click
        end
        object edtDir: TEdit
          Left = 8
          Top = 40
          Width = 144
          Height = 21
          TabOrder = 4
        end
        object edtDest: TEdit
          Left = 8
          Top = 216
          Width = 144
          Height = 21
          TabOrder = 5
        end
      end
      object Panel3: TPanel
        Left = 161
        Top = 0
        Width = 555
        Height = 469
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object MemoDir: TMemo
          Left = 2
          Top = 2
          Width = 551
          Height = 465
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21333#29420#35774#32622
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 105
        Width = 716
        Height = 323
        Align = alClient
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 716
        Height = 105
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 20
          Height = 13
          Caption = 'Title'
          WordWrap = True
        end
        object Label2: TLabel
          Left = 16
          Top = 40
          Width = 23
          Height = 13
          Caption = 'Artist'
          WordWrap = True
        end
        object Label3: TLabel
          Left = 368
          Top = 40
          Width = 44
          Height = 13
          Caption = 'Comment'
          WordWrap = True
        end
        object Label4: TLabel
          Left = 368
          Top = 16
          Width = 49
          Height = 13
          Caption = 'CopyRight'
          WordWrap = True
        end
        object edtTitle: TEdit
          Left = 104
          Top = 16
          Width = 200
          Height = 21
          TabOrder = 0
        end
        object edtArtist: TEdit
          Left = 104
          Top = 40
          Width = 200
          Height = 21
          TabOrder = 1
        end
        object edtCopyRight: TEdit
          Left = 456
          Top = 16
          Width = 200
          Height = 21
          TabOrder = 2
        end
        object edtComment: TEdit
          Left = 456
          Top = 40
          Width = 200
          Height = 21
          TabOrder = 3
        end
        object Button2: TButton
          Left = 308
          Top = 16
          Width = 25
          Height = 21
          Caption = #25913
          TabOrder = 4
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 308
          Top = 40
          Width = 25
          Height = 21
          Caption = #25913
          TabOrder = 5
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 660
          Top = 16
          Width = 25
          Height = 21
          Caption = #25913
          TabOrder = 6
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 660
          Top = 40
          Width = 25
          Height = 21
          Caption = #25913
          TabOrder = 7
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 104
          Top = 68
          Width = 113
          Height = 23
          Caption = #28165#31354#25193#23637#26631#35760
          TabOrder = 8
          OnClick = Button6Click
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 428
        Width = 716
        Height = 41
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object btnSearch: TButton
          Left = 8
          Top = 8
          Width = 113
          Height = 25
          Caption = #24320#22987#26597#35810
          TabOrder = 0
          OnClick = btnSearchClick
        end
        object Edit1: TEdit
          Left = 272
          Top = 9
          Width = 433
          Height = 21
          TabOrder = 1
        end
        object Button1: TButton
          Left = 176
          Top = 8
          Width = 73
          Height = 25
          Caption = #36716#23384
          TabOrder = 2
          OnClick = Button1Click
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'wma file(*.wma)|*.wma'
    FilterIndex = 0
    InitialDir = 'E:\INetMusic\msc'
    OnCanClose = OpenDialog1CanClose
    Left = 272
    Top = 456
  end
  object OpenDlgDir: TOpenDialog
    Left = 180
    Top = 32
  end
end
