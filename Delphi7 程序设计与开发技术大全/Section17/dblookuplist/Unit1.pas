unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls, Grids,
  DBGrids;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Table1: TTable;
    DBImage1: TDBImage;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
with DBGrid1.SelectedField do
label1.visible:= true ;
label1.Caption:='«Î ‰»Î'+DBGrid1.SelectedField.DisplayName+'÷µ£∫';
with combobox1 do
begin
Visible:=true;
items.Clear;
case DBGrid1.SelectedField.Index of
0 :
begin
items.add('China');
items.add('Japan');
items.add('France');
end;
1 :
begin
items.add('Beijing');
items.add('Tokyo');
items.add('Paris');
end;
2 :
begin
items.add('Asia');
items.add('Africa');
items.add('Europe');
end;
3 :
begin
items.add('100000');
items.add('10000');
items.add('1000');
end;
4 :
begin
items.add('12000000');
items.add('5000000');
items.add('100000');
end;
end;
end;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
var
i:integer;
begin
with combobox1 do
begin
query1.Edit ;
query1.FieldByName(DBGrid1.SelectedField.displayname).asstring:=Items.Strings [itemindex];
query1.Post ;
visible:=false;
label1.Visible:=false ;
end;
end;

end.
