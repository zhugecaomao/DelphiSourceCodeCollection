unit uFM_2150;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  ToolEdit, RXDBCtrl;

type
  TFM_2150 = class(TS_MasterDetail_With_Item)
    Table1F01: TStringField;
    Table1F02: TDateTimeField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F11: TStringField;
    Table1Buser: TStringField;
    Table1Btime: TDateTimeField;
    Table1Euser: TStringField;
    Table1Etime: TDateTimeField;
    Table2F01: TStringField;
    Table2K_SN: TIntegerField;
    Table2D_SN: TSmallintField;
    Table2F02: TIntegerField;
    Table2F03: TFloatField;
    Table2Buser: TStringField;
    Table2Btime: TDateTimeField;
    Table2Euser: TStringField;
    Table2Etime: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBComboEdit1: TRxDBComboEdit;
    Table1F06: TStringField;
    Table1F07: TFloatField;
    Table1F08: TFloatField;
    Table1F09: TFloatField;
    Table1F10: TFloatField;
    Table1F12: TStringField;
    Table2F04: TFloatField;
    Table2F05: TFloatField;
    Table2F07: TStringField;
    Table2F08: TStringField;
    Table2F09: TIntegerField;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    DSum: TQuery;
    DataSource3: TDataSource;
    DSumDSum: TFloatField;
    DBEdit8: TDBEdit;
    DBComboBox1: TDBComboBox;
    Table1CalF08: TFloatField;
    Table1CalF10: TFloatField;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    Table2CalF05: TFloatField;
    RxDBComboEdit2: TRxDBComboEdit;
    Table1CalPay: TFloatField;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Table1CalF09: TFloatField;
    Table2F06: TStringField;
    Table2F10: TStringField;
    DBEdit4: TDBEdit;
    Table1lkF03: TStringField;
    Table2lkF01: TStringField;
    Table2lkF02: TStringField;
    Table2lkF03: TStringField;
    Table2lkF04: TStringField;
    Table2lkF05: TStringField;
    Table2lkF07: TFloatField;
    Table2F20: TFloatField;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table2CalcFields(DataSet: TDataSet);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure Table2F20Change(Sender: TField);
    procedure Table2F03Change(Sender: TField);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table2BeforeEdit(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure DetailEdit(DataSet: TDataSet); override;
    procedure DetailUpdate(DataSet: TDataSet); override;
    { Public declarations }
  end;

var
  FM_2150: TFM_2150;
  lNeedCalQty : boolean = true;
  lNeedCalWeigh : boolean = true;
  IfEdit : string='0';
implementation

uses utilities, uDM, uFM_SES, uFunction, uFM_SEP, uFM_SPS,
  uRP_2150;

{$R *.DFM}

procedure TFM_2150.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  //把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  if Table1.State in [dsInsert] then
  Auto_Item_Number(Table1,'F01',cYYMMDD_xxxS,'A',true,Table1F02.AsDateTime);
  //if Table1.State in [dsBrowse] then Table1.edit;
  //Table1F09.AsFloat := DSumDSum.AsFloat;
  Table1F10.AsFloat := Table1CalF10.AsFloat;
  Table1F08.AsFloat := Table1CalF08.AsFloat;
  Table1F09.AsFloat := Table1CalF09.AsFloat;
  if Table1F12.AsString='' then
  Table1F12.AsString := copy(formatdatetime('YYYYMM',Table1F02.AsDateTime),3,4);

end;

procedure TFM_2150.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  Select_Data(DataSource1,'币别点选窗口','select F01 as 币别,F02 AS 汇率 from T1100','STK0311',['F04'],[0],[]);
end;

procedure TFM_2150.DBGrid1EditButtonClick(Sender: TObject);
var
  iAutoNo,iNo: integer;
  sNo,sNo1:string;
begin
  inherited;
  //点选型号
  if DBGrid1.SelectedField = Table2lkF01 then
  begin
    if not SelSemi(Table2lkF01.AsString,Table2lkF02.AsString,Table2lkF03.AsString,Table2lkF04.AsString,Table2lkF05.AsString,iNo) then Exit;
    if Table2.State in [dsBrowse] then Table2.Edit;
    Table2F02.asinteger := iNo;
  end;

  //点选领料单号
  if DBGrid1.SelectedField = Table2F07 then
  begin
    if not SelProdSemi(sNo,sNo1,iAutoNo) then exit;
    if Table2.State in [dsBrowse] then Table2.Edit;
    Table2F07.AsString := sNo;
    Table2F08.AsString := sNo1;
    Table2F09.Asinteger := iAutoNo;
  end;

  { 点选 <制令单号> }
  if DBGrid1.SelectedField = Table2F06 then  begin
    if Select_Data(DataSource2,'制令单选取窗口','select M.F01 as 制令单号,'
                +'M.F02 as 开立日期,M.F03 as 产品编号,'
                +'M.F06 as 预计生产量,M.F04 as 订单单号,P.F01 as 型号,P.F02 as 品名,'
                +'P.F03 as 材质,P.F04 as 规格,P.F05 as 心孔 from T2020 as M '
                +'left join T1070 as P ON M.F03=P.AutoNo where M.F07<M.F06 and M.F09=''半成品''','STK0311',['F06','F02','F03'],[0,2,3],[80,60,0])
    then begin
           DBGrid1.SelectedField := Table2F03;
    end;
  end;
  
end;



procedure TFM_2150.DetailEdit(DataSet: TDataSet);
begin
  //删除一笔明细,减去对应的数量
  UpdateStock(Qry1,'T1070','-','F06',Table2F03,Table2F02);
  UpdateStock(Qry1,'T1070','-','F12',Table2F03,Table2F02);
  QryExec(Qry1,'update T2020 set F07=F07-'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F03='''+Table2F02.AsString+'''',False);
  //更新领料单
  if (Table2F09.AsInteger = 0) and (Table2F07.AsString <> '') then //原料
    UpdateMTakeQty(Qry1, '-',Table2F20,Table2F07,Table2F08);
  if (Table2F07.AsString <> '') and (Table2F08.AsString = '')  then //半成品
    UpdateSTakeQty(Qry1, '-',Table2F03,Table2F07,Table2F09);
end;

procedure TFM_2150.DetailUpdate(DataSet: TDataSet);
begin
  //增加一笔明细,加上对应的数量
  UpdateStock(Qry1,'T1070','+','F06',Table2F03,Table2F02);
  UpdateStock(Qry1,'T1070','+','F12',Table2F03,Table2F02);
  QryExec(Qry1,'update T2020 set F07=F07+'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F03='''+Table2F02.AsString+'''',False);
  //更新领料单
  if (Table2F09.AsInteger = 0) and (Table2F07.AsString <> '') then //原料
    UpdateMTakeQty(Qry1, '+',Table2F20,Table2F07,Table2F08);
  if (Table2F07.AsString <> '') and (Table2F08.AsString = '')  then //半成品
    UpdateSTakeQty(Qry1, '+',Table2F03,Table2F07,Table2F09);
end;

procedure TFM_2150.Table1CalcFields(DataSet: TDataSet);
var
  iDSum:real;
begin
  inherited;

  iDSum := 0;
  QryExec(Qry1,'select F01,sum(F05) as DSum from T2150A Where F01='''+Table1F01.AsString+''''+'Group by F01');
  iDSum := Qry1.fieldbyname('DSum').asFloat;
  if Table1F06.AsString = '外加' then
  begin
    Table1CalF08.asFloat := DealFractional(Table1F07.AsFloat * iDSum,2);
    Table1CalF10.AsFloat := iDSum;
    Table1CalF09.AsFloat := iDSum;
  end;
  if Table1F06.AsString = '内含'  then
  begin
    Table1CalF08.AsFloat := DealFractional(Table1F07.AsFloat * iDSum,2);
    Table1CalF10.AsFloat := DealFractional(iDSum*(1-Table1F07.AsFloat),2);
    Table1CalF09.AsFloat := iDSum;
  end;
  if Table1F06.AsString = '免税' then
  begin
    Table1CalF08.AsFloat := 0;
    Table1CalF10.AsFloat := iDSum;
    Table1CalF09.AsFloat := iDSum;
  end;
 Table1CalPay.AsFloat := Table1CalF10.AsFloat + Table1CalF08.AsFloat;
end;

procedure TFM_2150.Table2CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table2CalF05.AsFloat := DealFractional(Table2F03.AsFloat * Table2F04.AsFloat,2);
 end;

procedure TFM_2150.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
 //把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  Table2F05.AsFloat := Table2CalF05.AsFloat;
end;

procedure TFM_2150.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
  
  InforDisplay(DataSet,'半成品委外入库单明细档');
  Table1.Edit;
  Table1.Post;
end;

procedure TFM_2150.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  Select_Data(DataSource1,'委外厂商点选窗口','select F01 as 编号,F03 AS 厂商简称,F21 AS 币别,F22 AS 税别,F23 AS 税率 from T1030','STK0311',['F03','F04','F06','F07'],[0,2,3,4],[]);
end;




procedure TFM_2150.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'半成品委外入库单明细档');
end;

procedure TFM_2150.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := False;
  InforDisplay(DataSet,'半成品委外入库单主档');
end;

procedure TFM_2150.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Table1.State in [dsinsert] then
  begin
    DBDateEdit1.Enabled := True;
    DBComboBox1.Enabled := true;
  end
  else
  begin
    DBDateEdit1.Enabled := false;
    DBComboBox1.Enabled := false;
  end;

  InforDisplay(DataSet,'半成品委外入库单主档');
end;

procedure TFM_2150.DBDateEdit1Exit(Sender: TObject);
begin
  inherited;

  if (Table1F12.AsString='') and (Table1F02.AsString<>'') and (Table1F03.AsString<>'') then
  begin
    //取对应厂商的结帐日
    QryExec(Qry1,'select F20 from T1030 where F01='''+Table1F03.AsString+'''');
    if Qry1.FieldByName('F20').AsInteger = 0 then
      Table1F12.AsString := copy(formatdatetime('YYYYMM',Table1F02.AsDateTime),3,4)
    else
    begin
      if strtoint(formatdatetime('dd',Table1F02.AsDateTime)) < Qry1.FieldByName('F20').AsInteger  then
        Table1F12.AsString := copy(formatdatetime('YYYYMM',Table1F02.AsDateTime),3,4)
      else
      begin
        if (formatdatetime('MM',Table1F02.AsDateTime)='12') then
          Table1F12.AsString := Copy(inttostr(strtoint(formatdatetime('YY',Table1F02.AsDateTime))+1+100),2,2)+'01'
        else Table1F12.AsString := formatdatetime('YY',Table1F02.AsDateTime)+Copy(inttostr(strtoint(formatdatetime('MM',Table1F02.AsDateTime))+1+100),2,2);
      end;
    end;
  end;

end;

procedure TFM_2150.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  Table1F02.AsDateTime := Date;
  DBDateEdit1.Enabled := true;
end;

procedure TFM_2150.SB3Click(Sender: TObject);
begin
  inherited;
  Search_MasterDetailex(table1,[0,1,1,2],table2,[23,3,4],[0,1,2],[23,3,9,4],['T1030','T1070'],['F01','AutoNo'],['F03','F01,F02,F03,F04,F05,F07'],['厂商简称','型号,品名,材质,规格,心孔,单重'],['M.F03','D.F02'],'');
end;

procedure TFM_2150.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('RP_2150')=nil then
    RP_2150 := TRP_2150.Create(Application);
  with Rp_2150 do
  begin
    Query1.Close;
    Query1.Params[0].AsString := Table1F01.AsString;
    Query1.Open;
    Preview;
  end;
end;

procedure TFM_2150.Table2F20Change(Sender: TField);
begin
  inherited;
  lNeedCalWeigh := false;
  if lNeedCalQty then
  Try
     table2f03.AsFloat := DealFractional(table2F20.AsFloat/table2lkf07.AsFloat ,2);
  Except
     Table2F03.AsFloat := 0;
  end;
  lNeedCalWeigh := true;
end;

procedure TFM_2150.Table2F03Change(Sender: TField);
begin
  inherited;
  lNeedCalQty := false;
  if lNeedCalWeigh  then
  Try
     table2F20.AsFloat := DealFractional(table2F03.AsFloat * table2lkf07.AsFloat,2);
  Except
     Table2F20.AsFloat := 0;
  end;
  lNeedCalQty := true;
end;

procedure TFM_2150.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2150.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if IfEdit = '0' then
     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     IfEdit :='0';
end;

procedure TFM_2150.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2150.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2150.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;

     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     
end;

procedure TFM_2150.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

end.
