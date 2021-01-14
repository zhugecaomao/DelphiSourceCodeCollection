unit ufrmCardServiceFix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dxCntner, dxEditor, dxEdLib, dxExEdtr, DB,
  ADODB, CSADOQuery, dxmdaset, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  dxDBELib, Buttons;

type
  TfrmCardServiceFix = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    eCardId: TdxEdit;
    eCMName: TdxEdit;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    grdList: TdxDBGrid;
    Serviced: TDataSource;
    Viewq: TCSADOQuery;
    Viewqservice_id: TStringField;
    Viewqservice_name: TStringField;
    Viewqservice_money: TBCDField;
    Viewqbase_comparison: TBCDField;
    Viewqfix_money: TCurrencyField;
    Viewqnew_fix_money: TCurrencyField;
    grdListRecId: TdxDBGridColumn;
    grdListservice_id: TdxDBGridMaskColumn;
    grdListservice_name: TdxDBGridMaskColumn;
    grdListservice_money: TdxDBGridCurrencyColumn;
    grdListbase_comparison: TdxDBGridCurrencyColumn;
    grdListfix_money: TdxDBGridCurrencyColumn;
    grdListnew_fix_money: TdxDBGridCurrencyColumn;
    Label3: TLabel;
    eNewFixMoney: TdxDBCurrencyEdit;
    btnSave: TBitBtn;
    bbtnExit: TBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure bbtnExitClick(Sender: TObject);
  private
    Fs_CardId: String;
    procedure prip_IniInterFace;
    procedure prip_IniData;
  public
    procedure pubp_Ini(As_CardId, As_CMName: String);
  end;

var
  frmCardServiceFix: TfrmCardServiceFix;

implementation
uses udmData, ufrmBase;
{$R *.dfm}

{ TfrmCardServiceFix }

procedure TfrmCardServiceFix.prip_IniData;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getcardfixinfo ''%s''', [Fs_CardId]);
    Open;
  end;
end;

procedure TfrmCardServiceFix.prip_IniInterFace;
begin
  Position := poScreenCenter;
end;

procedure TfrmCardServiceFix.pubp_Ini(As_CardId, As_CMName: String);
begin
  Fs_CardId := As_CardId;
  eCMName.Text := As_CMName;
  eCardId.Text := Fs_CardId;
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmCardServiceFix.btnSaveClick(Sender: TObject);
var
  ls_SQL: String;
begin
  with Viewq do
  begin
    if IsEmpty then Exit;
    First;
    while not Eof do
    begin
      ls_SQL := Format('INSERT INTO cardfixinfo (card_id, service_id, new_fix_money) VALUES (''%s'', ''%s'', '+
        ' %f)', [Fs_CardId, Viewq.FieldByName('service_id').AsString,
        Viewq.FieldByName('new_fix_money').AsCurrency]);
      try
        dmData.adocon.BeginTrans;
        dmData.adocon.Execute(ls_SQL);
        dmData.adocon.CommitTrans;
        ModalResult := mrOk;
      except
        dmData.adocon.RollbackTrans;
        DispInfo('会员服务项目定额设定失败');
        Break;
      end;
      Next;
    end;
    DispInfo('会员服务项目定额设定完成', 2);
  end;
end;

procedure TfrmCardServiceFix.bbtnExitClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
