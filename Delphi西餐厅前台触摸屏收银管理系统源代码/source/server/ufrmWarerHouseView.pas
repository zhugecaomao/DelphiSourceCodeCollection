unit ufrmWarerHouseView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  ExtCtrls, dxEditor, dxEdLib, StdCtrls, Buttons, dxmdaset;

type
  TfrmWarerHouseView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Label1: TLabel;
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
    labWeek: TLabel;
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure bbtnStartClick(Sender: TObject);
    procedure atCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atSaveExecute(Sender: TObject);
    procedure memViewBeforePost(DataSet: TDataSet);
    procedure eEndDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Fi_Act, Fi_Id, Fi_Week: Integer;
    function prif_GetLastDate(var As_Date: String): Boolean;
    procedure prip_GetDayWarerHouse(As_LastDate, As_Date: String);
    procedure prip_GetWeekWarerHouse(As_LastDate, As_StartDate, As_Date: String);
    procedure prip_GetMonthWarerHouse(As_LastDate, As_StartDate, As_Date: String);
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
  TpfrmWarerHouseView = ^TfrmWarerHouseView;
var
  frmWeekWarerHouseView, frmMonthWarerHouseView, frmDayWarerHouseView: TfrmWarerHouseView;

implementation

uses udmData, StrUtils, DateUtils, upubCommon;

{$R *.dfm}

procedure TfrmWarerHouseView.prop_IniData;
var
  ls_Date: String;
begin
  inherited;       
  eEndDate.Date := Date;
  Fi_Week := GetDayOfWeek(eEndDate.Date, ls_Date);
  labWeek.Caption := ls_Date;
  Fi_Id := StrToIntDef(Rs_Id, 1);
  case Fi_Id of
    1:
    begin
      if prif_GetLastDate(ls_Date) then
      begin
        eLastDate.Date := StrToDate(ls_Date);
      end else eLastDate.Date := IncDay(Date, -1);
    end;
    2:
    begin
      if prif_GetLastDate(ls_Date) then
      begin
        eLastDate.Date := StrToDate(ls_Date);
      end else begin
        eLastDate.Date := IncDay(Date, -7);
      end;
    end;
    3:
    begin
      if prif_GetLastDate(ls_Date) then
      begin
        eLastDate.Date := StrToDate(ls_Date);
      end else begin
        eLastDate.Date := StartOfTheMonth(Date);
      end;
    end;
  end;
end;

procedure TfrmWarerHouseView.prop_IniInterFace;
begin
  inherited;
  case Fi_Id of
    1:
    begin
      Caption := '原料日盘点';
      grdList.ColumnByFieldName('I_YESTERDAY_QTY').Caption := '昨日盘点数量';
      grdList.ColumnByFieldName('I_TODAY_QTY').Caption := '今日盘点数量';
    end;
    2:
    begin
      Caption := '原料周盘点';     
      grdList.ColumnByFieldName('I_YESTERDAY_QTY').Caption := '上周盘点数量';
      grdList.ColumnByFieldName('I_TODAY_QTY').Caption := '本周盘点数量';
    end;
    3:
    begin
      Caption := '原料月盘点'; 
      grdList.ColumnByFieldName('I_YESTERDAY_QTY').Caption := '上月盘点数量';
      grdList.ColumnByFieldName('I_TODAY_QTY').Caption := '本月盘点数量';
    end;
  end;
  WindowState := wsMaximized;
  prip_SetControlFalse;
end;  

function TfrmWarerHouseView.prif_GetLastDate(
  var As_Date: String): Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT MAX(I_DATE) AS I_DATE FROM T_DAYWAREHOUSE WHERE I_FLAG = %d' ,[Fi_Id]);
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

