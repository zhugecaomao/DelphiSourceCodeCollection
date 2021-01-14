unit US_DB;

{ DB Form :
一. 控制内容
  (1). Form Create - 开启资料表
  (2). Form Close - 判断资料表是否已存档
  (3). Form Destroy - 关闭资料表
  (4). FormKeyDown - NavPlus 热键控制
  (5). 加入 RequiredValue, MoreThanZero, CheckFieldVal 事件句柄
  (6). [查询], [列印] 按钮按钮时, 先将资料表存档
  (7). 热键设置 : (a) Alt+F - 主键查找
                  (b) Alt+Q - 查询
                  (c) Alt+P - 打印


二. 调用注意事项 :

  (1). sTbNm : String - 资料表名
  (2). 可通过 aOriValues 变量数组取得资料表的原值
  (3). 若 DM 上有因 Table 的变化, 需要刷新的 DataSet. 则需作如下处理 :

       (a) 在 FormCreate 中设置 iRefreshDSCnt 为要刷新的 DataSet 个数, 如 :
           iRefreshDSCnt := 1;

       (b) 在 FormShow 中设置 asRefreshDSNm 数组, 为要更新的 DataSet 名称, 如 :
           asRefreshDSNm[0] := 'Q_JobTitle';
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Db, Buttons, ExtCtrls, DBCtrls, DBNavPlus, ToolWin, ComCtrls,
  RXDBCtrl, StdCtrls, Mask, ToolEdit, DBTables ;

type
  TS_DB = class(TS_Form)
    ToolBar1: TToolBar;
    DBNavPlus1: TDBNavPlus;
    SB3: TSpeedButton;
    SB2: TSpeedButton;
    SB1: TSpeedButton;
    SB0: TSpeedButton;
    SB4: TSpeedButton;
    SB6: TSpeedButton;
    DataSource1: TDataSource;
    Qry1: TQuery;
    Table1: TTable;
    procedure RequiredValue(Sender: TField);
    procedure MoreThanZero(Sender: TField);
    procedure NeedUniqueValue(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SB6Click(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure SB1Click(Sender: TObject);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Table1AfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    { Protected declarations }
    xCurNavigator : TDBNavigator;
  Procedure GetaOriVal(var aOriVal: Array of Variant; xDataBase: TDataSet);  public
    { Public declarations }
    sTbNm: String;      // 资料表名
    sKeyFdNm: String;   // 键值字段名
    aOriValues : Array of Variant;        // 主档原值 - 用於过帐动作
    iRefreshDSCnt : Integer;
    asRefreshDSNm : Array of String;      // Length = iRefreshDSCnt
  end;


var
  S_DB: TS_DB;

implementation

uses utilities, uDataBaseEValue, uDM;

{$R *.DFM}


procedure TS_DB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Table1.State in [dsEdit,dsInsert] then
    if R_YesNoMessage(['资料尚未存档,是否存档?']) then
      try
        Table1.Post;
      except
        R_OkMessage(['存档失败,再试一次'],'',MB_ICONERROR);
        Action := caNone;
        Raise;
      end;

  inherited;
end;

procedure TS_DB.FormCreate(Sender: TObject);
begin
  inherited;
  Try
    Table1.Open;
  Except
    R_OkMessage(['资料表开启错误!'],'',MB_ICONERROR);
    Raise
  End;

  // 取得 Table1.TableName, 存入 sTbNm 中
  sTbNm := Table1.TableName;
  if Pos('.',sTbNm)>0 then
    if Pos('dbo.',sTbNm)=1 then Delete(sTbNm,1,4)
      else Delete(sTbNm, Pos('.',sTbNm), 4);

  // 设置原栏位值数组的长度
  SetLength(aOriValues, Table1.FieldCount);
  xCurNavigator := DBNavPlus1;
  iRefreshDSCnt := 0;
end;

procedure TS_DB.FormShow(Sender: TObject);
begin
  inherited;
  SetLength(asRefreshDSNm, iRefreshDSCnt);
end;

procedure TS_DB.FormDestroy(Sender: TObject);
begin
  inherited;
  Table1.Close;
end;

procedure TS_DB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    vk_Insert :         // 新增 - Ins
      if xCurNavigator.DataSource.DataSet = Table1 then
        xCurNavigator.DataSource.DataSet.Insert;
    vk_Escape :         // 取消 - ESC
      xCurNavigator.DataSource.DataSet.Cancel;
    Ord('S') :            // 存档 - Ctrl+S
      if Shift=[ssCtrl] then DataSetPost(xCurNavigator.DataSource.DataSet);
    vk_F5 :
      Table1.Refresh;
    vk_Delete :         // 删除 - Ctrl + Del
    begin
      if Shift=[ssCtrl] then
      begin
        if not xCurNavigator.DataSource.DataSet.IsEmpty then
          if R_YesNoMessage(['您确定要删除该笔资料吗?']) then
            xCurNavigator.DataSource.DataSet.Delete;
        Key := 0;
      end;
    end;
    vk_Home :            // 首笔 - Ctrl + Home  ;  上一笔 - Ctrl + Home
    begin
      if Shift=[ssCtrl] then xCurNavigator.DataSource.DataSet.First
        else if Shift=[ssAlt] then xCurNavigator.DataSource.DataSet.Prior;
    end;
    vk_End :            // 未笔 - Alt + Home  ;  下一笔 - Alt + End
    begin
      if Shift=[ssCtrl] then begin xCurNavigator.DataSource.DataSet.Last;  Key:=0; end
        else if Shift=[ssAlt] then xCurNavigator.DataSource.DataSet.Next;
    end;
  End;
end;


procedure TS_DB.SB6Click(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TS_DB.SB3Click(Sender: TObject);
begin
  inherited;
  DataSetPost(Table1);
end;

procedure TS_DB.SB2Click(Sender: TObject);
begin
  inherited;
  DataSetPost(Table1);
end;

procedure TS_DB.RequiredValue(Sender: TField);
begin
  EValue_IsNotNull(Sender);
end;


procedure TS_DB.MoreThanZero(Sender: TField);
begin
  EValueNumber(sender);
end;



procedure TS_DB.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  CheckFieldVal(DataSet);
end;

procedure TS_DB.SB1Click(Sender: TObject);
var
  sSQl, sNo : String;
begin
  inherited;
  if InputQuery('查找对话框','请输入编号：', sNo) then
  Try
    //     if not Table1.FindKey([sNo]) then
    sSQL := Format('Select %s From %s Where %s="%s"',[sKeyFdNm, sTbNm ,sKeyFdNm, sNo]);
    QryExec(Qry1, sSQL);
    if Qry1.Fields[0].AsString='' then
    begin
      R_OkMessage(['没有找到该笔资料!']);
      exit;
    end;
    sNo := Qry1.Fields[0].AsString;
    if not Table1.Locate(sKeyFdNm , sNo, []) then
       R_OkMessage(['没有找到该笔资料!'])
  except
     R_OkMessage(['查找出错!'#13#13'没有找到该笔资料!'])
  end;
end;


//----------------------------------------------------------
// Func : 将 资料表 的原值取到变量数组中保存起来
// Call : 在 资料表的以下事件中调用-
//        (1) Before Edit
//        (2) Before Delete
//        (3) After Insert - 将 aOriVal[0] 设为空
//----------------------------------------------------------
procedure TS_DB.GetaOriVal(var aOriVal: Array of Variant; xDataBase: TDataSet);
var
  i: Integer;
begin
  if (xDataBase.State = dsInsert) then
    aOriVal[0] := ''
  else
    for i := 0 to High(aOriVal) do aOriVal[i] := xDataBase.Fields[i].Value;
end;

procedure TS_DB.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if not DM.DB.InTransaction then DM.DB.StartTransaction;

  GetaOriVal(aOriValues, DataSet);
end;


procedure TS_DB.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  GetaOriVal(aOriValues, DataSet);
end;


procedure TS_DB.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if not DM.DB.InTransaction then DM.DB.StartTransaction;

  GetaOriVal(aOriValues, DataSet);
end;


procedure TS_DB.Table1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  inherited;
  CheckKeyValue(E);
end;


procedure TS_DB.Table1AfterPost(DataSet: TDataSet);
var
  i : Integer;
  xDataSet : TComponent;
begin
  inherited;
  if DM.DB.InTransaction then
    try
      DM.DB.Commit;
    except
      DM.DB.Rollback;
      R_OkMessage(['资料更新失败!'],'',MB_ICONERROR);
      raise;
    end;

  { 刷新对应的 DataSet }
  for i := 0 to iRefreshDSCnt-1 do
  begin
    xDataSet := DM.FindComponent(asRefreshDSNm[i]);
    if Assigned(xDataSet) then
    begin
      TDataSet(xDataSet).Close;
      TDataSet(xDataSet).Open;
    end;
  end;
end;

procedure TS_DB.Table1AfterDelete(DataSet: TDataSet);
var
  i : Integer;
  xDataSet : TComponent;
begin
  inherited;
  if DM.DB.InTransaction then
    Try
      DM.DB.Commit;
    Except
      DM.DB.Rollback;
      R_OkMessage(['资料更新失败!'],'',MB_ICONERROR);
      Raise;
    End;


  { 刷新对应的 DataSet }
  for i := 0 to iRefreshDSCnt-1 do
  begin
    xDataSet := DM.FindComponent(asRefreshDSNm[i]);
    if Assigned(xDataSet) then
    begin
      TDataSet(xDataSet).Close;
      TDataSet(xDataSet).Open;
    end;
  end;
end;

procedure TS_DB.NeedUniqueValue(Sender: TField);
begin
  EValue_Unique(Sender, DataSource1, aOriValues[Sender.Index]);
end;

procedure TS_DB.Table1AfterCancel(DataSet: TDataSet);
begin
  inherited;
  if DM.DB.InTransaction then DM.DB.Rollback;
end;

end.
