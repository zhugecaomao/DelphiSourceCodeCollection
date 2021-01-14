unit IdMessage;

{
2000-Jul-25 Hadi Hariri
 - Added support for MBCS
2000-Jun-10 Pete Mee
 - Fixed some minor but annoying bugs.
2000-May-06 Pete Mee
 - Added coder support directly into TIdMessage.
}

{ TODO : Moved Decode/Encode out and will add later,. Maybe TIdMessageEncode, Decode?? }

{ TODO : Support any header in TMessagePart }

{ DESIGN NOTE: The TIdMessage has an fBody which should only ever be the
    raw message.  TIdMessage.fBody is only raw if TIdMessage.fIsEncoded = true

    The component parts are thus possibly made up of the following
    order of TMessagePart entries:

    MP[0] : Possible prologue text (fBoundary is '')

    MP[0 or 1 - depending on prologue existence] :
      fBoundary = boundary parameter from Content-Type

    MP[next...] : various parts with or without fBoundary = ''

    MP[MP.Count - 1] : Possible epilogue text (fBoundary is '')

    }

{ DESIGN NOTE: If TMessagePart.fIsEncoded = True, then TMessagePart.fBody
    is the encoded raw message part.  Otherwise, it is the (decoded) text.
    }

interface

uses
	Classes,
  IdBaseComponent, IdException, IdEMailAddress, IdHeaderList,
  SysUtils;

type
  TIdMessagePriority = (mpHighest, mpHigh, mpNormal, mpLow, mpLowest);

const
  ID_MSG_NODECODE = False;
  ID_MSG_USENOWFORDATE = True;
  ID_MSG_PRIORITY = mpNormal;

