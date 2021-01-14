unit ufrmOriginalItemView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls,
  dxEditor, dxEdLib, StdCtrls;

type
  TfrmOriginalItemView = class(TfrmViewDataBase)
    Panel1: TPanel;
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    ViewqI_ORIGINAL_COLOR: TLargeintField;
    Label1: TLabel;
    Label2: TLabel;
    eOriginalCD: TdxEdit;
    eOriginalName: TdxEdit;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_COLOR: TdxDBGridColumn;
    procedure atNewExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atEditExecute(Sender: TObject);
  private
    function prif_CanSave: Boolean;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmOriginalItemView: TfrmOriginalItemView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmOriginalItemView }

procedure TfrmOriginalItemView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_ORIGINAL_ITEM_MS';
    Open;
  end;
end;

procedure TfrmOriginalItemView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '原料分类管理');
    Exit;
  end;
  Viewq.Append;
  eOriginalCD.SetFocus;
  eOriginalCD.SelectAll;
end;

procedure TfrmOriginalItemView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '原料分类', 1);
    except
      Abort;
    end;
  end;
end;

procedure TfrmOriginalItemView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', '原料分类', 2) <> IDYES then Exit;
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

procedure TfrmOriginalItemView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    eOriginalCD.Text := FieldByName('I_ORIGINAL_CD').AsString;
    eOriginalName.Text := FieldByName('I_ORIGINAL_NAME').AsString;
  end;
end;

procedure TfrmOriginalItemView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not prif_CanSave then Exit;
  with Viewq do
  begin
    FieldValues['I_ORIGINAL_CD'] := eOriginalCD.Text;
    FieldValues['I_ORIGINAL_NAME'] := eOriginalName.Text;
  end;
end;

function TfrmOriginalItemView.prif_CanSave: Boolean;
begin
  if Length(Trim(eOriginalCD.Text)) = 0 then
  begin
    AppMsg('编号不能为空!', '原料分类', 0);
    Result := False;
    Exit;
  end; 
  if Length(Trim(eOriginalName.Text)) = 0 then
  begin
    AppMsg('名称不能为空!', '原料分类', 0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmOriginalItemView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmOriginalItemView := nil;
end;

procedure TfrmOriginalItemView.atEditExecute(Sender: TObject);
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
    AppMsg('当前正在编辑数据，不能再编辑！', '原料分类管理');
end;

end.
