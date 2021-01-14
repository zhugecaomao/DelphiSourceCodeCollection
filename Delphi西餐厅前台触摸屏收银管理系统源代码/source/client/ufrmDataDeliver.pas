unit ufrmDataDeliver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, CSADOQuery, ComCtrls;

type
  TfrmDataDeliver = class(TForm)
    bbtnDownEmp: TBitBtn;
    bbtnDownMachines: TBitBtn;
    ClientEmpq: TCSADOQuery;
    ServerEmpq: TCSADOQuery;
    ClientMachinesq: TCSADOQuery;
    ServerMachinesq: TCSADOQuery;
    bbtnDownSale: TBitBtn;
    bbtnDownPosParam: TBitBtn;
    bbtnUpTradeInfo: TBitBtn;
    bbtnExit: TBitBtn;
    AdoServer: TADOConnection;
    AdoClient: TADOConnection;
    SysUserClientq: TCSADOQuery;
    SysUserServerq: TCSADOQuery;
    ServerEmpqI_SHOP_CD: TStringField;
    ServerEmpqI_EMP_CD: TStringField;
    ServerEmpqI_EMP_NAME: TStringField;
    ServerEmpqI_EMP_JOB: TStringField;
    ServerEmpqI_EMP_POWER_CD: TStringField;
    ServerEmpqI_UNLOCK: TBooleanField;
    ServerEmpqI_CHANGE: TBooleanField;
    ServerEmpqI_DELETE: TBooleanField;
    ServerEmpqI_OUTDISCOUNT: TBooleanField;
    ServerEmpqI_POS_SET: TBooleanField;
    ServerEmpqI_BEGINNING: TBooleanField;
    ServerEmpqI_EXIT: TBooleanField;
    ServerEmpqI_DATETIME: TBooleanField;
    ClientEmpqI_SHOP_CD: TStringField;
    ClientEmpqI_EMP_CD: TStringField;
    ClientEmpqI_EMP_NAME: TStringField;
    ClientEmpqI_EMP_JOB: TStringField;
    ClientEmpqI_EMP_POWER_CD: TStringField;
    ClientEmpqI_UNLOCK: TBooleanField;
    ClientEmpqI_CHANGE: TBooleanField;
    ClientEmpqI_DELETE: TBooleanField;
    ClientEmpqI_OUTDISCOUNT: TBooleanField;
    ClientEmpqI_POS_SET: TBooleanField;
    ClientEmpqI_BEGINNING: TBooleanField;
    ClientEmpqI_EXIT: TBooleanField;
    ClientEmpqI_DATETIME: TBooleanField;
    SysUserClientquser_id: TStringField;
    SysUserClientquser_name: TStringField;
    SysUserClientqpassword: TStringField;
    SysUserClientqcreate_time: TDateTimeField;
    SysUserClientqmodify_time: TDateTimeField;
    SysUserServerquser_id: TStringField;
    SysUserServerquser_name: TStringField;
    SysUserServerqpassword: TStringField;
    SysUserServerqcreate_time: TDateTimeField;
    SysUserServerqmodify_time: TDateTimeField;
    ProbEmp: TProgressBar;
    ProbMachines: TProgressBar;
    ProbPosParam: TProgressBar;
    ProbSale: TProgressBar;
    ProbTradeInfo: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ClientPosParamq: TCSADOQuery;
    ServerPosParamq: TCSADOQuery;
    ServerSaleItemq: TCSADOQuery;
    ClientSaleItemq: TCSADOQuery;
    ServerSaleq: TCSADOQuery;
    ClientSaleq: TCSADOQuery;
    ClientSaleItemqI_ITEM_CD: TStringField;
    ClientSaleItemqI_ITEM_NAME: TStringField;
    ClientSaleItemqI_ITEM_COLOR: TStringField;
    ServerSaleItemqI_ITEM_CD: TStringField;
    ServerSaleItemqI_ITEM_NAME: TStringField;
    ServerSaleItemqI_ITEM_COLOR: TStringField;
    ServerSaleqI_SALE_CD: TStringField;
    ServerSaleqI_SALE_NAME: TStringField;
    ServerSaleqI_PRICE: TBCDField;
    ServerSaleqI_UNIT: TStringField;
    ServerSaleqI_SALE_ITEM_CD: TStringField;
    ServerSaleqI_FIX_SALE: TBooleanField;
    ServerSaleqI_SALE_RECORD: TBooleanField;
    ServerSaleqI_OTHER_RECORD: TBooleanField;
    ServerSaleqI_HELPER_CODE: TStringField;
    ServerSaleqI_LSM: TBooleanField;
    ServerSaleqI_COST: TBCDField;
    ClientSaleqI_SALE_CD: TStringField;
    ClientSaleqI_SALE_NAME: TStringField;
    ClientSaleqI_PRICE: TBCDField;
    ClientSaleqI_UNIT: TStringField;
    ClientSaleqI_SALE_ITEM_CD: TStringField;
    ClientSaleqI_FIX_SALE: TBooleanField;
    ClientSaleqI_SALE_RECORD: TBooleanField;
    ClientSaleqI_OTHER_RECORD: TBooleanField;
    ClientSaleqI_HELPER_CODE: TStringField;
    ClientSaleqI_LSM: TBooleanField;
    ClientSaleqI_COST: TBCDField;
    ClientLSMq: TCSADOQuery;
    ServerLSMq: TCSADOQuery;
    ServerTradeInfoq: TCSADOQuery;
    ClientTradeInfoq: TCSADOQuery;
    ClientTradeDetailq: TCSADOQuery;
    ServerTradeDetailq: TCSADOQuery;
    ClientOnLineq: TCSADOQuery;
    ClientOnLineqI_MACHINES_CD: TStringField;
    ClientOnLineqI_LOGIN_CD: TStringField;
    ClientOnLineqI_DATE: TStringField;
    ClientOnLineqI_TIME: TStringField;
    ClientOnLineqI_WORK_CD: TStringField;
    ClientOnLineqI_AMOUNT: TBCDField;
    ClientOnLineqI_FLAG: TIntegerField;
    ServerOnLineq: TCSADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    BCDField1: TBCDField;
    IntegerField1: TIntegerField;
    procedure bbtnExitClick(Sender: TObject);
    procedure bbtnDownEmpClick(Sender: TObject);
    procedure bbtnDownMachinesClick(Sender: TObject);
    procedure bbtnDownPosParamClick(Sender: TObject);
    procedure bbtnDownSaleClick(Sender: TObject);
    procedure bbtnUpTradeInfoClick(Sender: TObject);
  private
    function prif_Connect: Boolean;
    procedure prip_IniInterFace;
    procedure prip_IniData;
    procedure prip_DownEmpInfo;
    procedure prip_DownMachinesInfo;
    procedure prip_DownSaleInfo;
    procedure prip_UpTradeInfo;
  public
    procedure pubp_Ini;
  end;

