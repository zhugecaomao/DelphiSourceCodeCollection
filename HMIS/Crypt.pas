unit Crypt;

interface

uses
  Classes, SysUtils;

  function Encrypt(Pass_W:AnsiString):AnsiString;
  function Decrypt(Pass_E:AnsiString):AnsiString;

const PW_Code : array[1..6]of byte = (1, 5, 2, 0, 8, 8);  //密钥数字
var   iCrypt  : integer;

implementation

function Encrypt(Pass_W:String):String;   //输入密码原文字符串
var  {*****加密运算函数 *****}
    sStr : string;
    iNum : integer;
begin
    //此加密算法只对字符串的前六位进行异或加密
    sStr := Pass_W;  
    if Length(Pass_W) > 6 then  //需要加密的字符串个数是否大于6判断
      iCrypt :=  6
    else
      iCrypt :=  Length(Pass_W);
    for iNum:=1 to iCrypt do
      sStr[iNum] := Char(Byte(sStr[iNum]) xor PW_Code[iNum]);  //输入密码与密钥进行或运算
    Encrypt := sStr;  //返回加密后的字符串
end;

function Decrypt(Pass_E:String):String;   //输入加过密的字符串
var  {*****解密运算函数 *****}
    sStr : string;
    iNum : integer;
begin
    //此解密算法只对字符串的前六位进行异或解密
    sStr := Pass_E;  
    if Length(Pass_E) > 6 then  //需要解密的字符串个数是否大于6判断
      iCrypt :=  6 
    else
      iCrypt :=  Length(Pass_E);
    for iNum := 1 to iCrypt do
      sStr[iNum] := Char(Byte(sStr[iNum]) xor PW_Code[iNum]);  //输入密码与密钥进行或运算
    Decrypt := sStr;  //返回加密后的字符串
end;

end.
