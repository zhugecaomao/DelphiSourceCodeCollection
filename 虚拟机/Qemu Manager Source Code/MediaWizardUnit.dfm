object MediaStoreWiz: TMediaStoreWiz
  Left = 180
  Top = 227
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Import Media Wizard'
  ClientHeight = 443
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 144
  TextHeight = 20
  object NB: TNotebook
    Left = 0
    Top = 0
    Width = 846
    Height = 443
    Align = alClient
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'P1'
      object Bevel7: TTntBevel
        Left = 0
        Top = 75
        Width = 846
        Height = 2
        Align = alTop
      end
      object Bevel1: TTntBevel
        Left = 12
        Top = 378
        Width = 826
        Height = 4
      end
      object P1Back: TTntButton
        Left = 468
        Top = 392
        Width = 115
        Height = 39
        Caption = '< Back'
        Enabled = False
        TabOrder = 0
      end
      object P1Next: TTntButton
        Left = 591
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Next >'
        Enabled = False
        TabOrder = 1
        OnClick = P1NextClick
      end
      object P1Cancel: TTntButton
        Left = 717
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = P1CancelClick
      end
      object Panel1: TTntPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 75
        Align = alTop
        Color = clWhite
        TabOrder = 3
        object Label2: TTntLabel
          Left = 12
          Top = 25
          Width = 378
          Height = 20
          Caption = 'Please specify the type of media you wish to import.'
        end
      end
      object GroupBox2: TTntGroupBox
        Left = 74
        Top = 111
        Width = 629
        Height = 198
        Caption = 'Image Type'
        TabOrder = 4
        object CDImg: TTntCheckBox
          Left = 25
          Top = 49
          Width = 297
          Height = 26
          Caption = 'CD-ROM/DVD Image'
          TabOrder = 0
          OnClick = CDImgClick
        end
        object FlopImg: TTntCheckBox
          Left = 25
          Top = 111
          Width = 297
          Height = 26
          Caption = 'Floppy Disk Image'
          TabOrder = 1
          OnClick = FlopImgClick
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'P2'
      object Bevel2: TTntBevel
        Left = 0
        Top = 75
        Width = 846
        Height = 2
        Align = alTop
      end
      object Bevel3: TTntBevel
        Left = 12
        Top = 378
        Width = 826
        Height = 4
      end
      object Panel2: TTntPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 75
        Align = alTop
        Color = clWhite
        TabOrder = 0
        object Label4: TTntLabel
          Left = 12
          Top = 25
          Width = 460
          Height = 20
          Caption = 'Please specify the type of floppy disk media you wish to import.'
        end
      end
      object P2Back: TTntButton
        Left = 468
        Top = 392
        Width = 115
        Height = 39
        Caption = '< Back'
        TabOrder = 1
        OnClick = P2BackClick
      end
      object P2Next: TTntButton
        Left = 591
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Next >'
        Enabled = False
        TabOrder = 2
        OnClick = P2NextClick
      end
      object P2Cancel: TTntButton
        Left = 717
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = P1CancelClick
      end
      object AddHow: TTntRadioGroup
        Left = 86
        Top = 123
        Width = 617
        Height = 174
        Caption = 'Add How:'
        Items.Strings = (
          'Import From File'
          'Create From CD-ROM/DVD Disk')
        TabOrder = 4
        OnClick = AddHowClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'MI'
      object Bevel4: TTntBevel
        Left = 0
        Top = 75
        Width = 846
        Height = 2
        Align = alTop
      end
      object Bevel5: TTntBevel
        Left = 12
        Top = 378
        Width = 826
        Height = 4
      end
      object Panel3: TTntPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 75
        Align = alTop
        Color = clWhite
        TabOrder = 0
        object Label6: TTntLabel
          Left = 12
          Top = 25
          Width = 446
          Height = 20
          Caption = 'The wizard will now assist you on creating your media image.'
        end
      end
      object MIBack: TTntButton
        Left = 468
        Top = 392
        Width = 115
        Height = 39
        Caption = '< Back'
        TabOrder = 1
        OnClick = MIBackClick
      end
      object MINext: TTntButton
        Left = 591
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Next >'
        Enabled = False
        TabOrder = 2
        OnClick = MINextClick
      end
      object MICancel: TTntButton
        Left = 717
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = P1CancelClick
      end
      object GroupBox1: TTntGroupBox
        Left = 12
        Top = 86
        Width = 802
        Height = 186
        Caption = 'Image To Create'
        TabOrder = 4
        object Label7: TTntLabel
          Left = 12
          Top = 37
          Width = 153
          Height = 20
          Caption = 'Select Source Drive:'
        end
        object DestLbl: TTntLabel
          Left = 12
          Top = 157
          Width = 108
          Height = 20
          Caption = 'None Selected'
        end
        object Source: TTntComboBox
          Left = 12
          Top = 62
          Width = 371
          Height = 21
          ItemHeight = 0
          TabOrder = 0
          OnChange = SourceChange
        end
        object Button1: TTntButton
          Left = 12
          Top = 111
          Width = 223
          Height = 38
          Caption = 'Select Destination'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'MI2'
      object Bevel6: TTntBevel
        Left = 0
        Top = 75
        Width = 846
        Height = 2
        Align = alTop
      end
      object Bevel8: TTntBevel
        Left = 12
        Top = 378
        Width = 826
        Height = 4
      end
      object Label10: TTntLabel
        Left = 12
        Top = 98
        Width = 127
        Height = 20
        Caption = 'Image To Create:'
      end
      object FileToCreate: TTntLabel
        Left = 148
        Top = 98
        Width = 39
        Height = 20
        Caption = 'None'
      end
      object Done: TTntLabel
        Left = 295
        Top = 246
        Width = 212
        Height = 20
        Caption = 'Image Created Successfully!'
        Visible = False
      end
      object Panel4: TTntPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 75
        Align = alTop
        Color = clWhite
        TabOrder = 0
        object Label9: TTntLabel
          Left = 12
          Top = 25
          Width = 755
          Height = 20
          Caption = 
            'Please wait while the media image is created.  Depending on the ' +
            'size of the media this can take a while.'
        end
      end
      object MI2Back: TTntButton
        Left = 468
        Top = 392
        Width = 115
        Height = 39
        Caption = '< Back'
        Enabled = False
        TabOrder = 1
        OnClick = MI2BackClick
      end
      object MI2Next: TTntButton
        Left = 591
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Next >'
        Enabled = False
        TabOrder = 2
        OnClick = MI2NextClick
      end
      object MI2Cancel: TTntButton
        Left = 717
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Cancel'
        Enabled = False
        TabOrder = 3
        OnClick = P1CancelClick
      end
      object PB: TProgressBar
        Left = 12
        Top = 148
        Width = 814
        Height = 26
        TabOrder = 4
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Finish'
      object Bevel9: TTntBevel
        Left = 0
        Top = 75
        Width = 846
        Height = 2
        Align = alTop
      end
      object Bevel10: TTntBevel
        Left = 12
        Top = 378
        Width = 826
        Height = 4
      end
      object Label11: TTntLabel
        Left = 271
        Top = 178
        Width = 287
        Height = 20
        Caption = 'Your media was imported successfully.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TTntLabel
        Left = 12
        Top = 12
        Width = 214
        Height = 20
        Caption = 'Save Item to Media Store.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FinishBtn: TTntButton
        Left = 717
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Finish'
        TabOrder = 0
        OnClick = FinishBtnClick
      end
      object Panel5: TTntPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 75
        Align = alTop
        Color = clWhite
        TabOrder = 1
        object Label17: TTntLabel
          Left = 12
          Top = 25
          Width = 208
          Height = 20
          Caption = 'The wizard is now complete.'
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Blank'
      object Bevel11: TTntBevel
        Left = 0
        Top = 75
        Width = 846
        Height = 2
        Align = alTop
      end
      object Bevel12: TTntBevel
        Left = 12
        Top = 378
        Width = 826
        Height = 4
      end
      object Panel6: TTntPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 75
        Align = alTop
        Color = clWhite
        TabOrder = 0
        object Label15: TTntLabel
          Left = 12
          Top = 25
          Width = 366
          Height = 20
          Caption = 'Please specify how many disks are in the disk set.'
        end
      end
      object BLBack: TTntButton
        Left = 468
        Top = 392
        Width = 115
        Height = 39
        Caption = '< Back'
        TabOrder = 1
        OnClick = BLBackClick
      end
      object BlNext: TTntButton
        Left = 591
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Next >'
        TabOrder = 2
      end
      object BlCancel: TTntButton
        Left = 717
        Top = 392
        Width = 115
        Height = 39
        Caption = 'Cancel'
        TabOrder = 3
      end
      object GroupBox3: TTntGroupBox
        Left = 62
        Top = 123
        Width = 629
        Height = 162
        Caption = 'Total Disks'
        TabOrder = 4
        object Label16: TTntLabel
          Left = 12
          Top = 32
          Width = 89
          Height = 20
          Caption = 'Total Disks:'
        end
        object disks: TSpinEdit
          Left = 18
          Top = 62
          Width = 187
          Height = 22
          Increment = 50
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
      end
    end
  end
  object OpenDlg: TTntOpenDialog
    Filter = 'Disk Images|*.img;*.iso;*.ima|All Files|*.*'
    Title = 'Import Image File'
    Left = 306
    Top = 162
  end
  object SaveDlg: TTntSaveDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton]
    Title = 'Save Image As'
    Left = 344
    Top = 160
  end
end
