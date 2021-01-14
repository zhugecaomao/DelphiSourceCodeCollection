object frm_Man_Check: Tfrm_Man_Check
  Left = 275
  Top = 52
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #12304#23457#26680#21592#36873#25321#12305
  ClientHeight = 401
  ClientWidth = 308
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
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
    Width = 308
    Height = 401
    Align = alClient
    Caption = 'Panel1'
    Color = clSkyBlue
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 306
      Height = 399
      Align = alClient
      TabOrder = 0
      object ListView1: TListView
        Left = 2
        Top = 15
        Width = 302
        Height = 345
        Align = alClient
        Checkboxes = True
        Color = clSkyBlue
        Columns = <
          item
            Caption = #21592#24037#32534#21495
            Width = 100
          end
          item
            Alignment = taCenter
            Caption = #21592#24037#22995#21517
            Width = 98
          end
          item
            Alignment = taCenter
            Caption = #25152#23646#37096#38376
            Width = 100
          end>
        SortType = stData
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel2: TPanel
        Left = 2
        Top = 360
        Width = 302
        Height = 37
        Align = alBottom
        BorderStyle = bsSingle
        Color = clSkyBlue
        TabOrder = 1
        object btnOk: TBitBtn
          Left = 147
          Top = 5
          Width = 75
          Height = 25
          Caption = #30830#23450
          TabOrder = 0
          OnClick = btnOkClick
          Kind = bkOK
        end
        object btnCancel: TBitBtn
          Left = 221
          Top = 5
          Width = 75
          Height = 25
          Caption = #21462#28040
          TabOrder = 1
          OnClick = btnCancelClick
          Kind = bkCancel
        end
      end
    end
  end
end
