unit cpckut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, Menus, Grids,
  DBGrids, DBCtrls;

type
  Tcpckfm = class(TForm)
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
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    jhrqbox: TDateTimePicker;
    khmc: TComboBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    ADOQuery: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    dy: TSpeedButton;
    Label6: TLabel;
    xmcb: TEdit;
    procedure gbbtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure bcbtClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dyClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lydjhClick(Sender: TObject);
    procedure khmcChange(Sender: TObject);
   
  private
  price:integer;
     { Private declarations }
  public
    { Public declarations }
    sdjbh:string;
  end;

var
  cpckfm: Tcpckfm;
  vsysl:integer;
  vnum:integer;
  bsave:boolean;
  vxh:string;
 
implementation

uses mainut, ckdjut, fhdaut, clthut,cllydut,cpckdyut, cpchdyut;

{$R *.dfm}

procedure Tcpckfm.gbbtClick(Sender: TObject);
begin
if  not bsave  then
begin
if messagedlg('你还没有保存出货单!确定关闭吗,如果关闭数据将会丢失！',mtconfirmation,[mbyes,mbno],0)=mryes then
close;
end
else
close;

end;

procedure Tcpckfm.FormCreate(Sender: TObject);
var
 Present: TDateTime;
 Year, Month, Day: Word;//定义时间变量
 sno,cno,vno:string;//单据编号变量
 llen:integer; //获取长度的变量
  sbh,sgg,sdw:TStringList;//根据名称获取编号
 i:integer;
 vcpmc:string;
begin
khmc.Text:='';
kg.Text:='';
xmcb.Text:='';
//自动获取入库最大单据号
present:=now;
DecodeDate(Present, Year, Month, Day);

with adoquery do
  begin
   close;
   sql.Clear;
   sql.Add('select * from cpckdb');
   open;
   if recordcount<1 then
     begin
     cno:='00001';
     vno:='CPCK'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;
     end
     else
     begin
      close;
      sql.Clear;
      sql.Add('select max(单据编号) as maxno  from cpckdb');
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
        vno:='CPCK'+inttostr(Year)+inttostr(Month)+inttostr(Day)+cno;

    end;
  end;
  djbh.Caption:=vno;
jhrqbox.Date:=date(); //获取当前日期
khmc.Clear;
with adoquery do
  begin
  close;
  sql.clear;
  sql.add('select * from ckdb');
  open;
  first;
  while not eof do
  begin
  khmc.Items.Add(fieldbyname('客户名称').AsString);
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
  sql.add('select * from cpckb where 单据编号=:djbh');
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
i:=0;
with adoquery do
  begin
    close;
    sql.Clear;
    sql.Add('select 名称 from cprkb group by 名称');
    open;
    first;
    vcpmc:='';
    while not eof do
      begin
      if fieldbyname('名称').asstring<>vcpmc then
       begin
        DBGrid1.Columns[1].PickList.Strings[i]:=fieldbyname('名称').asstring;
        inc(i);
         vcpmc:=fieldbyname('名称').asstring;
        end;
        next;
    end;
end;

end;

procedure Tcpckfm.DBGrid1CellClick(Column: TColumn);
var
 vbh,vmc,vgg:string;
 vsysl:integer;
 vdj:double;
 vsl:integer;
begin
 adoquery1.edit;
 with adoquery do
 begin
 close;
 sql.clear;
 sql.add('select * from cprkb where 名称=:mc');
 Parameters.ParamByName('mc').Value:=DBGrid1.Fields[1].AsString;
 open;
  DBGrid1.Fields[2].AsString:=fieldbyname('规格').AsString;
  DBGrid1.Fields[4].AsString:=fieldbyname('单位').AsString;
    end;
  if (DBGrid1.Fields[3].AsString<>'') and (DBGrid1.Fields[5].AsString<>'') then
   begin
   DBGrid1.Fields[6].AsString:=floattostr(strtofloat(DBGrid1.Fields[3].AsString)*strtofloat(DBGrid1.Fields[5].AsString));
   DBGrid1.Fields[8].AsString:=trim(djbh.Caption);
   DBGrid1.Fields[9].AsString:='';
   end;
  if (DBGrid1.Fields[1].AsString<>'') and (DBGrid1.Fields[2].AsString<>'') then
  begin
  with adoquery do
   begin
    close;
    sql.clear;
    sql.add('select * from cpkcb where 名称=:vmc and 规格=:vgg');
    Parameters.ParamByName('vmc').Value:=DBGrid1.Fields[1].AsString;
    Parameters.ParamByName('vgg').Value:=DBGrid1.Fields[2].AsString;
    open;
      vsysl:=fieldbyname('数量').AsInteger;

    if (DBGrid1.Fields[3].AsString<>'') then
      begin
       if (strtoint(DBGrid1.Fields[3].AsString)>vsysl) then
        begin
          showmessage('库存数量为'+inttostr( vsysl)+'不满足你出货数量请核对!');
          exit;
        end;
      end;
       end;
   end;
  end;

