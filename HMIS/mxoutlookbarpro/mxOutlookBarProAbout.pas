// ****************************************************************************
// * ABOUT BOX FOR MY COMPONENTS
// ****************************************************************************
// * Copyright 2002, Bitvadász Kft. Hungary . All Rights Reserved.
// ****************************************************************************
// * Date last modified: 11.10.2002
// ****************************************************************************

Unit mxOutlookBarProAbout;

Interface

// *************************************************************************************
// ** List of used units
// *************************************************************************************

Uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ShellAPI, ExtCtrls;

Type
  Tfrm_OutlookProAboutBox = Class( TForm )

    lbl_Copyright: TLabel;
    Lbl_ComponentName: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    btn_WebSite: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label7: TLabel;

    Procedure Panel2MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    Procedure btn_CloseClick( Sender: TObject );
    Procedure btn_WebSiteClick( Sender: TObject );
    Procedure SpeedButton1Click( Sender: TObject );

  Private

  End;

Procedure ShowAboutBox( Const ComponentName: String );

// *************************************************************************************
// ** End of Interface section
// *************************************************************************************

Implementation

{$R *.DFM}

// *************************************************************************************
// ** ShowAboutBox, 4/11/01 10:13:27 AM
// *************************************************************************************

Procedure ShowAboutBox( Const ComponentName: String );
Begin
  With Tfrm_OutlookProAboutBox.Create( Application ) Do
  Try
    Lbl_ComponentName.Caption := ComponentName;

    ShowModal;
  Finally
    Free;
  End;
End;

Procedure Tfrm_OutlookProAboutBox.Panel2MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
Begin
  ReleaseCapture;
  Perform( WM_SYSCOMMAND, $F012, 0 );
End;

Procedure Tfrm_OutlookProAboutBox.btn_CloseClick( Sender: TObject );
Begin
  Close;
End;

Procedure Tfrm_OutlookProAboutBox.btn_WebSiteClick( Sender: TObject );
Begin
  ShellExecute( Application.Handle, Nil, 'www.maxcomponents.net', Nil, Nil, SW_SHOWNOACTIVATE );
End;

Procedure Tfrm_OutlookProAboutBox.SpeedButton1Click( Sender: TObject );
Begin
  ShellExecute( Application.Handle, Nil, 'mailto:support@maxcomponents.net', Nil, Nil, SW_SHOWNOACTIVATE );
End;

End.

