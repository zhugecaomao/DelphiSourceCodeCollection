unit main;
//Download by http://www.codefans.net
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls,COMOBJ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    ado: TADOConnection;
    qmext1: TADOQuery;
    qssr: TADOQuery;
    qssu: TADOQuery;
    qtextu: TADOQuery;
    qtextu2: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    a,b,c,d,e,f : integer;
    sessionid : string;
    rever : string;  //接收号
    textt : string;  //接收信息内容
    textp : string;  //通知状态
    textc : integer; //通知次数
    RootObj : olevariant;
    id : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  timer1.Enabled := true;
  timer2.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  timer1.Enabled := false;
  timer2.Enabled := false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i : integer;
begin
//读取需发送信息
with qmext1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from 业务提醒表 where 通知次数 =0 and 关闭标识 =:param1');
  Parameters[0].Value := '0';
  try
    begin
      open;
      if recordcount > 0 then
      begin
        for i := 0 to recordcount -1 do
        begin
          id :=    fieldbyname('id').AsInteger;
          rever := fieldbyname('通知人').AsString;
          textt := fieldbyname('通知内容').AsString;
          //读取sessionid
          with qssr do
          begin
            close;
            sql.Clear;
            sql.Add('select * from session参数表');
            try
              begin
                open;
                a := fieldbyname('session1').AsInteger;
                b := fieldbyname('session2').AsInteger;
                c := fieldbyname('session3').AsInteger;
                d := fieldbyname('session4').AsInteger;
                e := fieldbyname('session5').AsInteger;
                f := fieldbyname('session6').AsInteger;
                if f = 99999999 then
                begin
                if e = 9999 then
                begin
                  if d = 9999 then
                  begin
                    if c = 9999 then
                    begin
                      if b = 9999 then
                      begin
                        a := a + 1;
                      end
                      else
                      begin
                        b := b + 1 ;
                      end;
                    end
                    else
                    begin
                      c := c + 1;
                    end;
                  end
                  else
                  begin
                    d := d + 1;
                  end;
                end
                else
                begin
                  e := e + 1;
                end;
                end
                else
                begin
                  f := f + 1;
                end;
            end;
          except
            begin
              Application.MessageBox('数据库连接失败，请与系统管理员联系！','系统提示',mb_ok+mb_iconstop+mb_systemmodal);
              exit;
            end;
          end;
        end;
        sessionid := '{'+inttostr(a)+'-'+inttostr(b)+'-'+inttostr(c)+'-'+inttostr(d)+'-'+inttostr(e)+inttostr(f)+'}';
        //发送消息

        RootObj:= CreateoleObject('RTXSAPIRootObj.RTXSAPIRootObj');
        rootobj.sendim('9091','1111',trim(rever),textt,sessionid);
        //更新sessionid
        with qssu do
        begin
          close;
          sql.Clear;
          sql.Add('update session参数表 set session1 =:param1,session2 =:param2,session3 =:param3,session4 =:param4,session5 =:param5,session6 =:param6');
          Parameters[0].Value := a;
          Parameters[1].Value := b;
          Parameters[2].Value := c;
          Parameters[3].Value := d;
          Parameters[4].Value := e;
          Parameters[5].Value := f;
          execsql;
        end;
        //更新业务提醒表
        with qtextu do
        begin
          close;
          sql.Clear;
          sql.Add('update 业务提醒表 set 通知次数 =:param1 where id =:param2');
          Parameters[0].Value := '1';
          Parameters[1].Value := id;
          execsql;
        end;            
        next;
      end;
    end;
  end;
  except
    begin
      Application.MessageBox('数据库连接失败，请与系统管理员联系！','系统提示',mb_ok+mb_iconstop+mb_systemmodal);
      exit;
    end;
  end;         
end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  j : integer;
begin
 //读取需发送信息
with qmext1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from 业务提醒表 where 关闭标识 =:param1');
  Parameters[0].Value := '0';
  try
    begin
      open;
      if recordcount > 0 then
      begin
        for j := 0 to recordcount -1 do
        begin
          id :=    fieldbyname('id').AsInteger;
          rever := fieldbyname('通知人').AsString;
          textt := fieldbyname('通知内容').AsString;
          textp := fieldbyname('通知状态').AsString;
          textc := fieldbyname('通知次数').AsInteger;
          //读取sessionid
          with qssr do
          begin
            close;
            sql.Clear;
            sql.Add('select * from session参数表');
            try
              begin
                open;
                a := fieldbyname('session1').AsInteger;
                b := fieldbyname('session2').AsInteger;
                c := fieldbyname('session3').AsInteger;
                d := fieldbyname('session4').AsInteger;
                e := fieldbyname('session5').AsInteger;
                f := fieldbyname('session6').AsInteger;
                if f = 99999999 then
                begin
                if e = 9999 then
                begin
                  if d = 9999 then
                  begin
                    if c = 9999 then
                    begin
                      if b = 9999 then
                      begin
                        a := a + 1;
                      end
                      else
                      begin
                        b := b + 1 ;
                      end;
                    end
                    else
                    begin
                      c := c + 1;
                    end;
                  end
                  else
                  begin
                    d := d + 1;
                  end;
                end
                else
                begin
                  e := e + 1;
                end;
                end
                else
                begin
                  f := f + 1;
                end;
            end;
          except
            begin
              Application.MessageBox('数据库连接失败，请与系统管理员联系！','系统提示',mb_ok+mb_iconstop+mb_systemmodal);
              exit;
            end;
          end;
        end;
        sessionid := '{'+inttostr(a)+'-'+inttostr(b)+'-'+inttostr(c)+'-'+inttostr(d)+'-'+inttostr(e)+inttostr(f)+'}';
        //发送消息

        RootObj:= CreateoleObject('RTXSAPIRootObj.RTXSAPIRootObj');
        rootobj.sendim('9091','1111',trim(rever),textt,sessionid);
        //更新sessionid
        with qssu do
        begin
          close;
          sql.Clear;
          sql.Add('update session参数表 set session1 =:param1,session2 =:param2,session3 =:param3,session4 =:param4,session5 =:param5,session6 =:param6');
          Parameters[0].Value := a;
          Parameters[1].Value := b;
          Parameters[2].Value := c;
          Parameters[3].Value := d;
          Parameters[4].Value := e;
          Parameters[5].Value := f;
          execsql;
        end;
        //更新业务提醒表
        textc := textc + 1;
        with qtextu do
        begin
          close;
          sql.Clear;
          sql.Add('update 业务提醒表 set 通知次数 =:param1 where id =:param2');
          Parameters[0].Value := textc;
          Parameters[1].Value := id;
          execsql;
        end;
        if textp = '完全审批' then
        begin
          with qtextu2 do
          begin
            close;
            sql.Clear;
            sql.Add('update 业务提醒表 set 关闭标识 =:param1 where id =:param2');
            Parameters[0].Value := '1';
            Parameters[1].Value := id;
            execsql;
          end;
        end;
        next;
      end;
    end;
  end;
  except
    begin
      Application.MessageBox('数据库连接失败，请与系统管理员联系！','系统提示',mb_ok+mb_iconstop+mb_systemmodal);
      exit;
    end;
  end;         
end;
end;

end.
