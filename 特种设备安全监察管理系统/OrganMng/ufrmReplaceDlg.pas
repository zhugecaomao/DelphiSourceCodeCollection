unit ufrmReplaceDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, dxmdaset, Mask, DBCtrlsEh,
  ufrmOrganMng;

type
  TfrmReplaceDlg = class(TForm)
    Panel11: TPanel;
    bbtnConfirm: TBitBtn;
    bbtnCancel: TBitBtn;
    memSrc: TdxMemData;
    memSrcsysid: TStringField;
    memSrcname: TStringField;
    memDest: TdxMemData;
    memDestsysid: TStringField;
    memDestname: TStringField;
    memSrcd: TDataSource;
    memDestd: TDataSource;
    bbtnClose: TBitBtn;
    StaticText1: TStaticText;
    rdgSelected: TRadioGroup;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
  private
    Fc_Requestor: TfrmOrganMng;
    procedure prip_Confirm;
    procedure prip_Cancel;
  public
    procedure pubp_Ini(Ac_Requestor: TfrmOrganMng);
  end;

var
  frmReplaceDlg: TfrmReplaceDlg;

implementation

uses
  udmData, CommonLib;

{$R *.dfm}

procedure TfrmReplaceDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmReplaceDlg := nil;
end;

procedure TfrmReplaceDlg.bbtnCancelClick(Sender: TObject);
begin
  prip_Cancel;
end;

procedure TfrmReplaceDlg.pubp_Ini(Ac_Requestor: TfrmOrganMng);
begin
  Fc_Requestor := Ac_Requestor;
  Show;
end;

procedure TfrmReplaceDlg.FormCreate(Sender: TObject);
begin
  Fc_Requestor := nil;
end;

procedure TfrmReplaceDlg.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReplaceDlg.prip_Cancel;
begin
  with memSrc do
  begin
    Close;
    Open;
  end;
  with memDest do
  begin
    Close;
    Open;
  end;
  rdgSelected.ItemIndex := 0;
end;

procedure TfrmReplaceDlg.prip_Confirm;
var
  ls_SrcId, ls_DestId{, ls_SQL}: string;
  //lc_BeforeDelete: TDataSetNotifyEvent;
begin
  ls_SrcId := VarToStr(memSrc.FieldValues['sysid']);
  ls_DestId := VarToStr(memDest.FieldValues['sysid']);

  if ls_SrcId = '' then
  begin
    MessageBox(Self.Handle, '请选择将被替换的单位', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if ls_DestId = '' then
  begin
    MessageBox(Self.Handle, '请选择替换成哪个单位', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  
  if MessageBox(Self.Handle, '您确定要替换吗?', PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDCANCEL then Exit;

  //TODO: To be completed
  {
  ls_SQL := Format('device.usp_replacecominfo ''%s'', ''%s'', ''%s'', ' +
    '''%s'', ''%s''', [ls_SrcId, ls_DestId, Fc_Requestor.FieldName,
    Fc_Requestor.ComTable, Fc_Requestor.ComName]);

  Gp_ProgressHint('正在执行单位替换，请稍候...');
  dmData.adocon.BeginTrans;
  try
    dmData.adocon.Execute(ls_SQL);

    with Fc_Requestor.ComInfo do
    begin
      lc_BeforeDelete := BeforeDelete;
      BeforeDelete := nil;
      try
        if Locate('id', ls_SrcId, [loCaseInsensitive]) then Delete
        else raise Exception.Create('记录定位失败');
      finally
        BeforeDelete := lc_BeforeDelete;
      end;
    end;

    dmData.adocon.CommitTrans;
    Gp_ProgressHint;
    Close;
  except
    on E: Exception do
    begin
      dmData.adocon.RollbackTrans;
      Gp_ProgressHint;
      MessageBox(Self.Handle, PChar('执行单位替换时出错，错误原因：' +
        E.Message), PChar(Caption), MB_OK + MB_ICONERROR);
    end;
  end;
  }
end;

procedure TfrmReplaceDlg.bbtnConfirmClick(Sender: TObject);
begin
  prip_Confirm;
end;

initialization
frmReplaceDlg := nil;

end.
