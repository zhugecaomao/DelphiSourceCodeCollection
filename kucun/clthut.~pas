unit clthut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ComCtrls, DBCtrls, StdCtrls,
  ExtCtrls, Buttons;

type
  Tclthfm = class(TForm)
    inpl: TPanel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    bcbt: TSpeedButton;
    gbbt: TSpeedButton;
    sxbt: TSpeedButton;
    Bevel2: TBevel;
    dy: TSpeedButton;
    kg: TComboBox;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    djbh: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    jhrqbox: TDateTimePicker;
    jhdw: TComboBox;
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
    procedure dyClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clthfm: Tclthfm;
  bsave:boolean;
implementation

uses mainut, thdyut;

{$R *.dfm}

procedure Tclthfm.FormCreate(Sender: TObject);
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
   sql.Add('select * from thdb');
   open;
   if recordcount<1 then
     begin
     cno:='00001';
     vno:='ZDTH'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;
     end
     else
     begin
      close;
      sql.Clear;
      sql.Add('select max(单据编号) as maxno  from thdb');
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
        vno:='ZDTH'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;

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
  sql.add('select * from thb where 单据编号=:djbh');
  Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
  open;
end; 

DBGrid1.Columns[0].Width:=30;
DBGrid1.Columns[1].Width:=100;
DBGrid1.Columns[2].Width:=70;
DBGrid1.Columns[3].Width:=130;
DBGrid1.Columns[4].Width:=70;
DBGrid1.Columns[5].Width:=70;
DBGrid1.Columns[6].Width:=70;
DBGrid1.Columns[7].Width:=70;
DBGrid1.Columns[8].Width:=150;
DBGrid1.Columns[9].Width:=0;
DBGrid1.Columns[10].Width:=0;
DBGrid1.Columns[11].Width:=0;
i:=0;
with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add('select 名称 from kcb');
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

procedure Tclthfm.DBGrid1CellClick(Column: TColumn);
var
 vbh:string;
 vsysl:integer;
 vdj:double;
 vsl:integer;
 i:integer;
begin
 i:=1;
 adoquery1.edit;
// if DBGrid1.Fields[0].AsString='' then
  //DBGrid1.AsString:='1';

    // else
   // DBGrid1.Fields[0].AsString:= inttostr(DBGrid1.Fields[0].asinteger+1);
 with adoquery do
 begin
 close;
 sql.clear;
 sql.add('select 规格,单位,编号,期末库存 from kcb where 名称=:mc');
 Parameters.ParamByName('mc').Value:=DBGrid1.Fields[1].AsString;
 open;
  DBGrid1.Fields[2].AsString:=fieldbyname('规格').AsString;
  DBGrid1.Fields[5].AsString:=fieldbyname('单位').AsString;
  DBGrid1.Fields[9].AsString:=fieldbyname('编号').AsString;
  vsl:=fieldbyname('期末库存').AsInteger;
  vbh:=fieldbyname('编号').AsString;
  end;
 if (DBGrid1.Fields[1].AsString<>'') then
 begin
  with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add('select rkb.单据编号 from rkb,rkdb where rkb.名称=:vmc and rkdb.进货单位=:jhdw  and rkb.单据编号=rkdb.单据编号 order by rkb.序号 desc');
    Parameters.ParamByName('vmc').Value:=trim(DBGrid1.Fields[1].AsString);
     Parameters.ParamByName('jhdw').Value:=trim(jhdw.Text);
    open;
    first;
    while not eof do
      begin
      if  (fieldbyname('单据编号').asstring<>'') and (i<=400) then
        DBGrid1.Columns[3].PickList.Strings[i]:=fieldbyname('单据编号').asstring;
        inc(i);
        next;
    end;
