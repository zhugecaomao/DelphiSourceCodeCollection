unit uFM_USR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids_ts, TSGrid, TSDBGrid, DBCtrls, Buttons,
  DBVrtNav,US_FM, StdCtrls;

type
  TFM_USR = class(TS_Form)
    DataSource1: TDataSource;
    tsDBGrid2: TtsDBGrid;
    DataSource2: TDataSource;
    Table1: TTable;
    Table2: TTable;
    Table2K_SN: TStringField;
    Table2D_SN: TIntegerField;
    Table1Nm: TStringField;
    Table1PW: TStringField;
    Table2NM: TStringField;
    Table2F01: TBooleanField;
    Table2F02: TBooleanField;
    Table2F03: TBooleanField;
    Table2F04: TBooleanField;
    Table2F05: TBooleanField;
    Table2F06: TBooleanField;
    Table2Memo: TStringField;
    Qry1: TQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Button1: TBitBtn;
    Button2: TBitBtn;
    Panel3: TPanel;
    tsDBGrid1: TtsDBGrid;
    DBVertNavigator1: TDBVertNavigator;
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure tsDBGrid1Enter(Sender: TObject);
    procedure tsDBGrid2Enter(Sender: TObject);
    procedure tsDBGrid1Exit(Sender: TObject);
    procedure tsDBGrid2Exit(Sender: TObject);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_USR: TFM_USR;
  BENM,xUser : string;
implementation

uses uDM,utilities;

{$R *.DFM}

procedure TFM_USR.Table1BeforeInsert(DataSet: TDataSet);
begin
  xUser := Table1Nm.AsString;
end;

procedure TFM_USR.tsDBGrid1Enter(Sender: TObject);
begin
  DBVertNavigator1.DataSource := DataSource1;
end;

procedure TFM_USR.tsDBGrid2Enter(Sender: TObject);
begin
   //DBVertNavigator1.DataSource := DataSource2;
end;

procedure TFM_USR.tsDBGrid1Exit(Sender: TObject);
begin
  if table1.State in [dsinsert,dsedit] then
     Table1.Post;
end;

procedure TFM_USR.tsDBGrid2Exit(Sender: TObject);
begin
  if table2.State in [dsinsert,dsedit] then
     Table2.Post;
end;

procedure TFM_USR.Table1BeforeDelete(DataSet: TDataSet);
begin
  if Table1Nm.AsString ='管理员' then begin
     R_OkMessage(['管理员权限除密码外不可删除或修改!'],'',MB_ICONWARNING);
     abort;
  end;
  QryExec(Qry1,'delete from TuserRight where Nm='+''''+Table1Nm.AsString+'''',false,'删除用户出错,请查明原因!');
end;

procedure TFM_USR.Table1BeforePost(DataSet: TDataSet);
var
  sSql : string;
begin
  inherited;
  if Table1Nm.asstring ='' then begin
     R_OkMessage(['使用者名称不可为空,请输入!'],'',MB_ICONERROR);
     Table1Nm.FocusControl;
     abort;
  end;
  if BENM=Table1Nm.AsString then Exit;
  //if Table1.State in [dsinsert] then begin
     QryExec(Qry1,'select NM from Tuser where Nm='+''''+Table1Nm.AsString+'''');
     if Qry1.RecordCount >=1 then begin
        R_OkMessage(['已有此使用者,请重新输入!'],'',MB_ICONERROR);
        Table1Nm.FocusControl; abort;
     end;
  // end;
  sSql :='insert TuserRight(Nm,K_SN,D_SN,F01,F02,F03,F04,F05,F06,Memo) select '+''''+Table1Nm.AsString+''''+ ', K_SN,D_SN,F01,F02,F03,F04,F05,F06,Memo from TUserRight where Nm='+''''+xUser+''''  ;
  QryExec(Qry1,sSql,false);
  table2.close;
  table2.open;

end;

procedure TFM_USR.FormCreate(Sender: TObject);
begin
  //inherited;
  Width:=828; Height:=548;
  Table1.Open;
  Table2.Open;
end;

procedure TFM_USR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Try
    if Table2.State in [dsEdit,dsInsert] then Table2.Post;
    if Table1.State in [dsEdit,dsInsert] then Table1.Post;
    Table2.close;
    Table1.Close;
  except
     //
  end;
end;

procedure TFM_USR.Button3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFM_USR.Button1Click(Sender: TObject);
begin
  inherited;
  QryExec(Qry1,'update TUserRight set F01=1,F02=1,F03=1,F04=1,F05=1,F06=1 '+' where NM='+''''+Table1Nm.asstring+'''',false);
  table2.Active := false;
  table2.Active := true;
end;

procedure TFM_USR.Button2Click(Sender: TObject);
begin
  inherited;
  QryExec(Qry1,'update TUserRight set F01=0,F02=0,F03=0,F04=0,F05=0,F06=0 '+' where NM='+''''+Table1Nm.asstring+'''',false);
  table2.Active := false;
  table2.Active := true;
end;

procedure TFM_USR.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Table1Nm.AsString ='管理员' then begin
     tsDBGrid2.GridMode := gmBrowse ;
     Table1Nm.ReadOnly := true;
     Button1.Enabled := false;
     Button2.Enabled := false;
     end
  else begin
     tsDBGrid2.GridMode := gmEdit;
     Table1Nm.ReadOnly := false;
     Button1.Enabled := true;
     Button2.Enabled := true;
  end;
end;

procedure TFM_USR.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  abort;
  if Table1Nm.AsString ='管理员' then begin
     R_OkMessage(['管理员权限除密码外不可删除或修改!'],'',MB_ICONWARNING);
     abort;
  end;
end;

procedure TFM_USR.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  abort;
end;

procedure TFM_USR.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  BENM := Table1NM.AsString;
end;

procedure TFM_USR.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
