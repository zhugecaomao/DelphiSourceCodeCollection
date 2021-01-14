unit ufrmDayWarerHouseView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  ExtCtrls, dxEditor, dxEdLib, StdCtrls, Buttons, dxmdaset;

type
  TfrmDayWarerHouseView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    eStartDate: TdxDateEdit;
    eEndDate: TdxDateEdit;
    bbtnStart: TBitBtn;
    Label3: TLabel;
    eLastDate: TdxDateEdit;
    Label7: TLabel;
    eUnit: TdxEdit;
    Label6: TLabel;
    Label8: TLabel;
    eRealUseQty: TdxEdit;
    Label4: TLabel;
    bbtnEditQty: TBitBtn;
    labState: TLabel;
    eOriginal: TdxEdit;
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    ViewqI_UNIT: TStringField;
    ViewqI_YESTERDAY_QTY: TFloatField;
    ViewqI_IN_QTY: TFloatField;
    ViewqI_OUT_QTY: TFloatField;
    ViewqI_ALLOC_IN_QTY: TFloatField;
    ViewqI_ALLOC_OUT_QTY: TFloatField;
    ViewqI_LOST_QTY: TFloatField;
    ViewqI_TODAY_QTY: TFloatField;
    ViewqI_CALC_USE_QTY: TFloatField;
    ViewqI_REAL_USE_QTY: TFloatField;
    ViewqI_DIFFERENCE_QTY: TFloatField;
    ViewqI_DIFFERENCE_COUNT_QTY: TFloatField;
    memView: TdxMemData;
    memViewI_DATE: TStringField;
    memViewI_ORIGINAL_CD: TStringField;
    memViewI_ORIGINAL_NAME: TStringField;
    memViewI_UNIT: TStringField;
    memViewI_YESTERDAY_QTY: TFloatField;
    memViewI_IN_QTY: TFloatField;
    memViewI_OUT_QTY: TFloatField;
    memViewI_ALLOC_IN_QTY: TFloatField;
    memViewI_ALLOC_OUT_QTY: TFloatField;
    memViewI_LOST_QTY: TFloatField;
    memViewI_TODAY_QTY: TFloatField;
    memViewI_CALC_USE_QTY: TFloatField;
    memViewI_REAL_USE_QTY: TFloatField;
    memViewI_DIFFERENCE_QTY: TFloatField;
    memViewI_DIFFERENCE_COUNT_QTY: TFloatField;
    chbAuto: TCheckBox;
    grdListRecId: TdxDBGridColumn;
    grdListI_DATE: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_YESTERDAY_QTY: TdxDBGridMaskColumn;
    grdListI_IN_QTY: TdxDBGridMaskColumn;
    grdListI_OUT_QTY: TdxDBGridMaskColumn;
    grdListI_ALLOC_IN_QTY: TdxDBGridMaskColumn;
    grdListI_ALLOC_OUT_QTY: TdxDBGridMaskColumn;
    grdListI_LOST_QTY: TdxDBGridMaskColumn;
    grdListI_TODAY_QTY: TdxDBGridMaskColumn;
    grdListI_CALC_USE_QTY: TdxDBGridMaskColumn;
    grdListI_REAL_USE_QTY: TdxDBGridMaskColumn;
    grdListI_DIFFERENCE_QTY: TdxDBGridMaskColumn;
    grdListI_DIFFERENCE_COUNT_QTY: TdxDBGridMaskColumn;
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure bbtnStartClick(Sender: TObject);
    procedure atCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atSaveExecute(Sender: TObject);
    procedure memViewBeforePost(DataSet: TDataSet);
  private
    Fi_Act: Integer;
    function prif_GetLastDate(var As_Date: String): Boolean;
    procedure prip_GetDayWarerHouse(As_LastDate, As_Date: String);
    procedure prip_GetEidtDayWarerHouse(As_Date: String);
    function prif_CanGetData: Boolean;
    procedure prip_SetControlFalse;
    procedure prip_Save(As_Date: String);
  protected
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmDayWarerHouseView: TfrmDayWarerHouseView;

implementation

uses udmData, StrUtils, DateUtils, upubCommon;

{$R *.dfm}

procedure TfrmDayWarerHouseView.prop_IniData;
var
  ls_Date: String;
begin
  inherited;
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  if prif_GetLastDate(ls_Date) then
  begin
    eLastDate.Date := StrToDate(ls_Date);
  end else eLastDate.Date := IncDay(Date, -1);
end;

procedure TfrmDayWarerHouseView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
  prip_SetControlFalse;
end;  

