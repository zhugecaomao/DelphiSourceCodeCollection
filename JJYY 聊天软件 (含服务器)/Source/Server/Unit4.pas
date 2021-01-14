unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TAddfrm = class(TForm)
    Label1: TLabel;
    edName: TEdit;
    Label2: TLabel;
    edPassword: TEdit;
    Label3: TLabel;
    ComSex: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    edPassword1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Addfrm: TAddfrm;

implementation

uses Unit1, Unit5;

{$R *.dfm}

procedure TAddfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TAddfrm.FormDestroy(Sender: TObject);
begin
  Addfrm:=nil;
end;

procedure TAddfrm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TAddfrm.FormCreate(Sender: TObject);
begin
  ComSex.ItemIndex :=0;
end;

procedure TAddfrm.BitBtn1Click(Sender: TObject);
var
  ID:string;
begin
  if trim(edName.Text)='' then
  begin
    MessageBox(Handle, '请输入用户名称。', '警告', MB_ICONWARNING);
    exit;
  end;

  if trim(edPassword.Text)='' then
  begin
    MessageBox(Handle, '请输入密码。', '警告', MB_ICONWARNING);
    exit;
  end;

  if trim(edPassword.Text)<>trim(edPassword1.Text) then
  begin
    MessageBox(Handle, '您输入的密码不匹配，请在两个文本框内输入新密码。', '警告', MB_ICONWARNING);
    exit;
  end;

  try
    Randomize;
    ID:=form1.NewID(Random(1000));
    form1.InsUser(ID,edName.Text,edPassword.Text,'localhost','127.0.0.1',0,0,ComSex.ItemIndex,'这家伙巨懒！',0);
    form1.UserList.Add(ID+';'+
                       edName.Text+';'+
                       'localhost;'+
                       '127.0.0.1;'+
                       '0;'+
                       inttostr(ComSex.ItemIndex)+';'+
                       '0' );
    setlength(form1.UserRemark,length(form1.UserRemark)+1);
    form1.UserRemark[length(form1.UserRemark)-1]:='这家伙巨懒！';
    form1.SendAllUser(0,edName.Text,inttostr(ComSex.ItemIndex),'0','2',ID);
    close;
    MessageBox(Handle, pchar('添加成功，ID是'+ID+'。'), '提示', MB_ICONWARNING);
    form1.BrowseUser;
  except
    on E: Exception do MessageBox(Handle,pchar('新增用户失败。原因：'+e.Message), '提示', MB_ICONASTERISK);
  end;
end;

end.
