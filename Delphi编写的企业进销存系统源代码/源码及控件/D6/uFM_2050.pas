unit uFM_2050;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  ToolEdit, RXDBCtrl;

type
  TFM_2050 = class(TS_MasterDetail_With_Item)
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
    Table2D_SN: TSmallintField;
    Table2F02: TStringField;
    Table2F03: TFloatField;
    Table2F04: TFloatField;
    Table2F05: TFloatField;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Table2F01: TStringField;
    DBDateEdit1: TDBDateEdit;
    Table2K_SN: TIntegerField;
    RxDBComboEdit1: TRxDBComboEdit;
    RxDBComboEdit2: TRxDBComboEdit;
    Table1lk_FirmName: TStringField;
    Table1lk_Rate: TStringField;
    Table2lk_MaterialName: TStringField;
    Table2lk_MaterialGuiGe: TStringField;
    DBComboBox1: TDBComboBox;
    Table2Cal_Money: TFloatField;
    Table1F12: TStringField;
    Table1F13: TStringField;
    Table2F06: TStringField;
    DBEdit2: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBComboBox2: TDBComboBox;
    Table1Cal_PayMoney: TFloatField;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Table2Buser: TStringField;
    Table2Btime: TDateTimeField;
    Table2Euser: TStringField;
    Table2Etime: TDateTimeField;
    procedure DBGrid1EditButtonClick(Sender: TObject);  override;
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure Table2CalcFields(DataSet: TDataSet);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table2AfterDelete(DataSet: TDataSet);
    procedure Table1F06Change(Sender: TField);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1F07Change(Sender: TField);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table2BeforeEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CalMoney;
    procedure DetailEdit(DataSet: TDataSet); override;
    procedure DetailUpdate(DataSet: TDataSet); override;
    { Public declarations }
  end;

var
  FM_2050: TFM_2050;
  IfEdit : string='0';
//调用方法 :
//UpdateDatumStock(Qry1,'原.or.物表名','+','库存重量栏位', 领(退)重量,物品编号)
//eg:UpdateDatumStock(Qry1,'T1050','+','F04',Table2F03,Table2F02)
  procedure UpdateDatumStock(EQry: TQuery; TbNm,kind,QtyFdNm: string;  QtyFd, AutoNoFd: TField);  //cang ku geng xin
  procedure UpdateDatumStock1(EQry: TQuery; TbNm,kind,QtyFdNm: string;  QtyFd, AutoNoFd,CaiNo: TField); //Cai gou dan geng xin

implementation
uses utilities,uDM, uFM_2030, uFunction, uRp_2050;

{$R *.DFM}
procedure UpdateDatumStock(EQry: TQuery; TbNm,kind,QtyFdNm: string;QtyFd, AutoNoFd: TField);
begin
  if not DM.DB.InTransaction then
    DM.DB.StartTransaction;
  try
    QryExec(EQry, Format('UPDATE %s SET %s = %s %s%f WHERE F01 = ''%s''',
            [TbNm,QtyFdNm,QtyFdNm,kind,QtyFd.AsFloat,AutoNoFd.Asstring]), False);
  except
    R_OkMessage(['内部发生错误,请重新再试一次!'],'');
    raise;
  end;
end;

procedure UpdateDatumStock1(EQry: TQuery; TbNm,kind,QtyFdNm: string;QtyFd, AutoNoFd,CaiNo: TField);
begin
  if not DM.DB.InTransaction then
    DM.DB.StartTransaction;
  try
    QryExec(EQry, Format('UPDATE %s SET %s = %s %s%f WHERE F02 = ''%s'' and F01 = ''%s''',
            [TbNm,QtyFdNm,QtyFdNm,kind,QtyFd.AsFloat,AutoNoFd.Asstring,CaiNo.asstring]), False);
  except
    R_OkMessage(['内部发生错误,请重新再试一次!'],'');
    raise;
  end;
end;

