unit ufrmCMView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, DB, ADODB, CSADOQuery, ActnList, ImgList,
  ComCtrls, ToolWin, Grids, ExtCtrls, dxExEdtr, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmCMView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Viewqcm_id: TStringField;
    Viewqcm_name: TStringField;
    Viewqcm_old: TIntegerField;
    Viewqcm_sex: TStringField;
    Viewqcm_address: TStringField;
    Viewqcm_tel: TStringField;
    Viewqcm_mail: TStringField;
    Viewqcm_onlyno: TStringField;
    Viewqcm_date: TStringField;
    Viewqcm_time: TStringField;
    Viewqlast_time: TDateTimeField;
    Viewqlogin_id: TStringField; 
    Viewqcm_birthday: TStringField;
    grdListcm_id: TdxDBGridMaskColumn;
    grdListcm_name: TdxDBGridMaskColumn;
    grdListcm_old: TdxDBGridMaskColumn;
    grdListcm_birthday: TdxDBGridMaskColumn;
    grdListcm_sex: TdxDBGridMaskColumn;
    grdListcm_address: TdxDBGridMaskColumn;
    grdListcm_tel: TdxDBGridMaskColumn;
    grdListcm_mail: TdxDBGridMaskColumn;
    grdListcm_onlyno: TdxDBGridMaskColumn;
    grdListcm_date: TdxDBGridMaskColumn;
    grdListcm_time: TdxDBGridMaskColumn;
    grdListlast_time: TdxDBGridDateColumn;
    grdListlogin_id: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atExportExecute(Sender: TObject);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected 
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmCMView: TfrmCMView;

implementation
uses udmData, ufrmBase, ufrmCMModify;
{$R *.dfm}

{ TfrmCMView }

procedure TfrmCMView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM customerinfo';
    Open;
  end;
end;

procedure TfrmCMView.prop_IniInterFace;
begin
  inherited; 
  WindowState := wsMaximized;
end;

procedure TfrmCMView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Ri_Flag = 1 then
  begin
    inherited;
    frmCMView := nil;
  end;
end;

procedure TfrmCMView.atExportExecute(Sender: TObject);
begin
  inherited;
  if ExportExcel(grdList) then
  begin
    DispInfo('数据导出完成', 2);
  end;
end;

procedure TfrmCMView.atNewExecute(Sender: TObject);
begin
  inherited;
  frmCMModify := TfrmCMModify.Create(nil);
  try
    frmCMModify.pubp_Ini('', 1);
    frmCMModify.ShowModal;
  finally
    FreeAndNil(frmCMModify);
  end;
  prop_IniData;
end;

procedure TfrmCMView.atEditExecute(Sender: TObject);
begin
  inherited;  
  if Viewq.IsEmpty then
  begin
    DispInfo('当前无数据，不能编辑!');
    Exit;
  end;
  frmCMModify := TfrmCMModify.Create(nil);
  try
    frmCMModify.pubp_Ini(Viewq.FieldByName('cm_id').AsString, 2);
    frmCMModify.ShowModal;
  finally
    FreeAndNil(frmCMModify);
  end;
  prop_IniData;
end;

procedure TfrmCMView.atDelExecute(Sender: TObject);
begin
  inherited;   
  if Viewq.IsEmpty then
  begin
    DispInfo('当前无数据，不能删除!');
    Exit;
  end;
  frmCMModify := TfrmCMModify.Create(nil);
  try
    frmCMModify.pubp_Ini(Viewq.FieldByName('cm_id').AsString, 3);
    frmCMModify.ShowModal;
  finally
    FreeAndNil(frmCMModify);
  end;
  prop_IniData;
end;

procedure TfrmCMView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F1:
    begin
      atNew.OnExecute(Sender);
    end;
    VK_F2:
    begin
      atEdit.OnExecute(Sender);
    end;
    VK_F3:
    begin
      atDel.OnExecute(Sender);
    end;
    VK_F4:
    begin
      atFindData.OnExecute(Sender);
    end; 
    VK_F11:
    begin
      if Ri_Flag = 2 then
      begin
        atConfirm.OnExecute(Sender);
      end;
    end;
    VK_F12:
    begin
      atExit.OnExecute(Sender);
    end;
  end;
end;

end.
