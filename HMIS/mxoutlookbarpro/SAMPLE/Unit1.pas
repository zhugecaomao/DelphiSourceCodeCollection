Unit Unit1;

Interface

Uses
  Windows, Dialogs, ImgList, Forms, Controls, ComCtrls, ExtCtrls, StdCtrls, mxOutlookBarPro,
  Graphics, Classes, ActiveX, SysUtils, Menus, ShlObj;

Type
  TMainWindow = Class( TForm )
    mxOutlookBarPro: TmxOutlookBarPro;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Splitter: TSplitter;
    Panel1: TPanel;
    PageControl: TPageControl;
    tab_Views: TTabSheet;
    RadioGroup: TRadioGroup;
    GroupBox: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    TabSheet3: TTabSheet;
    RadioGroup2: TRadioGroup;
    GroupBox2: TGroupBox;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Bevel3: TBevel;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Button2: TButton;
    ListBox: TListBox;
    Edit2: TEdit;
    Button3: TButton;
    Button1: TButton;
    Edit1: TEdit;
    Label10: TLabel;
    StatusBar: TStatusBar;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    GroupBox4: TGroupBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Button4: TButton;
    ColorDialog: TColorDialog;
    Button5: TButton;
    GroupBox5: TGroupBox;
    CheckBox4: TCheckBox;
    Button6: TButton;
    Button7: TButton;
    mxLinkLabel1: TLabel;
    mxLinkLabel2: TLabel;
    Label7: TLabel;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    GroupBox7: TGroupBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    Button8: TButton;
    Button9: TButton;
    GroupBox8: TGroupBox;
    CheckBox9: TCheckBox;
    TabSheet5: TTabSheet;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Button11: TButton;
    Button10: TButton;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    OutlookBarPopup1: TMenuItem;
    HeaderPopup1: TMenuItem;
    ButtonPopup1: TMenuItem;
    PopupMenu4: TPopupMenu;
    EditorPopup1: TMenuItem;
    Procedure RadioGroupClick( Sender: TObject );
    Procedure FormShow( Sender: TObject );
    Procedure mxOutlookBarProAfterChangeStyle( Sender: TObject; NewStyle: TmxPreSet );
    Procedure CheckBox1Click( Sender: TObject );
    Procedure CheckBox2Click( Sender: TObject );
    Procedure RadioGroup2Click( Sender: TObject );
    Procedure CheckBox3Click( Sender: TObject );
    Procedure mxOutlookBarProClose( Sender: TObject );
    Procedure FormCreate( Sender: TObject );
    Procedure PageControlChange( Sender: TObject );
    Procedure Edit1Change( Sender: TObject );
    Procedure Button1Click( Sender: TObject );
    Procedure ListBoxClick( Sender: TObject );
    Procedure Button2Click( Sender: TObject );
    Procedure Edit2Change( Sender: TObject );
    Procedure Button3Click( Sender: TObject );
    Procedure ListBox1Click( Sender: TObject );
    Procedure TrackBar1Change( Sender: TObject );
    Procedure Button5Click( Sender: TObject );
    Procedure Button4Click( Sender: TObject );
    Procedure TrackBar2Change( Sender: TObject );
    Procedure CheckBox4Click( Sender: TObject );
    Procedure Button6Click( Sender: TObject );
    Procedure Button7Click( Sender: TObject );
    Procedure mxOutlookBarProHeaders0Buttons0Click( Sender: TObject );
    Procedure mxOutlookBarProDragDrop( Sender: TmxOutlookBarPro;
      Source: TObject; DataObject: IDataObject;
      Const Formats: Array Of Word; Shift: TShiftState; Pt: TPoint;
      Var Effect: Integer; Mode: TmxDropMode );
    Procedure CheckBox5Click( Sender: TObject );
    Procedure CheckBox6Click( Sender: TObject );
    Procedure CheckBox7Click( Sender: TObject );
    Procedure CheckBox8Click( Sender: TObject );
    Procedure Button9Click( Sender: TObject );
    Procedure Button8Click( Sender: TObject );
    Procedure CheckBox9Click( Sender: TObject );
    Procedure RadioGroup3Click( Sender: TObject );
    Procedure RadioGroup4Click( Sender: TObject );
    Procedure Button10Click( Sender: TObject );
    Procedure Button11Click( Sender: TObject );
    Procedure mxOutlookBarProContextPopup( Sender: TObject;
      MousePos: TPoint; Var Handled: Boolean );
    Procedure mxOutlookBarProDragAllowed( Sender: TmxOutlookBarPro;
      Button: TmxButton; Var Allowed: Boolean );
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  MainWindow: TMainWindow;

