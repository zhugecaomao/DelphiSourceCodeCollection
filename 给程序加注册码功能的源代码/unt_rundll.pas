unit unt_rundll;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,inifiles;

type
  Tfrm_rundll = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    Function  Reg:boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rundll: Tfrm_rundll;

implementation

{$R *.DFM}

procedure Tfrm_rundll.Button1Click(Sender: TObject);
begin
 Reg;
end;





Function Tfrm_rundll.Reg;
type
  TFunc=function(A_sEditionFlag,A_allow_test,A_Email,A_URL,A_DISKKEY:pchar):pchar;
var
  string1:string;
  params:array[1..5]of string;
  p,i:integer;
  Menu_Table:string;
  DllName:string;
  DllParams:string;
  filename,FuncName:string;
  MenuCaption,str:string;
  Func:Tfunc;
  DllFunc:Thandle;
  evnOK:boolean;
  ret_value:string;
begin
    DllName:='dllreg.dll';
    filename:=extractfilename(DllName);
    FuncName:=copy(filename,4,pos('.',filename)-4);

    string1:=DllParams;
    for i:=1 to 5 do params[i]:='';

    for i:=1 to 4 do begin
       p:=pos('~',string1);
       if p=0 then begin
         params[i]:=trim(string1);
         break;
       end;

     params[i]:=copy(string1,1,p-1);

       string1:=copy(string1,p+1,length(string1)-p);
    end;

    params[1]:='WL10';//软件名版本号 -只能是字符不能超过3位
    params[2]:='10'; // 运行次数-只能是数字不能超过2位

    params[3]:='tmqp2002@yahoo.com?Subject=注册款已汇，申请注册XX程序注册号';
    params[4]:='http://tjsoft.51.net/cgi-bin/down/list.php';
    params[5]:='True';


    evnOk:=true;

  if evnOK then begin
   DllFunc:=Loadlibrary(pchar(DllName));
   try
    if DllFunc<>0 then begin
       @Func:=GetProcAddress(DllFunc,pchar(FuncName));
         if @Func<>nil then begin
//调用DLL函数
          try
           ret_value:=Func(pchar(params[1]),pchar(params[2]),pchar(params[3]),pchar(params[4]),pchar('TRUE'));//
           if ret_value='DISKKEYTRUE' then
           begin
             result:=true;
             showmessage('磁盘正式版ok');
           end;
           if ret_value='REGTRUE' then
           begin
             result:=true;
             showmessage('注册号正式版ok');
           end;

           if ret_value='TEST' then
           begin
             result:=true;
             showmessage('注册号试用版ok');
           end;

           if ret_value='-1' then
           begin
             result:=False;
             showmessage('出错啦');
           end;
             result:=strtoint(ret_value)>0;
             showmessage('还能运行次数:'+ret_value);
          except
           raise;
          end;

         end;
     end;
   finally
     Freelibrary(DllFunc);
   end;

  end;




end;






end.
