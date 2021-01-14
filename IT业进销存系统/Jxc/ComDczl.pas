unit ComDczl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, ActnList, Menus, ComCtrls, DBCtrls, ToolWin, ExtCtrls, StdCtrls,
  Grids, DBGrids, DB, IniFiles, DBClient, Imm;

type
  TfrmComDczl = class(TfrmComJbzl)
    Splitter1: TSplitter;
    pnlDetail: TPanel;
    DBGrid2: TDBGrid;
    aDetail: TAction;
    LineE4: TMenuItem;
    smnDetail: TMenuItem;
    N6: TMenuItem;
    pmnDetail: TMenuItem;
    btnDetail: TToolButton;
    ToolButton2: TToolButton;
    procedure FormShow(Sender: TObject);override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
    procedure DBGrid1Enter(Sender: TObject);virtual;
    procedure DBGrid1Exit(Sender: TObject);virtual;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);virtual;
    procedure dsAfterOpen(DataSet: TDataSet);virtual;
    procedure LoadEditForm(strState:string);override;
    procedure aDetailExecute(Sender: TObject);virtual;
    procedure aDelExecute(Sender: TObject);override;
    procedure SetButton;override;
  private
    { Private declarations }
  public
    { Public declarations }
    iniPos : TIniFile;
    dbgCur: TDBGrid;
  end;

var
  frmComDczl: TfrmComDczl;

implementation

uses Common, Main, Dm, SetSort;

{$R *.DFM}

procedure TfrmComDczl.FormShow(Sender: TObject);
var
  i: integer;
begin
  iniPos := TiniFile.Create( ExtractFilePath(Application.ExeName) + 'Column\' +
          FormatFloat('0000', pintUserID) + self.Name + '.ini');
  for i := 0 to self.ComponentCount - 1 do
  begin
    if (self.Components[i] is TPanel) or (self.Components[i] is TDBGrid) then
    begin
      TWinControl(self.Components[i]).Left :=
        iniPos.ReadInteger(self.Components[i].Name, 'Left', TWinControl(self.Components[i]).Left);
      TWinControl(self.Components[i]).Top :=
        iniPos.ReadInteger(self.Components[i].Name, 'Top', TWinControl(self.Components[i]).Top);
      TWinControl(self.Components[i]).Width :=
        iniPos.ReadInteger(self.Components[i].Name, 'Width', TWinControl(self.Components[i]).Width);
      TWinControl(self.Components[i]).Height :=
        iniPos.ReadInteger(self.Components[i].Name, 'Height', TWinControl(self.Components[i]).Height);
    end;
    if self.Components[i] is TDBGrid then
    begin
      TDBGrid(self.Components[i]).DataSource.DataSet.AfterScroll := dsAfterScroll;
      TDBGrid(self.Components[i]).DataSource.DataSet.AfterOpen := dsAfterOpen;
    end;
  end;
  aDetail.Checked := iniPos.ReadBool(FormatFloat('0000', pintUserID) + self.Name, 'Show', aDetail.Checked);
  iniPos.Free;
  pnlDetail.Visible := aDetail.Checked;
  Splitter1.Visible := aDetail.Checked;
  dbgCur := DBGrid1;
  inherited;
  if pnlDetail.Visible then
    DBGrid2.SetFocus;
  DBGrid1.SetFocus;
  dsAfterOpen(DBGrid1.DataSource.DataSet);
end;

procedure TfrmComDczl.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  iniPos := TiniFile.Create( ExtractFilePath(Application.ExeName) + 'Column\' +
          FormatFloat('0000', pintUserID) + self.Name + '.ini');
  for i := 0 to self.ComponentCount - 1 do
  begin
    if (self.Components[i] is TPanel) or (self.Components[i] is TDBGrid) then
    begin
      iniPos.WriteInteger( self.Components[i].Name, 'Left', TWinControl(self.Components[i]).Left );
      iniPos.WriteInteger( self.Components[i].Name, 'Top', TWinControl(self.Components[i]).Top );
      iniPos.WriteInteger( self.Components[i].Name, 'Width', TWinControl(self.Components[i]).Width );
      iniPos.WriteInteger( self.Components[i].Name, 'Height', TWinControl(self.Components[i]).Height );
    end;
    if self.Components[i] is TDBGrid then
    begin
      TDBGrid(self.Components[i]).DataSource.DataSet.Close;
      TDBGrid(self.Components[i]).DataSource.DataSet.AfterScroll := nil;
      TDBGrid(self.Components[i]).DataSource.DataSet.AfterOpen := nil;
    end;
  end;
  iniPos.WriteBool(FormatFloat('0000', pintUserID) + self.Name, 'Show', aDetail.Checked);
  iniPos.Free;
  inherited;
