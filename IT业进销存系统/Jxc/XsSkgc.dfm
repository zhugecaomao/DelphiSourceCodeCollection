inherited frmXsSkgc: TfrmXsSkgc
  Caption = #38144#21806#21333#25910#27454#36807#31243
  ClientWidth = 464
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 464
    inherited Label1: TLabel
      Width = 452
    end
    object Label14: TLabel [1]
      Left = 8
      Top = 404
      Width = 38
      Height = 15
      Caption = #22791#27880':'
    end
    inherited DBGrid1: TDBGrid
      Top = 85
      Width = 452
      Height = 240
      DataSource = Data.sXsSkgc
      Columns = <
        item
          Expanded = False
          FieldName = 'DJBH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RQ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BCJE'
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 325
      Width = 452
      Height = 72
      inherited Label3: TLabel
        Top = 27
      end
      inherited Shape2: TShape
        Height = 107
      end
      object DBText1: TDBText
        Left = 347
        Top = 5
        Width = 90
        Height = 18
        Alignment = taRightJustify
        DataField = 'JE'
        DataSource = Data.sXskdzb
      end
      object Label6: TLabel
        Left = 264
        Top = 7
        Width = 83
        Height = 15
        Caption = #38144#21806#21333#37329#39069':'
      end
      object Label7: TLabel
        Left = 279
        Top = 28
        Width = 68
        Height = 15
        Caption = #24050#25910#37329#39069':'
      end
      object Label8: TLabel
        Left = 279
        Top = 49
        Width = 68
        Height = 15
        Caption = #26410#25910#37329#39069':'
      end
      object labJEA: TLabel
        Tag = 1
        Left = 347
        Top = 26
        Width = 90
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJEA'
      end
      object labJEB: TLabel
        Tag = 1
        Left = 347
        Top = 47
        Width = 90
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labJEB'
      end
    end
    inherited Panel3: TPanel
      Width = 452
      Height = 56
      inherited Label2: TLabel
        Left = 144
        Caption = #38144#21806#21333#21495':'
      end
      object Label4: TLabel [1]
        Left = 0
        Top = 8
        Width = 38
        Height = 15
        Caption = #26085#26399':'
      end
      object Label5: TLabel [2]
        Left = 0
        Top = 32
        Width = 38
        Height = 15
        Caption = #23458#25143':'
      end
      inherited DBEdit1: TDBEdit
        Left = 218
        Width = 102
        DataSource = Data.sXskdzb
      end
      object DBEdit2: TDBEdit
        Left = 42
        Top = 6
        Width = 86
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'RQ'
        DataSource = Data.sXskdzb
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 132
        Top = 30
        Width = 188
        Height = 18
        AutoSelect = False
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHMC'
        DataSource = Data.sXskdzb
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 42
        Top = 30
        Width = 86
        Height = 18
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'aKHBH'
        DataSource = Data.sXskdzb
        TabOrder = 3
      end
    end
    object DBEdit12: TDBEdit
      Left = 51
      Top = 403
      Width = 320
      Height = 18
      BorderStyle = bsNone
      Color = cl3DLight
      DataField = 'BZ'
      DataSource = Data.sXskdzb
      TabOrder = 3
    end
    object pnlZt: TPanel
      Left = 340
      Top = 31
      Width = 115
      Height = 49
      BevelOuter = bvNone
      Caption = 'pnlZt'
      ParentColor = True
      TabOrder = 4
      Visible = False
      DesignSize = (
        115
        49)
      object spZt: TShape
        Left = 0
        Top = 0
        Width = 115
        Height = 49
        Align = alClient
        Brush.Color = 15793919
        Pen.Color = clGreen
        Pen.Width = 3
        Shape = stEllipse
      end
      object labZt: TLabel
        Left = 6
        Top = 6
        Width = 103
        Height = 37
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = #25910#27454#23436#27605
        Font.Charset = GB2312_CHARSET
        Font.Color = clGreen
        Font.Height = -24
        Font.Name = #38582#20070
        Font.Style = []
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 464
    inherited ToolBar2: TToolBar
      Left = 377
      Width = 70
      inherited DBNavigator1: TDBNavigator
        DataSource = Data.sXskdzb
      end
    end
    inherited ToolBar3: TToolBar
      Left = 460
      Width = 0
    end
  end
end
