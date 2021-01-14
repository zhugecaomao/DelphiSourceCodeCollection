unit Comp_NonePubProps;

interface

uses
  Windows, Messages, SysUtils, Classes;

type
  TComp_NonePubProps = class(TComponent)
  private
    FStr: String;
    FStrm: TMemoryStream;
    procedure ReadStrData(Reader: TReader);
    procedure WriteStrData(Writer: TWriter);
    procedure ReadStrmData(Stream: TStream);
    procedure WriteStrmData(Stream: TStream);
  protected
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Play;    
  end;


procedure Register;

implementation

uses MMSystem;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TComp_NonePubProps]);
end;

{ TComp_NonePubProps }
constructor TComp_NonePubProps.Create(AOwner: TComponent);
begin
  inherited;
  FStr := 'FStr';
  FStrm := TMemoryStream.Create;
  //文件路径请你根据情况指定
  FStrm.LoadFromFile('G:\工作\Delphi精要\源代码\S_16_44.WAV');
end;

destructor TComp_NonePubProps.Destroy;
begin
  FreeAndNil(FStrm);
  inherited;
end;

procedure TComp_NonePubProps.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('StrProp', ReadStrData, WriteStrData, FStr<>'');
  Filer.DefineBinaryProperty('StrmProp', ReadStrmData, WriteStrmData, FStrm.Size <> 0);
end;

procedure TComp_NonePubProps.ReadStrData(Reader: TReader);
begin
  FStr := Reader.ReadString;
end;

procedure TComp_NonePubProps.WriteStrData(Writer: TWriter);
begin
  Writer.WriteString(FStr);
end;

procedure TComp_NonePubProps.ReadStrmData(Stream: TStream);
begin
  Stream.Position := 0;
  FStrm.CopyFrom(Stream, Stream.Size);
end;         

procedure TComp_NonePubProps.WriteStrmData(Stream: TStream);
begin
  FStrm.Position := 0;
  Stream.CopyFrom(FStrm, FStrm.Size);
end;


procedure TComp_NonePubProps.Play;
var
  P: Pointer;
begin
  if (FStrm <> nil) and (FStrm.Size <> 0) then
  begin
    GetMem(P, FStrm.Size);
    FStrm.Position := 0;
    FStrm.Read(P^, FStrm.Size);
    PlaySound(P, 0 , SND_MEMORY);
    FreeMem(P);
  end;   
end;



end.
