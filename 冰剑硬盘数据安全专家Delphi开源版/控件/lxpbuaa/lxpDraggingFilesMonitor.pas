unit lxpDraggingFilesMonitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls;

type
  TDropFilesEvent = procedure(Receiver: TWinControl; const FileNames: TStrings;
    const FilesCount: Integer; const DropPoint: TPoint) of object;

  TlxpDraggingFilesMonitor = class(TComponent)
  private
    FAcceptFilesControl: TWinControl;
    OldWindowProc: TWndMethod;
    FFilesName: TStrings;
    FOnDropFiles: TDropFilesEvent;
    procedure NewWindowProc(var Message: TMessage);
    procedure SetAcceptFilesControl(const Value: TWinControl);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AcceptFilesControl: TWinControl read FAcceptFilesControl write SetAcceptFilesControl;
    property OnDropFiles: TDropFilesEvent read FOnDropFiles write FOnDropFiles;
  end;

procedure Register;

implementation

uses ShellAPI;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpDraggingFilesMonitor]);
end;

{ TlxpDraggingFilesMonitor }

constructor TlxpDraggingFilesMonitor.Create(AOwner: TComponent);
begin
  inherited;
  FFilesName := TStringList.Create;
end;

destructor TlxpDraggingFilesMonitor.Destroy;
begin
  if Assigned(FAcceptFilesControl) then
    DragAcceptFiles(FAcceptFilesControl.Handle, False);
  FreeAndNil(FFilesName);
  inherited;
end;

procedure TlxpDraggingFilesMonitor.NewWindowProc(var Message: TMessage);
var
  Count, Index, hDrop: Integer;
  PFileName: PChar;
  P: TPoint;
begin
  if Message.Msg = WM_DROPFILES then
  begin
    hDrop := Message.WParam;
    FFilesName.Clear;
    GetMem(PFileName, MAX_PATH);
    Count := DragQueryFile(hDrop, MAXDWORD, PFileName, MAX_PATH-1);
    for Index := 0 to Count-1 do
    begin
      DragQueryFile(hDrop, Index, PFileName, MAXBYTE);
      FFilesName.Add(PFileName);
    end;
    DragQueryPoint(hDrop, P);

    if Assigned(FOnDropFiles) then
      FOnDropFiles(FAcceptFilesControl, FFilesName, Count, P);

    FreeMem(PFileName);
    DragFinish(hDrop);
  end else OldWindowProc(Message);
end;

procedure TlxpDraggingFilesMonitor.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent = FAcceptFilesControl) and (Operation = opRemove) then
    FAcceptFilesControl := nil;
end;

procedure TlxpDraggingFilesMonitor.SetAcceptFilesControl(
  const Value: TWinControl);
begin
  if FAcceptFilesControl <> Value then
  begin
    if Assigned(Value) and (not (csDesigning in ComponentState)) then
    begin
      DragAcceptFiles(Value.Handle, True);
      OldWindowProc := Value.WindowProc;
      Value.WindowProc := NewWindowProc;
    end;
    FAcceptFilesControl := Value;
    if FAcceptFilesControl <> nil then
      FAcceptFilesControl.FreeNotification(Self);
  end;
end;

end.

