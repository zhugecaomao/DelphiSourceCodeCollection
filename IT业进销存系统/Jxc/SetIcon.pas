unit SetIcon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, StdCtrls, DBCtrls, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  db, dbclient, Menus, ExtDlgs;

type
  TfrmSetIcon = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    btnSelect: TButton;
    Panel1: TPanel;
    imgIco: TImage;
    btnClear: TButton;
    btnExit: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExitClick(Sender: TObject);
    procedure dsAfterScroll(DataSet: TDataSet);
    procedure btnSelectClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function GetIconName(const mName: string): string;
  public
    { Public declarations }
  end;

var
  frmSetIcon: TfrmSetIcon;

implementation

uses Dm, common, Main;

{$R *.DFM}

//Form.Create
procedure TfrmSetIcon.FormCreate(Sender: TObject);
begin
  with DBGrid1.DataSource.DataSet do
  begin
    Close;
    Open;
    AfterScroll := dsAfterScroll;
  end;
  dsAfterScroll(nil);
end;

//DBGrid1.DrawColumnCell
procedure TfrmSetIcon.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with (Sender As TDBGrid).Canvas Do
  Begin
    If (state =[gdSelected]) or ( state =[gdFocused,gdSelected]) Then
    Begin
      Brush.Color := clhighlight;
      Font.Color := clHighlighttext;
    end
    else
    begin
      //不可选中的父菜单
      If (Sender As TDBGrid).DataSource.DataSet.FieldByName('mIsParent').AsBoolean Then
      begin
        Brush.Color := $00D7D7AE;
        Font.Color := clWindowText;
      end;
    end;
    DBGridAlign((Sender As TDBGrid),column.Alignment,Rect,Column.Field.DisplayText);
  end;
end;

//dsAfterScroll
procedure TfrmSetIcon.dsAfterScroll(DataSet: TDataSet);
var
  strFileName: string;
begin
  with DBGrid1.DataSource.DataSet do
  begin
    strFileName := ExtractFilePath(Application.ExeName) +
      'ICON\' + GetIconName(FieldByName('mName').AsString);
    if FileExists(strFileName) then
    begin
      imgIco.Visible := True;
      imgIco.Picture.LoadFromFile(strFileName);
    end
    else
      imgIco.Visible := False;
  end;
end;

//btnExit.Click
procedure TfrmSetIcon.btnExitClick(Sender: TObject);
begin
  Close;
end;

//btnSelect.Click
procedure TfrmSetIcon.btnSelectClick(Sender: TObject);
var
  strFileName: string;
begin
  with OpenPictureDialog1 do
  begin
    InitialDir := ExtractFilePath(Application.ExeName) + 'ICON\';
    FileName := GetIconName(DBGrid1.DataSource.DataSet.FieldByName('mName').AsString);
    Execute;
    if ExtractFileName(FileName) <> GetIconName(DBGrid1.DataSource.DataSet.FieldByName('mName').AsString) then
    begin
      //copy
      strFileName := ExtractFilePath(Application.ExeName) + 'ICON\' + ExtractFileName(FileName);
      if not FileExists(strFileName) then
        CopyFile(PChar(FileName), PChar(strFileName), True);
      //save
      with Data.Tmp do
      begin
        Close;
        CommandText := 'delete ' +
          'from AppMenuIcon ' +
          'where mName = ''' + DBGrid1.DataSource.DataSet.FieldByName('mName').AsString + '''';
        Execute;
        Close;
        CommandText := 'insert into AppMenuIcon ' +
          '(mName, mIcon) values ' +
          '(''' + DBGrid1.DataSource.DataSet.FieldByName('mName').AsString + ''',''' + ExtractFileName(OpenPictureDialog1.FileName) + ''')';
        Execute;
      end;
      //show
      dsAfterScroll(nil);
    end;
  end;
end;

//btnClear.Click
procedure TfrmSetIcon.btnClearClick(Sender: TObject);
begin
  with Data.Tmp do
  begin
    Close;
    CommandText := 'delete ' +
      'from AppMenuIcon ' +
      'where mName = ''' + DBGrid1.DataSource.DataSet.FieldByName('mName').AsString + '''';
    Execute;
  end;
  dsAfterScroll(nil);
end;

//Form.Close
procedure TfrmSetIcon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TClientDataSet(DBGrid1.DataSource.DataSet).AfterScroll := nil;
end;

//GetIconName
function TfrmSetIcon.GetIconName(const mName: string): string;
begin
  with Data.tmpf do
  begin
    Close;
    CommandText := 'select * from AppMenuIcon ' +
      'where mName = ''' + mName + '''';
    Open;
    if not IsEmpty then
      result := FieldByName('mIcon').AsString
    else
      result := '';
  end;
end;

end.
