object Form1: TForm1
  Left = 319
  Top = 140
  Width = 212
  Height = 288
  Caption = 'Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    204
    245)
  PixelsPerInch = 96
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 10
    Top = 79
    Width = 234
    Height = 231
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 128
    Top = 39
    Width = 100
    Height = 31
    Action = Action2
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 10
    Top = 49
    Width = 100
    Height = 21
    Action = Action1
    TabOrder = 2
  end
  object DCOMConnection1: TDCOMConnection
    ServerGUID = '{A1695C1C-F724-11D1-AABE-00C04FA35CFA}'
    ServerName = 'Server.BriefCaseDemo'
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = '.\country.cds'
    Params = <>
    ProviderName = 'DataSetProvider1'
    RemoteServer = DCOMConnection1
    OnReconcileError = ClientDataSet1ReconcileError
    Left = 32
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 64
  end
  object ActionList1: TActionList
    Left = 96
    object Action1: TAction
      Caption = 'Connected'
      OnExecute = Action1Execute
      OnUpdate = Action1Update
    end
    object Action2: TAction
      Caption = '&Apply Updates'
      OnExecute = Action2Execute
      OnUpdate = Action2Update
    end
  end
end