function TfrmDayWarerHouseView.prif_GetLastDate(
  var As_Date: String): Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT MAX(I_DATE) AS I_DATE FROM T_DAYWAREHOUSE';
    Open;
    if not IsEmpty then
    begin
      As_Date := FieldByName('I_DATE').AsString;
    end;
    Close;
  end;
  try
    StrToDate(As_Date);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmDayWarerHouseView.atNewExecute(Sender: TObject);
begin
  inherited;   
  prip_SetControlFalse;
  Fi_Act := 1;
  eStartDate.Enabled := True;
  eEndDate.Enabled := True;
  bbtnStart.Enabled := True;
  bbtnStart.Caption := '开始盘点';
  chbAuto.Visible := True;
  chbAuto.Enabled := True;
  eStartDate.SetFocus;
end;

procedure TfrmDayWarerHouseView.atEditExecute(Sender: TObject);
begin
  inherited;  
  prip_SetControlFalse;
  Fi_Act := 2;
  eStartDate.Enabled := True;
  bbtnStart.Enabled := True;
  bbtnStart.Enabled := True;
  bbtnStart.Caption := '开始查询';  
  bbtnEditQty.Enabled := True;  
  eStartDate.SetFocus;
end;

procedure TfrmDayWarerHouseView.atDelExecute(Sender: TObject);
begin
  inherited;
  prip_SetControlFalse;
  Fi_Act := 3;
  eStartDate.Date := eLastDate.Date;
  bbtnStart.Enabled := True;
  bbtnStart.Enabled := True;
  bbtnStart.Caption := '开始查询';  
  bbtnStart.SetFocus;
end;

