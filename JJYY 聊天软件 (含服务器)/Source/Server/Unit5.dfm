object frmBrowseUser: TfrmBrowseUser
  Left = 411
  Top = 364
  Width = 349
  Height = 290
  Caption = #27983#35272#29992#25143
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 341
    Height = 12
    Align = alTop
    Caption = 'Label1'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object UserList: TListView
    Left = 0
    Top = 12
    Width = 341
    Height = 251
    Align = alClient
    Columns = <
      item
        Caption = #26165#31216
      end
      item
        Caption = 'ID'
      end
      item
        Caption = #20027#26426#21517
      end
      item
        Caption = 'IP'#22320#22336
      end>
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    LargeImages = Form1.ImageList1
    ReadOnly = True
    ParentFont = False
    SmallImages = Form1.ImageList1
    TabOrder = 0
    ViewStyle = vsReport
    OnMouseDown = UserListMouseDown
  end
  object Pop: TPopupMenu
    Images = Form1.ImageList1
    OwnerDraw = True
    OnPopup = PopPopup
    Left = 32
    Top = 96
    object N1: TMenuItem
      Caption = #28155#21152
      ImageIndex = 4
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #31105#29992
      ImageIndex = 6
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = #24674#22797
      ImageIndex = 23
      OnClick = N5Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #23646#24615
      OnClick = N4Click
    end
  end
end
