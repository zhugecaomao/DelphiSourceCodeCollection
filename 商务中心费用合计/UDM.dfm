object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 226
  Top = 165
  Height = 464
  Width = 628
  object adocon1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=buisnss;Data Source=xjhotel;Use Procedure for Prepare' +
      '=1;Auto Translate=True;Packet Size=4096;Workstation ID=XJHOTEL;U' +
      'se Encryption for Data=False;Tag with column collation when poss' +
      'ible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 30
    Top = 27
  end
  object ADOq1: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from center')
    Left = 99
    Top = 105
    object ADOq1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOq1t_time: TDateTimeField
      FieldName = 't_time'
    end
    object ADOq1npage: TBCDField
      FieldName = 'npage'
      Precision = 19
    end
    object ADOq1wpage: TBCDField
      FieldName = 'wpage'
      Precision = 19
    end
    object ADOq1B5: TBCDField
      FieldName = 'B5'
      Precision = 19
    end
    object ADOq1k16: TBCDField
      FieldName = 'k16'
      Precision = 19
    end
    object ADOq1A4: TBCDField
      FieldName = 'A4'
      Precision = 19
    end
    object ADOq1B4: TBCDField
      FieldName = 'B4'
      Precision = 19
    end
    object ADOq1K8: TBCDField
      FieldName = 'K8'
      Precision = 19
    end
    object ADOq1A3: TBCDField
      FieldName = 'A3'
      Precision = 19
    end
    object ADOq1A42: TBCDField
      FieldName = 'A42'
      Precision = 19
    end
    object ADOq1K82: TBCDField
      FieldName = 'K82'
      Precision = 19
    end
    object ADOq1LABAN: TBCDField
      FieldName = 'LABAN'
      Precision = 19
    end
    object ADOq1chinacall: TBCDField
      FieldName = 'chinacall'
      Precision = 19
    end
    object ADOq1hgcall: TBCDField
      FieldName = 'hgcall'
      Precision = 19
    end
    object ADOq1nationcall: TBCDField
      FieldName = 'nationcall'
      Precision = 19
    end
    object ADOq1SENDOUTSIDE: TBCDField
      FieldName = 'SENDOUTSIDE'
      Precision = 19
    end
    object ADOq1sendinside: TBCDField
      FieldName = 'sendinside'
      Precision = 19
    end
    object ADOq1sendprive: TBCDField
      FieldName = 'sendprive'
      Precision = 19
    end
    object ADOq1resivdpage: TBCDField
      FieldName = 'resivdpage'
      Precision = 19
    end
    object ADOq1department: TStringField
      FieldName = 'department'
      Size = 30
    end
    object ADOq1lx: TStringField
      FieldName = 'lx'
      Size = 2
    end
    object ADOq1hjje: TBCDField
      FieldName = 'hjje'
      Precision = 19
    end
    object ADOq1CZY: TStringField
      FieldName = 'CZY'
      Size = 10
    end
    object ADOq1XTSJ: TStringField
      FieldName = 'XTSJ'
    end
  end
  object ADOTEMP: TADOQuery
    Connection = adocon1
    Parameters = <>
    Left = 31
    Top = 101
  end
  object qryadoq2: TADOQuery
    Connection = adocon1
    Parameters = <>
    SQL.Strings = (
      'select * from center')
    Left = 101
    Top = 153
    object qryadoq2t_time: TDateTimeField
      FieldName = 't_time'
    end
    object qryadoq2npage: TBCDField
      FieldName = 'npage'
      Precision = 19
    end
    object qryadoq2wpage: TBCDField
      FieldName = 'wpage'
      Precision = 19
    end
    object qryadoq2B5: TBCDField
      FieldName = 'B5'
      Precision = 19
    end
    object qryadoq2k16: TBCDField
      FieldName = 'k16'
      Precision = 19
    end
    object qryadoq2A4: TBCDField
      FieldName = 'A4'
      Precision = 19
    end
    object qryadoq2B4: TBCDField
      FieldName = 'B4'
      Precision = 19
    end
    object qryadoq2K8: TBCDField
      FieldName = 'K8'
      Precision = 19
    end
    object qryadoq2A3: TBCDField
      FieldName = 'A3'
      Precision = 19
    end
    object qryadoq2A42: TBCDField
      FieldName = 'A42'
      Precision = 19
    end
    object qryadoq2K82: TBCDField
      FieldName = 'K82'
      Precision = 19
    end
    object qryadoq2LABAN: TBCDField
      FieldName = 'LABAN'
      Precision = 19
    end
    object qryadoq2chinacall: TBCDField
      FieldName = 'chinacall'
      Precision = 19
    end
    object qryadoq2hgcall: TBCDField
      FieldName = 'hgcall'
      Precision = 19
    end
    object qryadoq2nationcall: TBCDField
      FieldName = 'nationcall'
      Precision = 19
    end
    object qryadoq2SENDOUTSIDE: TBCDField
      FieldName = 'SENDOUTSIDE'
      Precision = 19
    end
    object qryadoq2sendinside: TBCDField
      FieldName = 'sendinside'
      Precision = 19
    end
    object qryadoq2sendprive: TBCDField
      FieldName = 'sendprive'
      Precision = 19
    end
    object qryadoq2resivdpage: TBCDField
      FieldName = 'resivdpage'
      Precision = 19
    end
    object qryadoq2department: TStringField
      FieldName = 'department'
      Size = 30
    end
  end
  object qrypsw: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from psw_ta')
    Left = 102
    Top = 198
    object qrypswid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qrypswczydm: TStringField
      FieldName = 'czydm'
      Size = 10
    end
    object qrypswczyxm: TStringField
      FieldName = 'czyxm'
      Size = 10
    end
    object qrypswczykl: TStringField
      FieldName = 'czykl'
      Size = 10
    end
  end
  object qrykr: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tableforpeople')
    Left = 291
    Top = 65
    object qrykrid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qrykrchinsepage: TBCDField
      FieldName = 'chinsepage'
      Precision = 19
    end
    object qrykrenglishpage: TBCDField
      FieldName = 'englishpage'
      Precision = 19
    end
    object qrykrA4: TBCDField
      FieldName = 'A4'
      Precision = 19
    end
    object qrykrK16: TBCDField
      FieldName = 'K16'
      Precision = 19
    end
    object qrykrB5: TBCDField
      FieldName = 'B5'
      Precision = 19
    end
    object qrykrA3: TBCDField
      FieldName = 'A3'
      Precision = 19
    end
    object qrykrK8: TBCDField
      FieldName = 'K8'
      Precision = 19
    end
    object qrykrB4: TBCDField
      FieldName = 'B4'
      Precision = 19
    end
    object qrykrsendoutside: TBCDField
      FieldName = 'sendoutside'
      Precision = 19
    end
    object qrykrsendinside: TBCDField
      FieldName = 'sendinside'
      Precision = 19
    end
    object qrykrsendprive: TBCDField
      FieldName = 'sendprive'
      Precision = 19
    end
    object qrykrresivd: TBCDField
      FieldName = 'resivd'
      Precision = 19
    end
    object qrykrprint1: TBCDField
      FieldName = 'print1'
      Precision = 19
    end
    object qrykrsacn: TBCDField
      FieldName = 'sacn'
      Precision = 19
    end
    object qrykrnationcall: TBCDField
      FieldName = 'nationcall'
      Precision = 19
    end
    object qrykrhgcall: TBCDField
      FieldName = 'hgcall'
      Precision = 19
    end
    object qrykrchinacall: TBCDField
      FieldName = 'chinacall'
      Precision = 19
    end
    object qrykrintenet: TBCDField
      FieldName = 'intenet'
      Precision = 19
    end
    object qrykrland: TBCDField
      FieldName = 'land'
      Precision = 19
    end
    object qrykrpreson: TStringField
      FieldName = 'preson'
      Size = 8
    end
    object qrykrneibuje: TBCDField
      FieldName = 'neibuje'
      Precision = 19
    end
    object qrykrrq: TDateTimeField
      FieldName = 'rq'
    end
    object qrykrlx: TStringField
      FieldName = 'lx'
      Size = 2
    end
    object qrykrCZY: TStringField
      FieldName = 'CZY'
    end
    object qrykrXTSJ: TStringField
      FieldName = 'XTSJ'
    end
  end
  object qry1: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from bumen_table')
    Left = 348
    Top = 64
  end
  object qrytemp: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tableforpeople ')
    Left = 29
    Top = 152
  end
  object MONEYREPORT: TfrxDBDataset
    UserName = 'MONEYREPORT'
    CloseDataSource = True
    DataSet = qryREPORT
    Left = 32
    Top = 242
  end
  object qryREPORT: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from center')
    Left = 103
    Top = 243
  end
  object qryKERENREPORT: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    Left = 104
    Top = 287
  end
  object frxKERENREPORT: TfrxDBDataset
    UserName = 'qryKERENREPORT'
    CloseDataSource = True
    DataSet = qryKERENREPORT
    Left = 32
    Top = 285
  end
  object ADObmls: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from center')
    Left = 189
    Top = 152
  end
  object ADOkrls: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tableforpeople')
    Left = 244
    Top = 152
  end
  object ADOSzz: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'sumvalues;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@sel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@krq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@jrq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 423
    Top = 256
  end
  object ADOSzz2: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'sumvalues;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@sel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@krq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@jrq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 474
    Top = 255
  end
  object ADOSje: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'summoney;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@sel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@krq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@jrq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 421
    Top = 316
  end
  object ADOSje2: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'summoney;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@sel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@krq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@jrq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 474
    Top = 316
  end
  object ADOCODE: TADOQuery
    Connection = adocon1
    Parameters = <>
    Left = 294
    Top = 107
  end
  object ADOTJ: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tjb')
    Left = 292
    Top = 153
  end
  object ADOalllname: TADOQuery
    Active = True
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from all_name')
    Left = 191
    Top = 104
  end
  object ADOl_assist: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from l_assist')
    Left = 242
    Top = 104
    object ADOl_assistID: TIntegerField
      FieldName = 'ID'
    end
    object ADOl_assistPYNAME: TStringField
      FieldName = 'PYNAME'
    end
    object ADOl_assistZSNAME: TStringField
      FieldName = 'ZSNAME'
      Size = 50
    end
    object ADOl_assistJE: TBCDField
      FieldName = 'JE'
      Precision = 19
    end
    object ADOl_assistrq: TDateTimeField
      FieldName = 'rq'
    end
    object ADOl_assistbm: TStringField
      FieldName = 'bm'
      Size = 30
    end
    object ADOl_assistdm: TIntegerField
      FieldName = 'dm'
    end
  end
  object ADOHZ: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'hzmxtab;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@krq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@jrq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 527
    Top = 255
  end
  object qrytime: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from xtsz')
    Left = 33
    Top = 200
    object qrytimextsj: TStringField
      FieldName = 'xtsj'
    end
  end
  object ADOrbsl: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'rbbsltj;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 527
    Top = 315
    object ADOrbslfy3: TIntegerField
      FieldName = 'fy3'
    end
    object ADOrbslfy5: TIntegerField
      FieldName = 'fy5'
    end
    object ADOrbslsendprive: TIntegerField
      FieldName = 'sendprive'
    end
    object ADOrbslchinsepage: TIntegerField
      FieldName = 'chinsepage'
    end
    object ADOrbslprint1: TIntegerField
      FieldName = 'print1'
    end
    object ADOrbslsendinside: TIntegerField
      FieldName = 'sendinside'
    end
    object ADOrbslsendoutside: TIntegerField
      FieldName = 'sendoutside'
    end
    object ADOrbslresivd: TIntegerField
      FieldName = 'resivd'
    end
    object ADOrbslsacn: TIntegerField
      FieldName = 'sacn'
    end
    object ADOrbslchinacall: TIntegerField
      FieldName = 'chinacall'
    end
    object ADOrbslnationcall: TIntegerField
      FieldName = 'nationcall'
    end
    object ADOrbslhgcall: TIntegerField
      FieldName = 'hgcall'
    end
    object ADOrbslintenet: TIntegerField
      FieldName = 'intenet'
    end
    object ADOrbslland: TIntegerField
      FieldName = 'land'
    end
  end
  object ADOSrbbje: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'rbbje;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 424
    Top = 368
    object ADOSrbbjechinsepage: TCurrencyField
      FieldName = 'chinsepage'
    end
    object ADOSrbbjeprint1: TCurrencyField
      FieldName = 'print1'
    end
    object ADOSrbbjesendprive: TCurrencyField
      FieldName = 'sendprive'
    end
    object ADOSrbbjesendinside: TCurrencyField
      FieldName = 'sendinside'
    end
    object ADOSrbbjesendoutside: TCurrencyField
      FieldName = 'sendoutside'
    end
    object ADOSrbbjefyj3: TCurrencyField
      FieldName = 'fyj3'
    end
    object ADOSrbbjefyj5: TCurrencyField
      FieldName = 'fyj5'
    end
    object ADOSrbbjechinacall: TCurrencyField
      FieldName = 'chinacall'
    end
    object ADOSrbbjenationcall: TCurrencyField
      FieldName = 'nationcall'
    end
    object ADOSrbbjehgcall: TCurrencyField
      FieldName = 'hgcall'
    end
    object ADOSrbbjeresivd: TCurrencyField
      FieldName = 'resivd'
    end
    object ADOSrbbjesacn: TCurrencyField
      FieldName = 'sacn'
    end
    object ADOSrbbjeintenet: TCurrencyField
      FieldName = 'intenet'
    end
    object ADOSrbbjeland: TCurrencyField
      FieldName = 'land'
    end
  end
  object spbmsl: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'bmxmzs;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@t_time'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 474
    Top = 368
    object spbmslbmzsl: TIntegerField
      FieldName = 'bmzsl'
    end
  end
  object spbmhjje: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'bmhjjes;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 528
    Top = 367
    object spbmhjjenpage: TCurrencyField
      FieldName = 'npage'
    end
    object spbmhjjefyje: TCurrencyField
      FieldName = 'fyje'
    end
    object spbmhjjea42: TCurrencyField
      FieldName = 'a42'
    end
    object spbmhjjek82: TBCDField
      FieldName = 'k82'
      ReadOnly = True
      Precision = 22
      Size = 6
    end
    object spbmhjjelaban: TBCDField
      FieldName = 'laban'
      ReadOnly = True
      Precision = 22
      Size = 5
    end
    object spbmhjjecz: TBCDField
      FieldName = 'cz'
      ReadOnly = True
      Precision = 26
      Size = 6
    end
    object spbmhjjecha: TBCDField
      FieldName = 'cha'
      ReadOnly = True
      Precision = 19
    end
  end
  object sptjje: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'tjje;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@time'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 573
    Top = 254
    object sptjjechinsepage: TCurrencyField
      FieldName = 'chinsepage'
    end
    object sptjjeprint1: TCurrencyField
      FieldName = 'print1'
    end
    object sptjjefyj3: TCurrencyField
      FieldName = 'fyj3'
    end
    object sptjjefyj5: TCurrencyField
      FieldName = 'fyj5'
    end
    object sptjjeSENDOUTSIDE: TCurrencyField
      FieldName = 'SENDOUTSIDE'
    end
    object sptjjesendinside: TCurrencyField
      FieldName = 'sendinside'
    end
    object sptjjesendprive: TCurrencyField
      FieldName = 'sendprive'
    end
    object sptjjeresivd: TCurrencyField
      FieldName = 'resivd'
    end
    object sptjjesacn: TCurrencyField
      FieldName = 'sacn'
    end
    object sptjjenationcall: TCurrencyField
      FieldName = 'nationcall'
    end
    object sptjjehgcall: TCurrencyField
      FieldName = 'hgcall'
    end
    object sptjjechinacall: TCurrencyField
      FieldName = 'chinacall'
    end
    object sptjjeintenet: TCurrencyField
      FieldName = 'intenet'
    end
    object sptjjeland: TCurrencyField
      FieldName = 'land'
    end
  end
  object Qwpsz: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from lastmonth')
    Left = 350
    Top = 107
    object Qwpszmc: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 20
      FieldName = 'mc'
    end
    object Qwpszdanja: TBCDField
      DisplayLabel = #29289#21697#21333#20215
      DisplayWidth = 20
      FieldName = 'danja'
      Precision = 19
    end
    object Qwpszbm: TStringField
      DisplayWidth = 10
      FieldName = 'bm'
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object qrycount: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from counter')
    Left = 32
    Top = 344
  end
  object qrylymx: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sold')
    Left = 350
    Top = 157
    object qrylymxid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qrylymxbm: TStringField
      FieldName = 'bm'
      FixedChar = True
      Size = 10
    end
    object qrylymxmc: TStringField
      FieldName = 'mc'
      FixedChar = True
      Size = 10
    end
    object qrylymxdanja: TBCDField
      FieldName = 'danja'
      Precision = 19
    end
    object qrylymxshuliang: TBCDField
      FieldName = 'shuliang'
      Precision = 18
      Size = 0
    end
    object qrylymxwubh: TStringField
      FieldName = 'wubh'
      FixedChar = True
      Size = 10
    end
    object qrylymxlx: TStringField
      FieldName = 'lx'
      FixedChar = True
      Size = 10
    end
    object qrylymxrq: TDateTimeField
      FieldName = 'rq'
    end
  end
  object spbqjc: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'bqjc;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@xstime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 250
    Top = 304
    object spbqjcbqdt: TIntegerField
      FieldName = 'bqdt'
    end
    object spbqjcbqmxp: TIntegerField
      FieldName = 'bqmxp'
    end
    object spbqjcbqyp5: TIntegerField
      FieldName = 'bqyp5'
      ReadOnly = True
    end
  end
  object spsqjc: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'sqjc;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@sqtime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 327
    Top = 353
    object spsqjcsqjcdt: TIntegerField
      FieldName = 'sqjcdt'
    end
    object spsqjcsqjcyp5: TIntegerField
      FieldName = 'sqjcyp5'
    end
    object spsqjcsqjcmxp: TIntegerField
      FieldName = 'sqjcmxp'
    end
  end
  object spbqly: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'bqly;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@time'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 287
    Top = 304
    object spbqlybqjcdt: TIntegerField
      FieldName = 'bqjcdt'
    end
    object spbqlybqjcyp5: TIntegerField
      FieldName = 'bqjcyp5'
    end
    object spbqlybqjcmxp: TIntegerField
      FieldName = 'bqjcmxp'
    end
  end
  object spxs: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'bqxs;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@MCRQ'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 249
    Top = 351
    object spxsbqxsdt: TIntegerField
      FieldName = 'bqxsdt'
    end
    object spxsbqxsyp5: TIntegerField
      FieldName = 'bqxsyp5'
    end
    object spxsbqxsmxp: TIntegerField
      FieldName = 'bqxsmxp'
    end
  end
  object spbqje: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'bqje;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@bqjerq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 286
    Top = 352
    object spbqjebqjedt: TBCDField
      FieldName = 'bqjedt'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object spbqjebqjeyp5: TBCDField
      FieldName = 'bqjeyp5'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object spbqjebqjcmxp: TBCDField
      FieldName = 'bqjcmxp'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
  end
  object qrybmyj: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from center')
    Left = 190
    Top = 209
  end
  object qryforpepole: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tableforpeople')
    Left = 247
    Top = 209
  end
  object spjsgzr: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'jskrgz;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@RQ'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 572
    Top = 212
  end
  object qrydatereport: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from datereport')
    Left = 243
    Top = 62
    object qrydatereportnamemx: TStringField
      DisplayLabel = #39033#30446
      DisplayWidth = 13
      FieldName = 'namemx'
    end
    object qrydatereportshuliang: TBCDField
      DisplayLabel = #25968#37327
      DisplayWidth = 16
      FieldName = 'shuliang'
      Precision = 18
      Size = 0
    end
    object qrydatereportje: TBCDField
      DisplayLabel = #37329#39069
      DisplayWidth = 15
      FieldName = 'je'
      Precision = 19
    end
    object qrydatereportrq: TDateTimeField
      DisplayLabel = #26085#26399
      DisplayWidth = 15
      FieldName = 'rq'
    end
    object qrydatereportlx: TStringField
      DisplayLabel = #31867#22411
      DisplayWidth = 13
      FieldName = 'lx'
    end
    object qrydatereportid: TAutoIncField
      DisplayWidth = 10
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object qrydatereportmc: TStringField
      DisplayWidth = 20
      FieldName = 'mc'
      Visible = False
    end
  end
  object sprbbmx: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'rbbmx;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@time'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 528
    Top = 212
  end
  object spbmrbbmx: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'bmrbbmx;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@time'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 475
    Top = 213
    object spbmrbbmxdzs: TIntegerField
      FieldName = 'dzs'
    end
    object spbmrbbmxdzj: TCurrencyField
      FieldName = 'dzj'
    end
    object spbmrbbmxfys1: TIntegerField
      FieldName = 'fys1'
    end
    object spbmrbbmxfyj1: TCurrencyField
      FieldName = 'fyj1'
    end
    object spbmrbbmxsws: TIntegerField
      FieldName = 'sws'
    end
    object spbmrbbmxswj: TCurrencyField
      FieldName = 'swj'
    end
    object spbmrbbmxdys: TIntegerField
      FieldName = 'dys'
    end
    object spbmrbbmxdyj: TCurrencyField
      FieldName = 'dyj'
    end
    object spbmrbbmxfys: TIntegerField
      FieldName = 'fys'
    end
    object spbmrbbmxfyj: TCurrencyField
      FieldName = 'fyj'
    end
    object spbmrbbmxsms: TCurrencyField
      FieldName = 'sms'
    end
    object spbmrbbmxsmj: TCurrencyField
      FieldName = 'smj'
    end
    object spbmrbbmxsns: TCurrencyField
      FieldName = 'sns'
    end
    object spbmrbbmxsnj: TCurrencyField
      FieldName = 'snj'
    end
    object spbmrbbmxgncs: TCurrencyField
      FieldName = 'gncs'
    end
    object spbmrbbmxgncj: TCurrencyField
      FieldName = 'gncj'
    end
    object spbmrbbmxints: TCurrencyField
      FieldName = 'ints'
    end
    object spbmrbbmxintj: TCurrencyField
      FieldName = 'intj'
    end
  end
  object qrybbdate: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from datereport')
    Left = 192
    Top = 61
    object qrybbdateid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qrybbdatemc: TStringField
      FieldName = 'mc'
    end
    object qrybbdateshuliang: TBCDField
      FieldName = 'shuliang'
      Precision = 18
      Size = 0
    end
    object qrybbdateje: TBCDField
      FieldName = 'je'
      Precision = 19
    end
    object qrybbdaterq: TDateTimeField
      FieldName = 'rq'
    end
    object qrybbdatelx: TStringField
      FieldName = 'lx'
    end
    object qrybbdatenamemx: TStringField
      FieldName = 'namemx'
    end
  end
  object qryczjl: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from czjl')
    Left = 408
    Top = 64
  end
  object sphjjeyj: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'hjjehz;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@xcrq'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 324
    Top = 307
    object sphjjeyjSQHJ: TIntegerField
      FieldName = 'SQHJ'
    end
    object sphjjeyjBQHJ: TIntegerField
      FieldName = 'BQHJ'
    end
    object sphjjeyjBQXS: TIntegerField
      FieldName = 'BQXS'
    end
    object sphjjeyjbqje: TIntegerField
      FieldName = 'bqje'
    end
    object sphjjeyjBQJC: TIntegerField
      FieldName = 'BQJC'
    end
  end
  object spjsbmgz: TADOStoredProc
    Connection = adocon1
    ProcedureName = 'jsbmgz;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@bmRQ'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 574
    Top = 316
  end
  object ADOQbm: TADOQuery
    Connection = adocon1
    Parameters = <>
    SQL.Strings = (
      'select * from datereport')
    Left = 410
    Top = 116
    object ADOQbmid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQbmmc: TStringField
      FieldName = 'mc'
    end
    object ADOQbmshuliang: TBCDField
      FieldName = 'shuliang'
      Precision = 18
      Size = 0
    end
    object ADOQbmje: TBCDField
      FieldName = 'je'
      Precision = 19
    end
    object ADOQbmrq: TDateTimeField
      FieldName = 'rq'
    end
    object ADOQbmlx: TStringField
      FieldName = 'lx'
    end
    object ADOQbmnamemx: TStringField
      FieldName = 'namemx'
    end
  end
  object Qbdanjia: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from danjia')
    Left = 302
    Top = 212
  end
  object Qjkiage: TADOQuery
    Connection = adocon1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from danjia ')
    Left = 355
    Top = 215
  end
end