procedure TFM_2050.CalMoney;
begin
  QryExec(Qry1,'select sum(F05) as money from T2050A where F01='+''''+Table1F01.AsString+'''');
  if Table1F06.AsString='外加'  then begin
     Table1F09.Asfloat := Qry1.FieldByName('Money').asfloat; //明细总额
     Table1F10.Asfloat := Qry1.FieldByName('Money').asfloat; //进料总额
     Table1F08.Asfloat := Qry1.FieldByName('Money').asfloat*Table1F07.asfloat; //税额
  end;
  if Table1F06.AsString='免税' then begin
     Table1F09.Asfloat := Qry1.FieldByName('Money').asfloat; //明细总额
     Table1F10.Asfloat := Qry1.FieldByName('Money').asfloat; //进料总额
     Table1F08.Asfloat := 0; //税额
  end;
  if Table1F06.AsString='内含'  then begin
     Table1F09.Asfloat := Qry1.FieldByName('Money').asfloat; //明细总额
     Table1F10.Asfloat := Qry1.FieldByName('Money').asfloat*(1-Table1F07.asfloat); //进料总额
     Table1F08.Asfloat := Qry1.FieldByName('Money').asfloat*Table1F07.asfloat; //税额
  end;
end;

procedure TFM_2050.DBGrid1EditButtonClick(Sender: TObject);
begin
  if DBGrid1.SelectedField = Table2F06 then begin
     if Table1F13.AsString = '进' then
        select_data(DataSource2,'采购单点选窗口','select D.F01 as 采购单号,D.F02 as 原料编号,W.F02 as 品名,W.F03 as 规格, D.F04 as 单价 ,D.F03 as 重量,D.F07 as 己进重量 ,D.F03-D.F07 as 未进重量 from T2030A as D left join T2030 as M on D.F01=M.F01 left join T1050 as W On D.F02=W.F01 where M.F03='+''''+Table1F03.AsString+''''+' and D.f03-D.f07>0',
            'STK0311',['F06','F02','F03','F04'],[0,1,7,4],[76,52,76,88,50,50,51,51])
     else
        select_data(DataSource2,'采购单点选窗口','select D.F01 as 采购单号,D.F02 as 原料编号,W.F02 as 品名,W.F03 as 规格, D.F04 as 单价 ,D.F03 as 重量,D.F07 as 己进重量 ,D.F03-D.F07 as 未进重量 from T2030A as D left join T2030 as M on D.F01=M.F01 left join T1050 as W On D.F02=W.F01 where M.F03='+''''+Table1F03.AsString+''''+' and D.f07>0',
            'STK0311',['F06','F02','F03','F04'],[0,1,6,4],[76,52,76,88,50,50,51,51]);
     DM.Q_T1050.Close;
     DM.Q_T1050.open;
  end;
  inherited;

end;

procedure TFM_2050.RxDBComboEdit1ButtonClick(Sender: TObject);
var
  sDate : string;
begin
  inherited;
  if select_data(DataSource1,'原料供应商点选窗口','select M.F01 as 供应商编号,M.F02 as 名称 ,M.F21 as 币别, M.F22 as 税别,M.F23 as 税率,D.F02 as 汇率 from T1020 as M left join T1100 as D On M.F21=D.F01 ',
           'STK0311',['F03','F04','F06','F07','F05'],[0,2,3,4,5],[70,210]) =false then
     abort;
  QryExec(Qry1,'select F20 from T1020 where F01='+''''+Table1F03.asstring+'''');  //计算结账日
  sDate := FormatDateTime('yyyymmdd',Table1F02.AsDateTime);

  if trim(Qry1.FieldByName('F20').asstring) ='0' then
     Table1F12.AsString := '月底'
  else
     if strtoint(copy(sDate,7,2)) > qry1.fieldbyname('F20').asFloat then
        Table1F12.AsString := inttostring(strtoint(copy(sDate,3,4))+1,4)
     else
        Table1F12.AsString := inttostring(strtoint(copy(sDate,3,4)),4) ;

  DM.Q_T1020.Close;
  DM.Q_T1020.open;
end;

procedure TFM_2050.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  select_data(DataSource1,'币别点选窗口','select F01 as 币别,F02 as 汇率 from T1100','STK0311',['F04','F05'],[0,1],[]);
  DM.Q_T1100.Close;
  DM.Q_T1100.open;
end;

procedure TFM_2050.Table2CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table2Cal_Money.AsFloat :=Table2F03.AsFloat*Table2F04.AsFloat;
end;

procedure TFM_2050.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
  if Table1F13.AsString = '进' then begin       //进退重量是否超过 采购的判断
     QryExec(Qry1,'select (F03-F07) as xNum from T2030A where F01='+''''+Table2F06.AsString+''''+' and F02='+''''+Table2F02.AsString+'''');
     if Table2F03.AsFloat > Qry1.FieldByName('xNum').asfloat then
        if R_YesNoMessage(['本笔资料进料量大于还可采购量,您确定保存吗?'])=false then
           abort;
  end
  else begin
    QryExec(Qry1,'select F07 as xNum from T2030A where F01='+''''+Table2F06.AsString+''''+' and F02='+''''+Table2F02.AsString+'''');     if Table2F03.AsFloat > Qry1.FieldByName('xNum').asfloat then
    if Table2F03.AsFloat > Qry1.FieldByName('xNum').asfloat then
       if R_YesNoMessage(['本笔资料退料量大于还可退料量,您确定保存吗?'])=false then
           abort;
  end;
  Table2F05.asfloat :=Table2Cal_Money.AsFloat;
  InforSave(DataSet);

end;

procedure TFM_2050.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  RequiredValue(Table1F03);
  if table1.State = dsinsert then begin
     if Table1F13.AsString = '进' then
        Auto_Item_Number(Table1,'F01',cYYMMDD_xxxs,'A',True,Table1F02.AsDateTime)
     else
        Auto_Item_Number(Table1,'F01',cYYMMDD_xxxs,'B',True,Table1F02.AsDateTime);
  end;
  InforSave(DataSet);
end;

procedure TFM_2050.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
  IfEdit := '1';
  table1.edit;
  CalMoney;
  table1.post;
  InforDisplay(DataSet, '原料进(退)料单');

  if Table2.RecordCount <> 0 then
     RxDBComboEdit1.Enabled := False
  else
     RxDBComboEdit1.Enabled := True;
end;

procedure TFM_2050.Table2AfterDelete(DataSet: TDataSet);
begin
  inherited;
  IfEdit := '1';
  table1.edit;
  CalMoney;
  table1.post;
  if Table2.RecordCount <> 0 then
     RxDBComboEdit1.Enabled := False
  else
     RxDBComboEdit1.Enabled := True;  
end;

procedure TFM_2050.Table1F06Change(Sender: TField);
begin
  inherited;
  CalMoney;
end;

procedure TFM_2050.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := true;
  DBComboBox2.Enabled := true;
  Table1F02.AsDateTime := date;
end;

procedure TFM_2050.Table1F07Change(Sender: TField);
begin
  inherited;
  CalMoney;
end;

procedure TFM_2050.DetailEdit(DataSet: TDataSet);
begin
  if DBComboBox2.text ='进' then
   begin
     UpdateDatumStock(Qry1,'T1050','-','F04',Table2F03,Table2F02);
     UpdateDatumStock(Qry1,'T1050','-','F12',Table2F03,Table2F02);
   end
  else
   begin
     UpdateDatumStock(Qry1,'T1050','+','F04',Table2F03,Table2F02);
     UpdateDatumStock(Qry1,'T1050','+','F12',Table2F03,Table2F02);
   end;

  if DBComboBox2.text ='进' then
     UpdateDatumStock1(Qry1,'T2030A','-','F07',Table2F03,Table2F02,Table2F06)
  else
     UpdateDatumStock1(Qry1,'T2030A','+','F07',Table2F03,Table2F02,Table2F06);

end;

procedure TFM_2050.DetailUpdate(DataSet: TDataSet);
begin
  if DBComboBox2.text ='进' then
   begin
     UpdateDatumStock(Qry1,'T1050','+','F04',Table2F03,Table2F02);
     UpdateDatumStock(Qry1,'T1050','+','F12',Table2F03,Table2F02);
   end
  else
   begin
     UpdateDatumStock(Qry1,'T1050','-','F04',Table2F03,Table2F02);
     UpdateDatumStock(Qry1,'T1050','-','F12',Table2F03,Table2F02);
   end;

  if DBComboBox2.text ='进' then
     UpdateDatumStock1(Qry1,'T2030A','+','F07',Table2F03,Table2F02,Table2F06)
  else
     UpdateDatumStock1(Qry1,'T2030A','-','F07',Table2F03,Table2F02,Table2F06);

end;

procedure TFM_2050.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (table1.state = dsBrowse) then begin
     DBDateEdit1.Enabled := false;
     DBComboBox2.Enabled := false;
  end;

  if (Table1.State = dsBrowse) and (Table2.RecordCount <> 0) then
     RxDBComboEdit1.Enabled := False
  else
     RxDBComboEdit1.Enabled := True;

  InforDisplay(DataSet, '原料进(退)料单');
end;

procedure TFM_2050.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := false;
  DBComboBox2.Enabled := false;
  InforDisplay(DataSet, '原料进(退)料单');
end;

procedure TFM_2050.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2050.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2050.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2050.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2050.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if IfEdit = '0' then
     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     IfEdit :='0';
end;

procedure TFM_2050.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  IfDo('修改',Qry1,GlobalUser,Hint,'F04');
end;

procedure TFM_2050.FormCreate(Sender: TObject);
begin
  inherited;
  if IfHaveRight(Qry1,GlobalUser,Hint,'F06')=false then begin
     DBEdit9.Visible := false;
     DBEdit10.Visible := false;
     DBEdit11.Visible := false;
     DBGrid1.Columns[6].Visible := false;
     DBGrid1.Columns[7].Visible := false;
     Label8.Visible := false;
     Label9.Visible := false;
     Label10.Visible := false;
     DBEdit3.Visible := false;
     Label4.Visible := false;
  end ;
  if IfHaveRight(Qry1,GlobalUser,Hint,'F05')=false then
     SB2.Visible := false;
end;

procedure TFM_2050.Table1CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table1Cal_PayMoney.asfloat := Table1F08.asfloat +Table1F10.asfloat;
end;

procedure TFM_2050.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet, '原料进(退)料单');
end;

procedure TFM_2050.SB3Click(Sender: TObject);
begin
  inherited;
  Search_MasterDetailex(table1,[0,1,1,2],table2,[3,4],[0,1,2,11,12],[3,4,5,6,7],['T1020','T1050'],['F01','F01'],['F02','F02,F03'],['厂商名称','品名,规格'],['M.F03','D.F02'],'');
end;

procedure TFM_2050.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_2050')=nil then
    Rp_2050 := TRp_2050.Create(self);
  with Rp_2050 do
  begin
   Query1.Close;
   Query1.Params[0].AsString := Table1F01.AsString;
   Query1.params[1].AsString := Table1F13.AsString;
   IF DBComboBox2.Text = '进' then
      QRLabel1.Caption := '原料进料单'
   else
      QRLabel1.Caption := '原料退料单';
   Query1.Open;
   Preview;
  end;
end;

end.
