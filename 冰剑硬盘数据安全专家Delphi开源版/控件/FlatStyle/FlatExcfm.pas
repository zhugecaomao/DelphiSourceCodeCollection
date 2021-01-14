unit FlatExcfm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FlatUtils, FlatBars;

type
  TExcelForm = class(TForm)
    ProGauge: TFlatGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExcelForm: TExcelForm;

implementation

{$R *.dfm}

procedure TExcelForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ExcelForm.Free;
end;

end.
