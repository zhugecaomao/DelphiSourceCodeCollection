inherited frmMain: TfrmMain
  Left = 297
  Top = 111
  Width = 812
  Height = 425
  Caption = 'frmMain'
  Icon.Data = {
    0000010001001010003035373031680300001600000028000000100000002000
    000001001800000000004003000047466C656D696E6700000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000071CFFF009BEE0084C8343434676767484848252525009BEE00
    9BEE0084C8000000000000000000000000000000000000A8E1FF71CFFF41BFFF
    49494967676748484834343418B1FF009BEE0084C80000000000000000000000
    00000000000000A8E1FF71CFFF41BFFF4949496767674848483E3E3E18B1FF00
    9BEE0084C8000000000000000000000000000000000000A8E1FF71CFFF41BFFF
    49494967676748484849494918B1FF009BEE0084C80000000000000000000000
    00000000000000A8E1FF71CFFF41BFFF49494957575748484849494918B1FF00
    9BEE0084C8000000000000000000000000000000000000A8E1FF71CFFF41BFFF
    18B1FF49494949494918B1FF18B1FF009BEE0084C80000000000000000000000
    0000000018B1FF000000A8E1FF71CFFF41BFFF18B1FF18B1FF18B1FF009BEE00
    84C8000000008CD400000000000000000000000000000018B1FF000000A8E1FF
    71CFFF41BFFF18B1FF009BEE0084C8000000008CD40000000000000000000000
    0000000000000000000018B1FF000000A8E1FF41BFFF18B1FF0073AE00000000
    8CD400000000000000000000000000000000000000000000000000000018B1FF
    000000A8E1FF31B8FF00000000A1F300000071CFFF0000000000000000000000
    0000000000000000000000000000000018B1FF00000000000000A1F300000000
    000071CFFF000000000000000000000000000000000000000000000000000000
    00000041BFFF00A1F300000000000000000071CFFF0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFE007FFFFC003FFFFC003FFFFC003FFFFC003FFFFC003FFFFC003FFFF8001
    FFFFC003FFFFE003FFFFF003FFFFF803FFFFFC23FFFFFE73FFFFFFFFFFFF}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited StatusBar1: TStatusBar [1]
    Top = 352
    Width = 804
    Height = 27
    Font.Height = -14
    Panels = <
      item
        Style = psOwnerDraw
        Width = 100
      end
      item
        Style = psOwnerDraw
        Width = 520
      end
      item
        Alignment = taCenter
        Text = '2000-09-1'
        Width = 90
      end
      item
        Alignment = taCenter
        Text = #31995#32479#31649#29702#21592
        Width = 0
      end>
    ParentFont = False
  end
  inherited ProgressBar1: TProgressBar [2]
  end
  inherited AppPnl: TPanel [3]
    Top = 195
  end
  inherited PageScroller1: TPageScroller [4]
  end
  inherited PageScroller2: TPageScroller [5]
  end
  inherited pnlMain: TPanel [6]
    Width = 804
    Height = 352
    inherited Label2: TLabel
      Width = 815
      Caption = #26477#24030#20808#38155#36719#20214#26377#38480#20844#21496'     '#26477#24030#20808#38155#36719#20214#26377#38480#20844#21496
    end
    inherited Label3: TLabel
      Left = 20
      Width = 815
      Caption = #26477#24030#20808#38155#36719#20214#26377#38480#20844#21496'     '#26477#24030#20808#38155#36719#20214#26377#38480#20844#21496
    end
    inherited Label4: TLabel
      Left = 27
      Width = 815
      Caption = #26477#24030#20808#38155#36719#20214#26377#38480#20844#21496'     '#26477#24030#20808#38155#36719#20214#26377#38480#20844#21496
    end
    inherited Label5: TLabel
      Width = 815
      Caption = #26477#24030#20808#38155#36719#20214#26377#38480#20844#21496'     '#26477#24030#20808#38155#36719#20214#26377#38480#20844#21496
    end
    inherited Label6: TLabel
      Width = 815
      Caption = #26477#24030#20808#38155#36719#20214#26377#38480#20844#21496'     '#26477#24030#20808#38155#36719#20214#26377#38480#20844#21496
    end
    inherited Label7: TLabel
      Width = 815
      Caption = #26477#24030#20808#38155#36719#20214#26377#38480#20844#21496'     '#26477#24030#20808#38155#36719#20214#26377#38480#20844#21496
    end
    inherited Animate1: TAnimate
      Left = 356
      Top = 191
    end
  end
  inherited PopupMenu1: TPopupMenu
    OwnerDraw = True
  end
  inherited MainMenu1: TMainMenu
    AutoHotkeys = maAutomatic
    Images = nil
    OwnerDraw = True
    object mnuZlGl: TMenuItem [1]
      Caption = #36164#26009'(&L)'
      GroupIndex = 3
      object mnuDq: TMenuItem
        Caption = #22320#21306#36164#26009
        OnClick = mnuDqClick
      end
      object mnuKh: TMenuItem
        Caption = #23458#25143#36164#26009
        OnClick = mnuKhClick
      end
      object mnuGys: TMenuItem
        Caption = #20379#24212#21830#36164#26009
        OnClick = mnuGysClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuZh: TMenuItem
        Caption = #24080#25143#36164#26009
        OnClick = mnuZhClick
      end
      object mnuSfkfs: TMenuItem
        Caption = #25910#20184#27454#26041#24335
        OnClick = mnuSfkfsClick
      end
      object mnuSrzclb: TMenuItem
        Caption = #25910#20837#25903#20986#31867#21035
        OnClick = mnuSrzclbClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnuCk: TMenuItem
        Caption = #20179#24211#36164#26009
        OnClick = mnuCkClick
      end
      object mnuHplb: TMenuItem
        Caption = #36135#21697#31867#21035
        OnClick = mnuHplbClick
      end
      object mnuSjzlZl: TMenuItem
        Caption = #21806#20215#31181#31867
        OnClick = mnuSjzlZlClick
      end
      object mnuHphsfs: TMenuItem
        Caption = #36135#21697#26680#31639#26041#24335
        OnClick = mnuHphsfsClick
      end
      object mnuHp: TMenuItem
        Caption = #36135#21697#36164#26009
        OnClick = mnuHpClick
      end
      object mnuQtkcbdlx: TMenuItem
        Caption = #20854#23427#24211#23384#21464#21160#31867#22411
        OnClick = mnuQtkcbdlxClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object mnuBm: TMenuItem
        Caption = #37096#38376#36164#26009
        OnClick = mnuBmClick
      end
      object mnuYglb: TMenuItem
        Caption = #21592#24037#31867#21035
        OnClick = mnuYglbClick
      end
      object mnuYg: TMenuItem
        Caption = #21592#24037#36164#26009
        OnClick = mnuYgClick
      end
    end
    object mnuXsGl: TMenuItem [2]
      Caption = #38144#21806'(&X)'
      GroupIndex = 3
      object mnuXsdd: TMenuItem
        Caption = #38144#21806#35746#21333
        OnClick = mnuXsddClick
      end
      object mnuXskd: TMenuItem
        Caption = #38144#21806#24320#21333
        OnClick = mnuXskdClick
      end
      object mnuXssk: TMenuItem
        Caption = #38144#21806#25910#27454
        OnClick = mnuXsskClick
      end
      object mnuXsth: TMenuItem
        Caption = #38144#21806#36864#36135
        OnClick = mnuXsthClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuBbKhLsz: TMenuItem
        Caption = #23458#25143#27969#27700#24080
        OnClick = mnuBbKhLszClick
      end
      object mnuBbXsMlAdjs: TMenuItem
        Caption = #38144#21806#27611#21033#25353#21333#35745#31639
        OnClick = mnuBbXsMlAdjsClick
      end
      object mnuBbXsddQk: TMenuItem
        Caption = #38144#21806#35746#21333#25191#34892#24773#20917#34920
        OnClick = mnuBbXsddQkClick
      end
      object mnuBbXsMsdj: TMenuItem
        Caption = #38144#21806#26410#25910#21333#25454
        OnClick = mnuBbXsMsdjClick
      end
      object mnuCqYsk: TMenuItem
        Caption = #36229#26399#24212#25910#27454
        OnClick = mnuCqYskClick
      end
      object mnuJdqYsk: TMenuItem
        Caption = #23558#21040#26399#24212#25910#27454
        OnClick = mnuJdqYskClick
      end
    end
    object mnuCgGl: TMenuItem [3]
      Caption = #37319#36141'(&C)'
      GroupIndex = 3
      object mnuCgdd: TMenuItem
        Caption = #37319#36141#35746#21333
        OnClick = mnuCgdhClick
      end
      object mnuCgsh: TMenuItem
        Caption = #37319#36141#25910#36135
        OnClick = mnuCgshClick
      end
      object mnuCgfk: TMenuItem
        Caption = #37319#36141#20184#27454
        OnClick = mnuCgfkClick
      end
      object mnuCgth: TMenuItem
        Caption = #37319#36141#36864#36135
        OnClick = mnuCgthClick
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object mnuBbGysLsz: TMenuItem
        Caption = #20379#24212#21830#27969#27700#24080
        OnClick = mnuBbGysLszClick
      end
      object mnuBbCgddQk: TMenuItem
        Caption = #37319#36141#35746#21333#25191#34892#24773#20917#34920
        OnClick = mnuBbCgddQkClick
      end
      object mnuBbCgMfdj: TMenuItem
        Caption = #37319#36141#26410#20184#21333#25454
        OnClick = mnuBbCgMfdjClick
      end
      object mnuCqYfk: TMenuItem
        Caption = #36229#26399#24212#20184#27454
        OnClick = mnuCqYfkClick
      end
      object mnuJdqYfk: TMenuItem
        Caption = #23558#21040#26399#24212#20184#27454
        OnClick = mnuJdqYfkClick
      end
    end
    object mnuCkGl: TMenuItem [4]
      Caption = #20179#24211'(&K)'
      GroupIndex = 3
      object mnuLl: TMenuItem
        Caption = #39046#26009
        OnClick = mnuLlClick
      end
      object mnuTl: TMenuItem
        Caption = #36864#26009
        OnClick = mnuTlClick
      end
      object mnuCpjc: TMenuItem
        Caption = #20135#21697#36827#20179
        OnClick = mnuCpjcClick
      end
      object mnuKcpd: TMenuItem
        Caption = #24211#23384#30424#28857
        OnClick = mnuKcpdClick
      end
      object mnuChtj: TMenuItem
        Caption = #23384#36135#35843#20215
        OnClick = mnuChtjClick
      end
      object mnuCkdb: TMenuItem
        Caption = #20179#24211#35843#25320
        OnClick = mnuCkdbClick
      end
      object mnuQtkcbd: TMenuItem
        Caption = #20854#23427#24211#23384#21464#21160
        OnClick = mnuQtkcbdClick
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object mnuBbCkLsz: TMenuItem
        Caption = #20179#24211#27969#27700#24080
        OnClick = mnuBbCkLszClick
      end
      object mnuBbKcCwb: TMenuItem
        Caption = #36135#21697#20179#20301#34920
        OnClick = mnuBbKcCwbClick
      end
      object mnuFckcb: TMenuItem
        Caption = #20998#20179#24211#23384#34920
      end
    end
    object mnuSzGl: TMenuItem [5]
      Caption = #25910#25903'(&S)'
      GroupIndex = 3
      object mnuFykz: TMenuItem
        Caption = #36153#29992#24320#25903
        OnClick = mnuFykzClick
      end
      object mnuQtsr: TMenuItem
        Caption = #20854#23427#25910#20837
        OnClick = mnuQtsrClick
      end
      object mnuYhckqk: TMenuItem
        Caption = #38134#34892#23384#27454'/'#21462#27454
        OnClick = mnuYhckqkClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuBbSzLsz: TMenuItem
        Caption = #25910#25903#27969#27700#24080
        OnClick = mnuBbSzLszClick
      end
    end
    object mnuZbGl: TMenuItem [6]
      Caption = #24080#34180'(&Z)'
      GroupIndex = 3
      object mnuBbCkkcHz: TMenuItem
        Caption = #24211#23384#24635#24080
        OnClick = mnuBbCkkcHzClick
      end
      object mnuBbCkkcMx: TMenuItem
        Caption = #24211#23384#26126#32454#24080
        OnClick = mnuBbCkkcMxClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object mnuBbYskZb: TMenuItem
        Caption = #24212#25910#27454#24635#24080
        OnClick = mnuBbYskZbClick
      end
      object mnuBbYskMx: TMenuItem
        Caption = #24212#25910#27454#26126#32454#24080
        OnClick = mnuBbYskMxClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuBbYfkZb: TMenuItem
        Caption = #24212#20184#27454#24635#24080
        OnClick = mnuBbYfkZbClick
      end
      object mnuBbYfkMx: TMenuItem
        Caption = #24212#20184#27454#26126#32454#24080
        OnClick = mnuBbYfkMxClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuBbXjyhHz: TMenuItem
        Caption = #29616#37329#38134#34892#24635#24080
        OnClick = mnuBbXjyhHzClick
      end
      object mnuBbXjyhMx: TMenuItem
        Caption = #29616#37329#38134#34892#26126#32454#24080
      end
    end
    object mnuBbGl: TMenuItem [7]
      Caption = #25253#34920'(&R)'
      GroupIndex = 3
      object mnuXsBb: TMenuItem
        Caption = #38144#21806#25253#34920
        object mnuBbKhXsHz: TMenuItem
          Caption = #23458#25143#38144#21806#27719#24635#34920
          OnClick = mnuBbKhXsHzClick
        end
        object mnuBbKhXsMx: TMenuItem
          Caption = #23458#25143#38144#21806#26126#32454#34920
          OnClick = mnuBbKhXsMxClick
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object mnuBbHpXsHz: TMenuItem
          Caption = #36135#21697#38144#21806#27719#24635#34920
          OnClick = mnuBbHpXsHzClick
        end
        object mnuBbHpXsMx: TMenuItem
          Caption = #36135#21697#38144#21806#26126#32454#34920
          OnClick = mnuBbHpXsMxClick
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object mnuBbDqXsHz: TMenuItem
          Caption = #22320#21306#38144#21806#27719#24635#34920
          OnClick = mnuBbDqXsHzClick
        end
        object mnuBbDqXsMx: TMenuItem
          Caption = #22320#21306#38144#21806#26126#32454#34920
          OnClick = mnuBbDqXsMxClick
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object mnuBbHplbXsHz: TMenuItem
          Caption = #36135#21697#31867#21035#38144#21806#27719#24635#34920
          OnClick = mnuBbHplbXsHzClick
        end
        object mnuBbHplbXsMx: TMenuItem
          Caption = #36135#21697#31867#21035#38144#21806#26126#32454#34920
          OnClick = mnuBbHplbXsMxClick
        end
        object N28: TMenuItem
          Caption = '-'
        end
        object mnuBbYwyXsHz: TMenuItem
          Caption = #19994#21153#19994#38144#21806#27719#24635#34920
          OnClick = mnuBbYwyXsHzClick
        end
        object mnuBbYwyXsMx: TMenuItem
          Caption = #19994#21153#21592#38144#21806#26126#32454#34920
          OnClick = mnuBbYwyXsMxClick
        end
        object mnuBbYwyYjtj: TMenuItem
          Caption = #19994#21153#21592#19994#32489#32479#35745
          OnClick = mnuBbYwyYjtjClick
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object mnuBbHpXsMlHz: TMenuItem
          Caption = #38144#21806#27611#21033#27719#24635#34920
          OnClick = mnuBbHpXsMlHzClick
        end
        object mnuBbHpXsMlMx: TMenuItem
          Caption = #38144#21806#27611#21033#26126#32454#34920
          OnClick = mnuBbHpXsMlMxClick
        end
        object mnuBbXsNb: TMenuItem
          Caption = #38144#21806#27611#21033#24180#25253#34920
          OnClick = mnuBbXsNbClick
        end
      end
      object mnuCgBb: TMenuItem
        Caption = #37319#36141#25253#34920
        object mnuBbGysGhHz: TMenuItem
          Caption = #20379#24212#21830#20379#36135#27719#24635#34920
          OnClick = mnuBbGysGhHzClick
        end
        object mnuBbGysGhMx: TMenuItem
          Caption = #20379#24212#21830#20379#36135#26126#32454#34920
          OnClick = mnuBbGysGhMxClick
        end
        object N33: TMenuItem
          Caption = '-'
        end
        object mnuBbHpCgHz: TMenuItem
          Caption = #36135#21697#37319#36141#27719#24635#34920
          OnClick = mnuBbHpCgHzClick
        end
        object mnuBbHpCgMx: TMenuItem
          Caption = #36135#21697#37319#36141#26126#32454#34920
          OnClick = mnuBbHpCgMxClick
        end
        object N36: TMenuItem
          Caption = '-'
        end
        object mnuBbYwyCgHz: TMenuItem
          Caption = #19994#21153#21592#37319#36141#27719#24635#34920
          OnClick = mnuBbYwyCgHzClick
        end
        object mnuBbYwyCgMx: TMenuItem
          Caption = #19994#21153#21592#37319#36141#26126#32454#34920
          OnClick = mnuBbYwyCgMxClick
        end
      end
      object mnuZlfxBb: TMenuItem
        Caption = #24080#40836#20998#26512
        object mnuBbYskZlfx: TMenuItem
          Caption = #24212#25910#27454#24080#40836#20998#26512
          OnClick = mnuBbYskZlfxClick
        end
        object mnuBbYskZlMx: TMenuItem
          Caption = #24212#25910#27454#24080#40836#26126#32454
          OnClick = mnuBbYskZlMxClick
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object mnuBbYfkZlfx: TMenuItem
          Caption = #24212#20184#27454#24080#40836#20998#26512
          OnClick = mnuBbYfkZlfxClick
        end
        object mnuBbYfkZlMx: TMenuItem
          Caption = #24212#20184#27454#24080#40836#26126#32454
          OnClick = mnuBbYfkZlMxClick
        end
      end
      object mnuSzBb: TMenuItem
        Caption = #25910#25903#25253#34920
        object mnuBbSzHz: TMenuItem
          Caption = #36153#29992#24320#25903#21450#20854#23427#25910#20837#27719#24635#34920
          OnClick = mnuBbSzHzClick
        end
        object mnuBbSzMx: TMenuItem
          Caption = #36153#29992#24320#25903#21450#20854#23427#25910#20837#26126#32454#34920
          OnClick = mnuBbSzMxClick
        end
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnuYyLrb: TMenuItem
        Caption = #33829#19994#21033#28070#19968#35272#34920
        OnClick = mnuYyLrbClick
      end
      object mnuBbRqLsz: TMenuItem
        Caption = #26085#26399#27969#27700#24080
        OnClick = mnuBbRqLszClick
      end
    end
    inherited mnuTools: TMenuItem
      inherited mnuOption: TMenuItem
        Caption = #31995#32479#35774#32622'(&S)'
      end
      object mnuUserOption: TMenuItem
        Caption = #25105#30340#35774#32622'(&M)'
        OnClick = mnuUserOptionClick
      end
    end
  end
  object XPMenu1: TXPMenu
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
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
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    Active = True
    Left = 280
    Top = 32
  end
end
