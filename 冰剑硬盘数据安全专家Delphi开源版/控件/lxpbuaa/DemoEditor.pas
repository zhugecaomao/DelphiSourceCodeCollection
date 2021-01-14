unit DemoEditor;

interface

uses
  Classes, DesignEditors, DesignIntf;

type
  TFilePathName = type String;
  TTestEditor = class(TComponent)
  private
    FFilePathName: TFilePathName;
  published
    property FilePathName: TFilePathName read FFilePathName write FFilePathName;
  end;

  TFilePathNameEditor = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TOneComponentEditor = class(TComponentEditor)
  public
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;



procedure Register;

implementation

uses Dialogs;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TTestEditor]);
  RegisterPropertyEditor(TypeInfo(TFilePathName), nil, '', TFilePathNameEditor);
  RegisterComponentEditor(TTestEditor, TComponentEditor);
end;

{ TFilePathNameEditor }
function TFilePathNameEditor.GetAttributes: TPropertyAttributes;
begin
  inherited GetAttributes;
  Result := [paDialog];
end;

procedure TFilePathNameEditor.Edit;
begin
  inherited;
  with TOpenDialog.Create(nil) do
  begin
    if Execute then
      Value := FileName;
    Free;
  end;
end;


{ TOneComponentEditor }
procedure TOneComponentEditor.ExecuteVerb(Index: Integer);
var
  S: String;
  I: Integer;
begin
  inherited;
  with Component as TTestEditor do
  begin
    S := FilePathName + ';' + Name;
    S := InputBox('输入框', '请输入FilePathName、Name属性值，用;隔开', S);
    I := Pos(';', S);
    FilePathName := System.Copy(S, 1, I-1);
    Name := System.Copy(S, I+1, Length(S));
  end;
  Designer.Modified;
end;

function TOneComponentEditor.GetVerb(Index: Integer): string;
begin
  Result := '组件编辑器';
end;

function TOneComponentEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;


end.
