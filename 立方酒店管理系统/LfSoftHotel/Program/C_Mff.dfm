inherited MffForm: TMffForm
  Caption = 'MffForm'
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Width = 156
      Caption = #20813#36153#25151#30331#35760
    end
  end
  inherited Panel2: TPanel
    object Edit1: TEdit
      Left = 48
      Top = 24
      Width = 121
      Height = 20
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 184
      Top = 24
      Width = 121
      Height = 20
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 320
      Top = 24
      Width = 121
      Height = 20
      TabOrder = 2
      Text = 'Edit3'
    end
  end
end
