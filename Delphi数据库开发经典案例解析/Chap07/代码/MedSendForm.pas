unit MedSendForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, ImgList,
  ComCtrls, ToolWin, Buttons;

type
  TMedSend = class(TForm)
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
    ADOCommand1: TADOCommand;
    BitBtn2: TBitBtn;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);



    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3DblClick(Sender: TObject);
    procedure Edit4DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MedSend: TMedSend;

implementation

{$R *.dfm}
//-----根据显示的病人的门诊划价单显示其划价药品或医疗项目明细-----
procedure TMedSend.DataSource1DataChange(Sender: TObject; Field: TField);
var
num:string;//保存划价编号
begin
 //设置门诊单表格字段宽度
 dbgrid1.Columns[0].Width:=80;
 dbgrid1.Columns[1].Width:=48;
 dbgrid1.Columns[2].Width:=32;
 dbgrid1.Columns[3].Width:=48;
 dbgrid1.Columns[4].Width:=48;
 dbgrid1.Columns[5].Width:=48;
 dbgrid1.Columns[6].Width:=48;
 dbgrid1.Columns[7].Width:=80;
 dbgrid1.Columns[8].Width:=48;
 dbgrid1.Columns[9].Width:=48;
 dbgrid1.Columns[10].Width:=80;
 dbgrid1.Columns[11].Width:=48;
 num:=trim(dbgrid1.Fields[0].Text);

 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select distinct a.编号,a.药品编号,b.名称,a.单价,a.数量,a.金额 from 门诊划价明细 a,v收费项目及药品 b');
 adoquery1.SQL.Add(' where (a.药品编号=b.编号)and(a.划价编号='''+num+''')');
 adoquery1.Open;
end;

//-----设置药品单表格中字段宽度-----
procedure TMedSend.DataSource2DataChange(Sender: TObject; Field: TField);
var
i:integer;
begin
 for i:=0 to 5 do
  dbgrid2.Columns[i].Width:=80;
end;



procedure TMedSend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//--------查询病人已收费的门诊单----------
procedure TMedSend.BitBtn1Click(Sender: TObject);
var
time1,time2:string;
begin
   //与收费窗体中功能相同，用于设置查询时间和默认值
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
   adoquery1.SQL.Add(' where (a.挂号编号=b.编号)and(a.是否收费=''是'')and(a.是否发药=''否'')');
   adoquery1.SQL.Add('and(a.编号 like ''%'+edit1.Text+'%'')');
   adoquery1.SQL.Add('and(b.姓名 like ''%'+edit2.Text+'%'')');
   adoquery1.SQL.Add('and(a.划价时间>'''+time1+''')and(a.划价时间<'''+time2+''')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到表中去
   adodataset1.Clone(adoquery1,ltUnspecified);
end;

//----双击文本框，显示之前8小时时间和当前时间------
procedure TMedSend.Edit3DblClick(Sender: TObject);
begin
edit3.Text:=datetostr(date)+' '+timetostr(time-0.5);
end;

procedure TMedSend.Edit4DblClick(Sender: TObject);
begin
edit4.Text:=datetostr(date)+' '+timetostr(time);
end;

//-----选择某个病人，执行发药储存过程-------
procedure TMedSend.BitBtn2Click(Sender: TObject);
var
id:string;
begin
 id:=trim(dbgrid1.Fields[0].Text);
 if id='' then
  begin
   showmessage('请选择一个病人再发药');
   exit;
  end;
  adocommand1.CommandText:='exec sf_药品发出 '+id;
  adocommand1.Execute;
  adodataset1.Active:=false;
  adodataset1.Active:=true;


end;

end.
