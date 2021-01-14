unit C_Ftsm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, C_Define;

type
  TFtsmForm = class(TStandForm)
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Image4: TImage;
    Label3: TLabel;
    Image5: TImage;
    Label4: TLabel;
    Image6: TImage;
    Label5: TLabel;
    Image7: TImage;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
  private
    { Private declarations }
    procedure ShowFtsm;
  public
    { Public declarations }
  end;

var
  FtsmForm: TFtsmForm;

procedure Ftsm;
implementation

{$R *.dfm}

procedure Ftsm;
begin
  FtsmForm := TFtsmForm.Create(Application);
  try
    with FtsmForm do
    begin
      ShowFtsm;
      ShowModal;
    end;
  finally
    FtsmForm.Free;
  end;
end;

procedure TFtsmForm.ShowFtsm;
begin
  Label1.Color := COLOR_OK;
  Label2.Color := COLOR_BF;
  Label3.Color := COLOR_TD;
  Label4.Color := COLOR_WX;
  Label5.Color := COLOR_MF;
  Label6.Color := COLOR_ZK;
end;

end.
