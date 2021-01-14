{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcPropUtils.pas - design-time property utilities

  Copyright (c) 1999-2003 UtilMind Solutions
  All rights reserved.
  E-Mail: info@utilmind.com
  WWW: http://www.utilmind.com, http://www.appcontrols.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcPropUtils;

interface

uses Classes;

function SetPropIntegerValue(Obj: TObject; const PropName: String; Value: Integer): Boolean;
function GetPropBooleanValue(Obj: TObject; const PropName: String; var Value: Boolean): Boolean;
function SetPropBooleanValue(Obj: TObject; const PropName: String; Value: Boolean): Boolean;
function GetPropPointerValue(Obj: TObject; const PropName: String): Pointer;
function GetPropNotifyEventValue(Obj: TObject; const PropName: String): TNotifyEvent;
function SetPropNotifyEventValue(Obj: TObject; const PropName: String; Value: TNotifyEvent): Boolean;

function  GetItemChecked(Item: TComponent; SwitchState: Boolean {$IFDEF D4} = False {$ENDIF}): Boolean;
procedure SetItemChecked(Item: TComponent; Checked: Boolean);
procedure SetItemEnabled(Item: TComponent; Enabled: Boolean);

implementation

uses TypInfo, SysUtils;

function SetPropIntegerValue(Obj: TObject; const PropName: String; Value: Integer): Boolean;
var
  PropInfo: PPropInfo;
begin
  Result := False;
  PropInfo := GetPropInfo(Obj.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkInteger) then
   try
     SetOrdProp(Obj, PropInfo, Value);
     Result := True;
   except
   end;
end;

function GetPropBooleanValue(Obj: TObject; const PropName: String; var Value: Boolean): Boolean;
var
  PropInfo: PPropInfo;
begin
  Result := False;
  PropInfo := GetPropInfo(Obj.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkEnumeration) then
   try
     Value := Boolean(GetOrdProp(Obj, PropInfo));
     Result := True;
   except
   end;
end;

function SetPropBooleanValue(Obj: TObject; const PropName: String; Value: Boolean): Boolean;
var
  PropInfo: PPropInfo;
begin
  Result := False;
  PropInfo := GetPropInfo(Obj.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkEnumeration) then
   try
     SetOrdProp(Obj, PropInfo, Byte(Value));
     Result := True;
   except
   end;
end;

function GetPropPointerValue(Obj: TObject; const PropName: String): Pointer;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := GetPropInfo(Obj.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
   try
     Result := Pointer(GetOrdProp(Obj, PropInfo));
   except
   end;
end;

function GetPropNotifyEventValue(Obj: TObject; const PropName: String): TNotifyEvent;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := GetPropInfo(Obj.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkMethod) then
   try
     Result := TNotifyEvent(GetMethodProp(Obj, PropInfo));
   except
   end;
end;

function SetPropNotifyEventValue(Obj: TObject; const PropName: String; Value: TNotifyEvent): Boolean;
var
  PropInfo: PPropInfo;
begin
  Result := False;
  PropInfo := GetPropInfo(Obj.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkMethod) then
   try
     SetMethodProp(Obj, PropInfo, TMethod(Value));
     Result := True;
   except
   end;
end;


function GetItemChecked(Item: TComponent; SwitchState: Boolean {$IFDEF D4} = False {$ENDIF}): Boolean;
begin
  Result := False;
  if Assigned(Item) then
   begin
    if not GetPropBooleanValue(Item, 'Down', Result) then
     begin
      GetPropBooleanValue(Item, 'Checked', Result);
{$IFDEF D4} // kludge for menu items except DevEx, which automatically switch its state
      if SwitchState then
        Result := not Result;
{$ENDIF}
     end; 
   end;
end;

procedure SetItemChecked(Item: TComponent; Checked: Boolean);
begin
  if Assigned(Item) then
   if not SetPropBooleanValue(Item, 'Down', Checked) then { Toolbar97, SpeedButtons, DevExpress }
    SetPropBooleanValue(Item, 'Checked', Checked);        { MenuItem, Toolbar2000 }
end;

procedure SetItemEnabled(Item: TComponent; Enabled: Boolean);
begin
  if Assigned(Item) then
   SetPropBooleanValue(Item, 'Enabled', Enabled);
end;

end.