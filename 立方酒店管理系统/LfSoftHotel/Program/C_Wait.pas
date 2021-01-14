unit C_Wait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TWaitForm = class(TForm)
    Panel2: TPanel;
    Label4: TLabel;
    Animate1: TAnimate;
    Label1: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
    procedure GetTitle(ATitle: string);

  public
    { Public declarations }
    property FTitle: string write GetTitle;
  end;

var
  WaitForm: TWaitForm;

implementation

{$R *.dfm}

procedure TWaitForm.GetTitle(ATitle: string);
begin
  Label1.Caption := ATitle;
  Label3.Caption := ATitle;
  Animate1.Active:= True;
end;

end.
