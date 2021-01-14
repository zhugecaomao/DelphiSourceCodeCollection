{ ****************************************************************** }
{                                                                    }
{   VCL component TFormResizer:  Resizes all components on a form    }
{                                                                    }
{   See accompanying Readme.txt file for usage instructions          }
{                                                                    }
{   Version 2.0 (May 1999)                                           }
{                                                                    }
{   Versions 1.0, 1.1 written by David A. Price, dprice@erols.com    }
{   Version 2.0 adds font-resizing enhancements contributed          }
{   by Wolfgang Kleinrath, office@kleinrath.at                       }
{                                                                    }
{   Copyright © 1999 by David A. Price                               }
{   http://www.compcreate.com                                        }
{   This file may be redistributed freely if not altered             }
{   Suggestions are welcome                                          }
{   Offered "AS IS" -- no warranties                                 }
{                                                                    }
{ ****************************************************************** }
unit Easysize;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls,
     Forms, Graphics, StdCtrls;

{$IFDEF WIN32}
{$R Easysize.d32}
{$ELSE}
{$R Easysize.d16}
{$ENDIF}

type
  EResizerException = class(Exception);

  TPostResizeEvent = procedure (Sender: TObject;
                                Comp : TControl;
                                HeightRatio, WidthRatio : Double) of object;

  TFormResizer = class(TComponent)
    private
      { Private fields of TFormResizer }
      { begin W.K. insert }
      FResizeFonts    : Boolean;
      FMinFontSize    : Integer;
      FMaxFontSize    : Integer;
      { end W.K. insert }
      FEnforceMinSize : Boolean;
      FOnPostResize : TPostResizeEvent;
      InitHeightOwner, InitWidthOwner : Integer;
      ResizerList : TList;
      FOldHight, FOldWidth: integer;  //add by chc
      { Private methods of TFormResizer }

    protected
      { Protected fields of TFormResizer }
        AlreadyInitialized : Boolean;

      { Protected methods of TFormResizer }
        procedure Loaded; override;
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure PostResize(Sender: TObject; Comp : TControl;
                             HeightRatio, WidthRatio : Double); virtual;

    public
      { Public fields and properties of TFormResizer }

      { Public methods of TFormResizer }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        procedure InitializeForm; virtual;
        procedure ResizeAll; virtual;
    published
      { Published properties of TFormResizer }
      { begin W.K. insert }
      Property ResizeFonts : Boolean Read FResizeFonts Write FResizeFonts Default False;
      Property MinFontSize : Integer Read FMinFontSize Write FMinFontSize;
      Property MaxFontSize : Integer Read FMaxFontSize Write FMaxFontSize;
      { end W.K. insert }
        property EnforceMinSize : Boolean
           read FEnforceMinSize write FEnforceMinSize
           default False;
        property OnPostResize : TPostResizeEvent
           read FOnPostResize write FOnPostResize;
  end;

procedure Register;

implementation
{ begin W.K. insert }
uses typinfo;
{ end W.K. insert }

procedure Register;
begin
     { Register TFormResizer with Additional as its
       default page on the Delphi component palette }
     RegisterComponents('Additional', [TFormResizer]);
end;

{ ****************************************************************** }
{ Routines for retrieving and setting properties (by W. Kleinrath)   }
{ ****************************************************************** }

function HasFontProperty(Component : TComponent) : boolean;
begin
   Result := GetPropInfo(Component.ClassInfo, 'Font') <> nil;
end;

function GetCompFont(Component : TComponent) : TFont;
var ptrPropInfo : PPropInfo;
begin
  ptrPropInfo := GetPropInfo(Component.ClassInfo, 'Font');
  if ptrPropInfo = nil then
     Result := nil
  else
      Result := TFont(GetOrdProp(Component, ptrPropInfo));
end;

procedure SetCompFont(Component : TComponent; aFont : TFont);
var ptrPropInfo : PPropInfo;
begin
  ptrPropInfo := GetPropInfo(Component.ClassInfo, 'Font');
  if ptrPropInfo <> nil then
     SetOrdProp(Component, ptrPropInfo, LongInt(aFont));
end;

function GetAutoSizeProperty(Component : TComponent) : Boolean;
var ptrPropInfo : PPropInfo;
begin
   ptrPropInfo := GetPropInfo(Component.ClassInfo,'AutoSize');
   if ptrPropInfo = nil then
      Result := False
   else
       Result := (GetOrdProp(Component, ptrPropInfo) = 1);
end;

procedure SetAutoSizeProperty(Component : TComponent; BoolValue : Boolean);
var ptrPropInfo : PPropInfo;
begin
   ptrPropInfo := GetPropInfo(Component.ClassInfo,'AutoSize');
   if ptrPropInfo <> nil then
      SetOrdProp(Component, ptrPropInfo, LongInt(BoolValue));
end;

{ ****************************************************************** }
{ TSingleResizer object                                              }
{ ****************************************************************** }

type
  TSingleResizer = class(TObject)
    private
      { Private fields of TSingleResizer }
        FComponent : TControl;
        FFlexHeight : Boolean;
        FFlexHorizPos : Boolean;
        FFlexVertPos : Boolean;
        FFlexWidth : Boolean;
        { begin W.K. insert }
        FSglResizeFonts    : Boolean;
        FSglMinFontSize    : Integer;
        FSglMaxFontSize    : Integer;
        FHasFontProp    : Boolean;
        FCompFont       : TFont;
        { end W.K. insert }
      { Private methods of TSingleResizer }

    protected
      { Protected fields of TSingleResizer }
        { Initial dimensions of the linked component and its owner }
        InitHeight : Integer;
        InitHeightOwner : Integer;
        InitLeft : Integer;
        InitTop : Integer;
        InitWidth : Integer;
        InitWidthOwner : Integer;
        { begin W.K. insert }
        InitFontSize: Integer;
        { end W.K. insert }
        { Owner of the linked component }
        Owner : TControl;

      { Protected methods of TSingleResizer }

    public
      { Public fields and properties of TSingleResizer }
        { Component to be resized when form resizes }
        property Component : TControl read FComponent;
        { Scale component's height? }
        property FlexHeight : Boolean
             read FFlexHeight write FFlexHeight;
        { Scale component's horizontal position? }
        property FlexHorizPos : Boolean
             read FFlexHorizPos write FFlexHorizPos;
        { Scale component's vertical position? }
        property FlexVertPos : Boolean
             read FFlexVertPos write FFlexVertPos;
        { Scale component's width? }
        property FlexWidth : Boolean
             read FFlexWidth write FFlexWidth;
        { begin W.K. insert }
        { font-related properties }
        property SglResizeFonts : Boolean read FSglResizeFonts write FSglResizeFonts;
        property SglMinFontSize : Integer read FSglMinFontSize write FSglMinFontSize;
        property SglMaxFontSize : Integer read FSglMaxFontSize write FSglMaxFontSize;
        { end W.K. insert }

      { Public methods of TSingleResizer }
        constructor Create(LinkedControl,
                           ParentForm : TControl;
                           IncFont : Boolean;
                           MinFS, MaxFS : Integer);
        destructor Destroy; override;
        { Resize the linked component }
        procedure Resize(OwnerHeight, OwnerWidth,
                         HeightRatio, WidthRatio : Double);
        { Remove the link to the component }
        procedure Unlink;
  end;

constructor TSingleResizer.Create(LinkedControl,
                           ParentForm : TControl;
                           IncFont : Boolean;
                           MinFS, MaxFS : Integer);
begin
     inherited Create;
     FComponent := LinkedControl;
     if FComponent = nil then
	begin
	raise EResizerException.Create('TSingleResizer created without a component link');
        Exit
        end;
     Owner := ParentForm;
     if Owner = nil then
        begin
        raise EResizerException.Create('TSingleResizer created without a parent form link');
        FComponent := nil;
        Exit
        end;
     { Obtain the linked component's dimensions }
     InitHeight := FComponent.Height;
     InitLeft := FComponent.Left;
     InitTop := FComponent.Top;
     InitWidth := FComponent.Width;
     { begin W.K. insert }
     if HasFontProperty(FComponent) then
        begin
        FCompFont    := GetCompFont(FComponent);
        InitFontSize := FCompFont.Size;
        FHasFontProp  := True;
        end
     else
         begin
         FCompFont    := nil;
         InitFontSize := 0;
         FHasFontProp  := False;
         end;
     { end W.K. insert }
     { Obtain the linked component's owner's dimensions }
     InitHeightOwner := (Owner as TControl).Height;
     InitWidthOwner := (Owner as TControl).Width;
     { By default, we adjust both size and position }
     FFlexHeight := True;
     FFlexHorizPos := True;
     FFlexVertPos := True;
     FFlexWidth := True;
     { begin W.K. insert }
     FSglResizeFonts := IncFont;
     FSglMinFontSize := MinFS;
     FSglMaxFontSize := MaxFS;
     { end W.K. insert }
     { But do not adjust width of labels (to avoid
       interaction of label auto-sizing with re-sizing) }
     if FComponent is TCustomLabel then
        FFlexWidth := False;
end;

destructor TSingleResizer.Destroy;
begin
     inherited Destroy;
end;

{ Resize the linked component }
procedure TSingleResizer.Resize(OwnerHeight, OwnerWidth,
                                HeightRatio, WidthRatio : Double);
var
   NewHeight, NewLeft, NewTop, NewWidth : Integer;
   { begin W.K. insert }
   NewFontSize: Integer;
   OldAutoSize: Boolean;
   { end W.K. insert }
begin
     if FComponent = nil then
        Exit; { not linked to a component }
     if FComponent.Align = alClient then
        Exit; { component resizes itself to client area of parent }
     { Get current dimensions }
     NewHeight := FComponent.Height;
     NewLeft := FComponent.Left;
     NewTop := FComponent.Top;
     NewWidth := FComponent.Width;
     { begin W.K. insert }
     if FHasFontProp then
        NewFontSize := FCompFont.Size
     else
         NewFontSize := 0;
     { end W.K. insert }
     { Is form back to original size?  If so, restore
       component to exact original size to avoid
       rounding error. }
     if (Round(OwnerHeight) = InitHeightOwner)
        and (Round(OwnerWidth) = InitWidthOwner) then
        begin
        if FlexHeight then
           NewHeight := InitHeight;
        if FlexHorizPos then
           NewLeft := InitLeft;
        if FlexVertPos then
           NewTop := InitTop;
        if FlexWidth then
           NewWidth := InitWidth;
        { begin W.K. insert }
        if FHasFontProp And FSglResizeFonts then
           begin
           { Restore font size }
           NewFontSize    := InitFontSize;
           FCompFont.Size := NewFontSize;
           SetCompFont(Component, FCompFont);
           end;
        { end W.K. insert }
        FComponent.SetBounds(NewLeft, NewTop, NewWidth, NewHeight);
        Exit;
        end;
     { Component re-sizing and re-scaling }
     if FlexHeight then
        begin
        { Adjust component's Height property }
        NewHeight := Round(InitHeight * HeightRatio);
        end;
     if FlexWidth then
        begin
        { Adjust component's Width property }
        NewWidth := Round(InitWidth * WidthRatio);
        end;
     if FlexHorizPos then
        begin
        { Adjust component's Left property }
        NewLeft := Round(InitLeft * WidthRatio);
        end;
     if FlexVertPos then
        begin
        { Adjust component's Top property }
        NewTop := Round(InitTop * HeightRatio);
        end;
     { begin W.K. insert }
     if FHasFontProp and FSglResizeFonts then
        begin
        { Calculate new font size }
        NewFontSize := Round(InitFontSize * HeightRatio);
        { Keep font size within boundaries }
        if NewFontSize >  FSglMaxFontSize then
           NewFontSize := FSglMaxFontSize;
        if NewFontSize <  FSglMinFontSize then
           NewFontSize := FSglMinFontSize;
        { Update font size }
        FCompFont.Size := NewFontSize;
        SetCompFont(Component,FCompFont);
        end;
     { If component is a label, save original AutoSize value,
       and set value temporarily to False }
     if FComponent is TCustomLabel then
        begin
        OldAutoSize := GetAutoSizeProperty(FComponent);
        SetAutoSizeProperty(FComponent, False);
        end;
     { end W.K. insert }

     { Set the new component size }
     FComponent.SetBounds(NewLeft, NewTop, NewWidth, NewHeight);

     { begin W.K. insert }
     { If component is a label, set AutoSize temporarily to
       True, call Refresh, and finally restore original value. }
     if FComponent is TCustomLabel then
        begin
        SetAutoSizeProperty(Fcomponent, True);
        TCustomLabel(Fcomponent).Refresh;
        SetAutoSizeProperty(FComponent, OldAutoSize);
        end;
     { end W.K. insert }
end;

procedure TSingleResizer.Unlink;
begin
     FComponent := nil
end;

{ ****************************************************************** }
{ TFormResizer component                                             }
{ ****************************************************************** }

constructor TFormResizer.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     { begin W.K. insert }
      FResizeFonts    := False;
      FMinFontSize    :=  8; { set some useful value here }
      FMaxFontSize    := 48; { set some useful value here }
     { end W.K. insert }
     {begin   chc}
      FOldHight := 0;
      fOldWidth := 0;
     {end      chc}
     FEnforceMinSize := False;
     AlreadyInitialized := False;
     ResizerList := TList.Create;
     if Owner = nil then
        begin
        raise EResizerException.Create('TFormResizer created without an owner');
        Exit
        end;
     if not (Owner is TControl) then
        begin
        raise EResizerException.Create('TFormResizer owner must be a panel or form');
        Exit
        end;
end;

destructor TFormResizer.Destroy;
var
   I : Integer;
begin
     for I := 0 to ResizerList.Count - 1 do
         TSingleResizer(ResizerList.Items[I]).Free;
     ResizerList.Free;
     inherited Destroy;
end;

procedure TFormResizer.InitializeForm;
var
   I : Integer;
   R : TSingleResizer;
begin
     if AlreadyInitialized then
        Exit;
     AlreadyInitialized := True;
     { Get initial height and width of owner form in case
       we are to enforce it as a minimum size
       (i.e., EnforceMinSize = True) }
     InitHeightOwner := TControl(Owner).Height;
     InitWidthOwner := TControl(Owner).Width;
     {add by chc}
     FOldHight := TControl(Owner).Height;
     FOldWidth := TControl(Owner).Width;
     {Add by chc}
     { Create a TSingleResizer for each control on the form }
     for I := 0 to Owner.ComponentCount - 1 do
         if Owner.Components[I] is TControl then
            begin
            R := TSingleResizer.Create(Owner.Components[I] as TControl,
                                       Owner as TControl,
                                       FResizeFonts,
                                       FMinFontSize,
                                       FMaxFontSize);
            ResizerList.Add(R)
            end;
end;

procedure TFormResizer.Loaded;
begin
     inherited Loaded;
end;

{ Called when a component on the form has been deleted }
procedure TFormResizer.Notification(AComponent : TComponent; Operation : TOperation);
var
   I : Integer;
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;

     { Has a component referenced by one of the TSingleResizer objects
       been deleted?  If so, remove the reference. }
     for I := 0 to ResizerList.Count - 1 do
         if TSingleResizer(ResizerList.Items[I]).Component = AComponent then
            TSingleResizer(ResizerList.Items[I]).Unlink;
end;

{ Fire an OnPostResize event after a component has been resized. }
procedure TFormResizer.PostResize(Sender: TObject; Comp : TControl;
                                  HeightRatio, WidthRatio : Double);
begin
     if Assigned(FOnPostResize) then
        FOnPostResize(Sender, Comp, HeightRatio, WidthRatio)
end;

procedure TFormResizer.ResizeAll;
var
   I : Integer;
   OwnerHeight, OwnerWidth, HeightRatio, WidthRatio : Double;
begin
      if not AlreadyInitialized then
        Exit;
     { Enforce initial height and width of owner form as minimum size? }
     if EnforceMinSize then
        begin
        if TControl(Owner).Height < InitHeightOwner then
           TControl(Owner).Height := InitHeightOwner;
        if TControl(Owner).Width < InitWidthOwner then
           TControl(Owner).Width := InitWidthOwner
        end;
     { Determine ratio of current owner size to initial form size }
     OwnerHeight := 1.0 * TControl(Owner).Height;
     OwnerWidth := 1.0 * TControl(Owner).Width;
     { add by chc begin}
     if (abs(FOldHight - OwnerHeight)<10) AND (ABS(FOldWidth - OwnerWidth)<10) then
      exit
     else
      begin
        FOldHight := round(Ownerheight);
        FOldWidth := round(OwnerWidth);
      end;
     { add by chc  end;}
     HeightRatio := OwnerHeight/(1.0 * InitHeightOwner);
     WidthRatio := OwnerWidth/(1.0 * InitWidthOwner);
     { Fire all TSingleResizer components on the form }
     //****************** add by chc *******************
     for i:= 0 to Owner.ComponentCount-1 do begin
      if owner.Components[i] is TWinControl then
        Twincontrol(owner.Components[i]).Visible := false;
     end;
     //*************************************************
     for I := 0 to ResizerList.Count - 1 do
         begin
         TSingleResizer(ResizerList.Items[I]).Resize(OwnerHeight, OwnerWidth,
                        HeightRatio, WidthRatio);
         { Apply any post-resize behavior defined by descendant class
           in PostResize method or by application's OnPostResize handler. }
         PostResize(Self, TSingleResizer(ResizerList.Items[I]).Component,
                    HeightRatio, WidthRatio);
         end;
     //***************** add by chc*********************
     for i:= 0 to Owner.ComponentCount-1 do begin
      if (owner.Components[i]) is TWinControl then
        Twincontrol(owner.Components[i]).Visible := True;
     end;
    //**************************************************
end;


end.