type
  TOnGetMessagePartStream = procedure(AStream: TStream) of object;

  TIdMessagePart = class(TCollectionItem)
  protected
    FBoundary: string;
    FBoundaryBegin: Boolean;
    FBoundaryEnd: Boolean;
    FContentMD5: string;
    FContentTransfer: string;
    FContentType: string;
    FEndBoundary: string;
    FExtraHeaders: TIdHeaderList;
    FHeaders: TIdHeaderList;
    FIsEncoded: Boolean;
    FOnGetMessagePartStream: TOnGetMessagePartStream;
    FStoredPathName: TFileName;
    //
    function GetContentType: string;
    function GetContentTransfer: string;
    procedure SetContentType(const Value: string);
    procedure SetContentTransfer(const Value: string);
    procedure SetExtraHeaders(const Value: TIdHeaderList);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    //
    property Boundary : String read FBoundary write FBoundary;
    property BoundaryBegin : Boolean read FBoundaryBegin write FBoundaryBegin;
    property BoundaryEnd : Boolean read FBoundaryEnd write FBoundaryEnd;
    property IsEncoded : Boolean read fIsEncoded;
    property OnGetMessagePartStream: TOnGetMessagePartStream read FOnGetMessagePartStream
     write FOnGetMessagePartStream;
    property StoredPathName: TFileName read FStoredPathName write FStoredPathName;
    property Headers: TIdHeaderList read FHeaders;
  published
    property ContentTransfer: string read GetContentTransfer write SetContentTransfer;
    property ContentType: string read GetContentType write SetContentType;
    property ExtraHeaders: TIdHeaderList read FExtraHeaders write SetExtraHeaders;
  end;

  TIdMessagePartClass = class of TIdMessagePart;

  TIdMessageParts = class;

  TIdAttachment = class(TIdMessagePart)
  protected
    FContentDisposition: string;
    FFileIsTempFile: boolean;
    FFileName: TFileName;
    //
    function GetContentDisposition: string;
    procedure SetContentDisposition(const Value: string);
  public
    procedure Assign(Source: TPersistent); override;
    constructor Create(Collection: TIdMessageParts; const AFileName: TFileName = ''); reintroduce;
    destructor Destroy; override;
    procedure Encode(ADest: TStream);
    function SaveToFile(const FileName: TFileName): Boolean;
    //
    property ContentDisposition: string read GetContentDisposition write SetContentDisposition;
    property FileIsTempFile: boolean read FFileIsTempFile write FFileIsTempFile;
    property FileName: TFileName read FFileName write FFileName;
  end;

  TIdText = class(TIdMessagePart)
  protected
    FBody: TStrings;
    procedure SetBody(const AStrs : TStrings);
  public
    constructor Create(Collection: TIdMessageParts; ABody: TStrings = nil); reintroduce;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    //
    property Body: TStrings read FBody write SetBody;
  end;

  TIdMessageParts = class(TOwnedCollection)
  protected
    FAttachmentEncoding: string;
    FAttachmentCount: integer;
    FMessageEncoderInfo: TObject;
    FRelatedPartCount: integer;
    FTextPartCount: integer;
    //
    function GetItem(Index: Integer): TIdMessagePart;
    procedure SetAttachmentEncoding(const AValue: string);
    procedure SetItem(Index: Integer; const Value: TIdMessagePart);
  public
    function Add: TIdMessagePart;
    procedure CountParts;
    constructor Create(AOwner: TPersistent); reintroduce;
    //
    property AttachmentCount: integer read FAttachmentCount;
    property AttachmentEncoding: string read FAttachmentEncoding write SetAttachmentEncoding;
    property Items[Index: Integer]: TIdMessagePart read GetItem write SetItem; default;
    property MessageEncoderInfo: TObject read FMessageEncoderInfo;
    property RelatedPartCount: integer read FRelatedPartCount;
    property TextPartCount: integer read FTextPartCount;
  end;

  TIdMessage = class(TIdBaseComponent)
  protected
    FBccList: TIdEmailAddressList;
    FBody: TStrings;
    FCharSet: string;
    FCcList: TIdEmailAddressList;
    FContentType: string;
    FContentTransferEncoding: string;
    FDate: TDateTime;
    FMsgSize: longInt;
    FIsEncoded : Boolean;
    FExtraHeaders: TIdHeaderList;
    FFrom: TIdEmailAddressItem;
    FHeaders: TIdHeaderList;
    FMessageParts: TIdMessageParts;
    FMIMEBoundary: string;
    FMsgId: string;
    FNewsGroups: TStrings;
    FNoDecode: Boolean;
    FOrganization: string;
    FPriority: TIdMessagePriority;
    FSubject: string;
    FReceiptRecipient: TIdEmailAddressItem;
    FRecipients: TIdEmailAddressList;
    FReferences: string;
    FReplyTo: TIdEmailAddressList;
    FSender: TIdEMailAddressItem;
    FXProgram: string;
    //
    function GetAttachmentEncoding: string;
    procedure SetAttachmentEncoding(const AValue: string);
  public
    procedure AddHeader(const Value: string);
    procedure Clear; virtual;
    procedure ClearBody;
    procedure ClearHeader;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GenerateHeader: TIdHeaderList;
    function GetUseNowForDate: Boolean;
    procedure ProcessHeaders;
    procedure SetBody(const Value: TStrings);
    procedure SetNewsGroups(const Value: TStrings);
    procedure SetExtraHeaders(const Value: TIdHeaderList);
    procedure SetUseNowForDate(const Value: Boolean);
    //
    property MsgSize: longint read FMsgSize write FMsgSize;
    procedure SaveToText(fname: string);
    procedure LoadFromText(fname: string);
    //
    property IsEncoded : Boolean read fIsEncoded write fIsEncoded;
    property MsgId: string read FMsgId write FMsgId;
    property Headers: TIdHeaderList read FHeaders;
    property MessageParts: TIdMessageParts read FMessageParts;
  published
    //TODO: Make a property editor which drops down the registered coder types
    property AttachmentEncoding: string read GetAttachmentEncoding write SetAttachmentEncoding;
    property Body: TStrings read FBody write SetBody;
    property BccList: TIdEmailAddressList read FBccList write FBccList;
    property CharSet: string read FCharSet write FCharSet;
    property CCList: TIdEmailAddressList read FCcList write FCcList;
    property ContentType: string read FContentType write FContentType;
    property ContentTransferEncoding: string read FContentTransferEncoding
     write FContentTransferEncoding;
    property Date: TDateTime read FDate write FDate;
    //
    property ExtraHeaders: TIdHeaderList read FExtraHeaders write SetExtraHeaders;
    property From: TIdEmailAddressItem read FFrom write FFrom;
    property MIMEBoundary: string read FMIMEBoundary write FMIMEBoundary;
    property NewsGroups: TStrings read FNewsGroups write SetNewsGroups;
    property NoDecode: Boolean read FNoDecode write FNoDecode default ID_MSG_NODECODE;
    property Organization: string read FOrganization write FOrganization;
    property Priority: TIdMessagePriority read FPriority write FPriority default ID_MSG_PRIORITY;
    property ReceiptRecipient: TIdEmailAddressItem read FReceiptRecipient write FReceiptRecipient;
    property Recipients: TIdEmailAddressList read FRecipients write FRecipients;
    property References: string read FReferences write FReferences;
    property ReplyTo: TIdEmailAddressList read FReplyTo write FReplyTo;
    property Subject: string read FSubject write FSubject;
    property Sender: TIdEmailAddressItem read FSender write FSender;
    property UseNowForDate: Boolean read GetUseNowForDate write SetUseNowForDate default ID_MSG_USENOWFORDATE;
  end;

  TIdMessageEvent = procedure(ASender : TComponent; var AMsg : TIdMessage)
    of object;
  TIdStringMessageEvent = procedure(ASender : TComponent;
    const AString : String; var AMsg : TIdMessage) of object;
  EIdMessageException = class(EIdException);
  EIdCanNotCreateMessagePart = class(EIdMessageException);
  EIdTextInvalidCount = class(EIdMessageException);

