inherited XfxmSelForm: TXfxmSelForm
  ActiveControl = edtValue
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 392
    inherited dbgSelect: TDBGrid
      Left = 193
      Width = 189
      OnDblClick = dbgSelectDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#21517#31216
          Width = 150
          Visible = True
        end>
    end
    object dbgXfdm: TDBGrid
      Left = 10
      Top = 10
      Width = 183
      Height = 207
      Align = alLeft
      DataSource = dsXfdm
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = dbgSelectDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFMC'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#31867#21035
          Width = 140
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 392
    inherited Image1: TImage
      Left = 111
    end
    inherited lblTitle: TLabel
      Left = 153
      Caption = #39044#23450#39033#30446
    end
    inherited cmbOption: TComboBox
      ItemIndex = 0
      Text = #39033#30446#21517#31216
      Items.Strings = (
        #39033#30446#21517#31216)
    end
    inherited edtValue: TEdit
      OnKeyPress = edtValueKeyPress
    end
  end
  inherited Panel3: TPanel
    Width = 392
    inherited btnOK: TBitBtn
      Left = 227
    end
    inherited btnCanc: TBitBtn
      Left = 307
    end
  end
  inherited qrySelect: TQuery
    DatabaseName = 'LFHOTELSYS'
    SQL.Strings = (
      'select * from KFDM')
    Left = 360
    Top = 88
  end
  inherited dsSelect: TDataSource
    OnDataChange = dsSelectDataChange
    Left = 392
    Top = 88
  end
  object tblXfdm: TTable
    DatabaseName = 'LFHOTELSYS'
    TableName = 'XFDM.db'
    Left = 40
    Top = 96
  end
  object dsXfdm: TDataSource
    DataSet = tblXfdm
    OnDataChange = dsXfdmDataChange
    Left = 80
    Top = 96
  end
end
