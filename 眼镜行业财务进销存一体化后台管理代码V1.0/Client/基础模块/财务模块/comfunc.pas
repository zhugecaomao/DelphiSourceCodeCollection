unit comfunc;

interface

uses Grids,SysUtils;

  function DelRow(var StrGrid:TStringGrid;Arow:integer):boolean;
  function clearGrid(var Grid:TStringGrid):boolean;
  procedure RefreshOrd(var Grid:TStringGrid);
implementation


function clearGrid(var Grid:TStringGrid):boolean;
var i:integer;
begin
   for i:=1 to Grid.RowCount-1 do
      Grid.Rows[i].Clear;
   RefreshOrd(Grid);
   Result:=true;
end;
//É¾³ýÐÐ
function DelRow(var StrGrid:TStringGrid;Arow:integer):boolean;
var
  i,n,Acol:integer;
begin
  Result := True;
  if Arow=0 then
  begin
    Result := False;
    Exit;
  end;
  Try
    n := Arow;
    Acol := StrGrid.ColCount-1;
    while n<StrGrid.RowCount do
    begin
      for i:=1 to Acol do
        StrGrid.Cells[i,n] := StrGrid.Cells[i,n+1];
      inc(n);
    end;
    if StrGrid.RowCount>2 then StrGrid.RowCount:=StrGrid.RowCount-1;
  Except
    Result := False;
  End;
end;

procedure RefreshOrd(var Grid:TStringGrid);
var i:integer;
begin
  for i:=1 to Grid.RowCount-1 do
    begin
     Grid.Cells[0,i]:=inttostr(i);
    end;
end;


end.
