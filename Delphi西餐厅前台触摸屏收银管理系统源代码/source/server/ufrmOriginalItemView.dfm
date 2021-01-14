inherited frmOriginalItemView: TfrmOriginalItemView
  Top = 89
  VertScrollBar.Range = 0
  ActiveControl = eOriginalCD
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21407#26009#20998#31867
  ClientHeight = 454
  ClientWidth = 523
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 523
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
  end
  inherited grdList: TdxDBGrid
    Top = 169
    Width = 523
    Height = 285
    Filter.Criteria = {00000000}
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_ORIGINAL_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 81
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_CD'
    end
    object grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_NAME'
    end
    object grdListI_ORIGINAL_COLOR: TdxDBGridColumn
      Visible = False
      Width = 142
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_COLOR'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 523
    Height = 95
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 4
      Width = 26
      Height = 13
      Caption = #32534#21495
    end
    object Label2: TLabel
      Left = 12
      Top = 44
      Width = 26
      Height = 13
      Caption = #21517#31216
    end
    object eOriginalCD: TdxEdit
      Left = 12
      Top = 20
      Width = 49
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 2
      StoredValues = 2
    end
    object eOriginalName: TdxEdit
      Left = 12
      Top = 60
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
    object ViewqI_ORIGINAL_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_ORIGINAL_CD'
      Size = 4
    end
    object ViewqI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_ORIGINAL_NAME'
      Size = 30
    end
    object ViewqI_ORIGINAL_COLOR: TLargeintField
      FieldName = 'I_ORIGINAL_COLOR'
    end
  end
end
