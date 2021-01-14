{-----------------------------------------------------------------------------
 Demo Name: TCPDataset server demo
 Author:    Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:42:17
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates how to send dataset information over TCP using FreeWare TkbmMemTable

 ## IMPORTANT ## - This demo requires TKBMMemTable V3 or greater to operate


}

unit fServer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPServer, StdCtrls, ExtCtrls, Db,
  kbmMemTable, DBTables, ComCtrls, IdAntiFreezeBase, IdAntiFreeze, syncobjs,
  kbmMemBinaryStreamFormat;

type
  TfrmServer = class(TForm)
    Panel1: TPanel;
    btnExit: TButton;
    btnActivate: TButton;
    IdTCPServer: TIdTCPServer;
    kbmMemTable1: TkbmMemTable;
    SessionMain: TSession;
    kbmMemTable1Name: TStringField;
    kbmMemTable1Capital: TStringField;
    kbmMemTable1Continent: TStringField;
    kbmMemTable1Area: TFloatField;
    kbmMemTable1Population: TFloatField;
    Label1: TLabel;
    lblServerStatus: TLabel;
    IdAntiFreeze1: TIdAntiFreeze;
    SBMain: TStatusBar;
    Query1: TQuery;
    kbmBinaryStreamFormat1: TkbmBinaryStreamFormat;
    procedure btnExitClick(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
    procedure IdTCPServerExecute(AThread: TIdPeerThread);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure IdTCPServerConnect(AThread: TIdPeerThread);
    procedure IdTCPServerDisconnect(AThread: TIdPeerThread);
  private
    { Private declarations }
  public
    { Public declarations }
    fConnectedClients : Integer;
    CS : TCriticalSection;
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.DFM}

procedure TfrmServer.btnExitClick(Sender: TObject);
begin
application.terminate;
end;

procedure TfrmServer.btnActivateClick(Sender: TObject);
begin
if IdTCPServer.active then
  begin
  IdTCPServer.active := false;
  btnActivate.caption := '&Activate server';
  lblServerStatus.caption := '[ idle ]';
  end
else
  begin
  IdTCPServer.active := true;
  btnActivate.caption := '&Deactivate server';
  lblServerStatus.caption := '[ active ]';  
  end;
end;

procedure TfrmServer.IdTCPServerExecute(AThread: TIdPeerThread);
var
  InString, CMD, Action, tmpTableName, tmpAlias, tmpSQL, SQL : String;
  AStream : TMemoryStream;
  MT : TkbmMemTable;
  TBL : TTable;
  QRY :TQuery;
  i : integer;
  SL : TStringList;
begin
try
InString := UpperCase(AThread.connection.ReadLn);
CMD := copy(InString,1,3);
Action := copy(InString,5,3);
SQL := copy(InString,9,500); // arbitrary length

if CMD = 'ALA' then // Aliases
  begin
  SL := TStringList.Create;
  SessionMain.GetAliasNames(SL);
  AStream := TMemoryStream.Create;
  MT := TkbmMemTable.Create(AThread.Connection);
  with MT do
    begin
    close;
    DefaultFormat := kbmBinaryStreamFormat1;
    FieldDefs.Add('tmpField',ftString,255,false);
    CreateTable;
    active := true;
    Open;
    for i := 0 to SL.count - 1 do
      begin
      Append;
      mt.Fields[0].AsString := SL.Strings[i];
      Post;
      end;
    First;
    UpdateIndexes;
    SaveToStream(AStream);
    end;
  AThread.connection.WriteStream(AStream);
  FreeAndNil(AStream);
  FreeAndNil(SL);
  FreeAndNil(MT);

  AThread.connection.Disconnect;
  end
