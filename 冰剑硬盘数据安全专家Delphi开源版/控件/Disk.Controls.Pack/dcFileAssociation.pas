{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcFileAssociation.pas - dcFileAssociation component

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

unit dcFileAssociation;

interface

uses
  Windows, Classes, Controls, Graphics,
  dcInternal;

type
  TdcFileExtAccessMode = (amReadOnly, amReadWrite);
  TdcFileAssociation = class(TumdcComponent)
  private
    FAccessMode: TdcFileExtAccessMode;
    FDefCommandName: String;
    FExtension: String;
    FExecutableFile: String;
    FExtDescription: String;
    FFileDescription: String;
    FParamString: String;
    FMIMEType: String;    

    FIconFile: String;
    FIconIndex: Integer;
    FLargeIcon: TIcon;
    FSmallIcon: TIcon;

    procedure SetExtension(const Value: String);
    procedure SetExecutableFile(const Value: String);
    procedure SetDefCommandName(const Value: String);    
    procedure SetExtDescription(const Value: String);
    procedure SetFileDescription(const Value: String);
    procedure SetParamString(const Value: String);
    procedure SetMIMEType(const Value: String);    
    procedure SetIconFile(const Value: String);
    procedure SetIconIndex(Value: Integer);
    procedure SetIcon(Value: TIcon);

    function  CheckAccessMode: Boolean;
    procedure GetExtensionInfo;
    procedure DoInstallExtension;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function InstallExtension(Extension, ExecutableFile, ParamString, MIMEType,
                              ExtDescription, FileDescription,
                              IconFile: String; IconIndex: Integer): Boolean;
    function UninstallExtension(Ext: String): Boolean;
  published
    property About;

    property AccessMode: TdcFileExtAccessMode read FAccessMode write FAccessMode default amReadOnly;
    property DefCommandName: String read FDefCommandName write SetDefCommandName;
    property ExecutableFile: String read FExecutableFile write SetExecutableFile;
    property ExtDescription: String read FExtDescription write SetExtDescription;    
    property EXTENSION: String read FExtension write SetExtension;
    property FileDescription: String read FFileDescription write SetFileDescription;
    property ParamString: String read FParamString write SetParamString;
    property MIMEType: String read FMIMEType write SetMIMEType;    

    property IconFile: String read FIconFile write SetIconFile;
    property IconIndex: Integer read FIconIndex write SetIconIndex default 0;
    property LargeIcon: TIcon read FLargeIcon write SetIcon;
    property SmallIcon: TIcon read FSmallIcon write SetIcon;
  end;

implementation

uses Forms, SysUtils, Registry, ShellAPI, ShlObj, dcUtils;

const
  { do not localize }
  DEFAULT_ICON_VALUE = 'DefaultIcon';
  CONTENT_TYPE_VALUE = 'Content Type';

constructor TdcFileAssociation.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FLargeIcon := TIcon.Create;
  FSmallIcon := TIcon.Create;
end;

destructor TdcFileAssociation.Destroy;
begin
  FSmallIcon.Destroy;
  FLargeIcon.Destroy;
  inherited Destroy;
end;


procedure TdcFileAssociation.GetExtensionInfo;
var
  I: Integer;
  LIcon, SIcon: hIcon;
  St: String;
  StrList: TStringList;
begin
  { clearing all properties }
  FDefCommandName := '';
  FExecutableFile := '';
  FExtDescription := '';
  FFileDescription := '';
  FMIMEType := '';  
  FParamString := '';
  FIconFile := '';
  FIconIndex := 0;
  FLargeIcon.Assign(nil);
  FSmallIcon.Assign(nil);

  if (FEXTENSION = '') or (FEXTENSION = '.') then Exit;

  with TRegistry.Create do
   try
     try
       { open key in HKCR where stored info about needed extension }
       RootKey := HKEY_CLASSES_ROOT;
       OpenKey(FExtension, False);
       { reading the description key }
       FExtDescription := ReadString('');
       FMIMEType := ReadString(CONTENT_TYPE_VALUE);

       { if there is not description for specified extension
         then reading default MS icon and exiting }
       if (FExtDescription = '') or
          not OpenKey('\' + FExtDescription, False) then
        begin
         GetDefaultIcons(FLargeIcon, FSmallIcon);

         { if ExtDescription still not specified and we'd like to
           install an extension }
         if AccessMode = amReadWrite then
          begin
           FExtDescription := FEXTENSION + 'file';
           if FExtDescription[1] = '.' then
             Delete(FExtDescription, 1, 1);
           FParamString := '%1';
          end;
         Exit;
        end;

       FFileDescription := ReadString('');  { reading the file description (ie: .pas = "Delphi Unit" ) }

       { reading the icons (large and small) }
       if OpenKey(DEFAULT_ICON_VALUE, False) then
        begin
         FIconFile := ReadString('');

         if FIconFile <> '' then { if icon file exists }
          begin
           SplitStr(',', FIconFile, FIconFile, St, LEFT, []);
           { getting the icon index }
           FIconIndex := StrToIntDef(St, 0);
           I := ExtractIconEx(PChar(FIconFile), FIconIndex, LIcon, SIcon, 1);
           if (I = 0) or (I = -1) then
            { if icon can not be read then opening the shell32 icon }
            try
              if LowerCase(FExtension) = '.exe' then I := 2
              else I := 0;
              GetShell32Icons(I, FLargeIcon, FSmallIcon);
            except
            end
           else
            begin
             FLargeIcon.Handle := LIcon;
             FSmallIcon.Handle := SIcon;
            end;
          end;
        end;

       { reading the info about executable }
       if OpenKey('\' + FExtDescription + '\shell\open', False) then
         FDefCommandName := ReadString('');
       if OpenKey('\' + FExtDescription + '\shell\open\command', False) then
         FExecutableFile := ReadString('')
       else
        if OpenKey('\' + FExtDescription + '\shell\', False) then
         begin { trying to find executable }
          StrList := TStringList.Create;
          try
            GetKeyNames(StrList);
            I := StrList.Count;
            if I <> 0 then
             begin
              St := '';
              for I := 0 to I - 1 do
               if Pos('open', LowerCase(StrList[I])) <> 0 then
                begin
                 St := StrList[I];
                 Break;
                end;
                
              if St <> '' then
               begin
                if OpenKey('\' + FExtDescription + '\shell\' + St, False) then
                  FDefCommandName := ReadString('');

                if OpenKey('\' + FExtDescription + '\shell\' + St + '\command', False) then
                  FExecutableFile := ReadString('');
               end;

              { if executable still not found then returning *any* way of opening this extension }
              if St = '' then
               for I := 0 to StrList.Count - 1 do
                if FExecutableFile = '' then              
                 if OpenKey('\' + FExtDescription + '\shell\' + StrList[I] + '\command', False) then
                  FExecutableFile := ReadString('');
             end;
          except
          end;
          StrList.Free;
         end;
       SplitFileNameAndParams(FExecutableFile, FParamString);

       if FIconFile = '' then
        begin
        { if we still haven't icon then trying to
          read this from the executable.
          This thing happends with Corel Photo-paint extensions (gif/jpg etc) }
         FIconFile := FExecutableFile;
         SplitStr(',', FIconFile, FIconFile, St, LEFT, []);         
         FIconIndex := StrToIntDef(St, 0);
         ExtractIconEx(PChar(FIconFile), FIconIndex, LIcon, SIcon, 1);
         FLargeIcon.Handle := LIcon;
         FSmallIcon.Handle := SIcon;
        end;
     except
     end;
   finally
     Free;
   end;
end;

procedure TdcFileAssociation.DoInstallExtension;
begin
  InstallExtension(FExtension, FExecutableFile, FParamString, FMIMEType, FExtDescription, FFileDescription, FIconFile, FIconIndex);
end;

function TdcFileAssociation.InstallExtension(Extension, ExecutableFile, ParamString,
                              MIMEType, ExtDescription, FileDescription,
                              IconFile: String; IconIndex: Integer): Boolean;
begin
  Result := False;
  if (Extension = '') or (csLoading in ComponentState) then Exit;
  if ExtDescription = '' then ExtDescription := Extension + 'file';
  if (Extension <> '') and (Extension[1] <> '.') then Insert('.', Extension, 1);

  with TRegistry.Create do
   try
     try
       RootKey := HKEY_CLASSES_ROOT;
       Result := OpenKey(Extension, True);
       if Result then
        begin
         WriteString('', ExtDescription);
         if FMIMEType <> '' then
           WriteString(CONTENT_TYPE_VALUE, FMIMEType);
         Result := OpenKey('\' + ExtDescription, True);
         if Result then
          begin
           WriteString('', FileDescription);
           Result := OpenKey(DEFAULT_ICON_VALUE, True);
           if Result then
            begin
             if IconFile = '' then IconFile := ExecutableFile;
             WriteString('', IconFile + ',' + IntToStr(IconIndex));
             Result := OpenKey('\' + ExtDescription + '\shell\open', True);
             if Result then
              begin
               WriteString('', DefCommandName);
               Result := OpenKey('\' + ExtDescription + '\shell\open\command', True);
               if Result then
                begin
                 if ParamString <> '' then
                   ExecutableFile := '"' + ExecutableFile + '" "' + ParamString + '"';
                 WriteString('', ExecutableFile);
                end;
              end;
            end;  
          end;
        end;

       SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);          
     except
       Result := False;
     end;
   finally
     Free;
   end;
end;

function TdcFileAssociation.UninstallExtension(Ext: String): Boolean;
var
  Description: String;
begin
  if Ext[1] <> '.' then
    Insert('.', Ext, 1);

  with TRegistry.Create do  
   try
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey(Ext, False) then
       begin
        { reading the description key }
        Description := ReadString('');
        CloseKey;
        DeleteKey(Ext);
        if Description <> '' then
          DeleteKey('\' + Description);
        Result := True;

        { notifying shell about changes }      
        SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);      
       end
      else Result := False;
    except
      Result := False;
    end;
   finally
     Free;
   end;

  GetExtensionInfo;
end;

procedure TdcFileAssociation.SetExtension(const Value: String);
begin
  if FExtension <> Value then
   begin
    FExtension := Value;
    if (FExtension <> '') and (FExtension[1] <> '.') then
     Insert('.', FExtension, 1);

    GetExtensionInfo;
   end;
end;


function TdcFileAssociation.CheckAccessMode: Boolean;
begin
  Result := AccessMode = amReadWrite;

  if not Result and (csDesigning in ComponentState) and
     not (csReading in ComponentState) then
   Application.MessageBox('Cannot write this property in Read-Only access mode.', PChar(Name + ': Design-time tip'), mb_Ok or mb_IconWarning);
end;

procedure TdcFileAssociation.SetExecutableFile(const Value: String);
begin
  if (FExecutableFile <> Value) and CheckAccessMode then
   begin
    FExecutableFile := Value;
    DoInstallExtension;
    GetExtensionInfo;
   end;
end;

procedure TdcFileAssociation.SetDefCommandName(const Value: String);
begin
  if (FDefCommandName <> Value) and CheckAccessMode then
   begin
    FDefCommandName := Value;
    DoInstallExtension;
    GetExtensionInfo;
   end;
end;

procedure TdcFileAssociation.SetExtDescription(const Value: String);
begin
  if (FExtDescription <> Value) and CheckAccessMode then
   begin
    FExtDescription := Value;
    DoInstallExtension;
   end;
end;

procedure TdcFileAssociation.SetFileDescription(const Value: String);
begin
  if (FFileDescription <> Value) and CheckAccessMode then
   begin
    FFileDescription := Value;
    DoInstallExtension;
   end;
end;

procedure TdcFileAssociation.SetParamString(const Value: String);
begin
  if (FParamString <> Value) and CheckAccessMode then
   begin
    FParamString := Value;
    DoInstallExtension;
   end;
end;

procedure TdcFileAssociation.SetMIMEType(const Value: String);
begin
  if (FMIMEType <> Value) and CheckAccessMode then
   begin
    FMIMEType := Value;
    DoInstallExtension;
   end;
end;

procedure TdcFileAssociation.SetIconFile(const Value: String);
begin
  if (FIconFile <> Value) and CheckAccessMode then
   begin
    FIconFile := Value;
    DoInstallExtension;
    GetExtensionInfo;
   end;
end;

procedure TdcFileAssociation.SetIconIndex(Value: Integer);
begin
  if (FIconIndex <> Value) and CheckAccessMode then
   begin
    FIconIndex := Value;
    DoInstallExtension;
    GetExtensionInfo;
   end;
end;

procedure TdcFileAssociation.SetIcon(Value: TIcon);
begin
end;

end.