procedure TfrmDayWarerHouseView.prip_GetDayWarerHouse(As_LastDate, As_Date: String);
var
  ls_SQL: String;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getDayOriginal ''%s'', ''%s''', [As_LastDate, As_Date]);
    Open;
    if not IsEmpty then
    begin
      First;
      if not memView.Active then memView.Open;
      while not Eof do
      begin
        memView.Append;
        memView.FieldValues['I_DATE'] := As_Date;
        memView.FieldValues['I_ORIGINAL_CD'] := FieldValues['I_ORIGINAL_CD'];
        memView.FieldValues['I_ORIGINAL_NAME'] := FieldValues['I_ORIGINAL_NAME'];  
        memView.FieldValues['I_UNIT'] := FieldValues['I_UNIT'];
        memView.FieldValues['I_YESTERDAY_QTY'] := FieldValues['I_YESTERDAY_QTY'];
        memView.FieldValues['I_IN_QTY'] := FieldValues['I_IN_QTY'];
        memView.FieldValues['I_OUT_QTY'] := FieldValues['I_OUT_QTY'];
        memView.FieldValues['I_ALLOC_IN_QTY'] := FieldValues['I_ALLOC_IN_QTY'];
        memView.FieldValues['I_ALLOC_OUT_QTY'] := FieldValues['I_ALLOC_OUT_QTY'];
        memView.FieldValues['I_LOST_QTY'] := FieldValues['I_LOST_QTY'];  
        memView.FieldValues['I_TODAY_QTY'] := FieldValues['I_TODAY_QTY'];
        memView.FieldValues['I_CALC_USE_QTY'] := FieldValues['I_CALC_USE_QTY'];
        memView.FieldValues['I_REAL_USE_QTY'] := FieldValues['I_REAL_USE_QTY'];
        memView.FieldValues['I_DIFFERENCE_QTY'] := FieldValues['I_DIFFERENCE_QTY'];
        memView.FieldValues['I_DIFFERENCE_COUNT_QTY'] := FieldValues['I_DIFFERENCE_COUNT_QTY'];
        memView.Post;
        if chbAuto.Checked then
        begin
          ls_SQL := Format('INSERT INTO T_DAYWAREHOUSE VALUES (''%s'', ''%s'', ''%s'', ''%s'', ' +
            '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f)', [As_Date,
            FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_ORIGINAL_NAME').AsString,
            FieldByName('I_UNIT').AsString, FieldByName('I_YESTERDAY_QTY').AsFloat,
            FieldByName('I_IN_QTY').AsFloat, FieldByName('I_OUT_QTY').AsFloat,
            FieldByName('I_ALLOC_IN_QTY').AsFloat, FieldByName('I_ALLOC_OUT_QTY').AsFloat,
            FieldByName('I_LOST_QTY').AsFloat, FieldByName('I_TODAY_QTY').AsFloat,
            FieldByName('I_CALC_USE_QTY').AsFloat, FieldByName('I_REAL_USE_QTY').AsFloat,
            FieldByName('I_DIFFERENCE_QTY').AsFloat, FieldByName('I_DIFFERENCE_QTY').AsFloat]);
          dmData.adocon.BeginTrans;
          try
            dmData.adocon.Execute(ls_SQL);
            dmData.adocon.CommitTrans;
          except
            On E: Exception do
            begin
              AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), '原料日盘点');
              dmData.adocon.RollbackTrans;
              Break;
            end;
          end;
        end;
        Next;
      end;
    end;
  end;
end;

function TfrmDayWarerHouseView.prif_CanGetData: Boolean;
begin
  case Fi_Act of
    1:
    begin
      if eStartDate.Date <= eLastDate.Date then
      begin
        Result := False;
        AppMsg('盘点开始日期不能小于或等于最后盘点日期' + #13 + #10 + '如果您需要重新盘点' +
          '请将需要盘点的数据删除', '原料日盘点');
        Exit;
      end;     
      if (eStartDate.Date > eEndDate.Date) and (not chbAuto.Checked)then
      begin
        Result := False;
        AppMsg('开始日期不能大于结束日期!' + #13 + #10, '原料日盘点');
        Exit;
      end;
      if (eStartDate.Date <> eEndDate.Date) and (not chbAuto.Checked)then
      begin
        Result := False;
        AppMsg('你选择了对多日数据进行盘点，必须使用自动保存!' + #13 + #10, '原料日盘点');
        Exit;
      end;
    end;   
    {2:
    begin
      if eStartDate.Date > eLastDate.Date then
      begin
        Result := False;
        AppMsg('盘点结束日期不能大于或等于最后盘点日期' + #13 + #10 + '如果您需要重新盘点' +
          '请将需要盘点的数据删除', '原料日盘点');
        Exit;
      end; 
    end;}
  end;
  Result := True;
end;

procedure TfrmDayWarerHouseView.bbtnStartClick(Sender: TObject);
var
  ls_LastDate: String;
begin
  inherited;
  if memView.Active then memView.Close;
  if not prif_CanGetData then Exit;
  ls_LastDate := FormatDateTime('YYYY-MM-DD', eLastDate.Date);
  case Fi_Act of
    1:
    begin 
      Application.ProcessMessages;
      repeat
        prip_GetDayWarerHouse(ls_LastDate, FormatDateTime('YYYY-MM-DD', eStartDate.Date));
        ls_LastDate := FormatDateTime('YYYY-MM-DD', eStartDate.Date);
        eStartDate.Date := IncDay(eStartDate.Date, 1);
        labState.Caption := Format('正在盘点%s的数据',
         [FormatDateTime('YYYY-MM-DD', eStartDate.Date)]);
        //if eStartDate.Date = eEndDate.Date then Break;
      until ls_LastDate >= FormatDateTime('YYYY-MM-DD', eEndDate.Date);
      if prif_GetLastDate(ls_LastDate) then eLastDate.Date := StrToDate(ls_LastDate);
    end;
    2..3:
    begin
      prip_GetEidtDayWarerHouse(FormatDateTime('YYYY-MM-DD', eStartDate.Date));
    end;
  end;
end;

procedure TfrmDayWarerHouseView.atCancelExecute(Sender: TObject);
begin
  inherited;
  prip_SetControlFalse;
end;

procedure TfrmDayWarerHouseView.prip_SetControlFalse;
begin
  eStartDate.Enabled := False;
  eEndDate.Enabled := False;
  eOriginal.Enabled := False;
  bbtnStart.Enabled := False;
  bbtnEditQty.Enabled := False;
  eRealUseQty.Enabled := False;
  chbAuto.Visible := False;
  chbAuto.Enabled := False;
  if memView.Active then memView.Close;
end;

procedure TfrmDayWarerHouseView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmDayWarerHouseView := nil;
end;

procedure TfrmDayWarerHouseView.prip_GetEidtDayWarerHouse(As_Date: String); 
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_DAYWAREHOUSE WHERE I_DATE = ''%s''', [As_Date]);
    Open;
    if not IsEmpty then
    begin
      First;
      if not memView.Active then memView.Open;
      while not Eof do
      begin
        memView.Append;
        memView.FieldValues['I_DATE'] := As_Date;
        memView.FieldValues['I_ORIGINAL_CD'] := FieldValues['I_ORIGINAL_CD'];
        memView.FieldValues['I_ORIGINAL_NAME'] := FieldValues['I_ORIGINAL_NAME'];  
        memView.FieldValues['I_UNIT'] := FieldValues['I_UNIT'];
        memView.FieldValues['I_YESTERDAY_QTY'] := FieldValues['I_YESTERDAY_QTY'];
        memView.FieldValues['I_IN_QTY'] := FieldValues['I_IN_QTY'];
        memView.FieldValues['I_OUT_QTY'] := FieldValues['I_OUT_QTY'];
        memView.FieldValues['I_ALLOC_IN_QTY'] := FieldValues['I_ALLOC_IN_QTY'];
        memView.FieldValues['I_ALLOC_OUT_QTY'] := FieldValues['I_ALLOC_OUT_QTY'];
        memView.FieldValues['I_LOST_QTY'] := FieldValues['I_LOST_QTY'];
        memView.FieldValues['I_TODAY_QTY'] := FieldValues['I_TODAY_QTY'];
        memView.FieldValues['I_CALC_USE_QTY'] := FieldValues['I_CALC_USE_QTY'];
        memView.FieldValues['I_REAL_USE_QTY'] := FieldValues['I_REAL_USE_QTY'];
        memView.FieldValues['I_DIFFERENCE_QTY'] := FieldValues['I_DIFFERENCE_QTY'];
        memView.FieldValues['I_DIFFERENCE_COUNT_QTY'] := FieldValues['I_DIFFERENCE_COUNT_QTY'];
        memView.Post;
        Next;
      end;
    end;
  end;
