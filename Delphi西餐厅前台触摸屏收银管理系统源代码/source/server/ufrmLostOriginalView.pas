unit ufrmLostOriginalView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxmdaset, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  dxEditor, dxEdLib, StdCtrls, ExtCtrls, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmLostOriginalView = class(TfrmViewDataBase)
    LostMem: TdxMemData;
    Lostd: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    eDate: TdxDateEdit;
    eOriginal: TdxPickEdit;
    Label6: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    eLostQty: TdxEdit;
    eRemark: TdxEdit;
    LostMemI_ORIGINAL_CD: TStringField;
    LostMemI_ORIGINAL_NAME: TStringField;
    LostMemI_PROPERTY_CODE: TStringField;
    LostMemI_UNIT: TStringField;
    LostMemI_QTY: TFloatField;
    LostMemI_REMARK: TStringField;
    LostMemI_DATE: TStringField;
    eUnit: TdxEdit;
    Label7: TLabel;
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    ViewqI_UNIT4: TStringField;
    ViewqI_QTY4: TFloatField;
    LostMemI_LOST_QTY: TFloatField;
    ViewqI_PROPERTY_CODE: TStringField;
    grdListRecId: TdxDBGridColumn;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_PROPERTY_CODE: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_QTY: TdxDBGridMaskColumn;
    grdListI_LOST_QTY: TdxDBGridMaskColumn;
    grdListI_REMARK: TdxDBGridMaskColumn;
    grdListI_DATE: TdxDBGridMaskColumn;
    eQty: TdxEdit;
    Label3: TLabel;
    procedure atSaveExecute(Sender: TObject);
    procedure eRemarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eOriginalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure eDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atCancelExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure eLostQtyKeyPress(Sender: TObject; var Key: Char);
  private
    Fi_Flag: Integer;
    procedure prip_GetOriginalInfo;
    function prif_GetLostInfo: Boolean;
    function prif_SerachOriginal(As_OriginalCD: String): Boolean;
    procedure prip_Save;
  protected
    procedure prop_IniData; override;  
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmLostOriginalView: TfrmLostOriginalView;

implementation

uses udmData,StrUtils, upubCommon, ufrmBase;

{$R *.dfm}

{ TfrmLostOriginalView }

procedure TfrmLostOriginalView.prip_Save;
var
  ls_SQL: String;
begin
  if (not LostMem.Active) or (LostMem.IsEmpty) then Exit;
  if not CheckDate(eDate.Text) then Exit;
  case Fi_Flag of
    1..2:
    begin
      with LostMem do
      begin
        First;
        DisableControls;
        dmData.adocon.BeginTrans;
        try             
          dmData.adocon.Execute(Format('DELETE FROM T_LOST_ORIGINAL_MS WHERE I_DATE = ''%s''',
            [FormatDateTime('YYYY-MM-DD', eDate.Date)]));
          while not Eof do
          begin
            ls_SQL := Format('INSERT INTO T_LOST_ORIGINAL_MS VALUES (''%s'', ''%s'', ''%s'', ' +
              '''%s'', %f, %f, ''%s'', ''%s'')', [FieldByName('I_ORIGINAL_CD').AsString,
              FieldByName('I_ORIGINAL_NAME').AsString, FieldByName('I_PROPERTY_CODE').AsString,
              FieldByName('I_UNIT').AsString, FieldByName('I_QTY').AsFloat,
              FieldByName('I_LOST_QTY').AsFloat, FieldByName('I_REMARK').AsString,
              FieldByName('I_DATE').AsString]);
            dmData.adocon.Execute(ls_SQL);
            Next;
          end;
          dmData.adocon.CommitTrans;
          AppMsg('保存完成', '原料损耗处理', 1);
          eDate.Enabled := False;
          eOriginal.Enabled := False;
          eUnit.Enabled := False;
          eLostQty.Enabled := False;
          eRemark.Enabled := False;
          LostMem.Close;
        except
          On E: Exception do
          begin
            AppMsg(E.Message, '原料损耗处理');
            dmData.adocon.RollbackTrans;
          end;
        end;
        EnableControls;
      end;
    end; 
    3:
    begin
      dmData.adocon.BeginTrans;
      try             
        dmData.adocon.Execute(Format('DELETE FROM T_LOST_ORIGINAL_MS WHERE I_DATE = ''%s''',
          [FormatDateTime('YYYY-MM-DD', eDate.Date)]));
        AppMsg('删除完成', '原料损耗处理', 1);
        dmData.adocon.CommitTrans;
        eDate.Enabled := False;
        eOriginal.Enabled := False;
        eUnit.Enabled := False;
        eLostQty.Enabled := False;
        eRemark.Enabled := False;
        LostMem.Close;
      except
        On E: Exception do
        begin
          AppMsg(E.Message, '原料损耗处理');
          dmData.adocon.RollbackTrans;
        end;
      end;
    end;
  end;
end;

procedure TfrmLostOriginalView.prip_GetOriginalInfo;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, I_UNIT4, ' +
      'I_QTY4 FROM T_ORIGINAL_MS';
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

procedure TfrmLostOriginalView.prop_IniData;
begin
  inherited;
  prip_GetOriginalInfo; 
  eDate.Date := Date;
end;

procedure TfrmLostOriginalView.atSaveExecute(Sender: TObject);
begin
  inherited;
  prip_Save;
end; 

function TfrmLostOriginalView.prif_SerachOriginal(
  As_OriginalCD: String): Boolean;
begin
  Result := Viewq.Locate('I_ORIGINAL_CD', As_OriginalCD, []);
  if not Result then AppMsg('原料选择错误', '原料损耗处理');
end;

