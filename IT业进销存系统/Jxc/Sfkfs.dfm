inherited frmSfkfs: TfrmSfkfs
  Left = -1
  Top = 95
  Caption = '收付款方式'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sSfkfs
    Columns = <
      item
        Expanded = False
        FieldName = 'MC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aZHMC'
        PickList.Strings = ()
        Visible = True
      end>
  end
end
