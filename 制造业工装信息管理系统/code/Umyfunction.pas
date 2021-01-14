unit Umyfunction;

interface
uses
  SysUtils, Forms,StdCtrls ;

  procedure clearEdt(Frm: Tform);
  function replace(s,s1,s2:string):string;//把S中的S2用S1替换

implementation

procedure clearEdt(Frm: Tform);
var
  i:integer;
begin
  //清空窗体上所有edit
  with Frm do begin
    for i:=0 to ComponentCount-1 do begin
      if (Components[i] is tedit) then
        (Components[i] as tedit).text:='';
      if (Components[i] is tcombobox) then
        (Components[i] as tcombobox).text:='';
      if (Components[i] is tmemo) then
        (Components[i] as tmemo).text:='';
    end;
  end;
end;

function replace(s,s1,s2:string):string;//把S中的S1用S2替换
var
  str:string;
  Plen,Slen,id:integer;//串长，子串长，子串位置
begin
  s:=trim(s)+' ';
  s1:=trim(s1)+' ';
  s2:=trim(s2)+' ';
  Plen:=length(s);
  Slen:=length(s1);
  id:=pos(s1,s);
  if id<1 then exit;
  str:='';
  str:=copy(s,1,id-1);
  str:=str+s2;
  str:=str+copy(s,id+Slen,Plen-(id+Slen-1));
  result:=str;
end;


end.