Implementation

{$R *.DFM}

Const
  HDropFormatEtc: TFormatEtc = ( cfFormat: CF_HDROP; ptd: Nil; dwAspect: DVASPECT_CONTENT; lindex: - 1; tymed: TYMED_HGLOBAL );

Procedure TMainWindow.RadioGroupClick( Sender: TObject );
Begin
  mxOutlookBarPro.PreSet := TmxPreSet( RadioGroup.ItemIndex );
  RadioGroup2.Enabled := RadioGroup.ItemIndex > 7;
  CheckBox4.Checked := mxOutlookBarPro.Settings.CaptionStyle = csCustomDraw;
End;

Procedure TMainWindow.FormShow( Sender: TObject );
Begin
  RadioGroup.ItemIndex := 0;
End;

Procedure TMainWindow.mxOutlookBarProAfterChangeStyle( Sender: TObject; NewStyle: TmxPreSet );
Var
  I: Integer;
Begin
  With mxOutlookBarPro Do
  Begin
    Settings.LargeWidth := 65;

    If PreSet = psExplorerBarXP Then
      Settings.LargeHeight := 68 Else
      Settings.LargeHeight := 65;

    Settings.SmallHeight := 30;

    mxOutlookBarPro.Headers[ 6 ].Buttons[ 0 ].Options := mxOutlookBarPro.Headers[ 6 ].Buttons[ 0 ].Options + [ boCustomStyle ];

    For I := 0 To HeaderCount - 3 Do
    Begin
      If I > 0 Then
        Headers[ I ].Glyph.Assign( Headers[ 0 ].Glyph );
      Headers[ I ].Glyph.Visible := PreSet = psExplorerBar2000;
    End;
  End;
End;

Procedure TMainWindow.CheckBox1Click( Sender: TObject );
Var
  I: Integer;
Begin
  For I := 0 To mxOutlookBarPro.HeaderCount - 1 Do
    mxOutlookBarPro.HeaderByIndex( I ).AllowSelected := CheckBox1.Checked;
End;

Procedure TMainWindow.CheckBox2Click( Sender: TObject );
Begin
  mxOutlookBarPro.EachHeaderSelection := CheckBox2.Checked;
End;

Procedure TMainWindow.RadioGroup2Click( Sender: TObject );
Begin
  mxOutlookBarPro.ExplorerMethod := TmxExplorerMethod( RadioGroup2.ItemIndex );
End;

Procedure TMainWindow.CheckBox3Click( Sender: TObject );
Begin
  mxOutlookBarPro.CloseButton.Visible := CheckBox3.Checked;
End;

Procedure TMainWindow.mxOutlookBarProClose( Sender: TObject );
Begin
  MessageDlg( 'You have pressed the close button', mtWarning, [ mbOK ], 0 );
End;

Procedure TMainWindow.FormCreate( Sender: TObject );
Begin
  PageControl.ActivePageIndex := 0;
  mxOutlookBarPro.ActiveHeader := mxOutlookBarPro.Headers[ 0 ];
  Caption := Format( 'TmxOutlookBarPro %s Demo', [ mxOutlookBarPro.Version ] );
  PageControlChange( Self );
End;

Procedure TMainWindow.PageControlChange( Sender: TObject );
Var
  I: Integer;
