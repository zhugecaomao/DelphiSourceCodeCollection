inherited frmUserEdit: TfrmUserEdit
  Left = 224
  Top = 130
  Width = 367
  Height = 215
  Caption = 'frmUserEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 333
    Height = 122
  end
  inherited Label1: TLabel
    Left = 34
    Width = 60
    Caption = '用户代码'
  end
  object Label2: TLabel [2]
    Left = 34
    Top = 64
    Width = 60
    Height = 15
    Alignment = taRightJustify
    Caption = '用户名称'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 62
    Top = 100
    Width = 30
    Height = 15
    Alignment = taRightJustify
    Caption = '组别'
  end
  inherited btnInsert: TBitBtn
    Top = 142
    TabOrder = 3
  end
  inherited btnOk: TBitBtn
    Left = 153
    Top = 142
    TabOrder = 4
  end
  inherited btnCancel: TBitBtn
    Left = 255
    Top = 142
    TabOrder = 5
  end
  inherited DBEdit1: TDBEdit
    Width = 60
    DataField = 'uCode'
    DataSource = Data.sAppUser
  end
  object DBEdit2: TDBEdit [8]
    Left = 102
    Top = 60
    Width = 150
    Height = 23
    DataField = 'uName'
    DataSource = Data.sAppUser
    TabOrder = 1
  end
  inherited DBNavigator1: TDBNavigator
    Top = 150
    TabOrder = 6
  end
  object DBComboBox1: TDBComboBox
    Left = 102
    Top = 96
    Width = 150
    Height = 23
    Style = csDropDownList
    DataField = 'gName'
    DataSource = Data.sAppUser
    DropDownCount = 15
    ItemHeight = 15
    Items.Strings = (
      '铬'
      '铬金'
      '骨色'
      '白'
      '粉蓝'
      '粉红'
      '灰'
      '红'
      '黑'
      '深蓝'
      '宝石蓝'
      '绿'
      '黄'
      '金'
      '银'
      '不锈钢'
      '沙金'
      '香槟金'
      '')
    TabOrder = 2
  end
end
