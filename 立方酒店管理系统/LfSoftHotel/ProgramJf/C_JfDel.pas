unit C_JfDel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, DBTables;

type
  TJfDelForm = class(TForm)
    Label1: TLabel;
    dtpBd: TDateTimePicker;
    Label2: TLabel;
    dtpEd: TDateTimePicker;
    lblTitle: TLabel;
    btnOk: TBitBtn;
    btnCanc: TBitBtn;
    qryWork: TQuery;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JfDelForm: TJfDelForm;

procedure JfDel;

implementation

{$R *.dfm}
procedure JfDel;
begin
  JfDelForm := TJfDelForm.Create(Application);
  try
    with JfDelForm do
    begin
      dtpBd.Date := Date;
      dtpEd.Date := Date;
      ShowModal;
    end;
  finally
    JfDelForm.Free;
  end;
end;

procedure TJfDelForm.btnOkClick(Sender: TObject);
var
  BDt,EDt,s: string;
begin
  BDt := FormatDateTime('yyyymmdd',dtpBd.Date);
  EDt := FormatDateTime('yyyymmdd',dtpEd.Date);
  s := 'delete  from NewData where (SDate>="'+BDt+'")and(SDate<="'+EDt+'")';
  with qryWork do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;
  Close;
end;

end.
