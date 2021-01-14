unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,Inifiles;

type
  Tfrm_Login = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Cmd_Ok: TSpeedButton;
    Cmd_Cancel: TSpeedButton;
    User_No: TLabeledEdit;
    User_Pwd: TLabeledEdit;
    edtusername: TLabeledEdit;
    procedure Cmd_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cmd_CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure User_PwdKeyPress(Sender: TObject; var Key: Char);
    procedure User_NoKeyPress(Sender: TObject; var Key: Char);
    procedure User_NoExit(Sender: TObject);
  private
    { Private declarations }
    MYini: TIniFile;
  User_Type,User_Name,User_Time,User_date:String;
  MyTime,MYdate:String;
  procedure ReadInit;
  public
    { Public declarations }
    model:integer;
    tempPwd:string;
  end;

var
  frm_Login: Tfrm_Login;
implementation

uses Data, Main, func, untdatadm;

{$R *.dfm}
////////////////////////////////
procedure  Tfrm_Login.ReadInit;
var
  Dinit:olevariant;
begin
  with dmmain.cdsdata do
  begin
    close;
    data:=null;
    dinit:=null;
    try
      dinit:=adisp.execSql('select * from systemInit');
      if not varisnull(dinit) then
      begin
        data:=dinit;
        dinit:=null;
        if fieldbyname('isedit').AsInteger=1 then
        begin
          bedit:=true;
        end else
        begin
          bedit:=false;
        end;
        Skinid:=fieldbyname('Pfindex').AsInteger;
        len:=fieldbyname('datasize').AsInteger;
        ShowLimit:=fieldbyname('kcjk').AsInteger;
      end else
      begin
        bedit:=true;
        len:=2;
        skinid:=0;
        ShowLimit:=1;
      end;
      dmmain.SkinData1.LoadFromCollection(dmmain.SkinStore1,skinid);
      close;
    except
    end;
  end;
end;
/////////////////////////////////
procedure Tfrm_Login.Cmd_OkClick(Sender: TObject);
var
  part,pwd,scuid,user:widestring;
  storageid,dones:olevariant;//仓库编号和权限
  sql:string;
  i:integer;
  temp:widestring;
  //Fini:tinifile;
begin
  if trim(user_no.Text)='' then
  begin
     application.MessageBox('请输入用户编号！',pchar(application.Title),mb_iconwarning);
     user_no.SetFocus;
     exit;
  end;
  dones:=null;
  for i:=0 to 200 do
  begin
    loginlock[i]:=0;
  end;
  scuid:='{7E6276E9-C01C-473E-8092-88F21674E6DD}';
  user:=trim(user_no.Text);
  pwd:=trim(user_pwd.Text);
  part:='0';
  try
    dones:=adisp.userlogin(part,user,pwd,scuid,storageid);
    if trim(vartostr(dones))='' then
    begin
      application.MessageBox('你的登陆验证信息有误，请确定后输入！',pchar(application.Title),mb_iconwarning);
      user_no.SetFocus;
      exit;
    end else
    begin
      if varisnull(storageid) then
      begin
        shopid:='';
      end else
      begin
        shopid:=vartostr(storageid);
      end;
      qx:=vartostr(dones);
      Handle_Man:=trim(edtusername.Text);
      Handle_no:=trim(user_no.Text);
      ReadInit;
      if model=1 then
      begin
      frm_main.StatusBar1.Panels[0].Text:='当前操作员：'+trim(edtusername.Text);
      frm_main.StatusBar1.Panels[1].Text:='部门编号：'+trim(Handle_Part);
      frm_main.StatusBar1.Panels[2].Text:='使用仓库编号：'+trim(shopid);
      ////////////////////////////////////////////
      with  frm_main do
      begin
        getlock(qx,1,listview1.items.count);
        getlock(qx,2,listview3.items.count);
        getlock(qx,3,lviewbatch.items.count);
        getlock(qx,4,listview4.items.count);
        getlock(qx,5,listview5.items.count);
        getlock(qx,6,listview6.items.count);
        getlock(qx,7,listview7.items.count);
      end;
      end;
       temp:=' select managerid from stock_manager where storageid='+''''+trim(shopid)+'''';
      dones:=null;
      dones:=adisp.execSql(temp);
      if not varisnull(dones) then
      begin
        dmmain.CDSexecsql.Close;
        dmmain.CDSexecsql.Data:=null;
        dmmain.CDSexecsql.Data:=dones;
        dones:=null;
        if dmmain.CDSexecsql.IsEmpty then
        begin
          localb:=true;
        end else
        begin
          localb:=false;
        end;
      end else
      begin
        localb:=true;
      end;
      MSTORAGE.Clear;
      close;
    end;
  except
     application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
     exit;
  end;
end;

procedure Tfrm_Login.FormShow(Sender: TObject);
begin
  if model<>1 then
  begin
    createinter;// 创建动态借口;
  end;
end;

procedure Tfrm_Login.Cmd_CancelClick(Sender: TObject);
begin
  if model<>1 then
  begin
  close;
  application.Terminate;
  end else
  begin
    close;
  end;
end;

procedure Tfrm_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

procedure Tfrm_Login.User_PwdKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then
    begin
        Cmd_Ok.Click;
    end;
end;

procedure Tfrm_Login.User_NoKeyPress(Sender: TObject; var Key: Char);
var
  sql:widestring;
begin
  if key=#13 then
  begin
    edtusername.Clear;
    sql:='select Employe_Name,part from [chang] where p_no='+''''+trim(user_no.Text)+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    try
    dmmain.CDSexecsql.Data:=adisp.execSql(sql);
    dmmain.CDSexecsql.Open;
    edtusername.Text:=trim(dmmain.CDSexecsql.fieldbyname('employe_name').AsString);
    Handle_Part:=trim(dmmain.CDSexecsql.fieldbyname('part').AsString);
    if trim(edtusername.Text)='' then
    begin
      application.MessageBox(pchar('登陆信息有误！'),pchar(application.Title),mb_iconinformation); 
      User_no.SetFocus;
    end else
    begin
      User_Pwd.SetFocus;
    end;
    dmmain.CDSexecsql.Close;
    except
    end;

  end;
end;

procedure Tfrm_Login.User_NoExit(Sender: TObject);
var
  t:char;
begin
  t:=#13;
  User_NoKeyPress(sender,t);
end;

end.
