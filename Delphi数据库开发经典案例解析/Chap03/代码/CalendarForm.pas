unit CalendarForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, DB, Grids, DBGrids, ADODB, ExtCtrls,
  ComCtrls, ToolWin, Buttons;

type
  TCalendar = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn11: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ToolButton1: TToolButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ToolButton3: TToolButton;
    BitBtn10: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ADOQuery2: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    
  private
    { Private declarations }
  public
    { Public declarations }
  maxorder,maxdate,maxyear:integer;
  end;

var
  Calendar: TCalendar;

implementation

uses MainForm;

{$R *.dfm}
 //-----------关闭窗体--------------
procedure TCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//------------首条数据--------------
procedure TCalendar.BitBtn1Click(Sender: TObject);
begin
datasource1.DataSet.First;
end;

//------------前一条数据--------------
procedure TCalendar.BitBtn2Click(Sender: TObject);
begin
datasource1.DataSet.Prior;
end;

//------------下一条数据--------------
procedure TCalendar.BitBtn3Click(Sender: TObject);
begin
datasource1.DataSet.Next;
end;

//------------最后一条数据--------------
procedure TCalendar.BitBtn4Click(Sender: TObject);
begin
datasource1.DataSet.Last;
end;

//----------插入数据---------------------
procedure TCalendar.BitBtn5Click(Sender: TObject);
begin
datasource1.DataSet.Insert;
//添加数据时，为右边文本框添加默认值，防止添加错误的数据
maxorder:=adoquery2.fieldbyname('maxorder').AsInteger;
maxdate:=adoquery2.fieldbyname('maxdate').AsInteger;
maxyear:=adoquery2.fieldbyname('maxyear').AsInteger;
dbedit1.Text:=inttostr(maxyear);
dbedit2.Text:=inttostr(maxorder+1);
dbedit3.Text:=inttostr(maxdate+2);

//将插入，删除，修改和移动按钮关闭，防止错误操作
bitbtn6.Enabled:=false;
bitbtn7.Enabled:=false;
bitbtn1.Enabled:=false;
bitbtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn4.Enabled:=false;
bitbtn5.Enabled:=false;
//打开保存和取消按钮的使能，允许保存或者取消
bitbtn8.Enabled:=true;
bitbtn9.Enabled:=true;
//允许修改文本框中内容
dbedit1.ReadOnly:=false;
dbedit2.ReadOnly:=false;
dbedit3.ReadOnly:=false;
dbedit4.ReadOnly:=false;
dbmemo1.ReadOnly:=false;
end;

//----------查询------------------
procedure TCalendar.BitBtn11Click(Sender: TObject);
begin
//查询数据
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from 工厂日历 where (年份 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(计划期 like ''%'+edit2.Text+'%'')');
adoquery1.Open;

end;

//---------------查询时对enter键的响应----------------------
procedure TCalendar.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn11.Click;
end;

procedure TCalendar.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn11.Click;
end;

//-----------保存操作--------------------
procedure TCalendar.BitBtn8Click(Sender: TObject);
begin
//对输入的数据进行校验
 if (dbedit1.Text='')or(dbedit2.Text='')or(dbedit3.Text='')or(dbedit4.Text='') then
 showmessage('输入不能为空')
  else if strtoint(dbedit3.Text)>strtoint(dbedit4.Text) then
 showmessage('开始日期不能晚于结束日期')
 else
 begin
 datasource1.DataSet.Post;
 //将插入，删除，修改和移动按钮打开
bitbtn6.Enabled:=true;
bitbtn7.Enabled:=true;
bitbtn1.Enabled:=true;
bitbtn2.Enabled:=true;
bitbtn3.Enabled:=true;
bitbtn4.Enabled:=true;
bitbtn5.Enabled:=true;
//关闭保存和取消按钮的使能
bitbtn8.Enabled:=false;
bitbtn9.Enabled:=false;
//允许修改
dbedit1.ReadOnly:=true;
dbedit2.ReadOnly:=true;
dbedit3.ReadOnly:=true;
dbedit4.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
 end;

end;

//---------------取消操作-------------------
procedure TCalendar.BitBtn9Click(Sender: TObject);
begin
datasource1.DataSet.Cancel;
 //将插入，删除，修改和移动按钮打开
bitbtn6.Enabled:=true;
bitbtn7.Enabled:=true;
bitbtn1.Enabled:=true;
bitbtn2.Enabled:=true;
bitbtn3.Enabled:=true;
bitbtn4.Enabled:=true;
bitbtn5.Enabled:=true;
//关闭保存和取消按钮的使能
bitbtn8.Enabled:=false;
bitbtn9.Enabled:=false;
//不允许修改文本框中内容
dbedit1.ReadOnly:=true;
dbedit2.ReadOnly:=true;
dbedit3.ReadOnly:=true;
dbedit4.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
end;

//-------------关闭窗体------------------
procedure TCalendar.BitBtn10Click(Sender: TObject);
begin
close;
end;

//----------编辑某条数据---------------
procedure TCalendar.BitBtn6Click(Sender: TObject);
begin
datasource1.DataSet.Edit;
//将插入，删除，修改和移动按钮关闭，防止错误操作
bitbtn6.Enabled:=false;
bitbtn7.Enabled:=false;
bitbtn1.Enabled:=false;
bitbtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn4.Enabled:=false;
bitbtn5.Enabled:=false;
//打开保存和取消按钮的使能，允许保存或者取消
bitbtn8.Enabled:=true;
bitbtn9.Enabled:=true;
//允许修改
dbedit1.ReadOnly:=false;
dbedit2.ReadOnly:=false;
dbedit3.ReadOnly:=false;
dbedit4.ReadOnly:=false;
dbmemo1.ReadOnly:=false;
end;

//-------------删除数据-------------------------
procedure TCalendar.BitBtn7Click(Sender: TObject);
begin
if application.MessageBox('删除该条数据？','删除',MB_OKCANCEL)=ID_OK then
datasource1.DataSet.Delete;
end;

procedure TCalendar.DBGrid1DblClick(Sender: TObject);
begin
 if main.bomflag=3 then
 begin
 //取物料的编号和名称，存到主程序声明的公共变量中去
  main.str:=dbgrid1.Fields[0].AsString;
  main.str2:=dbgrid1.Fields[1].AsString;
  main.str3:=dbgrid1.Fields[2].AsString;
  main.str4:=dbgrid1.Fields[3].AsString;
//清除标志,关闭窗体
   main.bomflag:=0;
   main.n6.Click;
   close;
 end;

  if main.bomflag=5 then
 begin
 //取物料的编号和名称，存到主程序声明的公共变量中去
  main.str:=dbgrid1.Fields[0].AsString;
  main.str2:=dbgrid1.Fields[1].AsString;
  main.str3:=dbgrid1.Fields[2].AsString;
  main.str4:=dbgrid1.Fields[3].AsString;
//清除标志,关闭窗体
   main.bomflag:=0;
   main.MPS1.Click;
   close;
 end;
end;



end.
