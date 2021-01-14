unit uBusy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Animate, GIFCtrl, ExtCtrls, ComCtrls;

type
  TBusyForm = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BusyForm: TBusyForm;

implementation

{$R *.DFM}
{$R BUSY.RES}

procedure TBusyForm.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE)AND NOT WS_CAPTION);
  ClientHeight:=Height;
  Animate1.ResHandle:=0;
  Animate1.ResName:='BUSYAVI';
  Animate1.Active:=True;
end;

end.
