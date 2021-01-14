unit WrapMemo;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TWrapMemo = class(TMemo)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;  {这个声明都是一样的}
  published
    { Published declarations }
    property WordWrap default False;
  end;

procedure Register;

implementation

constructor TWrapMemo.Create(AOwner: TComponent);    {这个在单元的implementation部分}
begin
  inherited Create(AOwner);                           {必须在第一条语句！}
  WordWrap := False;                                 {设置新的值}
end;


procedure Register;
begin
  RegisterComponents('Samples', [TWrapMemo]);
end;

end.
