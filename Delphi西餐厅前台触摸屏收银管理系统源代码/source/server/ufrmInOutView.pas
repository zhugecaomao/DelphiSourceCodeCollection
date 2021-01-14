unit ufrmInOutView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxEdLib, dxEditor, dxCntner,
  StdCtrls, ExtCtrls, dxPSCore, DB, ADODB, CSADOQuery, ActnList, ImgList,
  dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, dxmdaset;

type
  TfrmInOutView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    eFlag: TdxEdit;
    eDate: TdxDateEdit;
    eNo: TdxEdit;
    eFactory: TdxPickEdit;
    Label6: TLabel;
    eOriginal: TdxPickEdit;
    Label7: TLabel;
    eUnit: TdxEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    eQty1: TdxEdit;
    eQty2: TdxEdit;
    eQty3: TdxEdit;
    eCount: TdxEdit;
    memInOut: TdxMemData;
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    ViewqI_PROPERTY_CODE: TStringField;
    ViewqI_UNIT: TStringField;
    ViewqI_QTY1: TIntegerField;
    ViewqI_QTY2: TIntegerField;
    ViewqI_QTY3: TIntegerField;
    memInOutI_ORIGINAL_CD: TStringField;
    memInOutI_ORIGINAL_NAME: TStringField;
    memInOutI_PROPERTY_CODE: TStringField;
    memInOutI_UNIT: TStringField;
    memInOutI_QTY1: TIntegerField;
    memInOutI_QTY2: TIntegerField;
    memInOutI_QTY3: TIntegerField;
    memInOutI_COUNT: TIntegerField;
    InOutd: TDataSource;
    grdListRecId: TdxDBGridColumn;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_PROPERTY_CODE: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_QTY1: TdxDBGridMaskColumn;
    grdListI_QTY2: TdxDBGridMaskColumn;
    grdListI_QTY3: TdxDBGridMaskColumn;
    grdListI_COUNT: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eOriginalChange(Sender: TObject);
    procedure eDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atDelExecute(Sender: TObject);
    procedure eFlagKeyPress(Sender: TObject; var Key: Char);
    procedure eQty1KeyPress(Sender: TObject; var Key: Char);
    procedure eQty1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eQty2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eQty3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atSaveExecute(Sender: TObject);
    procedure eNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eFactoryKeyPress(Sender: TObject; var Key: Char);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure eQty2KeyPress(Sender: TObject; var Key: Char);
    procedure eQty3KeyPress(Sender: TObject; var Key: Char);
    procedure atCancelExecute(Sender: TObject);
  private
    Fi_Act: Integer;
    function prif_GetNo: String;
    function prif_InOutInfo: Boolean;
    procedure prip_GetFactory;
    procedure prip_GetOriginalInfo;
    procedure prip_SerachOriginal(As_OriginalCD: String);
    procedure prip_Save(Ai_Flag: Integer);
  protected
    procedure prop_IniData; override;  
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmInOutView: TfrmInOutView;

implementation

uses udmData, StrUtils, ufrmBase, upubCommon;

{$R *.dfm}

{ TfrmInOutView }

function TfrmInOutView.prif_GetNo: String;
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

procedure TfrmInOutView.prip_GetFactory;
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

procedure TfrmInOutView.prip_GetOriginalInfo;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, ' +
      '(convert(varchar(10), i_qty1) + ''/'' + i_unit1 + '' '' ' +
      ' + convert(varchar(10), i_qty2) + ''/'' + i_unit2) as i_unit,  ' +
      'i_qty1, i_qty2, i_qty3 FROM T_ORIGINAL_MS WHERE I_PURCHASE = ''自采''';
    Open;
    if not IsEmpty then
    begin
      First;
      eOriginal.Items.Clear;
      while not Eof do
      begin
        eOriginal.Items.Add(FieldByName('I_ORIGINAL_CD').AsString + '-' +
          FieldByName('I_ORIGINAL_NAME').AsString);
        Next;
      end;
    end;
  end;
end;

procedure TfrmInOutView.prop_IniData;
begin
  inherited;
  prip_GetOriginalInfo;
  prip_GetFactory;
  eDate.Date := Date;
end;

procedure TfrmInOutView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmInOutView := nil;
end;

procedure TfrmInOutView.prip_SerachOriginal(As_OriginalCD: String);
begin
  if Viewq.Locate('I_ORIGINAL_CD', As_OriginalCD, []) then
  begin
    eUnit.Text := Viewq.FieldByName('I_UNIT').AsString;
  end;
end;

procedure TfrmInOutView.eOriginalChange(Sender: TObject);
var
  ls_OriginalCD: String;
  li_Index: Integer;
begin
  inherited;
  li_Index := Pos('-', eOriginal.Text);
  ls_OriginalCD := LeftStr(eOriginal.Text, li_Index - 1);
  prip_SerachOriginal(ls_OriginalCD);
end;

procedure TfrmInOutView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;  
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eFactory.Enabled := False;
  eOriginal.Enabled := False;
  eQty1.Enabled := False;
  eQty2.Enabled := False;
  eQty3.Enabled := False; 
