unit C_LybBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, DBTables;

type
  TLybBrowForm = class(TForm)
    Label1: TLabel;
    qryLyb: TQuery;
    DBGrid1: TDBGrid;
    dsLyb: TDataSource;
    qryLybD_LYBID: TIntegerField;
    qryLybD_XM: TStringField;
    qryLybD_RQ: TDateTimeField;
    qryLybD_SJ: TDateTimeField;
    qryLybD_NR: TBlobField;
    qryLybD_YDR: TBlobField;
    qryLybD_NRBZ: TStringField;
    qryLybD_YDRBZ: TStringField;
    btnNew: TButton;
    btnEdit: TButton;
    btnDel: TButton;
    procedure qryLybCalcFields(DataSet: TDataSet);
    procedure OnNew(Sender: TObject);
    procedure OnEdit(Sender: TObject);
    procedure OnDelete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LybBrowForm: TLybBrowForm;

procedure LybBrow;

implementation

uses C_LybEdit, C_HotelData;

{$R *.dfm}
procedure LybBrow;
begin
  LybBrowForm := TLybBrowForm.Create(Application);
  try
    with LybBrowForm do
    begin
      qryLyb.Open;
      ShowModal;
    end;
  finally
    LybBrowForm.Free;
  end;
end;



procedure TLybBrowForm.qryLybCalcFields(DataSet: TDataSet);
begin
  qryLybD_NRBZ.AsString := qryLybD_NR.AsString;
  qryLybD_YDRBZ.AsString := qryLybD_YDR.AsString;
end;

procedure TLybBrowForm.OnNew(Sender: TObject);
begin
  NewLyb;
  qryLyb.Close;
  qryLyb.Open;
end;

procedure TLybBrowForm.OnEdit(Sender: TObject);
var
  aId : Integer;
begin
  if qryLyb.IsEmpty then Exit;
  aId := qryLybD_LYBID.Value;
  EditLyb(aId);
  qryLyb.Close;
  qryLyb.Open;
  qryLyb.Locate('D_LYBID',aId,[]);
end;

procedure TLybBrowForm.OnDelete(Sender: TObject);
begin
  HotelData.ExecSql('delete from LYB where D_LYBID='+qryLybD_LYBID.AsString);
  qryLyb.Close;
  qryLyb.Open;
end;

end.
