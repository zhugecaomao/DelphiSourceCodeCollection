unit ufrmBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxEdLib, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  StdCtrls, Buttons, dxDBELib, DB, ImgList, ADODB, CSADOQuery,
  CSCustomdxDateEdit, CSdxDBDateEdit;

type
  TfrmBase = class(TForm)
    ImageList: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    Rc_MainDataSet: TDataSet;
    Ri_Flag: Integer; // 1新增2修改3删除4保存5取消6//查找
    Rs_Id: String;
    procedure prop_IniData; virtual;
    procedure prop_IniInterFace; virtual;
    procedure prop_SetOnChange(Ac_Control: TControl; NotifyEvent: TNotifyEvent);
  public
    { Public declarations }
    procedure pubp_Ini; overload;
    procedure pubp_Ini(Ac_MainDataSet: TDataSet; Ai_Flag: Integer); overload;
    procedure pubp_Ini(As_Id: String; Ai_Flag: Integer = 1); overload;
  end;

  //通用提示框
  function DispInfo(As_Msg: String; Ai_Flag: Integer = 1): Char;
  //检查数字是否合法
  function CheckNum(As_InNum: String; Ai_Start, Ai_Len: Integer): Boolean;
  //检查货币是否合法
  function CheckCurrency(Af_InValue: String): Boolean;
  //检查日期是否合法
  function CheckDate(As_InDate: String): Boolean;
  //检查时间是否合法
  function CheckTime(As_InTime: String): Boolean;
  //检查输入是否为空
  function CheckNull(As_Value: String): Boolean;
  //检验输入的ID是否重复
  function CheckId(As_Table, As_Field, As_Value: String): Boolean;
  //导出EXCEL
  function ExportExcel(Ac_DxDbGrid: TDxdbGrid): Boolean;
var
  frmBase: TfrmBase;

implementation
uses udmData;   

function ExportExcel(Ac_DxDbGrid: TDxdbGrid): Boolean;
var
  lc_SaveDialog: TSaveDialog;
  ls_File: String;
begin   
  Result := True;
  if (not Ac_DxDbGrid.DataSource.DataSet.Active) or (Ac_DxDbGrid.DataSource.DataSet.IsEmpty) then
  begin
    DispInfo('当前无数据,不能执行导出操作');
    Result := False;
    Exit;
  end;
  lc_SaveDialog := TSaveDialog.Create(nil);
  try
    lc_SaveDialog.Filter := 'Excel表格文件 (*.xls)|*.XLS';
    if lc_SaveDialog.Execute then
    begin
      ls_File := lc_SaveDialog.FileName;
    end;
    if Length(ls_File) <> 0 then
    begin
      Ac_DxDbGrid.SaveToXLS(ls_File + '.xls', True);
    end else
    begin
      Result := False;
    end;
  finally
    lc_SaveDialog.Free;
  end;
end;
function CheckId(As_Table, As_Field, As_Value: String): Boolean;
var
  lc_DataSet: TCSADOQuery;
begin
  lc_DataSet := TCSADOQuery.Create(nil);
  try
    lc_DataSet.Connection := dmData.adocon;
    lc_DataSet.SQL.Text := Format('SELECT %s FROM %s WHERE %s = ''%s''', [As_Field, As_Table, As_Field,
      As_Value]);
    lc_DataSet.Open;
    if lc_DataSet.IsEmpty then Result := True else Result := False;
  finally
    lc_DataSet.Free;
  end;
end;
function CheckNull(As_Value: String): Boolean;
begin
  if Length(Trim(As_Value)) = 0 then
  begin
    DispInfo('系统不接受空字符');
    Result := False;
  end else Result := True;
end;

function CheckDate(As_InDate: String): Boolean;
begin
  try
    StrToDate(As_InDate);
    Result := True;
  except
    DispInfo('输入的日期不合法');
    Result := False;
  end;
end;

function CheckTime(As_InTime: String): Boolean;
begin
  try
    StrToTime(As_InTime);
    Result := True;
  except
    DispInfo('输入的时间不合法');
    Result := False;
  end;
end;

