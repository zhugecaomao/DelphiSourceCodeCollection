unit U_zgdakp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Mask, Buttons, Db, DBClient,ADODB;

type
  TfrmZgda_Kp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZgda_Kp: TfrmZgda_Kp;

implementation

uses U_zgda,uPublic,uDB;

{$R *.DFM}

procedure TfrmZgda_Kp.SpeedButton1Click(Sender: TObject);
var
  s_zgbh: string;
  query: TADOQuery;
begin
//重复编号
  if trim(dbedit1.text) = '' then
  begin
    application.messagebox('职工编号不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbedit1.setfocus;
    exit;
  end;

  s_zgbh := dbedit1.Text;
  query := TADOQuery.Create(nil);
  query.Connection := dmWarehouse.ACWarehouse;
  query.SQL.Text:='select * from ZGDA where EmpID="' + s_zgbh + '"';
  if not query.Eof then
  begin
    application.MessageBox('职工编号已重复', '仓库管理系统', mb_iconinformation + mb_defbutton1);
      dbedit1.SetFocus;
    exit;
  end;
  if trim(dbedit5.text) = '' then
  begin
    application.messagebox('所属部门编码不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbedit5.setfocus;
    exit;
  end;

  if trim(dbedit2.text) = '' then
  begin
    application.messagebox('职工姓名不能为空', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    dbedit2.setfocus;
    exit;
  end;

  frmZGDA.aqZGDA.Post;
  close;
end;

procedure TfrmZgda_Kp.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmZgda_Kp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmZGDA.aqZGDA.cancel;
end;

procedure TfrmZgda_Kp.BitBtn1Click(Sender: TObject);
begin
  frmZGDA.aqZGDA.FieldByName('DepCode').Value := GetEmployeeName;
end;

end.

