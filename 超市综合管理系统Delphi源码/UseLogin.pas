unit UseLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, mmsystem;

type
  TLogin_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EPsw: TEdit;
    Button1: TButton;
    Button2: TButton;
    CBUse: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
  i:integer;
    { Private declarations }
  public
  UseName:string;
  UseType:integer;
    { Public declarations }
  end;

var
  Login_Form: TLogin_Form;

implementation

uses Main;

{$R *.dfm}

procedure TLogin_Form.Button1Click(Sender: TObject);
var
 ADOQuery1: TADOQuery;
 sqlstr:string;
begin
ADOQuery1:= TADOQuery.Create(self);
ADOQuery1.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+extractfilepath(application.exename)+'\date\super.mdb;Persist Security Info=False';
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('select * from use_t');
ADOQuery1.Open;
with adoquery1 do
   begin
    close;
    sql.clear;
    sqlstr:='select * from use_t where 1=1';
    if ((CBUse.text<>'')and (EPsw.text<>'')) then
      begin
       sqlstr:=sqlstr+'and use_name='''+CBUse.text+'''';
       sqlstr:=sqlstr+'and use_psw='''+EPsw.text+'''';
       sql.add(sqlstr);
       prepared;
       open;
       if recordcount<>0 then
         begin
         UseName:=Fields.fields[1].asstring;
         UseType:=Fields.fields[3].asinteger;
         sndplaysound(pchar(GetCurrentDir+'\sound\login.wav'),snd_async);
         freeandnil(adoquery1);
         Login_Form.close;
        end
       else
       begin
        showmessage('密码或用户名不正确');
        i:=i+1;
        if i=3 then
        begin
        showmessage('你是非法用户，请不要盗用别人的软件');
        application.terminate;
        end;
       end;
      end
    else
      begin
      if CBUse.text='' then
         showmessage('用户名不能为空');
      if EPsw.text=''then
        showmessage('密码不能为空');
      end;
    end;

end;

procedure TLogin_Form.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TLogin_Form.FormActivate(Sender: TObject);
var
adoquery2:tadoquery;
begin
i:=0;
ADOQuery2:= TADOQuery.Create(self);
ADOQuery2.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+extractfilepath(application.exename)+'\date\super.mdb;Persist Security Info=False';
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Add('select * from use_t');
ADOQuery2.Open;
  with adoquery2 do
    begin
    if not active then
    open;
    first;
      while not Eof do
      begin
        CBUse.Items.add(Fields.fields[1].asstring);
        next;
       end;
     end;
    CBUse.ItemIndex := 0;
    freeandnil(adoquery2);
end;

end.
