unit ufrmFactoryView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, dxEditor, dxEdLib, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmFactoryView = class(TfrmViewDataBase)
    ViewqI_FACTORY_CD: TStringField;
    ViewqI_FACTORY_NAME: TStringField;
    ViewqI_FACTORY_ZIPCODE: TStringField;
    ViewqI_FACTORY_ADDRESS: TStringField;
    ViewqI_FACTORY_TEL: TStringField;
    ViewqI_FACTORY_CONNECT_MAN: TStringField;
    ViewqI_REMARK: TStringField;
    grdListI_FACTORY_CD: TdxDBGridMaskColumn;
    grdListI_FACTORY_NAME: TdxDBGridMaskColumn;
    grdListI_FACTORY_ZIPCODE: TdxDBGridMaskColumn;
    grdListI_FACTORY_ADDRESS: TdxDBGridMaskColumn;
    grdListI_FACTORY_TEL: TdxDBGridMaskColumn;
    grdListI_FACTORY_CONNECT_MAN: TdxDBGridMaskColumn;
    grdListI_REMARK: TdxDBGridMaskColumn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    eCD: TdxEdit;
    eName: TdxEdit;
    eZipCode: TdxEdit;
    eAddress: TdxEdit;
    eTel: TdxEdit;
    eConnectMan: TdxEdit;
    eRemark: TdxEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
  private
    function prif_CanSave: Boolean;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmFactoryView: TfrmFactoryView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

procedure TfrmFactoryView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmFactoryView := nil;
end;

function TfrmFactoryView.prif_CanSave: Boolean;
begin
  if Length(Trim(eCD.Text)) = 0 then
  begin
    AppMsg('编号不能为空!', '原料管理', 0);
    Result := False;
    Exit;
  end;
  if Length(Trim(eName.Text)) = 0 then
  begin
    AppMsg('名称不能为空!', '原料管理', 0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmFactoryView.prop_IniData;
begin
  inherited;    
  Viewq.AfterScroll := nil;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_FACTORY_MS';
    Open;
  end;
  Viewq.AfterScroll := ViewqAfterScroll;
  Viewq.Last;
end;

procedure TfrmFactoryView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    eCD.Text := FieldByName('I_FACTORY_CD').AsString;
    eName.Text := FieldByName('I_FACTORY_NAME').AsString;
    eZipCode.Text := FieldByName('I_FACTORY_ZIPCODE').AsString;
    eAddress.Text := FieldByName('I_FACTORY_ADDRESS').AsString;
    eTel.Text := FieldByName('I_FACTORY_TEL').AsString;
    eConnectMan.Text := FieldByName('I_FACTORY_CONNECT_MAN').AsString;
    eRemark.Text := FieldByName('I_REMARK').AsString;
  end;
end;

procedure TfrmFactoryView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not prif_CanSave then Exit;
  with Viewq do
  begin
    FieldByName('I_FACTORY_CD').AsString := eCD.Text;
    FieldByName('I_FACTORY_NAME').AsString := eName.Text;
    FieldByName('I_FACTORY_ZIPCODE').AsString := eZipCode.Text;
    FieldByName('I_FACTORY_ADDRESS').AsString := eAddress.Text;
    FieldByName('I_FACTORY_TEL').AsString := eTel.Text;
    FieldByName('I_FACTORY_CONNECT_MAN').AsString := eConnectMan.Text;
    FieldByName('I_REMARK').AsString := eRemark.Text;
  end;
end;

procedure TfrmFactoryView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '厂商信息管理');
    Exit;
  end;
  Viewq.Append;
  eCD.SetFocus;
  eCD.SelectAll;
end;

procedure TfrmFactoryView.atEditExecute(Sender: TObject);
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
    AppMsg('当前正在编辑数据，不能再编辑！', '厂商信息管理');
end;

procedure TfrmFactoryView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '厂商信息管理', 1);
    except
      On E: Exception do
      begin
        AppMsg(E.Message, '厂商信息管理', 0);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmFactoryView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', '厂商信息管理', 2) <> IDYES then Exit;
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

end.
