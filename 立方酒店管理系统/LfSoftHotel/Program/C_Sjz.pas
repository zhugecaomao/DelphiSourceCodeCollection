unit C_Sjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls;

type
  TSjzForm = class(TStandForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Timer1: TTimer;
    Bevel1: TBevel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SjzForm: TSjzForm;

procedure Sjz;

implementation

{$R *.dfm}

procedure Sjz;
begin
  SjzForm := TSjzForm.Create(Application);
  try
    SjzForm.ShowModal;
  finally
    SjzForm.Free;
  end;

end;

procedure TSjzForm.Timer1Timer(Sender: TObject);
var
  H,M,S,MS: Word;
begin
  DeCodeTime(Time,H,M,S,MS);

  Label1.Caption := TimeToStr(EnCodeTime(H,M,S,MS));
  Label2.Caption := TimeToStr(EnCodeTime(H,M,S,MS));
  Label3.Caption := TimeToStr(EnCodeTime(H,M,S,MS));
  Label4.Caption := TimeToStr(EnCodeTime((H+24+1) mod 24,M,S,MS));
  Label5.Caption := TimeToStr(EnCodeTime((H+24-7) mod 24,M,S,MS));
  Label6.Caption := TimeToStr(EnCodeTime((H+24+1) mod 24,M,S,MS));
  Label7.Caption := TimeToStr(EnCodeTime((H+24+2) mod 24,M,S,MS));
  Label8.Caption := TimeToStr(EnCodeTime((H+24-8) mod 24,M,S,MS));
  Label9.Caption := TimeToStr(EnCodeTime((H+24+11) mod 24,M,S,MS));
  Label10.Caption := TimeToStr(EnCodeTime((H+24-1) mod 24,M,S,MS));
  Label11.Caption := TimeToStr(EnCodeTime((H+24-7) mod 24,M,S,MS));
  Label12.Caption := TimeToStr(EnCodeTime((H+24-7) mod 24,M,S,MS));
  Label13.Caption := TimeToStr(EnCodeTime((H+24-5) mod 24,M,S,MS));
  Label14.Caption := TimeToStr(EnCodeTime((H+24+11) mod 24,M,S,MS));
  Label15.Caption := TimeToStr(EnCodeTime((H+24+11) mod 24,M,S,MS));
  Label16.Caption := TimeToStr(EnCodeTime((H+24+2) mod 24,M,S,MS));
  Label17.Caption := TimeToStr(EnCodeTime((H+24-5) mod 24,M,S,MS));
  Label18.Caption := TimeToStr(EnCodeTime((H+24-7) mod 24,M,S,MS));
  Label19.Caption := TimeToStr(EnCodeTime((H+24-8) mod 24,M,S,MS));
  Label20.Caption := TimeToStr(EnCodeTime((H+24-8) mod 24,M,S,MS));
  Label21.Caption := TimeToStr(EnCodeTime((H+24-4) mod 24,M,S,MS));
  Label22.Caption := TimeToStr(EnCodeTime((H+24-5) mod 24,M,S,MS));
  Label23.Caption := TimeToStr(EnCodeTime((H+24-7) mod 24,M,S,MS));
  Label24.Caption := TimeToStr(EnCodeTime((H+24+1) mod 24,M,S,MS));
  Label25.Caption := TimeToStr(EnCodeTime((H+24-2) mod 24,M,S,MS));
  Label26.Caption := TimeToStr(EnCodeTime((H+24+4) mod 24,M,S,MS));
  Label27.Caption := TimeToStr(EnCodeTime((H+24-6) mod 24,M,S,MS));
  Label28.Caption := TimeToStr(EnCodeTime((H+24-7) mod 24,M,S,MS));
  Label29.Caption := TimeToStr(EnCodeTime((H+24+12) mod 24,M,S,MS));
  Label30.Caption := TimeToStr(EnCodeTime((H+24+13) mod 24,M,S,MS));
end;

procedure TSjzForm.FormShow(Sender: TObject);
var
  T: TLabel;
  i: Integer;
begin
  for i:=1 to 30 do
  begin
    T := SjzForm.FindComponent('Label'+IntToStr(i)) as TLabel;
    T.Caption := '';
  end;
end;

end.
