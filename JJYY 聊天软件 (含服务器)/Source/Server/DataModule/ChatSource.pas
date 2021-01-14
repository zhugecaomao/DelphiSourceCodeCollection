unit ChatSource;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB;

type
  TChat = class(TDataModule)
    Con: TADOConnection;
    UpUser: TADOQuery;
    InsUser: TADOQuery;
    qryUser: TADOQuery;
    qryTemp: TADOQuery;
    qryTempHandle: TIntegerField;
    qryTempUserName: TStringField;
    qryTempHost: TStringField;
    qryTempAddress: TStringField;
    Temp: TADOQuery;
    qryTempID: TStringField;
    UpTemp: TADOQuery;
    qryUserInfo: TADOQuery;
    qryUserInfoID: TStringField;
    qryUserInfoUserName: TStringField;
    qryUserInfoHost: TStringField;
    qryUserInfoAddress: TStringField;
    qryUserInfoImageIndex: TIntegerField;
    qryUserInfoRemark: TMemoField;
    qryOffUser: TADOQuery;
    qryTempLogined: TSmallintField;
    qryTempSex: TSmallintField;
    qryUserInfoSex: TIntegerField;
    qryUserID: TWideStringField;
    qryUserUserName: TWideStringField;
    qryUserSex: TIntegerField;
    qryUserHost: TWideStringField;
    qryUserAddress: TWideStringField;
    qryUserImageIndex: TIntegerField;
    qryUserRemark: TMemoField;
    qryUserLogined: TIntegerField;
    qryUserHandle: TIntegerField;
    RealTemp: TADOQuery;
    qryUserDeleted: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Chat: TChat;

implementation

uses Unit1;

{$R *.DFM}

procedure TChat.DataModuleCreate(Sender: TObject);
begin
  con.ConnectionString:=
    'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
    'Data Source='+'.\DB\UserInfo.mdb;'+
    'Mode=ReadWrite;Extended Properties="";Persist Security Info=False;'+
    'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";'+
    'Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;'+
    'Jet OLEDB:Database Locking Mode=1;'+
    'Jet OLEDB:Global Partial Bulk Ops=2;'+
    'Jet OLEDB:Global Bulk Transactions=1;'+
    'Jet OLEDB:New Database Password="";'+
    'Jet OLEDB:Create System Database=False;'+
    'Jet OLEDB:Encrypt Database=False;'+
    'Jet OLEDB:Don''t Copy Locale on Compact=False;'+
    'Jet OLEDB:Compact Without Replica Repair=False;'+
    'Jet OLEDB:SFP=False'
end;

procedure TChat.ConAfterConnect(Sender: TObject);
var
  i:integer;
begin
  i:=0;

  RealTemp.SQL.Text :='Update UserInfo set Logined=0';
  RealTemp.ExecSQL; 

  form1.UserList.Clear;  
  qryUser.Parameters.ParamByName('a').Value:=0;
  qryUser.Parameters.ParamByName('b').Value:=0;
  qryUser.Parameters.ParamByName('c').Value:=0;
  qryUser.Parameters.ParamByName('ID').Value:='1';
  qryUser.Parameters.ParamByName('PasswordA').Value:='1';
  qryUser.Open ;
  qryUser.Requery([]);
  if not qryUser.IsEmpty then
  begin
    setlength(form1.UserRemark,qryUser.RecordCount);
    while not qryUser.Eof do
    begin
      form1.UserList.Add(qryUserID.AsString+';'+
                         qryUserUserName.AsString+';'+
                         qryUserHost.AsString+';'+
                         qryUserAddress.AsString+';'+
                         qryUserImageIndex.AsString+';'+
                         qryUserSex.AsString+';'+
                         qryUserHandle.AsString );
      form1.UserRemark[i]:=qryUserRemark.AsString;
      inc(i);
      qryUser.next;
    end;
  end;
end;

end.
