unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, ExtCtrls, DB, DBTables, Mask;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    procedure Button1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Edit1Click(Sender: TObject);
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
with Table1 do
begin
Open;
Setkey;
FieldByName('Species No').AsString:=Edit1.text;
if gotokey then
begin
label6.Caption:='查询成功！ ' ;
dbtext1.Visible:= true;
dbtext2.Visible:= true;
dbtext3.Visible:= true;
dbtext4.Visible:= true;
dbtext5.Visible:= true;
dbmemo1.Visible:= true;
end
else
begin
label6.Caption :='查询失败！ ' ;
dbtext1.Visible:= false;
dbtext2.Visible:= false;
dbtext3.Visible:= false;
dbtext4.Visible:= false;
dbtext5.Visible:= false;
dbmemo1.Visible:= false;
end ;
end ;
end ;


procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
label6.Caption :='正在浏览记录！' ;
table1.open;
dbtext1.Visible := true;
dbtext2.Visible := true;
dbtext3.Visible := true;
dbtext4.Visible := true;
dbmemo1.Visible:= true;
edit1.Text:=table1.FieldByName('Species No').AsString;
end;
procedure TForm1.Edit1Click(Sender: TObject);
begin
label6.Caption :='正在查询记录！ ' ;
end;

end.
