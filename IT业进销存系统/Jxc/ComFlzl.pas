unit ComFlzl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, DBCtrls, StdCtrls, Menus, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids,Db, ActnList;

type
  TfrmComFlzl = class(TfrmComJbzl)
    CheckBox1: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    aViewMode: TAction;
    aSetViewMode: TAction;
    mnuViewMode: TMenuItem;
    mnuSetViewMode: TMenuItem;
    LineE3: TMenuItem;
    procedure FormCreate(Sender: TObject);override;
    procedure DBLookupComboBox1CloseUp(Sender: TObject);virtual;
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);virtual;
    procedure DBLookupComboBox1Enter(Sender: TObject);virtual;
    procedure aViewModeExecute(Sender: TObject);virtual;
    procedure aSetViewModeExecute(Sender: TObject);virtual;
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dcLb:TDataSource;
  end;

var
  frmComFlzl: TfrmComFlzl;

implementation

uses Dm;

{$R *.DFM}

//Form.Create
procedure TfrmComFlzl.FormCreate(Sender: TObject);
begin
  inherited;
  If DBLookupComboBox1.ListSource <> nil then
    with DBLookupComboBox1.ListSource.DataSet do
    begin
      Open;
      First;
      if not IsEmpty Then
        DBLookupComboBox1.KeyValue := FieldByName(DBLookupComboBox1.KeyField).Value;
    end;
end;

//aViewMode.Execute
procedure TfrmComFlzl.aViewModeExecute(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox1.Checked;
  aViewMode.Checked := CheckBox1.Checked;
end;

//CheckBox1.Click
procedure TfrmComFlzl.CheckBox1Click(Sender: TObject);
begin
  aViewMode.Checked := CheckBox1.Checked;
  aSetViewMode.Enabled := CheckBox1.Checked;
  DBLookupComboBox1.Enabled := CheckBox1.Checked;
  if CheckBox1.Checked then
  begin
    DBLookupComboBox1.ListSource := dcLb;
    if not dcLb.DataSet.Active then
      dcLb.DataSet.Open
  end
  else
  begin
    dcLb := DBLookupComboBox1.ListSource;
    DBLookupComboBox1.ListSource := nil;
  end;
  OpenDataSet;
  DBGrid1.SetFocus;
end;

//aSetViewMode.Execute
procedure TfrmComFlzl.aSetViewModeExecute(Sender: TObject);
begin
  if DBLookupComboBox1.Enabled then
  begin
    DBLookupComboBox1.SetFocus;
    DBLookupComboBox1.DropDown;
  end;
end;

//DBLookupComboBox1.Enter
procedure TfrmComFlzl.DBLookupComboBox1Enter(Sender: TObject);
begin
  aModify.ShortCut := 0;
end;

//DBLookupComboBox1.CloseUp
procedure TfrmComFlzl.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  aModify.ShortCut := VK_RETURN;
  if dsJbzl <> nil then
    OpenDataSet;
  DBGrid1.SetFocus;
end;

//DBLookupComboBox1.KeyDown
procedure TfrmComFlzl.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_RETURN then
  begin
    Key := 0;
    DBLookupComboBox1CloseUp(nil);
  end;
end;

end.
