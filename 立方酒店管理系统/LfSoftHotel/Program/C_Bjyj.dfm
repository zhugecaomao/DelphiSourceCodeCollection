inherited BjyjForm: TBjyjForm
  Left = 327
  Top = 122
  Width = 305
  Height = 270
  ActiveControl = edtKfh
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 297
    inherited lblTitile: TLabel
      Left = 96
      Width = 125
      Caption = #34917#20132#25276#37329
    end
    inherited Image1: TImage
      Left = 61
    end
  end
  inherited Panel2: TPanel
    Width = 297
    Height = 166
    inherited Bevel1: TBevel
      Width = 287
      Height = 156
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 287
      Height = 156
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #25955#23458#34917#20132
        TabVisible = False
        object edtKfh: TLabeledEdit
          Left = 12
          Top = 26
          Width = 245
          Height = 24
          EditLabel.Width = 48
          EditLabel.Height = 16
          EditLabel.Caption = #25151#38388#21495
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 0
          OnExit = edtKfhExit
        end
        object edtYjje: TLabeledEdit
          Left = 12
          Top = 79
          Width = 245
          Height = 24
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #34917#20132#37329#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 1
          OnExit = edtYjjeExit
          OnKeyPress = edtYjjeKeyPress
        end
      end
      object TabSheet2: TTabSheet
        Caption = #22242#38431#34917#20132
        ImageIndex = 1
        TabVisible = False
        object edtYjjetd: TLabeledEdit
          Left = 12
          Top = 74
          Width = 237
          Height = 24
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #34917#20132#37329#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 0
          OnExit = edtYjjeExit
          OnKeyPress = edtYjjeKeyPress
        end
        object edtTdmc: TLabeledEdit
          Left = 14
          Top = 24
          Width = 235
          Height = 24
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #22242#38431#21517#31216
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 208
    Width = 297
    inherited btnOK: TBitBtn
      Left = 137
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 217
    end
  end
  inherited DosMove1: TDosMove
    Left = 80
    Top = 48
  end
  object tblKryj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRYJ'
    Left = 8
    Top = 8
    object tblKryjD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Required = True
      Size = 12
    end
    object tblKryjD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKryjD_FKFS: TStringField
      FieldName = 'D_FKFS'
      Size = 10
    end
    object tblKryjD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblKryjD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblKryjD_YFJE: TFloatField
      FieldName = 'D_YFJE'
    end
    object tblKryjD_YFRQ: TDateTimeField
      FieldName = 'D_YFRQ'
    end
    object tblKryjD_YFSJ: TDateTimeField
      FieldName = 'D_YFSJ'
    end
    object tblKryjD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
end