end;

procedure TfrmDayWarerHouseView.prip_Save(As_Date: String);
var
  ls_SQL: String;
begin
  if (not memView.Active) or (memView.IsEmpty) then Exit;
  case Fi_Act of
    1..2:
    begin
      with memView do
      begin
        First;
        dmData.adocon.BeginTrans;
        try
          dmData.adocon.Execute(Format('DELETE FROM T_DAYWAREHOUSE WHERE I_DATE = ''%s''', [As_Date]));
          while not Eof do
          begin
            ls_SQL := Format('INSERT INTO T_DAYWAREHOUSE VALUES (''%s'', ''%s'', ''%s'', ''%s'', ' +
              '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f)', [As_Date,
              FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_ORIGINAL_NAME').AsString,
              FieldByName('I_UNIT').AsString, FieldByName('I_YESTERDAY_QTY').AsFloat,
              FieldByName('I_IN_QTY').AsFloat, FieldByName('I_OUT_QTY').AsFloat,
              FieldByName('I_ALLOC_IN_QTY').AsFloat, FieldByName('I_ALLOC_OUT_QTY').AsFloat,
              FieldByName('I_LOST_QTY').AsFloat, FieldByName('I_TODAY_QTY').AsFloat,
              FieldByName('I_CALC_USE_QTY').AsFloat, FieldByName('I_REAL_USE_QTY').AsFloat,
              FieldByName('I_DIFFERENCE_QTY').AsFloat, FieldByName('I_DIFFERENCE_QTY').AsFloat]);
            dmData.adocon.Execute(ls_SQL);
            Next;
          end;
          dmData.adocon.CommitTrans;
          AppMsg(Format('%s盘点数据保存完成', [As_Date]), '原料日盘点');
        except
          On E: Exception do
          begin
            AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), '原料日盘点');
            dmData.adocon.RollbackTrans;
            Exit;
          end;
        end;
      end;
    end;
    3:
    begin
      dmData.adocon.BeginTrans;
      try
        dmData.adocon.Execute(Format('DELETE FROM T_DAYWAREHOUSE WHERE I_DATE = ''%s''', [As_Date]));
        dmData.adocon.CommitTrans;
        AppMsg(Format('%s盘点数据删除完成', [As_Date]), '原料日盘点');
      except
        On E: Exception do
        begin
          AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), '原料日盘点');
          dmData.adocon.RollbackTrans;
          Exit;
        end;
      end;
    end;
  end; 
end;

procedure TfrmDayWarerHouseView.atSaveExecute(Sender: TObject); 
var
  ls_Date: String;
begin
  inherited;
  prip_Save(FormatDateTime('YYYY-MM-DD', eStartDate.Date));
  prip_SetControlFalse;          
  if prif_GetLastDate(ls_Date) then
  begin
    eLastDate.Date := StrToDate(ls_Date);
  end else eLastDate.Date := IncDay(Date, -1);
end;

procedure TfrmDayWarerHouseView.memViewBeforePost(DataSet: TDataSet);
begin
  inherited;
  {with memView do
  begin
    memView.FieldValues['I_TODAY_QTY'] := FieldValues['I_TODAY_QTY'];
    memView.FieldValues['I_CALC_USE_QTY'] := FieldValues['I_CALC_USE_QTY'];
    memView.FieldValues['I_REAL_USE_QTY'] := FieldValues['I_REAL_USE_QTY'];
    memView.FieldValues['I_DIFFERENCE_QTY'] := FieldValues['I_DIFFERENCE_QTY'];
    memView.FieldValues['I_DIFFERENCE_COUNT_QTY'] := FieldValues['I_DIFFERENCE_COUNT_QTY'];
  end;}
end;

end.