end;

procedure TfrmComDczl.SetButton;
var
  dsJbzl1: TCLientDataSet;
begin
  dsJbzl1 := dsJbzl;
  if (dbgCur <> nil) then
    dsJbzl := TClientDataSet(dbgCur.DataSource.DataSet);
  inherited;
  dsJbzl := dsJbzl1;
end;

//DBGrid
procedure TfrmComDczl.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  dbgCur := TDBGrid(Sender);
  if dbgCur.DataSource = nil then abort;
  //Set Sort
  with Data.Tmp do
  begin
    Close;
    CommandText := 'select * from AppSort ' +
      'where uID = ' + IntToStr(pintUserId) + ' and ' +
      'FormCaption = ''' + self.Name + dbgCur.Name + '''';
    Open;
    if not IsEmpty then
    begin
      labSort.Caption := '排序方式: ' + FieldByName('iCaption').AsString;
      frmSetSort.AddIndexDef(TClientDataSet(dbgCur.DataSource.DataSet),
        FieldByName('iFields').AsString,
        FieldByName('iDescFields').AsString);
    end
    else
    begin
      labSort.Caption := '排序方式: .';
//      frmSetSort.AddIndexDef(TClientDataSet(dbgCur.DataSource.DataSet), '', '')
    end;
  end;
  dbgCur.Repaint;
  SetButton;
end;

procedure TfrmComDczl.DBGrid1Exit(Sender: TObject);
begin
  inherited;
  dbgCur := nil;
  TDBGrid(Sender).Repaint;
end;

procedure TfrmComDczl.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with (Sender As TDBGrid).Canvas Do
  Begin
    If (state = [gdSelected]) or (state = [gdFocused,gdSelected]) Then
    begin
      if Sender = dbgCur then
      begin
        Brush.Color := clHighLight;
        Font.Color := clHighLightText;
      end else
      begin
        Brush.Color := $00D7D7AE;
        Font.Color := clWindowText;
      end;
    end;
    DBGridAlign(TDBGrid(Sender), Column.Alignment, Rect, Column.Field.DisplayText);
//    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

//aDetail.Execute
procedure TfrmComDczl.aDetailExecute(Sender: TObject);
begin
  aDetail.Checked := not aDetail.Checked;
  pnlDetail.Visible := aDetail.Checked;
  Splitter1.Visible := aDetail.Checked;
  if not aDetail.Checked then
    DBGrid1.SetFocus;
  dsAfterScroll(DBGrid1.DataSource.DataSet);
end;

procedure TfrmComDczl.aDelExecute(Sender: TObject);
begin
  if not dbgCur.DataSource.DataSet.IsEmpty Then
  begin
    If HaveDetail(dbgCur.DataSource.DataSet, strDetailTables, strDetailWheres) Then
      Application.MessageBox('已有明细资料,不能删除!', '资料删除', MB_OK + MB_ICONWARNING)
    else
    begin
      if Application.MessageBox('确定要删除此项资料吗?',
        '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        dbgCur.DataSource.DataSet.Delete;
        TClientDataSet(dbgCur.DataSource.DataSet).ApplyUpdates(0);
        SetButton;
      end;
    end;
  end;
end;

procedure TfrmComDczl.dsAfterOpen(DataSet: TDataSet);
begin
  dsAfterScroll(DataSet);
end;

procedure TfrmComDczl.LoadEditForm(strState: string);
begin
  inherited;
  dsAfterScroll(dsJbzl);
end;

end.