end;

procedure TfrmInOutView.eDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if not CheckDate(eDate.Text) then Exit;
    case Fi_Act of
      1: eNo.Text := prif_GetNo; 
    end;
  end;
end;

procedure TfrmInOutView.atDelExecute(Sender: TObject);
begin       
  Fi_Act := 3;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eNo.Enabled := True;
  eFlag.SetFocus; 
end;

procedure TfrmInOutView.eFlagKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key in ['1'..'2']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '-') then
  else Key := #0;
end;

procedure TfrmInOutView.eQty1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '-') then
  else Key := #0;
end;

procedure TfrmInOutView.eQty1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    eCount.Text := IntToStr(StrToInt(eQty1.Text) * Viewq.FieldByName('I_QTY1').AsInteger);
    if Viewq.FieldByName('I_QTY1').AsInteger = 0 then
    begin
      eQty1.Text := '0';
    end;
    //eQty1.Text := IntToStr(StrToIntDef(eQty1.Text, 0) * Viewq.FieldByName('I_QTY1').AsInteger);
  end;
end;

procedure TfrmInOutView.eQty2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    eCount.Text := IntToStr(StrToIntDef(eCount.Text, 0) +
      (StrToIntDef(eQty2.Text, 0) * Viewq.FieldByName('I_QTY2').AsInteger)); 
    if Viewq.FieldByName('I_QTY2').AsInteger = 0 then
    begin
      eQty2.Text := '0';
    end;
    //eQty2.Text := IntToStr(StrToIntDef(eQty2.Text, 0) * Viewq.FieldByName('I_QTY2').AsInteger);
  end;
end;

procedure TfrmInOutView.eQty3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    if not memInOut.Active then memInOut.Open;
    eCount.Text := IntToStr(StrToIntDef(eCount.Text, 0) + StrToIntDef(eQty3.Text, 0)); 
    with memInOut do
    begin
      DisableControls;
      if Locate('I_ORIGINAL_CD', Viewq.FieldValues['I_ORIGINAL_CD'], []) then
      begin
        Edit;
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_PROPERTY_CODE'] := Viewq.FieldValues['I_PROPERTY_CODE'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT'];
        FieldValues['I_QTY1'] := FieldValues['I_QTY1'] + StrToFloatDef(eQty1.Text, 0.0);
        FieldValues['I_QTY2'] := FieldValues['I_QTY2'] + StrToFloatDef(eQty2.Text, 0.0);
        FieldValues['I_QTY3'] := FieldValues['I_QTY3'] + StrToFloatDef(eQty3.Text, 0.0);
        FieldValues['I_COUNT'] := FieldValues['I_COUNT'] + StrToFloatDef(eCount.Text, 0.0);
        Post;
      end else begin
        Append;
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_PROPERTY_CODE'] := Viewq.FieldValues['I_PROPERTY_CODE'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT'];
        FieldValues['I_QTY1'] := StrToFloatDef(eQty1.Text, 0.0);
        FieldValues['I_QTY2'] := StrToFloatDef(eQty2.Text, 0.0);
        FieldValues['I_QTY3'] := StrToFloatDef(eQty3.Text, 0.0);
        FieldValues['I_COUNT'] := StrToFloatDef(eCount.Text, 0.0); 
        Post;
      end;
      EnableControls;
      eQty1.Text := '0';
      eQty2.Text := '0';
      eQty3.Text := '0';
      eCount.Text := '0';
      eOriginal.SetFocus;
    end;
  end;
end;

procedure TfrmInOutView.prip_Save(Ai_Flag: Integer);
var
  ls_SQL, ls_Factory: String;
  li_Index: Integer;
