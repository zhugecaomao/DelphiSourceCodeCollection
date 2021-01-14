unit C_Ydsm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls;

type
  TYdsmForm = class(TStandForm)
    Bevel1: TBevel;
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Image5: TImage;
    Label4: TLabel;
    Image6: TImage;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YdsmForm: TYdsmForm;

procedure Ydsm;

implementation

{$R *.dfm}

procedure Ydsm;
begin
  YdsmForm := TYdsmForm.Create(Application);
  try
    with YdsmForm do
    begin
      ShowModal;
    end;
  finally
    YdsmForm.Free;
  end;
end;

end.
