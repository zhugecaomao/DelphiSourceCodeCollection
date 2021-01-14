unit uFm_2020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  RXDBCtrl, RxDBComb, ToolEdit;

type
  TFm_2020 = class(TS_MasterDetail_With_Item)
    Table1F01: TStringField;
    Table1F02: TDateTimeField;
    Table1F03: TIntegerField;
    Table1F04: TStringField;
    Table1F05: TFloatField;
    Table1F06: TFloatField;
    Table1F07: TFloatField;
    Table1F08: TDateTimeField;
    Table1F11: TStringField;
    Table1Buser: TStringField;
    Table1Btime: TDateTimeField;
    Table1Euser: TStringField;
    Table1Etime: TDateTimeField;
    Table2F01: TStringField;
    Table2K_SN: TIntegerField;
    Table2D_SN: TSmallintField;
    Table2F02: TStringField;
    Table2F03: TStringField;
    Table2F04: TStringField;
    Table2F05: TStringField;
    Table2F06: TStringField;
    Table2F07: TStringField;
    Table2F08: TStringField;
    Table2F09: TFloatField;
    Table2F10: TFloatField;
    Table2F11: TFloatField;
    Table2Buser: TStringField;
    Table2Btime: TDateTimeField;
    Table2Euser: TStringField;
    Table2Etime: TDateTimeField;
    Table1F09: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboEdit1: TRxDBComboEdit;
    Table1F12: TStringField;
    Table1F13: TStringField;
    Table1F14: TStringField;
    Table1F15: TStringField;
    Table1F16: TStringField;
    RxDBComboEdit2: TRxDBComboEdit;
    Qry2: TQuery;
    Qry3: TQuery;
    Qry4: TQuery;
    Table1F17: TDateTimeField;
    Label15: TLabel;
    Table1F18: TIntegerField;
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure RxDBComboBox1Change(Sender: TObject);
    procedure SB0Click(Sender: TObject);
    procedure SB4Click(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1AfterDelete(DataSet: TDataSet);
    procedure RxDBComboBox1Exit(Sender: TObject);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure SB2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure CreMrp(PinNo : string='';lei: string='';MRPNum : Double=1); //物品编号，物品类，物品制造量
    { Public declarations }
  end;

var
  Fm_2020: TFm_2020;
  befVal : string='0';
  befDingNo : string;
  befWuNo : string;
  x :integer = 1;     //MRP 明细项次
implementation

{$R *.DFM}
uses utilities,uFunction, uRp_2020 ;

procedure TFm_2020.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  Table1F02.AsDateTime := date;
end;

procedure TFm_2020.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  RequiredValue(Table1F12);
  Table1F08.AsDateTime := now;
  InforSave(DataSet);
  if table1.State = dsinsert then
     Auto_Item_Number(Table1,'F01',cYYMMDD_xxxs,'A',true,Table1F02.AsDateTime);
    qryexec(Qry3,'update T2010A set F08=F08-'+befval+' where F01='+''''+befDingNo+''''+ ' and F02='+''''+BefWuNo+'''' ,false);

end;

procedure TFm_2020.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
 // inherited;
  if Table1F09.AsString='半成品' then
      select_data(DataSource1,'半成品点选窗口','select M.F01 as 型号,M.F02 as 品名 ,M.F03 as 材质, M.F04 as 规格,M.F05 as 心孔,M.AutoNo as 系统编号 from T1070 as M ','STK0311',['F12','F13','F14','F15','F16','F03'],[0,1,2,3,4,5],[30,80,40,124,30,0])
  else
      select_data(DataSource1,'成品点选窗口','select M.F01 as 型号,M.F02 as 品名 ,M.F03 as 材质, M.F04 as 规格,M.F05 as 心孔,M.AutoNo as 系统编号 from T1080 as M ','STK0311',['F12','F13','F14','F15','F16','F03'],[0,1,2,3,4,5],[30,80,40,124,30,0]);
end;

procedure TFm_2020.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  {if select_data(DataSource1,'订单点选窗口','select D.F01 as 订单号,W.F01 as 型号,W.F02 as 品名, w.F03 as 材质 ,W.F04 as 规格,w.F05 as 心孔,D.F08 as 己开制造量 ,D.F03-D.F08 as 未开制造量, D.F06 AS 交货日期,D.K_SN AS 订单项次 from T2010A as D left join T1080 as W On D.F02=W.AutoNo where D.f03-D.f08>0',
           'STK0311',['F03','F12','F13','F14','F15','F16','F04','F05','F06','F17','f18'],[1,2,4,3,5,0,7,7,8,9],[50,76,40,118,30,64,64,0,64,40]) then
  Table1F09.AsString := '成品'; }

   if select_data(DataSource1,'订单点选窗口','select D.F01 as 订单号,W.F01 as 型号,W.F02 as 品名, w.F03 as 材质,W.F04 as 规格,w.F05 as 心孔,D.F08 as 己开造量,D.F03-D.F08 as 未开制造量,D.F02 as 系统编号,D.K_SN as 项次 from T2010A as D left join T1080 as W On D.F02=W.AutoNo where D.f03-D.f08>0',
           'STK0311',['F03','F12','F13','F14','F15','F16','F04','F05','F06','F18'],[8,1,2,4,3,5,0,7,7,9],[76,28,76,40,118,30,64,64,0,40]) then
  Table1F09.AsString := '成品';
end;

procedure TFm_2020.RxDBComboBox1Change(Sender: TObject);
begin
  inherited;
     Table1F03.asstring :='';
     Table1F12.asstring :='';
     Table1F13.asstring :='';
     Table1F14.asstring :='';
     Table1F15.asstring :='';
     Table1F16.asstring :='';
     Table1F04.asstring :='';
     Table1F05.asstring :='0';
  if RxDBComboBox1.text='半成品' then begin
     RxDBComboEdit2.Enabled := false;
     DBEdit10.Enabled := false;
  end
  else begin
     RxDBComboEdit2.Enabled := true;
     DBEdit10.Enabled := true;
  end;
////  end;

end;


Procedure TFm_2020.CreMrp(PinNo : string='';lei: string='';MRPNum : Double=1);
var
    xQuery : TQuery;
    xx : Double;
begin
      xQuery := TQuery.create(nil);
      xQuery.DatabaseName :='STK0311';
      xQuery.SQL.Add('select F01,F02,F03,F04,F05 from T1091 where F01='+''''+PinNo+''''+' and F04='+''''+lei+'''');
      xQuery.Open;        // 根据BOM和主档成品或半成品编号选出构成之资料
      xQuery.First;
      while not xQuery.Eof do
      begin
        with Qry1 do begin
          sql.Clear;
          sql.add('insert  T2020A(F01,K_SN,D_SN,F02,F03,F04,F05,F06,F07,F08,F09,F10,F11) values(:F01,:K_SN,:D_SN,:F02,:F03,:F04,:F05,:F06,:F07,:F08,:F09,:F10,:F11)');
          Params[0].asstring := Table1F01.asstring;  //  加入构成明细：加入相应的栏位，且有当前库存量，要算出需求量：半成品是当前库存量，原料和客户来料，是所要总量，不考卢库存
          Params[1].asfloat := x;
          Params[2].asfloat := x;
          x := x+1;
          Params[3].asstring :=xQuery.fields[1].AsString; //xQuery.FieldValues['F02'];

          if xQuery.fields[4].AsString ='半成品' then begin
             qryexec(Qry2,'select F01,F02,F03,F04,F05,F06,F12 from T1070 where AutoNo='+xQuery.FieldValues['F02']);
             Params[4].asstring :=Qry2.fields[0].AsString;   //Qry2.FieldValues['F01'];
             Params[5].asstring :=Qry2.fields[1].AsString;  //Qry2.FieldValues['F02'];
             Params[6].asstring :=Qry2.fields[3].AsString;  //Qry2.FieldValues['F04'];
             Params[7].asstring :=Qry2.fields[2].AsString;  //Qry2.FieldValues['F03'];
             Params[8].asstring :=Qry2.fields[4].AsString;  //Qry2.FieldValues['F05'];
             Params[10].asfloat :=Qry2.fields[5].Asfloat;  //Qry2.FieldValues['F06'];
             if Qry2.fields[6].Asfloat >= xQuery.fields[2].AsFloat*MRPnum then
                Params[11].asfloat := xQuery.fields[2].AsFloat*MRPnum
             else
                Params[11].asfloat :=Qry2.fields[6].AsFloat;

             qryexec(Qry3,'update T1070 set F12=F12-'+Params[11].asstring+' where AutoNo='+''''+Params[3].asstring+'''',false);
          end;

          if xQuery.fields[4].AsString ='原料' then begin
             qryexec(Qry2,'select F01,F02,F03,F04 from T1050 where F01='+''''+xQuery.FieldValues['F02']+'''');
             Params[4].asstring :=Qry2.fields[0].AsString;//Qry2.FieldValues['F01'];
             Params[5].asstring :=Qry2.fields[1].AsString;//Qry2.FieldValues['F02'];
             Params[6].asstring :='';
             Params[7].asstring :=Qry2.fields[2].AsString;//Qry2.FieldValues['F03'];
             Params[8].asstring :='';
             Params[10].asfloat :=Qry2.fields[3].asfloat;//Qry2.FieldValues['F04'];
             Params[11].asfloat :=xQuery.fields[2].AsFloat*MRPnum;
             qryexec(Qry3,'update T1050 set F12=F12-'+Params[11].asstring+' where F01='+''''+Params[3].asstring+'''',false);

          end;

          if xQuery.fields[4].AsString ='客户来料' then begin
             qryexec(Qry2,'select F01,F02,F03,F04,F05,F06 from T1090 where AutoNo='+xQuery.FieldValues['F02']) ;
             Params[4].asstring :=Qry2.fields[0].AsString;//Qry2.FieldValues['F01'];
             Params[5].asstring :=Qry2.fields[1].AsString;//Qry2.FieldValues['F02'];
             Params[6].asstring :=Qry2.fields[2].asstring;//Qry2.FieldValues['F03'];
             Params[7].asstring :=Qry2.fields[3].asstring;//Qry2.FieldValues['F04'];
             Params[8].asstring :=Qry2.fields[4].asstring;//Qry2.FieldValues['F05'];
             Params[10].asfloat :=Qry2.fields[5].asfloat;//Qry2.FieldValues['F06'];
             Params[11].asfloat :=xQuery.fields[2].AsFloat*MRPnum;
             qryexec(Qry3,'update T1090 set F12=F12-'+Params[11].asstring+' where AutoNo='+''''+Params[3].asstring+'''',false);

          end;
             Params[9].asstring := xQuery.fields[4].asstring;
             Params[12].asfloat := 0;
          //判断是否已有此物品 在同一单中
         qryexec(qry4,'select F01 from T2020A where F02='+''''+Params[3].asstring+'''' +' and F08='+''''+Params[9].asstring+''''+' and F01='+''''+DBEdit1.text+'''');
         if qry4.RecordCount < 1 then
            Qry1.ExecSQL
         else
            qryexec(qry4,'update T2020A set F10 = F10 +'+Params[11].asstring+ ' where F02='+''''+Params[3].asstring+'''' +' and F08='+''''+Params[9].asstring+''''+' and F01='+''''+DBEdit1.text+'''',false);


      end;
        xx :=MRPnum;
        if (xQuery.fields[4].asstring ='半成品') and (Qry2.fields[6].asfloat < xQuery.fields[2].asfloat*MRPnum) then begin
          // MRPnum :=MRPnum -Qry1.Params[11].asfloat;
           MRPnum := xQuery.fields[2].AsFloat*MRPnum - Qry2.fields[6].Asfloat;

           CreMrp(xQuery.fields[1].asstring,xQuery.fields[4].asstring,MRPnum);

        end;
        MRPnum := xx;


        xQuery.Next;

  end;
  xquery.Free;
end;


procedure TFm_2020.SB0Click(Sender: TObject);
begin
//  IfDo('产生MRP',Qry1,GlobalUser,Hint,'F02');
  x :=1;
  if table1.State in [dsedit,dsinsert] then begin
     R_OkMessage(['请先保存记录,再产生MRP!'],'',MB_ICONWARNING);
     abort;
  end;

  CreMrp(Table1F03.AsString,Table1F09.asstring,Table1F06.asfloat);
  Table2.active:=false;
  Table2.active:=true;

  if (Table2F01.asstring = '') then
     SB0.Enabled := true
  else
     SB0.Enabled := false;
end;

procedure TFm_2020.SB4Click(Sender: TObject);
begin
 // inherited;
 //IfDo('取消MRP',Qry1,GlobalUser,Hint,'F03');

  table2.first;
  while not table2.Eof do
  begin
    if Table2F08.AsString ='半成品' then
       qryexec(Qry3,'update T1070 set F12=F12+'+Table2F10.asstring+' where AutoNo='+''''+Table2F02.asstring+'''',false);
    if Table2F08.AsString ='原料' then
       qryexec(Qry3,'update T1050 set F12=F12+'+Table2F10.asstring+' where F01='+''''+Table2F02.asstring+'''',false);
    if Table2F08.AsString ='客户来料' then
       qryexec(Qry3,'update T1090 set F12=F12+'+Table2F10.asstring+' where AutoNo='+''''+Table2F02.asstring+'''',false);
    table2.next;
  end;
  Qryexec(qry3,'delete from T2020A where F01='+''''+Table1F01.AsString+'''',false);
  Table2.active:=false;
  Table2.active:=true;
  SB0.Enabled := true;
end;

procedure TFm_2020.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Table1F09.asstring='半成品' then begin
     RxDBComboEdit2.Enabled := false;
     DBEdit10.Enabled := false;
  end
  else begin
     RxDBComboEdit2.Enabled := true;
     DBEdit10.Enabled := true;
  end;

  InforDisplay(DataSet, '制令单');

  if (Table2F01.asstring = '') then
     SB0.Enabled := true
  else
     SB0.Enabled := false;
end;

procedure TFm_2020.Table1BeforeDelete(DataSet: TDataSet);
begin
 // inherited;
 IfDo('删除',Qry1,GlobalUser,Hint,'F03');
  if table2F01.asstring <>'' then
     SB4Click(SB4);
  qryexec(Qry3,'update T2010A set F08=F08-'+Table1F05.asstring+' where F01='+''''+Table1F04.asstring+''''+ ' and K_SN='+''''+Table1F18.AsString+''''+' and F02='+''''+Table1F03.asstring+'''' ,false);

end;

procedure TFm_2020.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  qryexec(Qry3,'update T2010A set F08=F08+'+Table1F05.asstring+' where F01='+''''+Table1F04.asstring+''''+ ' and K_SN='+''''+Table1F18.AsString+''''+' and F02='+''''+Table1F03.asstring+'''' ,false);
  InforDisplay(DataSet, '制令单');
  if (Table2F01.asstring = '') then
     SB0.Enabled := true
  else
     SB0.Enabled := false;
end;

procedure TFm_2020.SB3Click(Sender: TObject);
begin
  inherited;
     Search_MasterDetailNoLook(table1,[0,1,1,3,4],table2,[3,4,5,6],[0,1,3,4,5],[3,4,5,6],'');
end;

procedure TFm_2020.Table1BeforeEdit(DataSet: TDataSet);
begin
  IfDo('修改',Qry1,GlobalUser,Hint,'F04');
  if table2.RecordCount >= 1 then begin
     R_OkMessage(['请先取消MRP,再修改主档!'],'',MB_ICONWARNING);
     abort;
  end;
  befVal := Table1F05.asstring;
  befDingNo:= Table1F04.asstring;
  befWuNo := Table1F03.asstring;
  inherited;
end;

procedure TFm_2020.Table1AfterDelete(DataSet: TDataSet);
begin
  inherited;
  if (Table2F01.asstring = '') then
     SB0.Enabled := true
  else
     SB0.Enabled := false;
end;

procedure TFm_2020.RxDBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if table1.state in [dsedit,dsinsert] then
     Table1F09.asstring :=RxDBComboBox1.Text;

end;

procedure TFm_2020.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  befVal :='0';
  befDingNo:='';
  befWuNo := '';
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFm_2020.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_2020')=nil then
    Rp_2020 := TRp_2020.Create(self);
  with Rp_2020 do
  begin
   Query1.Close;
   Query1.Params[0].AsString := Table1F01.AsString;
   Query1.Open;
   Preview;
  end;
end;

end.
