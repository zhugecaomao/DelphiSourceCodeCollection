unit Unitkqsj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, XPMenu,
  DBGrids, DB;

type
  Tfrmkqsj = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbqsbh: TComboBox;
    Label3: TLabel;
    cbjzbh: TComboBox;
    Label4: TLabel;
    spdcx: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label5: TLabel;
    cmbtop: TComboBox;
    dsview: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure spdcxClick(Sender: TObject);
  private
    { Private declarations }
    ygbh,xm,bm,icid,zw:string;
    zs1: array[1..8] of string;
    carddate:string;
    card:array [1..8] of string;
    tables,tempsql,tj:string;
    LocalCount:integer;
    procedure qz(ygbh:string;skrq:string); //取得刷卡具体时间
    procedure comptime(ygbh:string;skrq:string); //与班次表比较时间
    procedure readdata;
  public
    { Public declarations }
  end;

var
  frmkqsj: Tfrmkqsj;

implementation

uses func, untdatadm;


{$R *.dfm}
procedure tfrmkqsj.readdata;
var
  sqlpub:widestring;
  datas:olevariant;
begin
  tempsql:=' select top '+trim(cmbtop.Text);
  tables:=' id,person_no,converT(varchar(10),sktime,14) as sktime,skdate,p_name,p_workid,p_icno from vkqsj where 1=1';
  sqlpub:=tempsql+tables+tj;
  dmmain.cdsKQdoc.Close;
  dmmain.cdsKQdoc.Data:=null;
  try
    datas:=   adisp.GetRecord(sqlpub);
    if not varisnull(datas) then
    begin
    if tj<>'' then
    begin
      dmmain.cdsKQdoc.AppendData(datas,false);
    end else
    begin
      dmmain.cdsKQdoc.Data:=datas;
    end;
    dmmain.cdsKQdoc.Open;
    LocalCount := GetKeyFieldValue('id',dmmain.cdsKQdoc);   //传入具体字段
    datas:=null;
    end;
  except
  end;
end;
procedure tfrmkqsj.qz(ygbh:string;skrq:string);
var
  p:integer;
  temp:widestring;
  datas:olevariant;
begin
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  temp:='SELECT * from vkqsj where person_no='+''''+trim(ygbh)+''''+' and skdate='+''''+trim(skrq)+'''';
  try
    datas:=null;
    datas:=adisp.execSql(temp);
    if not varisnull(datas) then
    begin
      dmmain.CDSexecsql.Data:=datas;
      dmmain.CDSexecsql.Open;
      datas:=null;
    end;
  except
  end;
  if not dmmain.CDSexecsql.IsEmpty then
  begin
    xm:=trim(dmmain.CDSexecsql.fieldbyname('p_name').AsString);
    bm:=trim(dmmain.CDSexecsql.fieldbyname('p_workid').AsString);
    icid:=trim(dmmain.CDSexecsql.fieldbyname('p_ICno').AsString);
    zw:='';
    carddate:=trim(dmmain.CDSexecsql.fieldbyname('skdate').AsString); //  查找同一天刷卡记录；
    p:=1; //计数器赋初值
    if  trim(ygbh)<>'' then
    begin
      while not dmmain.CDSexecsql.Eof do
      begin
        if p<=8 then
        begin
          zs1[p]:=formatdatetime('hh'':''mm'':''ss',dmmain.CDSexecsql.FieldByName('sktime').AsDateTime);
        end;
        inc(p);
        dmmain.CDSexecsql.Next;
      end;
    end;
  end else
  begin
     xm:='';
    bm:='';
    icid:='';
    zw:='';
  end;
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.data:=null;
end;
procedure tfrmkqsj.comptime(ygbh:string;skrq:string);  //查找日期和时间对比;
var
  row,i,p:integer;
  yy,mm,dd:word;
  temp:widestring;
  datas:olevariant;
