unit cprkut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ComCtrls, DBCtrls, StdCtrls,
  ExtCtrls, Buttons;

type
  Tcprkfm = class(TForm)
    inpl: TPanel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    bcbt: TSpeedButton;
    gbbt: TSpeedButton;
    sxbt: TSpeedButton;
    Bevel2: TBevel;
    kg: TComboBox;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    djbh: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    jhrqbox: TDateTimePicker;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure bcbtClick(Sender: TObject);
    procedure gbbtClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cprkfm: Tcprkfm;
   bsave:boolean;
implementation

uses mainut, inut, tldyut;

{$R *.dfm}

procedure Tcprkfm.FormCreate(Sender: TObject);
var
 Present: TDateTime;
 Year, Month, Day: Word;//定义时间变量
 sno,cno,vno:string;//单据编号变量
 llen:integer; //获取长度的变量
  sbh,sgg,sdw:TStringList;//根据名称获取编号
 i:integer;
begin
kg.Text:='';

//ADOTable1.Active:=true;
//自动获取入库最大单据号
present:=now;
DecodeDate(Present, Year, Month, Day);

with adoquery do
  begin
   close;
   sql.Clear;
   sql.Add('select * from cprkdb');
   open;
   if recordcount<1 then
     begin
     cno:='00001';
     vno:='CPRK'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;
     end
     else
     begin
      close;
      sql.Clear;
      sql.Add('select max(单据编号) as maxno  from cprkdb');
      open;
      sno:=fieldbyname('maxno').AsString;
      llen:=strtoint(copy(sno,13,5))+1;
     case length(inttostr(llen)) of
     1:cno:='0000'+inttostr(strtoint(copy(sno,13,5))+1);
     2:cno:='000'+inttostr(strtoint(copy(sno,13,5))+1);
     3:cno:='00'+inttostr(strtoint(copy(sno,13,5))+1);
     4:cno:='0'+inttostr(strtoint(copy(sno,13,5))+1);
     5:cno:=inttostr(strtoint(copy(sno,13,5))+1);
      else
       cno:='00001';
    end;
        vno:='CPRK'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;

    end;
  end;
  djbh.Caption:=vno;
jhrqbox.Date:=date(); //获取当前日期
kg.Clear;
with adoquery do
  begin
  close;
  sql.clear;
   sql.add('select * from gzyb where 职务="库存管理员"');
 open;
  first;
  kg.Text:=fieldbyname('姓名').AsString;
  while not eof do
  begin
  kg.Items.Add(fieldbyname('姓名').AsString);
  next;
  end;
end;
with adoquery1 do
  begin
  close;
  sql.clear;
  sql.add('select * from cprkb where 单据编号=:djbh');
  Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
  open;
end; 

DBGrid1.Columns[0].Width:=30;
DBGrid1.Columns[1].Width:=100;
DBGrid1.Columns[2].Width:=70;
DBGrid1.Columns[3].Width:=70;
DBGrid1.Columns[4].Width:=70;
DBGrid1.Columns[5].Width:=150;
DBGrid1.Columns[6].Width:=0;
DBGrid1.Columns[7].Width:=0;

{i:=0;
with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add('select 名称 from bhb');
    open;
    first;
    while not eof do
      begin
        DBGrid1.Columns[1].PickList.Strings[i]:=fieldbyname('名称').asstring;
        inc(i);
        next;
    end;
end;}
end;

procedure Tcprkfm.DBGrid1CellClick(Column: TColumn);
var
vbh:string;
begin
adoquery1.edit;
DBGrid1.Fields[6].AsString:=djbh.Caption;
DBGrid1.Fields[7].AsString:='';
{
 with adoquery do
 begin
 close;
 sql.clear;
 sql.add('select 规格,单位,编号 from bhb where 名称=:mc');
 Parameters.ParamByName('mc').Value:=DBGrid1.Fields[1].AsString;
 open;
  DBGrid1.Fields[2].AsString:=fieldbyname('规格').AsString;
  DBGrid1.Fields[4].AsString:=fieldbyname('单位').AsString;
  DBGrid1.Fields[8].AsString:=fieldbyname('编号').AsString;
  vbh:=fieldbyname('编号').AsString;
  end;
  if (DBGrid1.Fields[3].AsString<>'') and (DBGrid1.Fields[5].AsString<>'') then
   DBGrid1.Fields[6].AsString:=floattostr(strtofloat(DBGrid1.Fields[3].AsString)*strtofloat(DBGrid1.Fields[5].AsString));
   DBGrid1.Fields[9].AsString:=djbh.Caption;
   DBGrid1.Fields[10].AsString:='';
   with adoquery do
     begin
       close;
       sql.Clear;
       sql.Add('select * from ckb where 编号=:vbh order by 序号 desc');
       Parameters.ParamByName('vbh').Value:=vbh;
       open;
       first;
       DBGrid1.Fields[5].AsString:=fieldbyname('单价').AsString;
     end; }
end;

