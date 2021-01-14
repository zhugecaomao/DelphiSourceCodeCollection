{*******************************************************}
{                                                       }
{       Top Support Visual Components                   }
{       TopGrid component TtsImageList                  }
{                                                       }
{       Copyright (c) 1997 - 1999, Top Support          }
{                                                       }
{*******************************************************}

unit TSImageList;

{$INCLUDE TSCmpVer}

interface

uses
  Windows, SysUtils, Classes, Dialogs, Graphics
  {$IFDEF TSVER_V3}, ComObj, ActiveX {$ENDIF}
  {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
    TtsImage = class;
    TtsImageItem = class;
    TtsImageCollection = class;
    TtsImageList = class;
    TtsImageLink = class;

    TtsImageListOnChangeEvent = procedure(Sender: TObject; Image: TtsImage) of object;

    TtsImageListComponent = class(TComponent)
    protected
        procedure AddLink(ImageLink: TtsImageLink); virtual; abstract;
        procedure RemoveLink(ImageLink: TtsImageLink); virtual; abstract;
        function  GetImage(Index: Variant): TtsImageItem; virtual; abstract;
        procedure SetImage(Index: Variant; Value: TtsImageItem); virtual; abstract;
        function  GetGUID: string; virtual; abstract;
        function  GetImageCollection: TCollection; virtual; abstract;

    public
        function  IdIndex(Value: Integer): Integer; virtual; abstract;
        function  IndexExists(Index: Variant): Boolean; virtual; abstract;
        function  NameIndex(Value: string): Integer; virtual; abstract;
        function  NextIndex(Value: Variant): Variant; virtual; abstract;
        function  PrevIndex(Value: Variant): Variant; virtual; abstract;

        property ImageCollection: TCollection read GetImageCollection;
        property GUID: string read GetGUID;
        property Image[Index: Variant]: TtsImageItem read GetImage write SetImage;
    end;

    TtsImageList = class(TtsImageListComponent)
    protected
        FGUID: String;
        FImageCollection: TtsImageCollection;
        FLinks: TList;
        FOnChange: TtsImageListOnChangeEvent;

        procedure AddLink(ImageLink: TtsImageLink); override;
        procedure Changed(Image: TtsImage); virtual;
        procedure DefineProperties(Filer: TFiler); override;
        procedure ReadGUID(Reader: TReader);
        procedure ReadSetNames(Reader: TReader);
        procedure RemoveLink(ImageLink: TtsImageLink); override;
        procedure RemoveLinks;
        procedure SetImages(Value: TtsImageCollection);
        function  GetImage(Index: Variant): TtsImageItem; override;
        procedure SetImage(Index: Variant; Value: TtsImageItem); override;
        function  GetGUID: string; override;
        function  GetImageCollection: TCollection; override;
        procedure WriteGUID(Writer: TWriter);
        procedure WriteSetNames(Writer: TWriter);

    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

        procedure Assign(Source: TPersistent); override;
        procedure Clear;
        function  IdIndex(Value: Integer): Integer; override;
        function  IndexExists(Index: Variant): Boolean; override;
        function  NameIndex(Value: string): Integer; override;
        function  NextIndex(Value: Variant): Variant; override;
        function  PrevIndex(Value: Variant): Variant; override;

        property GUID: string read GetGUID;
    published
        property Images: TtsImageCollection read FImageCollection write SetImages;
        property OnChange: TtsImageListOnChangeEvent read FOnChange write FOnChange;
    end;

    {$IFNDEF TSVER_V3}
    TTransparentMode = (tmAuto, tmFixed);
    {$ENDIF}

    TtsImageItem = class(TCollectionItem)
    protected
        function  GetBitmap: TBitmap; virtual; abstract;
        procedure SetBitmap(Value: TBitmap); virtual; abstract;
        function  GetName: string; virtual; abstract;
        procedure SetRefName(Value: string); virtual; abstract;
        function  GetSetName: string; virtual; abstract;
        procedure SetSetName(Value: string); virtual; abstract;
        function  GetTransparent: Boolean; virtual; abstract;
        procedure SetTransparent(Value: Boolean); virtual; abstract;
        function  GetTransparentColor: TColor; virtual; abstract;
        procedure SetTransparentColor(Value: TColor); virtual; abstract;
        function  GetTransparentMode: TTransparentMode; virtual; abstract;
        procedure SetTransparentMode(Value: TTransparentMode); virtual; abstract;
        function  GetID: Integer; virtual; abstract;

    public
        property ID: Integer read GetID;

    published
        property Bitmap: TBitmap read GetBitmap write SetBitmap;
        property Name: string read GetName write SetRefName;
        property SetName: string read GetSetName write SetSetName;
        property Transparent: Boolean read GetTransparent write SetTransparent stored True;
        property TransparentColor: TColor read GetTransparentColor write SetTransparentColor stored True;
        property TransparentMode: TTransparentMode read GetTransparentMode write SetTransparentMode stored True;
    end;

    TtsImage = class(TtsImageItem)
    protected
        FBitmap: TBitmap;
        //transparency info of bitmap is also stored in seperate fields for compatibility with Delphi 2.0 (no transparency info in bitmap)
        //and because Delphi doesn't save property values of bitmap except for the image itself
        FTransparent: Boolean;
        FTransparentColor: TColor;
        FTransparentMode: TTransparentMode;
        FName: string;
        FSetName: string;
        FUpdateCount: Integer;
        FID: Integer;

        procedure BeginUpdate;
        procedure Changed; virtual;
        procedure DefineProperties(Filer: TFiler); override;
        procedure EndUpdate;
        procedure FBitmapChange(Sender: TObject);
        procedure ReadID(Reader: TReader);
        procedure WriteID(Writer: TWriter);

        function  GetBitmap: TBitmap; override;
        function  GetName: string; override;
        function  GetSetName: string; override;
        function  GetTransparent: Boolean; override;
        function  GetTransparentColor: TColor; override;
        function  GetTransparentMode: TTransparentMode; override;
        function  GetID: Integer; override;
        procedure SetBitmap(Value: TBitmap); override;
        procedure SetRefName(Value: string); override;
        procedure SetSetName(Value: string); override;
        procedure SetTransparent(Value: Boolean); override;
        procedure SetTransparentColor(Value: TColor); override;
        procedure SetTransparentMode(Value: TTransparentMode); override;

    public
        constructor Create(Collection: TCollection); override;
        destructor Destroy; override;
        procedure Assign(Source: TPersistent); override;
    end;

    TtsImageClass = class of TtsImage;

    TtsImageCollection = class(TCollection)
    protected
        FImageList: TtsImageList;
        FOnChange: TNotifyEvent;
        FSetNames: TStringList;
        Ftest: Integer;

        procedure SetTsImage(Index: Variant; Value: TtsImage);
        procedure Update(Item: TCollectionItem); override;
        function  GetOwner: TPersistent; {$IFDEF TSVER_V3} override; {$ENDIF}
        function  GetTsImage(Index: Variant): TtsImage;
        function  GetNextIndex(Index: Variant; Direction: Integer): Variant;

        property SetNames: TStringList read FSetNames write FSetNames;
    public
        constructor Create(ImageList: TtsImageList; ImageClass: TtsImageClass);
        destructor Destroy; override;

        procedure Assign(Source: TPersistent); override;
        function Add: TtsImage;
        function IdIndex(Value: Integer): Integer;
        function IndexExists(Index: Variant): Boolean;
        function Insert(Index: Integer): TtsImage;
        function NameIndex(Value: string): Integer;
        function NextIndex(Index: Variant): Variant;
        function PrevIndex(Index: Variant): Variant;

        property test: Integer read Ftest write Ftest stored True;
        property ImageList: TtsImageList read FImageList;
        property Items[Index: Variant]: TtsImage read GetTsImage write SetTsImage; default;
        property OnChange: TNotifyEvent read FOnChange write FOnChange;
    end;

    TtsImageLink = class(TPersistent)
    protected
        FImageList: TtsImageListComponent;

        procedure SetImageList(Value: TtsImageListComponent);
        procedure ImageChanged(Image: TtsImageItem); virtual;
        procedure ImageListDeleted; virtual;
        function  GetTsImage(Name: Variant): TtsImageItem;

    public
        constructor Create;
        destructor Destroy; override;

        property Image[Name: Variant]: TtsImageItem read GetTsImage;
        property ImageList: TtsImageListComponent read FImageList write SetImageList;
    end;

procedure tsStretchDraw(Canvas: TCanvas; DestRect: TRect; Bitmap: TBitmap; TransparentColor: TColor; CenterImage: Boolean; StretchToFit: Boolean; ShrinkToFit: Boolean; MaintainAspect: Boolean);

{$IFNDEF TSVER_V3}
type
    TGUID = record
                D1: Integer;
                D2: Word;
                D3: Word;
                D4: array[0..7] of Byte;
            end;

function CoCreateGuid(var Guid: TGUID): HResult; stdcall;
function StringFromCLSID(const clsid: TGUID; var psz: PWideChar): HResult; stdcall;
procedure CoTaskMemFree(pv: Pointer); stdcall;
{$ENDIF}

implementation

{$R *.dcr}

const
    VersionNumber = '2.0';

{$IFNDEF TSVER_V3}
function CoCreateGuid; external 'ole32.dll' name 'CoCreateGuid';
function StringFromCLSID; external 'ole32.dll' name 'StringFromCLSID';
procedure CoTaskMemFree; external 'ole32.dll' name 'CoTaskMemFree';
{$ENDIF}

procedure tsStretchDraw(Canvas: TCanvas; DestRect: TRect; Bitmap: TBitmap; TransparentColor: TColor; CenterImage: Boolean; StretchToFit: Boolean; ShrinkToFit: Boolean; MaintainAspect: Boolean);
var
    OrgDestRect, SrcRect : TRect;
    DestRatio, SrcRatio: Single;
    DestHeight, DestWidth : Integer;
    SrcHeight, SrcWidth : Integer;
    NewDestHeight, NewDestWidth : Integer;
begin
    OrgDestRect := DestRect;

    if Bitmap.Empty then
        Canvas.FillRect(DestRect)
    else
    begin
        DestHeight := DestRect.Bottom - DestRect.Top;
        DestWidth := DestRect.Right - DestRect.Left;
        DestRatio := DestWidth / DestHeight;

        SrcRect := Rect(0, 0, Bitmap.Width, Bitmap.Height);
        SrcHeight := SrcRect.Bottom - SrcRect.Top;
        SrcWidth := SrcRect.Right - SrcRect.Left;
        SrcRatio := (SrcRect.Right - SrcRect.Left) / (SrcRect.Bottom - SrcRect.Top);

        if MaintainAspect then
        begin
            if not ShrinkToFit then
            begin
                if DestWidth < SrcWidth then
                begin
                    if CenterImage then SrcRect.Left := (SrcRect.Right - DestWidth) div 2;
                    SrcRect.Right := SrcRect.Left + DestWidth;
                end;

                if DestHeight < SrcHeight then
                begin
                    if CenterImage then SrcRect.Top := (SrcRect.Bottom - DestHeight) div 2;
                    SrcRect.Bottom := SrcRect.Top + DestHeight;
                end;

                SrcHeight := SrcRect.Bottom - SrcRect.Top;
                SrcWidth := SrcRect.Right - SrcRect.Left;
                SrcRatio := (SrcRect.Right - SrcRect.Left) / (SrcRect.Bottom - SrcRect.Top);
            end;

            if not StretchToFit then
            begin
                if SrcWidth < DestWidth then
                begin
                    if CenterImage then DestRect.Left := DestRect.Left + (DestWidth - SrcWidth) div 2;
                    DestRect.Right := DestRect.Left + SrcWidth;
                end;

                if SrcHeight < DestHeight then
                begin
                    if CenterImage then DestRect.Top := DestRect.Top + (DestHeight - SrcHeight) div 2;
                    DestRect.Bottom := DestRect.Top + SrcHeight;
                end;

                DestHeight := DestRect.Bottom - DestRect.Top;
                DestWidth := DestRect.Right - DestRect.Left;
                DestRatio := DestWidth / DestHeight;
            end;

            //do the actual scaling
            if SrcRatio > DestRatio then
            begin
                NewDestHeight := Round(DestWidth / SrcRatio);
                if CenterImage then DestRect.Top := DestRect.Top + (DestHeight - NewDestHeight) div 2;
                DestRect.Bottom := DestRect.Top + NewDestHeight;
            end
            else
            begin
                NewDestWidth := Round(DestHeight * SrcRatio);
                if CenterImage then DestRect.Left := DestRect.Left + (DestWidth - NewDestWidth) div 2;
                DestRect.Right := DestRect.Left + NewDestWidth;
            end
        end
        else
        begin
            //don't have to maintain aspect ratio
            //scale horizontal and vertical seperately
            if SrcWidth < DestWidth then
            begin
                if not StretchToFit then
                begin
                    if CenterImage then DestRect.Left := DestRect.Left + Round((DestWidth - SrcWidth) / 2);
                    DestRect.Right := DestRect.Left + SrcWidth;
                end;
            end
            else if not ShrinkToFit then
            begin
                if CenterImage then
                begin
                    SrcRect.Left := Round((SrcWidth - DestWidth)/2);
                    SrcRect.Right := SrcRect.Left + DestWidth;
                end
                else
                    SrcRect.Right := DestWidth;
            end;

            if SrcHeight < DestHeight then
            begin
                if not StretchToFit then
                begin
                    if CenterImage then DestRect.Top := DestRect.Top + Round((DestHeight - SrcHeight) / 2);
                    DestRect.Bottom := DestRect.Top + SrcHeight;
                end;
            end
            else
            begin
                if not ShrinkToFit then
                begin
                    if CenterImage then
                    begin
                        SrcRect.Top := Round((SrcHeight - DestHeight)/2);
                        SrcRect.Bottom := SrcRect.Top + DestHeight;
                    end
                    else
                        SrcRect.Bottom := DestHeight;
                end;
            end;
        end;

        //draw the scaled image
        Canvas.FillRect(OrgDestRect);

        if TransparentColor <> clNone then
            Canvas.BrushCopy(DestRect, Bitmap, SrcRect, TransparentColor)
        else
            //use Copyrect and not Brushcopy when bitmap is not transparent, it's much faster
            Canvas.CopyRect(DestRect, Bitmap.Canvas, SrcRect);
    end;
end;


procedure SplitRefSetName(Value: string; var SetName: string; var RefName: string);
//syntax of 'Value' : [Setname.]<Name>
var
    I: Integer;
begin
    Value := Trim(Value);

    I := Pos('.', Value);
    if I > 0 then
    begin
        SetName := Trim(Copy(Value, 1, I - 1));
        RefName := Trim(Copy(Value, I + 1, Length(Value)));
    end
    else
    begin
        SetName := '';
        RefName := Trim(Value);
    end;
end;

{TtsImage}

procedure TtsImage.BeginUpdate;
begin
    Inc(FUpdateCount);
end;

procedure TtsImage.EndUpdate;
begin
    Dec(FUpdateCount);
end;

procedure TtsImage.Changed;
begin
    if (FUpdateCount = 0) and (Collection <> nil) then
        inherited Changed(False);
end;

procedure TtsImage.FBitmapChange(Sender: TObject);
begin
    {$IFDEF TSVER_V3}
    FTransparentMode := FBitmap.TransparentMode;
    FTransparentColor := FBitmap.TransparentColor;
    FTransparent := FBitmap.Transparent;
    {$ENDIF}
    Changed;
end;

constructor TtsImage.Create(Collection: TCollection);
begin
    FUpdateCount := 0;
    FID := 0;

    BeginUpdate;
    try
        inherited;

        FBitmap := TBitmap.Create;
        TransparentColor := clWhite;
        TransparentMode := tmAuto;

        Transparent := False;
        FName := '';
        FSetName := '';

        FBitmap.OnChange := FBitmapChange;
    finally
        EndUpdate;
    end;
end;

destructor TtsImage.Destroy;
var
    ImageCollection: TtsImageCollection;
begin
    ImageCollection := TtsImageCollection(Collection);

    FBitmap.Free;
    inherited;

    if Assigned(ImageCollection) then
        ImageCollection.Changed;
end;

function TtsImage.GetBitmap: TBitmap;
begin
    Result := FBitmap;
end;

function TtsImage.GetName: string;
begin
    Result := FName;
end;

function TtsImage.GetSetName: string;
begin
    Result := FSetName;
end;

function TtsImage.GetTransparent: Boolean;
begin
    Result := FTransparent;
end;

function TtsImage.GetTransparentColor: TColor;
begin
    if TransparentMode = tmAuto
        then Result := Bitmap.Canvas.Pixels[0, Bitmap.Height - 1]
        else Result := FTransparentColor;
end;

function TtsImage.GetTransparentMode: TTransparentMode;
begin
    Result := FTransparentMode;
end;

function TtsImage.GetID: Integer;
begin
    Result := FID;
end;

procedure TtsImage.SetBitmap(Value: TBitmap);
begin
    if Value <> nil then
    begin
        if not(Value.Empty) then
        begin
            BeginUpdate;
            try
                FBitmap.Free;
                FBitmap := TBitmap.Create;
                FBitmap.OnChange := FBitmapChange;
                FBitmap.Assign(Value);
            finally
                EndUpdate;
            end;
            Changed;
        end;
    end;
end;

procedure TtsImage.SetRefName(Value: string);
//syntax of Value : [Setname.]<Name>
var
    I: Integer;
    Found: Boolean;
    RefName: string;
    SetName_: string;
begin
    if Assigned(Collection) then
    begin
        if Assigned(TtsImageCollection(Collection).ImageList) then
        begin
            if csReading in TtsImageCollection(Collection).ImageList.ComponentState then
            begin
                FName := Value;
                Exit;
            end;
        end;
    end;

    SplitRefSetName(Value, SetName_, RefName);
    if SetName_='' then SetName_ := FSetName;

    if (Trim(RefName) <> Trim(FName)) or (Trim(SetName_) <> Trim(FSetName)) then
    begin
        Found := False;
        if Assigned(Collection) then
        begin
            if (Collection.Count > 1) then
            begin
                for I := 0 to Collection.Count - 1 do
                    if ( Trim(LowerCase(TtsImage(Collection.Items[I]).FName)) = Trim(LowerCase(RefName)) ) and
                       ( Trim(LowerCase(TtsImage(Collection.Items[I]).FSetName)) = Trim(LowerCase(SetName_)) ) and
                       ( TtsImage(Collection.Items[I]).ID <> ID ) then
                    begin
                        Found := True;
                        Break;
                    end;
            end;
        end;

        if Found then
        begin
            if SetName_='' then
                raise EListError.CreateFmt('Name ''%s'' already exists in main set.', [RefName])
            else
                raise EListError.CreateFmt('Name ''%s'' already exists in set ''%s''.', [RefName, SetName_])
        end
        else
        begin
            FName := RefName;
            FSetName := SetName_;
            if Assigned(Collection) then
            begin
                if (SetName_ <> '') and (TtsImageCollection(Collection).FSetNames.IndexOf(SetName_) = -1) then
                    TtsImageCollection(Collection).FSetNames.Add(SetName_);
            end;
            Changed;
        end;
    end;
end;

procedure TtsImage.SetSetName(Value: string);
var
    I: Integer;
    Found: Boolean;
begin
    if Assigned(Collection) then
    begin
        if Assigned(TtsImageCollection(Collection).ImageList) then
        begin
            if csReading in TtsImageCollection(Collection).ImageList.ComponentState then
            begin
                FSetName := Value;
                if (Value <> '') and (TtsImageCollection(Collection).FSetNames.IndexOf(Value) = -1) then
                    TtsImageCollection(Collection).FSetNames.Add(Value);
                Exit;
            end;
        end;
    end;

    Value := Trim(Value);
    if UpperCase(Value) <> UpperCase(FSetName) then
    begin
        Found := False;
        if Assigned(Collection) then
        begin
            if (Collection.Count > 1) then
            begin
                for I := 0 to Collection.Count - 1 do
                begin
                    if (Trim(LowerCase(TtsImage(Collection.Items[I]).FName)) = Trim(LowerCase(FName))) and
                       (Trim(LowerCase(TtsImage(Collection.Items[I]).FSetName)) = Trim(LowerCase(Value))) then
                    begin
                        Found := True;
                        Break;
                    end;
                end;
            end;
        end;

        if Found then
        begin
            if Value = '' then
                raise EListError.CreateFmt('Name ''%s'' already exists in main set.', [FName, Value])
            else
                raise EListError.CreateFmt('Name ''%s'' already exists in set ''%s''.', [FName, Value])
        end
        else
        begin
            FSetName := Value;
            if Assigned(Collection) then
                if (Value <> '') and (TtsImageCollection(Collection).FSetNames.IndexOf(Value) = -1) then
                    TtsImageCollection(Collection).FSetNames.Add(Value);
            Changed;
        end;
    end;
end;

procedure TtsImage.Assign(Source: TPersistent);
begin
    if Source is TtsImage and (Assigned(Source)) then
    begin
        BeginUpdate;

        try
            FBitmap.Free;
            FBitmap := TBitmap.Create;
            if TtsImage(Source).FBitmap <> nil then
               FBitmap.Assign(TtsImage(Source).FBitmap);

            if Assigned(Collection) then
                if (TtsImage(Source).FSetName <> '') and (TtsImageCollection(Collection).FSetNames.IndexOf(TtsImage(Source).FSetName) = -1) then
                    TtsImageCollection(Collection).FSetNames.Add(TtsImage(Source).FSetName);

            FSetName := TtsImage(Source).FSetName;
            FName := TtsImage(Source).FName;
            FID := TtsImage(Source).FID;
            Transparent := TtsImage(Source).FTransparent;
            TransparentColor := TtsImage(Source).FTransparentColor;
            TransparentMode := TtsImage(Source).FTransparentMode;
        finally
            EndUpdate;
        end;
        Changed;
    end;
end;

procedure TtsImage.SetTransparent(Value: Boolean);
begin
    FTransparent := Value;
    {$IFDEF TSVER_V3}
    FBitmap.Transparent := Value;
    {$ENDIF}
    Changed;
end;

procedure TtsImage.SetTransparentMode(Value: TTransparentMode);
begin
    FTransparentMode := Value;
    {$IFDEF TSVER_V3}
    FBitmap.TransparentMode := Value;
    FTransparentColor := FBitmap.TransparentColor;
    {$ENDIF}
    Changed;
end;

procedure TtsImage.SetTransparentColor(Value: TColor);
begin
    {$IFDEF TSVER_V3}
    FBitmap.TransparentColor := Value;
    {$ENDIF}
    FTransparentColor := Value;
    Changed;
end;

procedure TtsImage.DefineProperties(Filer: TFiler);
begin
    inherited;
    Filer.DefineProperty('ID', ReadID, WriteID, True);
end;

procedure TtsImage.WriteID(Writer: TWriter);
begin
    Writer.WriteInteger(FID);
end;

procedure TtsImage.ReadID(Reader: TReader);
begin
    FID := Reader.ReadInteger;
end;

{TtsImageList}

constructor TtsImageList.Create(AOwner: TComponent);
var
    Temp: TGUID;
    {$IFNDEF TSVER_V3}
    P: PWideChar;
    {$ENDIF}
begin
    inherited Create(Aowner);
    FImageCollection := TtsImageCollection.Create(Self, TtsImage);
    FLinks := TList.Create;

{$IFDEF TSVER_V3}
    CoCreateGuid(Temp);
    FGUID := GUIDToString(Temp);
{$ELSE}
    CoCreateGuid(Temp);
    StringFromCLSID(Temp, P);
    FGUID := WideCharToString(P);
    CoTaskMemFree(P);
{$ENDIF}
end;

destructor TtsImageList.Destroy;
begin
    RemoveLinks;
    FImageCollection.Free;
    FLinks.Free;
    inherited;
end;

procedure TtsImageList.Assign(Source: TPersistent);
begin
    if Source is TtsImageList then
    begin
        FImageCollection.Assign(TtsImageList(Source).FImageCollection);
        FImageCollection.FImageList := Self;
    end;
end;

procedure TtsImageList.Clear;
begin
    RemoveLinks;
    FImageCollection.Clear;
    FImageCollection.FSetNames.Clear;
    FLinks.Clear;
end;

function TtsImageList.IdIndex(Value: Integer): Integer;
begin
    Result := Images.IdIndex(Value);
end;

function TtsImageList.IndexExists(Index: Variant): Boolean;
begin
    Result := Images.IndexExists(Index);
end;

function TtsImageList.NameIndex(Value: string): Integer;
begin
    Result := Images.NameIndex(Value);
end;

function TtsImageList.NextIndex(Value: Variant): Variant;
begin
    Result := Images.NextIndex(Value);
end;

function TtsImageList.PrevIndex(Value: Variant): Variant;
begin
    Result := Images.PrevIndex(Value);
end;

procedure TtsImageList.AddLink(ImageLink: TtsImageLink);
begin
    FLinks.Add(ImageLink);
    ImageLink.FImageList := Self;
end;

procedure TtsImageList.RemoveLink(ImageLink: TtsImageLink);
begin
    ImageLink.FImageList := nil;
    FLinks.Remove(ImageLink);
end;

procedure TtsImageList.RemoveLinks;
var
    I: Integer;
    Link: TtsImageLink;
begin
    for I := FLinks.Count - 1 downto 0 do
    begin
        Link := TtsImageLink(FLinks.Items[I]);
        RemoveLink(Link);
        Link.ImageListDeleted;
    end;
end;

procedure TtsImageList.SetImages(Value: TtsImageCollection);
begin
    FImageCollection.Assign(Value);
end;

function TtsImageList.GetImage(Index: Variant): TtsImageItem;
begin
  Result := Images[Index];
end;

procedure TtsImageList.SetImage(Index: Variant; Value: TtsImageItem);
begin
    if Value is TtsImage then Images[Index] := TtsImage(Value);
end;

function TtsImageList.GetGUID: string;
begin
    Result := FGUID;
end;

function TtsImageList.GetImageCollection: TCollection;
begin
    Result := Images;
end;

procedure TtsImageList.Changed(Image: TtsImage);
var
    I: Integer;
begin
    if Assigned(FOnChange) then FOnChange(Self, Image);
    for I := 0 to FLinks.Count - 1 do
        TtsImageLink(FLinks.Items[I]).ImageChanged(Image);
end;

procedure TtsImageList.DefineProperties(Filer: TFiler);
begin
    inherited;
    Filer.DefineProperty('GUID', ReadGUID, WriteGUID, True);
    Filer.DefineProperty('SetNames', ReadSetNames, WriteSetNames, (Assigned(Images)));
end;

procedure TtsImageList.WriteGUID(Writer: TWriter);
begin
    Writer.WriteString(FGUID);
end;

procedure TtsImageList.ReadGUID(Reader: TReader);
begin
    FGUID := Reader.ReadString;
end;

procedure TtsImageList.WriteSetNames(Writer: TWriter);
begin
    Writer.WriteString(Images.SetNames.CommaText);
end;

procedure TtsImageList.ReadSetNames(Reader: TReader);
begin
    Images.SetNames.CommaText := Reader.ReadString;
end;

{TtsImageCollection}

function TtsImageCollection.NameIndex(Value: string): Integer;
//syntax of 'Value' : [Setname.]<Name>
var
    I: Integer;
    SetName: string;
    RefName: string;
begin
    Result := -1;
    if Count > 0 then
    begin
        SplitRefSetName(Value, SetName, RefName);
        for I := 0 to Count - 1 do
        begin
            if (Trim(LowerCase(Items[I].FName)) = Trim(LowerCase(RefName))) and
               (Trim(LowerCase(Items[I].FSetName)) = Trim(LowerCase(SetName))) then
            begin
                Result := I;
                Break;
            end;
        end;
    end;
end;

function TtsImageCollection.GetNextIndex(Index: Variant; Direction: Integer): Variant;
var
    I: Integer;
    Found: Boolean;
begin
    Result := Unassigned;
    if Count = 0 then Exit;

    if (VarType(Index) = varString) then
    begin
        if (Index = '') then
        begin
            if Direction > 0
                then Result := 0
                else Result := Count-1;
        end
        else
        begin
            Index := NameIndex(Index);
            if Index >= 0 then
            begin
                I := Index;
                Found := False;
                while not Found  do
                begin
                    Inc(I, Direction);
                    if I >= Count then
                        I := 0
                    else if I < 0 then
                        I := Count - 1;
                    if I = Index then Break;
                    if Items[Index].SetName = Items[I].SetName then Found := True;
                end;
                Result := I;
            end;
        end;
    end
    else if (VarType(Index) = varInteger) {$IFDEF TSVER_V6} or
            (VarType(Index) = varLongWord) {$ENDIF} then
    begin
        Inc(Index, Direction);
        if Index >= Count then
            Index := 0
        else if Index < 0 then
            Index := Count - 1;
        Result := Index;
    end;
end;

function TtsImageCollection.NextIndex(Index: Variant): Variant;
begin
    Result := GetNextIndex(Index, 1);
end;

function TtsImageCollection.PrevIndex(Index: Variant): Variant;
begin
    Result := GetNextIndex(Index, -1);
end;

function TtsImageCollection.IndexExists(Index: Variant): Boolean;
begin
  if (VarType(Index) = varEmpty) or
     (VarType(Index) = varNull) then
     Result := False
  else
  begin
    case VarType(Index) of
        varString:
            begin
                if NameIndex(Index) = -1 then
                    Result := False
                else
                    Result := True;
            end;
    else
            begin
                if (Index < 0) Or (Index >= Count) then
                    Result := False
                else
                    Result := True;
            end;
    end;
  end;
end;

function TtsImageCollection.IdIndex(Value: Integer): Integer;
var
    I: Integer;
begin
    Result := -1;
    if Count > 0 then
    begin
        for I := 0 to Count - 1 do
        begin
            if Value = Items[I].FId then
            begin
                Result := I;
                Break;
            end;
        end;
    end;
end;

constructor TtsImageCollection.Create(ImageList: TtsImageList; ImageClass: TtsImageClass);
begin
    inherited Create(ImageClass);
    FImageList := ImageList;
    FSetNames := TStringList.Create;
end;

destructor TtsImageCollection.Destroy;
begin
    inherited;
    FSetNames.Free;
end;

procedure TtsImageCollection.Assign(Source: TPersistent);
begin
    inherited;
    if Source is TtsImageCollection then
        FSetNames.Assign(TtsImageCollection(Source).SetNames);
end;

function TtsImageCollection.Add: TtsImage;
var
    MaxID, FreeIndex, Index, Code, I, J: Integer;
    Found: Boolean;
begin
    MaxID := 0;
    FreeIndex := 1;

    if Count > 0 then
    begin
        for I := 0 to Count - 1 do
            if Items[I].ID > MaxID then MaxID := Items[I].ID;

        for I := 0 to Count - 1 do
        begin
            Found := True;
            for J := 0 to Count - 1 do
            begin
                if Copy(LowerCase(Items[J].Name), 1, 5) = 'image' then
                begin
                    Val(Copy(Items[J].Name, 6, Length(Items[J].Name)), Index, Code);
                    if (Code = 0) and (Index = FreeIndex) then
                    begin
                        Found := False;
                        Break;
                    end;
                end;
            end;

            if Found then Break;
            Inc(FreeIndex, 1);
        end;
    end;

    Result := TtsImage(inherited Add);
    Result.FID := MaxID + 1;
    Result.Name := 'Image' + IntToStr(FreeIndex);
end;

procedure TtsImageCollection.Update(Item: TCollectionItem);
begin
    if Assigned(FOnChange) then FOnChange(self);
    if Assigned(FImageList) then FImageList.Changed(TtsImage(Item));
end;

function TtsImageCollection.Insert(Index: Integer): TtsImage;
begin
{$IFDEF TSVER_V4}
    Result := TtsImage(inherited Insert(Index));
{$ELSE}
    //not available for Delphi 2/3
    Result := nil;
{$ENDIF}
end;

function TtsImageCollection.GetTsImage(Index: Variant): TtsImage;
var
    I: Integer;
begin
    Result := nil;
    if Count > 0 then
    begin
        case VarType(Index) of
            varString:
                begin
                    I := NameIndex(Index);
                    if I < 0 then
                        raise EListError.CreateFmt('Index ''%s'' not found in imagelist.', [Index])
                    else
                        Result := TtsImage(inherited Items[I]);
                end;
        else
                begin
                    if (Index < 0) Or (Index >= Count) then
                        raise EListError.CreateFmt('Index (%d) out of bounds.', [Integer(Index)])
                    else
                        Result := TtsImage(inherited Items[Index]);
                end;
        end;
    end;
end;

procedure TtsImageCollection.SetTsImage(Index: Variant; Value: TtsImage);
var
    I: Integer;
begin
    case VarType(Index) of
        varString:
            begin
                I := NameIndex(Index);
                if I < 0 then
                    raise EListError.CreateFmt('Index ''%s'' not found in imagelist.', [Index]);
            end;
    else
            begin
                if (Index < 0) or (Index >= Count) then
                    raise EListError.CreateFmt('Index (%d) out of bounds.', [Integer(Index)])
                else
                    I := Index;
            end;
    end;

    if I >= 0 then
        if Items[I] <> nil then
            Items[I].Assign(Value);
end;

function TtsImageCollection.GetOwner: TPersistent;
begin
    Result := FImageList;
end;

{TtsImageLink}

constructor TtsImageLink.Create;
begin
    inherited;
    FImageList := nil;
end;

destructor TtsImageLink.Destroy;
begin
    ImageList := nil;
    inherited;
end;

procedure TtsImageLink.SetImageList(Value: TtsImageListComponent);
begin
    if FImageList <> Value then
    begin
        if Assigned(FImageList) then FImageList.RemoveLink(Self);
        if Assigned(Value) then Value.AddLink(Self);
    end;
end;

function TtsImageLink.GetTsImage(Name: Variant): TtsImageItem;
begin
    if Assigned(FImageList) then
        Result := FImageList.Image[Name]
    else
        Result := nil;
end;

procedure TtsImageLink.ImageChanged(Image: TtsImageItem);
begin
end;

procedure TtsImageLink.ImageListDeleted;
begin
end;

end.