begin
  if (not memInOut.Active) or (memInOut.IsEmpty) then Exit;
  li_Index := Pos('-', eFactory.Text);
  ls_Factory := LeftStr(eFactory.Text, li_Index - 1);
  case Fi_Act of
    1..2:
    begin
      with memInOut do
      begin
        DisableControls;
        First;
        dmData.adocon.BeginTrans;
        try
          dmData.adocon.Execute(Format('DELETE FROM T_INOUT_ORIGINAL_MS WHERE I_DATE = ''%s'' AND ' +
            'I_NO = ''%s'' AND I_FLAG = %d',
            [FormatDateTime('YYYY-MM-DD', eDate.Date), eNo.Text, StrToIntDef(eFlag.Text, 1)]));
          while not Eof do
          begin
            ls_SQL := Format('INSERT INTO T_INOUT_ORIGINAL_MS VALUES (''%s'', ''%s'', ''%s'', ''%s'', ' +
              '''%s'', %d, %d, %d, %d, ''%s'', %d, ''%s'', ''%s'') ', [eNo.Text,
              FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_PROPERTY_CODE').AsString,
              FieldByName('I_ORIGINAL_NAME').AsString, FieldByName('I_UNIT').AsString,
              FieldByName('I_QTY1').AsInteger, FieldByName('I_QTY2').AsInteger,
              FieldByName('I_QTY3').AsInteger, FieldByName('I_COUNT').AsInteger,
              FormatDateTime('YYYY-MM-DD', eDate.Date), Ai_Flag, LoginInfo.UserId,
              ls_Factory]);
            dmData.adocon.Execute(ls_SQL);
            Next;
          end;
          dmData.adocon.CommitTrans;
          AppMsg('保存完成', '进/退货管理', 1);
          EnableControls;
          Close;
        except
          On E: Exception do
          begin
            AppMsg(E.Message, '进/退货管理');
            dmData.adocon.RollbackTrans;
          end;
        end;
      end;
    end;
    3:
    begin
      dmData.adocon.BeginTrans;
      try
        dmData.adocon.Execute(Format('DELETE FROM T_INOUT_ORIGINAL_MS WHERE I_DATE = ''%s'' AND ' +
          'I_NO = ''%s'' AND I_FLAG = %d',
          [FormatDateTime('YYYY-MM-DD', eDate.Date), eNo.Text, StrToIntDef(eFlag.Text, 1)]));
        AppMsg('删除完成', '进/退货管理', 1);
        dmData.adocon.CommitTrans;
      except
        On E: Exception do
        begin
          AppMsg(E.Message, '进/退货管理');
          dmData.adocon.RollbackTrans;
        end;
      end;
    end;
  end;
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eFactory.Enabled := False;
  eOriginal.Enabled := False;
  eQty1.Enabled := False;
  eQty2.Enabled := False;
  eQty3.Enabled := False;
  if memInOut.Active then memInOut.Close;
end;

procedure TfrmInOutView.atSaveExecute(Sender: TObject);
begin
  inherited;
  prip_Save(StrToIntDef(eFlag.Text, 1));
end;

procedure TfrmInOutView.eNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    case Fi_Act of
      2:
      begin
        if not prif_InOutInfo then AppMsg('进退货数据不存在,请使用添加', '进/退货管理');
      end;
      3:
      begin
        if not prif_InOutInfo then AppMsg('进退货数据不存在,请使用添加', '进/退货管理');
      end;
    end;
  end;
end;

procedure TfrmInOutView.eFactoryKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #13 then Key := #0;
end;

procedure TfrmInOutView.atNewExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 1;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eFactory.Enabled := True;
  eOriginal.Enabled := True;
  eQty1.Enabled := True;
  eQty2.Enabled := True;
  eQty3.Enabled := True;
  eFlag.SetFocus;
end;

procedure TfrmInOutView.atEditExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 2;
  eFlag.Enabled := True;
  eDate.Enabled := True;  
  eNo.Enabled := True;
  eFactory.Enabled := True;
  eOriginal.Enabled := True;
  eQty1.Enabled := True;
  eQty2.Enabled := True;
  eQty3.Enabled := True;
  eFlag.SetFocus;
end;

function TfrmInOutView.prif_InOutInfo: Boolean;
begin  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, I_UNIT, I_QTY1, ' +
      'I_QTY2, I_QTY3, I_COUNT FROM T_INOUT_ORIGINAL_MS WHERE I_DATE = ''%s'' AND ' +
      'I_FLAG = %d AND I_NO = ''%s''', [FormatDateTime('YYYY-MM-DD', eDate.Date),
      StrToIntDef(eFlag.Text, 1), eNo.Text]);
    Open;
    Result := not IsEmpty;
    if not IsEmpty then
    begin
      First;           
      if memInOut.Active then memInOut.Close;
      memInOut.DisableControls;
      while not Eof do
      begin
        if not memInOut.Active then memInOut.Open;
        memInOut.Append;
        memInOut.FieldValues['I_ORIGINAL_CD'] := FieldValues['I_ORIGINAL_CD'];
        memInOut.FieldValues['I_ORIGINAL_NAME'] := FieldValues['I_ORIGINAL_NAME'];
        memInOut.FieldValues['I_PROPERTY_CODE'] := FieldValues['I_PROPERTY_CODE'];
        memInOut.FieldValues['I_UNIT'] := FieldValues['I_UNIT'];
        memInOut.FieldValues['I_QTY1'] := FieldValues['I_QTY1'];
        memInOut.FieldValues['I_QTY2'] := FieldValues['I_QTY2'];
        memInOut.FieldValues['I_QTY3'] := FieldValues['I_QTY3'];
        memInOut.FieldValues['I_COUNT'] := FieldValues['I_COUNT'];
        memInOut.Post;
        Next;
      end;
      memInOut.EnableControls;
    end;
    Close;
  end;
end;

procedure TfrmInOutView.eQty2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '-') then
  else Key := #0;
end;

procedure TfrmInOutView.eQty3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '-') then
  else Key := #0;
end;

procedure TfrmInOutView.atCancelExecute(Sender: TObject);
begin
  inherited;
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eFactory.Enabled := False;
  eOriginal.Enabled := False;
  eQty1.Enabled := False;
  eQty2.Enabled := False;
  eQty3.Enabled := False;
  if memInOut.Active then memInOut.Close;
end;

end.
