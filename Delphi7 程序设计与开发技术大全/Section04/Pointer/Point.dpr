program Point;         //指针示例工程

{$Apptype console}
type
  PInt=^Integer;					//定义指针类型
var
  I,K:Integer;
  PI:Pint;						  	//整形指针
  P:Pointer;					  	//无类型指针
begin
  I:=3;
  K:=5;
  PI:=@K;                 //整形指针指向整形数据
  writeln('K=',PI^);
  P:=@I;
  K:=Integer(P^);         //无类型指针指向整形数据
  writeln('K=',K);
  PI:=P;                  //指针之间赋值
  writeln('PI^:',PI^);
  readln;
end.
