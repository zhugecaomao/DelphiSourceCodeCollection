// ****************************************************************************
// * An Outlook style sidebar component for Delphi.
// ****************************************************************************
// * Copyright 2002, Bitvadász Kft. Hungary . All Rights Reserved.
// ****************************************************************************
// * Feel free to contact me if you have any questions, comments or suggestions
// * at support@maxcomponents.net
// ****************************************************************************
// * Web page: www.maxcomponents.net
// ****************************************************************************
// * Date last modified: 11.10.2002
// ****************************************************************************
// * TmxOutlookBarPro v2.13
// ****************************************************************************
// * Description:
// *
// * The TmxOutlookBarPro 100% native VCL  component with many added features to
// * support the look, feel, and behavior introduced in Microsoft  Office 97,
// * 2000, and new Internet Explorer. It has got many features  including
// * scrolling headers, icon  highlighting and positioning, small and large
// * icons,gradient and bitmap Backgrounds. The header sections and buttons
// * can be  added, deleted and  moved  at design time. The  header tabs can
// * have individual  font,  alignment,  tabcolor,  glyph, tiled Background
// * images. And many many more posibilities.
// *
// * This component is an advanced version of TmxOutlookBar
// *
// ****************************************************************************

Unit mxOutlookBarProEditor;

Interface

{$I MAX.INC}

Uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Menus,
{$IFDEF DELPHI6_UP}
  DesignIntf, DesignWindows, DesignEditors,
{$ELSE}
  Dsgnintf, DsgnWnds,
{$ENDIF}
  mxOutlookBarPro, ComCtrls, ToolWin, ImgList;

Type
{$IFDEF DELPHI6_UP}
  TDesigner = DesignIntf.IDesigner;
  TFormDesigner = DesignIntf.IDesigner;
{$ELSE}
  TDesigner = IDesigner;
  TFormDesigner = IFormDesigner;
{$ENDIF}

  TmxHeaderEditor = Class( TDesignWindow )
    ClientPanel: TPanel;
    grid_Headers: TDrawGrid;
    PopupMenu: TPopupMenu;
    mnu_Delete: TMenuItem;
    N1: TMenuItem;
    mnu_New: TMenuItem;
    ImageList: TImageList;
    ImageList_Gray: TImageList;
    Splitter1: TSplitter;
    StatusBar: TStatusBar;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    btn_New: TToolButton;
    btn_Delete: TToolButton;
    ToolButton1: TToolButton;
    btn_Clear: TToolButton;
    ToolButton4: TToolButton;
    btn_Close: TToolButton;
    btn_DeleteButton: TToolButton;
    grid_Buttons: TDrawGrid;
    ToolButton2: TToolButton;
    btn_NewButton: TToolButton;
    PopupMenu1: TPopupMenu;
    mnu_DelButton: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Procedure FormClose( Sender: TObject; Var Action: TCloseAction );
    Procedure grid_HeadersDrawCell( Sender: TObject; Col, Row: Longint; Rect: TRect; State: TGridDrawState );
    Procedure grid_HeadersSelectCell( Sender: TObject; Col, Row: Longint; Var CanSelect: Boolean );
    Procedure btn_CloseClick( Sender: TObject );
    Procedure btn_DeleteClick( Sender: TObject );
    Procedure grid_HeadersKeyDown( Sender: TObject; Var Key: Word; Shift: TShiftState );
    Procedure FormResize( Sender: TObject );
    Procedure FormCreate( Sender: TObject );
    Procedure btn_NewClick( Sender: TObject );
    Procedure btn_ClearClick( Sender: TObject );
    Procedure Splitter1Moved( Sender: TObject );
    Procedure ClientPanelResize( Sender: TObject );
    Procedure FormShow( Sender: TObject );
    Procedure Grid_ButtonsDrawCell( Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState );
    Procedure Grid_ButtonsKeyDown( Sender: TObject; Var Key: Word; Shift: TShiftState );
    Procedure btn_DeleteButtonClick( Sender: TObject );
    Procedure Grid_ButtonsSelectCell( Sender: TObject; ACol, ARow: Integer; Var CanSelect: Boolean );
    Procedure btn_NewButtonClick( Sender: TObject );
  Private

    FDeleting: Boolean;
    FActiveHeader: TmxHeader;
    FOutlookBarPro: TmxOutlookBarPro;

    Function GetForm: TCustomForm;
    Function CheckCollection: Boolean;

    Function HeaderByRow( ARow: Integer ): TmxHeader;
    Function ButtonByRow( ARow: Integer ): TmxButton;
    Procedure SelectHeader( AHeader: TmxHeader );
    Procedure SelectButton( AButton: TmxButton );
    Procedure UpdateData;
    Procedure SetHeaderList( AValue: TmxOutlookBarPro );

  Protected

    Procedure Activated; Override;
    Function UniqueName( Component: TComponent ): String; Override;

  Public

