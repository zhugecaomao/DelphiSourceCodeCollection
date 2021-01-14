unit CashForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, ImgList,
  ComCtrls, ToolWin, Buttons;

type
  TCash = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    ADODataSet1: TADODataSet;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    BitBtn2: TBitBtn;
    ADOCommand1: TADOCommand;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure Edit6Change(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3DblClick(Sender: TObject);
    procedure Edit4DblClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cash: TCash;

implementation

{$R *.dfm}
//------------根据病人门诊单的编号显示其处方中收费项目----------
procedure TCash.DataSource1DataChange(Sender: TObject; Field: TField);
var
num:string;//保存挂号编号
begin
 dbgrid1.Columns[0].Width:=96;
 dbgrid1.Columns[1].Width:=48;
 dbgrid1.Columns[2].Width:=32;
 dbgrid1.Columns[3].Width:=48;
 dbgrid1.Columns[4].Width:=48;
 dbgrid1.Columns[5].Width:=60;
 dbgrid1.Columns[6].Width:=120;
 dbgrid1.Columns[7].Width:=60;
 dbgrid1.Columns[8].Width:=60;
 dbgrid1.Columns[9].Width:=48;
 dbgrid1.Columns[10].Width:=60;
 dbgrid1.Columns[11].Width:=96;
 num:=trim(dbgrid1.Fields[0].Text);//获得门诊编号
 //根据显示的病人的门诊划价单显示其划价药品或医疗项目明细
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select distinct a.编号,a.药品编号,b.名称,a.单价,a.数量,a.金额 from 门诊划价明细 a,v收费项目及药品 b');
 adoquery1.SQL.Add(' where (a.药品编号=b.编号)and(a.划价编号='''+num+''')');
 adoquery1.Open;
 //显示划价后的应收金额
 edit5.Text:=trim(dbgrid1.Fields[5].Text);

end;

//-----设置显示病人的药品和医疗项目收费明细表宽度------
procedure TCash.DataSource2DataChange(Sender: TObject; Field: TField);
var
i:integer;
begin
 for i:=0 to 5 do
  dbgrid2.Columns[i].Width:=80;
end;

//---------根据收款文本框的输入金额，显示找零金额---------
procedure TCash.Edit6Change(Sender: TObject);
var
 debt,pay:double;
begin
 if trim(edit6.Text)='' then exit;
 debt:=strtofloat(edit5.Text);
 pay:=strtofloat(edit6.Text);
 edit7.Text:=floattostr(pay-debt);
end;

procedure TCash.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if (not(key IN ['0'..'9',#13,#46,#8]))THEN //只允许该文本框输入数字和小数点
   key:=#0
end;

//-------------门诊收款-------------
procedure TCash.BitBtn2Click(Sender: TObject);
begin
if trim(edit7.Text)<>'' then
if strtofloat(edit7.Text)<0 then//收款应大于需支付金额
 begin
 showmessage('收款不足以支付医疗费用');
 exit;
 end
 else
 begin //更新门诊划价单，将病人的帐单设置为已收费
  adocommand1.CommandText:='update 门诊划价 set 是否收费=''是'',收费时间='''+datetostr(date)+' '+timetostr(time)+ ''' where 编号='''+trim(dbgrid1.Fields[0].Text)+'''';
  adocommand1.Execute;
  adodataset1.Active:=false;
  adodataset1.Active:=true;
 end;
end;

procedure TCash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//-----------根据条件查询未收费的门诊单----------
procedure TCash.BitBtn1Click(Sender: TObject);
var
time1,time2:string;
begin
   //设置查询时间变量，如果无输入则默认为一个较大的时间值，以便查出所有记录
   if trim(edit3.Text)='' then
    time1:='1900-1-1 01:00:00'
    else
    time1:=edit3.Text;

   if trim(edit4.Text)='' then
    time2:='2099-1-1 01:00:00'
   else
    time2:=edit4.Text;

   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select a.* ,b.姓名,b.性别 from 门诊划价 a, 门诊挂号 b');
   adoquery1.SQL.Add(' where (a.挂号编号=b.编号)and(a.是否收费=''否'')');
   adoquery1.SQL.Add('and(a.编号 like ''%'+edit1.Text+'%'')');
   adoquery1.SQL.Add('and(b.姓名 like ''%'+edit2.Text+'%'')');
   adoquery1.SQL.Add('and(a.划价时间>'''+time1+''')and(a.划价时间<'''+time2+''')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到表中去
   adodataset1.Clone(adoquery1,ltUnspecified);
end;

//双击文本框，出现之前约8小时时间值和当前时间值
procedure TCash.Edit3DblClick(Sender: TObject);
begin
edit3.Text:=datetostr(date)+' '+timetostr(time-0.5);
end;

procedure TCash.Edit4DblClick(Sender: TObject);
begin
edit4.Text:=datetostr(date)+' '+timetostr(time);
end;

end.
