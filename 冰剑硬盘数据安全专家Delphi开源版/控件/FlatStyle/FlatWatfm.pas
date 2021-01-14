unit FlatWatfm;

interface

{$I FlatStyle.inc}

uses
  Windows, Messages, Forms, SysUtils, Dialogs, FlatUtils, FlatCtrls,
  FlatBoxs, StdCtrls, Controls, Graphics, Classes, FlatBtns;

type
  TWaterForm = class(TForm)
    WaterList: TFlatListBox;
    SaveBtn: TFlatButton;
    CancelBtn: TFlatButton;
    TitleEdit: TFlatEdit;
    FWater: TFontDialog;
    FontBtn: TFlatButton;
    RowEdit: TFlatInteger;
    Draw3D: TFlatCheckBox;
    FlatWater: TFlatWater;
    EditBtn: TFlatButton;
    AddBtn: TFlatButton;
    WaterPage: TFlatImage;
    ClearBtn: TFlatButton;
    procedure WaterListChange(Sender: TObject; Text: TCaption);
    procedure FontBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
  private
    { Private declarations }
    FParam: TOtherParam;
    function GetClickParam: String;
  public
    { Public declarations }
  end;

var
  WaterForm: TWaterForm;

implementation

{$R *.dfm}

procedure TWaterForm.WaterListChange(Sender: TObject; Text: TCaption);
var
  TitleValue : String;
begin
  TitleValue := Text;
  GetTitleParam(FParam, TitleValue);
  TitleEdit.Text    := TitleValue;
  Draw3D.Checked    := FParam.Draw3D;
  RowEdit.Value     := FParam.Row;
end;

procedure TWaterForm.FontBtnClick(Sender: TObject);
begin
  FWater.Font.Name  := FParam.Name;
  FWater.Font.Size  := FParam.Size;
  FWater.Font.Style := FParam.Style;
  FWater.Font.Color := FParam.Color;
  FWater.Font.Pitch := FParam.Pitch;
  if FWater.Execute then
  begin
    FParam.Name  := FWater.Font.Name;
    FParam.Size  := FWater.Font.Size;
    FParam.Style := FWater.Font.Style;
    FParam.Color := FWater.Font.Color;
    FParam.Pitch := FWater.Font.Pitch;
  end;
end;

function SetStyle(Value:TFontStyles):String;
begin
 result := '';
 if fsBold in Value then
    result := '0';
 if fsItalic in Value then
    result := result + ',1';
 if fsUnderline in Value then
    result := result + ',2';
 if fsStrikeOut in Value then
    result := result + ',3';
end;

function SetPitch(Value:TFontPitch):word;
begin
 result := 0;
 case Value of
  fpVariable:result := 1;
     fpFixed:result := 2;
 end;
end;

function  TWaterForm.GetClickParam:String;
begin
   FParam.Row    := RowEdit.Value;
   FParam.Draw3D := Draw3D.Checked;
   Result:= Format(TitleStart  + '%s'  + TitleEnd +
                   TitleSize   + '%d]' +
                   TitleName   + '%s]' +
                   TitleStyle  + '%s]' +
                   TitleColor  + '%d]' +
                   TitleLow    + '%d]' +
                   TitlePitch  + '%d]' +
                   TitleDraw3D + '%d]',
                   [TitleEdit.Text,
                    FParam.Size,
                    FParam.Name,
                    SetStyle(FParam.Style),
                    TColor(FParam.Color),
                    FParam.Row,
                    SetPitch(FParam.Pitch),
                    Ord(FParam.Draw3D)]);
end;

procedure TWaterForm.AddBtnClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar('你想添加到列表吗?'),PChar('添加'),
                MB_ICONINFORMATION+MB_YESNO)=mrYes then
  begin
     WaterList.Items.Add(GetClickParam);
     FlatWater.Items.Assign(WaterList.Items);
  end;
end;

procedure TWaterForm.EditBtnClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar('你想编辑到列表吗?'),PChar('编辑'),
                MB_ICONINFORMATION+MB_YESNO)=mrYes then
  begin
     WaterList.Items.Strings[WaterList.ItemIndex] :=GetClickParam;
     FlatWater.Items.Assign(WaterList.Items);
  end;
end;

procedure TWaterForm.ClearBtnClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar('你想清除列表吗?'),PChar('清除'),
                MB_ICONINFORMATION+MB_YESNO)=mrYes then
  begin
     WaterList.Items.Clear;
     FlatWater.Items.Clear;
  end;
end;

end.
