object paycalculate: Tpaycalculate
  Left = 254
  Top = 179
  BorderStyle = bsDialog
  Caption = #35745#31639
  ClientHeight = 111
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 321
    Height = 65
    Caption = #36755#20837#36215#27490#26085#26399
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 12
      Height = 12
      Caption = #20174
    end
    object Label2: TLabel
      Left = 168
      Top = 32
      Width = 12
      Height = 12
      Caption = #21040
    end
    object DateTimePicker1: TDateTimePicker
      Left = 32
      Top = 28
      Width = 121
      Height = 20
      Date = 37751.908942534720000000
      Time = 37751.908942534720000000
      DateFormat = dfLong
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 184
      Top = 28
      Width = 121
      Height = 20
      Date = 37751.908942534720000000
      Time = 37751.908942534720000000
      DateFormat = dfLong
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 168
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 248
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\HH\MyExe\RedHr\e' +
      'xe\hrdataa.mdb;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from r_staffinfo')
    Left = 56
    Top = 64
    object ADOQuery1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object ADOQuery1name: TWideStringField
      FieldName = 'name'
      Size = 50
    end
    object ADOQuery1ename: TWideStringField
      FieldName = 'ename'
      Size = 50
    end
    object ADOQuery1staffid: TWideStringField
      FieldName = 'staffid'
      Size = 50
    end
    object ADOQuery1sex: TWideStringField
      FieldName = 'sex'
      Size = 50
    end
    object ADOQuery1idnum: TWideStringField
      FieldName = 'idnum'
      Size = 50
    end
    object ADOQuery1classcodeID: TIntegerField
      FieldName = 'classcodeID'
    end
    object ADOQuery1intime: TDateTimeField
      FieldName = 'intime'
    end
    object ADOQuery1birthday: TDateTimeField
      FieldName = 'birthday'
    end
    object ADOQuery1ifmarriage: TWideStringField
      FieldName = 'ifmarriage'
      Size = 50
    end
    object ADOQuery1Nationality: TWideStringField
      FieldName = 'Nationality'
      Size = 50
    end
    object ADOQuery1Nativeplace: TWideStringField
      FieldName = 'Nativeplace'
      Size = 50
    end
    object ADOQuery1Residence: TWideStringField
      FieldName = 'Residence'
      Size = 100
    end
    object ADOQuery1exigenceman: TWideStringField
      FieldName = 'exigenceman'
      Size = 50
    end
    object ADOQuery1exigencephone: TWideStringField
      FieldName = 'exigencephone'
      Size = 50
    end
    object ADOQuery1knowledge: TWideStringField
      FieldName = 'knowledge'
      Size = 50
    end
    object ADOQuery1School: TWideStringField
      FieldName = 'School'
      Size = 50
    end
    object ADOQuery1forlang: TWideStringField
      FieldName = 'forlang'
      Size = 50
    end
    object ADOQuery1howforlang: TWideStringField
      FieldName = 'howforlang'
      Size = 50
    end
    object ADOQuery1Address: TWideStringField
      FieldName = 'Address'
      Size = 200
    end
    object ADOQuery1Telephone: TWideStringField
      FieldName = 'Telephone'
      Size = 50
    end
    object ADOQuery1Email: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object ADOQuery1imemo: TWideStringField
      FieldName = 'imemo'
      Size = 50
    end
    object ADOQuery1delrecy: TWideStringField
      FieldName = 'delrecy'
      Size = 50
    end
    object ADOQuery1branchid: TIntegerField
      FieldName = 'branchid'
    end
  end
end
