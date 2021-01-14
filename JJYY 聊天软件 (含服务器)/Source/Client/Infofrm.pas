unit Infofrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RzPanel, RzBckgnd, StdCtrls, RzButton, RzForms;

type
  TfrmInfo = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzSeparator1: TRzSeparator;
    Image1: TImage;
    Label1: TLabel;
    RzBitBtn2: TRzBitBtn;
    RzFormShape1: TRzFormShape;
    RzShapeButton1: TRzShapeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzShapeButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.DFM}

procedure TfrmInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  frmInfo:=nil;
end;

procedure TfrmInfo.RzBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmInfo.RzShapeButton1Click(Sender: TObject);
begin
  close;
end;

end.
