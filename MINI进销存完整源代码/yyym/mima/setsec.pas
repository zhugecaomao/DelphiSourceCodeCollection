unit setsec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,md5;

type
  TSetsecForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetsecForm: TSetsecForm;

implementation

{$R *.dfm}

procedure TSetsecForm.Button1Click(Sender: TObject);
var  charArrMd5  : Array[0..100] of char;
  pwd:string;
  XYZ: File;
  NumWritten:integer;

  PwdArr: Array[0..100] of char;
      ddt:file;
      NumRead:integer;
      pwdtxt:string;
begin
        AssignFile(ddt,GetCurrentDir+'\'+'XYZ.ttf');
                 reset(ddt,1);
          repeat
             BlockRead(ddt,PwdArr,sizeof(PwdArr),NumRead);
          until eof(ddt);
         CloseFile(ddt);
         pwdtxt:=PwdArr;
        
    if  Pwdtxt<> md5.RivestStr(Edit1.Text) then
       begin
          ShowMessage('密码不正确，请重试！') ;
          Edit1.Text:='';
       end
    else
       begin

          if Edit2.Text<>Edit3.Text then
             begin
               Edit2.Text:='';
               Edit3.Text:='';
               showMessage('两次密码不同，请重试！')
             end
          Else
              begin
                pwd:=Edit3.text;
                strCopy(charArrMd5,Pchar(md5.RivestStr(pwd)));

                AssignFile(XYZ,GetCurrentDir+'\'+'XYZ.ttf');
                Rewrite(XYZ,1);
                  repeat
                    BlockWrite(XYZ, CharArrMd5, sizeof(CharArrmd5), NumWritten);
                  until eof(XYZ);
                CloseFile(XYZ);
                 showmessage('密码设置成功！');
              end;
       end;
end;

procedure TSetsecForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TSetsecForm.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
