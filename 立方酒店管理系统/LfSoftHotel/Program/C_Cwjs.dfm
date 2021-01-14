inherited CwjsForm: TCwjsForm
  Left = 217
  Width = 314
  Height = 325
  ActiveControl = DBEdit1
  Caption = #22812#23457
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 306
    inherited lblTitile: TLabel
      Left = 88
    end
    inherited Image1: TImage
      Left = 36
    end
  end
  inherited Panel2: TPanel
    Width = 306
    Height = 221
    inherited Bevel1: TBevel
      Width = 296
      Height = 211
    end
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 80
      Height = 16
      Caption = #20154#27665#24065#37329#39069
      FocusControl = DBEdit1
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 112
      Width = 80
      Height = 16
      Caption = #20449#29992#21345#37329#39069
      FocusControl = DBEdit2
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 160
      Width = 64
      Height = 16
      Caption = #25903#31080#37329#39069
      FocusControl = DBEdit3
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 16
      Width = 64
      Height = 16
      Caption = #24405#20837#26085#26399
      FocusControl = DBEdit4
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 158
      Top = 16
      Width = 64
      Height = 16
      Caption = #24405#20837#26102#38388
      FocusControl = DBEdit5
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 80
      Width = 257
      Height = 24
      DataField = 'D_RMB'
      DataSource = dsCwjs
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 128
      Width = 257
      Height = 24
      DataField = 'D_XYK'
      DataSource = dsCwjs
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 176
      Width = 257
      Height = 24
      DataField = 'D_ZP'
      DataSource = dsCwjs
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 32
      Width = 124
      Height = 24
      DataField = 'D_LRRQ'
      DataSource = dsCwjs
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 158
      Top = 32
      Width = 124
      Height = 24
      DataField = 'D_LRSJ'
      DataSource = dsCwjs
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Panel3: TPanel
    Top = 263
    Width = 306
    inherited btnOK: TBitBtn
      Left = 146
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 226
      OnClick = btnCancClick
    end
    object btnQuery: TBitBtn
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 2
      OnClick = btnQueryClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
  end
  inherited DosMove1: TDosMove
    Left = 264
  end
  object qryCwjs: TQuery
    OnNewRecord = qryCwjsNewRecord
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from CWJS where D_JSLX=:JSLX')
    Left = 24
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'JSLX'
        ParamType = ptInput
      end>
    object qryCwjsD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.CWJS.D_YSRQ'
      Size = 8
    end
    object qryCwjsD_JSLX: TStringField
      FieldName = 'D_JSLX'
      Origin = 'LFHOTELUSER.CWJS.D_JSLX'
      FixedChar = True
      Size = 1
    end
    object qryCwjsD_RMB: TFloatField
      FieldName = 'D_RMB'
      Origin = 'LFHOTELUSER.CWJS.D_RMB'
    end
    object qryCwjsD_XYK: TFloatField
      FieldName = 'D_XYK'
      Origin = 'LFHOTELUSER.CWJS.D_XYK'
    end
    object qryCwjsD_ZP: TFloatField
      FieldName = 'D_ZP'
      Origin = 'LFHOTELUSER.CWJS.D_ZP'
    end
    object qryCwjsD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.CWJS.D_CZYXM'
      Size = 8
    end
    object qryCwjsD_LRRQ: TDateTimeField
      FieldName = 'D_LRRQ'
      Origin = 'LFHOTELUSER.CWJS.D_LRRQ'
    end
    object qryCwjsD_LRSJ: TDateTimeField
      FieldName = 'D_LRSJ'
      Origin = 'LFHOTELUSER.CWJS.D_LRSJ'
      DisplayFormat = 'hh:nn:ss'
      EditMask = '!90:00:00;1; '
    end
  end
  object dsCwjs: TDataSource
    DataSet = qryCwjs
    Left = 64
    Top = 16
  end
end