{$IFDEF DELPHI6_UP}
    Procedure ItemDeleted( Const ADesigner: IDesigner; Item: TPersistent ); Override;

    Function EditAction( Action: TEditAction ): Boolean; Override;
    Procedure ItemsModified( Const Designer: IDesigner ); Override;
    Procedure DesignerClosed( Const ADesigner: IDesigner; AGoingDormant: Boolean ); Override;
{$ELSE}
    Procedure ComponentDeleted( Component: IPersistent ); Override;

    Procedure EditAction( Action: TEditAction ); Override;
    Procedure FormModified; Override;
    Procedure FormClosed( Form: TCustomForm ); Override;
{$ENDIF}

    Property OwnerForm: TCustomForm Read GetForm;

    Function GetEditState: TEditState; Override;
    Property OutlookBarPro: TmxOutlookBarPro Read FOutlookBarPro Write SetHeaderList;

  End;

Implementation

Uses Clipbrd, mxOutlookBarProReg;

{$R *.DFM}
{$D-}

Type
  TCustomClass = Class( TCustomControl );

Function Max( A, B: Integer ): Integer;
Begin
  If A > B Then Result := A Else Result := B;
End;

Procedure WriteText( ACanvas: TCanvas; ARect: TRect; DX, DY: Integer; Const Text: String; Alignment: TAlignment; WordWrap: Boolean; ARightToLeft: Boolean = False );
Const
  AlignFlags: Array[ TAlignment ] Of Integer = ( DT_LEFT Or DT_EXPANDTABS Or DT_NOPREFIX, DT_RIGHT Or DT_EXPANDTABS Or DT_NOPREFIX, DT_CENTER Or DT_EXPANDTABS Or DT_NOPREFIX );
  WrapFlags: Array[ Boolean ] Of Integer = ( 0, DT_WORDBREAK );
  RTL: Array[ Boolean ] Of Integer = ( 0, DT_RTLREADING );
Var
  Left: Integer;
Begin
  If ( ACanvas.CanvasOrientation = coRightToLeft ) And ( Not ARightToLeft ) Then
    ChangeBiDiModeAlignment( Alignment );
  Case Alignment Of
    taLeftJustify: Left := ARect.Left + DX;
    taRightJustify: Left := ARect.Right - ACanvas.TextWidth( Text ) - 3;
  Else { taCenter }
    Left := ARect.Left + ( ARect.Right - ARect.Left ) Shr 1 - ( ACanvas.TextWidth( Text ) Shr 1 );
  End;
  ACanvas.TextRect( ARect, Left, ARect.Top + DY, Text );
End;

Procedure TmxHeaderEditor.SetHeaderList( AValue: TmxOutlookBarPro );
Begin
  If FOutlookBarPro <> AValue Then
  Begin
    FOutlookBarPro := AValue;
    UpdateData;
  End;
End;

Function TmxHeaderEditor.GetEditState: TEditState;
Begin
  Result := [ ];
  If btn_Delete.Enabled Then Result := [ esCanDelete, esCanCut, esCanCopy ];
  If ClipboardComponents Then Include( Result, esCanPaste );
End;

{$IFDEF DELPHI6_UP}

Procedure TmxHeaderEditor.DesignerClosed( Const ADesigner: IDesigner; AGoingDormant: Boolean );
{$ELSE}

Procedure TmxHeaderEditor.FormClosed( Form: TCustomForm );
{$ENDIF}
Begin
  If {$IFDEF DELPHI6_UP}ADesigner.Root{$ELSE}Form{$ENDIF} = OwnerForm Then Free;
End;

{$IFDEF DELPHI6_UP}

Procedure TmxHeaderEditor.ItemsModified( Const Designer: IDesigner );
{$ELSE}

Procedure TmxHeaderEditor.FormModified;
{$ENDIF}
Begin
  If Not ( csDestroying In ComponentState ) Then UpdateData;
End;

Procedure TmxHeaderEditor.UpdateData;
Var
  Empty: Boolean;