procedure Tcprkfm.bcbtClick(Sender: TObject);
var
str:string;
vbh,vmc,vgg:string;
ibqjh,iqmkc:integer;
fzje:double;
begin
adoquery1.Edit;
 if kg.Text='' then
 begin
   showmessage('请选择或者输入库存管理员！');
   exit;
 end;

 if   (DBGrid1.Fields[1].AsString='')   then
   begin
     showmessage('请输入成品名称！');
     exit;
   end;
   if   (DBGrid1.Fields[2].AsString='')   then
   begin
     showmessage('请输入规格！');
     exit;
   end;
    if   (DBGrid1.Fields[3].AsString='')   then
   begin
     showmessage('请输入数量！');
     exit;
   end;
   {if  (DBGrid1.Fields[1].AsString='')  or (DBGrid1.Fields[3].AsString='') or (DBGrid1.Fields[5].AsString='') or (DBGrid1.Fields[6].AsString='') then
  begin
    str1:='提示：在入库记录中存在不完整信息,'+chr(13)+chr(13)+'可能是"名称"或者"数量"或者"单价"或者"总金额"为空';
    str1:=str1+chr(13)+chr(13)+'1.如果"名称"为空请单击"名称"下面的输入格在下拉框中选择名称';
    str1:=str1+chr(13)+chr(13)+'2.如果"规格或者单位为空"为空请单击"规格或者单位"下面的输入格';
    str1:=str1+chr(13)+chr(13)+'3.如果"数量或者单价为空"为空请输入"数量或者单价"';
    str1:=str1+chr(13)+chr(13)+'4.如果"合计为空"为空在确定输入了数量和单价的情况下单击"合计"下面的输入格';
    showmessage(str1);
     exit;
 end; }
 if  (DBGrid1.Fields[1].AsString<>'') and  (DBGrid1.Fields[3].AsString<>'') then
 adoquery1.Post;
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add('select * from cprkb where 单据编号=:djbh');
    Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
    open;
    if recordcount<1 then
      begin
       showmessage('对不起你还没有录入数据,保存失败');
       exit;
      end;
   end;

   with adoquery do
     begin
       close;
       sql.clear;
       sql.Add('insert into cprkdb(单据编号,保管人,经手人,入库日期 ) values(:djbh,:bgr,:jsr,:rkrq)');
        Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
        Parameters.ParamByName('bgr').Value:=trim(kg.Text);
        Parameters.ParamByName('jsr').Value:=mainfm.username;
        Parameters.ParamByName('rkrq').Value:=datetostr(date());
        try
         execsql;
          bsave:=true;
          except
        showmessage('成品入库单保存失败');
    end;
    end;

   //更新库存表

with adoquery2 do
 begin
    close;
    sql.Clear;
    sql.Add('select * from cprkb where 单据编号=:djbh');
    Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
    open;
     if recordcount>=1 then
        begin
          first;
            while not eof do
               begin
                  vmc:=fieldbyname('名称').AsString;
                  vgg:=fieldbyname('规格').AsString;
                  ibqjh:=fieldbyname('数量').AsInteger;
                  str:='select * from cpkcb where 名称=:vmc and 规格=:vgg';
                   with adoquery3 do
                       begin
                          close;
                          sql.Clear;
                          sql.Add(str);
                          Parameters.ParamByName('vmc').Value:=vmc;
                          Parameters.ParamByName('vgg').Value:=vgg;
                          open;
                          if recordcount=1 then
                            begin
                            ibqjh:=ibqjh+fieldbyname('数量').asinteger;
                            str:='update cpkcb set 数量=:ibqjh where 名称=:vmc and 规格=:vgg';
                              with adoquery do
                                begin
                                 close;
                                 sql.Clear;
                                 sql.Add(str);
                                 Parameters.ParamByName('ibqjh').Value:=ibqjh;
                                  Parameters.ParamByName('vmc').Value:=vmc;
                                  Parameters.ParamByName('vgg').Value:=vgg;
                                execsql;
                               end;
                             end
                           else
                             begin
                               str:='insert into cpkcb(名称,规格,单位,数量,id) select';
                               str:=str+' 名称,规格,单位,数量,id from cprkb where 单据编号=:djbh and 名称=:vmc and 规格=:vgg';
                               with adoquery do
                                  begin
                                   close;
                                   sql.Clear;
                                   sql.Add(str);
                                   Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
                                  Parameters.ParamByName('vmc').Value:=vmc;
                                  Parameters.ParamByName('vgg').Value:=vgg;
                                  execsql;
                                  end;
                             end;
               end;
           next;
          end
       end;
       end;
    showmessage('成品入库单保存成功');
    sxbt.Click;
end;

procedure Tcprkfm.gbbtClick(Sender: TObject);
begin
if  not bsave  then
begin
if messagedlg('你还没有保存成品入库单!确定关闭吗,如果关闭数据将会丢失！',mtconfirmation,[mbyes,mbno],0)=mryes then
close;
end
else
close;
end;


procedure Tcprkfm.FormShow(Sender: TObject);
begin
bsave:=false;
end;

end.
