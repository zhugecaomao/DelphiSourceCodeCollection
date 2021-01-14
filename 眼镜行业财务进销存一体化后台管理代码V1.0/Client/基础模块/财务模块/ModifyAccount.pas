unit ModifyAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient;

type
  TModifyAccountFm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ModifyExeCuter: TClientDataSet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    szAccountType,szParid,szComment:string;
    szAccountId,szAccountName,szUserCode:string;
  public
    { Public declarations }
  end;

var
  ModifyAccountFm: TModifyAccountFm;
  procedure ModifyShow(parid,AccountId,AccountName,UserCode,comment:string);
implementation

uses  untdatadm, func;

{$R *.dfm}

procedure ModifyShow(parid,AccountId,AccountName,UserCode,comment:string);
begin
  ModifyAccountFm:=TModifyAccountFm.Create(nil);
  ModifyAccountFm.szAccountId:=   AccountId;
  ModifyAccountFm.szAccountName:= AccountName;
  ModifyAccountFm.szParid     :=parid;
  ModifyAccountFm.szcomment   :=comment;
  ModifyAccountFm.szUserCode  :=usercode;
  if parid='0000100004' then  ModifyAccountFm.szAccountType:='1';
  try
    ModifyAccountFm.ShowModal;
  finally
    ModifyAccountFm.free;
  end;
end;

procedure TModifyAccountFm.SpeedButton1Click(Sender: TObject);
var sql:widestring;
begin
  if szAccountId='' then
   begin
      sql := 'exec InsertAccountTable '''+szParid+''','''+edit1.text+''','''+edit2.text+''','''+edit3.text+'''';
   end
   else
   begin
      sql := 'Update AccountTable set UserCode='''+edit1.text+''',AccountName='''+edit2.text+''',Comment='''+Edit3.Text+''' where Accountid='''+szAccountId+'''';
   end;
  //ModifyExeCuter.Close;
  //ModifyExeCuter.Params.Clear;
 // ModifyExeCuter.CommandText:=sql;
  //ModifyExeCuter.Execute;
   try
     adisp.updatesql(sql);
     close;
   except
     application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
     exit;
   end
end;

procedure TModifyAccountFm.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TModifyAccountFm.FormShow(Sender: TObject);
begin
    edit1.Text:= szUserCode;
    edit2.text:= szAccountName;
    edit3.text:= szComment;
end;

end.