function DispInfo(As_Msg: String; Ai_Flag: Integer): Char;
begin
  Result := ' ';
  Case Ai_Flag of
    1:
    begin
      Application.MessageBox(PChar(As_Msg), '系统提示', MB_OK + MB_ICONWARNING);
    end;
    2:
    begin
      Application.MessageBox(PChar(As_Msg), '系统提示', MB_OK + MB_ICONINFORMATION);
    end;
    3:
    begin
      if Application.MessageBox(PChar(As_Msg), '系统提示', MB_YESNO + MB_ICONQUESTION) = IDYES then
      Result := 'y' else Result := 'n';
    end;
    else
    begin
      Application.MessageBox(PChar(As_Msg), '系统提示', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

function CheckNum(As_InNum: String; Ai_Start, Ai_Len: Integer): Boolean;
var
  li_I: Integer;
begin
  if Length(Trim(As_InNum)) = 0 then
  begin
    DispInfo('输入的数字为空');
    Result := False;
    Exit;
  end;
  if Ai_Len < Length(As_InNum) - 1 - Ai_Start then
  begin
    DispInfo('输入的数字长度过大');
    Result := False;
    Exit;
  end;
  for li_I := Ai_Start to Ai_Start + Ai_Len do
  begin
    if not (As_InNum[li_I] in ['0'..'9']) then
    begin
      DispInfo('输入的数字不合法');
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function CheckCurrency(Af_InValue: String): Boolean;
begin
  try
    StrToCurr(Af_InValue);
    Result := True;
  except
    DispInfo('输入的金额不合法');
    Result := False;
  end;
end;

{$R *.dfm}
procedure TfrmBase.FormActivate(Sender: TObject);
begin
  Repaint;
end;

procedure TfrmBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN:
    begin
      if ActiveControl is TdxEdit then
      begin
        SelectNext(ActiveControl, True, True); 
        Exit;
      end;      
      if ActiveControl is TdxDBEdit then
      begin
        SelectNext(ActiveControl, True, True); 
        Exit;
      end;
      if ActiveControl is TdxDBGrid then
      begin
        if not TdxDBGrid(ActiveControl).DataSource.DataSet.Eof then
          TdxDBGrid(ActiveControl).DataSource.DataSet.Next else
          TdxDBGrid(ActiveControl).DataSource.DataSet.First;
      end;
      if ActiveControl is TBitBtn then
      begin
        TBitBtn(ActiveControl).Click; 
        Exit;
      end;
      if ActiveControl is TdxDBEdit then
      begin
        SelectNext(ActiveControl, True, True);  
        Exit;
      end;
      if ActiveControl is TdxDBButtonEdit then
      begin
        if TdxDBButtonEdit(ActiveControl).Buttons.Count > 0 then
        begin
          if Assigned(TdxDBButtonEdit(ActiveControl).OnButtonClick) then
            TdxDBButtonEdit(ActiveControl).OnButtonClick(ActiveControl, 0) else
            SelectNext(ActiveControl, True, True);
        end;
      end;
      if ActiveControl is TdxButtonEdit then
      begin
        TdxButtonEdit(ActiveControl).OnButtonClick(ActiveControl, 0);
        Exit;
      end;      
      if ActiveControl is TdxPickEdit then
      begin
        SelectNext(ActiveControl, True, True);
        Exit;
      end;
      if ActiveControl is TdxCurrencyEdit then
      begin
        SelectNext(ActiveControl, True, True);
        Exit;
      end;   
      if ActiveControl is TdxCheckEdit then
      begin
        SelectNext(ActiveControl, True, True);
        Exit;
      end;
      if ActiveControl is TdxDBCurrencyEdit then
      begin
        SelectNext(ActiveControl, True, True);
        Exit;
      end;
      if ActiveControl is TCSdxDBDateEdit then
      begin
        SelectNext(ActiveControl, True, True);  
        Exit;
      end;
      if ActiveControl is TdxDBSpinEdit then
      begin
        SelectNext(ActiveControl, True, True); 
        Exit;
      end;
      if ActiveControl is TdxDBPickEdit then
      begin
        SelectNext(ActiveControl, True, True);
        Exit;
      end;    
      if ActiveControl is TdxDateEdit then
      begin
        SelectNext(ActiveControl, True, True);
        Exit;
      end;
    end;
  end;
end;

procedure TfrmBase.prop_IniData;
begin

end;

procedure TfrmBase.prop_IniInterFace;
begin

end;

procedure TfrmBase.pubp_Ini;
begin
  prop_IniData;
  prop_IniInterFace;
end;

procedure TfrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then Key := #0;
end;

procedure TfrmBase.pubp_Ini(Ac_MainDataSet: TDataSet; Ai_Flag: Integer);
begin
  Rc_MainDataSet := Ac_MainDataSet;
  Ri_Flag := Ai_Flag;
  prop_IniData;
  prop_IniInterFace;
end;

procedure TfrmBase.prop_SetOnChange(Ac_Control: TControl;
  NotifyEvent: TNotifyEvent);
begin
  if Ac_Control is TdxEdit then
  begin
    TdxEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxDBEdit then
  begin
    TdxDBEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxPickEdit then
  begin
    TdxPickEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxDateEdit then
  begin
    TdxDateEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxCheckEdit then
  begin
    TdxCheckEdit(Ac_Control).OnChange := NotifyEvent;
  end;    
  if Ac_Control is TdxDBCheckEdit then
  begin
    TdxDBCheckEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxButtonEdit then
  begin
    TdxButtonEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxSpinEdit then
  begin
    TdxSpinEdit(Ac_Control).OnChange := NotifyEvent;
  end;      
  if Ac_Control is TdxDBSpinEdit then
  begin
    TdxDBSpinEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxCurrencyEdit then
  begin
    TdxCurrencyEdit(Ac_Control).OnChange := NotifyEvent;
  end;        
  if Ac_Control is TdxDBCurrencyEdit then
  begin
    TdxDBCurrencyEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxDBSpinEdit then
  begin
    TdxDBSpinEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxDBPickEdit then
  begin
    TdxDBPickEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TCSdxDBDateEdit then
  begin
    TCSdxDBDateEdit(Ac_Control).OnChange := NotifyEvent;
  end;
  if Ac_Control is TdxDBButtonEdit then
  begin
    TdxDBButtonEdit(Ac_Control).OnChange := NotifyEvent;
  end;
end;

procedure TfrmBase.pubp_Ini(As_Id: String; Ai_Flag: Integer);
begin
  Rs_Id := As_Id;  
  Ri_Flag := Ai_Flag;
  prop_IniData;
  prop_IniInterFace;
end;

end.
