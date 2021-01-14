unit SysDM;

interface

uses
  Windows, SysUtils, Classes, Forms, Dialogs, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Global;

type

{ TSysDataModule }

  TSysDataModule = class(TDataModule)
    IdHTTP: TIdHTTP;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function ParseParams: Boolean;
    procedure ProcessSelfUpgrade;
  end;

var
  SysDataModule: TSysDataModule;

function GetUpgradeFilePath: string;
function GetLocalScriptFileName: string;
  
implementation

uses MainFrm, PubUtils, ScriptParser;

{ Misc }

function GetUpgradeFilePath: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'Upgrade\';
end;

function GetLocalScriptFileName: string;
begin
  Result := GetUpgradeFilePath + 'Script.aus';
end;

{$R *.dfm}

procedure TSysDataModule.DataModuleCreate(Sender: TObject);
var
  ParamsIsOk: Boolean;
begin
  ParamsIsOk := ParseParams;
  
  Application.Title := SSoftName;
  if Length(CmdParams.SoftName) > 0 then
    Application.Title := Format('%s - %s', [SSoftName, CmdParams.SoftName]);

  if ParamsIsOk then
    Application.CreateForm(TMainForm, MainForm)
  else
    MsgBox('此程序必须由其它程序调用执行。');
end;

procedure TSysDataModule.DataModuleDestroy(Sender: TObject);
begin
  ProcessSelfUpgrade;
end;

//-----------------------------------------------------------------------------
// 描述: 解析命令行参数
//-----------------------------------------------------------------------------
function TSysDataModule.ParseParams: Boolean;
begin
  Result := (ParamCount = 6);
  if Result then
  begin
    CmdParams.ScriptURL := ParamStr(1);
    CmdParams.CurVersion := ParamStr(2);
    CmdParams.SoftName := ParamStr(3);
    CmdParams.WinHandle := StrToIntDef(ParamStr(4), 0);
    CmdParams.ExitMsgID := StrToIntDef(ParamStr(5), 0);
    CmdParams.ProcessID := StrToIntDef(ParamStr(6), 0);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: 处理自升级
//-----------------------------------------------------------------------------
procedure TSysDataModule.ProcessSelfUpgrade;

  procedure MakeBatFile(const FileName: string);
  var
    BatFileText: TStringList;
  begin
    BatFileText := TStringList.Create;
    try
      // %1 - source filename
      // %2 - dest filename
      // %3 - bat filename
      BatFileText.Add('@echo off');
      BatFileText.Add(':loop');
      BatFileText.Add('del %2');
      BatFileText.Add('if exist %2 goto loop');
      BatFileText.Add(':endloop');
      BatFileText.Add('copy %1 %2');
      BatFileText.Add('del %1');
      BatFileText.Add('del %3');

      BatFileText.SaveToFile(FileName);
    finally
      BatFileText.Free;
    end;
  end;

var
  BatFileName, Cmd: string;
begin
  if FileExists(SelfUpgFiles.DestFileName) then
  begin
    BatFileName := GetAppSubPath + 'aucopy.bat';
    MakeBatFile(BatFileName);

    Cmd := Format('%s "%s" "%s" "%s"', [
      BatFileName,
      SelfUpgFiles.SrcFileName,
      SelfUpgFiles.DestFileName,
      BatFileName
      ]);

    WinExec(PChar(Cmd), SW_SHOWNORMAL);
  end;
end;

end.
