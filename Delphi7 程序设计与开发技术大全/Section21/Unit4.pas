unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TForm4 = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
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
  Form4: TForm4;

implementation

uses Unit2, Unit11;

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
DataModule2.booktable.ApplyUpdates; {提交booktable的数据更新}
DataModule2.booktable.cachedupdates:=false;
DataModule2.booktable.Active:=false;
showmessage('修改成功！') ;
modalresult:=mrok;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
DataModule2.booktable.cancelUpdates;
DataModule2.booktable.cachedupdates:=false; {撤销booktable的数据更新}
DataModule2.booktable.Active:=false; {关闭booktable }
form11.close;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
with datamodule2.bookTable do {设置数据模块的B o o k Table }
begin
DatabaseName:='work';
TableName:='bookTable.db';
IndexFieldNames:='bookNo';
end ;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
DataModule2.booktable.Active:=true; {打开booktable }
DataModule2.booktable.cachedupdates:=true;{允许booktable 数据更新}
end;

end.
