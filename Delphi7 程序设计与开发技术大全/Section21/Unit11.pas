unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TForm11 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm11.BitBtn1Click(Sender: TObject);
begin
DataModule2.studenttable.ApplyUpdates; {提交studenttable的数据更新}
DataModule2.studenttable.cachedupdates:=false;
DataModule2.Studenttable.Active:=false;
showmessage('修改成功！');
modalresult:=mrok;
end;

procedure TForm11.BitBtn2Click(Sender: TObject);
begin
DataModule2.Studenttable.cancelUpdates;
DataModule2.Studenttable.cachedupdates:=false; {撤销studenttable的数据更新}
DataModule2.Studenttable.Active:=false; {关闭studenttable}
form11.close;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
with datamodule2.StudentTable do {设置数据模块的studenttable }
begin
DatabaseName:='work';
TableName:='StuTable.db';
IndexFieldNames:='StuNo';
end ;
end ;

procedure TForm11.FormActivate(Sender: TObject);
begin
DataModule2.Studenttable.Active:=true; {打开studenttable }
DataModule2.Studenttable.cachedupdates:=true;{允许studenttable数据更新}
end;

end.
