unit BasePas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables, DBCtrls, ExtCtrls;

type
  TBaseForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Nav1: TDBNavigator;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Nav1BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseForm: TBaseForm;

implementation

uses Data;

{$R *.DFM}

procedure TBaseForm.FormCreate(Sender: TObject);
begin
  Button1.Click;
end;

procedure TBaseForm.Button1Click(Sender: TObject);
begin
  if Sender = Button1 then begin
    DM.Ball00.Open;
    Nav1.DataSource := DM.Ball00s;
  end;
  if Sender = Button2 then begin
    DM.Rate.Open;
    Nav1.DataSource := DM.Rates;
  end;
  if Sender = Button3 then begin
    DM.Water.Open;
    Nav1.DataSource := DM.Waters;
  end;
  DBGrid1.DataSource := Nav1.DataSource;
end;

procedure TBaseForm.Nav1BeforeAction(Sender: TObject; Button: TNavigateBtn);
const
  Deles = '确实要删除这条记录吗?';
var
  Dele: Integer;
begin
  if Button <> nbDelete then Exit;
  Dele := messageDlg(Deles, mtConfirmation, [mbYes, mbNo], 0);
  if Dele = mrNo then Abort;
end;

procedure TBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Ball00.Close;
  DM.Rate.Close;
  DM.Water.Close;
  Action := caFree;
end;

end.