var
  frmDataDeliver: TfrmDataDeliver;

implementation
uses IniFiles;
{$R *.dfm}

{ TfrmDataDeliver }

procedure TfrmDataDeliver.prip_IniData;
var
  lb_Connect: Boolean;
begin
  lb_Connect := prif_Connect;
  bbtnDownEmp.Enabled := lb_Connect;
  bbtnDownMachines.Enabled := lb_Connect;
  bbtnDownPosParam.Enabled := lb_Connect;
  bbtnDownSale.Enabled := lb_Connect;
  bbtnUpTradeInfo.Enabled := lb_Connect; 
end;

procedure TfrmDataDeliver.prip_IniInterFace;
begin
  WindowState := wsMaximized;
end;

procedure TfrmDataDeliver.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmDataDeliver.bbtnExitClick(Sender: TObject);
begin
  Close;
end;

function TfrmDataDeliver.prif_Connect: Boolean;
var
  ls_ConClientStr, ls_ConServerStr, ls_AppPath, ls_DBMS, ls_DBDRV: string;
  lc_DatFile: TIniFile;
begin
  ls_AppPath := ExtractFilePath(Application.ExeName);
  if not FileExists(ls_AppPath + 'connset.dat') then
  begin
    Result := False;
    Application.MessageBox('数据库连接配置文件丢失', PChar(Application.Title),
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  lc_DatFile := TIniFile.Create(ls_AppPath + 'connset.dat');
  with lc_DatFile do
  begin
    ls_DBMS := Readstring('SETUP', 'DBMS', '');
    ls_DBDRV := Readstring('SETUP', 'DBDRV', '');
    ls_ConServerStr := Readstring('SETUP', 'CONSTRNET', '');
    ls_ConServerStr := stringReplace(ls_ConServerStr, '%PWD%', '', [rfReplaceAll, rfIgnoreCase]);
    ls_ConClientStr := Readstring('SETUP', 'CONSTRLOCAL', '');
    ls_ConClientStr := stringReplace(ls_ConClientStr, '%PWD%', '1234567890abc', [rfReplaceAll, rfIgnoreCase]);    //ShowMessage(ls_ConStr);
    Free;
  end;
  if (ls_DBMS = '') or (ls_DBDRV = '') or (ls_ConServerStr = '') or (ls_ConClientStr = '') then
  begin
    Result := False;
    Application.MessageBox('数据库连接配置文件损坏', PChar(Application.Title),
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  try
    with AdoClient do
    begin
      if Connected then Close;
      Connectionstring := ls_ConClientStr;
      Open;
    end;    
    with AdoServer do
    begin
      if Connected then Close;
      Connectionstring := ls_ConServerStr;
      Open;
    end;
    Result := AdoClient.Connected and AdoServer.Connected;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(E.Message), PChar(Application.Title),
        MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrmDataDeliver.prip_DownEmpInfo;
begin
  with ServerEmpq do
  begin
    if Active then Close;
    Connection := AdoServer;
    SQL.Text := 'SELECT * FROM T_EMPLOYEE_MS';
    Open;
  end;
  if not ServerEmpq.IsEmpty then
  begin
    ProbEmp.Max := ServerEmpq.RecordCount;
    ServerEmpq.First;
    AdoClient.BeginTrans;
    try
      AdoClient.Execute('DELETE FROM T_EMPLOYEE_MS');
      with ClientEmpq do
      begin
        if Active then Close;
        Connection := AdoClient;
        SQL.Text := 'SELECT * FROM T_EMPLOYEE_MS';
        Open;
        while not ServerEmpq.Eof do
        begin
          Append;
          FieldByName('I_SHOP_CD').AsString := ServerEmpq.FieldByName('I_SHOP_CD').AsString;
          FieldByName('I_EMP_CD').AsString := ServerEmpq.FieldByName('I_EMP_CD').AsString;
          FieldByName('I_EMP_NAME').AsString := ServerEmpq.FieldByName('I_EMP_NAME').AsString;
          FieldByName('I_EMP_JOB').AsString := ServerEmpq.FieldByName('I_EMP_JOB').AsString;
          FieldByName('I_EMP_POWER_CD').AsString := ServerEmpq.FieldByName('I_EMP_POWER_CD').AsString;
          FieldByName('I_UNLOCK').AsBoolean := ServerEmpq.FieldByName('I_UNLOCK').AsBoolean;
          FieldByName('I_CHANGE').AsBoolean := ServerEmpq.FieldByName('I_CHANGE').AsBoolean;
          FieldByName('I_DELETE').AsBoolean := ServerEmpq.FieldByName('I_DELETE').AsBoolean;
          FieldByName('I_OUTDISCOUNT').AsBoolean := ServerEmpq.FieldByName('I_OUTDISCOUNT').AsBoolean;
          FieldByName('I_POS_SET').AsBoolean := ServerEmpq.FieldByName('I_POS_SET').AsBoolean;
          FieldByName('I_BEGINNING').AsBoolean := ServerEmpq.FieldByName('I_BEGINNING').AsBoolean;
          FieldByName('I_EXIT').AsBoolean := ServerEmpq.FieldByName('I_EXIT').AsBoolean;
          FieldByName('I_DATETIME').AsBoolean := ServerEmpq.FieldByName('I_DATETIME').AsBoolean;
          Post;
          ProbEmp.StepBy(1);
          ServerEmpq.Next;
        end;
      end;
      AdoClient.CommitTrans;
    except
      AdoClient.RollbackTrans;
    end; 
  end;
  with SysUserServerq do
  begin
    if Active then Close;
    Connection := AdoServer;
    SQL.Text := 'SELECT * FROM sys_user';
    Open;
  end;  
  if not SysUserServerq.IsEmpty then
  begin        
    ProbEmp.Max := SysUserServerq.RecordCount;
    SysUserServerq.First;
    AdoClient.BeginTrans;
    try
      AdoClient.Execute('DELETE FROM sys_user');
      with SysUserClientq do
      begin
        if Active then Close;
        Connection := AdoClient;
        SQL.Text := 'SELECT * FROM sys_user';
        Open;
        while not SysUserServerq.Eof do
        begin
          Append;
          FieldByName('user_id').AsString := SysUserServerq.FieldByName('user_id').AsString;
          FieldByName('user_name').AsString := SysUserServerq.FieldByName('user_name').AsString;
          FieldByName('password').AsString := SysUserServerq.FieldByName('password').AsString;
          FieldByName('create_time').AsString := SysUserServerq.FieldByName('create_time').AsString;
          FieldByName('modify_time').AsString := SysUserServerq.FieldByName('modify_time').AsString;
          Post;
          ProbEmp.StepBy(1);
          SysUserServerq.Next;
        end;
      end;
      AdoClient.CommitTrans;
    except
      AdoClient.RollbackTrans;
    end; 
  end;
  SysUserServerq.Close;
  SysUserClientq.Close;
  ServerEmpq.Close;
  ClientEmpq.Close;
end;

procedure TfrmDataDeliver.bbtnDownEmpClick(Sender: TObject);
begin
  prip_DownEmpInfo;
end;

procedure TfrmDataDeliver.bbtnDownMachinesClick(Sender: TObject);
begin
  prip_DownMachinesInfo;
end;

procedure TfrmDataDeliver.prip_DownMachinesInfo;
begin
  with ServerMachinesq do
  begin
    if Active then Close;
    Connection := AdoServer;
    SQL.Text := 'SELECT * FROM T_MACHINES_MS';
    Open;
  end;  
  if not ServerMachinesq.IsEmpty then
  begin
    ProbMachines.Max := ServerMachinesq.RecordCount;
    ServerMachinesq.First;
    AdoClient.BeginTrans;
    try
      AdoClient.Execute('DELETE FROM T_MACHINES_MS');
      with ClientMachinesq do
      begin
        if Active then Close;
        Connection := AdoClient;
        SQL.Text := 'SELECT * FROM T_MACHINES_MS';
        Open;
        while not ServerMachinesq.Eof do
        begin
          Append;
          FieldByName('I_MACHINES_CD').AsString := ServerMachinesq.FieldByName('I_MACHINES_CD').AsString;
          FieldByName('I_MACHINES_NAME').AsString := ServerMachinesq.FieldByName('I_MACHINES_NAME').AsString;
          FieldByName('I_MACHINES_FREE').AsInteger :=
            ServerMachinesq.FieldByName('I_MACHINES_FREE').AsInteger;
          FieldByName('I_LAST_ON_TIME').AsString := ServerMachinesq.FieldByName('I_LAST_ON_TIME').AsString;
          FieldByName('I_LAST_ON_TIME').AsString := ServerMachinesq.FieldByName('I_LAST_ON_TIME').AsString;
          Post;
          ProbMachines.StepBy(1);
          ServerMachinesq.Next;
        end;
      end;
      AdoClient.CommitTrans;
    except
      AdoClient.RollbackTrans;
    end; 
  end;
  ServerMachinesq.Close;
  ClientMachinesq.Close;
end;

procedure TfrmDataDeliver.bbtnDownPosParamClick(Sender: TObject);
begin
  with ServerPosParamq do
  begin
    if Active then Close;
    Connection := AdoServer;
    SQL.Text := 'SELECT * FROM T_POS_PARAM_MS';
    Open;
  end;  
  if not ServerPosParamq.IsEmpty then
  begin
    ProbPosParam.Max := ServerPosParamq.RecordCount;
    ServerPosParamq.First;
    AdoClient.BeginTrans;
    try
      AdoClient.Execute('DELETE FROM T_POS_PARAM_MS');
      with ClientPosParamq do
      begin
        if Active then Close;
        Connection := AdoClient;
        SQL.Text := 'SELECT * FROM T_POS_PARAM_MS';
        Open;
        while not ServerPosParamq.Eof do
        begin
          Append;
          FieldByName('I_DATETIME').AsString := ServerPosParamq.FieldByName('I_DATETIME').AsString;
          FieldByName('I_REMARK1').AsString := ServerPosParamq.FieldByName('I_REMARK1').AsString;
          FieldByName('I_REMARK2').AsString := ServerMachinesq.FieldByName('I_REMARK2').AsString;
          FieldByName('I_REMARK3').AsString := ServerMachinesq.FieldByName('I_REMARK3').AsString;
          FieldByName('I_REMARK4').AsString := ServerMachinesq.FieldByName('I_REMARK4').AsString;
          FieldByName('I_REMARK5').AsString := ServerMachinesq.FieldByName('I_REMARK5').AsString;
          Post;
          ProbPosParam.StepBy(1);
          ServerPosParamq.Next;
        end;
      end;
      AdoClient.CommitTrans;
    except
      AdoClient.RollbackTrans;
    end; 
  end;
  ServerPosParamq.Close;
  ClientPosParamq.Close;
end;

procedure TfrmDataDeliver.bbtnDownSaleClick(Sender: TObject);
begin
  prip_DownSaleInfo;
end;

procedure TfrmDataDeliver.prip_DownSaleInfo;
var
  li_I: Integer;
  ls_FieldName: String;
begin
  with ServerSaleItemq do
  begin
    if Active then Close;
    Connection := AdoServer;
    SQL.Text := 'SELECT * FROM T_SALE_ITME_MS';
    Open;
  end;
  if not ServerSaleItemq.IsEmpty then
  begin
    ProbSale.Max := ServerSaleItemq.RecordCount;
    ServerSaleItemq.First;
    AdoClient.BeginTrans;
    try
      AdoClient.Execute('DELETE FROM T_SALE_ITME_MS');
      with ClientSaleItemq do
      begin
        if Active then Close;
        Connection := AdoClient;
        SQL.Text := 'SELECT * FROM T_SALE_ITME_MS';
        Open;
        while not ServerSaleItemq.Eof do
        begin
          Append;
          for li_I := 0 to ServerSaleItemq.FieldCount - 1 do
          begin
            ls_FieldName := ServerSaleItemq.FieldList[li_I].FullName;
            FieldValues[ls_FieldName] := ServerSaleItemq.FieldValues[ls_FieldName];
          end; 
          Post;
          ProbSale.StepBy(1);
          ServerSaleItemq.Next;
        end;
      end;
      AdoClient.CommitTrans;
    except
      AdoClient.RollbackTrans;
    end; 
  end;
  with ServerSaleq do
  begin
    if Active then Close;
    Connection := AdoServer;
    SQL.Text := 'SELECT * FROM T_SALE_MS';
    Open;
  end;  
  if not ServerSaleq.IsEmpty then
  begin
    ProbSale.Max := ServerSaleq.RecordCount;
    ServerSaleq.First;
    AdoClient.BeginTrans;
    try
      AdoClient.Execute('DELETE FROM T_SALE_MS');
      with ClientSaleq do
      begin
        if Active then Close;
        Connection := AdoClient;
        SQL.Text := 'SELECT * FROM T_SALE_MS';
        Open;
        while not ServerSaleq.Eof do
        begin
          Append; 
          for li_I := 0 to ServerSaleq.FieldCount - 1 do
          begin
            ls_FieldName := ServerSaleq.FieldList[li_I].FullName;
            FieldValues[ls_FieldName] := ServerSaleq.FieldValues[ls_FieldName];
          end; 
          Post;
          ProbSale.StepBy(1);
          ServerSaleq.Next;
        end;
      end;
      AdoClient.CommitTrans;
    except
      On E: Exception do
      begin
      AdoClient.RollbackTrans;
      end;
    end; 
  end;      
  with ServerLSMq do
  begin
    if Active then Close;
    Connection := AdoServer;
    SQL.Text := 'SELECT * FROM T_LSM_SALE_MS';
    Open;
  end;  
  if not ServerLSMq.IsEmpty then
  begin
    ProbSale.Max := ServerLSMq.RecordCount;
    ServerLSMq.First;
    AdoClient.BeginTrans;
    try
      AdoClient.Execute('DELETE FROM T_LSM_SALE_MS');
      with ClientLSMq do
      begin
        if Active then Close;
        Connection := AdoClient;
        SQL.Text := 'SELECT * FROM T_LSM_SALE_MS';
        Open;
        while not ServerLSMq.Eof do
        begin
          Append; 
          for li_I := 1 to ServerLSMq.FieldCount - 1 do
          begin
            ls_FieldName := ServerLSMq.FieldList[li_I].FullName;
            FieldValues[ls_FieldName] := ServerLSMq.FieldValues[ls_FieldName];
          end; 
          Post;
          ProbSale.StepBy(1);
          ServerLSMq.Next;
        end;
      end;
      AdoClient.CommitTrans;
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        AdoClient.RollbackTrans;
      end;
    end; 
  end;
  ServerLSMq.Close;
  ClientLSMq.Close;
  ServerSaleItemq.Close;
  ClientSaleItemq.Close;
  ServerSaleq.Close;
  ClientSaleq.Close;
end;

procedure TfrmDataDeliver.bbtnUpTradeInfoClick(Sender: TObject);
begin
  prip_UpTradeInfo;
end;

procedure TfrmDataDeliver.prip_UpTradeInfo;
var
  li_I: Integer;
  ls_FieldName: String;
begin
  with ClientOnLineq do
  begin
    if Active then Close;
    Connection := AdoClient;
    SQL.Text := 'SELECT * FROM T_LOGIN_WORK_MS';
    Open;
  end;  
  if not ClientOnLineq.IsEmpty then
  begin
    ProbTradeInfo.Max := ClientOnLineq.RecordCount;
    ClientOnLineq.First;
    AdoServer.BeginTrans;
    AdoClient.BeginTrans;
    try
      with ServerOnLineq do
      begin
        if Active then Close;
        Connection := AdoServer;
        SQL.Text := 'SELECT * FROM T_LOGIN_WORK_MS WHERE 1 = 2';
        Open;
        while not ClientOnLineq.Eof do
        begin
          Append; 
          for li_I := 0 to ClientOnLineq.FieldCount - 1 do
          begin
            ls_FieldName := ClientOnLineq.FieldList[li_I].FullName;
            FieldValues[ls_FieldName] := ClientOnLineq.FieldValues[ls_FieldName];
          end; 
          Post;
          ProbTradeInfo.StepBy(1);
          ClientOnLineq.Next;
        end;
      end;
      AdoClient.Execute('DELETE FROM T_LOGIN_WORK_MS');
      AdoServer.CommitTrans;
      AdoClient.CommitTrans;
    except
      On E: Exception do
      begin
        AdoServer.RollbackTrans;
        AdoClient.RollbackTrans;
      end;
    end; 
  end;

  with ClientTradeInfoq do
  begin
    if Active then Close;
    Connection := AdoClient;
    SQL.Text := 'SELECT * FROM T_TRADE_MS';
    Open;
  end;  
  if not ClientTradeInfoq.IsEmpty then
  begin
    ProbTradeInfo.Max := ClientTradeInfoq.RecordCount;
    ClientTradeInfoq.First;
    AdoServer.BeginTrans;
    AdoClient.BeginTrans;
    try
      with ServerTradeInfoq do
      begin
        if Active then Close;
        Connection := AdoServer;
        SQL.Text := 'SELECT * FROM T_TRADE_MS WHERE 1 = 2';
        Open;
        while not ClientTradeInfoq.Eof do
        begin
          Append; 
          for li_I := 0 to ClientTradeInfoq.FieldCount - 1 do
          begin
            ls_FieldName := ClientTradeInfoq.FieldList[li_I].FullName;
            FieldValues[ls_FieldName] := ClientTradeInfoq.FieldValues[ls_FieldName];
          end; 
          Post;
          ProbTradeInfo.StepBy(1);
          ClientTradeInfoq.Next;
        end;
      end;
      AdoClient.Execute('DELETE FROM T_TRADE_MS');
      AdoServer.CommitTrans;
      AdoClient.CommitTrans;
    except
      On E: Exception do
      begin
        AdoServer.RollbackTrans;
        AdoClient.RollbackTrans;
      end;
    end; 
  end;
  with ClientTradeDetailq do
  begin
    if Active then Close;
    Connection := AdoClient;
    SQL.Text := 'SELECT * FROM T_TRADE_DETAIL_MS';
    Open;
  end;  
  if not ClientTradeDetailq.IsEmpty then
  begin
    ProbTradeInfo.Max := ClientTradeDetailq.RecordCount;
    ClientTradeDetailq.First;
    AdoClient.BeginTrans;     
    AdoServer.BeginTrans;
    try
      with ServerTradeDetailq do
      begin
        if Active then Close;
        Connection := AdoServer;
        SQL.Text := 'SELECT * FROM T_TRADE_DETAIL_MS WHERE 1 = 2';
        Open;
        while not ClientTradeDetailq.Eof do
        begin
          Append; 
          for li_I := 0 to ClientTradeDetailq.FieldCount - 1 do
          begin
            ls_FieldName := ClientTradeDetailq.FieldList[li_I].FullName;
            FieldValues[ls_FieldName] := ClientTradeDetailq.FieldValues[ls_FieldName];
          end; 
          Post;
          ProbTradeInfo.StepBy(1);
          ClientTradeDetailq.Next;
        end;
      end;           
      AdoClient.Execute('DELETE FROM T_TRADE_DETAIL_MS');
      AdoClient.CommitTrans;   
      AdoServer.CommitTrans;
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        AdoClient.RollbackTrans; 
        AdoServer.RollbackTrans;
      end;
    end; 
  end;
  ClientOnLineq.Close;
  ServerOnLineq.Close;
  ServerTradeInfoq.Close;
  ClientTradeInfoq.Close;
  ServerTradeDetailq.Close;
  ClientTradeDetailq.Close;
end;

end.
