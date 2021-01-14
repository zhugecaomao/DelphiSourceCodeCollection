unit FlatEditor;

interface

{$I FlatStyle.inc}

uses
{$IFDEF DELPHI_6_UP}
  DesignIntf, DesignEditors,
{$ELSE}
  DsgnIntf,
{$ENDIF}
  Classes, MaskUtils, SysUtils, Controls, Forms,
  TypInfo;

procedure Register;

implementation

uses
  FlatAttrib, FlatVersion, FlatUtils, FlatCtrls, FlatWatfm, FlatExcel;

{ TWaterEditor }
type TWaterEditor = class(TStringProperty)
     public
       procedure Edit; override;
       function GetValue: string; override;
       function GetWater: TDefineWater;
       function GetAttributes: TPropertyAttributes; override;
       property Water: TDefineWater read GetWater;
     end;

procedure TWaterEditor.Edit;
begin
  with TWaterForm.Create(WaterForm) do
 begin
  try
   WaterList.Items.Assign(Water.Items);
   FlatWater.Items.Assign(Water.Items);
   ShowModal;
   if ModalResult = mrOk then
   begin
      Water.Items.Assign(WaterList.Items);
      TWaterEditor(self).Designer.Modified;
   end;
  finally
   Free;
  end;
 end;
end;

function TWaterEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TWaterEditor.GetValue: string;
begin
  Result := '(Editor)';
end;

function TWaterEditor.GetWater: TDefineWater;
begin
  result := (GetComponent(0) as TDefineWater);
end;

{ TMaskEditor }
type TMaskEditor = class(TStringProperty)
     public
      procedure Edit; override;
      function GetValue: string; override;
      function GetMask: TDefineMask;
      function GetAttributes: TPropertyAttributes; override;
      property Mask: TDefineMask read GetMask;
     end;
function TMaskEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TMaskEditor.GetValue: string;
begin
  Result := Mask.Text;
end;

function TMaskEditor.GetMask: TDefineMask;
begin
  result := (GetComponent(0) as TDefineMask);
end;

procedure TMaskEditor.Edit;
begin
 with TMaskForm.Create(MaskForm) do
 begin
  try
   Font.Assign(Screen.MenuFont);
   EditText.EditMask := Mask.EditMask;
   EditText.Text     := Mask.Text;
   if Mask.EditMask <> '' then
      EditMask.Text := Mask.EditMask;
   ShowModal;
   if ModalResult = mrOk then
   begin
      Mask.Text := EditText.Text;
      TMaskEditor(Self).Designer.Modified;
   end;
  finally
   Free;
  end;
 end;
end;

{ TVersionEditor }

type TVersionEditor = class(TPropertyEditor)
     private
       function GetGropName: TComponent;
     public
       procedure Edit; override;
       function GetValue: string; override;
       function GetAttributes: TPropertyAttributes; override;
       property GropName:TComponent read GetGropName;
     end;

procedure TVersionEditor.Edit;
const
  AboutStr = '1.Information:'+#13+
             'Control: %s'+#13+
             'Version: %s'+#13+
             'In unit: %s.pas'+#13#13+
             '2.Packages:'+#13+
             'Version: %s'+#13+
             'Copyright: ? 1998-2007'+#13+
             'Platform: DELPHI7'+#13#13+
             '3.Update:'+#13+
             'This version by comerose update.';
var
  vName,vUnit:String;
  vInfo: PTypeData;
begin
 with TVersionForm.Create(VersionForm) do
 begin
  try
   Font.Assign(Screen.MenuFont);
   Caption := 'About FlatStyle';
   if GropName <> nil then
   begin
      vInfo := GetTypeData(PTypeInfo(GropName.ClassInfo));
      vName := GropName.ClassName;
      vUnit := vInfo.UnitName;
   end
   else
      vName := 'Unkown class';
   About.Caption := format(AboutStr,[vName,FileVersion,vUnit,FileVersion]);
   Height        := About.Top*2  + About.Height + OkBtn.Height*3;
   Width         := About.Left*2 + About.Width;
   OkBtn.Top     := About.Height + OkBtn.Height;
   OkBtn.Left    := (Width-OkBtn.Width) div 2;
   ShowModal;
  finally
   Free;
  end;
 end;
end;

function TVersionEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TVersionEditor.GetGropName: TComponent;
var
  Vers:TPersistent;
begin
  Vers := GetComponent(0);
  if Vers is TVersionEdit then
     result := TVersionEdit(Vers)
  else
  if Vers is TVersionComboBox then
     result := TVersionComboBox(Vers)
  else
  if Vers is TVersionControl then
     result := TVersionControl(Vers)
  else
  if Vers is TVersionGraphic then
     result := TVersionGraphic(Vers)
  else
  if Vers is TVersionTreeView then
     result := TVersionTreeView(Vers)
  else
  if Vers is TVersionListView then
     result := TVersionListView(Vers)
  else
  if Vers is TVersionComponent then
     result := TVersionComponent(Vers)
  else
  if Vers is TVersionMemo then
     result := TVersionMemo(Vers)
  else
     result := nil;
end;

function TVersionEditor.GetValue: string;
begin
  result := FileVersion;
end;

type
 TExcelEditor = class(TDefaultEditor)
  private
    function GetDefineExcel: TDefineExcel;
  public
    procedure ExecuteVerb(index: Integer);  override;
    function GetVerb(index: Integer): String;  override;
    function GetVerbCount: Integer;  override;
    property Excel:TDefineExcel read GetDefineExcel;
  end;

procedure TExcelEditor.ExecuteVerb(index: Integer);
begin
  case index of
   0: Excel.InitFields;
   1: Excel.RestoreFields;
   2: Excel.ClearFields;
  end;
  TExcelEditor(self).Designer.Modified;
end;

function TExcelEditor.GetDefineExcel: TDefineExcel;
begin
  result := (Component as TDefineExcel);
end;

function TExcelEditor.GetVerb(index: Integer): String;
begin
  case index of
    0: result := 'Add all Fields';
    1: result := 'Restore Fields';
    2: result := 'Clear all Fields';
  end;
end;

function TExcelEditor.GetVerbCount: Integer;
begin
   result := 3;
end;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TMaskedText), TDefineMask,  'Text',    TMaskEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionEdit,      'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionMemo,      'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionComboBox,  'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionControl,   'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionGraphic,   'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionTreeView,  'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionListView,  'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(String), TVersionComponent, 'Version', TVersionEditor);
  RegisterPropertyEditor(TypeInfo(TStringList), TDefineWater, 'Items',   TWaterEditor);
  RegisterComponentEditor(TDefineExcel, TExcelEditor);
end;



end.
