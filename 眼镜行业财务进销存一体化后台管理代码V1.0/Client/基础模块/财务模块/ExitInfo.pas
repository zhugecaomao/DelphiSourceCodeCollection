unit ExitInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TExitInfoFm = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn4: TBitBtn;
  private
    lBillLimit:integer;
    szQulatiStatus:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExitInfoFm: TExitInfoFm;
  function ExitInfoWin:TModalResult;

implementation

{$R *.DFM}

function ExitInfoWin:TModalResult;
begin
   ExitInfoFm:= TExitInfoFm.Create(nil);
   ExitInfoFm.ShowModal;
   ExitInfoWin := ExitInfoFm.ModalResult;
   ExitInfoFm.free;
end;

end.
