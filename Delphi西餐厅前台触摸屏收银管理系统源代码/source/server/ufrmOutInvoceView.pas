unit ufrmOutInvoceView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls,
  dxDBTLCl, dxGrClms, StdCtrls, Mask, DBCtrls, dxEdLib, dxEditor;

type
  TfrmOutInvoceView = class(TfrmViewDataBase)
    Panel1: TPanel;
    ViewqI_INVOCE_CD: TStringField;
    ViewqI_REMARK: TStringField;
    ViewqI_JT: TBCDField;
    ViewqI_BC: TBCDField;
    ViewqI_DH: TBCDField;
    ViewqI_YS: TBCDField;
    ViewqI_SD: TBCDField;
    ViewqI_HB: TBCDField;
    ViewqI_XL: TBCDField;
    ViewqI_WL: TBCDField;
    ViewqI_CX: TBCDField;
    ViewqI_TEL: TBCDField;
    ViewqI_YG: TBCDField;
    ViewqI_OTHER: TBCDField;
    ViewqI_INPUT_DATE: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    eInvoceCD: TdxEdit;
    eRemark: TdxEdit;
    eJT: TdxCurrencyEdit;
    eBG: TdxCurrencyEdit;
    eDH: TdxCurrencyEdit;
    eYS: TdxCurrencyEdit;
    eSD: TdxCurrencyEdit;
    eHB: TdxCurrencyEdit;
    eXL: TdxCurrencyEdit;
    eWL: TdxCurrencyEdit;
    eCX: TdxCurrencyEdit;
    eTEL: TdxCurrencyEdit;
    eYG: TdxCurrencyEdit;
    eOther: TdxCurrencyEdit;
    eInputDate: TdxDateEdit;
    ViewqI_SHOP_CD: TStringField;
    grdListI_INVOCE_CD: TdxDBGridMaskColumn;
    grdListI_REMARK: TdxDBGridMaskColumn;
    grdListI_JT: TdxDBGridCurrencyColumn;
    grdListI_BC: TdxDBGridCurrencyColumn;
    grdListI_DH: TdxDBGridCurrencyColumn;
    grdListI_YS: TdxDBGridCurrencyColumn;
    grdListI_SD: TdxDBGridCurrencyColumn;
    grdListI_HB: TdxDBGridCurrencyColumn;
    grdListI_XL: TdxDBGridCurrencyColumn;
    grdListI_WL: TdxDBGridCurrencyColumn;
    grdListI_CX: TdxDBGridCurrencyColumn;
    grdListI_TEL: TdxDBGridCurrencyColumn;
    grdListI_YG: TdxDBGridCurrencyColumn;
    grdListI_OTHER: TdxDBGridCurrencyColumn;
    grdListI_INPUT_DATE: TdxDBGridMaskColumn;
    grdListI_SHOP_CD: TdxDBGridMaskColumn;
    procedure atNewExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atFindDataExecute(Sender: TObject);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmOutInvoceView: TfrmOutInvoceView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmOutInvoceView }

procedure TfrmOutInvoceView.prop_IniData;
begin
  inherited;
  eInputDate.Date := Date;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_OUT_INVOCE_MS WHERE I_INPUT_DATE = ''%s''',
      [FormatDateTime('YYYY-MM-DD', eInputDate.Date)]);
    Open;
  end;
end;

procedure TfrmOutInvoceView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '班次管理');
    Exit;
  end;
  Viewq.Append;
  eInvoceCD.SetFocus;
end;

procedure TfrmOutInvoceView.atDelExecute(Sender: TObject);
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

procedure TfrmOutInvoceView.atEditExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit;
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Edit;
      eInvoceCD.SetFocus;
    except
      Abort;
    end;
  end;
end;

procedure TfrmOutInvoceView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
    except
      On E: Exception do
      begin
        ShowMessage(e.Message);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmOutInvoceView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmOutInvoceView.atFindDataExecute(Sender: TObject);
begin
  prop_IniData;
end;

procedure TfrmOutInvoceView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    eInvoceCD.Text := FieldByName('I_INVOCE_CD').AsString;
    eRemark.Text := FieldByName('I_REMARK').AsString;
    eJT.Value := FieldByName('I_JT').AsCurrency;
    eBG.Value := FieldByName('I_BC').AsCurrency; //办公
    eDH.Value := FieldByName('I_DH').AsCurrency;
    eYS.Value := FieldByName('I_YS').AsCurrency;
    eSD.Value := FieldByName('I_SD').AsCurrency;
    eHB.Value := FieldByName('I_HB').AsCurrency;
    eXL.Value := FieldByName('I_XL').AsCurrency;
    eWL.Value := FieldByName('I_WL').AsCurrency;
    eCX.Value := FieldByName('I_CX').AsCurrency;
    eTEL.Value := FieldByName('I_TEL').AsCurrency;
    eYG.Value := FieldByName('I_YG').AsCurrency;
    eOther.Value := FieldByName('I_OTHER').AsCurrency;
    if FieldByName('I_INPUT_DATE').IsNull then eInputDate.Date := Date else
      eInputDate.Date := FieldByName('I_INPUT_DATE').AsDateTime;
  end;
end;

procedure TfrmOutInvoceView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    FieldValues['I_INVOCE_CD'] := eInvoceCD.Text;
    FieldValues['I_REMARK'] := eRemark.Text;
    FieldValues['I_JT'] := eJT.Value;
    FieldValues['I_BC'] := eBG.Value; //办公
    FieldValues['I_DH'] := eDH.Value;
    FieldValues['I_YS'] := eYS.Value;
    FieldValues['I_SD'] := eSD.Value;
    FieldValues['I_HB'] := eHB.Value;
    FieldValues['I_XL'] := eXL.Value;
    FieldValues['I_WL'] := eWL.Value;
    FieldValues['I_CX'] := eCX.Value;
    FieldValues['I_TEL'] := eTEL.Value;
    FieldValues['I_YG'] := eYG.Value;
    FieldValues['I_OTHER'] := eOther.Value;
    FieldValues['I_INPUT_DATE'] := FormatDateTime('YYYY-MM-DD', eInputDate.Date);
    FieldValues['I_SHOP_CD'] := ShopInfo.ShopCD;
  end;
end;

procedure TfrmOutInvoceView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmOutInvoceView := nil;
end;

end.
