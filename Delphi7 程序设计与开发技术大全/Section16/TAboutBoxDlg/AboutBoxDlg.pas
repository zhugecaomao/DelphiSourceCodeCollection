unit AboutBoxDlg;

interface

uses
  Windows, SysUtils, Messages, WinTypes, WinProcs,  Classes, Graphics, Controls,
  Forms,About;


type
  TAboutBoxDlg = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    function Execute: Boolean;
  published
    { Published declarations }
  end;

procedure Register;

var
  AboutBox: TAboutBox;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TAboutBoxDlg]);
end;

function  TAboutBoxDlg.Execute: Boolean;
begin
  try
    AboutBox := TAboutBox.Create(Self); 
    if AboutBox.ShowModal = mrOK then
      Result := true
    else
      Result := False ;
  finally
    AboutBox.Free ; 
  end;

end;

end.
 