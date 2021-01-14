unit MonthUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, TFlatPanelUnit, TFlatButtonUnit;

type
  TMonthForm = class(TForm)
    FlatPanel1: TFlatPanel;
    DBGrid1: TDBGrid;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    FlatButton7: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure FlatButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MonthForm: TMonthForm;

implementation

uses DMUnit, YBCXUnit, PrintUnit, CallPrint, MainUnit;

{$R *.dfm}

procedure TMonthForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TMonthForm.FlatButton7Click(Sender: TObject);
begin
close;
end;

procedure TMonthForm.FormCreate(Sender: TObject);
begin
  YBCXForm:=TYBCXForm.Create(application);
  YBCXForm.ShowModal;
  //DBGrid1.DataSource:=DM.KHFYSource;
  //DM.MonthQuery.Open;
end;

procedure TMonthForm.FlatButton1Click(Sender: TObject);
begin
DM.MonthQuery.First;
end;

procedure TMonthForm.FlatButton2Click(Sender: TObject);
begin
 DM.MonthQuery.Prior;
end;

procedure TMonthForm.FlatButton3Click(Sender: TObject);
begin
DM.MonthQuery.Next;
end;

procedure TMonthForm.FlatButton4Click(Sender: TObject);
begin
DM.MonthQuery.Last;
end;

procedure TMonthForm.FlatButton5Click(Sender: TObject);
begin
  YBCXForm:=TYBCXForm.Create(application);
  YBCXForm.ShowModal;
end;

procedure TMonthForm.FlatButton6Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  PrintFile:=6;
  PrintForm:=TPRintForm.Create(application);
  printForm.Show;
end;

procedure TMonthForm.FormShow(Sender: TObject);
begin
  DM.MonthQuery.Close;
  Dm.MonthQuery.SQL.Clear;
  DM.MonthQuery.SQL.Add('select * from KHFY');
  DM.MonthQuery.Open;
end;

end.
