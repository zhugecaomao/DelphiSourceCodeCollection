{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcStdDialog.pas - dcOpenDialog and dcSaveDialog components
                          with InitialDirSaver structure.
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

unit dcStdDialogs;

interface

uses
  Windows, Classes, Controls, Dialogs, Registry,
  {$IFDEF USEINIFILES} IniFiles, {$ENDIF} dcInternal;

type
  TdcInitialDirSaver = class(TdcRegistrySaver)
  private
    FRegValue: String;
  public
    constructor Create(aOwner: TComponent);

    procedure DoSaveToRegistry(Reg: TRegistry); override;
    procedure DoLoadFromRegistry(Reg: TRegistry); override;

    {$IFDEF USEINIFILES}
    procedure DoSaveToIniFile(Ini: TIniFile); override;
    procedure DoLoadFromIniFile(Ini: TIniFile); override;
    {$ENDIF}
  published
    property Enabled default True;
    property RegValue: String read FRegValue write FRegValue;
  end;

  TdcOpenDialog = class(TOpenDialog)
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

  TdcSaveDialog = class(TSaveDialog)
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

uses SysUtils {$IFNDEF D5},dcUtils{$ENDIF};

constructor TdcInitialDirSaver.Create(aOwner: TComponent);
begin
  inherited;
  Enabled := True;
end;

procedure TdcInitialDirSaver.DoSaveToRegistry(Reg: TRegistry);
begin
  if Owner is TOpenDialog then
   with Owner as TOpenDialog, Reg do
     WriteString(FRegValue, ExtractFilePath(FileName));
end;

procedure TdcInitialDirSaver.DoLoadFromRegistry(Reg: TRegistry);
begin
  if Owner is TOpenDialog then
   with Owner as TOpenDialog, Reg do
     InitialDir := ReadString(FRegValue);
end;

{$IFDEF USEINIFILES}
procedure TdcInitialDirSaver.DoSaveToIniFile(Ini: TIniFile);
begin
  if Owner is TOpenDialog then
   with Ini, Owner as TOpenDialog do
     WriteString(IniSection, FRegValue, ExtractFilePath(FileName));
end;

procedure TdcInitialDirSaver.DoLoadFromIniFile(Ini: TIniFile);
begin
  if Owner is TOpenDialog then
   with Ini, Owner as TOpenDialog do
     InitialDir := ReadString(IniSection, FRegValue, '');
end;
{$ENDIF}


{ OpenDialog }
constructor TdcOpenDialog.Create(aOwner: TComponent);
begin
  inherited;
  FInitialDirSaver := TdcInitialDirSaver.Create(Self);
  Filter := 'All files (*.*)|*.*';
  Options := Options + [ofPathMustExist, ofFileMustExist]
end;

destructor TdcOpenDialog.Destroy;
begin
  FInitialDirSaver.Free;
  inherited;
end;

function TdcOpenDialog.Execute: Boolean;
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


{ SaveDialog }
constructor TdcSaveDialog.Create(aOwner: TComponent);
begin
  inherited;
  FInitialDirSaver := TdcInitialDirSaver.Create(Self);
  Filter := 'All files (*.*)|*.*';
  Options := Options + [ofOverwritePrompt]
end;

destructor TdcSaveDialog.Destroy;
begin
  FInitialDirSaver.Free;
  inherited;
end;

function TdcSaveDialog.Execute: Boolean;
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