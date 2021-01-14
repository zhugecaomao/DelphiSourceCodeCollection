unit putproducet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  TPut_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    Label10: TLabel;
    DataSource2: TDataSource;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    dbcombobox2: TComboBox;
    dbcombobox1: TComboBox;
    ADOQuery1: TADOQuery;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBComboBox2Change(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Put_Form: TPut_Form;

implementation

uses datamodule;

{$R *.dfm}

procedure TPut_Form.Button4Click(Sender: TObject);
begin
dbgrid1.readonly:=true;
Panel3.visible:=true;
end;

procedure TPut_Form.Button1Click(Sender: TObject);
begin
  if ((edit1.text='') or (edit2.text='') or (edit3.text='') or (edit4.text='') or (edit5.text='')) then
  showmessage('信息或数据不完整，添加失败!!')
  else
  begin
  try
    with adoquery1 do
      begin
        insert;
        fields.fields[1].asinteger:=strtoint(edit1.text);
        fields.fields[2].asstring:=edit2.text;
        fields.fields[3].AsVariant:=strtofloat(edit5.text);
        fields.fields[4].asstring:=edit4.text;
        fields.fields[5].asinteger:=strtoint(DBComboBox2.text);
        fields.fields[6].asinteger:=strtoint(edit3.text);
        fields.fields[7].AsDateTime:=date;
        fields.fields[8].asinteger:=0;
        post;
      end;
    Panel3.visible:=false;
  except on exception do
     begin
       showmessage('商品已存在或者是数据类型不合适，请修改后再提交');
       adoquery1.cancel;
     end;
  end;
 end;
end;

procedure TPut_Form.FormActivate(Sender: TObject);
begin
    with adotable1 do
      begin
         tablename:='produce_type_t';
         if not active then
         active:=true;
         first;
          dbcombobox2.Items.Clear;
         dbcombobox1.Items.Clear;
      end;
         while not adotable1.Eof do
           begin
           dbcombobox2.Items.add(adotable1.Fields.fields[0].asstring);
           dbcombobox1.Items.add(adotable1.Fields.fields[1].asstring);
           adotable1.next;
           end;
    dbcombobox2.ItemIndex:=0;
    dbcombobox1.ItemIndex:=0;
end;

procedure TPut_Form.DBComboBox2Change(Sender: TObject);
var
sqls:string;
begin
   dbcombobox1.ItemIndex:=dbcombobox2.ItemIndex;
   if not panel2.enabled then
   panel2.enabled:=true;
   begin
    with adoquery1 do
      begin
      close;
      sql.clear;
      sqls:='select * from produce_t where p_type=:i';
      sql.add(sqls);
      parameters.ParamValues['i']:=strtoint(dbcombobox2.text);
      open;
      end;
    end;
end;

procedure TPut_Form.DBComboBox1Change(Sender: TObject);
var
sqls:string;
begin
dbcombobox2.ItemIndex:=dbcombobox1.ItemIndex;
 if not panel2.enabled then
 panel2.enabled:=true;
   begin
    with adoquery1 do
      begin
      close;
      sql.clear;
      sqls:='select * from produce_t where p_type=:i';
      sql.add(sqls);
      parameters.ParamValues['i']:=strtoint(dbcombobox2.text);
      open;
      end;
    end;
end;


procedure TPut_Form.Button8Click(Sender: TObject);
begin
if adoquery1.active then
   adoquery1.close;
if adotable1.active then
   adotable1.close;
close;
end;

procedure TPut_Form.Button2Click(Sender: TObject);
begin
Panel3.visible:=false;
end;

procedure TPut_Form.Button6Click(Sender: TObject);
begin
dbgrid1.readonly:=true;
adoquery1.delete;
end;

procedure TPut_Form.Button5Click(Sender: TObject);
begin
if dbgrid1.readonly then
dbgrid1.readonly:=false;
adoquery1.edit;
end;

procedure TPut_Form.Button7Click(Sender: TObject);
begin
adoquery1.prior;
end;

procedure TPut_Form.Button9Click(Sender: TObject);
begin
adoquery1.next;
end;

procedure TPut_Form.Button3Click(Sender: TObject);
var
sqls:string;
Parami:tparameter;
begin
  if (edit7.Text='') and (edit6.Text='') then
  showmessage('请输入要查询的关键字')
  else
  begin
   with adoquery1 do
   begin
    close;
    sql.Clear;
    sqls:='select * from produce_t where 1=1';
    if edit7.Text<>'' then
      sqls:=sqls+'and p_name='''+edit7.Text+'''';
    if edit6.Text<>'' then
      begin
       sqls:=sqls+'and p_id=:id';
       Parameters.Clear;
       Parami:=Parameters.ADDParameter; //创建参数1
       Parami.Name:='id';
       Parami.Value:=strtoint(edit6.text);
      end;
     sql.add(sqls);
     Prepared;
     open;
    if  recordcount=0 then
      showmessage('对不起，该商品不在');
    end;
  end;
end;

end.
