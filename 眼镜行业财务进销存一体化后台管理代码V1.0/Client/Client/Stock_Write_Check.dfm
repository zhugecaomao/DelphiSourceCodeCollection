object frm_Stock_Write_Check: Tfrm_Stock_Write_Check
  Left = 130
  Top = 149
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #12304#26469#36135#36873#25321#12305
  ClientHeight = 231
  ClientWidth = 495
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 231
    Align = alClient
    Caption = 'Panel1'
    Color = clSkyBlue
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 493
      Height = 229
      Align = alClient
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 16
        Width = 489
        Height = 211
        Align = alClient
        Color = clSkyBlue
        TabOrder = 0
        object Panel3: TPanel
          Left = 398
          Top = 1
          Width = 90
          Height = 209
          Align = alRight
          Color = clSkyBlue
          TabOrder = 0
          object Cmd_Check: TSpeedButton
            Left = 5
            Top = 12
            Width = 80
            Height = 24
            Caption = #36873#25321
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
            OnClick = Cmd_CheckClick
          end
          object Cmd_Close: TSpeedButton
            Left = 5
            Top = 45
            Width = 80
            Height = 24
            Caption = #20851#38381
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
            OnClick = Cmd_CloseClick
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 3
          Width = 395
          Height = 206
          FixedColor = clSkyBlue
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDblClick = Cmd_CheckClick
          Columns = <
            item
              Expanded = False
              FieldName = 'receipt_no'
              Title.Alignment = taCenter
              Title.Caption = #21333#25454#32534#21495
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'receipt_name'
              Title.Alignment = taCenter
              Title.Caption = #21333#25454#31867#22411
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'copy_date'
              Title.Alignment = taCenter
              Title.Caption = #24405#21333#26085#26399
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'proposer'
              Title.Alignment = taCenter
              Title.Caption = #32463#25163#20154
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Condense'
              Title.Alignment = taCenter
              Title.Caption = #25688#35201
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
end
