unit BangZhuUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, AAFont, AACtrls, StdCtrls;

type
  TBangZhuForm = class(TForm)
    FlatPanel1: TFlatPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BangZhuForm: TBangZhuForm;

implementation

{$R *.dfm}

procedure TBangZhuForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.
