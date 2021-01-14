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
// * please note that this release is not compible to the old one.
// *
// ****************************************************************************

Unit mxOutlookBarProReg;

Interface

{$I max.inc}

// *************************************************************************************
// ** Component registration
// *************************************************************************************

Procedure Register;

Implementation

// *************************************************************************************
// ** List of used units
// *************************************************************************************

Uses SysUtils, Classes, {$IFDEF Delphi6_UP}DesignIntf, DesignEditors, {$ELSE}Dsgnintf, {$ENDIF}
  Dialogs, Forms, mxOutlookBarProEditor, mxOutlookBarProAbout, mxOutlookBarPro;

Type
{$IFDEF DELPHI6_UP}
  TDesigner = DesignIntf.IDesigner;
  TFormDesigner = DesignIntf.IDesigner;
{$ELSE}
  TDesigner = IDesigner;
  TFormDesigner = IFormDesigner;
{$ENDIF}

Resourcestring

  rsActiveHeaderNil = 'Active header is NIL. It cannot be selected.';
  rsInvalidPropertyValue = 'Invalid header name';

// *************************************************************************************
// ** Component Editor
// *************************************************************************************

Type
  TmxHeaderProperty = Class( TComponentProperty )
  Public
    Function GetValue: String; Override;
    Procedure GetValues( Proc: TGetStrProc ); Override;
    Procedure SetValue( Const AValue: String ); Override;
  End;

  TmxOutlookBarProEditor = Class( TComponentEditor )
  Public
    Function GetVerbCount: integer; Override;
    Function GetVerb( Index: integer ): String; Override;
    Procedure ExecuteVerb( Index: integer ); Override;
  End;

{ TmxHeaderListProperty }

  TmxHeaderListProperty = Class( TPropertyEditor )
    Function GetAttributes: TPropertyAttributes; Override;
    Function GetValue: String; Override;
    Procedure Edit; Override;
  End;

  TmxButtonListProperty = Class( TPropertyEditor )
    Function GetAttributes: TPropertyAttributes; Override;
    Function GetValue: String; Override;
    Procedure Edit; Override;
  End;

Function FindHeaderEditor( AOutlookBarPro: TmxOutlookBarPro ): TmxHeaderEditor;
Var
  I: Integer;
Begin
  Result := Nil;
  For I := 0 To Screen.FormCount - 1 Do
  Begin
    If Screen.Forms[ I ] Is TmxHeaderEditor Then
    Begin
      If TmxHeaderEditor( Screen.Forms[ I ] ).OutlookBarPro = AOutlookBarPro Then
      Begin
        Result := TmxHeaderEditor( Screen.Forms[ I ] );
        Break;
      End;
    End;
  End;
End;

Procedure ShowHeaderEditor( Designer: TDesigner; AOutlookBarPro: TmxOutlookBarPro );
Var
  Editor: TmxHeaderEditor;
Begin
  If AOutlookBarPro = Nil Then Exit;
  Editor := FindHeaderEditor( AOutlookBarPro );
  If Editor = Nil Then
  Begin
    Editor := TmxHeaderEditor.Create( Application );
    Try
      Editor.Designer := TFormDesigner( Designer );
      Editor.OutlookBarPro := AOutlookBarPro;
      Editor.Show;
    Except
      Editor.Free;
      Raise;
    End;
  End
  Else
  Begin
    Editor.Show;
    If Editor.WindowState = wsMinimized Then
      Editor.WindowState := wsNormal;
  End;
End;

{ TmxHeaderListProperty }

Function TmxHeaderListProperty.GetAttributes: TPropertyAttributes;
Begin
  Result := [ paDialog, paReadOnly ];
End;

Function TmxHeaderListProperty.GetValue: String;
Var
  List: TmxHeaders;
Begin
{$WARNINGS OFF}
  List := TmxHeaders( Pointer( GetOrdValue ) );
{$WARNINGS ON}
  If ( List = Nil ) Or ( List.Count = 0 ) Then
    Result := '(none)'
  Else FmtStr( Result, '(%s)', [ GetPropType^.Name ] );
End;

Procedure TmxHeaderListProperty.Edit;
Begin
  ShowHeaderEditor( Designer, TmxOutlookBarPro( GetComponent( 0 ) ) );
End;

{PTmxButtonListPropert}

Function TmxButtonListProperty.GetAttributes: TPropertyAttributes;
Begin
  Result := [ paDialog, paReadOnly ];
End;

Function TmxButtonListProperty.GetValue: String;
Var
  List: TmxButtons;
Begin
{$WARNINGS OFF}
  List := TmxButtons( Pointer( GetOrdValue ) );
{$WARNINGS ON}
  If ( List = Nil ) Or ( List.Count = 0 ) Then
    Result := '(none)'
  Else FmtStr( Result, '(%s)', [ GetPropType^.Name ] );
