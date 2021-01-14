program link;

uses
  Forms,
  Classes,
  SysUtils,
  Dialogs,
  Windows,
  main in 'main.pas' {Form1},
  about in 'about.pas' {AboutBox},
  Scores in 'Scores.pas' {fmScores},
  Regest in 'Regest.pas',
  Reg in 'Reg.pas' {fmReg};

{$R *.res}
var
  FileName: TFileStream;
begin
  Application.Initialize;
  FileName := TFileStream.Create(Application.ExeName,fmShareDenyNone);
  CreateMutex(nil,True,Pchar('Link'));
  //showmessage(ParamStr(2));
  //showmessage(ParamStr(3));
  //showmessage(ParamStr(4));
  //showmessage(ParamStr(5));
  try
    GetRegInfo(FRegInfo,FDecKey,FileName);
    //showmessage(inttostr(FRegInfo.RunData));
    //FileName.Seek(-sizeof(TRegInfo),soEnd);
    //FileName.Read(RegInfo,sizeof(TRegInfo));
    if (ParamStr(1) <> FRegInfo.RunPar) or (ParamStr(1) = '') then
    begin
      //showmessage(RegInfo.RunPar);
      Application.Terminate;
      exit;
    end;
  except
    Application.Terminate;
    exit;
  end;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfmReg, fmReg);
  Application.Run;
end.
