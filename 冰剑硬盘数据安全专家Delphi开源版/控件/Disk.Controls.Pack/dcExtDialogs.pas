{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcExtDialog.pas - dcOpenPictureDialog and dcSavePictureDialog
                          components with InitialDirSaver structure.
                          (see also dcStdDialogs.pas)

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
{$I umDefines.inc}

unit dcExtDialogs;

interface

uses
  Windows, Classes, Controls, Dialogs, ExtDlgs,
  dcInternal, dcStdDialogs; 

type
  TdcOpenPictureDialog = class(TOpenPictureDialog)
  private
    FAbout: String;
    FInitialDirSaver: TdcInitialDirSaver;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean; override;
  published
    property About: String read FAbout write FAbout stored False;
    property InitialDirSaver: TdcInitialDirSaver read FInitialDirSaver write FInitialDirSaver;
  end;

  TdcSavePictureDialog = class(TSavePictureDialog)
  private
    FAbout: String;
    FInitialDirSaver: TdcInitialDirSaver;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean; override;
  published
    property About: String read FAbout write FAbout stored False;
    property InitialDirSaver: TdcInitialDirSaver read FInitialDirSaver write FInitialDirSaver;
  end;

implementation

uses SysUtils;

{ TdcOpenPictureDialog }
constructor TdcOpenPictureDialog.Create(aOwner: TComponent);
begin
  inherited;
  FInitialDirSaver := TdcInitialDirSaver.Create(Self);
  Options := Options + [ofPathMustExist, ofFileMustExist]
end;

destructor TdcOpenPictureDialog.Destroy;
begin
  FInitialDirSaver.Free;
  inherited;
end;

function TdcOpenPictureDialog.Execute: Boolean;
begin
  with FInitialDirSaver do
   begin
    if FileName = '' then
      if Enabled then Load
      else
    else
     begin
      InitialDir := ExtractFilePath(FileName);
      FileName := ExtractFileName(FileName);
     end;
    Result := inherited Execute;
    if Result and Enabled then Save;
   end;
end;


{ TdcSavePictureDialog }
constructor TdcSavePictureDialog.Create(aOwner: TComponent);
begin
  inherited;
  FInitialDirSaver := TdcInitialDirSaver.Create(Self);
  Options := Options + [ofOverwritePrompt]
end;

destructor TdcSavePictureDialog.Destroy;
begin
  FInitialDirSaver.Free;
  inherited;
end;

function TdcSavePictureDialog.Execute: Boolean;
begin
  with FInitialDirSaver do
   begin
    if FileName = '' then
      if Enabled then Load
      else
    else
     begin
      InitialDir := ExtractFilePath(FileName);
      FileName := ExtractFileName(FileName);
     end;
    Result := inherited Execute;
    if Result and Enabled then Save;
   end;
end;

end.