unit BookBorrowForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, StdCtrls, ExtCtrls, Grids, DB, ADODB,
  Mask, DBCtrls;

type
  TBookBorrow = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit5: TEdit;
    Label2: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ADOQuery2: TADOQuery;
    Label6: TLabel;
    Label7: TLabel;
    ADOCommand1: TADOCommand;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     //已借出书的数目,本次借书数目和可借阅时间
     booknum,thisbook,keeptime:integer;
     //保存读者编号
     usernum:string;
    procedure cleargrid();

  end;

var
  BookBorrow: TBookBorrow;

implementation

{$R *.dfm}


procedure TBookBorrow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;


//-----------输入读者信息--------------
procedure TBookBorrow.Edit1KeyPress(Sender: TObject; var Key: Char);
var
name:string;
num:string;
i:integer;
begin
 //确定用哪个字段进行查询

 if radiobutton1.Checked then
  name:=radiobutton1.Caption;
 if radiobutton2.Checked then
  name:=radiobutton2.Caption;
  //清空借书信息
  booknum:=0;
  thisbook:=0;
  label6.Caption:='已借书'+inttostr(booknum)+'本';
  label7.Caption:='本次借书'+inttostr(thisbook)+'本';

if key=#13 then
  begin
    //显示读者信息
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add('select a.*,b.图书册书 from 读者信息 a,读者类型 b where (a.'+name+'='''+edit1.Text+''')and(a.类型=b.类型)');
    adoquery1.Open;
    //储存读者信息
    usernum:=adoquery1.fieldbyname('编号').AsString;

    //查阅读者已经借阅的书的信息
    num:=adoquery1.FieldByName('编号').AsString;
    adoquery2.Close;
    adoquery2.SQL.Clear;
    adoquery2.SQL.Add('select a.*,b.书名,b.出版社,b.价格 from 图书借阅 a,图书信息 b where (读者编号='''+num+''')and(a.图书编号=b.编号)and(a.状态=''未还'')');
    adoquery2.Open;
    i:=1;
    //将查阅到的已经借出而且未还的书的信息显示在表格中

    cleargrid();
    while not adoquery2.Eof do
     begin
      stringgrid1.Cells[0,i]:=adoquery2.fieldbyname('状态').AsString;
      stringgrid1.Cells[1,i]:=adoquery2.fieldbyname('图书编号').AsString;
      stringgrid1.Cells[2,i]:=adoquery2.fieldbyname('书名').AsString;
      stringgrid1.Cells[3,i]:=adoquery2.fieldbyname('借阅时间').AsString;
      stringgrid1.Cells[4,i]:=adoquery2.fieldbyname('应还时间').AsString;
      stringgrid1.Cells[5,i]:=adoquery2.fieldbyname('出版社').AsString;
      stringgrid1.Cells[6,i]:=adoquery2.fieldbyname('价格').AsString;
      i:=i+1;
      adoquery2.Next;
     end;
     //显示已借和未借信息
     booknum:=i-1;
     label6.Caption:='已借书'+inttostr(booknum)+'本';
     //当输入的读者信息正确时，允许输入图书信息借书
     if dbedit3.Text<>'' then
     groupbox2.Enabled:=true
     else
     groupbox2.Enabled:=false;
     //光标跳到借阅图书输入文本框
     edit5.SetFocus;

  end;
end;

//清除stringgrid中的值
procedure TBookBorrow.cleargrid;
var
i,j:integer;
begin
 for i:=1 to 11 do
  for j:=0 to 6 do
   stringgrid1.Cells[j,i]:='';
end;


//-----------读者借书--------------
procedure TBookBorrow.Edit5KeyPress(Sender: TObject; var Key: Char);
var
name:string;
booktype:string;
i:integer;
begin
  //确定用哪个字段进行查询
  if radiobutton3.Checked then
  name:=radiobutton3.Caption;
 if radiobutton4.Checked then
  name:=radiobutton4.Caption;

  //根据输入的图书信息，加入读者新借入的图书信息
  if key=#13 then
   begin
    //如已借出的图书数量达到借书数量限制，则提示已满，不允许再借书
    if booknum-strtoint(dbedit3.text)>=0 then
     begin
       showmessage('达到借书数量上限，请先归还图书再借书');
       exit;
     end;
    adoquery2.Close;
    adoquery2.SQL.Clear;
    adoquery2.SQL.Add('select * from 图书信息 where '+name+'='''+edit5.Text+'''');
    adoquery2.Open;
    if adoquery2.FieldByName('编号').AsString<>'' then
     begin
     //判断是否读者已借有该书，如果已有，则不允许再借
     for i:=1 to 12 do
      if stringgrid1.Cells[1,i]=adoquery2.FieldByName('编号').AsString then
       begin
         showmessage('读者已借有该书，不允许再借');
         edit5.Clear;
         exit;
       end;


      //输入图书信息
      stringgrid1.Cells[0,booknum+1]:='新借';
      stringgrid1.Cells[1,booknum+1]:=adoquery2.fieldbyname('编号').AsString;
      stringgrid1.Cells[2,booknum+1]:=adoquery2.fieldbyname('书名').AsString;
      stringgrid1.Cells[5,booknum+1]:=adoquery2.fieldbyname('出版社').AsString;
      stringgrid1.Cells[6,booknum+1]:=adoquery2.fieldbyname('价格').AsString;
      booktype:=adoquery2.fieldbyname('类型').AsString;
      //计算图书的借书时间和归还时间
      adoquery2.Close;
      adoquery2.SQL.Clear;
      adoquery2.SQL.Add('select * from 图书类型 where 类型名称='''+booktype+'''');
      adoquery2.Open;
      keeptime:=adoquery2.fieldbyname('可借天数').AsInteger;
      stringgrid1.Cells[3,booknum+1]:=datetostr(date);
      stringgrid1.Cells[4,booknum+1]:=datetostr(date+keeptime);
     //更新借书信息
      booknum:=booknum+1;
      thisbook:=thisbook+1;
      label6.Caption:='已借书'+inttostr(booknum)+'本';
      label7.Caption:='本次借书'+inttostr(thisbook)+'本';
      //清空文本框，以便输入下一本书
      edit5.Clear;
      //允许保存或者取消新借书的记录
      toolbutton1.Enabled:=true;
      toolbutton2.Enabled:=true;


     end;
   end;


end;






procedure TBookBorrow.FormShow(Sender: TObject);
var
i,j:integer;
begin
  //设置表的宽度和表头
  stringgrid1.Cells[0,0]:='状态';
  stringgrid1.ColWidths[0]:=64;
  stringgrid1.Cells[1,0]:='编号';
  stringgrid1.ColWidths[1]:=128;
  stringgrid1.Cells[2,0]:='书名';
  stringgrid1.ColWidths[2]:=128;
  stringgrid1.Cells[3,0]:='借出时间';
  stringgrid1.ColWidths[3]:=64;
  stringgrid1.Cells[4,0]:='应还时间';
  stringgrid1.ColWidths[4]:=64;
  stringgrid1.Cells[5,0]:='出版社';
  stringgrid1.ColWidths[5]:=128;
  stringgrid1.Cells[6,0]:='书架';
  stringgrid1.ColWidths[6]:=64;
  //设置已借书信息和本次结束信息
  booknum:=0;
  thisbook:=0;
  label6.Caption:='已借书'+inttostr(booknum)+'本';
  label7.Caption:='本次借书'+inttostr(thisbook)+'本';


end;

//------------确定借书，向数据库中插入新记录---------
procedure TBookBorrow.ToolButton1Click(Sender: TObject);
var
i:integer;
maxnum:integer;
begin
//自动确定借阅编号
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select max(借阅编号) 最大编号 from 图书借阅');
adoquery2.Open;
maxnum:=adoquery2.FieldByName('最大编号').AsInteger;
maxnum:=maxnum+1;
//打开数据表【图书借阅】的插入许可
adocommand1.commandtext:='SET IDENTITY_INSERT 图书借阅 on';
adocommand1.execute;
//插入所有状态未新借的图书
 for i:=1 to 12 do
   if stringgrid1.Cells[0,i]='新借' then
    begin
      adocommand1.CommandText:='insert into 图书借阅([借阅编号], [图书编号], [读者编号], [借阅时间], [应还时间], [续借次数],  [状态]) values('''+inttostr(maxnum)+''','''+stringgrid1.Cells[1,i]+''','''+usernum+''','''+stringgrid1.Cells[3,i]+''','''+stringgrid1.cells[4,i]+''',''0'',''未还'')';
      adocommand1.Execute;
      maxnum:=maxnum+1;
    end;
//关闭插入许可并关闭【确定借书】按钮
adocommand1.commandtext:='SET IDENTITY_INSERT 图书借阅 off';
adocommand1.execute;
toolbutton1.Enabled:=false;
toolbutton2.Enabled:=false;
groupbox2.Enabled:=false;
cleargrid();
edit5.Clear;
edit1.Clear;

end;
//---------取消借书--------------
procedure TBookBorrow.ToolButton2Click(Sender: TObject);
begin
toolbutton1.Enabled:=false;
toolbutton2.Enabled:=false;
groupbox2.Enabled:=false;
cleargrid();
edit5.Clear;
edit1.Clear;
end;
//---------退出图书借阅窗体--------------
procedure TBookBorrow.ToolButton3Click(Sender: TObject);
begin
  if toolbutton1.Enabled=true then
   if application.MessageBox('尚未保存借书记录，是否直接退出？','确认退出',MB_OKCANCEL)=IDOK then
     close;
  if toolbutton1.Enabled=false then
   close;
end;

end.
