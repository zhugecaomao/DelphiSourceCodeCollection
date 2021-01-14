//*******************一个简单的加密和解密函数*******************//
//函数制作时间：2004年7月28日

unit Myjiami;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls;
  function editstrtomd(s:string; strkey:char ):string;//原字符转换成加密字符串
  function mdtoeditstr(s:string; strkey:char ):string;//加密字符串换成原字符转
  function db_idtoadd(s:string; int_leg:integer):string; //数据库ID编号自加
  Function int_to_str(s:string):string;    //注册信息数字转换成字符    2005/01/27
  Function str_to_int(s:string):string;    //注册信息字符转换成数字    2005/01/27
  procedure str_intercept(s: string; Separator: char; Terms: TStringList); //字符串截取的过程  2005/02/05
  //function myHextoStr(S: string): string;//16进制字符串转原字符串
implementation
//
function editstrtomd(s:string; strkey:char ):string;//原字符转换成加密字符串
var
  str:string;         //定义两个字符串的昨临时变量
  str1:string;        //定义两个字符串的昨临时变量
  i:integer;          //循环加密变量
  j:integer;          //加密关键字
begin
  str:=s;             //存储传入的字符串
  str1:='';           //初始化转化后的字符串
  j:= integer(strkey);//将加密关键字转换成整数
  for i:=1 to length(str) do   //字符串的循环加密
  begin
  str1:=str1+char(integer(str[i])+j);//汉字转换的整形值是偶数
  end;
  result := str1;     //返回加密后的结果
end;

function mdtoeditstr(s:string; strkey:char ):string;//加密字符串换成原字符转
var
  str:string;         //定义两个字符串的昨临时变量
  str1:string;        //定义两个字符串的昨临时变量
  i:integer;          //循环加密变量
  j:integer;          //加密关键字
begin
  str1:=s;            //存储传入的字符串
  str:='';            //初始化转化后的字符串
  j:= integer(strkey);//将解密关键字转换成整数
  for  i:=1 to length(str1) do  //字符串的循环解密
  begin
    str:=str+char(integer(str1[i])-j);
  end;
  result := str;      //返回解密后的结果
end;

function db_idtoadd(s:string; int_leg:integer):string;    //数据库ID编号自加
var
  str:string;
  str_id:string;
  int_id:integer;
  i:integer;
begin
  str := s;                     //存储装入的值
  int_id:=strtoint(str)+1;      //使编号加1
  str_id:='';                   //初使化转化后的字符串
  for i:=1 to (int_leg-length(inttostr(int_id))) do     //循环初使化0的个数
  begin
    str_id:=str_id+'0';
  end;
  str_id:=str_id+inttostr(int_id);                 //重新转化为编号字符串
  result := str_id;             //返回结果
end;
function int_to_str(s: string): string;
var
  turn:array [0..9] of char;
  i:integer;
  re_str:string;
begin
  turn[0]:='A';
  turn[1]:='X';
  turn[2]:='F';
  turn[3]:='H';
  turn[4]:='M';
  turn[5]:='j';
  turn[6]:='a';
  turn[7]:='e';
  turn[8]:='p';
  turn[9]:='l';
  re_str:='';
  for i:=1 to length(s) do
  begin
    re_str:=re_str + turn[strtoint(s[i])];
  end;
  result := re_str;
end;
function str_to_int(s: string): string;
var
  i:integer;
  re_str:string;
begin
  re_str:='';
  for i:=1 to length(s) do
  begin
    case char(s[i]) of
    'A': re_str :=re_str +'0';
    'X': re_str :=re_str +'1';
    'F': re_str :=re_str +'2';
    'H': re_str :=re_str +'3';
    'M': re_str :=re_str +'4';
    'j': re_str :=re_str +'5';
    'a': re_str :=re_str +'6';
    'e': re_str :=re_str +'7';
    'p': re_str :=re_str +'8';
    'l': re_str :=re_str +'9';
    end;
  end;
  result := re_str;
end;
//字符串截取的过程
procedure str_intercept(s: string; Separator: char;
  Terms: TStringList);
  var
  hs : string;
  p : integer;
begin
  Terms.Clear;           // 清空StringList中的所有内容
  if Length(s)=0 then   // 字串长度0就退出
  begin
    Exit;
  end;
  p:=Pos(Separator,s);
  while P<>0 do
  begin
    hs:=Copy(s,1,p-1);   // 拷贝字串
    Terms.Add(hs);       // 添加到LIST中
    Delete(s,1,p);       // 删除刚拷贝的字串
    p:=Pos(Separator,s); // 寻找下一个和指定字符的字串
  end;
  if Length(s)>0 then
    Terms.Add(s);        // 把盛下的字串添加到TERM中
end;
end.
