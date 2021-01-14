unit TAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TGLTrisAbout = class(TForm)
    OKBtn: TButton;
    Logo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GLTrisAbout: TGLTrisAbout;

implementation

{$R *.DFM}





end.
