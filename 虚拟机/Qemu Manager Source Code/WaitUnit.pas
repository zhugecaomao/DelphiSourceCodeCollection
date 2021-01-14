unit WaitUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, dialogs,
   ExtCtrls, StdCtrls, Buttons,TntDBCtrls, TntStdCtrls, TntExtCtrls, TntButtons,
  TntComCtrls,TNTForms;


type
  TWait = class(TTNTForm)
    WaitTxt: TTNTLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Wait: TWait;

implementation
Uses MainUnit;

{$R *.DFM}


procedure TWait.SpeedButton1Click(Sender: TObject);
begin
Close
end;

procedure TWait.FormShow(Sender: TObject);
begin
WaitTxt.Caption := WaitText;
If WaitText = '' Then WaitTxt.Caption := 'One Moment Please...';
end;

end.
