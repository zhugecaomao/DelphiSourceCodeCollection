unit DBNavPlus;
(*
	DBNavPlus is a decendent of TDBNavigator.  It adds a captions, layout, margin and
  spacing properties to the buttons.

	Author: William R. Florac
  Company: FITCO, Verona, WI (wee little company from my house)
	Copyright 1997, FITCO.  All rights reserved.

 1)  Users of DBNavPlus (and it's components) must accept this disclaimer of
     warranty: "DBNavPlus is supplied as is.  The author disclaims all
     warranties, expressed or implied, including, without limitation,
     the warranties of merchantability and of fitness for any purpose.
     The author assumes no liability for damages, direct or conse-
     quential, which may result from the use of DBNavPlus."

  2) This Software is donated to the public as public domain except as
     noted below.

  3) If you distribute this software, you must include all parts and pages without
  	 modification.

  4) Software may be used, modified and distributed freely if compiled in with
     commercial or private applications (not another VCL).

  5) Fitco retains the copyright to this Software.  You may not distribute
     the source code (PAS) or its compiled unit (DCU) for profit.

  6) If you do find this component handy and you feel guilty
    for using such a great product without paying someone,
    please send a few bucks ($25) to support further development.
    I have spent a lot of time making this VCL the best it can be and
    have included a help file to make it complete.

	7) This file was formatted with tabs set to 2.

	8) Thanks to all those who suggested (and got) improvements.

  9) Latest version can always be found at http://sumac.etcconnect.com/fitco/

	Please forward any comments or suggestions to Bill Florac at:
	 	email: flash@etcconnect.com
		mail: FITCO
					209 Jenna Dr
					Verona, WI  53593

===============================================================================
version 1.0
		- For Delphi 2.0
 		- This VCL was inspired by an article in "Delphi Delvelopers Journal"
Version 1.1 - 2/17/97
		- Well first version did not work during runtime! It seem that
      SetCaptions does not get called during loading even though
      FCaptions is set!  Any way force it to always call SetMargin
      and put call there.  Also switch to using Buttons[x] rather than
      trying to find the buttons.
Version 1.2	- 3-8-97
		- Captions removed at design time were not set back to default values
    - Added version constant

===============================================================================
*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Buttons;

const
	DBNavPlusVersion = '1.2';

type
  TDBNavPlus = class(TDBNavigator)
  private
    { Private declarations }
    DoCaptions: boolean;
		FCaptions: TStrings;
    FLayout: TButtonLayout;
    FSpacing: Integer;
    FMargin: Integer;
  protected
    { Protected declarations }
    procedure SetLayout(value: TButtonLayout);
    procedure SetSpacing(value: integer);
    procedure SetMargin(value: integer);
		procedure SetCaptions(value: TStrings);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
		destructor Destroy; override;
  published
    { Published declarations }
		property Captions: TStrings read FCaptions write SetCaptions;
		property Layout: TButtonLayout read FLayout write SetLayout default blGlyphTop;
		property Spacing: Integer read FSpacing write SetSpacing default 2;
    {if we dont set default, the SetMargin is called}
    {this will allow us to put the SetCaptions in as it is not called!}
		property Margin: Integer read FMargin write SetMargin;
		property Font;
  end;

procedure Register;

implementation

const
	DefaultCaption: array[0..9] of string =
  	('首笔','上笔','下笔','末笔','新增',
     '删除','编辑','存储','撤消','更新');

{******************************************************************************}
constructor TDBNavPlus.Create(AOwner: TComponent);
var
	x: integer;
begin
	inherited create(AOwner);
  {initialize values}
	FCaptions := TStringList.create;
  DoCaptions := True;
  FSpacing := 0;
  SetSpacing(2);
  FMargin := 0;
  SetMargin(-1);
  FLayout := blGlyphBottom;
  SetLayout(blGlyphTop);
  FCaptions.Clear;
  for x := 0 to 9 do FCaptions.Add(DefaultCaption[x]);
  SetCaptions(FCaptions);
end; {of Create}

{******************************************************************************}
destructor TDBNavPlus.Destroy;
begin
	FCaptions.Free;
	inherited Destroy;
end; {of destroy}

{******************************************************************************}
procedure TDBNavPlus.SetCaptions(Value: TStrings);
var
  t: TNavigateBtn;
begin
	{set captions or default if not assigned}
	if Value <> FCaptions
  then FCaptions.Assign(Value);
	for t:= low(TNavigateBtn) to high(TNavigateBtn) do begin
		if ord(t) < Value.Count
    then Buttons[t].caption := Value[ord(t)]
    else Buttons[t].caption := DefaultCaption[ord(t)];
  end;
  Invalidate;
end; {of setCaptions}

{******************************************************************************}
procedure TDBNavPlus.SetLayout(value: TButtonLayout);
var
  t: TNavigateBtn;
begin
	if (value = Flayout) and  not (csLoading in ComponentState) then exit;
	FLayout := value;
	for t:= low(TNavigateBtn) to high(TNavigateBtn)
  do Buttons[t].Layout := value;
  Invalidate;
end; {of SetLayout}

{******************************************************************************}
procedure TDBNavPlus.SetSpacing(value: integer);
var
  t: TNavigateBtn;
begin
	if (value = FSpacing) and not (csLoading in ComponentState) then exit;
	FSpacing := value;
	for t:= low(TNavigateBtn) to high(TNavigateBtn)
  do Buttons[t].Spacing := value;
  Invalidate;
end; {of SetSpacing}

{******************************************************************************}
procedure TDBNavPlus.SetMargin(value: integer);
var
  t: TNavigateBtn;
begin
	if (value = FMargin) and not (csLoading in ComponentState) then exit;
  if (csLoading in ComponentState) then SetCaptions(FCaptions);
	FMargin := value;
	for t:= low(TNavigateBtn) to high(TNavigateBtn)
  do Buttons[t].margin := value;
  Invalidate;
end; {of SetMargin}


{******************************************************************************}
procedure Register;
begin
  RegisterComponents('Data Controls', [TDBNavPlus]);
end; {of Register}

end.
