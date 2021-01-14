unit XGKLUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatSpeedButtonUnit, StdCtrls, AAFont, AACtrls, ExtCtrls,
  TFlatPanelUnit;

type
  TXGKLForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    AALabel3: TAALabel;
    AALabel4: TAALabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure FlatSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XGKLForm: TXGKLForm;

implementation

uses MainUnit, DMUnit, DENLUUnit;

{$R *.dfm}

procedure TXGKLForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TXGKLForm.FormCreate(Sender: TObject);
begin
  If DM.UseNameQuery.Active=False then
    DM.UseNameQuery.Active:=true;
    Edit1.Text:=MainForm.FName;
end;

procedure TXGKLForm.FlatSpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TXGKLForm.FlatSpeedButton1Click(Sender: TObject);
var
  Str,jj:string;
begin
  Str:=Edit1.Text;
  if (Edit3.Text)<>(Edit4.Text) then
   begin
   ShowMessage('新口令与确认口令不同,请正确输入!');
   Exit;
   end;
   DM.UseNameQuery.Close;
   DM.UseNameQuery.SQL.Clear;
   DM.UseNameQuery.SQL.Add('Select PASS from UseName where NAME='+''''+Trim(Str)+'''');
   DM.UseNameQuery.Open;
   jj:=DM.UseNameQuery.FieldByName('PASS').AsString;
   if Trim(jj)<>Edit2.Text then
    begin
      ShowMessage('输入原口令错误!');
      Exit;
    end;
     Try
      DM.UseNameQuery.Close;
      DM.UseNameQuery.SQL.Clear;
      DM.UseNameQuery.SQL.Add('update UseName set PASS='+''''+Edit3.Text+'''' +' where NAME='+''''+Trim(str)+'''');
      DM.UseNameQuery.ExecSQL;
      ShowMessage('修改口令成功!');
     Except
     ShowMessage('修改口令失败!');
     end;
end;

end.