end;
end;
   if (DBGrid1.Fields[3].AsString<>'')   and (DBGrid1.Fields[1].AsString<>'') then
        begin
            with adoquery do
              begin
                close;
                sql.Clear;
                sql.Add('select 单价 from rkb where 单据编号=:djbh and 名称=:vmc');
                 Parameters.ParamByName('vmc').Value:=trim(DBGrid1.Fields[1].AsString);
                 Parameters.ParamByName('djbh').Value:=trim(DBGrid1.Fields[3].AsString);
                 open;
                 DBGrid1.Fields[6].AsString:=fieldbyname('单价').AsString;
              end;
        end;
  if (DBGrid1.Fields[4].AsString<>'') and (DBGrid1.Fields[6].AsString<>'') then
   begin
   DBGrid1.Fields[7].AsString:=floattostr(strtofloat(DBGrid1.Fields[4].AsString)*strtofloat(DBGrid1.Fields[6].AsString));
   DBGrid1.Fields[10].AsString:=trim(djbh.Caption);
   DBGrid1.Fields[11].AsString:='';
   end;

    if (DBGrid1.Fields[4].AsString<>'') and (strtoint(DBGrid1.Fields[4].AsString)>vsl)   then
         begin
             showmessage('库存剩余数量为'+inttostr( vsl)+'库存不足,请核对!');
             DBGrid1.Fields[4].AsString:=inttostr(vsl);
             exit;
        end;
  { with adoquery do
     begin
       close;
       sql.Clear;
       sql.Add('select * from rkb where 编号=:vbh order by 序号 desc');
       Parameters.ParamByName('vbh').Value:=vbh;
       open;
       first;
       DBGrid1.Fields[6].AsString:=fieldbyname('单价').AsString;
     end;  }

 { if (DBGrid1.Fields[1].AsString<>'') then
  begin
  with adoquery do
   begin
    close;
    sql.clear;
    sql.add('select 单价,编号,剩余数量,序号 from rkb where 编号=:vbh and 剩余数量<>0 order by 序号');
    Parameters.ParamByName('vbh').Value:=vbh;
    open;
    first;
    DBGrid1.Fields[5].AsString:=fieldbyname('单价').AsString;
    vxh:=fieldbyname('序号').AsString;
    vsysl:=fieldbyname('剩余数量').AsInteger;
    vdj:=fieldbyname('单价').AsFloat;
   end;
   end;
    if (DBGrid1.Fields[3].AsString<>'') then
      begin
       if (strtoint(DBGrid1.Fields[3].AsString)>vsysl) then
        begin
          showmessage('单价为'+floattostr(vdj)+'的剩余数量为'+inttostr( vsysl)+'请分两次出库!');
          DBGrid1.Fields[3].AsString:=inttostr(vsysl);
          DBGrid1.Fields[6].AsString:=floattostr(strtofloat(DBGrid1.Fields[3].AsString)*strtofloat(DBGrid1.Fields[5].AsString));
         exit;
        end;

       if (strtoint(DBGrid1.Fields[3].AsString)>vsl) then
         begin
             showmessage('库存剩余数量为'+inttostr( vsl)+'库存不足!');
             DBGrid1.Fields[3].AsString:=inttostr(vsl);
             DBGrid1.Fields[6].AsString:=floattostr(strtofloat(DBGrid1.Fields[3].AsString)*strtofloat(DBGrid1.Fields[5].AsString));
             exit;
        end;

      end;  }
end;

procedure Tclthfm.bcbtClick(Sender: TObject);
var
str:string;
vbh,vxh,vdjbh:string;
ibqjh,iqmkc:integer;
fzje:double;
vdj:double;
vsl,vsysl:integer;
begin
 if jhdw.Text='' then
 begin
   showmessage('请选择或者输入进货单位名称！');
   exit;
 end;
 if kg.Text='' then
 begin
   showmessage('请选择或者输入库存管理员！');
   exit;
 end;
 adoquery1.Edit;
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
    if   (DBGrid1.Fields[4].AsString='')   then
   begin
     showmessage('请输入数量！');
     exit;
   end;
   if   (DBGrid1.Fields[6].AsString='')   then
   begin
     showmessage('请选择入库单号然后点击单价下的输入格！');
     exit;
   end;
   if   (DBGrid1.Fields[7].AsString='')   then
   begin
     showmessage('请单击合计下的输入格！！');
     exit;
   end;
{if  (DBGrid1.Fields[1].AsString='')  or (DBGrid1.Fields[4].AsString='') or (DBGrid1.Fields[6].AsString='') or (DBGrid1.Fields[7].AsString='') then
  begin
    str1:='提示：在入库记录中存在不完整信息,'+chr(13)+chr(13)+'可能是"名称"或者"数量"或者"单价"或者"总金额"为空';
    str1:=str1+chr(13)+chr(13)+'1.如果"名称"为空请单击"名称"下面的输入格在下拉框中选择名称';
    str1:=str1+chr(13)+chr(13)+'2.如果"规格或者单位为空"为空请单击"规格或者单位"下面的输入格';
    str1:=str1+chr(13)+chr(13)+'3.如果"数量或者单价为空"为空请输入"数量或者单价"';
    str1:=str1+chr(13)+chr(13)+'4.如果"合计为空"为空在确定输入了数量和单价的情况下单击"合计"下面的输入格';
    showmessage(str1);
     exit;
 end; }
 if  (DBGrid1.Fields[1].AsString<>'') and  (DBGrid1.Fields[4].AsString<>'') and (DBGrid1.Fields[6].AsString<>'') and (DBGrid1.Fields[7].AsString<>'') then
 adoquery1.Post;
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add('select * from thb where 单据编号=:djbh');
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
       sql.Add('insert into thdb(单据编号,进货单位,退货日期,保管人,经手人,出库日期 ) values(:djbh,:jhdw,:jhrq,:bgr,:jsr,:rkrq)');
        Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
        Parameters.ParamByName('jhdw').Value:=trim(jhdw.Text);
        Parameters.ParamByName('jhrq').Value:=datetostr(jhrqbox.Date);
        Parameters.ParamByName('bgr').Value:=trim(kg.Text);
        Parameters.ParamByName('jsr').Value:=mainfm.username;
        Parameters.ParamByName('rkrq').Value:=datetostr(date());
        try
        execsql;
        mainfm.sdjbh:=trim(djbh.Caption);
        except
        showmessage('退货单保存失败');
    end;
    end;
      //更新库存表
