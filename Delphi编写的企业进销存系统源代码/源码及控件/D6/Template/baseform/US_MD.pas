unit US_MD;

{ Master Detail Form :

一. 控制内容 :
  (1). Form Create - 开启明细资料表 ;
                     将主档资料移至最后一笔
  (2). Form Close - 判断明细资料表是否已存档
  (3). Form Destroy - 关闭明细资料表
  (4). DBGrid1Enter - 若主档还没有资料, 则不跳至明细档
                        若已有资料, 将 DBNavPlus1 连至 DataSource2
  (5). DBGrid1Exit - 将 DBNavPlus1 连至 DataSource1
  (6). [查询], [列印] 按钮按钮时, 先将明细资料表存档
  (7). OnKeyDow - 控制用 [F12] 键切换主档和明细档 ;
                  tsDBGrid 中 EditButton 的热键为 F4
  (8). Query2 New Record - 将主档键值栏位的值赋给明细对应键值栏位
  (9). 主档, 明细档的 过帐动作.
 (10). 主档删除前, 删除对应明细档资料

二. 调用注意事项 :

  (1). (a). sKeyFdNm : String - 主档键值字段名
       (b). sDKeyFdNm: String - 明细与主档关联的键值字段名
       (c). sKSNFdNm : String - 明细键值项字段名, 默认为'K_SN'

  (2). 过帐动作的调用 :
          在 Form 的 Public 段中加入以下申明 :
          procedure DetailEdit(DataSet: TDataSet); override;  - 删除一笔明细时的过帐动作
          procedure DetailUpdate(DataSet: TDataSet); override;  - 增加一笔明细时的过帐动作

          若无过帐动作, 则不需加入.

  (3). 若需在以下事件中写程式段,
       a. 判断程式, 需写在 inherited; 之前; 
       b. 处理程式, 需写在 inherited; 之后 :
          BeforeEdit ; BeforeDelete ; BeforeCancel

       若需在以下事件中写程式, 需将程式写在 inherited; 之前 :
           AfterPost ; AfterDelete ; AfterCancel

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_EDIT, Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls,
  Buttons, DBNavPlus, ComCtrls, ToolWin, Grids_ts, TSGrid, TSDBGrid,
  RXDBCtrl, ToolEdit, Grids, DBGrids, DBVrtNav;


type
  TS_MasterDetail = class(TS_SingleDBEdit)
    DataSource2: TDataSource;
    Table2: TTable;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBVertNavigator1: TDBVertNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Table2BeforeEdit(DataSet: TDataSet);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure DataSource1StateChange(Sender: TObject);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure Table2AfterCancel(DataSet: TDataSet);
    procedure Table2AfterDelete(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject); virtual;
    procedure Table1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sKSNFdNm : String;  // 明细键值项字段名
    sDTbNm: String;     // 明细资料表名
    sDKeyFdNm: String;  // 明细与主档关联的键值字段名
    lDelMasterDetail: boolean;  // 表示由主档删除引起的明细档删除
    lDelMasterScroll: boolean;  // 表示由主档删除引起的主档 befor scroll 事件,
                                // 用於 befor scroll 事件中做判断, 避免出现 Err : Other user changed the record
    procedure DetailEdit(DataSet: TDataSet);virtual;
    procedure DetailUpdate(DataSet: TDataSet);virtual;
  end;

var
  S_MasterDetail: TS_MasterDetail;

implementation

uses utilities,uDataBaseEValue, uDM;

{$R *.DFM}

procedure TS_MasterDetail.DetailUpdate(DataSet: TDataSet);
begin
  // 在此处编写明细档新增资料的对应过帐动作
end;

procedure TS_MasterDetail.DetailEdit(DataSet: TDataSet);
begin
  // 在此处编写明细档删除资料的对应过帐动作
end;


procedure TS_MasterDetail.FormCreate(Sender: TObject);
begin
  Try
    Table2.Open;
  Except
    R_OkMessage(['明细档开启失败']);
  End;

  inherited;

  sKSNFdNm := 'K_SN';

  // 取得 Table2.TableName, 存入 sDTbNm 中
  sDTbNm := Table2.TableName;
  if Pos('.',sDTbNm)>0 then
    if Pos('dbo.',sDTbNm)=1 then Delete(sDTbNm,1,4)
      else Delete(sDTbNm, Pos('.',sDTbNm), 4);

  sDKeyFdNm := Table2.IndexFieldNames;
  if Pos(';',sDKeyFdNm) > 0 then
    sDKeyFdNm := Copy(sDKeyFdNm, 1, Pos(';',sDKeyFdNm)-1);
    
  lDelMasterDetail := False;
  lDelMasterScroll := False;
  Table1.Last;
end;


procedure TS_MasterDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Table2.State in [dsEdit,dsInsert] then
    if R_YesNoMessage(['资料尚未存档,是否存档?']) then
      try
        Table2.Post;
      except
        R_OkMessage(['存档失败,再试一次?']);
        Action := caNone;
        raise;
      end;

  inherited;
end;


procedure TS_MasterDetail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_F12) then
  begin
    if (ActiveControl = DBGrid1) then
      DBEdit1.SetFocus
    else
      DBGrid1.SetFocus;
    Key := 0;
    Exit;
  end;
  inherited;