Begin
  If PageControl.ActivePageIndex = 0 Then
  Begin
    RadioGroup.ItemIndex := Integer( mxOutlookBarPro.PreSet );
    CheckBox1.Checked := mxOutlookBarPro.Headers[ 0 ].AllowSelected;
    CheckBox1.Checked := mxOutlookBarPro.EachHeaderSelection;
    RadioGroup2.ItemIndex := Integer( mxOutlookBarPro.ExplorerMethod );
    CheckBox3.Checked := mxOutlookBarPro.CloseButton.Visible;
    CheckBox9.Checked := mxOutlookBarPro.Background.Grayscale;
  End;

  If PageControl.ActivePageIndex = 1 Then
  Begin
    ListBox.Items.Clear;

    For I := 0 To mxOutlookBarPro.HeaderCount - 1 Do
    Begin
      ListBox.Items.Add( mxOutlookBarPro.Headers[ I ].Name );
    End;

    Edit1Change( Self );
    Edit2Change( Self );
    ListBoxClick( Self );
  End;

  If PageControl.ActivePageIndex = 2 Then
  Begin
    ListBox1.Items.Clear;

    For I := 0 To mxOutlookBarPro.HeaderCount - 1 Do
    Begin
      ListBox1.Items.Add( mxOutlookBarPro.Headers[ I ].Name );
    End;

    mxOutlookBarPro.Background.Style := btTileBitmap;
    For I := 0 To mxOutlookBarPro.HeaderCount - 1 Do
    Begin
      mxOutlookBarPro.Headers[ I ].Background.AlphaBlend := 255;
      mxOutlookBarPro.Headers[ I ].Background.Style := btTransparent;
      mxOutlookBarPro.Headers[ I ].Background.Color := clNavy;
    End;

    ListBox1Click( Self );
  End;

  If PageControl.ActivePageIndex = 3 Then
  Begin
    CheckBox5.Checked := ( mxOutlookBarPro.DragMode = dmAutomatic ) And ( boAcceptOLEDrop In mxOutlookBarPro.Options );
    CheckBox6.Checked := boAcceptOLEDrop In mxOutlookBarPro.Options;
    CheckBox7.Checked := boAutoChangeHeader In mxOutlookBarPro.Options;
    CheckBox8.Checked := boAutoScroll In mxOutlookBarPro.Options;
  End;

  If PageControl.ActivePageIndex = 4 Then
  Begin
    RadioGroup.ItemIndex := 9;
    mxOutlookBarPro.Background.Color := clYellow;
    mxOutlookBarPro.Background.Gradient.BeginColor := clYellow;
    mxOutlookBarPro.Background.Gradient.EndColor := clRed;
    mxOutlookBarPro.Background.Style := btGradient;
    RadioGroup3.ItemIndex := Integer( mxOutlookBarPro.Background.Gradient.Direction );
    RadioGroup4.ItemIndex := Integer( mxOutlookBarPro.Background.Gradient.DrawStyle );
  End;
End;

Procedure TMainWindow.Edit1Change( Sender: TObject );
Begin
  Button1.Enabled := Edit1.Text <> '';
End;

Procedure TMainWindow.Button1Click( Sender: TObject );
Var
  _Header: TmxHeader;
Begin
  _Header := mxOutlookBarPro.AddHeader;
  _Header.Caption := Edit1.Text;
  ListBox.Items.Add( _Header.Name );
End;

Procedure TMainWindow.ListBoxClick( Sender: TObject );
Begin
  Button2.Enabled := ListBox.ItemIndex <> -1;
  Button7.Enabled := ListBox.ItemIndex <> -1;
  Edit2Change( Self );
End;

Procedure TMainWindow.Button2Click( Sender: TObject );
Begin
  mxOutlookBarPro.DeleteHeader( ListBox.ItemIndex );
  ListBox.Items.Delete( ListBox.ItemIndex );
End;

Procedure TMainWindow.Edit2Change( Sender: TObject );
Begin
  Button3.Enabled := ( ListBox.ItemIndex <> -1 ) And ( Edit2.Text <> '' );
End;

Procedure TMainWindow.Button3Click( Sender: TObject );
Var
  Button: TmxButton;
Begin
  Button := mxOutlookBarPro.HeaderByIndex( ListBox.ItemIndex ).AddButton;
  Button.Caption := Edit2.Text;
End;

Procedure TMainWindow.ListBox1Click( Sender: TObject );
Begin
  Button4.Enabled := ListBox1.ItemIndex <> -1;
  TrackBar2.Enabled := Button4.Enabled;
End;

Procedure TMainWindow.TrackBar1Change( Sender: TObject );
Begin
  mxOutlookBarPro.Background.AlphaBlend := TrackBar1.Position;
End;

Procedure TMainWindow.Button5Click( Sender: TObject );
Begin
  ColorDialog.Color := mxOutlookBarPro.Background.Color;
  If ColorDialog.Execute Then
    mxOutlookBarPro.Background.Color := ColorDialog.Color;
End;

Procedure TMainWindow.Button4Click( Sender: TObject );
Var
  Header: TmxHeader;
