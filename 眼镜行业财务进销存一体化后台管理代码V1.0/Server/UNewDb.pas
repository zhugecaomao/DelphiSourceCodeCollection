unit UNewDb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFmNewDb = class(TForm)
    Panel1: TPanel;
    edtname: TLabeledEdit;
    Label1: TLabel;
    Mremark: TMemo;
    btnok: TBitBtn;
    btncancel: TBitBtn;
    procedure btncancelClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmNewDb: TFmNewDb;

implementation

uses UBook;

{$R *.dfm}

procedure TFmNewDb.btncancelClick(Sender: TObject);
begin
  FmBook.DBname:='';
  FmBook.DBREmark:='';
  close;
end;

procedure TFmNewDb.btnokClick(Sender: TObject);
begin
  if trim(edtname.Text)='' then
  begin
    application.MessageBox('«Î ‰»Î’ Ã◊√˚≥∆£°',pchar(application.Title)mb_iconinformation);
    edtname.SetFocus;
    exit;
  end;
  FmBook.DBname:=trim(edtname.Text);
  FmBook.DBREmark:=trim(mremark.Text);
  close;
end;

end.
