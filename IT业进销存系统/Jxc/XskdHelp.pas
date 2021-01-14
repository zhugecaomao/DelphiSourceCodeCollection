unit XskdHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComHelp, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls,
  db, dbclient;

type
  TfrmXskdHelp = class(TfrmComHelp)
    DBGrid2: TDBGrid;
    dtpRqa: TDateTimePicker;
    labRqa: TLabel;
    dtpRqb: TDateTimePicker;
    Label3: TLabel;
    procedure btnOkClick(Sender: TObject);override;
    procedure dsAfterScroll(DataSet: TDataSet);override;
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    function GetFilter: string;override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmXskdHelp: TfrmXskdHelp;

implementation

uses Dm, Common, ComFun;

{$R *.DFM}

{ TfrmKhHelp }

function TfrmXskdHelp.GetFilter: string;
begin
  result := 'RQ >= #' + FormatDateTime('yyyy-mm-dd', dtpRqa.Date) + '# and ' +
    'RQ <= #' + FormatDateTime('yyyy-mm-dd', dtpRqb.Date) + '#';
end;

procedure TfrmXskdHelp.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with TClientDataSet(DBGrid2.DataSource.DataSet) do
  begin
    Close;
    CommandText :=
      'select M.*, ' +
      'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
      'from XSKD M, HP H, M inner join H on M.HPID=H.ID ' +
      'where ZBID = ' + Float2Str(dsHelp['ID']);
    Open;
  end;
end;

procedure TfrmXskdHelp.btnOkClick(Sender: TObject);
begin
  if (btnOk.Enabled) and (dsEditing <> nil) then
    with CurDs do
    begin
      CommandText :=
        'select M.*, H.BH as aBH ' +
        'from XSKD M, HP H ' +
        'where M.HPID = H.ID and M.ZBID = ' + dsHelp.FieldByName('ID').AsString;
      Open;
      while not Eof do
      begin
        dsEditing.Append;
        dsEditing.FieldByName('aBH').AsString :=
          FieldByName('aBH').AsString;
        dsEditing.FieldByName('SL').AsFloat :=
          FieldByName('SL').AsFloat;
        dsEditing.FieldByName('DJ').AsFloat :=
          FieldByName('DJ').AsFloat;
        dsEditing.FieldByName('NSL').AsFloat :=
          FieldByName('NSL').AsFloat;
        Next;
      end;
      Close;
    end;
end;

procedure TfrmXskdHelp.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with DBGrid2.Canvas Do
  Begin
    If (state = [gdSelected]) or (state = [gdFocused,gdSelected]) Then
    begin
      Brush.Color := $00D7D7AE;
      Font.Color := clWindowText;
    end;
    DBGridAlign(DBGrid2, Column.Alignment, Rect, Column.Field.DisplayText);
  end;
end;

end.
