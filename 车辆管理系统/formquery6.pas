unit formquery6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids;

type
  Tformquery_6 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TQuery;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formquery_6: Tformquery_6;

implementation

{$R *.dfm}

procedure Tformquery_6.BitBtn1Click(Sender: TObject);
begin
query1.close;
query1.SQL.Clear;
query1.SQL.add('select * from 车辆租用登记表');
query1.SQL.add('where 车号="'+edit1.text+'" or 车型="'+edit2.text+'" or 车主="'+edit3.text+'" or 结算金额="'+edit4.text+'" or 租用方式="'+combobox1.text+'" or 是否配司机="'+combobox2.text+'" or 客户是否结账="'+combobox3.text+'"');
query1.Open;
end;

procedure Tformquery_6.BitBtn2Click(Sender: TObject);
begin
Close; 
end;

procedure Tformquery_6.FormShow(Sender: TObject);
begin
query1.Open;
end;

procedure Tformquery_6.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
query1.close;
action:=cafree;

end;

end.
