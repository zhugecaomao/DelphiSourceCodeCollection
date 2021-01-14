inherited DhfBrowForm: TDhfBrowForm
  Height = 450
  ActiveControl = edtValue
  Caption = #25253#34920
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Width = 156
      Caption = #30005#35805#36153#25253#34920
    end
    inherited cmbOption: TComboBox
      ItemIndex = 0
      Text = #20998#26426#21495
      Items.Strings = (
        #20998#26426#21495)
    end
    inherited btnLoca: TBitBtn
      OnClick = btnLocaClick
    end
  end
  inherited Panel2: TPanel
    Height = 314
    inherited DBGrid1: TDBGrid
      Height = 148
      Align = alTop
    end
    object DBGrid2: TDBGrid
      Left = 5
      Top = 153
      Width = 526
      Height = 156
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsDetail
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
    end
  end
  inherited Panel3: TPanel
    Top = 388
    inherited btnPrint: TBitBtn
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from DHF')
  end
  object qryDetail: TQuery
    DataSource = dsWork
    Left = 96
    Top = 8
  end
  object dsDetail: TDataSource
    DataSet = qryDetail
    Left = 160
    Top = 8
  end
end
