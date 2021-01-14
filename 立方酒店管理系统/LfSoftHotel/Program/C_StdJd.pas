unit C_StdJd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DosMove, ExtCtrls, StdCtrls, Buttons;

type
  TStdJdForm = class(TForm)
    DosMove1: TDosMove;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitile: TLabel;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    Bevel1: TBevel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StdJdForm: TStdJdForm;

implementation

{$R *.dfm}

procedure TStdJdForm.FormCreate(Sender: TObject);
begin
  Image1.Left := lblTitile.Left - 50;
end;

end.
