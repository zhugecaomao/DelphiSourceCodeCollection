unit C_XfxmSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Select, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, C_Define;

type
  TXfxmSelForm = class(TSelectForm)
    dbgXfdm: TDBGrid;
    tblXfdm: TTable;
    dsXfdm: TDataSource;
    procedure dsXfdmDataChange(Sender: TObject; Field: TField);
    procedure dsSelectDataChange(Sender: TObject; Field: TField);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure dbgSelectDblClick(Sender: TObject);
  private
    { Private declarations }
    FXfbh: string;
    FXmmc: string;
  public
    { Public declarations }
  end;

var
  XfxmSelForm: TXfxmSelForm;

function XfxmSel: TXFXM;

implementation

{$R *.dfm}

function XfxmSel: TXFXM;
begin
  XfxmSelForm := TXfxmSelForm.Create(Application);
  try
    with XfxmSelForm do
    begin
      tblXfdm.Open;
      qrySelect.Open;
      ShowModal;
      if ModalResult = mrOK then
      begin
        Result.AXfbh := FXfbh;
        Result.AXmmc := FXmmc;
      end
      else
      begin
        Result.AXfbh := '';
        Result.AXmmc := '';
      end;
    end;
  finally
    XfxmSelForm.tblXfdm.Close;
    XfxmSelForm.qrySelect.Close;
    XfxmSelForm.Free;
  end;
end;

procedure TXfxmSelForm.dsXfdmDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  FXfbh := tblXfdm.Fields[0].Value;
  if FXfbh = '00001' then
  begin
    with qrySelect do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from KFDM');
      Open;
    end;
    dbgSelect.Columns[0].FieldName := 'D_KFMC';
  end
  else
  if FXfbh = '00002' then
  begin
    with qrySelect do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CTDM');
      Open;
    end;
    dbgSelect.Columns[0].FieldName := 'D_CTMC';
  end
  else
  if FXfbh = '00003' then
  begin
    with qrySelect do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from HCDM');
      Open;
    end;
    dbgSelect.Columns[0].FieldName := 'D_HCMC';
  end
  else
  begin
    qrySelect.Close;
    FXmmc := tblXfdm.FieldByName('D_XFMC').AsString;
  end;
end;

procedure TXfxmSelForm.dsSelectDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  FXmmc := qrySelect.Fields[1].Value;
end;

procedure TXfxmSelForm.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if FXfbh = '00001' then
    qrySelect.Locate('D_KFBH',edtValue.Text+Key,[loPartialKey]);
end;

procedure TXfxmSelForm.dbgSelectDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

end.