Begin
  If CheckCollection Then
  Begin
    Caption := OutlookBarPro.Name;
    Empty := OutlookBarPro.HeaderCount = 0;

    If OutlookBarPro.HeaderCount = 0 Then
      StatusBar.SimpleText := 'This bar has not got any headers yet.' Else
      If OutlookBarPro.HeaderCount = 1 Then
        StatusBar.SimpleText := 'This bar has only one header' Else
        StatusBar.SimpleText := Format( '%d headers exit', [ OutlookBarPro.HeaderCount ] );
  End
  Else Empty := True;

  If Empty Then
  Begin
    StatusBar.SimpleText := 'This bar has not got any headers yet.';
    grid_Headers.RowCount := 2;
    grid_Buttons.RowCount := 2;
    SelectHeader( Nil );
  End
  Else
  Begin
    grid_Headers.RowCount := OutlookBarPro.HeaderCount + 1;
    grid_Buttons.Invalidate;
  End;

  If FActiveHeader <> Nil Then
  Begin
    btn_DeleteButton.Enabled := FActiveHeader.ButtonCount <> 0;
    mnu_DelButton.Enabled := btn_DeleteButton.Enabled;
    btn_NewButton.Enabled := True;
    grid_Buttons.Enabled := True;
  End
  Else
  Begin
    btn_DeleteButton.Enabled := False;
    mnu_DelButton.Enabled := btn_DeleteButton.Enabled;
    btn_NewButton.Enabled := False;
    grid_Buttons.Enabled := False;
  End;

  btn_Delete.Enabled := Not Empty;
  btn_Clear.Enabled := Not Empty;
  mnu_Delete.Enabled := Not Empty;

     //grid_Headers.Invalidate;
End;

Function TmxHeaderEditor.GetForm: TCustomForm;
Begin
  Result := {$IFDEF DELPHI6_UP}TCustomForm( Designer.Root ){$ELSE}Designer.Form{$ENDIF};
End;

Function TmxHeaderEditor.CheckCollection: Boolean;
Begin
  Result := ( OutlookBarPro <> Nil ) And ( OutlookBarPro.Owner <> Nil )
    And ( {$IFDEF DELPHI6_UP}Designer.Root{$ELSE}Designer.Form{$ENDIF} <> Nil );
End;

Procedure TmxHeaderEditor.FormClose( Sender: TObject; Var Action: TCloseAction );
Begin
  Action := caFree;
End;

{$IFDEF DELPHI6_UP}
Type
  TDesignerSelectionList = IDesignerSelections;
{$ENDIF}

Procedure TmxHeaderEditor.SelectHeader( AHeader: TmxHeader );
Var
  FComponents: TDesignerSelectionList;
Begin
  If CheckCollection And Active Then
  Begin
    FComponents := {$IFDEF DELPHI6_UP}TDesignerSelections{$ELSE}TDesignerSelectionList{$ENDIF}.Create;

    If AHeader <> Nil Then
    Begin
      FComponents.Add( AHeader );

      If AHeader.ButtonCount <> 0 Then
        grid_Buttons.RowCount := AHeader.ButtonCount + 1 Else
        grid_Buttons.RowCount := 2;

      FActiveHeader := AHeader;
    End
    Else
    Begin
      FComponents.Add( OutlookBarPro );
      grid_Buttons.RowCount := 2;
      FActiveHeader := Nil;
    End;

    SetSelection( FComponents );
    If Assigned( FActiveHeader ) Then UpdateData;
  End;
End;

Procedure TmxHeaderEditor.SelectButton( AButton: TmxButton );
Var
  FComponents: TDesignerSelectionList;
Begin
  If CheckCollection And Active Then
  Begin
    FComponents := {$IFDEF DELPHI6_UP}TDesignerSelections{$ELSE}TDesignerSelectionList{$ENDIF}.Create;

    If AButton <> Nil Then
      FComponents.Add( AButton ) Else
      FComponents.Add( OutlookBarPro );

    SetSelection( FComponents );
  End;
End;

Function TmxHeaderEditor.ButtonByRow( ARow: Integer ): TmxButton;
Begin
  Result := Nil;
  If ARow >= 0 Then
  Begin
    If FActiveHeader <> Nil Then
    Begin
      If ARow < FActiveHeader.ButtonCount Then
        Result := FActiveHeader.Buttons[ ARow ];
    End;
  End;
End;

Function TmxHeaderEditor.HeaderByRow( ARow: Integer ): TmxHeader;
Begin
  Result := Nil;
  If CheckCollection And ( ARow >= 0 ) And ( ARow < OutlookBarPro.HeaderCount ) Then
  Begin
    Result := OutlookBarPro.Headers[ ARow ];
  End;
End;

{$IFDEF DELPHI6_UP}

