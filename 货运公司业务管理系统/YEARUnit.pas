unit YEARUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, TFlatPanelUnit, TFlatButtonUnit;

type
  TYEARForm = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FlatButton7Click(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure FlatButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YEARForm: TYEARForm;

implementation

uses DMUnit, NBCXUnit, CallPrint, MainUnit, PrintUnit;

{$R *.dfm}

procedure TYEARForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=cafree;
end;

procedure TYEARForm.FormCreate(Sender: TObject);
begin
  NBCXForm:=TNBCXForm.Create(Application);
  NBCXForm.ShowModal;
end;

procedure TYEARForm.FlatButton7Click(Sender: TObject);
begin
  close;
end;

procedure TYEARForm.FlatButton5Click(Sender: TObject);
begin
  NBCXForm:=TNBCXForm.Create(Application);
   NBCXForm.ShowModal;
end;

procedure TYEARForm.FlatButton6Click(Sender: TObject);
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
   PrintFile:=7;
   PrintForm:=TPRintForm.Create(application);
   printForm.Show;
end;

end.
