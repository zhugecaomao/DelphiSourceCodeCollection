program FunctionDemo;

{$APPTYPE CONSOLE}

uses
  SysUtils;

//定义函数，用于计算a、b参数的和
function Total(a,b:Integer):Integer;
begin
  Total:=a+b;
end;

var
  a,b,c:Integer;
begin
  try
    Writeln('请输入a值');
    Readln(a);
    Writeln('请输入b值');
    Readln(b);
    c:=Total(a,b);                //调用函数
    Write('a与b的和为：');
    Writeln(c);
    Readln;
  except
    Writeln('输入的内容不是数字');
  end;
end.
