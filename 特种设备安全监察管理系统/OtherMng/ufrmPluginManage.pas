unit ufrmPluginManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CSBarMDIChild, ExtCtrls, StdCtrls, Buttons, CSPrgViewer, CSBplPlugin;

const
  CM_UNLOADPLUGIN = WM_USER + 500;
  
type
  TfrmPluginManage = class(TForm)
    CSBarMDIChild1: TCSBarMDIChild;
    lbPlugins: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    bbtnLoad: TBitBtn;
    bbtnUnLoad: TBitBtn;
    Splitter1: TSplitter;
    mDescription: TMemo;
    opPlugins: TOpenDialog;
    PrgViewer: TCSPrgViewer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbPluginsClick(Sender: TObject);
    procedure bbtnLoadClick(Sender: TObject);
    procedure bbtnUnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
  private
    Fc_AfterLoad: TCSBplPluginAfterLoad;
    procedure prip_ShowDescription;
    procedure prip_LoadPlugins;
    procedure prip_UnLoadPlugins;
    procedure prip_AfterLoad(As_FileName: String; const Ai_ModuleIndex: Integer;
      var Ab_StopLoadAll: Boolean);
    procedure CMUnLoadPlugin(var Msg: TMessage); message CM_UNLOADPLUGIN;
  public
    procedure pubp_Ini;
  end;

var
  frmPluginManage: TfrmPluginManage;

implementation

uses
  CSVCLUtils, udmData, CommonLib;

{$R *.dfm}

{ TfrmPluginManage }

procedure TfrmPluginManage.prip_LoadPlugins;
var
  lb_MustMatchExt: Boolean;
  li_i: Integer;  
begin
  with opPlugins, dmData.PluginMaster do
  begin
    if not Execute then Exit;

    lb_MustMatchExt := MustMatchExt;
    MustMatchExt := False;
    Fc_AfterLoad := AfterLoad;
    AfterLoad := prip_AfterLoad;
    PrgViewer.Start('开始载入...');
    try
      for li_i := 0 to Files.Count - 1 do LoadPlugin(Files.Strings[li_i]);
    finally
      AfterLoad := Fc_AfterLoad;
      MustMatchExt := lb_MustMatchExt;
      PrgViewer.Finish;
    end;
  end;
end;

procedure TfrmPluginManage.prip_ShowDescription;
var
  li_Index: Integer;
  lc_Plugin: TCSBplPluginModule;
begin
  li_Index := lbPlugins.ItemIndex;
  if li_Index < 0 then Exit;

  lc_Plugin := TCSBplPluginModule(lbPlugins.Items.Objects[li_Index]);
  mDescription.Clear;
  with mDescription.Lines do
  begin
    Add('名称：' + lc_Plugin.Name);
    Add('版本：' + lc_Plugin.Version);
    Add('作者：' + lc_Plugin.Author);
    Add('版权：' + lc_Plugin.Copyright);
    Add('说明：' + lc_Plugin.Comment);
    Add('文件：' + lc_Plugin.FileName);
  end;
end;

procedure TfrmPluginManage.prip_UnLoadPlugins;
var
  li_i, li_j: Integer;
  lc_Plugin: TCSBplPluginModule;
  lc_MDIChild: TForm;
  lc_MDIChilds: TStrings;

  function IdentifierMatch(const As_Id, As_Name: string): Boolean;
  var
    li_Pos: Integer;
  begin
    Result := False;
    
    li_Pos := Pos('_', As_Name);
    if li_Pos <= 0 then Exit;

    Result := Copy(As_Name, 1, li_Pos - 1) = As_Id;
  end;
  
begin
  lc_MDIChilds := TStringList.Create;
  try
    for li_i := 0 to lbPlugins.Count - 1 do
    begin
      if not lbPlugins.Selected[li_i] then Continue;

      lc_MDIChilds.Clear;
      lc_Plugin := TCSBplPluginModule(lbPlugins.Items.Objects[li_i]);
      for li_j := 0 to Application.MainForm.MDIChildCount - 1 do
      begin
        lc_MDIChild := Application.MainForm.MDIChildren[li_j];
        if IdentifierMatch(lc_Plugin.Identifier, lc_MDIChild.Name) then
          lc_MDIChilds.AddObject(lc_MDIChild.Name, lc_MDIChild);
      end;
      for li_j := 0 to lc_MDIChilds.Count - 1 do
        TForm(lc_MDIChilds.Objects[li_j]).Close;

      PostMessage(Handle, CM_UNLOADPLUGIN,
        dmData.PluginMaster.IndexOf(lc_Plugin.Identifier), 0);
    end;
  finally
    lc_MDIChilds.Free;
    lbPlugins.DeleteSelected;
    mDescription.Clear;
  end;
end;

procedure TfrmPluginManage.pubp_Ini;
var
  li_i: Integer;
begin
  with dmData.PluginMaster do
  begin
    opPlugins.InitialDir := PluginPath;

    for li_i := 0 to Count - 1 do
      lbPlugins.Items.AddObject(Modules[li_i].Name, Modules[li_i]);

    lbPlugins.ItemIndex := -1;
  end;

  FormStyle := fsMDIChild;
  ClientTile(Self);
end;

procedure TfrmPluginManage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPluginManage := nil;
  Action := caFree;
end;

procedure TfrmPluginManage.CMUnLoadPlugin(var Msg: TMessage);
begin
  with dmData.PluginMaster do
  begin
    Gp_ProgressHint('卸载插件：' + Modules[Msg.WParam].Name);
    try
      SendMessage(Application.MainForm.Handle, CM_MFUNLOADPLUGIN,
        MSGWP_MFUNLOADPLUGIN, Msg.WParam);
      UnloadPlugin(Msg.WParam);
    finally
      Gp_ProgressHint;
    end;
  end;
end;

procedure TfrmPluginManage.lbPluginsClick(Sender: TObject);
begin
  prip_ShowDescription;
end;

procedure TfrmPluginManage.bbtnLoadClick(Sender: TObject);
begin
  prip_LoadPlugins;
end;

procedure TfrmPluginManage.bbtnUnLoadClick(Sender: TObject);
begin
  prip_UnLoadPlugins;
end;

procedure TfrmPluginManage.prip_AfterLoad(As_FileName: String;
  const Ai_ModuleIndex: Integer; var Ab_StopLoadAll: Boolean);
begin
  with dmData.PluginMaster do
  begin
    PrgViewer.MainText := '已载入插件：' + Modules[Ai_ModuleIndex].Name;
    if Assigned(Fc_AfterLoad) then
      Fc_AfterLoad(As_FileName, Ai_ModuleIndex, Ab_StopLoadAll);
    lbPlugins.Items.AddObject(Modules[Ai_ModuleIndex].Name,
      Modules[Ai_ModuleIndex]);
    SendMessage(Application.MainForm.Handle, CM_MFLOADPLUGIN,
      MSGWP_MFLOADPLUGIN, Ai_ModuleIndex);
  end;
end;

procedure TfrmPluginManage.FormCreate(Sender: TObject);
begin
  Fc_AfterLoad := nil;
end;

procedure TfrmPluginManage.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
