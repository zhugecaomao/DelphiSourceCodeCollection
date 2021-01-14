object RestoreDataForm: TRestoreDataForm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = #25968#25454#24674#22797
  ClientHeight = 348
  ClientWidth = 392
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
    Left = 282
    Top = 0
    Width = 110
    Height = 348
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object btnRestoreData: TBitBtn
      Left = 5
      Top = 8
      Width = 100
      Height = 25
      Caption = #24320#22987#24674#22797
      TabOrder = 0
      OnClick = OnRestore
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C30E0000C30E00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000007788888888888888078F77FFFFF77778078FA200000000
        78078F777778877700078FFFFF87F777AB07788888777F77BEE0777778777808
        E77077777877A0F077707777787AA808F770777778AAEBB77F707777778EEBB7
        7707777777788BB7887777777777777777777777777777777777}
    end
    object btnCancel: TBitBtn
      Left = 5
      Top = 40
      Width = 100
      Height = 25
      Cancel = True
      Caption = #20851' '#38381'(&E)'
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777700000000000077770FFF0BB0FFF077770FFF0BB0FFF077770FFF0BB0FF
        F077770FFF0BB0FFF077770FFF0000FFF077770FFFFFFFFFF07770B0FFFFFFFF
        0B07770B0FFFFFF0B0777770B0FFFF0B077777770B0FF0B00777777770B00B01
        07777777770BB071077777777770077107777777777777777777}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 282
    Height = 348
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 108
      Height = 12
      Caption = #25968#25454#24211#28304#25991#20214#36335#24452#65306
    end
    object Label2: TLabel
      Left = 8
      Top = 65
      Width = 120
      Height = 12
      Caption = #22791#20221#25968#25454#24211#25991#20214#36335#24452#65306
    end
    object lblDatabase: TLabel
      Left = 10
      Top = 24
      Width = 255
      Height = 12
      AutoSize = False
      Caption = 'lblDatabase'
      WordWrap = True
    end
    object ShellTreeView1: TShellTreeView
      Left = 8
      Top = 104
      Width = 265
      Height = 233
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      UseShellImages = True
      AutoRefresh = False
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 0
      OnChange = ShellTreeView1Change
    end
    object edtDir: TEdit
      Left = 8
      Top = 80
      Width = 265
      Height = 20
      TabOrder = 1
    end
  end
end
