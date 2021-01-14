unit PriceConfirmForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, DB, DBGrids, ADODB, Buttons;

type
  TPriceConfirm = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DataSource2: TDataSource;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid2: TDBGrid;
    ADODataSet1: TADODataSet;
    Edit5: TEdit;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    
    procedure ComboBox1DropDown(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PriceConfirm: TPriceConfirm;
  curRow,curCol:integer;
implementation

{$R *.dfm}
//------当单击门诊号下拉列表框时，显示未划价门诊病人信息表---------
procedure TPriceConfirm.ComboBox1DropDown(Sender: TObject);
begin
  dbgrid1.Visible:=true;
  dbgrid1.SetFocus;
end;
//读入选择的门诊病人信息
procedure TPriceConfirm.DBGrid1DblClick(Sender: TObject);
begin
 combobox1.Text:=trim(dbgrid1.Fields[0].Text);
 edit1.Text:=trim(dbgrid1.Fields[1].Text);
 edit2.Text:=trim(dbgrid1.Fields[2].Text);
 edit3.Text:=trim(dbgrid1.Fields[3].Text);
 edit4.Text:=trim(dbgrid1.Fields[7].Text);
 dbgrid1.Visible:=false;
end;

//---------设置数据表字段宽度-------------
procedure TPriceConfirm.DataSource1DataChange(Sender: TObject;
  Field: TField);
var
i:integer;
begin
 dbgrid1.Columns[0].Width:=96;
 for i:=1 to 9 do
  dbgrid1.Columns[i].Width:=64;
end;

//------设置输入药品的表格字段宽度和表头----------
procedure TPriceConfirm.FormShow(Sender: TObject);
var
i:integer;
begin
 stringgrid1.ColWidths[0]:=136;
 stringgrid1.ColWidths[1]:=128;
 stringgrid1.ColWidths[2]:=80;
 stringgrid1.ColWidths[3]:=80;
 stringgrid1.ColWidths[4]:=64;
 stringgrid1.ColWidths[5]:=80;
 stringgrid1.ColWidths[6]:=64;
 for i:=0 to 49 do
  stringgrid1.RowHeights[i]:=21;
 stringgrid1.Cells[0,0]:='编号(输入药品拼音回车)';
 stringgrid1.Cells[1,0]:='名称';
 stringgrid1.Cells[2,0]:='规格';
 stringgrid1.Cells[3,0]:='单位';
 stringgrid1.Cells[4,0]:='单价';
 stringgrid1.Cells[5,0]:='数量';
 stringgrid1.Cells[6,0]:='金额';
end;


procedure TPriceConfirm.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
var
 rt:Trect;
begin
 if curRow=0 then curRow:=1;//表头一行不允许选择并输入

 if (key=#13)and(curCol=0)and(stringgrid1.Cells[0,curRow]<>'') then
  begin
    //根据输入的药品拼音，显示药品列表，供用户选择输入
    adodataset1.Filter:='拼音码 like ''%'+stringgrid1.Cells[0,curRow]+'%''';
    adodataset1.Filtered:=true;
    rt:=stringgrid1.CellRect(curCol,curRow);
    dbgrid2.Left:=rt.Left+stringgrid1.Left;
    dbgrid2.Top:=rt.Top+23+stringgrid1.Top;

    dbgrid2.Visible:=true;
    dbgrid2.SetFocus;

  end;
end;

//-------------确定选中的单元格并进行药品费用计算-----------
procedure TPriceConfirm.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
price,num,sum:double;
i:integer;
begin
  //只允许编号拼音和数量字段输入，其他信息不允许修改
  if (ACol=0)or(ACol=5) then
   stringgrid1.Options:=stringgrid1.Options+[goEditing]
  else
   stringgrid1.Options:=stringgrid1.Options-[goEditing];
  curCol:=ACol;
  curRow:=ARow;

  //当药品信息，数量不为空时，才能进行计算
  sum:=0;
  for i:=1 to 49 do
  if (stringgrid1.Cells[0,i]<>'')and(stringgrid1.Cells[5,i]<>'') then
   begin
 //计算某药品或者检查的费用
   num:=strtofloat(stringgrid1.Cells[5,i]);
   price:=strtofloat(stringgrid1.Cells[4,i]);
   stringgrid1.Cells[6,i]:=floattostr(price*num);
   sum:=sum+price*num; //计算合计金额
   edit5.Text:=floattostr(sum);
   end;
 
end;

//-----在药品列表中单击回车，将药品信息输入到窗体的表格中-----
procedure TPriceConfirm.DBGrid2DblClick(Sender: TObject);
begin
stringgrid1.Cells[0,curRow]:=dbgrid2.Fields[0].Text;
stringgrid1.Cells[1,curRow]:=dbgrid2.Fields[1].Text;
stringgrid1.Cells[2,curRow]:=dbgrid2.Fields[2].Text;
stringgrid1.Cells[3,curRow]:=dbgrid2.Fields[3].Text;
stringgrid1.Cells[4,curRow]:=dbgrid2.Fields[4].Text;
stringgrid1.Cells[5,curRow]:='1';
dbgrid2.Visible:=false;

end;

//----保存划价单-----
procedure TPriceConfirm.BitBtn1Click(Sender: TObject);
var
sql1,sql2,sql3,temp,maxPatient:string;
i,j,num:integer;
begin
//检查必填字段
if (trim(combobox1.Text)='')or(edit3.Text='')or(edit4.Text='') then
 begin
  showmessage('门诊号，科室，医生为必填字段');
  exit;
 end;
if (trim(edit5.Text)='') then
 begin
  showmessage('没有划价明细');
  exit;
 end;
 //生成新的门诊划价编号
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select max(编号) 最大编号 from 门诊划价');
 adoquery1.Open;
 if adoquery1.RecordCount>0 then
  begin
  temp:=copy(trim(adoquery1.fieldbyname('最大编号').AsString),5,7);
  num:=strtoint(temp)+1;
  if num<10 then maxPatient:=copy(datetostr(date),1,4)+'000000'+inttostr(num);
  if num>9 then maxPatient:=copy(datetostr(date),1,4)+'00000'+inttostr(num);
  if num>99 then maxPatient:=copy(datetostr(date),1,4)+'0000'+inttostr(num);
  if num>999 then maxPatient:=copy(datetostr(date),1,4)+'000'+inttostr(num);
  if num>9999 then maxPatient:=copy(datetostr(date),1,4)+'00'+inttostr(num);
  if num>99999 then maxPatient:=copy(datetostr(date),1,4)+'0'+inttostr(num);
  if num>999999 then maxPatient:=copy(datetostr(date),1,4)+inttostr(num);
  end
 else
  maxPatient:=copy(datetostr(date),1,4)+'0000001';

 //保存划价信息
  sql1:='insert into 门诊划价([编号],[科室],[挂号编号],[医生],[划价时间],[划价金额],[是否收费],[是否发药]) ';
  sql2:='values('''+maxPatient+''','''+edit3.Text+''','''+combobox1.Text+''','''+edit4.Text;
  sql3:=''','''+datetostr(date)+' '+timetostr(time)+''',cast('''+edit5.Text+''' as money),''否'',''否'')';
  adocommand1.CommandText:=sql1+sql2+sql3;
  adocommand1.Execute;

//保存划价明细
 for i:=1 to 49 do
 if (stringgrid1.Cells[0,i]<>'')and(stringgrid1.Cells[6,i]<>'') then
 begin
 sql1:='insert into 门诊划价明细([划价编号], [药品编号], [单价], [数量], [金额])';
 sql2:=' values('''+maxPatient+''','''+stringgrid1.Cells[0,i]+''','''+stringgrid1.Cells[4,i];
 sql3:=''','''+stringgrid1.Cells[5,i]+''','''+stringgrid1.Cells[6,i]+''')';
 adocommand1.CommandText:=sql1+sql2+sql3;
 adocommand1.Execute;
 end;

//修改已经划价病人资料
 adocommand1.CommandText:='update 门诊挂号 set 是否已划价=''是'' where 编号='''+combobox1.Text+'''';
 adocommand1.Execute;
//刷新挂号病人数据
 adotable1.Active:=false;
 adotable1.Active:=true;

//清除原来输入的数据
combobox1.Clear;
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
for i:=0 to 6 do
 for j:=1 to 49 do
  stringgrid1.Cells[i,j]:='';

end;

procedure TPriceConfirm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

//------------取消输入保存----------------
procedure TPriceConfirm.BitBtn2Click(Sender: TObject);
var
i,j:integer;
begin
//清除原来输入的数据
combobox1.Clear;
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
for i:=0 to 6 do
 for j:=1 to 49 do
  stringgrid1.Cells[i,j]:='';
end;

end.
