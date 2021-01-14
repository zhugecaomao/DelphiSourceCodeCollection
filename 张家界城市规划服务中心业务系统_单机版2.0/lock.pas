unit lock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, jpeg, ExtCtrls, Buttons, ADODB;

type
  Tlock_frm = class(TForm)
    Label1: TLabel;
    user_Edit: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image2: TImage;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lock_frm: Tlock_frm;
  i:integer;
  
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

procedure Tlock_frm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if lock_frm.ModalResult<>mrOK then
  begin
    if Application.MessageBox('请确认是否退出本系统','提示信息',mb_iconquestion+ mb_YesNo)=id_yes then
       application.Terminate
    else
       canclose:=false;
  end;
end;

procedure Tlock_frm.FormCreate(Sender: TObject);
var
  dbfilename,connstr:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  connstr:='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
  label5.Caption:='此系统已被锁定于：'+datetimetostr(now);
  user_edit.Text:=sfxt.userxm_v;
end;

procedure Tlock_frm.BitBtn1Click(Sender: TObject);
begin
   checkpwd;
   adotable1.Locate('userid',userid_v,[]);
   if (edit2.text<>'') and (trim(adotable1.fieldbyname('mm').asstring)=edit2.text) then
   begin  //密码正确进入
     lock_frm.ModalResult:=mrOK;
     lock_frm.CloseModal;
     //lock_frm.Free;
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

procedure Tlock_frm.BitBtn2Click(Sender: TObject);
begin
     lock_frm.Close;
end;

end.
