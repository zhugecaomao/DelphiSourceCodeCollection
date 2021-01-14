unit cllydut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  Tcllydfm = class(TForm)
    Panel1: TPanel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cllydfm: Tcllydfm;

implementation

uses cpckut;

{$R *.dfm}

procedure Tcllydfm.FormCreate(Sender: TObject);
begin
  with adoquery1 do
    begin
      close;
      sql.clear;
      sql.add('select * from ckdb order by ³ö¿âÈÕÆÚ desc');
      open;
    end;
end;

end.
