{***************************************************************
 *
 * Project  : Client
 * Unit Name: fClient
 * Purpose  : Demonstrates thin client data retrival
 * Version  : 1.0
 * Date     : Fri 20 Apr 2001  -  23:35:21
 * Author   : Allen O'Neill <allen_oneill@hotmail.com>
 * History  :
 *
 * Notes    : ## IMPORTANT ## - This demo requires TKBMMemTable to operate
 *
 ****************************************************************}

unit fClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, kbmMemTable, DBCtrls, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  kbmMemBinaryStreamFormat;

type
  TfrmClient = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnExit: TButton;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel5: TPanel;
    lstFields: TListBox;
    Panel4: TPanel;
    Panel6: TPanel;
    lstAliases: TListBox;
    Panel7: TPanel;
    Panel8: TPanel;
    lstTables: TListBox;
    Splitter3: TSplitter;
    tblAliases: TkbmMemTable;
    tblResultData: TkbmMemTable;
    dsResultData: TDataSource;
    IdTCPClient: TIdTCPClient;
    tblTables: TkbmMemTable;
    tblFields: TkbmMemTable;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel9: TPanel;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Panel10: TPanel;
    mmoSQL: TMemo;
    grdResultsData: TDBGrid;
    Panel11: TPanel;
    Panel12: TPanel;
    DBNavigator: TDBNavigator;
    btnGetMetaData: TButton;
    btnGetSQL: TButton;
    SBMain: TScrollBox;
    mmoNotes: TMemo;
    kbmBinaryStreamFormat1: TkbmBinaryStreamFormat;
    procedure btnExitClick(Sender: TObject);
    procedure btnGetMetaDataClick(Sender: TObject);
    procedure lstAliasesClick(Sender: TObject);
    procedure lstTablesClick(Sender: TObject);
    procedure btnGetSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  iTop, iMaxWidth : integer;
  AStream : TMemoryStream;
  Procedure BuildSQL;
  procedure CloseResultsData;
  procedure BuildRecordView;
  procedure DrawField(AType : String; iField : Integer);
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.DFM}

procedure TfrmClient.btnExitClick(Sender: TObject);
begin
application.terminate;
end;

procedure TfrmClient.btnGetMetaDataClick(Sender: TObject);
begin
try
CloseResultsData;
with IdTCPClient do
  begin
  // Get aliases
  Connect;
  WriteLn('ALA:GET:');
  AStream := TMemoryStream.Create;
  ReadStream(AStream,-1,true);
  AStream.Position := 0;
  lstAliases.Clear;
  with tblAliases do
    begin
    close;
    active := true;
    EmptyTable;
    LoadFromStream(AStream);
    Open; First;
    while not EOF do
      begin
      lstAliases.Items.Append(FieldByName('tmpField').AsString);
      Next;
      end;
    Active := false;
    end;
  // Get Tables for first alias item
  lstAliases.ItemIndex := 0;
  lstAliasesClick(sender);
  FreeAndNil(AStream);
  end;
except
on E : Exception do
ShowMessage(E.Message);
End;

end;


procedure TfrmClient.lstAliasesClick(Sender: TObject);
begin
CloseResultsData;
try
with IdTCPClient do
  begin
  // Get tables
  Connect;
  WriteLn('TBL:ALL:' + trim(lstAliases.Items.Strings[lstAliases.ItemIndex]));
  AStream := TMemoryStream.Create;
  ReadStream(AStream,-1,true);
  AStream.Position := 0;
  lstTables.Clear;
  with tblTables do
    begin
    active := false;
    active := true;
    EmptyTable;
    LoadFromStream(AStream);
    Open;
    while not EOF do
      begin
      lstTables.Items.Append(Fields[0].AsString);
      Next;
      end;
    Active := false;
    end;
  // Get fields for first table item
  lstTables.ItemIndex := 0;
  lstTablesClick(sender);
  FreeAndNil(AStream);
  end;
except
on E : Exception do
ShowMessage(E.Message);
End;
end;

procedure TfrmClient.lstTablesClick(Sender: TObject);
begin
CloseResultsData;
try
with IdTCPClient do
  begin
  // Get fields
  Connect;
  WriteLn('TBL:GET:' + trim(lstAliases.Items.Strings[lstAliases.ItemIndex])
          + ':'
          + lstTables.Items.Strings[lstTables.ItemIndex]);

  AStream := TMemoryStream.Create;
  ReadStream(AStream,-1,true);
  AStream.Position := 0;
  lstFields.Clear;
  with tblFields do
    begin
    active := false;
    active := true;
    EmptyTable;
    LoadFromStream(AStream);
    Open;
    while not EOF do
      begin
      lstFields.Items.Append(Fields[0].AsString);
      Next;
      end;
    Active := false;
    end;
  // build SQL for first item
  lstFields.ItemIndex := 0;
  BuildSQL;
  FreeAndNil(AStream);
  end;