procedure TfrmWarerHouseView.atNewExecute(Sender: TObject);
begin
  inherited;   
  prip_SetControlFalse;
  case Fi_Id of
    1:
    begin
      Fi_Act := 1;
      eEndDate.Date := IncDay(eLastDate.Date, 1);
      eEndDate.Enabled := True;
      bbtnStart.Enabled := True;
      bbtnStart.Caption := '开始盘点';
      chbAuto.Visible := True;
      chbAuto.Enabled := True;
      eEndDate.SetFocus;
    end;  
    2:
    begin
      Fi_Act := 1;
      eEndDate.Date := IncDay(eLastDate.Date, 7);
      bbtnStart.Enabled := True;
      bbtnStart.Caption := '开始盘点'; 
      eEndDate.Enabled := True;
      chbAuto.Visible := True;
      chbAuto.Enabled := True;
      eEndDate.SetFocus;
    end; 
    3:
    begin
      Fi_Act := 1;
      eEndDate.Date := EndOfTheMonth(IncDay(eLastDate.Date, 1));
      bbtnStart.Enabled := True;
      bbtnStart.Caption := '开始盘点';
      eEndDate.Enabled := True;
      chbAuto.Visible := True;
      chbAuto.Enabled := True;
      eEndDate.SetFocus;
    end;
  end;
end;

procedure TfrmWarerHouseView.atEditExecute(Sender: TObject);
begin
  inherited;  
  prip_SetControlFalse;
  Fi_Act := 2;
  eEndDate.Enabled := True;
  bbtnStart.Enabled := True;
  bbtnStart.Enabled := True;
  bbtnStart.Caption := '开始查询';  
  bbtnEditQty.Enabled := True;
  eEndDate.SetFocus;
end;

procedure TfrmWarerHouseView.atDelExecute(Sender: TObject);
begin
  inherited;
  prip_SetControlFalse;
  Fi_Act := 3;
  eEndDate.Date := eLastDate.Date;
  bbtnStart.Enabled := True;
  bbtnStart.Enabled := True;
  bbtnStart.Caption := '开始查询';  
  bbtnStart.SetFocus;
end;

procedure TfrmWarerHouseView.prip_GetDayWarerHouse(As_LastDate, As_Date: String);
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
            '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %d)', [As_Date,
            FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_ORIGINAL_NAME').AsString,
            FieldByName('I_UNIT').AsString, FieldByName('I_YESTERDAY_QTY').AsFloat,
            FieldByName('I_IN_QTY').AsFloat, FieldByName('I_OUT_QTY').AsFloat,
            FieldByName('I_ALLOC_IN_QTY').AsFloat, FieldByName('I_ALLOC_OUT_QTY').AsFloat,
            FieldByName('I_LOST_QTY').AsFloat, FieldByName('I_TODAY_QTY').AsFloat,
            FieldByName('I_CALC_USE_QTY').AsFloat, FieldByName('I_REAL_USE_QTY').AsFloat,
            FieldByName('I_DIFFERENCE_QTY').AsFloat, FieldByName('I_DIFFERENCE_QTY').AsFloat, Fi_Id]);
          dmData.adocon.BeginTrans;
          try
            dmData.adocon.Execute(ls_SQL);
            dmData.adocon.CommitTrans;
          except
            On E: Exception do
            begin
              AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), Caption);
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

function TfrmWarerHouseView.prif_CanGetData: Boolean;
var
  ls_EndDate: String;
  li_Week: Integer;
