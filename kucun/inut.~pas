unit inut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, ComCtrls, Menus, Grids,
  DBGrids, DBCtrls;

type
  Tinfm = class(TForm)
    inpl: TPanel;
    GroupBox3: TGroupBox;
    ADOQuery: TADOQuery;
    GroupBox1: TGroupBox;
    djbh: TLabel;
    jhrqbox: TDateTimePicker;
    Label9: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    GroupBox2: TGroupBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    kg: TComboBox;
    DBNavigator1: TDBNavigator;
    ADOQuery1: TADOQuery;
    Label3: TLabel;
    jhdw: TComboBox;
    bcbt: TSpeedButton;
    gbbt: TSpeedButton;
    sxbt: TSpeedButton;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure bcbtClick(Sender: TObject);
    procedure gbbtClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
      private
   price:integer;
     { Private declarations }
  public
    { Public declarations }
  end;

var
  infm: Tinfm;
  bsave:boolean;
implementation

uses mainut, rudut;

{$R *.dfm}

procedure Tinfm.FormCreate(Sender: TObject);
var
 Present: TDateTime;
 Year, Month, Day: Word;//定义时间变量
 sno,cno,vno:string;//单据编号变量
 llen:integer; //获取长度的变量
  sbh,sgg,sdw:TStringList;//根据名称获取编号
 i:integer;
begin
jhdw.Text:='';
kg.Text:='';

//ADOTable1.Active:=true;
//自动获取入库最大单据号
present:=now;
DecodeDate(Present, Year, Month, Day);

with adoquery do
  begin
   close;
   sql.Clear;
   sql.Add('select * from rkdb');
   open;
   if recordcount<1 then
     begin
     cno:='00001';
     vno:='ZDRK'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;
     end
     else
     begin
      close;
      sql.Clear;
      sql.Add('select max(单据编号) as maxno  from rkdb');
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
        vno:='ZDRK'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;

    end;
  end;
  djbh.Caption:=vno;
jhrqbox.Date:=date(); //获取当前日期
jhdw.Clear;
with adoquery do
  begin
  close;
  sql.clear;
  sql.add('select * from ghdwb');
  open;
  first;
  while not eof do
  begin
  jhdw.Items.Add(fieldbyname('供货商').AsString);
  next;
  end;
end;
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
  sql.add('select * from rkb where 单据编号=:djbh');
  Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
  open;
end; 

DBGrid1.Columns[0].Width:=30;
DBGrid1.Columns[1].Width:=100;
DBGrid1.Columns[2].Width:=70;
DBGrid1.Columns[3].Width:=70;
DBGrid1.Columns[4].Width:=70;
DBGrid1.Columns[5].Width:=70;
DBGrid1.Columns[6].Width:=70;
DBGrid1.Columns[7].Width:=150;
DBGrid1.Columns[8].Width:=0;
DBGrid1.Columns[9].Width:=0;
DBGrid1.Columns[10].Width:=0;
DBGrid1.Columns[11].Width:=0;
i:=0;
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
end;

end;

procedure Tinfm.Button1Click(Sender: TObject);
 var
   sbh,sgg,sdw:TStringList;//根据名称获取编号
 i:integer;
begin
 with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add('select * from bhb');
    open;
    first;
    while not eof do
      begin
        DBGrid1.Columns[0].PickList.Strings[i]:=fieldbyname('名称').asstring;
        inc(i);
        next;
    end;
end;
end;

procedure Tinfm.DBGrid1CellClick(Column: TColumn);
begin
 adoquery1.edit;
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
  end;
  if (DBGrid1.Fields[3].AsString<>'') and (DBGrid1.Fields[5].AsString<>'') then
   DBGrid1.Fields[6].AsString:=floattostr(strtofloat(DBGrid1.Fields[3].AsString)*strtofloat(DBGrid1.Fields[5].AsString));
   DBGrid1.Fields[9].AsString:=DBGrid1.Fields[3].AsString;
   DBGrid1.Fields[10].AsString:=djbh.Caption;
   DBGrid1.Fields[11].AsString:='';
 end;

procedure Tinfm.bcbtClick(Sender: TObject);
var
str:string;
vbh:string;
ibqjh,iqmkc:integer;
fzje:double;
str1:string;
begin

  adoquery1.edit;
 if jhdw.Text='' then
 begin
   showmessage('请选择或者输入进货单位！');
   exit;
 end;
 if kg.Text='' then
 begin
   showmessage('请选择或者输入库存管理员！');
   exit;
 end;

 if   (DBGrid1.Fields[1].AsString='')   then
   begin
     showmessage('请选择材料名称！');
     exit;
   end;
   if   (DBGrid1.Fields[2].AsString='')   then
   begin
     showmessage('请单击规格下的输入格！');
     exit;
   end;
    if   (DBGrid1.Fields[3].AsString='')   then
   begin
     showmessage('请输入数量！');
     exit;
   end;
   if   (DBGrid1.Fields[5].AsString='')   then
   begin
     showmessage('请输入单价！');
     exit;
   end;
   if   (DBGrid1.Fields[6].AsString='')   then
   begin
     showmessage('请单击合计下的输入格！！');
     exit;
   end;
