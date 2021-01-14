unit U_SpbmInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, Mask,db;

type
  TfrmSpbmInput = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpbmInput: TfrmSpbmInput;

implementation
    uses main,u_dm,u_public,common;
{$R *.dfm}

procedure TfrmSpbmInput.SpeedButton2Click(Sender: TObject);
begin
dm.ADO_SPBMK.CancelUpdates ;
close;
end;

procedure TfrmSpbmInput.SpeedButton1Click(Sender: TObject);
var
  s_bm:string;
begin
try
s_bm:=trim(dbedit1.Text);
  //查找重复编号
  if DM.ADO_SPBMK.state = dsinsert then
  begin

    if findundo('spbh','spbmk',s_bm,frmmain.adoqytmp ) then
    begin
      application.MessageBox('商品编码已重复', '材料租赁系统', mb_iconinformation + mb_defbutton1);
      dbedit1.SetFocus;
      exit;
    end;
  end;
dm.ADO_SPBMK.Post;
except
application.MessageBox('商品保存出错!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
exit;
end;
close;
end;

procedure TfrmSpbmInput.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
   dm.ADO_SPBMK.FieldByName('jldw2').AsString :=trim(dbedit3.Text); 

end;

end.
