unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, DB, ADODB, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery1: TADOQuery;
    XPManifest1: TXPManifest;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
ID:String;
Pas:String;
begin
  ID:=combobox1.Text;          //帐号
  Pas:=edit1.Text;         //密码;ID,Pas是全局变量


//※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※//
  adoquery1.sql.text:='select pas from 用户 where 用户名称='+''''+trim(combobox1.text)+'''';
  adoquery1.Open;
  begin
    if adoquery1.FieldValues['pas']=Pas then //密码解密,登录成功
    begin
                                        //写入日志
      self.ModalResult:=mrOK;                                //关闭窗口并返回mrOK值
    end
    else begin
      showmessage('用户名或者密码有误！请重新输入！');
      exit;
      edit1.Text:='';
    end;
  end;

//※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※//


  
end;


procedure TForm4.FormCreate(Sender: TObject);
var
  i:integer;
begin
  adoquery1.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';

with adoquery1 do
    begin
     sql.clear;
     sql.add('select 用户名称 from 用户' );
     open;
     first;
     for i:=0 to recordcount-1 do
     begin
       combobox1.Items.Add(fieldbyname('用户名称').asstring);
        next;
      end;
      ;
    end;
 ;
   end;


procedure TForm4.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure TForm4.FormKeyPress(Sender: TObject; var Key: Char);
var
ID:String;
Pas:String;
begin
if key=#13 then
begin
  ID:=combobox1.Text;          //帐号
  Pas:=edit1.Text;         //密码;ID,Pas是全局变量


//※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※//
  adoquery1.sql.text:='select pas from 用户 where 用户名称='+''''+trim(combobox1.text)+'''';
  adoquery1.Open;
  begin
    if adoquery1.FieldValues['pas']=Pas then //密码解密,登录成功
    begin
                                        //写入日志
      Self.ModalResult:=mrOk;                                //关闭窗口并返回mrOK值
    end
    else begin
      showmessage('用户名或者密码有误！请重新输入！');
      exit;
      edit1.Text:='';
    end;
  end;

//※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※//

end;

end;



end.
