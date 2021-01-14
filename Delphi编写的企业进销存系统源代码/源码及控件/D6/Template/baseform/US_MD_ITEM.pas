unit US_MD_ITEM;

{ Master Detail Form :

一. 控制内容 :
  (1). 明细资料自动编号


二. 调用事项 :
  (1). 明细档自动编号栏位名 sAutoItemFdNm

}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD, Db, DBTables, Grids_ts, TSGrid, TSDBGrid, DBCtrls,
  DBNavPlus, Buttons, StdCtrls, Mask, ExtCtrls, ToolWin, ComCtrls, Grids,
  DBGrids, DBVrtNav;

type
  TS_MasterDetail_With_Item = class(TS_MasterDetail)
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Table2AfterCancel(DataSet: TDataSet);
    procedure Table2BeforeCancel(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure Table2AfterDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1EditButtonClick(Sender: TObject); override;
  private
    { Private declarations }
    lUpdItem, lCnlItem : Boolean;  // 是否是由於更新 <项> 引起的新增动作
    lIns     : Boolean;  // 用於更新 <项> : True- 插入新增(Insert) ; False- 追加新增(Append)
    iDelItem : Integer;  // 记录删除前的 <项> 值
    iInsItem : Integer;  // 记录应新增的 <项> 值

    procedure DecItem(xDataSet: TDataSet);
    procedure IncItem(xDataSet: TDataSet);
  public
    sAutoItemFdNm : String;
    { Public declarations }
  end;

var
  S_MasterDetail_With_Item: TS_MasterDetail_With_Item;

implementation

uses utilities;

{$R *.DFM}


procedure TS_MasterDetail_With_Item.DecItem(xDataSet: TDataSet);
begin
  // 若删除的 <项> 小於 当前定位的 <项>, 则表示删除的不是最后一笔记当, 删除 <项> 以后的项都须 -1
  if iDelItem < xDataSet.FieldByName(sAutoItemFdNm).AsInteger then
  begin
    QryExec(Qry1, Format('Update %s Set %s=%s-1 Where %s=''%s'' And %s>= %d',
        [sDTbNm, sAutoItemFdNm, sAutoItemFdNm, sDKeyFdNm, Table1.FieldByName(sKeyFdNm).AsString, sAutoItemFdNm, Table2.FieldByName(sAutoItemFdNm).AsInteger]), False);
    lCnlItem := True;
    xDataSet.Refresh;
    lCnlItem := False;
    xDataSet.Locate(sAutoItemFdNm, iDelItem ,[]);
  end;
end;

procedure TS_MasterDetail_With_Item.IncItem(xDataSet: TDataSet);
begin
  if lUpdItem then //  (Label : 1)
  begin
    xDataSet.FieldByName(sAutoItemFdNm).AsInteger := iInsItem;
    lUpdItem := False;
  end
  else
    // 若为 Append 一条记录, 则直接将 iInsItem 的值赋给 <项>
    if not lIns then
       xDataSet.FieldByName(sAutoItemFdNm).AsInteger := iInsItem
    else
    begin
      lUpdItem := True;
      // 将要新增记录以下的 <项> 都 +1, 以为在中间腾出一个 <项>号 给插入的记当使用
      QryExec(Qry1, Format('Update %s Set %s=%s+1 Where %s=''%s'' And %s>= %d',
                [sDTbNm, sAutoItemFdNm, sAutoItemFdNm, sDKeyFdNm, Table1.FieldByName(sKeyFdNm).AsString, sAutoItemFdNm, iInsItem]), False);

      // Refresh 会 cancel 掉 xDataSet 的新增动作, 该句会跳至 Table2AfterCancel 处执行
      xDataSet.Refresh;  // (Lable : 2)

      // 该句会跳至 (Lable : 1) 处执行
      xDataSet.Insert;
    end;
end;



procedure TS_MasterDetail_With_Item.FormCreate(Sender: TObject);
begin
  inherited;
  sAutoItemFdNm := 'D_Sn';
  lIns := True;     // 默认为 [插入]
  lUpdItem := False;
  lCnlItem := False;
end;



procedure TS_MasterDetail_With_Item.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

end;



{ 重排 [项] 值 }
procedure TS_MasterDetail_With_Item.Table2AfterInsert(DataSet: TDataSet);
begin
  inherited;
  IncItem(DataSet);
end;


procedure TS_MasterDetail_With_Item.Table2AfterDelete(DataSet: TDataSet);
begin
  inherited;
  if not lDelMasterDetail then DecItem(DataSet);
end;


procedure TS_MasterDetail_With_Item.Table2AfterCancel(DataSet: TDataSet);
begin
  { lIns 表示 : 若为 Cancel 掉 Ins 动作, 则须重排 [项]  }
  { lUpdItem 表示 : 由 (Lable : 2) 处的 xDataSet.Refresh 引起的 Cancel 动作, 不重排 [项] }
  if (lIns and (not lUpdItem)) or lCnlItem then DecItem(DataSet);
  if not lUpdItem then inherited;

  lIns := True;
end;



procedure TS_MasterDetail_With_Item.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (Table2.RecordCount = 0) then
  begin
    iInsItem := 1;
    lIns := False;
  end
  else
    if lIns and (not lUpdItem) then iInsItem := Table2.FieldByName(sAutoItemFdNm).AsInteger;
end;

procedure TS_MasterDetail_With_Item.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
  lIns := True;
end;

procedure TS_MasterDetail_With_Item.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if not lDelMasterDetail then iDelItem := Table2.FieldByName(sAutoItemFdNm).AsInteger;
end;

procedure TS_MasterDetail_With_Item.Table2BeforeCancel(DataSet: TDataSet);
begin
  inherited;
  iDelItem := Table2.FieldByName(sAutoItemFdNm).AsInteger;
end;

procedure TS_MasterDetail_With_Item.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not Table2.Active then exit;

  if (Table2.RecordCount > 0) and (Self.ActiveControl = DBGrid1) then
  begin
    if Key = vk_Down then
    begin
      DataSetPost(Table2);
      if Table2.FieldByName(sAutoItemFdNm).AsInteger = Table2.RecordCount then lIns := False;
    end;

    if not lIns then iInsItem := Table2.RecordCount+1;
  end;

  inherited;
end;

procedure TS_MasterDetail_With_Item.DBGrid1EditButtonClick(
  Sender: TObject);
begin
  inherited;
  // Called in DBGrid1KeyDown Where Press Key F4
end;

end.