End;

Procedure TmxButtonListProperty.Edit;
Begin
{$WARNINGS OFF}
  ShowHeaderEditor( Designer, TmxButtons( Pointer( GetOrdValue ) ).OutlookBarPro );
{$WARNINGS ON}
End;

{TmxHeaderProperty}

Procedure TmxHeaderProperty.GetValues( Proc: TGetStrProc );
Var
  AOutlookBar: TmxOutlookBarPro;
  I: Integer;
Begin
  AOutlookBar := GetComponent( 0 ) As TmxOutlookBarPro;
  For I := 0 To AOutlookBar.HeaderCount - 1 Do
    Proc( AOutlookBar.Headers[ I ].Name );
End;

Procedure TmxHeaderProperty.SetValue( Const AValue: String );
Var
  AHeader: TmxHeader;
  AOutlookBar: TmxOutlookBarPro;
Begin
  If AValue = '' Then AHeader := Nil
  Else
  Begin
    AOutlookBar := GetComponent( 0 ) As TmxOutlookBarPro;
    AHeader := AOutlookBar.HeaderByName( AValue );

    If AHeader = Nil Then
      Raise Exception.Create( rsInvalidPropertyValue );
  End;
{$WARNINGS OFF}
  SetOrdValue( Longint( AHeader ) );
{$WARNINGS ON}
End;

Function TmxHeaderProperty.GetValue: String;
Begin
{$WARNINGS OFF}
  If TmxHeader( GetOrdValue ) = Nil Then
    Result := '' Else
    Result := TmxHeader( GetOrdValue ).Name;
{$WARNINGS ON}
End;

{TmxOutlookBarProEditor}

Function TmxOutlookBarProEditor.GetVerbCount: integer;
Begin
  Result := 6;
End;

Function TmxOutlookBarProEditor.GetVerb( Index: integer ): String;
Begin
  Case Index Of
    0: Result := 'Header editor...';
    1: Result := '-';
    2: Result := 'Select active header';
    3: Result := '&Create new header';
    4: Result := '-';
    5: Result := 'TmxOutlookBarPro (C) 2002 Bitvadász Kft.';
  End;
End;

Procedure TmxOutlookBarProEditor.ExecuteVerb( Index: integer );
Var
  ComponentDesigner: TFormDesigner;
  NavigationBar: TmxOutlookBarPro;
  NavigationBarHeader: TmxHeader;
Begin
  ComponentDesigner := Designer;

  Case Index Of
    0:
      If ( Component Is TmxOutlookBarPro ) Then
        ShowHeaderEditor( Designer, TmxOutlookBarPro( Component ) );
    2:
      Begin
        If ( Component Is TmxOutlookBarPro ) Then
          NavigationBar := ( Component As TmxOutlookBarPro ) Else
{$WARNINGS OFF}
          NavigationBar := TmxHeader( Component ).ParentBar;
{$WARNINGS ON}

        If NavigationBar.ActiveHeader <> Nil Then
          ComponentDesigner.SelectComponent( NavigationBar.ActiveHeader ) Else
          Raise Exception.Create( rsActiveHeaderNil );
      End;
    3:
      Begin
        If ( Component Is TmxOutlookBarPro ) Then
          NavigationBar := ( Component As TmxOutlookBarPro ) Else
{$WARNINGS OFF}
          NavigationBar := TmxHeader( Component ).ParentBar;
{$WARNINGS ON}

        NavigationBarHeader := NavigationBar.AddHeader;
        If NavigationBarHeader <> Nil Then
        Begin
          NavigationBar.ActiveHeader := NavigationBarHeader;
          ComponentDesigner.SelectComponent( NavigationBarHeader );
        End
        Else MessageDlg( 'Could not create new header!', mtError, [ mbOK ], 0 );
      End;
    5: ShowAboutBox( 'TmxOutlookBarPro Component' );
  End;

  ComponentDesigner.Modified;
End;

// *************************************************************************************
// ** Register, 4/5/01 11:46:42 AM
// *************************************************************************************

Procedure Register;
Begin
  RegisterComponents( 'Max', [ TmxOutlookBarPro ] );
  RegisterComponentEditor( TmxOutlookBarPro, TmxOutlookBarProEditor );
  RegisterPropertyEditor( TypeInfo( TmxHeader ), TmxOutlookBarPro, 'ActiveHeader', TmxHeaderProperty );
  RegisterPropertyEditor( TypeInfo( TmxHeaders ), TmxOutlookBarPro, 'Headers', TmxHeaderListProperty );
  RegisterPropertyEditor( TypeInfo( TmxButtons ), TmxHeader, 'Buttons', TmxButtonListProperty );
End;

End.

