object DcmxForm: TDcmxForm
  Left = 499
  Top = 3
  Width = 300
  Height = 565
  BorderStyle = bsSizeToolWin
  Caption = #28857#33756
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 292
    Height = 156
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 39
      Width = 32
      Height = 16
      Caption = #32534#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 71
      Width = 32
      Height = 16
      Caption = #25968#37327
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 103
      Width = 32
      Height = 16
      Caption = #35268#26684
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 132
      Width = 32
      Height = 16
      Caption = #20215#26684
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 89
      Top = 99
      Width = 144
      Height = 16
      Caption = '(1-'#22823#65307' 2-'#20013#65307'3-'#23567#65307')'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCm: TEdit
      Left = 129
      Top = 33
      Width = 160
      Height = 24
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnExit = edtCmExit
    end
    object edtCdbh: TEdit
      Left = 40
      Top = 33
      Width = 89
      Height = 24
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      OnDblClick = edtCdbhDblClick
      OnExit = edtCdbhExit
    end
    object edtSl: TEdit
      Left = 40
      Top = 63
      Width = 32
      Height = 24
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ImeMode = imClose
      ParentFont = False
      TabOrder = 2
      Text = '1'
      OnExit = edtSlExit
      OnKeyPress = edtSlKeyPress
    end
    object edtGg: TEdit
      Left = 40
      Top = 95
      Width = 32
      Height = 24
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '1'
      OnExit = edtGgExit
      OnKeyPress = edtGgKeyPress
    end
    object edtJg: TEdit
      Left = 40
      Top = 126
      Width = 89
      Height = 24
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = '0'
      OnExit = edtJgExit
      OnKeyPress = edtSlKeyPress
    end
    object btnClose: TBitBtn
      Left = 212
      Top = 126
      Width = 75
      Height = 25
      Cancel = True
      Caption = #36820#22238
      ModalResult = 2
      TabOrder = 6
      OnClick = btnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnOK: TBitBtn
      Left = 132
      Top = 126
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 5
      OnClick = btnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object CheckBox1: TCheckBox
      Left = 152
      Top = 5
      Width = 137
      Height = 17
      Caption = #25152#26377#39184#21488#28857#21516#26679#30340#33756
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 156
    Width = 292
    Height = 382
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 133
      Top = 5
      Width = 4
      Height = 372
      Cursor = crHSplit
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 128
      Height = 372
      Align = alLeft
      Ctl3D = False
      DataSource = dsCddm
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'D_CDBH'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CDMC'
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 137
      Top = 5
      Width = 150
      Height = 372
      Align = alClient
      Ctl3D = False
      DataSource = dsCddmmj
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid2DblClick
      OnMouseUp = DBGrid2MouseUp
      Columns = <
        item
          Expanded = False
          FieldName = 'D_CDBH'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CDMC'
          Visible = True
        end>
    end
  end
  object dsCddm: TDataSource
    DataSet = tblCddm
    Left = 48
    Top = 208
  end
  object tblCddm: TTable
    DatabaseName = 'LfHotelUser'
    Filter = 'D_MJ='#39'F'#39
    Filtered = True
    TableName = 'CDDM'
    Left = 16
    Top = 208
  end
  object dsCddmmj: TDataSource
    DataSet = tblCddmmj
    Left = 136
    Top = 208
  end
  object tblCddmmj: TTable
    DatabaseName = 'LfHotelUser'
    Filter = 'D_MJ='#39'T'#39
    Filtered = True
    TableName = 'CDDM'
    Left = 168
    Top = 208
  end
  object DosMove1: TDosMove
    Active = True
    Left = 136
    Top = 120
  end
end