else
if CMD = 'TBL' then // tables
  begin
  if Action = 'ALL' then // get all table data
    begin
    SL := TStringList.Create;
    SessionMain.GetTableNames(trim(SQL),'',true,true,SL);
    AStream := TMemoryStream.Create;
    MT := TkbmMemTable.Create(AThread.Connection);
    with MT do
      begin
      close;
      DefaultFormat := kbmBinaryStreamFormat1;
      FieldDefs.Add('tmpField',ftString,255,false);
      CreateTable;
      active := true;
      Open;
      for i := 0 to SL.count - 1 do
        begin
        Append;
        mt.Fields[0].AsString := SL.Strings[i];
        Post;
        end;
      First;
      UpdateIndexes;
      SaveToStream(AStream);
      end;
    AThread.connection.WriteStream(AStream);
    FreeAndNil(AStream);
    FreeAndNil(SL);
    FreeAndNil(MT);
    AThread.connection.Disconnect;
    end
  else
  if Action = 'GET' then // get specific table field data
    begin
    tmpAlias := copy(SQL,1,pos(':',SQL)-1);
    tmpTableName := copy(SQL,pos(':',SQL)+1,500);  // arbitrary length
    TBL := TTable.Create(AThread.connection);
    with TBL do
      begin
      DatabaseName := tmpAlias;
      TableName := tmpTableName;
      Open;
      end;
    SL := TStringList.Create;
    for i := 0 to TBL.FieldDefs.Count - 1 do
      SL.Append(TBL.fields[i].FieldName);
    AStream := TMemoryStream.Create;
    MT := TkbmMemTable.Create(AThread.Connection);
    with MT do
      begin
      close;
      DefaultFormat := kbmBinaryStreamFormat1;
      FieldDefs.Add('tmpField',ftString,255,false);
      CreateTable;
      active := true;
      Open;
      for i := 0 to SL.count - 1 do
        begin
        Append;
        mt.Fields[0].AsString := SL.Strings[i];
        Post;
        end;
      First;
      UpdateIndexes;
      SaveToStream(AStream);
      end;
    AThread.connection.WriteStream(AStream);
    FreeAndNil(AStream);
    FreeAndNil(SL);
    FreeAndNil(MT);
    FreeAndNil(TBL);
    AThread.connection.Disconnect;
    end;
  end
else
if CMD = 'SQL' then // get dynamic SQL
  begin
  tmpAlias := copy(SQL,1,pos(':',SQL)-1);
  tmpSQL := copy(SQL,pos(':',SQL)+1,500);  // arbitrary length
  QRY := TQuery.Create(AThread.connection);
  with QRY do
    begin
    DatabaseName := tmpAlias;
    SQL.text := tmpSQL;
    Open;
    end;
  AStream := TMemoryStream.Create;
  MT := TkbmMemTable.Create(AThread.Connection);
  with MT do
    begin
    close;
    DefaultFormat := kbmBinaryStreamFormat1;
    LoadFromDataSet(QRY,[mtcpoStructure,mtcpoOnlyActiveFields,mtcpoProperties,mtcpoLookup,mtcpoCalculated]);
    active := true;
    Open;
    SaveToStream(AStream);
    end;
  AThread.connection.WriteStream(AStream);
  FreeAndNil(AStream);
  FreeAndNil(MT);
  FreeAndNil(QRY);
  AThread.connection.Disconnect;
  end
else
  begin
  ShowMessage('Unrecognised command or action!');
  AThread.connection.Disconnect;
  end;
except
on E : Exception do
ShowMessage(E.Message);
end;
end;

procedure TfrmServer.FormCreate(Sender: TObject);
begin
if not assigned (CS) then CS := TCriticalSection.Create;
end;

procedure TfrmServer.FormDestroy(Sender: TObject);
begin
if IdTCPServer.active then IdTCPServer.Active := false;
if assigned(CS) then FreeAndNil(CS);
end;

procedure TfrmServer.IdTCPServerConnect(AThread: TIdPeerThread);
begin
CS.Acquire;
  try
  inc(fConnectedClients);
  SBMain.SimpleText := 'Connected clients: ' +IntToStr(fConnectedClients);
  finally
  CS.Release;
  end;
end;

procedure TfrmServer.IdTCPServerDisconnect(AThread: TIdPeerThread);
begin
CS.Acquire;
  try
  dec(fConnectedClients);
  SBMain.SimpleText := 'Connected clients: ' +IntToStr(fConnectedClients);
  finally
  CS.Release;
  end;

end;

end.
