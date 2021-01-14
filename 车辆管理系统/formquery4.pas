unit formquery4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, DB, DBTables,
  ComCtrls;

type
  TFormquery_4 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    Query1: TQuery;
    DataSource1: TDataSource;
    Label6: TLabel;
    BitBtn2: TBitBtn;
    dtp_date1: TDateTimePicker;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    dtp_date2: TDateTimePicker;
    dtp_date3: TDateTimePicker;
    CheckBox2: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    dtp_date4: TDateTimePicker;
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
  Formquery_4: TFormquery_4;

implementation

{$R *.dfm}

procedure TFormquery_4.BitBtn1Click(Sender: TObject);
var aSQL:string;
begin

if edit1.text<>''  then aSQL:='and 车号="'+edit1.Text+'" ';
if edit2.text<>'' then aSQL:=aSQL+ 'and 车主="'+edit2.text+'" ';
if edit3.text<>'' then aSQL:=aSQL+ 'and 车型="'+edit3.text+'" ';
if edit4.text<>'' then aSQL:=aSQL+ 'and 订损金额="'+edit4.text+'" ';
if edit5.text<>'' then aSQL:=aSQL+ 'and  责任划分="'+edit5.text+'" ';
if checkbox1.Checked then  aSQL:=aSQL+ 'and (进厂日期 > :d1 ) and (进厂日期 < :d2 )' ;
if checkbox2.Checked then  aSQL:=aSQL+ 'and (出厂日期 > :d1 ) and (出厂日期 < :d2 )' ;

if asql<>''then
       begin
       query1.close;
       query1.SQL.Clear;
       query1.sql.text:='select * from 车辆肇事纪录.db where 车号<>"" '+asql;
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
procedure TFormquery_4.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TFormquery_4.FormShow(Sender: TObject);
begin
query1.Open;
end;

procedure TFormquery_4.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
query1.close;
action:=cafree;

end;

end.
