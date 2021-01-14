unit Unview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, Menus;

type
  Tviewfrm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewfrm: Tviewfrm;

implementation

uses Undm;

{$R *.dfm}

procedure Tviewfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tviewfrm.FormShow(Sender: TObject);
begin
datamodule1.CDSStudent.Filtered:=false;
datamodule1.CDSStudent.Filter:='״̬=1 or ״̬=2 or ״̬=3';
datamodule1.CDSStudent.Filtered:=true;
end;

procedure Tviewfrm.N1Click(Sender: TObject);
var hao:string;
begin
 datamodule1.CDSStudent.Edit;
 datamodule1.CDSStudent.Fields[6].Value:=6;
 hao:=datamodule1.CDSStudent.Fields[1].Value;
 if datamodule1.CDSInformation.Locate('׼��֤��',hao,[]) then
  begin
   datamodule1.CDSInformation.Edit;
   datamodule1.CDSStudent.Fields[2].Value:=4;
   datamodule1.CDSStudent.Fields[3].Value:='*';
   datamodule1.CDSInformation.Post;
   datamodule1.CDSInformation.ApplyUpdates(0);
  end;
 datamodule1.CDSStudent.Post;
 datamodule1.CDSStudent.ApplyUpdates(0);
end;

procedure Tviewfrm.FormActivate(Sender: TObject);
begin
 timer1.Enabled:=true;
end;

procedure Tviewfrm.Timer1Timer(Sender: TObject);
begin
datamodule1.DSStudent.Close;
datamodule1.DSStudent.Open;
end;

end.
