unit ufrmExtQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, CSQueryPlgModGrp;

type
  TfrmExtQuery = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lbExtQueryList: TListBox;
    bbtnOK: TBitBtn;
    bbtnCancel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOKClick(Sender: TObject);
    procedure lbExtQueryListDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fc_ExtQueryMods: TCSQueryPlgModGrp;
    procedure prip_Execute;
  public
    procedure pubp_Ini;
  end;

var
  frmExtQuery: TfrmExtQuery;

implementation

uses
  udmData, CommonLib;
  
{$R *.dfm}

procedure TfrmExtQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmExtQuery.prip_Execute;
var
  li_ItemIndex, li_Index: Integer;
  lc_Param: TStrings;
begin
  if lbExtQueryList.Count = 0 then Exit;

  li_ItemIndex := lbExtQueryList.ItemIndex;

  if li_ItemIndex < 0 then
  begin
    Application.MessageBox('请在列表中选择一项查询', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    ModalResult := mrNone;
    Exit;
  end;

  li_Index := Integer(lbExtQueryList.Items.Objects[li_ItemIndex]);
  lc_Param := TStringList.Create;
  with Fc_ExtQueryMods do
    try
      lc_Param.AddObject(IntToStr(Points[li_Index]), dmData.adocon);
      lc_Param.AddObject(ExtractFilePath(PlgMods[li_Index].FileName), nil);
      PlgMods[li_Index].MainIntf(lc_Param);
    finally
      lc_Param.Free;
    end;
  
  ModalResult := mrOK;
end;

procedure TfrmExtQuery.pubp_Ini;
var
  li_i, li_j, li_Point, li_Index: Integer;
  ls_Name: string;
begin
  with dmData.PluginMaster do
    for li_i := 0 to Count - 1 do
    begin
      if Modules[li_i].ExtProps.Strings[li_i] <> PLUGIN_EXTQUERY then
        Continue;
      for li_j := 1 to Modules[li_i].ExtProps.Count - 1 do
      begin
        ls_Name := Modules[li_i].ExtProps.Strings[li_j];
        li_Point := Integer(Modules[li_i].ExtProps.Objects[li_j]);
        li_Index := Fc_ExtQueryMods.Add(Modules[li_i], li_Point);
        lbExtQueryList.Items.AddObject(ls_Name, Pointer(li_Index));
      end;
    end;

  lbExtQueryList.ItemIndex := -1;
end;

procedure TfrmExtQuery.bbtnOKClick(Sender: TObject);
begin
  prip_Execute;
end;

procedure TfrmExtQuery.lbExtQueryListDblClick(Sender: TObject);
begin
  prip_Execute;
end;

procedure TfrmExtQuery.FormDestroy(Sender: TObject);
begin
  Fc_ExtQueryMods.Free;
end;

procedure TfrmExtQuery.FormCreate(Sender: TObject);
begin
  Fc_ExtQueryMods := TCSQueryPlgModGrp.Create;
end;

end.