begin
  case Fi_Act of
    1:
    begin
      case Fi_Id of
        1:
        begin
          if eEndDate.Date <= eLastDate.Date then
          begin
            Result := False;
            AppMsg('盘点开始日期不能小于或等于最后盘点日期' + #13 + #10 + '如果您需要重新盘点' +
              '请将已经盘点的数据删除', Caption);
            Exit;
          end; 
          if (IncDay(eLastDate.Date, 1) <> eEndDate.Date) and (not chbAuto.Checked)then
          begin
            Result := False;
            AppMsg('你选择了对多日数据进行盘点，必须使用自动保存!' + #13 + #10, Caption);
            Exit;
          end; 
        end;
        2:
        begin    
          li_Week := GetDayOfWeek(eEndDate.Date, ls_EndDate);
          if li_Week <> 1 then
          begin
            Result := False;
            AppMsg('您输入的日期不是周末！', Caption);
            Exit;
          end;
          if eEndDate.Date <= eLastDate.Date then
          begin
            Result := False;
            AppMsg('您输入的日期不能小于或等于最后的周盘点日期！' + #13 + #10 + '如果您需要重新盘点' +
              '请将已经盘点的数据删除', Caption);
            Exit;
          end;
          if (IncDay(eEndDate.Date, -7) > eLastDate.Date) and (not chbAuto.Checked) then
          begin
            Result := False;
            AppMsg('你选择了对多周进行盘点，必须使用自动保存！', Caption);
            Exit;
          end;
        end;
        3:
        begin
          if EndOfTheMonth(eEndDate.Date) <> eEndDate.Date then
          begin
            Result := False;
            AppMsg('您输入的日期不是月末！', Caption);
            Exit;
          end;
          if eEndDate.Date <= eLastDate.Date then
          begin
            Result := False;
            AppMsg('您输入的日期不能小于或等于最后的月盘点日期！' + #13 + #10 + '如果您需要重新盘点' +
              '请将已经盘点的数据删除', Caption);
            Exit;
          end; 
          if (IncDay(StartOfTheMonth(eEndDate.Date), -1) > eLastDate.Date) and (not chbAuto.Checked) then
          begin
            Result := False;
            AppMsg('你选择了对多周进行盘点，必须使用自动保存！', Caption);
            Exit;
          end;
        end;
      end;
    end;    
  end;
  Result := True;
end;

procedure TfrmWarerHouseView.bbtnStartClick(Sender: TObject);
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
      case Fi_Id of //1是盘点2周盘点3月盘点
        1:
        begin
          Application.ProcessMessages;
          repeat
            prip_GetDayWarerHouse(ls_LastDate, FormatDateTime('YYYY-MM-DD', IncDay(eLastDate.Date, 1)));
            if chbAuto.Checked then
            begin
              if prif_GetLastDate(ls_LastDate) then eLastDate.Date := StrToDate(ls_LastDate);
              ls_LastDate := FormatDateTime('YYYY-MM-DD', eLastDate.Date);
            end else
            begin
              eLastDate.Date := IncDay(eLastDate.Date, 1);
              ls_LastDate := FormatDateTime('YYYY-MM-DD', eLastDate.Date);
            end;
            labState.Caption := Format('正在盘点%s的数据',
             [FormatDateTime('YYYY-MM-DD', eLastDate.Date)]);
          until ls_LastDate >= FormatDateTime('YYYY-MM-DD', eEndDate.Date);
          if not chbAuto.Checked then
          begin
            if prif_GetLastDate(ls_LastDate) then
            begin
              eLastDate.Date := StrToDate(ls_LastDate);
            end else eLastDate.Date := IncDay(Date, -1);
          end;
        end;
        2:
        begin
          Application.ProcessMessages;
          repeat
            prip_GetWeekWarerHouse(ls_LastDate, FormatDateTime('YYYY-MM-DD', IncDay(eLastDate.Date, 1)),
              FormatDateTime('YYYY-MM-DD', IncDay(eLastDate.Date, 7)));
            if chbAuto.Checked then
            begin
              if prif_GetLastDate(ls_LastDate) then eLastDate.Date := StrToDate(ls_LastDate);
              ls_LastDate := FormatDateTime('YYYY-MM-DD', eLastDate.Date);
            end else
            begin
              eLastDate.Date := IncDay(eLastDate.Date, 7);
              ls_LastDate := FormatDateTime('YYYY-MM-DD', eLastDate.Date);
            end;
            labState.Caption := Format('正在盘点%s的数据',
             [FormatDateTime('YYYY-MM-DD', eLastDate.Date)]);
          until ls_LastDate >= FormatDateTime('YYYY-MM-DD', eEndDate.Date);
          if not chbAuto.Checked then
          begin
            if prif_GetLastDate(ls_LastDate) then
            begin
              eLastDate.Date := StrToDate(ls_LastDate);
            end else eLastDate.Date := IncDay(Date, -1);
          end;
        end;
        3:
        begin
          Application.ProcessMessages;
          repeat
            prip_GetMonthWarerHouse(ls_LastDate, FormatDateTime('YYYY-MM-DD',
              StartOfTheMonth(IncDay(eLastDate.Date, 1))),
              FormatDateTime('YYYY-MM-DD', EndOfTheMonth(eLastDate.Date)));
            if chbAuto.Checked then
            begin
              if prif_GetLastDate(ls_LastDate) then eLastDate.Date := StrToDate(ls_LastDate);
              ls_LastDate := FormatDateTime('YYYY-MM-DD', eLastDate.Date);
            end else
            begin
              eLastDate.Date := IncDay(EndOfTheMonth(eLastDate.Date), 1);
              ls_LastDate := FormatDateTime('YYYY-MM-DD', eLastDate.Date);
            end;
            labState.Caption := Format('正在盘点%s的数据',
             [FormatDateTime('YYYY-MM-DD', eLastDate.Date)]);
          until ls_LastDate >= FormatDateTime('YYYY-MM-DD', eEndDate.Date);
          if not chbAuto.Checked then
          begin
            if prif_GetLastDate(ls_LastDate) then
            begin
              eLastDate.Date := StrToDate(ls_LastDate);
            end else eLastDate.Date := IncDay(Date, -1);
          end;
        end;
      end;
    end;
    2..3:
    begin
      prip_GetEidtDayWarerHouse(FormatDateTime('YYYY-MM-DD', eEndDate.Date));
    end;
  end;
end;

procedure TfrmWarerHouseView.atCancelExecute(Sender: TObject);
begin
  inherited;
  prip_SetControlFalse;
end;

procedure TfrmWarerHouseView.prip_SetControlFalse;
begin 
  eEndDate.Enabled := False;
  eOriginal.Enabled := False;
  bbtnStart.Enabled := False;
  bbtnEditQty.Enabled := False;
  eRealUseQty.Enabled := False;
  chbAuto.Visible := False;
  chbAuto.Enabled := False;
  if memView.Active then memView.Close;
end;

procedure TfrmWarerHouseView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited; 
  if Self = frmWeekWarerHouseView then frmWeekWarerHouseView := nil;
  if Self = frmMonthWarerHouseView then frmMonthWarerHouseView := nil; 
  if Self = frmDayWarerHouseView then frmDayWarerHouseView := nil;
  //frmWarerHouseView := nil;
end;

procedure TfrmWarerHouseView.prip_GetEidtDayWarerHouse(As_Date: String); 
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_DAYWAREHOUSE WHERE I_DATE = ''%s'' AND I_FLAG = %d',
      [As_Date, Fi_Id]);
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
    end else AppMsg('没有找到数据', Caption);
  end;
