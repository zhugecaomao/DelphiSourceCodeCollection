unit PPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LeftPas, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, Grids, DBGrids, QRPrntr,
  StdCtrls;

type
  TPreview = class(TForm)
    QRPreview1: TQRPreview;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Preview: TPreview;

implementation

uses Xeduser;

{$R *.DFM}

procedure TPreview.FormCreate(Sender: TObject);
begin
  LeftForm.P1.Filter := Format('Á÷Ë®ºÅ = %d', [LKey]);
  LeftForm.P2.Filter := LeftForm.P1.Filter;
  LeftForm.P3.Filter := LeftForm.P1.Filter;
  LeftForm.P1.Filtered := True;
  LeftForm.P2.Filtered := True;
  LeftForm.P3.Filtered := True;
end;

procedure TPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRPreview1.QRPrinter := nil;
  LeftForm.P1.Filtered := False;
  LeftForm.P2.Filtered := False;
  LeftForm.P3.Filtered := False;
  Action := caFree;
end;

procedure TPreview.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TPreview.Button1Click(Sender: TObject);
begin
  QRPreview1.QRPrinter.Print;
end;

procedure TPreview.Button3Click(Sender: TObject);
begin
  AbortPrint;
end;

end.

