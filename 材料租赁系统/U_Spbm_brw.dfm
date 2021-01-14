object frmSpbm_brw: TfrmSpbm_brw
  Left = 271
  Top = 147
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #26448#26009#23450#20301#26597#35810
  ClientHeight = 400
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 555
      Height = 368
      Align = alClient
      DataSource = DM.DS_SPBMK_INDEX
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'spbh'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#30721
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'spmc'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21517#31216
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'jldw'
          Title.Alignment = taCenter
          Title.Caption = #35745#37327#21333#20301
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ggxh'
          Title.Alignment = taCenter
          Title.Caption = #35268#26684#22411#21495
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'spdj'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21333#20215
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bz'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Width = 150
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 368
    Width = 555
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtnOk: TBitBtn
      Left = 120
      Top = 6
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      OnClick = BitBtnOkClick
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
      Left = 328
      Top = 6
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
end