begin
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  temp:='select * from dp_bcap where person_no='+''''+trim(ygbh)+'''';
 try
    datas:=null;
    datas:=adisp.execSql(temp);
    if not varisnull(datas) then
    begin
      dmmain.CDSexecsql.Data:=datas;
      dmmain.CDSexecsql.Open;
      datas:=null;
    end;
  except
  end;
  if not (dmmain.CDSexecsql.IsEmpty ) then
  begin
    decodedate(strtodate(skrq),yy,mm,dd);
    p:=dd+4;//对应的天数的上班时间;
    if trim(dmmain.CDSexecsql.Fields.Fields[p].AsString)<>'' then
    begin
      dmmain.CDSquery2.Close;
      dmmain.CDSquery2.Data:=null;
      temp:='select * from dp_bcjg where bc_no='+''''+trim(dmmain.CDSexecsql.Fields.Fields[p].AsString)+'''';
      try
        datas:=null;
        datas:=adisp.resultrecord(temp);
        if not varisnull(datas) then
        begin
          dmmain.CDSquery2.Data:=datas;
          dmmain.CDSquery2.Open;
          datas:=null;
        end;
      except
      end;
      if not (dmmain.CDSquery2.IsEmpty) then
      begin
        card[1]:=timetostr(dmmain.CDSquery2.fieldbyname('swsb').AsDateTime);
        card[2]:=timetostr(dmmain.CDSquery2.fieldbyname('swxb').AsDateTime);
        card[3]:=timetostr(dmmain.CDSquery2.fieldbyname('xwsb').AsDateTime);
        card[4]:=timetostr(dmmain.CDSquery2.fieldbyname('xwxb').AsDateTime);
        card[5]:=timetostr(dmmain.CDSquery2.fieldbyname('wssb').AsDateTime);
        card[6]:=timetostr(dmmain.CDSquery2.fieldbyname('wsxb').AsDateTime);
        card[7]:=timetostr(dmmain.CDSquery2.fieldbyname('jbsb').AsDateTime);
        card[8]:=timetostr(dmmain.CDSquery2.fieldbyname('jbxb').AsDateTime);
      end else
      begin
        card[1]:='00:00:00';
        card[2]:='00:00:00';
        card[3]:='00:00:00';
        card[4]:='00:00:00';
        card[5]:='00:00:00';
        card[6]:='00:00:00';
        card[7]:='00:00:00';
        card[8]:='00:00:00';
      end;
      dmmain.CDSquery2.Close;
    end ;
  end else
  begin
    //application.MessageBox('请先设置【班次结构】或【班次安排】！',pchar(application.Title),mb_iconwarning);
    card[1]:='00:00:00';
    card[2]:='00:00:00';
    card[3]:='00:00:00';
    card[4]:='00:00:00';
    card[5]:='00:00:00';
    card[6]:='00:00:00';
    card[7]:='00:00:00';
    card[8]:='00:00:00';
    //exit;
  end;
  dmmain.CDSquery2.Close;
  dmmain.CDSexecsql.Close;
  dmmain.CDSquery2.Data:=null;
  dmmain.CDSexecsql.Data:=null;
end;
///////////////////////////////////////

procedure Tfrmkqsj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmkqsj.FormShow(Sender: TObject);
begin
  tj:='';
  cmbtop.ItemIndex:=0;
  readdata;
end;

procedure Tfrmkqsj.BitBtn7Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmkqsj.BitBtn5Click(Sender: TObject);
var
  sqlpub:widestring;
