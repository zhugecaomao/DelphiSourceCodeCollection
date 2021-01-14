unit ufrmRealTradeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls,
  dxDBTLCl, dxGrClms, StdCtrls, Mask, DBCtrls, dxEditor, dxEdLib, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmRealTradeView = class(TfrmViewDataBase)
    Panel1: TPanel;
    ViewqI_SHOP_CD: TStringField;
    ViewqI_MACHINES_CD: TStringField;
    ViewqI_WORK_CD: TStringField;
    ViewqI_AMOUNT: TBCDField;
    ViewqI_INPUT_DATE: TStringField;
    ViewqI_EMP_CD: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    grdListI_SHOP_CD: TdxDBGridMaskColumn;
    grdListI_MACHINES_CD: TdxDBGridMaskColumn;
    grdListI_WORK_CD: TdxDBGridMaskColumn;
    grdListI_EMP_CD: TdxDBGridMaskColumn;
    grdListI_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_INPUT_DATE: TdxDBGridMaskColumn;
    eMachinesCD: TdxEdit;
    eWorkCD: TdxEdit;
    eEmpCD: TdxEdit;
    eAmount: TdxCurrencyEdit;
    Label5: TLabel;
    eInputDate: TdxDateEdit;
    procedure atSaveExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atNewExecute(Sender: TObject);
    procedure ViewqBeforePost(DataSet: TDataSet);
    procedure ViewqAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmRealTradeView: TfrmRealTradeView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmRealTradeView }

procedure TfrmRealTradeView.prop_IniData;
begin
  inherited;
  eInputDate.Date := Date;
  Viewq.AfterScroll := nil;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_REAL_TRADE_MS WHERE I_INPUT_DATE = ''%s''',
      [FormatDateTime('YYYY-MM-DD', eInputDate.Date)]);
    Open;
  end;
  Viewq.AfterScroll := ViewqAfterScroll;
end;

procedure TfrmRealTradeView.atSaveExecute(Sender: TObject);
begin
  inherited; 
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
    except
      Abort;
    end;
  end;
end;

procedure TfrmRealTradeView.atEditExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit;
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Edit;
      eMachinesCD.SetFocus;
    except
      Abort;
    end;
  end;
end;

procedure TfrmRealTradeView.atDelExecute(Sender: TObject);
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

procedure TfrmRealTradeView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmRealTradeView := nil;
end;

procedure TfrmRealTradeView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '班次管理');
    Exit;
  end;
  Viewq.Append;
  eMachinesCD.SetFocus;
end;

procedure TfrmRealTradeView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    FieldValues['I_SHOP_CD'] := ShopInfo.ShopCD;
    FieldValues['I_MACHINES_CD'] := eMachinesCD.Text; 
    FieldValues['I_WORK_CD'] := eWorkCD.Text;
    FieldValues['I_EMP_CD'] := eEmpCD.Text;
    FieldValues['I_AMOUNT'] := eAmount.Value;
    FieldValues['I_INPUT_DATE'] := FormatDateTime('YYYY-MM-DD', eInputDate.Date);
  end;
end;

procedure TfrmRealTradeView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    eMachinesCD.Text := FieldByName('I_MACHINES_CD').AsString;
    eWorkCD.Text := FieldByName('I_WORK_CD').AsString;
    eEmpCD.Text := FieldByName('I_EMP_CD').AsString;
    eAmount.Value := FieldByName('I_AMOUNT').AsCurrency;
    if FieldByName('I_INPUT_DATE').IsNull then eInputDate.Date := Date else
      eInputDate.Date := FieldByName('I_INPUT_DATE').AsDateTime;
  end;
end;

end.