except
on E : Exception do
ShowMessage(E.Message);
End;

end;

procedure TfrmClient.BuildSQL;
var
  i : integer;
  s : string;
begin
CloseResultsData;
mmoSQL.Clear;
s := 'Select ';
for i := 0 to lstFields.items.count -2 do
  s := s + #32 + lstFields.Items[i] + ',';
s := s + #32 + lstFields.Items[lstFields.items.count -1];
s:= s + ' from ' + lstTables.Items[lstTables.ItemIndex];
mmoSQL.Lines.append(s);
end;


procedure TfrmClient.btnGetSQLClick(Sender: TObject);
begin
CloseResultsData;
with IdTCPClient do
  begin
  // Get fields
  Connect;
  WriteLn('SQL:GET:' + lstAliases.Items[lstAliases.ItemIndex] +':' + mmoSQL.text);
  AStream := TMemoryStream.Create;
  ReadStream(AStream,-1,true);
  AStream.Position := 0;
  lstFields.Clear;
  with tblResultData do
    begin
    Close;
    active := true;
    LoadFromStream(AStream);
    Open;
    end;
  FreeAndNil(AStream);
  end;
BuildRecordView;
end;


procedure TfrmClient.CloseResultsData;
begin
tblResultData.close;

end;

procedure TfrmClient.BuildRecordView;
var
  i : integer;
begin

iTop := 10;
iMaxWidth := 0;

for i := 0 to tblResultData.FieldCount - 1 do
  if (length(tblResultData.fields[i].AsString)) > iMaxWidth then
  iMaxWidth := (length(trim(tblResultData.fields[i].AsString))*10);

for i := 0 to tblResultData.FieldCount - 1 do
  begin
  case tblResultData.fields[i].DataType of
  ftUnknown   : DrawField('Unknown',i);
  ftString    : DrawField('Edit',i);
  ftSmallint  : DrawField('Edit',i);
  ftInteger   : DrawField('Edit',i);
  ftWord      : DrawField('Edit',i);
  ftBoolean   : DrawField('Edit',i);
  ftFloat     : DrawField('Edit',i);
  ftCurrency  : DrawField('Edit',i);
  ftDate      : DrawField('Edit',i);
  ftTime      : DrawField('Edit',i);
  ftDateTime  : DrawField('Edit',i);
  ftAutoInc   : DrawField('Edit',i);
  ftBlob      : DrawField('Unknown',i);
  ftMemo      : DrawField('Memo',i);
  ftGraphic   : DrawField('Image',i);
  end;

  end;

end;

procedure TfrmClient.DrawField(AType: String; iField: Integer);
var
  dbEdit : TDBEdit;
  dbMemo : TDBMemo;
  dbImage: TDBImage;
begin
AType := UpperCase(AType);

if AType = 'UNKNOWN' then
  begin

  end
else
if AType = 'EDIT' then
  begin
  dbEdit := TDBEdit.Create(SBMain);
  with dbEdit do
    begin
    Left := 10;
    Top := iTop + 10;
    Width := iMaxWidth;
    iTop := iTop + Height + 20;
    Parent := SBMain;
    DataSource := dsResultData;
    DataField := tblResultData.fields[iField].FieldName;
    end;
  end
else
if AType = 'MEMO' then
  begin
  dbMemo := TDBMemo.Create(SBMain);
  with dbMemo do
    begin
    Left := 10;
    Top := iTop + 10;
    Width := iMaxWidth;
    Height := 100;
    iTop := iTop + Height + 20;
    Parent := SBMain;
    DataSource := dsResultData;
    DataField := tblResultData.fields[iField].FieldName;
    end;
  end
else
if AType = 'IMAGE' then
  begin
  dbImage := TDBImage.Create(SBMain);
  with dbImage do
    begin
    Left := 10;
    Top := iTop + 10;
    Width :=  iMaxWidth;
    Height := 100;
    iTop := iTop + Height + 20;
    Parent := SBMain;
    DataSource := dsResultData;
    DataField := tblResultData.fields[iField].FieldName;
    end;
  end;

end;

end.
