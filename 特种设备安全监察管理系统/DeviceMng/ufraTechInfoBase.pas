unit ufraTechInfoBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODB, CSADOQuery, DBCtrls, CSDBNavigator, StdCtrls, Buttons,
  ExtCtrls, dxDBELib;

type
  TfraTechInfoBase = class(TFrame)
    TechInfo: TCSADOQuery;
    TechInfod: TDataSource;
    Panel6: TPanel;
    Panel7: TPanel;
    navTechInfo: TCSDBNavigator;
    ScrollBox1: TScrollBox;
    Temp: TCSADOQuery;
    procedure TechInfoAfterInsert(DataSet: TDataSet);
  private
    Fs_Id, Fs_VerifyId: string;
  protected
    procedure prop_GetTechInfo; virtual;
    procedure prop_GetSafetyPartInfo; virtual;
    procedure prop_LoadTechInfoItems(As_Section: string;
      Ac_DBPickEdit: TdxDBPickEdit);
    function prof_GenerateRecNo(As_TableName: string): Integer;
    property DeviceId: string read Fs_Id;
    property VerifyId: string read Fs_VerifyId;
  public
    procedure pubp_Ini(const As_Id: string;
      const As_VerifyId: string = ''); virtual;
  end;

implementation

{$R *.dfm}

uses
  IniFiles, udmData, CommonLib;

{ TfraTechInfoBase }

procedure TfraTechInfoBase.prop_GetTechInfo;
begin

end;

procedure TfraTechInfoBase.TechInfoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('dev_id').AsString := DeviceId;
end;

procedure TfraTechInfoBase.prop_GetSafetyPartInfo;
begin

end;

function TfraTechInfoBase.prof_GenerateRecNo(As_TableName: string): Integer;
begin
  with Temp do
  begin
    if Active then Close;
    SQL.Text := Format('SELECT MAX(rec_no) AS rec_no FROM %s WHERE ' +
      'dev_id = ''%s''', [As_TableName, DeviceId]);
    Open;
    Result := FieldByName('rec_no').AsInteger + 1;
  end;
end;

procedure TfraTechInfoBase.prop_LoadTechInfoItems(As_Section: string;
  Ac_DBPickEdit: TdxDBPickEdit);
var
  ls_IniFile: string;
  lc_IniFile: TIniFile;
begin
  ls_IniFile := Gs_AppPath + TECHINFO_NAME;
  lc_IniFile := TIniFile.Create(ls_IniFile);
  try
    lc_IniFile.ReadSection(As_Section, Ac_DBPickEdit.Items);
  finally
    lc_IniFile.Free;
  end;
end;

procedure TfraTechInfoBase.pubp_Ini(const As_Id, As_VerifyId: string);
begin
  Fs_Id := As_Id;
  Fs_VerifyId := As_VerifyId;
  prop_GetTechInfo;
end;

end.
