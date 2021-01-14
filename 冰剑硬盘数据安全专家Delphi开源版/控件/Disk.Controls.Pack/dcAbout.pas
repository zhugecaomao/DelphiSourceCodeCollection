{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcAbout.pas - About dialog box

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}

unit dcAbout;

interface

uses
  Windows, Classes, Controls, StdCtrls, ExtCtrls, Forms;

type
  TdcAboutForm = class(TForm)
    Icon: TImage;
    OKBtn: TButton;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EmailLab: TLabel;
    WWWLab: TLabel;
    procedure EmailLabClick(Sender: TObject);
    procedure WWWLabClick(Sender: TObject);
  private
    FComponentName: String;
  public
    procedure ShowAbout(ComponentName: String);
  end;

procedure dcShowAbout(ComponentName: String);

implementation

{$R *.DFM}

uses SysUtils, ShellAPI, dcUtils;

const
{$IFDEF VER80}       { Delphi 1.0 }
   ProgLanguage = 'Delphi1';
{$ENDIF}
{$IFDEF VER90}       { Delphi 2.0 }
   ProgLanguage = 'Delphi2';
{$ENDIF}
{$IFDEF VER93}       { CBuilder 1 }
   ProgLanguage = 'BCB1';
{$ENDIF}
{$IFDEF VER100}      { Delphi 3 }
   ProgLanguage = 'Delphi3';
{$ENDIF}
{$IFDEF VER110}      { CBuilder 3 }
   ProgLanguage = 'BCB3';
{$ENDIF}
{$IFDEF VER120}      { Delphi 4}
   ProgLanguage = 'Delphi4';
{$ENDIF}
{$IFDEF VER125}      { CBuilder 4 }
   ProgLanguage = 'BCB4';
{$ENDIF}
{$IFDEF VER130}      { Delphi/BCB 5 }
  {$IFNDEF BCB}
     ProgLanguage = 'Delphi5';
  {$ELSE}
     ProgLanguage = 'BCB5';
  {$ENDIF}
{$ENDIF}
{$IFDEF VER140}      { Delphi/BCB 6 }
  {$IFNDEF BCB}
     ProgLanguage = 'Delphi6';
  {$ELSE}
     ProgLanguage = 'BCB6';
  {$ENDIF}
{$ENDIF}
{$IFDEF VER150}      { Delphi/BCB 7 }
  {$IFNDEF BCB}
     ProgLanguage = 'Delphi7';
  {$ELSE}
     ProgLanguage = 'BCB7';
  {$ENDIF}
{$ENDIF}
{$IFDEF VER160}      { Delphi/BCB 8 }
  {$IFNDEF BCB}
     ProgLanguage = 'Delphi8';
  {$ELSE}
     ProgLanguage = 'BCB8';
  {$ENDIF}
{$ENDIF}

procedure TdcAboutForm.EmailLabClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow, 'open', PChar('mailto:info@appcontrols.com?subject=Disk Controls - ' + FComponentName +
               '&body=PS: I''m using ' + ProgLanguage + ', on ' + GetOSStr), nil, nil, SW_SHOWNORMAL);
end;

procedure TdcAboutForm.WWWLabClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow, 'open', 'http://www.appcontrols.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TdcAboutForm.ShowAbout(ComponentName: String);
begin
  FComponentName := Copy(ComponentName, 2, Length(ComponentName) - 1);
  
  Caption := FComponentName;
  Label1.Caption := FComponentName;
  Label2.Caption := FComponentName;

  Icon.Picture.Icon.Handle := LoadIcon(hInstance, PChar(UpperCase(ComponentName)));

  ShowModal;
end;


procedure dcShowAbout(ComponentName: String);
begin
  with TdcAboutForm.Create(Application) do
   try
     {$IFDEF D3}
     EmailLab.Cursor := crHandPoint;
     WWWLab.Cursor := crHandPoint;     
     {$ENDIF}
     ShowAbout(ComponentName);
   finally
     Free;
   end;  
end;

end.
