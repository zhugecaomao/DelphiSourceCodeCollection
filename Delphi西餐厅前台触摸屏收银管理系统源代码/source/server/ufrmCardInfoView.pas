unit ufrmCardInfoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, DB, ADODB, CSADOQuery, ActnList, ImgList,
  ComCtrls, ToolWin, Grids, ExtCtrls, dxExEdtr, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmCardInfoView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Viewqcard_id: TStringField;
    Viewqcm_id: TStringField;
    Viewqkind_id: TIntegerField;
    Viewqcard_money: TBCDField;
    Viewqcard_state: TIntegerField;
    Viewqemp_id: TStringField;
    Viewqlogin_id: TStringField;
    Viewqcm_name: TStringField;
    Viewqcm_old: TIntegerField;
    Viewqcm_sex: TStringField;
    Viewqcm_address: TStringField;
    Viewqcm_tel: TStringField;
    Viewqcm_mail: TStringField;
    Viewqcm_onlyno: TStringField;
    Viewqcm_date: TStringField;
    Viewqcm_time: TStringField;
    Viewqemp_name: TStringField;
    Viewqkind_name: TStringField;
    grdListcard_id: TdxDBGridMaskColumn;
    grdListcm_id: TdxDBGridMaskColumn;
    grdListkind_id: TdxDBGridMaskColumn;
    grdListkind_name: TdxDBGridMaskColumn;
    grdListcard_money: TdxDBGridCurrencyColumn;
    grdListemp_name: TdxDBGridMaskColumn;
    grdListcm_time: TdxDBGridMaskColumn;
    grdListcm_date: TdxDBGridMaskColumn;
    grdListcm_onlyno: TdxDBGridMaskColumn;
    grdListcm_mail: TdxDBGridMaskColumn;
    grdListcm_tel: TdxDBGridMaskColumn;
    grdListcm_address: TdxDBGridMaskColumn;
    grdListcm_sex: TdxDBGridMaskColumn;
    grdListcm_old: TdxDBGridMaskColumn;
    grdListcm_name: TdxDBGridMaskColumn;
    grdListcard_state: TdxDBGridMaskColumn;
    grdListemp_id: TdxDBGridMaskColumn;
    grdListlogin_id: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atExportExecute(Sender: TObject);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure atConfirmExecute(Sender: TObject);
  private
    Fs_CardId, Fs_CmId, Fs_CmName: String;
  protected
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    property As_CardId: String read Fs_CardId;    
    property As_CmId: String read Fs_CmId;
    property As_CmName: String read Fs_CmName;
  end;

var
  frmCardInfoView: TfrmCardInfoView;

implementation
uses udmData, ufrmBase, ufrmCardInfoModify;
{$R *.dfm}

{ TfrmCardInfoView }

procedure TfrmCardInfoView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'usp_getcardinfo';
    Open;
  end;
end;

procedure TfrmCardInfoView.prop_IniInterFace;
begin
  inherited; 
  WindowState := wsMaximized;
end;

procedure TfrmCardInfoView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Ri_Flag = 1 then
  begin
    inherited;
    frmCardInfoView := nil;
  end;
end;

procedure TfrmCardInfoView.atExportExecute(Sender: TObject);
begin
  inherited;
  if ExportExcel(grdList) then
  begin
    DispInfo('数据导出完成', 2);
  end;
end;

procedure TfrmCardInfoView.atNewExecute(Sender: TObject);
begin
  inherited;
  frmCardInfoModify := TfrmCardInfoModify.Create(nil);
  try
    frmCardInfoModify.pubp_Ini('', 1);
    frmCardInfoModify.ShowModal;
  finally
    FreeAndNil(frmCardInfoModify);
  end;
  prop_IniData;
end;

procedure TfrmCardInfoView.atEditExecute(Sender: TObject);
begin
  inherited;  
  if Viewq.IsEmpty then
  begin
    DispInfo('当前无数据，不能编辑!');
    Exit;
  end;
  frmCardInfoModify := TfrmCardInfoModify.Create(nil);
  try
    frmCardInfoModify.pubp_Ini(Viewq.FieldByName('card_id').AsString, 2);
    frmCardInfoModify.ShowModal;
  finally
    FreeAndNil(frmCardInfoModify);
  end;
  prop_IniData;
end;

procedure TfrmCardInfoView.atDelExecute(Sender: TObject);
begin
  inherited;   
  if Viewq.IsEmpty then
  begin
    DispInfo('当前无数据，不能删除!');
    Exit;
  end;
  frmCardInfoModify := TfrmCardInfoModify.Create(nil);
  try
    frmCardInfoModify.pubp_Ini(Viewq.FieldByName('card_id').AsString, 3);
    frmCardInfoModify.ShowModal;
  finally
    FreeAndNil(frmCardInfoModify);
  end;
  prop_IniData;
end;

procedure TfrmCardInfoView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F1:
    begin
      if Ri_Flag = 2 then Exit;
      atNew.OnExecute(Sender);
    end;
    VK_F2:
    begin       
      if Ri_Flag = 2 then Exit;
      atEdit.OnExecute(Sender);
    end;
    VK_F3:
    begin   
      if Ri_Flag = 2 then Exit;
      atDel.OnExecute(Sender);
    end;
    VK_F4:
    begin
      atFindData.OnExecute(Sender);
    end;
    VK_F11:
    begin
      if Ri_Flag = 1 then Exit;
      atConfirm.OnExecute(Sender);
    end;
    VK_F12:
    begin
      atExit.OnExecute(Sender);
    end;
  end;
end;

procedure TfrmCardInfoView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Fs_CardId := Viewq.FieldByName('card_id').AsString;
  Fs_CmId := Viewq.FieldByName('cm_id').AsString;
  Fs_CmName := Viewq.FieldByName('cm_name').AsString;
end;

procedure TfrmCardInfoView.atConfirmExecute(Sender: TObject);
begin
  inherited;
  if (Viewq.IsEmpty) or (Viewq.FieldByName('card_id').IsNull) then Exit;
  ModalResult := mrOk;
end;

end.
