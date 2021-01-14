unit formquery5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, DBCtrls, Grids, DBGrids, Buttons,
  ComCtrls;

type
  Tformquery_5 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit12: TEdit;
    Label12: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    Label13: TLabel;
    Query1: TQuery;
    DataSource1: TDataSource;
    CheckBox1: TCheckBox;
    Label14: TLabel;
    dtp_date1: TDateTimePicker;
    dtp_date2: TDateTimePicker;
    Label15: TLabel;
    CheckBox2: TCheckBox;
    Label16: TLabel;
    dtp_date3: TDateTimePicker;
    Label17: TLabel;
    dtp_date4: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formquery_5: Tformquery_5;

implementation

{$R *.dfm}

procedure Tformquery_5.BitBtn1Click(Sender: TObject);
var aSQL:string;
begin

if edit1.text<>''  then aSQL:='and 合同号="'+edit1.Text+'" ';
if edit2.text<>'' then aSQL:=aSQL+ 'and 车号="'+edit2.text+'" ';
if edit3.text<>'' then aSQL:=aSQL+ 'and 车型="'+edit3.text+'" ';
if edit4.text<>'' then aSQL:=aSQL+ 'and 出库里程="'+edit4.text+'" ';
if edit5.text<>'' then aSQL:=aSQL+ 'and  出库油料="'+edit5.text+'" ';
if edit6.text<>'' then aSQL:=aSQL+ 'and 出库司机="'+edit6.text+'" ';
if edit7.text<>'' then aSQL:=aSQL+ 'and 出库交接人="'+edit7.text+'" ';
if edit8.text<>'' then aSQL:=aSQL+ 'and 入库里程="'+edit8.text+'" ';
if edit9.text<>'' then aSQL:=aSQL+ 'and 入库油料="'+edit9.text+'" ';
if edit10.text<>'' then aSQL:=aSQL+ 'and 入库司机="'+edit10.text+'" ';
if edit11.text<>'' then aSQL:=aSQL+ 'and 入库交接人="'+edit11.text+'" ';
if edit12.text<>'' then aSQL:=aSQL+ 'and 租车单位="'+edit12.text+'" ';

if checkbox1.Checked then  aSQL:=aSQL+ 'and (出库日期 > :d1 ) and (出库日期 < :d2 )' ;
if checkbox2.Checked then  aSQL:=aSQL+ 'and (入库日期 > :d1 ) and (入库日期 < :d2 )' ;

if asql<>''then
       begin
       query1.close;
       query1.SQL.Clear;
       query1.sql.text:='select * from 车辆出入库登记表.db where 合同号<>"" '+asql;
       if checkbox1.Checked  then
          begin
           query1.Params[0].asdatetime:=dtp_date1.Date;
           query1.Params[1].asdatetime:=dtp_date2.Date;
          end;
           if checkbox2.Checked  then
          begin
           query1.Params[0].asdatetime:=dtp_date3.Date;
           query1.Params[1].asdatetime:=dtp_date4.Date;
          end;
       DataSource1.DataSet:=query1;
       query1.Open;
     end;

end;
procedure Tformquery_5.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tformquery_5.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
query1.close;
action:=cafree;

end;

procedure Tformquery_5.FormShow(Sender: TObject);
begin
query1.Open;
end;

end.