Begin
  Header := mxOutlookBarPro.HeaderByIndex( ListBox1.ItemIndex );
  ColorDialog.Color := Header.Background.Color;
  If ColorDialog.Execute Then
    Header.Background.Color := ColorDialog.Color;
End;

Procedure TMainWindow.TrackBar2Change( Sender: TObject );
Begin
  mxOutlookBarPro.HeaderByIndex( ListBox1.ItemIndex ).Background.AlphaBlend := TrackBar2.Position;
End;

Procedure TMainWindow.CheckBox4Click( Sender: TObject );
Begin
  If CheckBox4.Checked Then
    mxOutlookBarPro.Settings.CaptionStyle := csCustomDraw Else
    mxOutlookBarPro.Settings.CaptionStyle := csButtonStyle;
End;

Procedure TMainWindow.Button6Click( Sender: TObject );
Var
  I: Integer;
Begin
  With mxOutlookBarPro.Settings.ButtonUp Do
  Begin
    Style := btGradient;
    Gradient.BeginColor := clWhite;
    Gradient.EndColor := $00CC5E2E;
  End;

  With mxOutlookBarPro.Settings.ButtonFocused Do
  Begin
    Style := btGradient;
    Gradient.BeginColor := $00CC5E2E;
    Gradient.EndColor := clWhite;
  End;

  For I := 0 To mxOutlookBarPro.HeaderCount - 1 Do
  Begin
    mxOutlookBarPro.HeaderByIndex( I ).Options := mxOutlookBarPro.HeaderByIndex( I ).Options + [ hoDrawFocusedButton ];
  End;

  mxOutlookBarPro.Settings.CaptionStyle := csCustomDraw;
End;

Procedure TMainWindow.Button7Click( Sender: TObject );
Begin
  mxOutlookBarPro.RenameHeaderByIndex( ListBox.ItemIndex );
End;

Procedure TMainWindow.mxOutlookBarProHeaders0Buttons0Click( Sender: TObject );
Begin
  MessageDlg( 'You have pressed the button', mtWarning, [ mbOK ], 0 );
End;

Procedure TMainWindow.mxOutlookBarProDragDrop( Sender: TmxOutlookBarPro;
  Source: TObject; DataObject: IDataObject; Const Formats: Array Of Word;
  Shift: TShiftState; Pt: TPoint; Var Effect: Integer; Mode: TmxDropMode );
Var
  Button: TmxButton;
  medium: TStgMedium;
  DropFiles: PDropFiles;
  Filename: PChar;

  Procedure CreateButton( FileName: String );
  Begin
    Button := Sender.CurrentTargetHeader.AddButton;
    Button.ImageIndex := 41;
    Button.Caption := FileName;
    Button.Hint := FileName;
    Button.ImageIndex := 23;
    Sender.ProcessOuterDrop( DataObject, Button, Sender.CurrentTargetButton, Effect, Sender.CurrentTargetButton.HitStatus );
  End;

