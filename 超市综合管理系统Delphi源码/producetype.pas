unit producetype;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls,
  DBTables;

type
  TPType_Form = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    GroupBox2: TGroupBox;
    Button7: TButton;
    Button6: TButton;
    Button4: TButton;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PType_Form: TPType_Form;

implementation

uses datamodule;

{$R *.dfm}

procedure TPType_Form.Button1Click(Sender: TObject);
begin
adoquery1.active:=false;
PType_Form.close;
end;

procedure TPType_Form.Button2Click(Sender: TObject);
begin
 button3.visible:=false;
 button5.visible:=false;
 button4.visible:=true;
 adoquery1.insert;
end;

procedure TPType_Form.Button3Click(Sender: TObject);
begin
button4.visible:=true;
button2.visible:=false;
button5.visible:=false;
adoquery1.edit;
end;

procedure TPType_Form.Button4Click(Sender: TObject);
begin
  try
    adoquery1.post;
  except
  on exception do
     begin
       showmessage('保存不成功');
       adoquery1.cancel;
     end;
  end;
  button4.visible:=false;
  button2.visible:=true;
  button3.visible:=true;
  button5.visible:=true;
end;

procedure TPType_Form.Button5Click(Sender: TObject);
var
ret:integer;
k:integer;
begin
    ret:=messagebox(0,'警告：将删除该类型和他所对应的所有商品？？','不可恢复的删除确定',52);
    if ret=idyes then
     begin
       k:=strtoint(dbedit1.text);
       with datamodule1.adocommand1 do
         begin
           commandtext:='delete from produce_t where p_type=:i';
           parameters.ParamValues['i']:=k;
           execute;
         end;
       adoquery1.delete;
     end;
end;

procedure TPType_Form.FormActivate(Sender: TObject);
begin
if not adoquery1.active then
    adoquery1.active:=true;
end;


procedure TPType_Form.Button6Click(Sender: TObject);
begin
 adoquery1.prior;
end;

procedure TPType_Form.Button7Click(Sender: TObject);
begin
adoquery1.next;
end;

end.