procedure TfrmLostOriginalView.eRemarkKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    if not LostMem.Active then LostMem.Open;
    with LostMem do
    begin
      DisableControls;
      if Locate('I_ORIGINAL_CD', Viewq.FieldValues['I_ORIGINAL_CD'], []) then
      begin
        Edit;
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_PROPERTY_CODE'] := Viewq.FieldValues['I_PROPERTY_CODE'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT4'];
        FieldValues['I_QTY'] := Viewq.FieldValues['I_QTY4'];
        FieldValues['I_LOST_QTY'] := FieldValues['I_LOST_QTY'] + Viewq.FieldValues['I_QTY4'] *
          StrToFloatDef(eLostQty.Text, 0.0);
        FieldValues['I_REMARK'] := eRemark.Text;
        FieldValues['I_DATE'] := FormatDateTime('YYYY-MM-DD', eDate.Date);
        Post;
      end else begin
        Append;
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_PROPERTY_CODE'] := Viewq.FieldValues['I_PROPERTY_CODE'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT4'];
        FieldValues['I_QTY'] := Viewq.FieldValues['I_QTY4'];
        FieldValues['I_LOST_QTY'] := Viewq.FieldValues['I_QTY4'] * StrToFloatDef(eLostQty.Text, 0.0);
        FieldValues['I_REMARK'] := eRemark.Text;
        FieldValues['I_DATE'] := FormatDateTime('YYYY-MM-DD', eDate.Date);
        Post;
      end;
      EnableControls;
    end;
    eOriginal.SetFocus;
  end;
end;

procedure TfrmLostOriginalView.eOriginalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ls_OriginalCD: String;
  li_Index: Integer;
begin
  if Key = 13 then
  begin
    li_Index := Pos('-', eOriginal.Text);
    ls_OriginalCD := LeftStr(eOriginal.Text, li_Index - 1);
    if not prif_SerachOriginal(ls_OriginalCD) then Exit;
    eUnit.Text := Viewq.FieldValues['I_UNIT4'];
    eQty.Text := Viewq.FieldValues['I_QTY4'];
  end;
  inherited;
end;

procedure TfrmLostOriginalView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
  eDate.Enabled := False;
  eOriginal.Enabled := False;
  eUnit.Enabled := False;
  eLostQty.Enabled := False;
  eRemark.Enabled := False;
end;

procedure TfrmLostOriginalView.atNewExecute(Sender: TObject);
begin
  inherited;
  Fi_Flag := 1;
  eDate.Enabled := True;
  eOriginal.Enabled := True;
  eLostQty.Enabled := True;
  eRemark.Enabled := True;
  eDate.SetFocus;
end;

procedure TfrmLostOriginalView.atEditExecute(Sender: TObject);
begin
  inherited;
  Fi_Flag := 2;
  eDate.Enabled := True;
  eOriginal.Enabled := True;
  eLostQty.Enabled := True;
  eRemark.Enabled := True;
  eDate.SetFocus;
end;

procedure TfrmLostOriginalView.eDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    case Fi_Flag of
      1:
      begin
        if prif_GetLostInfo then AppMsg('当日原料损耗数据已经存在,请使用修改', '原料损耗处理');
      end;
      2:
      begin
        if not prif_GetLostInfo then AppMsg('当日原料损耗数据不存在,请使用添加', '原料损耗处理');;
      end;
      3:
      begin
        if not prif_GetLostInfo then Exit;
      end;
    end;
  end;
end;

function TfrmLostOriginalView.prif_GetLostInfo: Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, I_UNIT, ' +
      'I_QTY, I_LOST_QTY, I_REMARK FROM T_LOST_ORIGINAL_MS WHERE I_DATE = ''%s''',
      [FormatDateTime('YYYY-MM-DD', eDate.Date)]);
    Open;
    Result := not IsEmpty;
    if not IsEmpty then
    begin 
      First;        
      if LostMem.Active then LostMem.Close;
      LostMem.DisableControls;
      while not Eof do
      begin
        if not LostMem.Active then LostMem.Open;
        LostMem.Append;
        LostMem.FieldValues['I_ORIGINAL_CD'] := FieldValues['I_ORIGINAL_CD'];
        LostMem.FieldValues['I_ORIGINAL_NAME'] := FieldValues['I_ORIGINAL_NAME'];
        LostMem.FieldValues['I_PROPERTY_CODE'] := FieldValues['I_PROPERTY_CODE'];
        LostMem.FieldValues['I_UNIT'] := FieldValues['I_UNIT'];
        LostMem.FieldValues['I_QTY'] := FieldValues['I_QTY'];
        LostMem.FieldValues['I_LOST_QTY'] := FieldValues['I_LOST_QTY'];
        LostMem.FieldValues['I_REMARK'] := FieldValues['I_REMARK'];;
        LostMem.FieldValues['I_DATE'] := FormatDateTime('YYYY-MM-DD', eDate.Date);
        LostMem.Post;
        Next;
      end;
      LostMem.EnableControls;
    end;
    Close;
  end;
end;

procedure TfrmLostOriginalView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmLostOriginalView := nil;
end;

procedure TfrmLostOriginalView.atCancelExecute(Sender: TObject);
begin
  eDate.Enabled := False;
  eOriginal.Enabled := False;
  eUnit.Enabled := False;
  eLostQty.Enabled := False;
  eRemark.Enabled := False;
  if LostMem.Active then LostMem.Close;
end;

procedure TfrmLostOriginalView.atDelExecute(Sender: TObject);
begin
  inherited;
  Fi_Flag := 3;
  eDate.Enabled := True; 
  eDate.SetFocus;
end;

procedure TfrmLostOriginalView.eLostQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) then
  else Key := #0;
end;

end.
