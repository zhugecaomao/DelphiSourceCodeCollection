unit uFM_2030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  ToolEdit, RXDBCtrl;

type
  TFM_2030 = class(TS_MasterDetail_With_Item)
    Table1F01: TStringField;
    Table1F02: TDateTimeField;
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
    Table2F06: TDateTimeField;
    Table2F07: TFloatField;
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
    Table1lk_Rate: TStringField;
    Table2lk_MaterialName: TStringField;
    Table2lk_MaterialGuiGe: TStringField;
    DBComboBox1: TDBComboBox;
    Table2Cal_Money: TFloatField;
    Table1F03: TStringField;
    Table1lk_FirmsName: TStringField;
    Table1Cal_PayMoney: TFloatField;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Table2Buser: TStringField;
    Table2Btime: TDateTimeField;
    Table2Euser: TStringField;
    Table2Etime: TDateTimeField;
    Label6: TLabel;
    procedure DBGrid1EditButtonClick(Sender: TObject); override;
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
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table2BeforeEdit(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CalMoney;
    { Public declarations }
  end;

var
  FM_2030: TFM_2030;
  IfEdit : string='0';

implementation
uses utilities,uDM, uFunction, uFM_SEM, uRp_2030;

{$R *.DFM}

procedure TFM_2030.CalMoney;
begin
  QryExec(Qry1,'select sum(F05) as money from T2030A where F01='+''''+Table1F01.AsString+'''');
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

procedure TFM_2030.DBGrid1EditButtonClick(Sender: TObject);
var
 iNo:string;
begin
//明细档的日期选择
  if DBGrid1.SelectedField = Table2F06 then
      AssignDBDate(Sender, DataSource2, 'F06');
  if DBGrid1.SelectedField = Table2F02 then begin
     //select_data(DataSource2,'原料点选窗口','select F01 as 原料编号,F02 as 品名, F03 as 规格 ,F07 as 参考进价 from T1050','STK0311',['F02','F04'],[0,3],[]);
     if not SelectMaterialProd(iNo) then exit;
     if Table2.State in [dsBrowse] then Table2.Edit;
     Table2F02.asstring := iNo;
     DM.Q_T1050.Close;
     DM.Q_T1050.open;
  end;
  inherited;

end;

procedure TFM_2030.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  if select_data(DataSource1,'原料供应商点选窗口','select M.F01 as 供应商编号,M.F02 as 名称 ,M.F21 as 币别, M.F22 as 税别,M.F23 as 税率,D.F02 as 汇率 from T1020 as M left join T1100 as D On M.F21=D.F01 ',
        'STK0311',['F03','F04','F06','F07','F05'],[0,2,3,4,5],[70,210]) = false then
     abort;
  DM.Q_T1020.Close;
  DM.Q_T1020.open;
end;

procedure TFM_2030.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  select_data(DataSource1,'币别点选窗口','select F01 as 币别,F02 as 汇率 from T1100','STK0311',['F04','F05'],[0,1],[]);
  DM.Q_T1100.Close;
  DM.Q_T1100.open;
end;

procedure TFM_2030.Table2CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table2Cal_Money.AsFloat :=Table2F03.AsFloat*Table2F04.AsFloat;
end;

procedure TFM_2030.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
  Table2F05.asfloat :=Table2Cal_Money.AsFloat;
  InforSave(DataSet);
end;

procedure TFM_2030.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  RequiredValue(Table1F03);
  if table1.State = dsinsert then
     Auto_Item_Number(Table1,'F01',cYYMMDD_xxxs,'A',True,Table1F02.AsDateTime);
     InforSave(DataSet);
end;

procedure TFM_2030.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
  IfEdit := '1';
  table1.edit;
  CalMoney;
  table1.post;
  InforDisplay(DataSet, '原料采购单明细档');
end;

procedure TFM_2030.Table2AfterDelete(DataSet: TDataSet);
begin
  inherited;
  IfEdit := '1';
  table1.edit;
  CalMoney;
  table1.post;
end;

procedure TFM_2030.Table1F06Change(Sender: TField);
begin
  inherited;
  CalMoney;
end;

procedure TFM_2030.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := true;
  Table1F02.AsDateTime := date;
end;

procedure TFM_2030.Table1F07Change(Sender: TField);
begin
  inherited;
  CalMoney;
end;

procedure TFM_2030.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  if table1.state = dsBrowse then
     DBDateEdit1.Enabled := false;
  InforDisplay(DataSet, '原料采购单主档');
end;

procedure TFM_2030.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := false;
  InforDisplay(DataSet, '原料采购单明细档');
end;

procedure TFM_2030.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');

 // if IfHaveRight(Qry1,GlobalUser,Hint,'F02') then
 //    showmessage('true')
 // else
  //   showmessage('false');
end;

procedure TFM_2030.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2030.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if IfEdit = '0' then
     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     IfEdit :='0';
end;

procedure TFM_2030.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  IfDo('修改',Qry1,GlobalUser,Hint,'F04');
end;

procedure TFM_2030.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2030.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2030.FormCreate(Sender: TObject);
begin
  inherited;
  if IfHaveRight(Qry1,GlobalUser,Hint,'F06')=false then begin
     DBEdit9.Visible := false;
     DBEdit10.Visible := false;
     DBEdit11.Visible := false;
     DBGrid1.Columns[5].Visible := false;
     DBGrid1.Columns[6].Visible := false;
     Label8.Visible := false;
     Label9.Visible := false;
     Label10.Visible := false;
     DBEdit2.Visible := false;
     Label4.Visible := false;
  end ;
  if IfHaveRight(Qry1,GlobalUser,Hint,'F05')=false then
     SB2.Visible := false;


end;

procedure TFM_2030.Table1CalcFields(DataSet: TDataSet);
begin
  inherited;
  Table1Cal_PayMoney.asfloat := Table1F08.asfloat +Table1F10.asfloat;
end;

procedure TFM_2030.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet, '原料采购单明细档');
end;

procedure TFM_2030.SB3Click(Sender: TObject);
//var
//  lm, ld : tlist;
//  i : integer;
begin
{  inherited;
  LM := TList.Create;
  LD := TList.Create;
  Try
  Table2.GetDetailLinkFields(lm, ld);

  for i := 0 to lm.count-1 do
    ListBox1.Items.Add(TField(lm[i]).FieldName);

  for i := 0 to ld.count-1 do
    ListBox2.Items.Add(TField(ld[i]).FieldName);

  finally
    lm.free;
    ld.free;                                            <5,6>中参数
  end; }   //                                           要在<2,4>中
  Search_MasterDetailex(table1,[0,1,1,2],table2,[3,8],[0,1,2,3],[3,4,5,7],['T1020','T1050'],['F01','F01'],['F02','F02,F03'],['厂商名称','品名,规格'],['M.F03','D.F02'],'');
//=====================主档===主档寻找栏位=明细档=明细==主档==明细=厂商或原料资料表=厂商或原料资== 厂商或原料资料===对应显示的名称 ==========与主档或明细档关==过滤语句
//                                                寻找  显示  显示                  料表要被寻找   表要被显示栏位                            联的栏位
//                                                栏位  栏位  栏位                  栏位如编号
//                                                    (空,全部显示)
//                      <1>      <2>        <3>   <4>    <5>  <6>        <7>              <8>             <9>                  <10>                <11>        <12>

end;

procedure TFM_2030.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_2030')=nil then
    Rp_2030 := TRp_2030.Create(self);
  with Rp_2030 do
  begin
    Query1.Close;
    Query1.Params[0].AsString := Table1F01.AsString;
    Query1.Open;
    Preview;
  end;
end;

end.