Procedure TmxHeaderEditor.ItemDeleted( Const ADesigner: IDesigner; Item: TPersistent );
Begin
  If Item = OutlookBarPro Then
  Begin
    OutlookBarPro := Nil;
    Close;
  End;

  If Item = FActiveHeader Then
  Begin
    FActiveHeader := Nil;
    Grid_Buttons.RowCount := 2;
  End;
End;

{$ELSE}

Procedure TmxHeaderEditor.ComponentDeleted( Component: IPersistent );
Begin
  If ExtractPersistent( Component ) = OutlookBarPro Then
  Begin
    OutlookBarPro := Nil;
    Close;
  End;

  If ExtractPersistent( Component ) = FActiveHeader Then
  Begin
    FActiveHeader := Nil;
    Grid_Buttons.RowCount := 2;
  End;
End;
{$ENDIF}

Procedure DrawCellTextEx( Control: TCustomControl; ACol, ARow: Longint; Const S: String; Const ARect: TRect; Align: TAlignment; VerticalAlign: TmxVerticalAlignment; WordWrap: Boolean; ARightToLeft: Boolean );
Var
  H: Integer;
Begin
  H := 2;
  Case VerticalAlign Of
    vaTopJustify: H := 2;
    vaCenter: H := Max( 1, ( ARect.Bottom - ARect.Top - TCustomClass( Control ).Canvas.TextHeight( 'W' ) ) Div 2 );
    vaBottomJustify: H := Max( 2, ARect.Bottom - ARect.Top - TCustomClass( Control ).Canvas.TextHeight( 'W' ) );
  End;
  WriteText( TCustomClass( Control ).Canvas, ARect, 2, H, S, Align, WordWrap, ARightToLeft );
End;

Procedure DrawCellText( Control: TCustomControl; ACol, ARow: Longint; Const S: String; Const ARect: TRect; Align: TAlignment; VerticalAlign: TmxVerticalAlignment; ARightToLeft: Boolean );
Begin
  DrawCellTextEx( Control, ACol, ARow, S, ARect, Align, VerticalAlign, Align = taCenter, ARightToLeft );
End;

Procedure TmxHeaderEditor.grid_HeadersDrawCell( Sender: TObject; Col, Row: Longint; Rect: TRect; State: TGridDrawState );
Var
  Text: String;
  AHeader: TmxHeader;
Begin
  If FDeleting Then Exit;
  Text := '';
  If gdFixed In State Then Text := 'Header name' Else
  Begin
    AHeader := HeaderByRow( Row - 1 );
    If AHeader <> Nil Then Text := AHeader.Name;
  End;
  DrawCellText( grid_Headers, Col, Row, Text, Rect, taLeftJustify, vaCenter, False );
End;

Procedure TmxHeaderEditor.grid_HeadersSelectCell( Sender: TObject; Col, Row: Longint; Var CanSelect: Boolean );
Begin
  SelectHeader( HeaderByRow( Row - 1 ) );
End;

Procedure TmxHeaderEditor.btn_CloseClick( Sender: TObject );
Begin
  Close;
End;

Procedure TmxHeaderEditor.btn_DeleteClick( Sender: TObject );
Var
  AHeader: TmxHeader;
Begin
  AHeader := HeaderByRow( grid_Headers.Row - 1 );

  If AHeader <> Nil Then
  Begin
    If FActiveHeader <> Nil Then
      If FActiveHeader = AHeader Then FActiveHeader := Nil;

    FDeleting := True;
    OutlookBarPro.DeleteHeader( AHeader.HeaderIndex );
    FDeleting := False;

    If OutlookBarPro.HeaderCount > 0 Then
    Begin
      AHeader := HeaderByRow( grid_Headers.Row - 1 );
      SelectHeader( AHeader );
    End
    Else SelectHeader( Nil );
    UpdateData;
    Designer.Modified;
  End;
End;

