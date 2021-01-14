object zglx: Tzglx
  Left = 192
  Top = 133
  BorderStyle = bsDialog
  Caption = #32844#24037#31867#22411
  ClientHeight = 344
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Button1: TButton
    Left = 216
    Top = 312
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    TabOrder = 0
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 3
    Top = 6
    Width = 294
    Height = 299
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #24050#26377#31867#22411
      object DBGrid1: TDBGrid
        Left = 8
        Top = 8
        Width = 273
        Height = 137
        DataSource = DataSource1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'classcodename'
            Title.Caption = #31867#22411#21517#31216
            Width = 220
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 152
        Width = 273
        Height = 105
        Caption = #35828#26126
        TabOrder = 1
        object DBMemo1: TDBMemo
          Left = 16
          Top = 24
          Width = 241
          Height = 65
          DataField = 'classcodememo'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #22686#21152
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 273
        Height = 81
        Caption = #31867#22411#21517#31216
        TabOrder = 0
        object Edit1: TEdit
          Left = 16
          Top = 32
          Width = 241
          Height = 20
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 96
        Width = 273
        Height = 161
        Caption = #35828#26126
        TabOrder = 1
        object Memo1: TMemo
          Left = 16
          Top = 24
          Width = 241
          Height = 121
          TabOrder = 0
        end
      end
    end
  end
  object Button2: TButton
    Left = 136
    Top = 312
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 56
    Top = 312
    Width = 75
    Height = 25
    Caption = #20445#23384
    Default = True
    TabOrder = 3
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 65528
    Top = 328
  end
  object ADOTable1: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_staffclasscode'
    Left = 63
    Top = 205
  end
end
