unit formquery3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, DBCtrls,
  ComCtrls;

type
  Tform_query3 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TQuery;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    dtp_date1: TDateTimePicker;
    Label10: TLabel;
    dtp_date2: TDateTimePicker;
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
  form_query3: Tform_query3;

implementation

{$R *.dfm}

procedure Tform_query3.BitBtn1Click(Sender: TObject);
var aSQL:string;
begin

if edit1.text<>''  then aSQL:='and 车号="'+edit1.Text+'" ';
if edit2.text<>'' then aSQL:=aSQL+ 'and 车主="'+edit2.text+'" ';
if edit3.text<>'' then aSQL:=aSQL+ 'and 车型="'+edit3.text+'" ';
if edit4.text<>'' then aSQL:=aSQL+ 'and 路码="'+edit4.text+'" ';
if edit5.text<>'' then aSQL:=aSQL+ 'and  承修人="'+edit5.text+'" ';
if ComboBox1.text<>'' then aSQL:=aSQL+ 'and 保养级别="'+ComboBox1.Text+'" ';
if checkbox1.Checked then  aSQL:=aSQL+ 'and (日期 > :d1 ) and (日期 < :d2 )' ;
if asql<>''then


      begin
       query1.close;
       query1.SQL.Clear;
       query1.sql.text:='select * from 车辆维修保养纪录.db where 车号<>"" '+asql;
       if checkbox1.Checked  then
          begin
           query1.Params[0].asdatetime:=dtp_date1.Date;
           query1.Params[1].asdatetime:=dtp_date2.Date;
          end;
       DataSource1.DataSet:=query1;
       query1.Open;
     end;

end;

procedure Tform_query3.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tform_query3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
query1.close;
action:=cafree;

end;

procedure Tform_query3.FormShow(Sender: TObject);
begin
query1.open;

end;

end.
