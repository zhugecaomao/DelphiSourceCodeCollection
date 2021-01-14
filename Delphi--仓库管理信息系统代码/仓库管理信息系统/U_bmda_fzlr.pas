unit U_bmda_fzlr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBClient, ExtCtrls, Buttons, ADODB;

type
  TfrmBmda_fzlr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dsBMDA: TDataSource;
    DBGrid: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    aqBMDA: TADOQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBmda_fzlr: TfrmBmda_fzlr;
  pub_Bmmc: string;
implementation

uses  uPublic, uDB;

{$R *.DFM}

procedure TfrmBmda_fzlr.SpeedButton1Click(Sender: TObject);
begin
  if aqBMDA.recordcount = 0 then
  begin
    application.messagebox('请选择具体部门', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  pub_Bmmc :=aqBMDA.fieldbyname('部门名称').asstring;
  close;
end;

procedure TfrmBmda_fzlr.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmBmda_fzlr.DBGridTitleClick(Column: TColumn);
begin
  DBGridSort(dbgrid, column);
end;

procedure TfrmBmda_fzlr.FormCreate(Sender: TObject);
begin
  aqBMDA.Active := True;
end;

end.

