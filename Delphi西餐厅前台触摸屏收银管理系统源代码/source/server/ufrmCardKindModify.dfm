inherited frmCardKindModify: TfrmCardKindModify
  Left = 345
  Top = 338
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  ActiveControl = eKindName
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20250#21592#31867#22411'->%s'
  ClientHeight = 192
  ClientWidth = 238
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 12
    Width = 65
    Height = 13
    Caption = #31867#22411#32534#21495#65306
    Visible = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 11
    Width = 65
    Height = 13
    Caption = #31867#22411#21517#31216#65306
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 38
    Width = 65
    Height = 13
    Caption = #26159#21542#20805#20540#65306
  end
  object Label4: TLabel [3]
    Left = 16
    Top = 65
    Width = 65
    Height = 13
    Caption = #26159#21542#25240#25187#65306
  end
  object Label5: TLabel [4]
    Left = 16
    Top = 92
    Width = 65
    Height = 13
    Caption = #25240#25187#28857#25968#65306
  end
  inherited bbtnConfirm: TBitBtn
    Left = 60
    Top = 156
    OnClick = bbtnConfirmClick
  end
  inherited bbtnCancel: TBitBtn
    Left = 144
    Top = 156
  end
  object eKindId: TdxDBEdit [7]
    Left = 84
    Top = 8
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 2
    Visible = False
    DataField = 'kind_id'
    DataSource = Viewd
    ReadOnly = True
    StoredValues = 64
  end
  object eKindName: TdxDBEdit [8]
    Left = 84
    Top = 8
    Width = 121
    Color = clAqua
    Style.BorderStyle = xbsSingle
    TabOrder = 3
    DataField = 'kind_name'
    DataSource = Viewd
  end
  object eChbisSaving: TdxDBCheckEdit [9]
    Left = 84
    Top = 36
    Width = 21
    TabOrder = 4
    DataField = 'is_saving'
    DataSource = Viewd
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object eChbIsDiscount: TdxDBCheckEdit [10]
    Left = 84
    Top = 60
    Width = 21
    TabOrder = 5
    DataField = 'is_discount'
    DataSource = Viewd
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object eDiscount: TdxDBEdit [11]
    Left = 84
    Top = 88
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 6
    DataField = 'discount_point'
    DataSource = Viewd
  end
  object Viewq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 224
    Top = 12
    object Viewqkind_id: TIntegerField
      DisplayLabel = #31867#22411#32534#21495
      FieldName = 'kind_id'
    end
    object Viewqkind_name: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'kind_name'
      Size = 10
    end
    object Viewqis_saving: TBooleanField
      DisplayLabel = #26159#21542#20805#20540
      FieldName = 'is_saving'
    end
    object Viewqis_discount: TBooleanField
      DisplayLabel = #26159#21542#25240#25187
      FieldName = 'is_discount'
    end
    object Viewqdiscount_point: TFloatField
      DisplayLabel = #25240#25187#28857#25968
      FieldName = 'discount_point'
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 224
    Top = 36
  end
end
