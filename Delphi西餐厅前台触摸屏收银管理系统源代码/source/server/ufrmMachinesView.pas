unit ufrmMachinesView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  dxEditor, dxEdLib, StdCtrls, ExtCtrls;

type
  TfrmMachinesView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    eMachinesCD: TdxEdit;
    eMachinesName: TdxEdit;
    ViewqI_MACHINES_CD: TStringField;
    ViewqI_MACHINES_NAME: TStringField;
    ViewqI_MACHINES_FREE: TIntegerField;
    ViewqI_LAST_ON_TIME: TStringField;
    ViewqI_LAST_OFF_TIME: TStringField;
    grdListI_MACHINES_CD: TdxDBGridMaskColumn;
    grdListI_MACHINES_NAME: TdxDBGridMaskColumn;
    grdListI_MACHINES_FREE: TdxDBGridMaskColumn;
    grdListI_LAST_ON_TIME: TdxDBGridMaskColumn;
    grdListI_LAST_OFF_TIME: TdxDBGridMaskColumn;
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function prif_CanSave: Boolean; 
  protected
    procedure prop_IniInterFace; override;
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmMachinesView: TfrmMachinesView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmMachinesView }

function TfrmMachinesView.prif_CanSave: Boolean;
begin
  if Length(Trim(eMachinesCD.Text)) = 0 then
  begin
    AppMsg('收银机编号不能为空', '收银机管理', 0);
    Result := False;
    eMachinesCD.SetFocus;
    Exit;
  end;
  if Length(Trim(eMachinesName.Text)) = 0 then
  begin
    AppMsg('电脑不能为空', '收银机管理', 0);
    Result := False;  
    eMachinesName.SetFocus;
    Exit;
  end;
  Result := True;
  {with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_MACHINES_MS WHERE I_MACHINES_CD = ''%s''', [eMachinesCD.Text]);
    Open;
    Result := IsEmpty;
    if not Result then 
    AppMsg('收银机编号不能重复', '收银机管理', 0);
    eMachinesCD.SetFocus;
    Close;
  end;}
end;

procedure TfrmMachinesView.prop_IniData;
begin
  inherited;
  Viewq.AfterScroll := nil;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_MACHINES_MS';
    Open;
  end;
  Viewq.AfterScroll := ViewqAfterScroll;
end;

procedure TfrmMachinesView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmMachinesView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    //if (Viewq.IsEmpty) or (not Viewq.Active) then Exit;
    eMachinesCD.Text := FieldByName('I_MACHINES_CD').AsString;
    eMachinesName.Text := FieldByName('I_MACHINES_Name').AsString;
  end;
end;

procedure TfrmMachinesView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not prif_CanSave then Exit;
  with Viewq do
  begin
    FieldByName('I_MACHINES_CD').AsString := eMachinesCD.Text;
    FieldByName('I_MACHINES_Name').AsString := eMachinesName.Text;
    FieldByName('I_MACHINES_FREE').AsInteger := 0;
  end;
end;

procedure TfrmMachinesView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '收银机管理');
    Exit;
  end;
  Viewq.Append;
  eMachinesCD.SetFocus;
  eMachinesCD.SelectAll; 
end;

procedure TfrmMachinesView.atEditExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit;
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Edit;
      eMachinesCD.SetFocus;
      eMachinesCD.SelectAll;
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        //Abort;
      end;
    end;
  end else
    AppMsg('当前正在编辑数据，不能再编辑！', '收银机管理');
end;

procedure TfrmMachinesView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '收银机管理', 1);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        //Abort;
      end;
    end;
  end;
end;

procedure TfrmMachinesView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', '收银机管理', 2) <> IDYES then Exit;
    try
      Viewq.Delete; 
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        //Abort;
      end;
    end;
    prop_IniData;
  end;
end;

procedure TfrmMachinesView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmMachinesView := nil;
end;

end.
