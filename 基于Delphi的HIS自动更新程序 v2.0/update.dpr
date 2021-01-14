program update;

uses
  Forms,
  U_main in 'U_main.pas' {Frmain},
  uftpdown in 'uftpdown.pas';

{$R *.res}


var i:integer;
begin
for i:=1 to ParamCount-2  do begin;
nowshell:=nowshell+ParamStr(i)+' ' ;
end;
subsoft:=ParamStr(10);

begin
  Application.Initialize;
  Application.Title := 'hisupdate';
  Application.CreateForm(TFrmain, Frmain);
  Application.Run;
  end;
end.
