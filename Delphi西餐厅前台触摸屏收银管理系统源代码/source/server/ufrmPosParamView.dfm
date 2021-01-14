inherited frmPosParamView: TfrmPosParamView
  Left = 256
  Top = 304
  VertScrollBar.Range = 0
  ActiveControl = eDateTime
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pos'#37197#32622
  ClientHeight = 262
  ClientWidth = 448
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 448
    inherited tbNew: TToolButton
      Visible = False
    end
    inherited tbEdit: TToolButton
      Visible = False
    end
    inherited tbDel: TToolButton
      Visible = False
    end
    inherited tbFindData: TToolButton
      Visible = False
    end
    inherited ToolButton1: TToolButton
      Visible = False
    end
    inherited ToolButton2: TToolButton
      Visible = False
    end
    inherited tbConfirm: TToolButton
      Visible = False
    end
    inherited tbExport: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
  end
  inherited grdList: TdxDBGrid
    Width = 448
    Height = 188
    Visible = False
    Filter.Criteria = {00000000}
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 448
    Height = 188
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 52
      Height = 13
      Caption = #36328#22825#26102#38388
    end
    object Label2: TLabel
      Left = 12
      Top = 36
      Width = 66
      Height = 13
      Caption = #32467#26463#35821'('#19968')'
    end
    object Label3: TLabel
      Left = 12
      Top = 60
      Width = 66
      Height = 13
      Caption = #32467#26463#35821'('#20108')'
    end
    object Label4: TLabel
      Left = 12
      Top = 84
      Width = 66
      Height = 13
      Caption = #32467#26463#35821'('#19977')'
    end
    object Label5: TLabel
      Left = 12
      Top = 108
      Width = 66
      Height = 13
      Caption = #32467#26463#35821'('#22235')'
    end
    object Label6: TLabel
      Left = 12
      Top = 132
      Width = 66
      Height = 13
      Caption = #32467#26463#35821'('#20116')'
    end
    object eDateTime: TdxTimeEdit
      Left = 84
      Top = 8
      Width = 73
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      TimeEditFormat = tfHourMin
      StoredValues = 4
    end
    object eRemark1: TdxEdit
      Left = 84
      Top = 32
      Width = 309
      Style.BorderStyle = xbsSingle
      TabOrder = 1
    end
    object eRemark2: TdxEdit
      Left = 84
      Top = 56
      Width = 309
      Style.BorderStyle = xbsSingle
      TabOrder = 2
    end
    object eRemark3: TdxEdit
      Left = 84
      Top = 80
      Width = 309
      Style.BorderStyle = xbsSingle
      TabOrder = 3
    end
    object eRemark4: TdxEdit
      Left = 84
      Top = 104
      Width = 309
      Style.BorderStyle = xbsSingle
      TabOrder = 4
    end
    object eRemark5: TdxEdit
      Left = 84
      Top = 128
      Width = 309
      Style.BorderStyle = xbsSingle
      TabOrder = 5
    end
  end
  inherited ActionList1: TActionList
    Left = 252
    Top = 184
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
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
end