end;

procedure TfrmWarerHouseView.prip_Save(As_Date: String);
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
          while not Eof do
          begin    
            dmData.adocon.Execute(Format('DELETE FROM T_DAYWAREHOUSE WHERE I_DATE = ''%s'' AND ' +
              ' I_ORIGINAL_CD = ''%s'' AND I_FLAG = %d',
              [FieldByName('I_DATE').AsString, FieldByName('I_ORIGINAL_CD').AsString, Fi_Id]));
            ls_SQL := Format('INSERT INTO T_DAYWAREHOUSE VALUES (''%s'', ''%s'', ''%s'', ''%s'', ' +
              '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %d)', [FieldByName('I_DATE').AsString,
              FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_ORIGINAL_NAME').AsString,
              FieldByName('I_UNIT').AsString, FieldByName('I_YESTERDAY_QTY').AsFloat,
              FieldByName('I_IN_QTY').AsFloat, FieldByName('I_OUT_QTY').AsFloat,
              FieldByName('I_ALLOC_IN_QTY').AsFloat, FieldByName('I_ALLOC_OUT_QTY').AsFloat,
              FieldByName('I_LOST_QTY').AsFloat, FieldByName('I_TODAY_QTY').AsFloat,
              FieldByName('I_CALC_USE_QTY').AsFloat, FieldByName('I_REAL_USE_QTY').AsFloat,
              FieldByName('I_DIFFERENCE_QTY').AsFloat, FieldByName('I_DIFFERENCE_QTY').AsFloat, Fi_Id]);
            dmData.adocon.Execute(ls_SQL);
            Next;
          end;
          dmData.adocon.CommitTrans;
          AppMsg(Format('%s盘点数据保存完成', [As_Date]), Caption, 1);
        except
          On E: Exception do
          begin
            AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), Caption);
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
        AppMsg(Format('%s盘点数据删除完成', [As_Date]), Caption, 1);
      except
        On E: Exception do
        begin
          AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), Caption);
          dmData.adocon.RollbackTrans;
          Exit;
        end;
      end;
    end;
  end; 