implementation

uses
  IdMessageCoderMime, // Here so the 'MIME' in create will always suceed
  IdGlobal, IdCoderHeader, IdMessageCoder, IdResourceStrings, IdStream;

{ TIdMessage }

procedure TIdMessage.LoadFromText(fname: string);
var stLine: string;
   f: textfile;
begin
   if FileExists(fname) then
      begin
         Clear; // clear header and body
         AssignFile(f, fname);
         try
            Reset(f);
            repeat // read in headers
               readln(f, stline);
               if stline <> '' then
                  Headers.Add(stLine)
            until eof(f) or (stLine = '');
            repeat // read in body
               readln(f, stline);
               Body.Add(stLine)
            until eof(f);
            ProcessHeaders; // put header into variables
            MsgSize := FileSize(f);
         finally
            closefile(f);
         end;
      end;
end;

procedure TIdMessage.SaveToText(fname: string);
var i: Integer;
   f: textfile;
   ofile : String;
begin
 ofile := fname;
 // Save the message into file
   if FileExists(fname) then DeleteFile(fname);
   AssignFile(f, fname); //save it all to a text file
   try
      Rewrite(f); //create new file
      for i := 0 to Pred(Headers.count) do //save headers
         writeln(f, Headers.strings[i]);
      for i := 0 to Pred(Body.Count) do
         writeln(f, Body.strings[i]); //save body text
   finally
      flush(f);
      closefile(f);
   end;

end;



procedure TIdMessage.AddHeader(const Value: string);
begin
  FHeaders.Add(Value);
end;

procedure TIdMessage.Clear;
begin
  ClearHeader;
  ClearBody;
end;

procedure TIdMessage.ClearBody;
begin
  MessageParts.Clear ;
  Body.Clear;
end;

procedure TIdMessage.ClearHeader;
begin
  CcList.Clear;
  BccList.Clear;
  Date := 0;
  From.Text := '';
  NewsGroups.Clear;
  Organization := '';
  References := '';
  ReplyTo.Clear;
  Subject := '';
  Recipients.Clear;
  Priority := ID_MSG_PRIORITY;
  ReceiptRecipient.Text := '';
  ContentType := '';
  CharSet := '';
  ContentTransferEncoding := '';
  FSender.Text := '';
  Headers.Clear;
  ExtraHeaders.Clear;
  UseNowForDate := ID_MSG_USENOWFORDATE;
end;

constructor TIdMessage.Create(AOwner: TComponent);
begin
  inherited;
  FBody := TStringList.Create;
  FRecipients := TIdEmailAddressList.Create(Self);
  FBccList := TIdEmailAddressList.Create(Self);
  FCcList := TIdEmailAddressList.Create(Self);
  FMessageParts := TIdMessageParts.Create(Self);
  FNewsGroups := TStringList.Create;
  FHeaders := TIdHeaderList.Create;
  FFrom := TIdEmailAddressItem.Create(nil);
  FReplyTo := TIdEmailAddressList.Create(Self);
  FSender := TIdEmailAddressItem.Create(nil);
  FExtraHeaders := TIdHeaderList.Create;
  FReceiptRecipient := TIdEmailAddressItem.Create(nil);
  NoDecode := ID_MSG_NODECODE;
  Clear;
