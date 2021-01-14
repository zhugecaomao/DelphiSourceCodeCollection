unit formquery2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables, ComCtrls;

type
  Tform_query2 = class(TForm)
    Query1: TQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    dtp_date1: TDateTimePicker;
    dtp_date2: TDateTimePicker;
    CheckBox1: TCheckBox;
    Label8: TLabel;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
 //   procedure editkeypress(Sender: tobject; var key: char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_query2: Tform_query2;

implementation

{$R *.dfm}

procedure Tform_query2.BitBtn1Click(Sender: TObject);
var aSQL:string;
begin

if edit1.text<>''  then aSQL:='and 序号="'+edit1.Text+'" ';
if edit2.text<>'' then aSQL:=aSQL+ 'and 姓名="'+edit2.text+'" ';
if edit3.text<>'' then aSQL:=aSQL+ 'and 户口本="'+edit3.text+'" ';
if edit4.text<>'' then aSQL:=aSQL+ 'and 身份证="'+edit4.text+'" ';
if edit5.text<>'' then aSQL:=aSQL+ 'and  驾驶证="'+edit5.text+'" ';
if edit7.text<>'' then aSQL:=aSQL+ 'and 联系电话="'+edit7.text+'" ';
if checkbox1.Checked then  aSQL:=aSQL+ 'and (租车时间  > :d1 ) and (租车时间 < :d2 )' ;
if asql<>''then


      begin
       query1.close;
       query1.SQL.Clear;
       query1.sql.text:='select * from 客户档案登记表.db where 序号<>"" '+asql;
       if checkbox1.Checked  then
          begin
           query1.Params[0].asdatetime:=dtp_date1.Date;
           query1.Params[1].asdatetime:=dtp_date2.Date;
          end;
       DataSource1.DataSet:=query1;
       query1.Open;
     end;

end;

procedure Tform_query2.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure Tform_query2.FormShow(Sender: TObject);
begin
query1.Open;
end;

procedure Tform_query2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
query1.close;
action:=cafree;
end;

end.
