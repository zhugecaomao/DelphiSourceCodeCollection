unit ComLbzl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, ActnList, Menus, ComCtrls, DBCtrls, ToolWin, ExtCtrls, StdCtrls,
  Grids, DBGrids, db, IniFiles;

type
  TfrmComLbzl = class(TfrmComJbzl)
    pnlList: TPanel;
    Splitter1: TSplitter;
    StringGrid1: TStringGrid;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    aList: TAction;
    N3: TMenuItem;
    mnuList: TMenuItem;
    N6: TMenuItem;
    pmnList: TMenuItem;
    procedure FormShow(Sender: TObject);override;
    procedure dsAfterScroll(DataSet: TDataSet);override;
    procedure pnlListResize(Sender: TObject);virtual;
    procedure aListExecute(Sender: TObject);virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
    procedure aModifyExecute(Sender: TObject);override;
    procedure aNewExecute(Sender: TObject);override;
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure aRefreshExecute(Sender: TObject);override;
    procedure aSearchExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComLbzl: TfrmComLbzl;

implementation

uses Main;

{$R *.DFM}

//Form.Show
procedure TfrmComLbzl.FormShow(Sender: TObject);
var
  i: integer;
  iniPos: TIniFile;
begin
  inherited;
  //StringGrid
  with StringGrid1 do
  begin
    ColWidths[0] := 0;
    RowCount := DBGrid1.Columns.Count;
    for i := 0 to DBGrid1.Columns.Count - 1 do
    begin
      Cells[0, i] := DBGrid1.Columns[i].FieldName;
      Cells[1, i] := DBGrid1.Columns[i].Title.Caption;
      if (self.Canvas.TextWidth(Cells[1, i]) + 8) > ColWidths[1] then
        ColWidths[1] := self.Canvas.TextWidth(Cells[1, i]) + 8;
    end;
  end;
  //Pos
  iniPos := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\Lbzl.ini');
  with iniPos do
  begin
    pnlList.Width := ReadInteger(FormatFloat('0000', pintUserID) + self.Name, 'Width', screen.Width div 2);
    StringGrid1.TopRow := ReadInteger(FormatFloat('0000', pintUserID) + self.Name, 'TopRow', 0);
    aList.Checked := ReadBool(FormatFloat('0000', pintUserID) + self.Name, 'Show', aList.Checked);
    Free;
  end;
  //Scroll
  if aList.Checked then
    dsAfterScroll(dsJbzl)
  else
    pnlList.Visible := aList.Checked;
end;

//Form.Close
procedure TfrmComLbzl.FormClose(Sender: TObject; var Action: TCloseAction);
var
  iniPos: TIniFile;
begin
  inherited;
  //Pos
  iniPos := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\Lbzl.ini');
  with iniPos do
  begin
    WriteInteger(FormatFloat('0000', pintUserID) + self.Name, 'Width', pnlList.Width);
    WriteInteger(FormatFloat('0000', pintUserID) + self.Name, 'TopRow', StringGrid1.TopRow);
    WriteBool(FormatFloat('0000', pintUserID) + self.Name, 'Show', aList.Checked);
  end;
end;

//dsAfterScroll
procedure TfrmComLbzl.dsAfterScroll(DataSet: TDataSet);
var
  i: integer;
begin
  inherited;
  if not aList.Checked or (StringGrid1.Cells[0, 0] = '') then exit;
  with StringGrid1 do
    for i := 0 to RowCount - 1 do
    begin
      Cells[2, i] := DBGrid1.DataSource.DataSet.FieldByName(Cells[0, i]).DisplayText;
    end;
end;

//pnlList.Resize
procedure TfrmComLbzl.pnlListResize(Sender: TObject);
begin
  StringGrid1.ColWidths[2] := StringGrid1.Width - StringGrid1.ColWidths[1] - 28;
end;

//aList.Execute
procedure TfrmComLbzl.aListExecute(Sender: TObject);
begin
  aList.Checked := not aList.Checked;
  pnlList.Visible := aList.Checked;
  if aList.Checked then
    dsAfterScroll(dsJbzl);
  Splitter1.Visible := aList.Checked;
end;

//aModify.Execute
procedure TfrmComLbzl.aModifyExecute(Sender: TObject);
begin
  inherited;
  if aList.Checked then
    dsAfterScroll(dsJbzl);
end;

procedure TfrmComLbzl.aNewExecute(Sender: TObject);
begin
  inherited;
  if aList.Checked then
    dsAfterScroll(dsJbzl);
end;

procedure TfrmComLbzl.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
    if aList.Checked then
      dsAfterScroll(dsJbzl);
end;

procedure TfrmComLbzl.aRefreshExecute(Sender: TObject);
begin
  inherited;
  if aList.Checked then
    dsAfterScroll(dsJbzl);
end;

procedure TfrmComLbzl.aSearchExecute(Sender: TObject);
begin
  inherited;
  dsAfterScroll(nil);
end;

end.