end;

destructor TIdMessage.Destroy;
begin
  FBody.Free;
  FRecipients.Free;
  FBccList.Free;
  FCcList.Free;
  FMessageParts.Free;
  FNewsGroups.Free;
  FHeaders.Free;
  FExtraHeaders.Free;
  FFrom.Free;
  FReplyTo.Free;
  FSender.Free;
  FReceiptRecipient.Free;
  inherited destroy;
end;


procedure TIdMessage.SetBody(const Value: TStrings);
begin
  FBody.Assign(Value);
end;

procedure TIdMessage.SetNewsGroups(const Value: TStrings);
begin
  FNewsgroups.Assign(Value);
end;

{ TMessageParts }

function TIdMessageParts.Add: TIdMessagePart;
begin
  // This helps prevent TIdMessagePart from being added
  Result := nil;
end;

procedure TIdMessageParts.CountParts;
//TODO: Make AttCount, etc maintained on the fly
var
  i: integer;
begin
  FAttachmentCount := 0;
  FRelatedPartCount := 0;
  FTextPartCount := 0;
  for i := 0 to Count - 1 do begin
    if Items[i] is TIdText then begin
      Inc(FTextPartCount)
    end else if Items[i] is TIdAttachment then begin
      if Length(Items[i].ExtraHeaders.Values['Content-ID']) > 0 then begin {do not localize}
        Inc(FRelatedPartCount);
      end;
      Inc(FAttachmentCount);
    end;
  end;
  if TextPartCount = 1 then begin
    raise EIdTextInvalidCount.Create(RSTIdTextInvalidCount);
  end;
end;

constructor TIdMessageParts.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TIdMessagePart);
  // Must set prop and not variable so it will initialize it
  AttachmentEncoding := 'MIME';
end;

function TIdMessageParts.GetItem(Index: Integer): TIdMessagePart;
begin
  Result := TIdMessagePart(inherited GetItem(Index));
end;

procedure TIdMessageParts.SetAttachmentEncoding(const AValue: string);
begin
  FMessageEncoderInfo := TIdMessageEncoderList.ByName(AValue);
  FAttachmentEncoding := AValue;
end;

procedure TIdMessageParts.SetItem(Index: Integer; const Value: TIdMessagePart);
begin
  inherited SetItem(Index, Value);
end;

procedure TIdMessage.ProcessHeaders;
var
  s: string;

  // Some mailers send priority as text, number or combination of both
  function GetMsgPriority(Priority:string): TIdMessagePriority;
  var
    s: string;
    Num: integer;
  begin
    // This is for Pegasus.
    if IndyPos('urgent', LowerCase(Priority)) <> 0 then begin {do not localize}
      Result := mpHigh;
    end else if IndyPos('non-priority', LowerCase(Priority)) <> 0 then begin {do not localize}
      Result := mpLow;
    end else begin
      s := Trim(Priority);
      s := Trim(Fetch(s, ' '));
      Num := StrToIntDef(s, 3);
      Result := TIdMessagePriority(Num-1);
    end;
  end;

begin
  //TODO: Addresses: should be decodeaddress and not decodeheader
  // Fill the properties
  ContentType := Headers.Values['Content-Type']; {do not localize}
  ContentTransferEncoding := Headers.Values['Content-Transfer-Encoding']; {do not localize}

  Subject := DecodeHeader(Headers.Values['Subject']); {do not localize}

  From.Text := DecodeHeader(Headers.Values['From']); {do not localize}
  MsgId := Headers.Values['Message-Id']; {do not localize}
  CommaSeperatedToStringList(Newsgroups, Headers.Values['Newsgroups']); {do not localize}
  Recipients.EMailAddresses := DecodeHeader(Headers.Values['To']); {do not localize}
  CCList.EMailAddresses := DecodeHeader(Headers.Values['Cc']); {do not localize}
  Organization := Headers.Values['Organization']; {do not localize}
  ReceiptRecipient.Text := Headers.Values['Disposition-Notification-To']; {do not localize}
  if Length(ReceiptRecipient.Text) = 0 then begin
    ReceiptRecipient.Text := Headers.Values['Return-Receipt-To']; {do not localize}
  end;
  References := Headers.Values['References']; {do not localize}
  ReplyTo.EmailAddresses := Headers.Values['Reply-To']; {do not localize}
  Date := GMTToLocalDateTime(Headers.Values['Date']); {do not localize}
  Sender.Text := Headers.Values['Sender']; {do not localize}
  if Length(Headers.Values['Priority']) = 0 then begin {do not localize}
    Priority := GetMsgPriority(Headers.Values['X-Priority']) {do not localize}
  end else begin
    Priority := GetMsgPriority(Headers.Values['Priority']); {do not localize}
  end;
  // Get MIME Boundary
  // TODO: Improve this parsing of MimeBoundary
  s := ContentType;
  Fetch(s, 'boundary='); {do not localize}
  Delete(s, 1, 1); // Delete "
  FMIMEBoundary := Fetch(s, '"');
