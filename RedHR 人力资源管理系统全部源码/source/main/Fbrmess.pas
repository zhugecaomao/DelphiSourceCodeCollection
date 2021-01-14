unit Fbrmess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TBrmess = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Brmess: TBrmess;

implementation
uses fmain;
{$R *.dfm}

procedure TBrmess.Button1Click(Sender: TObject);
begin
  close
end;

end.
