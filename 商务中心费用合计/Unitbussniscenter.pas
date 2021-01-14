unit Unitbussniscenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, jpeg, StdCtrls, WinSkinData;

type
  TF_bussniscenter = class(TForm)
    img1: TImage;
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    lbl3: TLabel;
    SkinData1: TSkinData;
  procedure btn1Click(Sender: TObject);
   procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_bussniscenter: TF_bussniscenter;

implementation
uses UDM,Unitmain,inportantform;
{$R *.dfm}

procedure TF_bussniscenter.btn1Click(Sender: TObject);
begin
  with dm.qrypsw do
  begin
    Close;
    SQL.Clear;
    sql.Add('select * from psw_ta');
    SQL.Add('where czydm=:czydm');
    Parameters.ParamByName('czydm').Value:=Trim(edt1.Text);
    Prepared;
    Open;
  end;
 if dm.qrypsw.FieldByName('czydm').AsString<>'' then
 begin
  if DM.qrypsw.FieldByName('czykl').AsString=edt2.Text then
   begin
     dm.hname:=dm.qrypsw.fieldbyname('czyxm').AsString;
     dm.hma:=dm.qrypsw.fieldbyname('czydm').AsString;
     F_bussniscenter.Hide;
     f_inportantform.Show;
   end
   else
   begin
   MessageBox(Handle,'操作员口令错误!','系统提示',MB_ICONINFORMATION+MB_OK);
   edt2.Text:='';
   Exit;

   End;
 end
 else
  MessageBox(Handle,'操作员代码错误!','系统提示',MB_ICONINFORMATION+MB_OK);
  edt1.Text:='';
  Exit;


end;

procedure TF_bussniscenter.btn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TF_bussniscenter.FormShow(Sender: TObject);
begin
  edt1.Text:='';
  edt2.Text:='';
end;

procedure TF_bussniscenter.edt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=$0D then
  edt2.SetFocus;
end;

procedure TF_bussniscenter.edt2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
 btn1Click(Sender);
end;

end.