procedure Tcpckfm.bcbtClick(Sender: TObject);
var
str:string;
vbh,vmc,vgg:string;
ibqjh,iqmkc:integer;
fzje:double;
vsysl:integer;
vxh:string;
vsl:integer;
begin
adoquery1.Edit;
 if khmc.Text='' then
 begin
   showmessage('请选择或者输入客户名称！');
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
{if  (DBGrid1.Fields[1].AsString='')  or (DBGrid1.Fields[3].AsString='') or (DBGrid1.Fields[5].AsString='') or (DBGrid1.Fields[6].AsString='') then
  begin
    str1:='提示：在入库记录中存在不完整信息,'+chr(13)+chr(13)+'可能是"名称"或者"数量"或者"单价"或者"总金额"为空';
    str1:=str1+chr(13)+chr(13)+'1.如果"名称"为空请单击"名称"下面的输入格在下拉框中选择名称';
    str1:=str1+chr(13)+chr(13)+'2.如果"规格或者单位为空"为空请单击"规格或者单位"下面的输入格';
    str1:=str1+chr(13)+chr(13)+'3.如果"数量或者单价为空"为空请输入"数量或者单价"';
    str1:=str1+chr(13)+chr(13)+'4.如果"合计为空"为空在确定输入了数量和单价的情况下单击"合计"下面的输入格';
    showmessage(str1);
     exit;
 end;  }
 if  (DBGrid1.Fields[1].AsString<>'') and  (DBGrid1.Fields[3].AsString<>'') and (DBGrid1.Fields[5].AsString<>'') and (DBGrid1.Fields[6].AsString<>'') then
 adoquery1.Post;
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add('select * from cpckb where 单据编号=:djbh');
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
       sql.Add('insert into cpckdb(单据编号,客户名称,项目成本,保管人,经手人,出库日期) values(:djbh,:jhdw,:xmcb,:bgr,:jsr,:rkrq)');
        Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
        Parameters.ParamByName('jhdw').Value:=trim(khmc.Text);
        Parameters.ParamByName('xmcb').Value:=trim(xmcb.Text);
        Parameters.ParamByName('bgr').Value:=trim(kg.Text);
        Parameters.ParamByName('jsr').Value:=mainfm.username;
        Parameters.ParamByName('rkrq').Value:=datetostr(date());
        try
        execsql;
        bsave:=true;
          mainfm.sdjbh:=trim(djbh.Caption);
        except
        showmessage('成品出库单保存失败');
    end;
    end;
    with adoquery2 do
 begin
    close;
    sql.Clear;
    sql.Add('select * from cpckb where 单据编号=:djbh');
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
                  vsl:=fieldbyname('数量').AsInteger;
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
                           ibqjh:=fieldbyname('数量').asinteger-ibqjh;
                           str:='update cpkcb set 数量=:ibqjh   where 名称=:vmc and 规格=:vgg';
                              with adoquery do
                                begin
                                 close;
                                 sql.Clear;
                                 sql.Add(str);
                                 //Parameters.ParamByName('djbh').Value:=trim(djbh.Caption);
                                     Parameters.ParamByName('ibqjh').Value:=ibqjh;
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
   showmessage('成品出库单保存成功');
   sxbt.Click;
end;

procedure Tcpckfm.FormShow(Sender: TObject);
begin
bsave:=false;
end;

procedure Tcpckfm.dyClick(Sender: TObject);
begin
cpchdyfm:=Tcpchdyfm.create(self);
cpchdyfm.dy.preview;
cpchdyfm.free;
end;

procedure Tcpckfm.SpeedButton1Click(Sender: TObject);
begin
 //cllydfm.top:=cpckfm.SpeedButton1.top;
// cllydfm.show;
end;

procedure Tcpckfm.lydjhClick(Sender: TObject);
begin
//lydjh.DeleteSelected;
end;

procedure Tcpckfm.khmcChange(Sender: TObject);
begin
 with adoquery do
   begin
    close;
    sql.Clear;
    sql.Add('select sum(总金额) as vzje from ckb,ckdb where   ckb.单据编号=ckdb.单据编号 and ckdb.客户名称=:vkhmc');
     Parameters.ParamByName('vkhmc').Value:=trim(khmc.Text);
     open;
     xmcb.Text:=trim(fieldbyname('vzje').AsString);
   end;
end;

end.
