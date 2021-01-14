unit ufrmEmpView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, dxDBTLCl, dxGrClms, DBCtrls, dxEdLib, dxEditor, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmEmpView = class(TfrmViewDataBase)
    Panel1: TPanel;
    ViewqI_SHOP_CD: TStringField;
    ViewqI_EMP_CD: TStringField;
    ViewqI_EMP_NAME: TStringField;
    ViewqI_EMP_JOB: TStringField;
    ViewqI_EMP_POWER_CD: TStringField;
    ViewqI_UNLOCK: TBooleanField;
    ViewqI_CHANGE: TBooleanField;
    ViewqI_DELETE: TBooleanField;
    ViewqI_OUTDISCOUNT: TBooleanField;
    ViewqI_POS_SET: TBooleanField;
    ViewqI_BEGINNING: TBooleanField;
    ViewqI_EXIT: TBooleanField;
    ViewqI_DATETIME: TBooleanField;
    grdListI_SHOP_CD: TdxDBGridMaskColumn;
    grdListI_EMP_CD: TdxDBGridMaskColumn;
    grdListI_EMP_NAME: TdxDBGridMaskColumn;
    grdListI_EMP_JOB: TdxDBGridMaskColumn;
    grdListI_EMP_POWER_CD: TdxDBGridMaskColumn;
    grdListI_UNLOCK: TdxDBGridCheckColumn;
    grdListI_CHANGE: TdxDBGridCheckColumn;
    grdListI_DELETE: TdxDBGridCheckColumn;
    grdListI_OUTDISCOUNT: TdxDBGridCheckColumn;
    grdListI_POS_SET: TdxDBGridCheckColumn;
    grdListI_BEGINNING: TdxDBGridCheckColumn;
    grdListI_EXIT: TdxDBGridCheckColumn;
    grdListI_DATETIME: TdxDBGridCheckColumn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eEmpCD: TdxEdit;
    eEmpName: TdxEdit;
    eJob: TdxEdit;
    ePowerCD: TdxPickEdit;
    chbUnLock: TdxCheckEdit;
    chbChange: TdxCheckEdit;
    chbDelete: TdxCheckEdit;
    chbOutDiscount: TdxCheckEdit;
    chbPosSet: TdxCheckEdit;
    chbBeginning: TdxCheckEdit;
    chbExit: TdxCheckEdit;
    chbDateTime: TdxCheckEdit;
    Label5: TLabel;
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ViewqBeforePost(DataSet: TDataSet);
  private
    function prif_CanSave: Boolean;
    //procedure prip_GetPower;
  protected
    procedure prop_IniInterFace; override;
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmEmpView: TfrmEmpView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmEmpView }

function TfrmEmpView.prif_CanSave: Boolean;
begin
  if Length(Trim(eEmpCD.Text)) = 0 then
  begin
    AppMsg('工号不能为空', '员工管理', 0);
    Result := False;
    Exit;
  end;
  if Length(Trim(eEmpName.Text)) = 0 then
  begin
    AppMsg('姓名不能为空', '员工管理', 0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

{procedure TfrmEmpView.prip_GetPower;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := '';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        ePowerCD.Items.Add(FieldByName('').AsString + '-' + FieldByName('').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;  }

procedure TfrmEmpView.prop_IniData;
begin
  inherited;
  Viewq.AfterScroll := nil;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_EMPLOYEE_MS';
    Open;
  end;
  Viewq.AfterScroll := ViewqAfterScroll;
  if not Viewq.IsEmpty then Viewq.Last;
end;

procedure TfrmEmpView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    //if (Viewq.IsEmpty) or (not Viewq.Active) then Exit;
    eEmpCD.Text := FieldByName('I_EMP_CD').AsString;
    eEmpName.Text := FieldByName('I_EMP_NAME').AsString;
    eJob.Text := FieldByName('I_EMP_JOB').AsString;
    ePowerCD.Text := FieldByName('I_EMP_POWER_CD').AsString;
    chbUnLock.Checked := FieldByName('I_UNLOCK').AsBoolean;
    chbChange.Checked := FieldByName('I_CHANGE').AsBoolean;
    chbDelete.Checked := FieldByName('I_DELETE').AsBoolean;
    chbOutDiscount.Checked := FieldByName('I_OUTDISCOUNT').AsBoolean;
    chbPosSet.Checked := FieldByName('I_POS_SET').AsBoolean;
    chbBeginning.Checked := FieldByName('I_BEGINNING').AsBoolean;
    chbExit.Checked := FieldByName('I_EXIT').AsBoolean;
    chbDateTime.Checked := FieldByName('I_DATETIME').AsBoolean;
  end;
end;

procedure TfrmEmpView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '员工管理');
    Exit;
  end;
  Viewq.Append;
  eEmpCD.SetFocus;
  eEmpCD.SelectAll;
end;

procedure TfrmEmpView.atEditExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit;
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Edit;
    except
      Abort;
    end;
  end else
    AppMsg('当前正在编辑数据，不能再编辑！', '员工管理');
end;

procedure TfrmEmpView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '员工管理', 1);
    except
      Abort;
    end;
  end;
end;

procedure TfrmEmpView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', '员工管理', 2) <> IDYES then Exit;
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

procedure TfrmEmpView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmEmpView := nil;
end;

procedure TfrmEmpView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited; 
  if not prif_CanSave then Exit;
  with Viewq do
  begin
    if (not Viewq.IsEmpty) or (not Viewq.Active) then
    begin  
      FieldByName('I_SHOP_CD').AsString := ShopInfo.ShopCD;
      FieldByName('I_EMP_CD').AsString := eEmpCD.Text;
      FieldByName('I_EMP_NAME').AsString := eEmpName.Text;
      FieldByName('I_EMP_JOB').AsString := eJob.Text;
      FieldByName('I_EMP_POWER_CD').AsString := ePowerCD.Text;
      FieldByName('I_UNLOCK').AsBoolean := chbUnLock.Checked;
      FieldByName('I_CHANGE').AsBoolean := chbChange.Checked;
      FieldByName('I_DELETE').AsBoolean := chbDelete.Checked;
      FieldByName('I_OUTDISCOUNT').AsBoolean := chbOutDiscount.Checked;
      FieldByName('I_POS_SET').AsBoolean := chbPosSet.Checked;
      FieldByName('I_BEGINNING').AsBoolean := chbBeginning.Checked;
      FieldByName('I_EXIT').AsBoolean := chbExit.Checked;
      FieldByName('I_DATETIME').AsBoolean := chbDateTime.Checked;
    end;
  end;
end;

procedure TfrmEmpView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
end;

end.
