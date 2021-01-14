unit ufrmUnitView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, dxEditor,
  dxEdLib, StdCtrls, ExtCtrls;

type
  TfrmUnitView = class(TfrmViewDataBase)
    ViewqI_UNIT_CD: TStringField;
    ViewqI_UNIT_NAME: TStringField;
    grdListI_UNIT_CD: TdxDBGridMaskColumn;
    grdListI_UNIT_NAME: TdxDBGridMaskColumn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    eUnitCD: TdxEdit;
    eUnitName: TdxEdit;
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure atNewExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function prif_CanSave: Boolean;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmUnitView: TfrmUnitView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmUnitView }

procedure TfrmUnitView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_UNIT_MS';
    Open;
  end;
end;

procedure TfrmUnitView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  eUnitCD.Text := Viewq.FieldByName('I_UNIT_CD').AsString;
  eUnitName.Text := Viewq.FieldByName('I_UNIT_Name').AsString;
end;

procedure TfrmUnitView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '原料单位管理');
    Exit;
  end;
  Viewq.Append;
end;

function TfrmUnitView.prif_CanSave: Boolean;
begin
  if Length(Trim(eUnitCD.Text)) = 0 then
  begin
    AppMsg('编号不能为空！', '原料单位管理');
    Result := False;
    Exit;
  end; 
  if Length(Trim(eUnitName.Text)) = 0 then
  begin
    AppMsg('原料单位名称不能为空！', '原料单位管理');
    Result := False;
    Exit;
  end;
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_UNIT_CD FROM T_UNIT_MS WHERE I_UNIT_CD = ''%s''', [eUnitCD.Text]);
    Open;
    if IsEmpty then
    begin
      Result := True;
    end else begin
      Result := False;
      AppMsg('单位编号不能重复！', '原料单位管理');
    end;
    Close;
  end;
end;

procedure TfrmUnitView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    if Viewq.State = dsInsert then
    begin
      if not prif_CanSave then Exit;
    end;
    try
      Viewq.FieldValues['I_UNIT_CD'] := eUnitCD.Text;
      Viewq.FieldValues['I_UNIT_Name'] := eUnitName.Text;
      Viewq.Post;
    except
      Abort;
    end;
  end;
end;

procedure TfrmUnitView.atEditExecute(Sender: TObject);
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
  end;
end;

procedure TfrmUnitView.atDelExecute(Sender: TObject);
begin
  inherited; 
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

procedure TfrmUnitView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmUnitView := nil;
end;

end.
