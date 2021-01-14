unit C_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons;

type
  TSelectForm = class(TForm)
    Panel1: TPanel;
    qrySelect: TQuery;
    dsSelect: TDataSource;
    dbgSelect: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    lblTitle: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectForm: TSelectForm;

implementation

{$R *.dfm}

procedure TSelectForm.FormCreate(Sender: TObject);
begin
  Image1.Left := lblTitle.Left - 50;
end;

end.
