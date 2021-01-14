unit ufrmInOutOriginal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, dxEditor,
  dxEdLib, StdCtrls, ExtCtrls, dxmdaset, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmInOutOriginal = class(TfrmViewDataBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eFlag: TdxEdit;
    eDate: TdxDateEdit;
    Label4: TLabel;
    eNo: TdxEdit;
    Label5: TLabel;
    eFactory: TdxPickEdit;
    Originalq: TCSADOQuery;
    OriginalqI_ORIGINAL_CD: TStringField;
    OriginalqI_PROPERTY_CODE: TStringField;
    OriginalqI_ORIGINAL_NAME: TStringField;
    OriginalqI_UNIT: TStringField;
    Originald: TDataSource;
    OriginalqI_QTY1: TIntegerField;
    OriginalqI_QTY2: TIntegerField;
    OriginalqI_QTY3: TIntegerField;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_PROPERTY_CODE: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_QTY1: TdxDBGridMaskColumn;
    grdListI_QTY2: TdxDBGridMaskColumn;
    grdListI_QTY3: TdxDBGridMaskColumn;
    OriginalqI_COUNT: TIntegerField;
    grdListI_COUNT: TdxDBGridMaskColumn;
    dxMemData1: TdxMemData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eFlagKeyPress(Sender: TObject; var Key: Char);
    procedure eDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function prif_GetNo: String;
    procedure prip_GetFactory;
    procedure prip_GetOriginalInfo(Ai_Flag: Integer);
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmInOutOriginal: TfrmInOutOriginal;

implementation

uses udmData, StrUtils, ufrmBase;

{$R *.dfm}

{ TfrmInOutOriginal }

function TfrmInOutOriginal.prif_GetNo: String;
var
  li_No: Integer;
const
  LSZERO = '0000';
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT MAX(I_NO) AS I_NO FROM T_INOUT_ORIGINAL_MS WHERE I_DATE = ''%s''',
      [FormatDateTime('YYYY-MM-DD', eDate.Date)]);
    Open;
    if IsEmpty then
    begin
      Result := FormatDateTime('YYMMDD', eDate.Date) + '0001'; 
    end
    else
    begin
      li_No := StrToIntDef(RightStr(FieldByName('I_NO').AsString, 4), 0) + 1;
      Result := FormatDateTime('YYMMDD', eDate.Date) + LeftStr(LSZERO, 4 - Length(IntToStr(li_NO)));
      Result := Result + IntToStr(li_NO);
    end;
    Close;
  end;
end;

procedure TfrmInOutOriginal.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_ORIGINAL_MS';
    Open;
  end;
  prip_GetFactory;
end;

procedure TfrmInOutOriginal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmInOutOriginal := nil;
end;

procedure TfrmInOutOriginal.eFlagKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key in ['1'..'2']) or (Key = #13) or (Key = #8) or (Key = #9) then 
  else Key := #0;
end;

procedure TfrmInOutOriginal.prip_GetFactory;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_FACTORY_CD, I_FACTORY_NAME FROM T_FACTORY_MS';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        eFactory.Items.Add(FieldByName('I_FACTORY_CD').AsString + '-' +
          FieldByName('I_FACTORY_NAME').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

procedure TfrmInOutOriginal.prip_GetOriginalInfo(Ai_Flag: Integer);
begin
  with Originalq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, ' +
      '(convert(varchar(10), i_qty1) + ''/'' + i_unit1 + '' '' ' +
      ' + convert(varchar(10), i_qty2) + ''/'' + i_unit2) as i_unit,  ' +
      '0 as i_qty1, 0 as i_qty2, 0 as i_qty3, 0 as I_count  FROM T_ORIGINAL_MS';
    Open;
  end;
end;

procedure TfrmInOutOriginal.eDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if not CheckDate(eDate.Text) then Exit;
    prip_GetOriginalInfo(StrToIntDef(eFlag.Text, 1));
    eNo.Text := prif_GetNo;
  end;
end;

end.
