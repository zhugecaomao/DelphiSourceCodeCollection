inherited fmKqManager: TfmKqManager
  Left = 72
  Top = 103
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #32771#21220#25968#25454#32479#35745#20998#26512
  ClientHeight = 388
  ClientWidth = 695
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 225
    Height = 347
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object TreeBase: TTreeView
      Left = 0
      Top = 0
      Width = 225
      Height = 347
      Align = alClient
      BorderStyle = bsNone
      Color = clCream
      HotTrack = True
      Indent = 19
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      OnDblClick = TreeBaseDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 168
      Height = 19
      Caption = #32771#21220#25968#25454#32479#35745#20998#26512
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 225
    Top = 41
    Width = 470
    Height = 347
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Mmsg: TMemo
      Left = 0
      Top = 0
      Width = 470
      Height = 41
      Hint = #20998#26512#32771#21220#25968#25454
      Align = alTop
      BevelKind = bkSoft
      Color = cl3DLight
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 41
      Width = 470
      Height = 306
      Align = alClient
      DataSource = dsKqdata
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'newdate'
          Title.Alignment = taCenter
          Title.Caption = #32771#21220#26085#26399
          Width = 125
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'M_up'
          Title.Alignment = taCenter
          Title.Caption = #19978#21320#19978#29677
          Width = 152
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'M_down'
          Title.Alignment = taCenter
          Title.Caption = #19978#21320#19979#29677
          Width = 168
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'A_up'
          Title.Alignment = taCenter
          Title.Caption = #20013#21320#19978#29677
          Width = 106
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'A_down'
          Title.Alignment = taCenter
          Title.Caption = #20013#21320#19979#29677
          Width = 122
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'N_UP'
          Title.Alignment = taCenter
          Title.Caption = #26202#19978#19978#29677
          Width = 116
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'N_down'
          Title.Alignment = taCenter
          Title.Caption = #26202#19978#19979#29677
          Width = 112
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Add_up'
          Title.Alignment = taCenter
          Title.Caption = #21152#29677#19978#29677
          Width = 106
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Add_down'
          Title.Alignment = taCenter
          Title.Caption = #21152#29677#19979#29677
          Width = 114
          Visible = True
        end>
    end
  end
  object dsbasedata: TDataSource
    DataSet = dmmain.CDSquery2
    Left = 192
    Top = 16
  end
  object dsKqdata: TDataSource
    DataSet = dmmain.CDSexecsql
    Left = 440
    Top = 24
  end
  object cdsdata1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 16
  end
  object cdsdata2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 8
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 24
  end
end
