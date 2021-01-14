unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg;

type
  TfrmAbout = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}

procedure TfrmAbout.FormShow(Sender: TObject);
var
  MS: TMemoryStatus;
begin
  //GlobalMemoryStatus(MS);
  //PhysMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  //FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);
end;

procedure TfrmAbout.Image1Click(Sender: TObject);
begin
   close;
end;

end.
 
