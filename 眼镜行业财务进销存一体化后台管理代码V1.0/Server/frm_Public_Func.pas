//{公用函数单元（完成服务器的具体的功能）
unit frm_Public_Func;

interface
uses
    Windows, Messages, SysUtils, Variants, Classes,  Controls, Forms,
    ExtCtrls,  StdCtrls,db,ComCtrls,adodb;
function queryrecord (queryname:TADOQuery;sql:string):boolean; //查询 true 为有记录，false为没有记录;
implementation
function queryrecord(queryname:TADOQuery;sql:string):boolean; //查询 true 为有记录，false为没有记录;
begin
    queryname.Close;
    queryname.SQL.Clear;
    queryname.SQL.Text:=trim(sql);
    queryname.Open;
    if queryname.RecordCount<=0 then
    begin
        result:=false;
    end
    else
    begin
        result:=true;
    end;
end;

end.