Begin
  { You need to change this code to your own }
  If Mode = dmButton Then
  Begin
    If ( DataObject.GetData( HDropFormatEtc, medium ) <> S_OK ) Then exit;

    Try
      If ( medium.tymed = TYMED_HGLOBAL ) Then
      Begin
        DropFiles := PDropFiles( GlobalLock( medium.HGlobal ) );
        Try
          Filename := PChar( DropFiles ) + DropFiles^.pFiles;
          While ( Filename^ <> #0 ) Do
          Begin
            If ( DropFiles^.fWide ) Then
            Begin
              CreateButton( PWideChar( FileName ) );
              Inc( Filename, ( Length( PWideChar( FileName ) ) + 1 ) * 2 );
            End
            Else
            Begin
              CreateButton( Filename );
              Inc( Filename, Length( Filename ) + 1 );
            End;
          End;
        Finally
          GlobalUnlock( medium.HGlobal );
        End;
      End;
    Finally
      ReleaseStgMedium( medium );
    End;
  End
  Else
    MessageDlg( 'You have dropped something on the outlookbar!!', mtWarning, [ mbOK ], 0 );
End;

Procedure TMainWindow.CheckBox5Click( Sender: TObject );
Begin
  If CheckBox5.Checked Then
  Begin
    mxOutlookBarPro.DragMode := dmAutomatic;
    mxOutlookBarPro.Options := mxOutlookBarPro.Options + [ boInternalDrop ];
  End
  Else
  Begin
    mxOutlookBarPro.DragMode := dmManual;
    mxOutlookBarPro.Options := mxOutlookBarPro.Options - [ boInternalDrop ];
  End;
End;

Procedure TMainWindow.CheckBox6Click( Sender: TObject );
Begin
  If CheckBox6.Checked Then
    mxOutlookBarPro.Options := mxOutlookBarPro.Options + [ boAcceptOLEDrop ] Else
    mxOutlookBarPro.Options := mxOutlookBarPro.Options - [ boAcceptOLEDrop ];
End;

Procedure TMainWindow.CheckBox7Click( Sender: TObject );
Begin
  If CheckBox7.Checked Then
    mxOutlookBarPro.Options := mxOutlookBarPro.Options + [ boAutoChangeHeader ] Else
    mxOutlookBarPro.Options := mxOutlookBarPro.Options - [ boAutoChangeHeader ];
End;

Procedure TMainWindow.CheckBox8Click( Sender: TObject );
Begin
  If CheckBox8.Checked Then
    mxOutlookBarPro.Options := mxOutlookBarPro.Options + [ boAutoScroll ] Else
    mxOutlookBarPro.Options := mxOutlookBarPro.Options - [ boAutoScroll ];
End;

Procedure TMainWindow.Button9Click( Sender: TObject );
Begin
  ColorDialog.Color := mxOutlookBarPro.DropMarkColor;
  If ColorDialog.Execute Then
    mxOutlookBarPro.DropMarkColor := ColorDialog.Color;
End;

Procedure TMainWindow.Button8Click( Sender: TObject );
Var
  Button: TmxButton;
Begin
  If mxOutlookBarPro.HeaderCount > 0 Then
    If mxOutlookBarPro.Headers[ 0 ].ButtonCount > 0 Then
      Button := mxOutlookBarPro.Headers[ 0 ].ButtonByIndex( 0 ) Else
    MessageDlg( 'There is not any button in the first header.', mtWarning, [ mbOK ], 0 ) Else
    MessageDlg( 'There is not any header in the bar.', mtWarning, [ mbOK ], 0 );

  If Assigned( Button ) Then Button.Alert;
End;

Procedure TMainWindow.CheckBox9Click( Sender: TObject );
Begin
  mxOutlookBarPro.Background.Grayscale := CheckBox9.Checked;
End;

Procedure TMainWindow.RadioGroup3Click( Sender: TObject );
Begin
  mxOutlookBarPro.Background.Gradient.Direction := TmxGradientDirection( RadioGroup3.ItemIndex );

End;

Procedure TMainWindow.RadioGroup4Click( Sender: TObject );
Begin
  mxOutlookBarPro.Background.Gradient.DrawStyle := TmxGradientStyle( RadioGroup4.ItemIndex );
End;

Procedure TMainWindow.Button10Click( Sender: TObject );
Begin
  ColorDialog.Color := mxOutlookBarPro.Background.Gradient.BeginColor;
  If ColorDialog.Execute Then
    mxOutlookBarPro.Background.Gradient.BeginColor := ColorDialog.Color;
End;

Procedure TMainWindow.Button11Click( Sender: TObject );
Begin
  ColorDialog.Color := mxOutlookBarPro.Background.Gradient.EndColor;
  If ColorDialog.Execute Then
    mxOutlookBarPro.Background.Gradient.EndColor := ColorDialog.Color;
End;

Procedure TMainWindow.mxOutlookBarProContextPopup( Sender: TObject; MousePos: TPoint; Var Handled: Boolean );
Var
  Pos: TPoint;
Begin
  Pos := ClientToScreen( MOUSEPOS );

  If Sender Is TmxButton Then
  Begin
    PopupMenu3.Popup( Pos.X, Pos.Y );
    Handled := True;
  End;
  If Sender Is TmxHeader Then
  Begin
    PopupMenu2.Popup( Pos.X, Pos.Y );
    Handled := True;
  End;
  If Sender Is TmxOutlookBarPro Then
  Begin
    PopupMenu1.Popup( Pos.X, Pos.Y );
    Handled := True;
  End;
End;

Procedure TMainWindow.mxOutlookBarProDragAllowed( Sender: TmxOutlookBarPro; Button: TmxButton; Var Allowed: Boolean );
Begin
  If Assigned( Button ) Then
    Allowed := Button.ButtonKind = bkButton;
End;

End.

