unit C_Stand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DosMove;

type
  TStandForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnHelp: TBitBtn;
    btnClose: TBitBtn;
    DosMove1: TDosMove;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StandForm: TStandForm;

implementation

{$R *.dfm}

procedure TStandForm.FormCreate(Sender: TObject);
begin
  Image1.Left := lblTitle.Left - 50;
end;

end.
