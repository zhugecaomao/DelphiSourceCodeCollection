unit Unitzc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,registry, Buttons, ComCtrls;

type
  TFormzc = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    cfind: TAnimate;
    Panel4: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    editfwqmc: TLabeledEdit;
    edityhm: TLabeledEdit;
    edityhmm: TLabeledEdit;
    editsjkmc: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    r1: TRadioButton;
    r2: TRadioButton;
    labelzs: TLabel;
    procedure edityhmEnter(Sender: TObject);
    procedure edityhmmEnter(Sender: TObject);
    procedure editsjkmcEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure editfwqmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editsjkmcKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure r1Click(Sender: TObject);
    procedure r2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formzc: TFormzc;
  flag:integer;
implementation

uses Chain_Data, Unitpubsub;

{$R *.dfm}

procedure TFormzc.edityhmEnter(Sender: TObject);
begin
  //labelzs.Caption:='请输入用户名[不能为空]';
end;

procedure TFormzc.edityhmmEnter(Sender: TObject);
begin
  //labelzs.Caption:='请输入注册密码[可以为空]';
end;

procedure TFormzc.editsjkmcEnter(Sender: TObject);
begin
  application.MessageBox('请输入数据库名称','提示',mb_iconwarning); 
end;

procedure TFormzc.BitBtn1Click(Sender: TObject);
var
  reg:treginifile;
  //reg:tinifile;
begin
  cfind.Active:=true;
  labelzs.Caption:='正在连接';
  reg:=treginifile.Create;
  reg.RootKey:=HKEY_LOCAL_MACHINE;
  reg.WriteString('\software\manager_sales','服务器名',editfwqmc.Text);
  reg.WriteString('\software\manager_sales','用户名称',edityhm.Text);
  reg.WriteString('\software\manager_sales','用户密码',edityhmm.Text);
  reg.WriteString('\software\manager_sales','数据库名称',editsjkmc.Text);
  reg.WriteString('\software\manager_sales','连接模式',inttostr(flag));
  try
    application.CreateForm(Tfrm_Chain_Data,frm_Chain_Data);
  except
    reg.WriteString('\software\manager','服务器名','');
    reg.WriteString('\software\manager','用户名称','');
    reg.WriteString('\software\manager','用户密码','');
    reg.WriteString('\software\manager','数据库名称','');
    reg.WriteString('\software\manager','连接模式','');
    application.MessageBox('数据库连接错误！请检查注册信息是否正确','错误',mb_iconwarning);
    editfwqmc.SetFocus;
    reg.free;
    exit;
  end;
  application.MessageBox('数据库连接完成!',pchar(application.Title),mb_iconinformation);
  servername:=trim(editfwqmc.Text);
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  Reg.OpenKey('\SOFTWARE\Microsoft\windows\CurrentVersion\Run',true); //写入程序中的启动拦
  Reg.writeString ('SOFTWARE\Microsoft\windows\CurrentVersion\Dataservice',Application.Exename,'');
  reg.free;
  close;
end;

procedure TFormzc.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFormzc.editfwqmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    sendmessage(getactivewindow,wm_nextdlgctl,0,0);
end;

procedure TFormzc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFormzc.editsjkmcKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  sendmessage(getactivewindow,wm_nextdlgctl,0,0);
end;



procedure TFormzc.FormShow(Sender: TObject);
begin
  r2.Checked:=true;
  flag:=2;
end;

procedure TFormzc.r1Click(Sender: TObject);
begin
  if r1.Checked then
  begin
    edityhm.Enabled:=false;
    edityhmm.Enabled:=false;
    flag:=1;
  end else
  begin
    edityhm.Enabled:=true;
    edityhmm.Enabled:=true;
    flag:=0;
  end;
end;

procedure TFormzc.r2Click(Sender: TObject);
begin
   if r1.Checked then
  begin
    edityhm.Enabled:=false;
    edityhmm.Enabled:=false;
    flag:=1;
  end else
  begin
    edityhm.Enabled:=true;
    edityhmm.Enabled:=true;
    flag:=0;
  end;
end;

end.
