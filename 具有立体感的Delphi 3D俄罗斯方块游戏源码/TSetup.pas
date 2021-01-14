unit TSetup;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Spin;

type
  TGLTrisSetup = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    SpinX: TSpinEdit;
    SpinY: TSpinEdit;
    SpinZ: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Graphic: TRadioGroup;
    Label4: TLabel;
    SpinS: TSpinEdit;
    Label5: TLabel;
    SpinR: TSpinEdit;
    procedure SpinYChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute : boolean;
  end;

var
  GLTrisSetup: TGLTrisSetup;

implementation

{$R *.DFM}

function TGLTrisSetup.Execute : boolean;
var f : file of byte;
    b : byte;
begin
  Execute := false;
  AssignFile( f, Copy( ParamStr( 0 ), 1, Length( ParamStr( 0 ) ) - 3 ) + 'cfg' );
  {$I-}
    Reset( f );
  {$I+}
  if IOResult <> 0 then begin
    SpinX.Value := 8;
    SpinY.Value := 11;
    SpinZ.Value := 8;
    SpinS.Value := 1;
    SpinR.Value := 0;
    Graphic.ItemIndex := 1;
  end else begin
    Read( f, b ); SpinX.Value := b;
    Read( f, b ); SpinY.Value := b;
    Read( f, b ); SpinZ.Value := b;
    Read( f, b ); SpinS.Value := b;
    Read( f, b ); SpinR.Value := b;
    Read( f, b ); Graphic.ItemIndex := b;
    CloseFile( f );
  end;
  SpinR.MaxValue := SpinY.Value - 4;
  if ShowModal = mrOK then begin
    ReWrite( f );
    b := SpinX.Value; Write( f, b );
    b := SpinY.Value; Write( f, b );
    b := SpinZ.Value; Write( f, b );
    b := SpinS.Value; Write( f, b );
    b := SpinR.Value; Write( f, b );
    b := Graphic.ItemIndex; Write( f, b );
    CloseFile( f );
    Execute := true;
  end;
end;

procedure TGLTrisSetup.SpinYChange(Sender: TObject);
begin
  SpinR.MaxValue := SpinY.Value - 4;
  if SpinR.Value > SpinR.MaxValue then
     SpinR.Value := SpinR.MaxValue;
end;

end.
