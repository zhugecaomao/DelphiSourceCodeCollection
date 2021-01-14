inherited frmZhEdit: TfrmZhEdit
  Top = 138
  Width = 387
  Height = 289
  Caption = 'frmZhEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 355
    Height = 193
  end
  inherited Label1: TLabel
    Left = 30
    Width = 60
    Caption = '帐户名称'
  end
  object Label3: TLabel [2]
    Left = 30
    Top = 100
    Width = 60
    Height = 15
    Caption = '开户银行'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 30
    Top = 136
    Width = 60
    Height = 15
    Caption = '银行帐号'
    FocusControl = DBEdit4
  end
  object Label2: TLabel [4]
    Left = 60
    Top = 64
    Width = 30
    Height = 15
    Alignment = taRightJustify
    Caption = '类别'
  end
  object Label5: TLabel [5]
    Left = 30
    Top = 172
    Width = 60
    Height = 15
    Caption = '期初余额'
    FocusControl = DBEdit2
  end
  inherited btnInsert: TBitBtn
    Top = 218
    TabOrder = 5
  end
  inherited btnOk: TBitBtn
    Left = 176
    Top = 218
    TabOrder = 6
  end
  inherited btnCancel: TBitBtn
    Left = 278
    Top = 218
    TabOrder = 7
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Width = 164
    DataField = 'MC'
    DataSource = Data.sZh
  end
  inherited DBNavigator1: TDBNavigator
    Top = 226
    TabOrder = 8
  end
  object DBEdit3: TDBEdit
    Left = 96
    Top = 96
    Width = 247
    Height = 23
    DataField = 'KHYH'
    DataSource = Data.sZh
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 96
    Top = 132
    Width = 164
    Height = 23
    DataField = 'YHZH'
    DataSource = Data.sZh
    TabOrder = 3
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 96
    Top = 50
    Width = 247
    Height = 36
    BiDiMode = bdLeftToRight
    Columns = 2
    DataField = 'YHL'
    DataSource = Data.sZh
    Items.Strings = (
      '银行存款类'
      '现金类')
    ParentBiDiMode = False
    TabOrder = 1
    Values.Strings = (
      'True'
      'False')
    OnChange = DBRadioGroup1Change
  end
  object DBEdit2: TDBEdit
    Left = 96
    Top = 168
    Width = 100
    Height = 23
    DataField = 'QCJE'
    DataSource = Data.sZh
    TabOrder = 4
  end
end
