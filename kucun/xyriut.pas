unit xyriut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Txtczrzfm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    rzmo: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  xtczrzfm: Txtczrzfm;

implementation

{$R *.dfm}

procedure Txtczrzfm.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Txtczrzfm.BitBtn1Click(Sender: TObject);
begin
rzmo.Lines.LoadFromFile('logfile/Log.txt');

end;

end.
