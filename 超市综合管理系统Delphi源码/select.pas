unit select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  Tsel_From = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sel_From: Tsel_From;

implementation

uses datamodule;

{$R *.dfm}

procedure Tsel_From.Button1Click(Sender: TObject);
var
sqls:string;
begin
  if (edit1.Text='') and (edit2.Text='') and (edit3.Text='')and (edit4.Text='')then
      showmessage('请输入要查询的关键字')
  else
  begin
   with adoquery1 do
   begin
    close;
    sql.Clear;
    sqls:='select * from produce_t where 1=1';
    if edit2.Text<>'' then
      sqls:=sqls+'and p_name like ''%'+edit2.Text+'%''';
    if edit4.Text<>'' then
      sqls:=sqls+'and p_unit like ''%'+edit4.Text+'%''';
    if edit1.Text<>'' then
      begin
       sqls:=sqls+'and p_id=:id';
       Parameters.Clear;
       Parameters.ADDParameter; //创建参数1
       Parameters[0].Name:='id';
       Parameters[0].Value:=strtoint(edit1.text);
      end;
    if edit3.Text<>'' then
      begin
       sqls:=sqls+'and p_type=:type';
      Parameters.Clear;
       Parameters.ADDParameter; //创建参数1
       Parameters[0].Name:='type';
       Parameters[0].Value:=strtoint(edit3.text);
      end;
     sql.add(sqls);
     Prepared;
     open;
    if  recordcount=0 then
      showmessage('对不起，该商品不在');
    end;
  end;
end;

procedure Tsel_From.Button2Click(Sender: TObject);
begin
adoquery1.close;
close;
end;

procedure Tsel_From.FormActivate(Sender: TObject);
begin
  if not datamodule1.adoconnection1.connected then
  datamodule1.adoconnection1.connected:=true;
end;

end.