if  (DBGrid1.Fields[1].AsString='')  or (DBGrid1.Fields[3].AsString='') or (DBGrid1.Fields[5].AsString='') or (DBGrid1.Fields[6].AsString='') then
  begin
    str1:='提示：在入库记录中存在不完整信息,'+chr(13)+chr(13)+'可能是"名称"或者"数量"或者"单价"或者"总金额"为空';
    str1:=str1+chr(13)+chr(13)+'1.如果"名称"为空请单击"名称"下面的输入格在下拉框中选择名称';
    str1:=str1+chr(13)+chr(13)+'2.如果"规格或者单位为空"为空请单击"规格或者单位"下面的输入格';
    str1:=str1+chr(13)+chr(13)+'3.如果"数量或者单价为空"为空请输入"数量或者单价"';
    str1:=str1+chr(13)+chr(13)+'4.如果"合计为空"为空在确定输入了数量和单价的情况下单击"合计"下面的输入格';
    showmessage(str1);
     exit;
 end;
 if  (DBGrid1.Fields[1].AsString<>'') and  (DBGrid1.Fields[3].AsString<>'') and (DBGrid1.Fields[5].AsString<>'') and (DBGrid1.Fields[6].AsString<>'') then
 adoquery1.Post;
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add('select * from rkb where 单据编号=:djbh');
    Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
    open;
    if recordcount<1 then
      begin
       showmessage('对不起你还没有录入入库数据,保存失败');
       exit;
      end;
   end;

   with adoquery do
     begin
       close;
       sql.clear;
       sql.Add('insert into rkdb(单据编号,进货单位,进货日期,保管人,经手人,入库日期 ) values(:djbh,:jhdw,:jhrq,:bgr,:jsr,:rkrq)');
        Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
        Parameters.ParamByName('jhdw').Value:=trim(jhdw.Text);
        Parameters.ParamByName('jhrq').Value:=datetostr(jhrqbox.Date);
        Parameters.ParamByName('bgr').Value:=trim(kg.Text);
        Parameters.ParamByName('jsr').Value:=mainfm.username;
        Parameters.ParamByName('rkrq').Value:=datetostr(date());
        try
        execsql;
       // showmessage('入库单保存成功');
        bsave:=true;
        except
        showmessage('入库单保存失败');
    end;
    end;
   //更新库存表
with adoquery2 do
 begin
    close;
    sql.Clear;
    sql.Add('select * from rkb where 单据编号=:djbh');
    Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
    open;
     if recordcount>=1 then
        begin
          first;
            while not eof do
               begin
                  vbh:=fieldbyname('编号').AsString;
                  ibqjh:=fieldbyname('数量').AsInteger;
                  fzje:=fieldbyname('总金额').AsFloat;
                  iqmkc:=fieldbyname('数量').AsInteger;
                  str:='select * from kcb where 编号=:vbh';
                   with adoquery3 do
                       begin
                          close;
                          sql.Clear;
                          sql.Add(str);
                          Parameters.ParamByName('vbh').Value:=vbh;
                          open;
                          if recordcount=1 then
                            begin
                            iqmkc:=iqmkc+fieldbyname('期末库存').AsInteger;
                            ibqjh:=ibqjh+fieldbyname('本期进货').asinteger;
                            fzje:=fzje+fieldbyname('总金额').AsFloat;
                            str:='update kcb set 本期进货=:ibqjh,期末库存=:iqmkc,';
                            str:=str+'总金额=:fzje where 编号=:vbh';
                              with adoquery do
                                begin
                                 close;
                                 sql.Clear;
                                 sql.Add(str);
                                 //Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
                                 Parameters.ParamByName('vbh').Value:=vbh;
                                 Parameters.ParamByName('ibqjh').Value:=ibqjh;
                                 Parameters.ParamByName('fzje').Value:=fzje;
                                 Parameters.ParamByName('iqmkc').Value:=iqmkc;
                                 execsql;
                               end;
                             end
                           else
                             begin
                               str:='insert into kcb(名称,规格,单位,编号,本期进货,期末库存,总金额,id) select';
                               str:=str+' 名称,规格,单位,编号,数量,数量,总金额,id from rkb where 单据编号=:djbh and 编号=:vbh';
                               with adoquery do
                                  begin
                                   close;
                                   sql.Clear;
                                   sql.Add(str);
                                   Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
                                   Parameters.ParamByName('vbh').Value:=vbh;
                                   execsql;
                                  end;
                             end;
               end;
           next;
          end
       end;
       end;
    showmessage('入库单保存成功');   
    sxbt.Click;
end;

procedure Tinfm.gbbtClick(Sender: TObject);
begin
if  not bsave  then
begin
if messagedlg('你还没有保存入库单!确定关闭吗,如果关闭数据将会丢失！',mtconfirmation,[mbyes,mbno],0)=mryes then
infm.close;
end
else
close;
end;
procedure Tinfm.FormShow(Sender: TObject);
begin
bsave:=false;
end;

end.
