unit login_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, jpeg, ExtCtrls, Buttons, ADODB;

type
  Tlogin = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image2: TImage;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label4: TLabel;
    Image1: TImage;
    ADOConnection1: TADOConnection;
    Label5: TLabel;
    Label6: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  login: Tlogin;
  userxm_v,userid_v:string;
  i:integer;

Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';
  
implementation

uses sfxt;


{$R *.dfm}

procedure checkpwd;
begin
   if i>=3 then
   begin
     messagedlg('对不起，您输入超过三次！',mtWarning,[mbok],0);
     application.Terminate;
   end;
end;

procedure Tlogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then edit2.SetFocus;
end;

procedure Tlogin.Edit1Exit(Sender: TObject);
begin
   checkpwd;
   if (edit1.text<>'') and adotable1.Locate('userid',edit1.Text,[]) then
   begin
      sfxt.userxm_v:=adotable1.fieldvalues['yhm'];  //取用户名
      //userxm_v:=adotable1.fieldvalues['yhm'];  //取用户名
      label3.Caption:=adotable1.FieldValues['yhm'];
   end
   else
   begin
     if edit1.text<>'' then
     begin
        i:=i+1;
        messagedlg('用户名错误，请重新输入！',mtWarning,[mbok],0);
        //edit1.SetFocus;
     end;
   end;
end;

procedure Tlogin.BitBtn1Click(Sender: TObject);
begin
   checkpwd;
   adotable1.Locate('userid',edit1.Text,[]);
   if (edit2.text<>'') and (trim(adotable1.fieldbyname('mm').asstring)=edit2.text) then
   begin  //密码正确进入
     sfxt.userid_v:=adotable1.FieldByName('userid').AsString;
     //userid_v:=adotable1.FieldByName('userid').AsString;
     login.ModalResult:=mrok;  //判断退出时的状态信息
     login.CloseModal;
     login.free;
     application.CreateForm(tfrm_main,frm_main);
     application.Run;
   end
   else
   begin
     if edit2.text<>'' then
     begin
        i:=i+1;
        messagedlg('密码错误，请重新输入！',mtWarning,[mbok],0);
     end;
   end;
end;

procedure Tlogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then BitBtn1Click(Sender);
end;

procedure Tlogin.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
end;

procedure Tlogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if self.ModalResult<>mrok then
  begin
    if Application.MessageBox('请确认是否退出本系统','提示信息',mb_iconquestion+ mb_YesNo)=id_yes then
       application.Terminate
    else
       canclose:=false;
  end;
end;

procedure Tlogin.BitBtn2Click(Sender: TObject);
begin
     self.Close;
end;

end.