end;

procedure TIdMessage.SetExtraHeaders(const Value: TIdHeaderList);
begin
  FExtraHeaders.Assign(Value);
end;

function TIdMessage.GetUseNowForDate: Boolean;
begin
  Result := FDate = 0;
end;

procedure TIdMessage.SetUseNowForDate(const Value: Boolean);
begin
  Date := 0;
end;

procedure TIdMessage.SetAttachmentEncoding(const AValue: string);
begin
  MessageParts.AttachmentEncoding := AValue;
end;

function TIdMessage.GetAttachmentEncoding: string;
begin
  Result := MessageParts.AttachmentEncoding;
end;

{ TIdMessagePart }

procedure TIdMessagePart.Assign(Source: TPersistent);
var
  mp: TIdMessagePart;
begin
  if ClassType <> Source.ClassType then begin
    inherited;
  end else begin
    mp := TIdMessagePart(Source);
    ContentTransfer := mp.ContentTransfer;
    ContentType := mp.ContentType;
    ExtraHeaders.Assign(mp.ExtraHeaders);
  end;
end;

constructor TIdMessagePart.Create(Collection: TCollection);
begin
  if ClassType = TIdMessagePart then begin
    raise EIdCanNotCreateMessagePart.Create(RSTIdMessagePartCreate);
  end;
  inherited;
  FIsEncoded := False;
  FHeaders := TIdHeaderList.Create;
  FExtraHeaders := TIdHeaderList.Create;
end;

destructor TIdMessagePart.Destroy;
begin
  FHeaders.Free;
  FExtraHeaders.Free;
  inherited;
end;

function TIdMessage.GenerateHeader: TIdHeaderList;
var
  MimeCharset: string;
  HeaderEncoding: Char;
  TransferHeader: TTransfer;
begin
  MessageParts.CountParts;
  TIdMessageEncoderInfo(MessageParts.MessageEncoderInfo).InitializeHeaders(Self);
  if Length(ContentType) = 0 then begin
    ContentType := CharSet;
  end else begin
    ContentType := ContentType + ';' + CharSet;
  end;
  InitializeMime(TransferHeader, HeaderEncoding, MimeCharSet);
  Result := TIdHeaderList.Create; try
    with Result do begin
      Values['From'] := EncodeAddressItem(From, HeaderEncoding, TransferHeader, MimeCharSet); {do not localize}
      Values['Subject'] := EncodeHeader(Subject, [], HeaderEncoding, TransferHeader, {do not localize}
        MimeCharSet);
      Values['To'] := EncodeAddress(Recipients, HeaderEncoding, TransferHeader, MimeCharSet); {do not localize}
      Values['Cc'] := EncodeAddress(CCList, HeaderEncoding, TransferHeader, MimeCharSet); {do not localize}
      Values['Newsgroups'] := NewsGroups.CommaText; {do not localize}
      Values['Content-Type'] := ContentType; {do not localize}
      if MessageParts.Count > 0 then begin
        Values['MIME-Version'] := '1.0';
      end;
      { TODO : Add charset? }
      Values['Content-Transfer-Encoding'] := ContentTransferEncoding; {do not localize}
      Values['Sender'] := Sender.Text; {do not localize}
      Values['Reply-To'] := EncodeAddress(ReplyTo, HeaderEncoding, TransferHeader, {do not localize}
        MimeCharSet);
      Values['Organization'] := EncodeHeader(Organization, [], HeaderEncoding, {do not localize}
        TransferHeader, MimeCharSet);
      Values['Disposition-Notification-To'] := EncodeAddressItem(ReceiptRecipient, {do not localize}
        HeaderEncoding, TransferHeader, MimeCharSet);
      Values['References'] := References; {do not localize}
      if UseNowForDate then begin
        Values['Date'] := DateTimeToInternetStr(Now); {do not localize}
      end else begin
        Values['Date'] := DateTimeToInternetStr(Self.Date); {do not localize}
      end;
      Values['X-Priority'] := IntToStr(Ord(Priority) + 1); {do not localize}
      Values['X-Library'] := gsIdProductName + ' ' + gsIdVersion ; {do not localize}
      // Add the extra-headers
      AddStrings(ExtraHeaders);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TIdMessagePart.GetContentTransfer: string;
