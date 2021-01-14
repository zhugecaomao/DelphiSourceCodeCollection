unit C_Tdsel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Select, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TTdSelForm = class(TSelectForm)
    procedure dsSelectDataChange(Sender: TObject; Field: TField);
    procedure dbgSelectDblClick(Sender: TObject);
  private
    { Private declarations }
    FKrbh: string;
  public
    { Public declarations }
  end;

var
  TdSelForm: TTdSelForm;

function TdSel: string;

implementation

{$R *.dfm}

function TdSel: string;
begin
  TdSelForm := TTdSelForm.Create(Application);
  try
    with TdSelForm do
    begin
      qrySelect.Open;
      ShowModal;
      if ModalResult = mrOK then
        Result := FKrbh
      else
        Result := '';
    end;
  finally
    TdSelForm.qrySelect.Close;
    TdSelForm.Free;
  end;
end;

procedure TTdSelForm.dsSelectDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  FKrbh := qrySelect.FieldByName('D_KRBH').AsString;
end;

procedure TTdSelForm.dbgSelectDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

end.
