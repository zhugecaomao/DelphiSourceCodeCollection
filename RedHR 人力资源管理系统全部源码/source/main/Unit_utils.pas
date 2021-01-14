//本单元保存常用函数
unit Unit_utils;

interface
uses
	fmain,db,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls,DateUtils;

  Function DaysInMonth(ADate:TDateTime):Integer;
	Function CurrTranfer(currstr:String):Double;
	Function ReadPriorStr(var templine:string;searchtext:string):String;
	Function ReadNextStr(templine:string;searchtext:string):String;
  Function ReadPriorStrOnly(templine:string;searchtext:string):String;
  function ScanStr(ToScan: PChar; Sign: Char):PChar;
  function IsDigit(ch: char): boolean;
implementation

//----------计算月份相对天数的参数-----------//
function DaysInMonth(ADate:TDateTime):Integer;
var
MyMonth,
MyYear,
MyDay : Word;
MyDayTable : TDayTable;
tmpBool : Boolean;
begin
DecodeDate(ADate, MyYear, MyMonth, MyDay);
tmpBool := IsLeapYear(MyYear);
MyDayTable := MonthDays[tmpBool];
Result := MyDayTable[MyMonth];
end;
//-------------------End---------------------//
//转换金额数据的格式。千分位格式转换为双精度型。
Function CurrTranfer(currstr:String):double;
var SearchText,Tmpstr:string;
    AllLenth,FoundPos:Integer;
begin
        //AllLenth:=length(currstr);
        Tmpstr:='';
        repeat
			SearchText:=',';
			FoundPos:=Pos(SearchText,currstr);
			if FoundPos>0 then
			begin
				tmpstr:=tmpstr+copy(currstr,1,FoundPos-1);
				currstr:=copy(currstr,FoundPos+1,length(currstr)-FoundPos);
				//AllLenth:=length(currstr);
			end
        until FoundPos<=0;
        Tmpstr:=Tmpstr+currstr;
        if Tmpstr='' then
	        Result:=0.00
        else
    	    Result :=strtofloat(Tmpstr);
end;

//读入分隔符之前的一个数据。参数为引用传递,分隔符之后的字符串变为被检索字符串。
Function ReadPriorStr(var templine:string;searchtext:string):String;
var FoundPos:Integer;
   //searchtext,templine:string;
begin
		FoundPos:=Pos(searchtext,templine);
		if FoundPos>0 then
		begin
			result:=trim(copy(templine,1,FoundPos-1));
			templine:=copy(templine,FoundPos+1,length(templine)-FoundPos);
		end
		else
			result:='';
end;

//读入分隔符之后的字符串。
Function ReadNextStr(templine:string;searchtext:string):String;
var FoundPos:Integer;
begin
		FoundPos:=Pos(searchtext,templine);
		if FoundPos>0 then
			result:=trim(copy(templine,FoundPos+1,length(templine)-FoundPos))
		else
			result:='';
end;

//读入分隔符之前的一个数据。返回该字符串，原字符串不修改。
Function ReadPriorStrOnly(templine:string;searchtext:string):String;
var FoundPos:Integer;
   //searchtext,templine:string;
begin
		FoundPos:=Pos(searchtext,templine);
		if FoundPos>0 then
		begin
			result:=trim(copy(templine,1,FoundPos-1));
			//templine:=copy(templine,FoundPos+1,length(templine)-FoundPos);
		end
		else
			result:='';
end;


//--转换为大写字符
function ToUpper(ch: char): char;  
begin
  Result := chr(ord(ch) and $DF);
end;


//--判断字符串是否可以转换成整数
function IsIntStr(const S: string): boolean;
begin
  Result:=StrToIntDef(S,0)=StrToIntDef(S,1);
end;


//--字符串查询函数
function ScanStr(ToScan:pchar; Sign: char):pchar;  
begin
  Result:= nil;
  if ToScan <> nil then
    while (ToScan^ <> #0) do begin
      if ToScan^ = Sign then begin
        Result:= ToScan;
        break;
       end;
     inc(ToScan);
    end;
end;


//--判断字符串是否为数字
function IsDigit(ch: char): boolean;
begin
  //Result := ch in ['0'..'9'];
  if ch in ['0'..'9'] then
    result:=true
    else
    result:=false;
end;


end.

