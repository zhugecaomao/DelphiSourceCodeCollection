program  ScrnSize;

uses
  Windows;

  // 格式化输出函数        {标题}   {输出格式}     {输出变量列表}
procedure MessageBoxPrintf(Caption, Format: PChar; const Args: array of const);
var
  OutBuff: array[0..100] of Char; // 最终输出文字
  OutList: array of LongWord;     // 输出变量列表
  J: Integer;
begin
  SetLength(OutList, 0);
  for J := Low(Args) to High(Args) do // Args -> OutList
  begin
    case Args[J].VType of  // 这里仅处理了两种类型
      vtInteger: begin
                   SetLength(OutList, Length(OutList)+1);
                   OutList[High(OutList)] := Args[J].VInteger;
                 end;
                 
      vtString : begin
                   SetLength(OutList, Length(OutList)+1);
                   OutList[High(OutList)] := LongWord(Args[J].VString);
                 end;
    end;
  end;
  if Length(OutList) = Length(Args) then // 列表成员均合法
  begin
    wvsprintf(OutBuff, Format, @OutList[0]);  // 转换
    MessageBox(0, OutBuff, Caption, 0);       // 输出
  end;
end;

var
  cxScreen, cyScreen: Integer;

begin
  cxScreen := GetSystemMetrics(SM_CXSCREEN); // 屏幕宽度
  cyScreen := GetSystemMetrics(SM_CYSCREEN); // 屏幕高度
  MessageBoxPrintf('ScrnSize',               
                   'The screen is %i pixels wide by %i pixels high.',
                   [cxScreen, cyScreen]);
end.
