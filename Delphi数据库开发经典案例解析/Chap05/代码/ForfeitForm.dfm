inherited ForFeit: TForFeit
  Left = 237
  Top = 228
  Height = 472
  Caption = #22270#20070#32602#27454
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar [0]
    Visible = False
  end
  inherited DBGrid1: TDBGrid [1]
    Top = 56
    Height = 257
    Columns = <
      item
        Expanded = False
        FieldName = #32602#27454#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35835#32773#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22270#20070#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20070#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32602#27454#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24212#32602#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23454#25910#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#20132#27454
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22791#27880
        Visible = True
      end>
  end
  inherited Panel2: TPanel [2]
    Top = 320
    Height = 122
    Enabled = True
    object Label6: TLabel
      Left = 273
      Top = 39
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #23454#25910#37329#39069
      Transparent = True
    end
    object BitBtn2: TBitBtn
      Left = 80
      Top = 40
      Width = 145
      Height = 41
      Caption = #25910#22238#32602#27454
      TabOrder = 0
      OnClick = BitBtn2Click
      Kind = bkIgnore
    end
    object Edit4: TEdit
      Left = 272
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = Edit4KeyPress
    end
  end
  inherited Panel1: TPanel [3]
    Top = 0
    inherited Label3: TLabel
      Caption = #35835#32773#32534#21495
    end
    inherited Label4: TLabel
      Caption = #22270#20070#32534#21495
    end
    inherited Label5: TLabel
      Caption = #35835#32773#22995#21517
    end
  end
  object ADOQuery2: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.'#22995#21517',c.'#20070#21517' from '#22270#20070#32602#27454' a,'#35835#32773#20449#24687' b,'#22270#20070#20449#24687' c'
      'where (a.'#35835#32773#32534#21495'=b.'#32534#21495')and(a.'#26159#21542#20132#27454'=0)and(a.'#22270#20070#32534#21495'=c.'#32534#21495')')
    Left = 560
    Top = 8
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    Parameters = <>
    Left = 656
    Top = 8
  end
end
