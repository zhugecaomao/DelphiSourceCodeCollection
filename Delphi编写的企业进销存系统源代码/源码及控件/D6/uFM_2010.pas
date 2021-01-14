unit uFM_2010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  RXDBCtrl, ToolEdit;

type
  TFM_2010 = class(TS_MasterDetail_With_Item)
    Table1F01: TStringField;
    Table1F02: TDateTimeField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F05: TFloatField;
    Table1F06: TStringField;
    Table1F07: TFloatField;
    Table1F08: TFloatField;
    Table1F09: TFloatField;
    Table1F10: TFloatField;
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
    Table2F04: TFloatField;
    Table2F05: TFloatField;
    Table2F06: TDateTimeField;
    Table2F07: TFloatField;
    Table2F08: TFloatField;
    Table2Buser: TStringField;
    Table2Btime: TDateTimeField;
    Table2Euser: TStringField;
    Table2Etime: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RxDBComboEdit1: TRxDBComboEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    RxDBComboEdit2: TRxDBComboEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    Table1lkF03: TStringField;
    Table2CalF05: TFloatField;
    Query1: TQuery;
    Table1CalF09: TFloatField;
    Table1CalF08: TFloatField;
    Table1CalF10: TFloatField;
    Table2lkF01: TStringField;
    Table2lkF02: TStringField;
    Table2lkF03: TStringField;
    Table2lkF04: TStringField;
    Table2lkF05: TStringField;
    Table2lkF07: TFloatField;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Table1CalTotal: TFloatField;
    Qry2: TQuery;
    Table1F12: TStringField;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    Table1F14: TStringField;
    RxDBComboEdit3: TRxDBComboEdit;
    DBEdit11: TDBEdit;
    Table1lkF14: TStringField;
    Table2F20: TFloatField;
    Table2CalF21: TFloatField;
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure Table2CalcFields(DataSet: TDataSet);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table2AfterDelete(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure RxDBComboEdit3ButtonClick(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure Table2F20Change(Sender: TField);
    procedure Table2F03Change(Sender: TField);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table2BeforeEdit(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_2010: TFM_2010;
  lNeedCalQty: boolean=true;
  lNeedCalWeigh: boolean=True;
  IfEdit : string='0';
implementation

uses uDM,utilities, uFM_SPD, uFunction, uRp_2010;

{$R *.DFM}

procedure TFM_2010.Table1AfterInsert(DataSet: TDataSet);
begin
    DBDateEdit1.Date := Date;
    DBDateEdit1.Enabled := True;
  inherited;

end;

procedure TFM_2010.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  select_data(DataSource1,'从客户资料选取','select F01 as ''客户编号'',F03 as ''客户简称'',F21 as ''币别'',F22 as ''税别'',F23 as ''税率'' from T1010  order by F01 ','STK0311',['F03','F04','F06','F07'],[0,2,3,4],[60]);
end;

procedure TFM_2010.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  select_data(DataSource1,'从币别窗选择','select F01 as ''币别'',F02 as ''参考汇率'' from T1100','STK0311',['F04','F05'],[0,1],[60,60]);
end;

procedure TFM_2010.Table1BeforePost(DataSet: TDataSet);
begin

//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;
  if (Table1.State = dsInsert) then
     Auto_Item_Number(Table1,'F01',CYYMMDD_xxxs,'A',true,Table1F02.AsDateTime);
  Table1F09.AsFloat := Table1CalF09.AsFloat;
  Table1F08.AsFloat := Table1CalF08.AsFloat;
  Table1F10.AsFloat := Table1CalF10.AsFloat;


end;

procedure TFM_2010.Table2BeforePost(DataSet: TDataSet);
begin
   Table2F05.AsFloat := Table2CalF05.AsFloat;
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;

end;

procedure TFM_2010.DBGrid1EditButtonClick(Sender: TObject);
var
  xNo:Integer;
begin
  inherited;
  if DBGrid1.SelectedField = Table2F06 then
  begin
    AssignDBDate(sender,DataSource2,'F06');
  end;

  if DBGrid1.SelectedField = Table2lkF01 then
   begin
    if not SelProd(RxDBComboEdit1.text,Table2lkF01.AsString,Table2lkF02.AsString,Table2lkF03.AsString,Table2lkF04.AsString,Table2lkF05.AsString, xNo,' And F10="'+Table1F03.AsString+'"') then exit;
      if Table2.State = dsBrowse then Table2.Edit;
      Table2F02.AsInteger := xNo;
      QryExec(Qry1,'select Max(F02) from T1080A Where AutoNo='+IntToStr(xNo));
      QryExec(Qry2,'Select F03 from T1080A where F02='''+Qry1.fields[0].AsString+''' and AutoNo='''+Table2F02.asString+'''');
      Table2F04.AsFloat := Qry2.Fields[0].AsFloat;
   end;
end;

procedure TFM_2010.Table2CalcFields(DataSet: TDataSet);
begin
  Table2CalF05.AsFloat := Table2F03.AsFloat * Table2F04.AsFloat;
  Table2CalF05.AsFloat := DealFractional(Table2CalF05.asFloat,2);
  Table2CalF21.AsFloat := Table2f03.AsFloat - table2F07.AsFloat;
  Table2CalF21.AsFloat := DealFractional(Table2CalF21.AsFloat,2);
  inherited;

end;

procedure TFM_2010.Table1CalcFields(DataSet: TDataSet);
begin
 if Table1.State in [dsBrowse] then Table1.Edit;
//计算明细总额
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('select sum(F05) as TM from T2010A where F01='''+Table1F01.AsString+'''');
  Query1.Open;
  Table1CalF09.AsFloat := Query1.Fields[0].AsFloat;
//计算税额,出货总额,应收总额
  if  Table1F06.AsString = '免税' then
    begin
     Table1CalF08.AsFloat := 0;
     Table1CalF10.AsFloat := DealFractional(Query1.Fields[0].AsFloat,2);
     Table1CalTotal.AsFloat := Table1CalF08.AsFloat + Table1CalF10.AsFloat;
    end;

  if Table1F06.AsString = '内含' then
    begin
      Table1CalF08.AsFloat := DealFractional((Query1.Fields[0].AsFloat *  Table1F07.AsFloat),2);
      Table1CalF10.AsFloat := DealFractional((Query1.Fields[0].AsFloat - Query1.Fields[0].AsFloat * Table1F07.AsFloat),2);
      Table1CalTotal.AsFloat := Table1CalF08.AsFloat + Table1CalF10.AsFloat;
    end;

  if Table1F06.AsString = '外加' then
    begin
     Table1CalF08.AsFloat := DealFractional((Query1.Fields[0].AsFloat * Table1F07.AsFloat),2);
     Table1CalF10.AsFloat := DealFractional(Query1.Fields[0].AsFloat,2) ;
     Table1CalTotal.AsFloat := Table1CalF08.AsFloat + Table1CalF10.AsFloat;
    end;


  inherited;

end;

procedure TFM_2010.Table2AfterPost(DataSet: TDataSet);
begin
  //刷新主档

  inherited;
  Table1.Refresh;
  Table1.Edit;
  Table1.Post;
   InforDisplay(DataSet,'订单明细');
end;

procedure TFM_2010.Table2AfterDelete(DataSet: TDataSet);
begin
//刷新主档
 Table1.Refresh;
  inherited;
 Table1.Edit;
 Table1.Post;
end;

procedure TFM_2010.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'订单主档');
  DBDateEdit1.Enabled := False;
end;

procedure TFM_2010.Table1AfterScroll(DataSet: TDataSet);
begin

  inherited;
  InforDisplay(DataSet,'订单主档');
  if Table1.State = dsInsert then
     DBDateEdit1.Enabled := true
  else
     DBDateEdit1.Enabled := False;

end;

procedure TFM_2010.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
   InforDisplay(DataSet,'订单明细');
end;

procedure TFM_2010.SB3Click(Sender: TObject);
begin
  inherited;
    Search_MasterDetailex(table1,[0,1,1,2,11],table2,[2,5,6],[0,2],[2,3,4,5],['T1010','T1080'],['F01','AutoNo'],['F03','F01,F02,F03,F04,F05'],['客户简称','型号,品名,材质,规格,心孔'],['M.F03','D.F02'],'');
end;

procedure TFM_2010.RxDBComboEdit3ButtonClick(Sender: TObject);
begin
  inherited;
   select_data(DataSource1,'指送厂商资料选取','select F01 as ''厂商编号'',F03 as ''厂商简称''  from T1011  order by F01 ','STK0311',['F14'],[0],[]);
end;

procedure TFM_2010.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_2010')=nil then
    Rp_2010 := TRp_2010.Create(self);
  with Rp_2010 do
  begin
   Query1.Close;
   Query1.Params[0].AsString := Table1F01.AsString;
   Query1.Open;
   Preview;
  end;
end;

procedure TFM_2010.Table2F20Change(Sender: TField);
begin
  inherited;
  lNeedCalWeigh := False;
  if lNeedCalQty then
  Try
    Table2F03.AsFloat := DealFractional((Table2F20.AsFloat/Table2lkF07.AsFloat),2) ;
  except
    Table2F03.AsFloat := 0;
  end;
  lNeedCalWeigh := true;
end;

procedure TFM_2010.Table2F03Change(Sender: TField);
begin
  inherited;
  lNeedCalQty := false;
  if lNeedCalWeigh then
  Try
     table2f20.AsFloat := DealFractional(Table2lkF07.AsFloat * Table2F03.AsFloat,2);
  Except
     Table2F20.AsFloat := 0;
  End;
  lNeedCalQty := True;
end;

procedure TFM_2010.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2010.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if IfEdit = '0' then
     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     IfEdit :='0';
end;

procedure TFM_2010.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2010.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
   IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2010.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  IfDo('修改',Qry1,GlobalUser,Hint,'F04');
end;

procedure TFM_2010.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2010.FormCreate(Sender: TObject);
begin
  inherited;
  QryExec(Qry1,'select F06 from TUserRight where K_SN =''订单'' and NM='''+GlobalUser+'''');
   if Qry1.Fields[0].AsBoolean then
   begin
     DBGrid1.Columns[9].Visible := true;
     DBGrid1.Columns[10].Visible := True;
     DBEdit9.Visible := True;
     DBEdit7.Visible := True;
     DBEdit3.Visible := True;
   end
   else
   begin
     DBGrid1.Columns[9].Visible := false;
     DBGrid1.Columns[10].Visible := false;
     DBEdit9.Visible := False;
     DBEdit7.Visible := False;
     DBEdit3.Visible := False;
   end;
end;

end.
