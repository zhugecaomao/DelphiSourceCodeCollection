unit Unfenpei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  Tfenpeifrm = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fenpeifrm: Tfenpeifrm;

implementation

uses Undm;

{$R *.dfm}

procedure Tfenpeifrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
datamodule1.CDSStudent.Filtered:=false;
action:=cafree;
end;

procedure Tfenpeifrm.Button1Click(Sender: TObject);
begin
 if datamodule1.CDSInformation.Fields[2].Value=5 then
   application.MessageBox('该机器已经分配，请另选一部机器！','系统警告',MB_ok+MB_Iconstop)
 else
  begin
   if datamodule1.CDSStudent.Eof then
     application.MessageBox('已经没有考生了！','系统警告',mb_ok+mb_iconstop)
   else
    begin
     datamodule1.CDSInformation.Edit;
     datamodule1.CDSInformation.Fields[2].Value:=5;
     datamodule1.CDSInformation.Fields[3].AsString:=datamodule1.CDSStudent.Fields[1].asstring;
     datamodule1.CDSInformation.Post;
     datamodule1.CDSInformation.ApplyUpdates(0);
     datamodule1.CDSStudent.Edit;
     datamodule1.CDSStudent.Fields[6].Value:=1;
     datamodule1.CDSStudent.Post;
     datamodule1.CDSStudent.ApplyUpdates(0);
   end;
  end;
end;


procedure Tfenpeifrm.Button3Click(Sender: TObject);
begin

datamodule1.CDSStudent.Close;
datamodule1.CDSStudent.Open;
datamodule1.CDSInformation.Close;
datamodule1.CDSInformation.Open;
end;

procedure Tfenpeifrm.Button2Click(Sender: TObject);
begin
 if datamodule1.CDSInformation.Fields[2].Value=5 then
  begin
     datamodule1.CDSStudent.Filtered:=false;
     datamodule1.CDSStudent.Locate('准考证号',datamodule1.CDSInformation.Fields[3].Value,[]);
     datamodule1.CDSStudent.Edit;
     datamodule1.CDSStudent.Fields[6].Value:=6;
     datamodule1.CDSStudent.Post;
     datamodule1.CDSStudent.ApplyUpdates(0);
     datamodule1.CDSStudent.Filter:='状态=6';
     datamodule1.CDSStudent.Filtered:=true;
     datamodule1.CDSInformation.Edit;
     datamodule1.CDSInformation.Fields[2].Value:=4;
     datamodule1.CDSInformation.Fields[3].AsString:='*';
     datamodule1.CDSInformation.Post;
     datamodule1.CDSInformation.ApplyUpdates(0);
  end
 else
  application.MessageBox('该机器已经没有考生','系统警告',mb_ok+mb_iconstop);

end;

procedure Tfenpeifrm.FormShow(Sender: TObject);
begin
datamodule1.CDSStudent.Filtered:=false;
datamodule1.CDSStudent.Filter:='状态=6';
datamodule1.CDSStudent.Filtered:=true;
end;

end.