Procedure TmxHeaderEditor.grid_HeadersKeyDown( Sender: TObject; Var Key: Word; Shift: TShiftState );
Begin
  If Shift = [ ] Then
    Case Key Of
      VK_RETURN: If HeaderByRow( grid_Headers.Row - 1 ) <> Nil Then ActivateInspector( #0 );
      VK_DELETE: btn_DeleteClick( Nil );
    End;
End;

Procedure TmxHeaderEditor.FormCreate( Sender: TObject );
Begin
  OutlookBarPro := Nil;
  FActiveHeader := Nil;
  FDeleting := False;
  If NewStyleControls Then Font.Style := [ ];
End;

Procedure TmxHeaderEditor.FormResize( Sender: TObject );
Begin
  With grid_Headers Do ColWidths[ 0 ] := ClientWidth;
End;

{$IFDEF DELPHI6_UP}

Function TmxHeaderEditor.EditAction( Action: TEditAction ): Boolean;
Begin
  Result := True;
{$ELSE}

Procedure TmxHeaderEditor.EditAction( Action: TEditAction );
Begin
{$ENDIF}
  Case Action Of
    eaDelete: btn_DeleteClick( Self );
  End;
End;

Procedure TmxHeaderEditor.btn_NewClick( Sender: TObject );
Var
  I: Integer;
  AHeader: TmxHeader;
Begin
  AHeader := OutlookBarPro.AddHeader;

  If AHeader <> Nil Then
  Try
    With OutlookBarPro Do
    Begin
      I := AHeader.HeaderIndex;
      If ActiveHeader = Nil Then ActiveHeader := AHeader;
    End;
    SelectHeader( AHeader );
    Designer.Modified;
    ActivateInspector( #0 );
    grid_Headers.Row := I + 1;
  Except
    AHeader.Free;
    Raise;
  End
  Else Raise Exception.Create( 'Cannot create new header' );
End;

Procedure TmxHeaderEditor.btn_ClearClick( Sender: TObject );
Begin
  If MessageDlg( 'Do you really want to delete all headers?', mtConfirmation, [ mbOK, mbCancel ], 0 ) = mrOK Then
  Begin
    OutlookBarPro.ClearHeaders;
    UpdateData;
  End;
End;

Procedure TmxHeaderEditor.Activated;
Begin
  SelectHeader( HeaderByRow( grid_Headers.Row - 1 ) );
End;

Function TmxHeaderEditor.UniqueName( Component: TComponent ): String;
Begin
  Result := '';
End;

Procedure TmxHeaderEditor.Splitter1Moved( Sender: TObject );
Begin
  ClientPanelResize( Self );
End;

Procedure TmxHeaderEditor.ClientPanelResize( Sender: TObject );
Begin
  grid_Headers.ColWidths[ 0 ] := grid_Headers.ClientWidth;
  Grid_Buttons.ColWidths[ 0 ] := Grid_Buttons.ClientWidth;
End;

Procedure TmxHeaderEditor.FormShow( Sender: TObject );
Begin
  ClientPanelResize( Self );
End;

Procedure TmxHeaderEditor.Grid_ButtonsDrawCell( Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState );
Var
  Text: String;
  AButton: TmxButton;
Begin
  If FDeleting Then Exit;
  Text := '';
  If gdFixed In State Then Text := 'Button name' Else
  Begin
    AButton := ButtonByRow( ARow - 1 );
    If AButton <> Nil Then Text := AButton.Name;
  End;
  DrawCellText( Grid_Buttons, ACol, ARow, Text, Rect, taLeftJustify, vaCenter, False );
End;

Procedure TmxHeaderEditor.Grid_ButtonsKeyDown( Sender: TObject; Var Key: Word; Shift: TShiftState );
Begin
  If Shift = [ ] Then
    Case Key Of
      VK_RETURN: If ButtonByRow( Grid_Buttons.Row - 1 ) <> Nil Then ActivateInspector( #0 );
      VK_DELETE: btn_DeleteClick( Nil );
    End;
End;

Procedure TmxHeaderEditor.btn_DeleteButtonClick( Sender: TObject );
Var
  AHeader: TmxHeader;
  AButton: TmxButton;
Begin
  AHeader := HeaderByRow( grid_Headers.Row - 1 );

  If AHeader <> Nil Then
  Begin
    AButton := ButtonByRow( Grid_Buttons.Row - 1 );

    If AButton <> Nil Then
    Begin
      AHeader.DeleteButton( AButton.ButtonIndex );
      SelectHeader( AHeader );

      If Grid_Buttons.RowCount > 2 Then Grid_Buttons.RowCount := Grid_Buttons.RowCount - 1;
      UpdateData;
      Designer.Modified;
    End;
  End;
End;

Procedure TmxHeaderEditor.Grid_ButtonsSelectCell( Sender: TObject; ACol, ARow: Integer; Var CanSelect: Boolean );
Begin
  SelectButton( ButtonByRow( ARow - 1 ) );
End;

Procedure TmxHeaderEditor.btn_NewButtonClick( Sender: TObject );
Var
  AButton: TmxButton;
Begin
  AButton := FActiveHeader.AddButton;

  If AButton <> Nil Then
  Try
    SelectHeader( FActiveHeader );
    SelectButton( AButton );
    Designer.Modified;
    ActivateInspector( #0 );
    grid_Buttons.Row := AButton.ButtonIndex + 1;
  Except
    AButton.Free;
    Raise;
  End
  Else Raise Exception.Create( 'Cannot create new button' );
End;

End.