with adoquery2 do
 begin
    close;
    sql.Clear;
    sql.Add('select * from thb where 单据编号=:djbh');
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
                  vsl:=fieldbyname('数量').AsInteger;
                  vdj:=fieldbyname('单价').AsInteger;
                  vdjbh:=fieldbyname('入库单号').AsString;
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
                            iqmkc:=fieldbyname('期末库存').AsInteger-iqmkc;
                            ibqjh:=ibqjh+fieldbyname('本期消耗').asinteger;
                            fzje:=fieldbyname('总金额').AsFloat-fzje;
                            str:='update kcb set 本期消耗=:ibqjh,期末库存=:iqmkc,';
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
                             end;
               end;
              str:='select * from rkb where 编号=:vbh and 剩余数量<>0 and 单价=:vdj  and 单据编号=:djbh order by 序号 desc';
                 with adoquery3 do
                       begin
                          close;
                          sql.Clear;
                          sql.Add(str);
                          Parameters.ParamByName('vbh').Value:=vbh;
                          Parameters.ParamByName('vdj').Value:=vdj;
                          Parameters.ParamByName('djbh').Value:=vdjbh;
                          open;
                          first;
                           begin
                            vsysl:=fieldbyname('剩余数量').AsInteger;
                            if vsysl>=vsl then
                            vsysl:=vsysl-vsl
                            else
                            vsysl:=0;
                            vxh:=fieldbyname('序号').AsString;
                            str:='update rkb set 剩余数量=:vsysl  where 序号=:vxh';
                            with adoquery do
                                begin
                                 close;
                                 sql.Clear;
                                 sql.Add(str);
                                 Parameters.ParamByName('vsysl').Value:=vsysl;
                                 Parameters.ParamByName('vxh').Value:=vxh;
                                 execsql;
                               end;
                             end;
                         end;    
           next;
          end
       end;
       end;
       bsave:=true;
     sxbt.Click;
end;

procedure Tclthfm.gbbtClick(Sender: TObject);
begin
if   bsave=false  then
begin
if messagedlg('你还没有保存退货单!确定关闭吗,如果关闭数据将会丢失！',mtconfirmation,[mbyes,mbno],0)=mryes then
close;
end
else
close;

end;

procedure Tclthfm.FormShow(Sender: TObject);
begin
bsave:=false;
end;

procedure Tclthfm.dyClick(Sender: TObject);
begin
thdyfm:=Tthdyfm.create(self);
thdyfm.dy.preview;
thdyfm.free;
end;

procedure Tclthfm.DBGrid1Enter(Sender: TObject);
var
 vbh:string;
 vsysl:integer;
 vdj:double;
 vsl:integer;
 i:integer;
begin
 i:=1;
 adoquery1.edit;
// if DBGrid1.Fields[0].AsString='' then
  //DBGrid1.AsString:='1';

    // else
   // DBGrid1.Fields[0].AsString:= inttostr(DBGrid1.Fields[0].asinteger+1);
 with adoquery do
 begin
 close;
 sql.clear;
 sql.add('select 规格,单位,编号,期末库存 from kcb where 名称=:mc');
 Parameters.ParamByName('mc').Value:=DBGrid1.Fields[1].AsString;
 open;
  DBGrid1.Fields[2].AsString:=fieldbyname('规格').AsString;
  DBGrid1.Fields[4].AsString:=fieldbyname('单位').AsString;
  DBGrid1.Fields[8].AsString:=fieldbyname('编号').AsString;
  vsl:=fieldbyname('期末库存').AsInteger;
  vbh:=fieldbyname('编号').AsString;
  end;
  if (DBGrid1.Fields[3].AsString<>'') and (DBGrid1.Fields[5].AsString<>'') then
   begin
   DBGrid1.Fields[6].AsString:=floattostr(strtofloat(DBGrid1.Fields[3].AsString)*strtofloat(DBGrid1.Fields[5].AsString));
   DBGrid1.Fields[9].AsString:=trim(djbh.Caption);
   DBGrid1.Fields[10].AsString:='';
   end;

    if (DBGrid1.Fields[3].AsString<>'') and (strtoint(DBGrid1.Fields[3].AsString)>vsl)   then
         begin
             showmessage('库存剩余数量为'+inttostr( vsl)+'库存不足,请核对!');
             DBGrid1.Fields[3].AsString:=inttostr(vsl);
             exit;
        end;
   with adoquery do
     begin
       close;
       sql.Clear;
       sql.Add('select * from rkb where 编号=:vbh order by 序号 desc');
       Parameters.ParamByName('vbh').Value:=vbh;
       open;
       first;
       DBGrid1.Fields[5].AsString:=fieldbyname('单价').AsString;
     end;
end;

end.