begin
  if dmmain.cdsKQdoc.IsEmpty then
  begin
    application.MessageBox('目前没有可以删除的员工考勤信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end else
  begin
    if application.MessageBox('是否确定删除该条信息？',pchar(application.Title),mb_iconquestion+mb_yesno)=idyes  then
    begin
      try
      sqlpub:='delete from dp_kqdata where id='+dmmain.cdsKQdoc.fieldbyname('id').AsString;
      adisp.updatesql(sqlpub);
      except

      end;
    end;
  end;
end;

procedure Tfrmkqsj.BitBtn4Click(Sender: TObject);
var
   i,j,p,ff:integer;
   swsb,swxb,xwsb,xwxb,wssb,wsxb,jbsb,jbxb,by1,by2,by3,bj1,bj2,bj3,bj4,skrq:string; //刷卡时间段
   hh,mm,ss,mes:word;//转换使用
   sqlpub:widestring;
   datas:olevariant;
begin
  if dmmain.cdsKQdoc.IsEmpty then
  begin
    application.MessageBox('没有可以导出的考勤数据',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if application.MessageBox('是否确定导出考勤机数据信息？',pchar(application.Title),mb_iconquestion+mb_yesno)=idyes  then
  begin
    try
    sqlpub:='delete from dp_KQdocument';
    ipubtemp.scrapsate(sqlpub);
    except
    end;
    j:=1;
    while j<=dmmain.cdsKQdoc.RecordCount  do
    begin
      ygbh:= dmmain.cdsKQdoc.fieldbyname('person_no').AsString;
      dmmain.CDSquery.Close;
      dmmain.CDSquery.Data:=null;
      sqlpub:='select skdate from vkqsj where person_no='+''''+trim(ygbh)+''''+' group by skdate ';
      try
        datas:=null;
        datas:=adisp.GetRecord(sqlpub);
        if not varisnull(datas) then
        begin
          dmmain.CDSquery.Data:=datas;
          dmmain.CDSquery.Open;
          datas:=null;
        end;
      except
      end;
      while not (dmmain.CDSquery.Eof) do
      begin
        skrq:=trim(dmmain.CDSquery.fieldbyname('skdate').AsString);
        qz(ygbh,skrq);
        comptime(ygbh,skrq);
        i:=1;
       //////判断刷卡时间段//////////////////
        while i<=8 do
        begin
          if card[2]<>'0:00:00' then  //上午下班
          begin
            decodetime(strtotime(card[2]),hh,mm,ss,mes);  //
            ff:=mm-30;
            if ff<0 then //满60分中换为小时;
            begin
              hh:=hh-1;
              ff:=ff+60;
            end;
            mm:=ff;
            bj1:=timetostr(encodetime(hh,mm,ss,mes)); //
          end else
          begin
            bj1:='0:00:00';
            swsb:='0:00:00';
            swxb:='0:00:00';
          end;
          if card[4]<>'0:00:00' then
          begin
            decodetime(strtotime(card[4]),hh,mm,ss,mes);  //
            ff:=mm-30;
            if ff<0 then //满60分中换为小时;
            begin
              hh:=hh-1;
              ff:=ff+60;
            end;
            mm:=ff;
            bj2:=timetostr(encodetime(hh,mm,ss,mes)); //
          end else
          begin
            bj2:='0:00:00';
            xwsb:='0:00:00';
            xwxb:='0:00:00';
          end;
          if card[6]<>'0:00:00' then
          begin
            decodetime(strtotime(card[6]),hh,mm,ss,mes);  //
            ff:=mm-30;
            if ff<0 then //满60分中换为小时;
            begin
              hh:=hh-1;
              ff:=ff+60;
            end;
            mm:=ff;
            bj3:=timetostr(encodetime(hh,mm,ss,mes)); //
          end else
          begin
            bj3:='0:00:00';
            wssb:='0:00:00';
            wsxb:='0:00:00';
          end;
          if card[8]<>'0:00:00' then
          begin
            decodetime(strtotime(card[8]),hh,mm,ss,mes);  //
            ff:=mm-30;
            if ff<0 then //满60分中换为小时;
            begin
              hh:=hh-1;
              ff:=ff+60;
            end;
            mm:=ff;
            bj4:=timetostr(encodetime(hh,mm,ss,mes)); //
          end else
          begin
            bj4:='0:00:00';
            jbsb:='0:00:00';
            jbxb:='0:00:00';
          end;
          if card[3]<>'0:00:00' then
          begin
            decodetime(strtotime(card[3]),hh,mm,ss,mes);  //下班30分钟后即可进行上班打卡。
            ff:=mm-30;
            if ff<0 then //满60分中换为小时;
            begin
              hh:=hh-1;
              ff:=ff+60;
            end;
            mm:=ff;
            by1:=timetostr(encodetime(hh,mm,ss,mes)); //
          end else
          begin
            if card[2]<>'0:00:00' then
            begin
              decodetime(strtotime(card[2]),hh,mm,ss,mes);  //下班30分钟后即可进行上班打卡。
              ff:=mm+30;
              if ff>=60 then //满60分中换为小时;
              begin
                hh:=hh+1;
                ff:=ff-60;
              end;
              mm:=ff;
              by1:=timetostr(encodetime(hh,mm,ss,mes)); //
            end else
            begin
              by1:='0:00:00';
            end;
            xwsb:='0:00:00';
            xwxb:='0:00:00';
          end;
          if card[5]<>'0:00:00' then  //下午下班
          begin
            decodetime(strtotime(card[5]),hh,mm,ss,mes);  //
            ff:=mm-30;
            if ff<0 then //满60分中换为小时;
            begin
              hh:=hh-1;
              ff:=ff+60;
            end;
            mm:=ff;
            by2:=timetostr(encodetime(hh,mm,ss,mes)); //
          end else
          begin
            if card[4]<>'0:00:00' then
            begin
              decodetime(strtotime(card[4]),hh,mm,ss,mes);  //下班30分钟后即可进行上班打卡。
              ff:=mm+30;
              if ff>=60 then //满60分中换为小时;
              begin
                hh:=hh+1;
                ff:=ff-60;
              end;
              mm:=ff;
              by2:=timetostr(encodetime(hh,mm,ss,mes)); //
            end else
            begin
              by2:='0:00:00';
            end;
            wssb:='0:00:00';
            wsxb:='0:00:00';
          end;
          if card[7]<>'0:00:00' then  //晚上下班
          begin
            decodetime(strtotime(card[7]),hh,mm,ss,mes);  //
            ff:=mm-30;
            if ff<0 then //满60分中换为小时;
            begin
              hh:=hh-1;
              ff:=ff+60;
            end;
            mm:=ff;
            by3:=timetostr(encodetime(hh,mm,ss,mes)); //
          end else
          begin
            if card[6]<>'0:00:00' then
            begin
              decodetime(strtotime(card[6]),hh,mm,ss,mes);  //下班30分钟后即可进行上班打卡。
              ff:=mm+30;
              if ff>=60 then //满60分中换为小时;
              begin
                hh:=hh+1;
                ff:=ff-60;
              end;
              mm:=ff;
              by3:=timetostr(encodetime(hh,mm,ss,mes)); //
            end else
            begin
              by3:='0:00:00';
            end;
            jbsb:='0:00:00';
            jbxb:='0:00:00';
          end;
          if (zs1[i]<>'') and (zs1[i]<>'00:00:00') then
            begin
            if  (strtotime(zs1[i])<strtotime(bj1)) then //上午上班
            begin
              swsb:=zs1[i];
            end else
            begin
              if swsb='' then swsb:='0:00:00';
            end;
            if (strtotime(zs1[i])>=strtotime(bj1)) and (strtotime(zs1[i])<=strtotime(by1)) then //上午下班
            begin
              swxb:=zs1[i];
            end else
            begin
              if swxb='' then swxb:='0:00:00';
            end;
            if  (strtotime(zs1[i])>=strtotime(by1)) and (strtotime(zs1[i])<=strtotime(bj2))then //下午上班
            begin
              xwsb:=zs1[i];
            end else
            begin
              if xwsb='' then xwsb:='0:00:00';
            end;
            if by2<>'' then
            begin
              if  (strtotime(zs1[i])>=strtotime(bj2)) and (strtotime(zs1[i])<=strtotime(by2)) then //下午下班( 有晚班时)
              begin
                xwxb:=zs1[i];
              end else
              begin
                if xwxb='' then xwxb:='0:00:00';
              end;
              if (strtotime(zs1[i])>strtotime(by2)) and (strtotime(zs1[i])<=strtotime(bj3))then //晚上上班
              begin
                wssb:=zs1[i];
              end else
              begin
                if (strtotime(zs1[i])>=strtotime(bj3)) and (strtotime(zs1[i])>strtotime(by2)) then //当刷卡时间为第二天时;
                begin
                  if wssb='' then
                  begin
                    wssb:=zs1[i];
                  end;
                end else
                begin
                  if wssb='' then wssb:='0:00:00';
                end;
              end;
              if  (strtotime(zs1[i])>=strtotime(bj3)) and (strtotime(zs1[i])<strtotime(by3)) then //晚上下班
              begin
                wsxb:=zs1[i];
              end else
              begin
               if wsxb='' then wsxb:='0:00:00';
              end;
            end else
            begin
              if  (strtotime(zs1[i])>=strtotime(card[4])) then //下午下班
              begin
                xwxb:=zs1[i];
              end else
              begin
                if xwxb='' then xwxb:='0:00:00';
              end;
            end;
            //////////////////////
            if by3<>'0:00:00' then
            begin
              if  (strtotime(zs1[i])<strtotime(bj4)) then //加班上班
              begin
                jbsb:=zs1[i];
              end else
              begin
                if jbsb='' then jbsb:='0:00:00';
              end;
              if  (strtotime(zs1[i])>=strtotime(bj4)) then //加班下班
              begin
                jbxb:=zs1[i];
              end else
              begin
                if jbxb='' then jbxb:='0:00:00';
              end;
            end ;
          end else
          begin
            if swsb='' then swsb:='0:00:00';
            if swxb='' then swxb:='0:00:00';
            if xwsb='' then xwsb:='0:00:00';
            if xwxb='' then xwxb:='0:00:00';
            if wssb='' then wssb:='0:00:00';
            if wsxb='' then wsxb:='0:00:00';
            if jbsb='' then jbsb:='0:00:00';
            if jbxb='' then jbxb:='0:00:00';
          end;
          inc(i);
        end;
        //////////////////////////////////////
        if  (trim(ygbh)<>'') then
        begin
          p:=1;
          try
          sqlpub:='insert into [Dp_KQdocument] (person_no,person_name,part_no,IC_no,M_up,m_down,a_up,a_down,n_up,n_down,add_up,add_down,newdate) values ('+''''+trim(ygbh)+''''+','+''''+trim(xm)+''''+','+''''+trim(bm)+''''+','+''''+trim(icid)+''''+','+''''+trim(swsb)+''''+','+''''+trim(swxb)+''''+','+''''+trim(xwsb)+''''+','+''''+trim(xwxb)+''''+','+''''+trim(wssb)+''''+','+''''+trim(wsxb)+''''+','+''''+trim(jbsb)+''''+','+''''+trim(jbxb)+''''+','+''''+trim(formatdatetime('YYYY''-''MM''-''DD',strtodate(carddate)))+''''+')';
          ipubtemp.scrapsate(sqlpub);
          except
          end;
          swsb:='';
          swxb:='';
          xwsb:='';
          xwxb:='';
          wssb:='';
          wsxb:='';
          jbsb:='';
          jbxb:='';
          for i:=1 to 8 do
          begin
            zs1[i]:='';
          end;
        end;
        dmmain.CDSquery.Next;
      end;
      //////////////////////
      dmmain.cdsdata.Close;  //跳到下一个员工考勤记录;
      dmmain.cdsdata.Data:=null;
      sqlpub:='select count(person_no) as ygbh from vkqsj where person_no='+''''+trim(ygbh)+'''';
      try
        datas:=null;
        ipubtemp.ty_query(sqlpub,datas);
        if not varisnull(datas) then
        begin
          dmmain.cdsdata.Data:=datas;
          datas:=null;
        end;
      except
      end;
      j:=j+dmmain.cdsdata.fieldbyname('ygbh').AsInteger;
      dmmain.cdsdata.Close;
      dmmain.cdsdata.Data:=null;
      if j< dmmain.cdsKQdoc.RecordCount then
      begin
        dmmain.cdsKQdoc.RecNo:=j;
      end;
    end;
    application.MessageBox('数据导出完毕！',pchar(application.Title),mb_iconinformation);
  end;
end;

procedure Tfrmkqsj.spdcxClick(Sender: TObject);
begin
  {if (cbqsbh.Text='') and (cbjzbh.Text='') then
  begin
    application.MessageBox('请输入查询条件！',pchar(application.Title),mb_iconinformation);
    cbqsbh.SetFocus;
    exit;
  end else
  begin
    if (cbqsbh.Text='') and (cbjzbh.Text<>'') then
    begin
      application.MessageBox('请选择起始员工编号！',pchar(application.Title),mb_iconinformation);
      cbqsbh.SetFocus;
      exit;
    end;
  end;
  dm.aqrykqsj.Filtered:=false;
  dm.aqrykqsj.Filter:='人员编码>='+''''+trim(cbqsbh.Text)+''''+chr(0)+'ygid<='+''''+trim(cbjzbh.Text)+''''+chr(255);
  dm.aqrykqsj.Filtered:=true;}
end;

end.