end;


procedure TS_MasterDetail.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    vk_F4: DBGrid1EditButtonClick(Sender);
  //  vk_Return: Key := vk_Tab;
  end;
end;



procedure TS_MasterDetail.FormDestroy(Sender: TObject);
begin
  Table2.Close;
  inherited;
end;


procedure TS_MasterDetail.SB1Click(Sender: TObject);
begin
  DataSetPost(Table2);
  inherited;
end;

procedure TS_MasterDetail.SB2Click(Sender: TObject);
begin
  DataSetPost(Table2);
  inherited;
end;


procedure TS_MasterDetail.Table2AfterInsert(DataSet: TDataSet);
begin
  inherited;
end;



{ 明细档过帐 }
procedure TS_MasterDetail.Table2BeforeInsert(DataSet: TDataSet);
begin
  if not DM.DB.InTransaction then DM.DB.StartTransaction;
  inherited;
end;


procedure TS_MasterDetail.Table2BeforeEdit(DataSet: TDataSet);
begin
  if not DM.DB.InTransaction then DM.DB.StartTransaction;
  try
    DetailEdit(DataSet);
  except
    R_OkMessage(['删除明细资料出错!'],'',MB_ICONERROR);
    raise;
  end;

  inherited;
end;


procedure TS_MasterDetail.Table2BeforeDelete(DataSet: TDataSet);
begin
  if not DM.DB.InTransaction then DM.DB.StartTransaction;

  if Dataset.State in [dsEdit,dsInsert] then exit;

  try
    DetailEdit(DataSet);
  except
    R_OkMessage(['删除明细资料出错!'],'',MB_ICONERROR);
    raise;
  end;

  inherited;
end;

procedure TS_MasterDetail.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
  try
    DetailUpdate(DataSet);
    DM.DB.Commit;
  except
    DM.DB.Rollback;
    R_OkMessage(['资料更新失败!'],'',MB_ICONERROR);
    raise;
  end;

end;


procedure TS_MasterDetail.Table2AfterCancel(DataSet: TDataSet);
begin
  inherited;
  DM.DB.Rollback;
end;


procedure TS_MasterDetail.Table2AfterDelete(DataSet: TDataSet);
begin
  inherited;
  if not lDelMasterDetail then
    Try
      DM.DB.Commit;
    Except
      DM.DB.Rollback;
      R_OkMessage(['资料更新失败!'],'',MB_ICONERROR);
      Raise;
    End;
end;





procedure TS_MasterDetail.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  // 删除主档之前, 先删除对应的明细档资料;
  // 并设置 lDelMasterDetail 标志
  Table2.DisableControls;
  lDelMasterDetail := true;
  lDelMasterScroll := true;
  try
    try
      Table2.First;
      while not Table2.eof do
        Table2.Delete;
    except
      R_OkMessage(['发生错误,无法删除明细档'],'',MB_ICONERROR);
      DM.DB.Rollback;
      Table2.Close;
      Table2.Open;
      abort;
    end;
  finally
    lDelMasterDetail := False;
    Table2.EnableControls;
  end;

end;


procedure TS_MasterDetail.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
  //-- 存盘前触发一遍栏位检查事件
  CheckFieldVal(DataSet);

  //-- <K_SN>自动编号
  if (Table2.State = dsInsert) and (sKSNFdNm<>'') then
  Try
    Table2.FieldByName(sKSNFdNm); // 若明细档无 <K_SN> 栏位,则此句会触发异常, 不进行<K_SN>的自动编号
    QryExec(Qry1,'Select max('+sKSNFdNm+') from '+sDTbNm+' Where '+sDKeyFdNm+'= "'+Table1.FieldByName(sKeyFdNm).AsString+'" ' );
    Table2.FieldByName(sKSNFdNm).AsInteger := Qry1.Fields[0].AsInteger + 1;
  except
    //
  end;
end;


procedure TS_MasterDetail.DataSource1StateChange(Sender: TObject);
begin
  inherited;
  // 根据 Table 状态控制 Panel3 的颜色 (同 Panel1)
  Case Table1.State of
    dsBrowse : Panel3.Color := $0099F2C6;
    dsEdit   : Panel3.Color := $00FBDAD7;
    dsInsert : Panel3.Color := $00F1C9FA;
  End;
end;


// 以 Navplas 的字体颜色来标识当前焦点在主档还是在明细档上
procedure TS_MasterDetail.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  DataSetPost(Table1);

  if (Table1.RecordCount = 0) then
     DBEdit1.SetFocus
  else
  begin 
    xCurNavigator := TDBNavigator(DBVertNavigator1);
    Panel2.Enabled := True;
  end;
end;

procedure TS_MasterDetail.DBGrid1Exit(Sender: TObject);
begin
  inherited;
  DataSetPost(Table2);
  xCurNavigator := DBNavPlus1;
  Panel2.Enabled := False;
end;


procedure TS_MasterDetail.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  // Called in DBGrid1KeyDown Where Press Key F4
end;

procedure TS_MasterDetail.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  lDelMasterScroll := false;
end;

end.
