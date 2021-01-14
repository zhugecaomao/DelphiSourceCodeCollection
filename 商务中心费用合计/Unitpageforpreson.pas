unit Unitpageforpreson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls,
  Menus, Buttons, StdCtrls, Mask, DBCtrls, ComCtrls;

type
  TF_pageforpreson = class(TForm)
    DataSource1: TDataSource;
    pgc1: TPageControl;
    ts1: TTabSheet;
    dbedt2: TDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    dbedt3: TDBEdit;
    pgc2: TPageControl;
    ts2: TTabSheet;
    lbl1: TLabel;
    dbedt1: TDBEdit;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbedt3KeyPress(Sender: TObject; var Key: Char);
    procedure dbedt3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pageforpreson: TF_pageforpreson;

implementation
uses UDM;

{$R *.dfm}

procedure TF_pageforpreson.btn1Click(Sender: TObject);
begin
 if dm.qrypsw.RecordCount>=0 then
 begin
   dm.qrypsw.Edit;
   dm.qrypsw.FieldByName('czydm').AsString:=dbedt3.Text;
   dm.qrypsw.FieldByName('czyxm').AsString:=dbedt2.Text;
   dm.qrypsw.FieldByName('czykl').AsString:=dbedt1.Text;
   dm.qrypsw.Post;
 end;
 close;

end;

procedure TF_pageforpreson.btn2Click(Sender: TObject);
begin
 close;
end;

procedure TF_pageforpreson.dbedt3KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9',#8]) then
   key:=#0;

end;

procedure TF_pageforpreson.dbedt3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=$0D  then
   dbedt2.SetFocus;
end;

procedure TF_pageforpreson.dbedt2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=$0D  then
  dbedt1.SetFocus;
end;

procedure TF_pageforpreson.dbedt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=13 then
  btn1Click(Sender);
end;

end.