begin
  Result := Headers.Values['Content-Transfer-Encoding']; {do not localize}
end;

function TIdMessagePart.GetContentType: string;
begin
  Result := Headers.Values['Content-Type']; {do not localize}
end;

procedure TIdMessagePart.SetContentTransfer(const Value: string);
begin
  Headers.Values['Content-Transfer-Encoding'] := Value; {do not localize}
end;

procedure TIdMessagePart.SetContentType(const Value: string);
begin
  Headers.Values['Content-Type'] := Value; {do not localize}
end;

procedure TIdMessagePart.SetExtraHeaders(const Value: TIdHeaderList);
begin
  FExtraHeaders.Assign(Value);
end;

{ TIdAttachment }

procedure TIdAttachment.Assign(Source: TPersistent);
var
  mp: TIdAttachment;
begin
  if ClassType <> Source.ClassType then begin
    inherited;
  end else begin
    mp := TIdAttachment(Source);
    ContentTransfer := mp.ContentTransfer;
    ContentType := mp.ContentType;
    ExtraHeaders.Assign(mp.ExtraHeaders);
    ContentDisposition := mp.ContentDisposition;
    FileName := mp.FileName;
  end;
end;

constructor TIdAttachment.Create(Collection: TIdMessageParts; const AFileName: TFileName = '');
begin
  inherited Create(Collection);
  FStoredPathname := AFileName;
  FFilename := ExtractFilename(AFilename);
end;

destructor TIdAttachment.Destroy;
begin
  if FileIsTempFile then begin
    DeleteFile(Filename);
  end;
  inherited;
end;

procedure TIdAttachment.Encode(ADest: TStream);
begin
  with TIdMessageEncoderInfo(TIdMessageParts(Collection).MessageEncoderInfo).MessageEncoderClass
   .Create(nil) do try
    Filename := Self.Filename;
    Encode(Self.StoredPathname, ADest);
  finally Free; end;
end;

function TIdAttachment.GetContentDisposition: string;
begin
  Result := Headers.Values['Content-Disposition']; {do not localize}
end;

function TIdAttachment.SaveToFile(const FileName: TFileName): Boolean;
begin
  Result := CopyFileTo(StoredPathname, FileName);
  if not Result then begin
    raise EIdException.Create(RSTIdMessageErrorSavingAttachment);
  end;
end;

procedure TIdAttachment.SetContentDisposition(const Value: string);
begin
  Headers.Values['Content-Disposition'] := Value; {do not localize}
end;

{ TIdText }

procedure TIdText.Assign(Source: TPersistent);
var mp : TIdText;
begin
  if ClassType <> Source.ClassType then
  begin
    inherited;
  end
  else
  begin
    mp := TIdText(Source);
    ContentTransfer := mp.ContentTransfer;
    ContentType := mp.ContentType;
    ExtraHeaders.Assign(mp.ExtraHeaders);
    Body.Assign(mp.Body);
  end;
end;

constructor TIdText.Create(Collection: TIdMessageParts; ABody: TStrings = nil);
begin
  inherited Create(Collection);
  FBody := TStringList.Create;
  if ABody <> nil then begin
    FBody.Assign(ABody);
  end;
end;

destructor TIdText.Destroy;
begin
  FBody.Free;
  inherited;
end;

procedure TIdText.SetBody(const AStrs: TStrings);
begin
  FBody.Assign(AStrs);
end;

initialization
  RegisterClasses([TIdAttachment, TIdText]);
end.

