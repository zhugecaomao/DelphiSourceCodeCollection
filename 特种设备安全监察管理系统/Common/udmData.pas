{
  主程序的数据连接模块
}
unit udmData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODB, CSADOQuery, CSScrCtrlMaster, dxCntner, CSBplPlugin;

type
  TdmData = class(TDataModule)
    adocon: TADOConnection;
    ScrMaster: TCSScrCtrlMaster;
    dxStyleCtrl: TdxEditStyleController;
    PluginMaster: TCSBplPluginMaster;
    procedure ScrMasterAfterLogon(Sender: TObject;
      var Ab_LogonSucceeded: Boolean; var As_UserId: string);
  private
    { Private declarations }
  public
    function pubf_GetConnPwd: string;
    function pubf_Connect: Boolean;
  end;

var
  dmData: TdmData;

implementation

uses
  Variants, IniFiles, CommonLib;

{$R *.DFM}

{ Tfrm_data }

function TdmData.pubf_Connect: Boolean;
var
  ls_ConStr: string;
  lc_DatFile: TIniFile;
begin
  if not FileExists(Gs_AppPath + 'connset.dat') then
  begin
    Result := False;
    Application.MessageBox('数据库连接配置文件丢失', PChar(Application.Title),
      MB_OK + MB_ICONERROR);
    Exit;
  end;

  lc_DatFile := TIniFile.Create(Gs_AppPath + 'connset.dat');
  with lc_DatFile do
  begin
    Gs_DBMS := Readstring('SETUP', 'DBMS', '');
    Gs_DBDRV := Readstring('SETUP', 'DBDRV', '');
    ls_ConStr := Readstring('SETUP', 'CONSTR', '');
    Free;
  end;
  if (Gs_DBMS = '') or (Gs_DBDRV = '') or (ls_ConStr = '') then
  begin
    Result := False;
    Application.MessageBox('数据库连接配置文件损坏', PChar(Application.Title),
      MB_OK + MB_ICONERROR);
    Exit;
  end;

  ls_ConStr := stringReplace(ls_ConStr, '%PWD%', pubf_GetConnPwd,
    [rfReplaceAll, rfIgnoreCase]);
  try
    with adocon do
    begin
      if Connected then Close;
      Connectionstring := ls_ConStr;
      Open;
      Result := Connected;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(E.Message), PChar(Application.Title),
        MB_OK + MB_ICONERROR);
    end;
  end;
end;

function TdmData.pubf_GetConnPwd: string;
begin
  //TODO: Here to be bind with rockey
  Result := 'device';
end;

procedure TdmData.ScrMasterAfterLogon(Sender: TObject;
  var Ab_LogonSucceeded: Boolean; var As_UserId: string);
begin
  with adocon do
    try
      Close;
      //TODO: To add more codes acting with more kinds of DBMS here
      Connectionstring := Connectionstring + ';Application Name=' +
        TCSScrCtrlMaster(Sender).AppID + '.' + As_UserId;
      Open;
    except
      on E: Exception do
      begin
        Ab_LogonSucceeded := False;
        Application.MessageBox(PChar(E.Message), PChar(Application.Title),
          MB_OK + MB_ICONERROR);
      end;
    end;
end;

end.
