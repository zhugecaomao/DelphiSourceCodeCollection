unit Untpart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  Tfmps_part = class(TfmBase)
    DBGrid1: TDBGrid;
    dspart: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmps_part: Tfmps_part;
implementation

uses untdatadm, func;

{$R *.dfm}
procedure Tfmps_part.btnCancelClick(Sender: TObject);
begin
  inherited;
  dmmain.cdsdata.Close;
  dmmain.cdsdata.Data:=null;
  close;
end;

procedure Tfmps_part.btnOkClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmps_part.FormShow(Sender: TObject);
var
  temp:widestring;
begin
  inherited;
  temp:='select * from part where  (one_partno is null) or (one_partno ='+''''+''+''''+')';
  dmmain.CDSdata.Close;
  dmmain.CDSdata.Data:=null;
  try
  dmmain.CDSdata.Data:=adisp.execSql(temp);
  dmmain.CDSdata.Open;
  except
  end;
end;

procedure Tfmps_part.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not dmmain.CDSdata.IsEmpty then
  btnok.Click;
end;

end.
