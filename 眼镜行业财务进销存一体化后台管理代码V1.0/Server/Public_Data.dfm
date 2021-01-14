object PublicServer: TPublicServer
  OldCreateOrder = False
  Left = 9
  Top = 84
  Height = 523
  Width = 782
  object DSPqr: TDataSetProvider
    DataSet = ADOQ
    Constraints = True
    Options = [poAllowCommandText]
    Top = 56
  end
  object ADOQ: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
  end
  object ADOQcheck: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from DP_Check where 1=2')
    Left = 88
  end
  object DScheck: TDataSetProvider
    DataSet = ADOQcheck
    Constraints = True
    Options = [poAllowCommandText]
    Left = 88
    Top = 48
  end
  object ADOQcheckdetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from DP_CheckDetail where 1=2')
    Left = 168
  end
  object DScheckdetail: TDataSetProvider
    DataSet = ADOQcheckdetail
    Constraints = True
    Options = [poAllowCommandText]
    Left = 160
    Top = 48
  end
  object aqupdate: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    CursorType = ctStatic
    Parameters = <>
    Left = 24
    Top = 120
  end
  object ADOQyyzcheck: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from dp_shortcheck where 1=2')
    Left = 264
  end
  object DSyyzcheck: TDataSetProvider
    DataSet = ADOQyyzcheck
    Constraints = True
    Options = [poAllowCommandText]
    Left = 264
    Top = 48
  end
  object ADOQyyzcheckdetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from dp_shortcheckdetail where 1=2')
    Left = 360
  end
  object DSyyzcheckdetail: TDataSetProvider
    DataSet = ADOQyyzcheckdetail
    Constraints = True
    Options = [poAllowCommandText]
    Left = 352
    Top = 56
  end
  object Dscheckquery: TDataSetProvider
    DataSet = aqupdate
    Constraints = True
    Options = [poAllowCommandText]
    Left = 32
    Top = 176
  end
  object aqmain: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 128
    Top = 120
  end
  object AQpay: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from PayReciveBill where 1=2')
    Left = 32
    Top = 232
  end
  object dsppay: TDataSetProvider
    DataSet = AQpay
    Constraints = True
    Left = 33
    Top = 280
  end
  object AQPAYDETAIL: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from  PayReciveBill_detail where 1=2')
    Left = 96
    Top = 232
  end
  object dspPAYDETAIL: TDataSetProvider
    DataSet = AQPAYDETAIL
    Constraints = True
    Left = 96
    Top = 280
  end
  object amoneyinput: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from moneyinput where 1=2')
    Left = 232
    Top = 176
  end
  object dspmoney: TDataSetProvider
    DataSet = amoneyinput
    Constraints = True
    Left = 232
    Top = 224
  end
  object amoneydetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from moneyinput_detail where 1=2')
    Left = 304
    Top = 176
  end
  object dspmoneydetail: TDataSetProvider
    DataSet = amoneydetail
    Constraints = True
    Left = 304
    Top = 224
  end
  object aqinfo: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 192
    Top = 120
  end
  object aqout: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 256
    Top = 120
  end
  object aqstockwarn: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end
      item
        Name = 'bh'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from stock_states where Storage_NO=:no and goods_no=:bh')
    Left = 32
    Top = 336
  end
  object dspstockwarning: TDataSetProvider
    DataSet = aqstockwarn
    Constraints = True
    Left = 32
    Top = 376
  end
  object aqstorage: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from storage where storage_no=:no')
    Left = 104
    Top = 336
  end
  object dspstorage: TDataSetProvider
    DataSet = aqstorage
    Constraints = True
    Left = 112
    Top = 376
  end
  object aqrscrap: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from DP_scrap where 1=2')
    Left = 232
    Top = 272
  end
  object dspcrap: TDataSetProvider
    DataSet = aqrscrap
    Constraints = True
    Options = [poAllowCommandText]
    Left = 232
    Top = 320
  end
  object dspscrapDetail: TDataSetProvider
    DataSet = aqrscrapDetail
    Constraints = True
    Options = [poAllowCommandText]
    Left = 312
    Top = 320
  end
  object aqrscrapDetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from dp_scrapdetail where 1=2')
    Left = 312
    Top = 272
  end
  object aqrOverflow: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from dp_Overflow where 1=2')
    Left = 384
    Top = 216
  end
  object aqrOverflowdetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from dp_Overflowdetail where 1=2')
    Left = 464
    Top = 216
  end
  object DspOverflow: TDataSetProvider
    DataSet = aqrOverflow
    Constraints = True
    Left = 384
    Top = 264
  end
  object dspOverflowdetail: TDataSetProvider
    DataSet = aqrOverflowdetail
    Constraints = True
    Left = 464
    Top = 264
  end
  object AReceipt: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'NO'
        DataType = ftString
        Size = -1
        Value = ''
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from Receipt where 1=2')
    Left = 376
    Top = 120
  end
  object aoutstrip: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from out_strip where 1=2')
    Left = 456
    Top = 8
  end
  object aoutstripdetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from out_strip_detail where 1=2')
    Left = 456
    Top = 64
  end
  object dspoutstrip: TDataSetProvider
    DataSet = aoutstrip
    Constraints = True
    Left = 464
    Top = 16
  end
  object dspoutdetail: TDataSetProvider
    DataSet = aoutstripdetail
    Constraints = True
    Left = 456
    Top = 72
  end
  object aqflat: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from dp_flat where stock_no=:no')
    Left = 592
    Top = 24
  end
  object aqflatdetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from dp_flatdetail where stock_no=:no')
    Left = 592
    Top = 120
  end
  object dspflat: TDataSetProvider
    DataSet = aqflat
    Constraints = True
    Left = 592
    Top = 32
  end
  object dspflatdetail: TDataSetProvider
    DataSet = aqflatdetail
    Constraints = True
    Left = 592
    Top = 136
  end
  object AQWRITEMAINTABLE: TADOStoredProc
    Connection = frm_Chain_Data.ADO_Connection
    ProcedureName = 'WriteMainBill;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@BillCode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@BillType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BillDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@BillEId'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@CheckEid'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@PassEid'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@UnitId'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = Null
      end
      item
        Name = '@UnitName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Total'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = '@IsCheck'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = '@Red'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = '@ShopNo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 50
        Size = -1
        Value = Null
      end
      item
        Name = '@Explain'
        Attributes = [paNullable]
        DataType = ftString
        Size = 250
        Value = Null
      end
      item
        Name = '@EditMode'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@BillID'
        DataType = ftInteger
        Value = Null
      end>
    Left = 208
    Top = 376
  end
  object AQtotalmoney: TADOStoredProc
    Connection = frm_Chain_Data.ADO_Connection
    ProcedureName = 'LQ_FillAccount;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@BillId'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = Null
      end
      item
        Name = '@CheckE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = Null
      end>
    Left = 272
    Top = 400
  end
  object aqbatchguest: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from DP_BatchGuest where BG_Code=:no')
    Left = 400
    Top = 320
  end
  object dspbatchguest: TDataSetProvider
    DataSet = aqbatchguest
    Constraints = True
    Left = 408
    Top = 336
  end
  object aqprices: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from goods_prices where goods_no=:no ')
    Left = 600
    Top = 200
  end
  object dspprice: TDataSetProvider
    DataSet = aqprices
    Constraints = True
    Left = 600
    Top = 248
  end
  object aqSupply_Company: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from [Supply_Company] where supply_NO=:no')
    Left = 536
    Top = 328
  end
  object dspSupply_Company: TDataSetProvider
    DataSet = aqSupply_Company
    Constraints = True
    Left = 536
    Top = 344
  end
  object aqbajg: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from dp_bcjg where Bc_no=:no')
    Left = 448
    Top = 392
  end
  object dspbcjg: TDataSetProvider
    DataSet = aqbajg
    Constraints = True
    Left = 448
    Top = 400
  end
  object dspbcap: TDataSetProvider
    DataSet = aqbcap
    Constraints = True
    Left = 528
    Top = 416
  end
  object aqbcap: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from dp_bcap where person_no=:no')
    Left = 528
    Top = 408
  end
  object aqstorage_join: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from storage_jion where 1=2')
    Left = 680
    Top = 32
  end
  object dspstoagemaster: TDataSetProvider
    DataSet = aqstorage_join
    Constraints = True
    Left = 680
    Top = 48
  end
  object dspstoagedetail: TDataSetProvider
    DataSet = aqstorage_detail
    Constraints = True
    Left = 664
    Top = 152
  end
  object aqstorage_detail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from storage_jion_detail where 1=2')
    Left = 664
    Top = 136
  end
  object Aqpresent: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from present where 1=2')
    Left = 696
    Top = 312
  end
  object aqpresent_detail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from present_detail where 1=2')
    Left = 696
    Top = 392
  end
  object Dsppresent: TDataSetProvider
    DataSet = Aqpresent
    Constraints = True
    Left = 672
    Top = 328
  end
  object dsppresent_detail: TDataSetProvider
    DataSet = aqpresent_detail
    Constraints = True
    Left = 672
    Top = 400
  end
  object InsertProc: TADOStoredProc
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 488
    Top = 144
  end
end
