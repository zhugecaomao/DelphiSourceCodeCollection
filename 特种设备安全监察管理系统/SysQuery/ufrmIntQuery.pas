unit ufrmIntQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, CSQueryPlgModGrp;

type
  TfrmIntQuery = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lbIntQueryList: TListBox;
    bbtnOK: TBitBtn;
    bbtnCancel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOKClick(Sender: TObject);
    procedure lbIntQueryListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Fc_IntQueryMods: TCSQueryPlgModGrp;
    procedure prip_Execute(const Ai_CallMode: Integer = 0;
      Ac_CallArgs: TStrings = nil);
  public
    procedure pubp_Ini(Ac_Param: TStrings = nil);
  end;

var
  frmIntQuery: TfrmIntQuery;

implementation

uses
  udmData, CommonLib, ufrmOrganMng;
  
{$R *.dfm}

const
  CBCW_ORGANINFO = $0001;

procedure Gp_PlgCallBack(const Ai_CallWhich: Integer; Ac_Args: TStrings);
var
  lc_Form: TForm;
begin
  //TODO: To be completed
  case Ai_CallWhich of
    CBCW_ORGANINFO:
      begin
        lc_Form := TfrmOrganMng.Create(nil);
        with lc_Form as TfrmOrganMng do
          try
            pubp_Ini(StrToBool(Ac_Args.Strings[0]),
              TStrings(Ac_Args.Objects[0]));
            ShowModal;
          finally
            Free;
          end;
      end; 
  end;
end;

procedure TfrmIntQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmIntQuery.prip_Execute(const Ai_CallMode: Integer;
  Ac_CallArgs: TStrings);
var
  li_ItemIndex, li_Index: Integer;
  lc_Param: TStrings;
begin
  if lbIntQueryList.Count = 0 then Exit;

  li_ItemIndex := lbIntQueryList.ItemIndex;

  if li_ItemIndex < 0 then
  begin
    Application.MessageBox('请在列表中选择一项查询', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    ModalResult := mrNone;
    Exit;
  end;

  li_Index := Integer(lbIntQueryList.Items.Objects[li_ItemIndex]);
  lc_Param := TStringList.Create;
  with Fc_IntQueryMods do
    try
      lc_Param.AddObject(IntToStr(Points[li_Index]), dmData.adocon);
      lc_Param.AddObject(ExtractFilePath(PlgMods[li_Index].FileName),
        Addr(Gp_PlgCallBack));
      lc_Param.AddObject(IntToStr(Ai_CallMode), Ac_CallArgs);
      PlgMods[li_Index].MainIntf(lc_Param);
    finally
      lc_Param.Free;
    end;

  ModalResult := mrOK;
end;

procedure TfrmIntQuery.pubp_Ini(Ac_Param: TStrings);
var
  li_i, li_j, li_Point, li_Index: Integer;
  ls_Name: string;
begin
  with dmData.PluginMaster do
    for li_i := 0 to Count - 1 do
    begin
      if Modules[li_i].ExtProps.Strings[li_i] <> PLUGIN_INTQUERY then
        Continue;
      for li_j := 1 to Modules[li_i].ExtProps.Count - 1 do
      begin
        ls_Name := Modules[li_i].ExtProps.Strings[li_j];
        li_Point := Integer(Modules[li_i].ExtProps.Objects[li_j]);
        li_Index := Fc_IntQueryMods.Add(Modules[li_i], li_Point);
        lbIntQueryList.Items.AddObject(ls_Name, Pointer(li_Index));
      end;
    end;

  if Ac_Param = nil then lbIntQueryList.ItemIndex := -1
  else begin
    li_Index := lbIntQueryList.Items.IndexOf(Ac_Param.Strings[0]);
    if li_Index >= 0 then
    begin
      lbIntQueryList.ItemIndex := li_Index;
      prip_Execute(StrToInt(Ac_Param.Strings[1]),
        TStrings(Ac_Param.Objects[1]));
    end;
  end;
end;

procedure TfrmIntQuery.bbtnOKClick(Sender: TObject);
begin
  prip_Execute;
end;

procedure TfrmIntQuery.lbIntQueryListDblClick(Sender: TObject);
begin
  prip_Execute;
end;

procedure TfrmIntQuery.FormCreate(Sender: TObject);
begin
  Fc_IntQueryMods := TCSQueryPlgModGrp.Create;
end;

procedure TfrmIntQuery.FormDestroy(Sender: TObject);
begin
  Fc_IntQueryMods.Free;
end;

end.
