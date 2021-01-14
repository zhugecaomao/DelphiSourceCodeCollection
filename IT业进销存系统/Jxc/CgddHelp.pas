unit CgddHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComHelp, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls,
  db, dbclient;

type
  TfrmCgddHelp = class(TfrmComHelp)
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
  frmCgddHelp: TfrmCgddHelp;

implementation

uses Dm, Common, ComFun;

{$R *.DFM}

{ TfrmKhHelp }

function TfrmCgddHelp.GetFilter: string;
begin
  result := 'RQ >= #' + FormatDateTime('yyyy-mm-dd', dtpRqa.Date) + '# and ' +
    'RQ <= #' + FormatDateTime('yyyy-mm-dd', dtpRqb.Date) + '#';
end;

procedure TfrmCgddHelp.dsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with TClientDataSet(DBGrid2.DataSource.DataSet) do
  begin
    Close;
    CommandText :=
      'select M.*, ' +
      '(select HH from CGDD where CGDD.ZBID=M.ZBID and CGDD.HH=M.HH) as TMP, ' +
      '(select sum(SL) from CGSH where DDID=M.ZBID and HPID=M.HPID) as aSHSL, ' +
      'iif(M.SL > aSHSL, M.SL - aSHSL, 0) as aMSSL, ' +
      'H.BH as aBH, H.PM as aPM, H.DW as aDW ' +
      'from CGDD M, HP H, M inner join H on M.HPID=H.ID ' +
      'where ZBID = ' + Float2Str(dsHelp['ID']);
    Open;
  end;
end;

procedure TfrmCgddHelp.btnOkClick(Sender: TObject);
begin
  if (btnOk.Enabled) and (dsEditing <> nil) then
    with CurDs do
    begin
      CommandText :=
        'select M.*, H.BH as aBH, ' +
        '(select sum(SL) from CGSH where DDID=M.ZBID and HPID=M.HPID) as aSHSL ' +
        'from CGDD M, HP H ' +
        'where M.HPID = H.ID and M.ZBID = ' + dsHelp.FieldByName('ID').AsString;
      Open;
      while not Eof do
      begin
        if FieldByName('SL').AsFloat > FieldByName('aSHSL').AsFloat then
        begin
          dsEditing.Append;
          dsEditing.FieldByName('aBH').AsString :=
            FieldByName('aBH').AsString;
          dsEditing.FieldByName('SL').AsFloat :=
            FieldByName('SL').AsFloat - FieldByName('aSHSL').AsFloat;
          dsEditing.FieldByName('DJ').AsFloat :=
            FieldByName('DJ').AsFloat;
          dsEditing.FieldByName('NSL').AsFloat :=
            FieldByName('NSL').AsFloat;
          dsEditing.FieldByName('DDID').AsInteger :=
            FieldByName('ZBID').AsInteger;
        end;
        Next;
      end;
      Close;
    end;
end;

procedure TfrmCgddHelp.DBGrid2DrawColumnCell(Sender: TObject;
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
