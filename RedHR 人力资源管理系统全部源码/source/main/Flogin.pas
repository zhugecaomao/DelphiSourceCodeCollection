unit Flogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TLogin = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    ADOTable1: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    etype:integer;//1.ÐÞ¸Ä 2.µÇÂ¼
  end;

var
  Login: TLogin;

implementation

uses fmain;

{$R *.dfm}

procedure TLogin.Button1Click(Sender: TObject);
begin
  close
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  self.Edit1.SetFocus;
end;

procedure TLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if main.iflogin='N' then main.Close;
end;

procedure TLogin.Button2Click(Sender: TObject);
begin
  if trim(self.Edit1.Text)='' then
    begin
      MessageBox(handle,'µÇÂ¼¿ÚÁî²»ÄÜÎª¿Õ£¡','´íÎó',MB_ICONERROR or MB_OK);
      self.Edit1.SetFocus;
      exit;
    end;
  if self.etype=2 then
    begin
      self.ADOTable1.FieldByName('password').AsString:=self.Edit1.Text;
      self.ADOTable1.Post;
      self.ADOTable1.Close;
      self.ADOTable1.Open;
      MessageBox(handle,'³É¹¦ÐÞ¸Ä¿ÚÁî£¬ÇëÀÎ¼Ç£¡','ÌáÊ¾',MB_ICONINFORMATION or MB_OK);
    end;
  if self.etype=1 then
    begin
      if self.Edit1.Text=self.ADOTable1.FieldByName('password').AsString then
        begin
          main.iflogin:='Y';
        end
        else
        begin
          MessageBox(handle,'¿ÚÁî´íÎó£¡','´íÎó',MB_ICONERROR or MB_OK);
          self.Edit1.SetFocus;
          exit;
        end;
    end;
  self.Close;
end;

end.
