unit uUtils;

interface

procedure FreeObject(aObject: TObject);

implementation

procedure FreeObject(aObject: TObject);
begin
  if Assigned(aObject) then
  begin
    aObject.Free;
  end;  
end;

end.





