unit CSQueryPlgModGrp;

interface

uses
  Classes, CSBplPlugin;

type
  TCSQueryPlgModGrp = class(TObject)
  private
    Fc_List: TStrings;
    function GetPlgMods(Ai_Index: Integer): TCSBplPluginModule;
    function GetPoints(Ai_Index: Integer): Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(Ac_PlgMod: TCSBplPluginModule;
      const Ai_Point: Integer): Integer;
    property PlgMods[Ai_Index: Integer]: TCSBplPluginModule read GetPlgMods;
    property Points[Ai_Index: Integer]: Integer read GetPoints;
  end;

implementation

uses
  SysUtils;
  
{ TCSQueryPlgModGrp }

function TCSQueryPlgModGrp.Add(Ac_PlgMod: TCSBplPluginModule;
  const Ai_Point: Integer): Integer;
begin
  Result := Fc_List.AddObject(IntToStr(Ai_Point), Ac_PlgMod);
end;

constructor TCSQueryPlgModGrp.Create;
begin
  Fc_List := TStringList.Create;
end;

destructor TCSQueryPlgModGrp.Destroy;
begin
  Fc_List.Free;
  
  inherited;
end;

function TCSQueryPlgModGrp.GetPlgMods(
  Ai_Index: Integer): TCSBplPluginModule;
begin
  Result := TCSBplPluginModule(Fc_List.Objects[Ai_Index]);
end;

function TCSQueryPlgModGrp.GetPoints(Ai_Index: Integer): Integer;
begin
  Result := StrToInt(Fc_List.Strings[Ai_Index]);
end;

end.
 