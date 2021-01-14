unit FirstDLL;

interface

  function Add10(number:integer):integer; stdcall;

implementation

function Add10(number:integer):integer; stdcall;
begin
  try
    Result := number + 10;
  except
    Result := -1;
  end;
end;

end.
 