end;

procedure TfrmWarerHouseView.atSaveExecute(Sender: TObject); 
var
  ls_Date: String;
begin
  inherited;
  prip_Save(FormatDateTime('YYYY-MM-DD', eEndDate.Date));
  prip_SetControlFalse;
  if prif_GetLastDate(ls_Date) then
  begin
    eLastDate.Date := StrToDate(ls_Date);
  end else eLastDate.Date := IncDay(Date, -1);
end;

procedure TfrmWarerHouseView.memViewBeforePost(DataSet: TDataSet);
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

procedure TfrmWarerHouseView.prip_GetWeekWarerHouse(As_LastDate, As_StartDate,
  As_Date: String);
var
  ls_SQL: String;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getWeekOriginal ''%s'', ''%s'', ''%s''', [As_LastDate, As_StartDate,
      As_Date]);
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
            '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %d)', [As_Date,
            FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_ORIGINAL_NAME').AsString,
            FieldByName('I_UNIT').AsString, FieldByName('I_YESTERDAY_QTY').AsFloat,
            FieldByName('I_IN_QTY').AsFloat, FieldByName('I_OUT_QTY').AsFloat,
            FieldByName('I_ALLOC_IN_QTY').AsFloat, FieldByName('I_ALLOC_OUT_QTY').AsFloat,
            FieldByName('I_LOST_QTY').AsFloat, FieldByName('I_TODAY_QTY').AsFloat,
            FieldByName('I_CALC_USE_QTY').AsFloat, FieldByName('I_REAL_USE_QTY').AsFloat,
            FieldByName('I_DIFFERENCE_QTY').AsFloat, FieldByName('I_DIFFERENCE_QTY').AsFloat, Fi_Id]);
          dmData.adocon.BeginTrans;
          try
            dmData.adocon.Execute(ls_SQL);
            dmData.adocon.CommitTrans;
          except
            On E: Exception do
            begin
              AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), Caption);
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

procedure TfrmWarerHouseView.eEndDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ls_Week: String;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    case Fi_Id of
      2:
      begin
        Fi_Week := GetDayOfWeek(eEndDate.Date, ls_Week);
      end;
    end;
  end;
end;

procedure TfrmWarerHouseView.prip_GetMonthWarerHouse(As_LastDate,
  As_StartDate, As_Date: String);
var
  ls_SQL: String;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getMonthOriginal ''%s'', ''%s'', ''%s''', [As_LastDate, As_StartDate,
      As_Date]);
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
            '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %d)', [As_Date,
            FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_ORIGINAL_NAME').AsString,
            FieldByName('I_UNIT').AsString, FieldByName('I_YESTERDAY_QTY').AsFloat,
            FieldByName('I_IN_QTY').AsFloat, FieldByName('I_OUT_QTY').AsFloat,
            FieldByName('I_ALLOC_IN_QTY').AsFloat, FieldByName('I_ALLOC_OUT_QTY').AsFloat,
            FieldByName('I_LOST_QTY').AsFloat, FieldByName('I_TODAY_QTY').AsFloat,
            FieldByName('I_CALC_USE_QTY').AsFloat, FieldByName('I_REAL_USE_QTY').AsFloat,
            FieldByName('I_DIFFERENCE_QTY').AsFloat, FieldByName('I_DIFFERENCE_QTY').AsFloat, Fi_Id]);
          dmData.adocon.BeginTrans;
          try
            dmData.adocon.Execute(ls_SQL);
            dmData.adocon.CommitTrans;
          except
            On E: Exception do
            begin
              AppMsg(Format('%s盘点数据出错,出错信息:%s', [As_Date, E.Message]), Caption);
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

end.
