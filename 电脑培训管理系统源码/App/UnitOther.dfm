inherited frmOther: TfrmOther
  Left = 227
  Top = 171
  Caption = 'frmOther'
  ClientHeight = 272
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Height = 272
    inherited Panel_button: TPanel
      Top = 218
      inherited OKBtn: TDsFancyButton
        OnClick = OKBtnClick
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 405
      Height = 218
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #22522#26412#21442#25968
        object Label1: TLabel
          Left = 8
          Top = 21
          Width = 104
          Height = 13
          Caption = #24744#21916#27426#30340#36755#20837#27861#65306
        end
        object Bevel1: TBevel
          Left = 6
          Top = 47
          Width = 385
          Height = 2
        end
        object Label2: TLabel
          Left = 8
          Top = 61
          Width = 65
          Height = 13
          Caption = #20844#21496#21517#31216#65306
        end
        object Label3: TLabel
          Left = 8
          Top = 85
          Width = 65
          Height = 13
          Caption = #20844#21496#30005#35805#65306
        end
        object Label4: TLabel
          Left = 8
          Top = 109
          Width = 65
          Height = 13
          Caption = #20844#21496#22320#22336#65306
        end
        object ComboBox1: TComboBox
          Left = 112
          Top = 16
          Width = 265
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
        object Edit1: TEdit
          Left = 72
          Top = 56
          Width = 305
          Height = 21
          TabOrder = 1
          Text = 'Edit1'
        end
        object Edit2: TEdit
          Left = 72
          Top = 80
          Width = 305
          Height = 21
          TabOrder = 2
          Text = 'Edit2'
        end
        object Edit3: TEdit
          Left = 72
          Top = 104
          Width = 305
          Height = 21
          TabOrder = 3
          Text = 'Edit3'
        end
      end
      object TabSheet2: TTabSheet
        Caption = #26381#21153#26465#27454
        ImageIndex = 1
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 397
          Height = 190
          Align = alClient
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          Lines.Strings = (
            'Memo1')
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
  end
end
