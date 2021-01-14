unit C_ComBuf;

interface

uses
  Classes, C_JfDefine;

type
  TComBufThread = class(TThread)
  private
    { Private declarations }
    procedure ComBufWork;
  protected
    procedure Execute; override;
  public
    constructor Create;
  end;


implementation

uses C_JfMain;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TComBufThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TComBufThread }

constructor TComBufThread.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
end;

procedure TComBufThread.ComBufWork;
begin
  if MoveData then
  begin
    ReadData;
    WriteData;
  end;
end;

procedure TComBufThread.Execute;
begin
  { Place thread code here }
  while not Terminated do
    Synchronize(ComBufWork);
end;

end.
