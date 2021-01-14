unit Unitmakecharter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  Buttons, StdCtrls, Mask, DBCtrls;

type
  TF_makecharter = class(TForm)
    DataSource1: TDataSource;
    btn1: TBitBtn;
    btn2: TBitBtn;
    grp1: TGroupBox;
    dbedt1: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dbedt2: TDBEdit;
    grp2: TGroupBox;
    dbedt3: TDBEdit;
    lbl4: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbedt1KeyPress(Sender: TObject; var Key: Char);
    procedure dbedt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_makecharter: TF_makecharter;

implementation
uses UDM;
{$R *.dfm}

procedure TF_makecharter.btn1Click(Sender: TObject);
begin
close;
end;

procedure TF_makecharter.btn2Click(Sender: TObject);
begin
   dm.qrypsw.Edit;
   dm.qrypsw.FieldByName('czydm').AsString:=dbedt1.Text;
   dm.qrypsw.FieldByName('czyxm').AsString:=dbedt2.Text;
   dm.qrypsw.FieldByName('czykl').AsString:=dbedt3.Text;
   dm.qrypsw.Post;
   ShowMessage('ÐÞ¸Ä³É¹¦£¡');
   close;
end;

procedure TF_makecharter.dbedt1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then
  key:=#0;
end;

procedure TF_makecharter.dbedt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=$0D then
  dbedt2.SetFocus;
end;

procedure TF_makecharter.dbedt2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=$0D then
  dbedt3.SetFocus;
end;

procedure TF_makecharter.dbedt3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
 btn2Click(Sender);
end;

end.
