unit RegUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RzPanel, RzForms, RzBckgnd, RzButton, StdCtrls, Mask, RzEdit,
  RzLabel, RzCmboBx;

type
  TfrmReg = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzPanel3: TRzPanel;
    RzSeparator1: TRzSeparator;
    RzGroupBox1: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzLabel1: TRzLabel;
    edName: TRzEdit;
    RzLabel2: TRzLabel;
    edPassword: TRzEdit;
    RzLabel3: TRzLabel;
    edConfirm: TRzEdit;
    RzBitBtn2: TRzBitBtn;
    RzLabel4: TRzLabel;
    edRemark: TRzMemo;
    RzLabel5: TRzLabel;
    cbSex: TRzComboBox;
    RzShapeButton1: TRzShapeButton;
    UserImageList: TRzImageComboBox;
    RzLabel6: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReg: TfrmReg;

implementation

uses mainfrm, Logfrm;

{$R *.DFM}

procedure TfrmReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TfrmReg.RzBitBtn1Click(Sender: TObject);
begin
  if frmLogin<>nil then
    frmLogin.show;
  close;
  frmReg:=nil;
end;

procedure TfrmReg.RzBitBtn2Click(Sender: TObject);
begin
  if (trim(Lowercase(edName.Text))='admin') then
  begin
    frmmain.Information('这是系统管理员帐号你不能申请！');
    exit;
  end;
  if (trim(edName.Text)='') or (trim(edPassword.Text)='')
    or (trim(edConfirm.Text)='') or (trim(cbSex.Text)='') or (trim(edRemark.Text)='') then
    frmmain.Information('请输入完整的个人信息！')
  else
  begin
    if trim(edPassword.Text)<>trim(edConfirm.Text) then
      frmmain.Information('两次输入的密码不符，请重输！')
    else
    begin
      with frmmain do
      begin
        send('R',inttostr(UserImageList.ItemIndex),
           edName.Text,'1',
          inttostr(cbSex.ItemIndex),edPassword.Text,
          edRemark.Text,frmmain.myHost);//向服务器发送注册请求;字段不够，先用句柄存放头像

        frmmain.myName:=edName.Text ;
        frmmain.mySex:=cbSex.ItemIndex ;
      end;
      if frmLogin<>nil then
      begin
        frmLogin.close;
        frmLogin:=nil;
      end;
      close;
      frmReg:=nil;
    end;
  end;
end;

procedure TfrmReg.FormCreate(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to frmmain.ImageList3.Count -1 do
  begin
    UserImageList.AddItem('',i,0);
    UserImageList.ItemIndex :=0;
  end;
end;

procedure TfrmReg.FormDestroy(Sender: TObject);
begin
  frmReg:=nil;
end;

end.
