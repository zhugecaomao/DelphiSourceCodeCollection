unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RpRave, RpDefine, RpCon, RpConDS, DB, DBTables;

type
  TForm1 = class(TForm)
    Table1: TTable;
    RvDataSetConnection1: TRvDataSetConnection;
    RvProject1: TRvProject;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Rvproject1.Execute;
end;

end.
