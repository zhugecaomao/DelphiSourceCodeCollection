object frmPosSet: TfrmPosSet
  Left = -72
  Top = 140
  Width = 798
  Height = 555
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -32
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 33
  object Label2: TLabel
    Left = 104
    Top = 52
    Width = 160
    Height = 33
    Caption = #32467#26463#35821'('#19968')'
  end
  object Label3: TLabel
    Left = 104
    Top = 110
    Width = 160
    Height = 33
    Caption = #32467#26463#35821'('#20108')'
  end
  object Label4: TLabel
    Left = 104
    Top = 168
    Width = 160
    Height = 33
    Caption = #32467#26463#35821'('#19977')'
  end
  object Label5: TLabel
    Left = 104
    Top = 226
    Width = 160
    Height = 33
    Caption = #32467#26463#35821'('#22235')'
  end
  object Label6: TLabel
    Left = 104
    Top = 284
    Width = 160
    Height = 33
    Caption = #32467#26463#35821'('#20116')'
  end
  object eRemark1: TdxEdit
    Left = 300
    Top = 48
    Width = 309
    Style.BorderStyle = xbsSingle
    TabOrder = 0
  end
  object eRemark2: TdxEdit
    Left = 300
    Top = 105
    Width = 309
    Style.BorderStyle = xbsSingle
    TabOrder = 1
  end
  object eRemark3: TdxEdit
    Left = 300
    Top = 162
    Width = 309
    Style.BorderStyle = xbsSingle
    TabOrder = 2
  end
  object eRemark4: TdxEdit
    Left = 300
    Top = 219
    Width = 309
    Style.BorderStyle = xbsSingle
    TabOrder = 3
  end
  object eRemark5: TdxEdit
    Left = 300
    Top = 276
    Width = 309
    Style.BorderStyle = xbsSingle
    TabOrder = 4
  end
  object bbtnSelect1: TBitBtn
    Left = 612
    Top = 48
    Width = 165
    Height = 37
    Caption = #36873#25321
    TabOrder = 5
    OnClick = bbtnSelect1Click
  end
  object bbtnSelect2: TBitBtn
    Left = 612
    Top = 105
    Width = 165
    Height = 37
    Caption = #36873#25321
    TabOrder = 6
    OnClick = bbtnSelect2Click
  end
  object bbtnSelect3: TBitBtn
    Left = 612
    Top = 162
    Width = 165
    Height = 37
    Caption = #36873#25321
    TabOrder = 7
    OnClick = bbtnSelect3Click
  end
  object bbtnSelect4: TBitBtn
    Left = 612
    Top = 219
    Width = 165
    Height = 37
    Caption = #36873#25321
    TabOrder = 8
    OnClick = bbtnSelect4Click
  end
  object bbtnSelect5: TBitBtn
    Left = 612
    Top = 277
    Width = 165
    Height = 37
    Caption = #36873#25321
    TabOrder = 9
    OnClick = bbtnSelect5Click
  end
  object bbtnExit: TBitBtn
    Left = 612
    Top = 345
    Width = 165
    Height = 37
    Caption = #36820#22238
    TabOrder = 10
    OnClick = bbtnExitClick
  end
  object Viewq: TCSADOQuery
    CursorType = ctStatic
    AfterScroll = ViewqAfterScroll
    Parameters = <>
    Left = 216
    Top = 196
    object ViewqI_DATETIME: TStringField
      DisplayLabel = #36328#22825#26102#38388
      FieldName = 'I_DATETIME'
      Size = 10
    end
    object ViewqI_REMARK1: TStringField
      DisplayLabel = #32467#26463#35821'('#19968')'
      FieldName = 'I_REMARK1'
      Size = 50
    end
    object ViewqI_REMARK2: TStringField
      DisplayLabel = #32467#26463#35821'('#20108')'
      FieldName = 'I_REMARK2'
      Size = 50
    end
    object ViewqI_REMARK3: TStringField
      DisplayLabel = #32467#26463#35821'('#19977')'
      FieldName = 'I_REMARK3'
      Size = 50
    end
    object ViewqI_REMARK4: TStringField
      DisplayLabel = #32467#26463#35821'('#22235')'
      FieldName = 'I_REMARK4'
      Size = 50
    end
    object ViewqI_REMARK5: TStringField
      DisplayLabel = #32467#26463#35821'('#20116')'
      FieldName = 'I_REMARK5'
      Size = 50
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 216
    Top = 288
  end
end
