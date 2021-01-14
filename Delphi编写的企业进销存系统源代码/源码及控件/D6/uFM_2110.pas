unit uFM_2110;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  ToolEdit, RXDBCtrl;

type
  TFM_2110 = class(TS_MasterDetail_With_Item)
    Table1F01: TStringField;
    Table1F02: TDateTimeField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F11: TStringField;
    Table1F13: TStringField;
    Table1Buser: TStringField;
    Table1Btime: TDateTimeField;
    Table1Euser: TStringField;
    Table1Etime: TDateTimeField;
    Table2F01: TStringField;
    Table2K_SN: TIntegerField;
    Table2D_SN: TSmallintField;
    Table2F03: TFloatField;
    Table2Buser: TStringField;
    Table2Btime: TDateTimeField;
    Table2Euser: TStringField;
    Table2Etime: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBComboBox1: TDBComboBox;
    RxDBComboEdit1: TRxDBComboEdit;
    Table2lkF01: TStringField;
    Table2lkF02: TStringField;
    Table2lkF03: TStringField;
    Table2lkF04: TStringField;
    Table2lkF05: TStringField;
    Table2lkF07: TFloatField;
    Table2F02: TIntegerField;
    Table2F06: TStringField;
    Table2F20: TFloatField;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);  override;
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure Table2F20Change(Sender: TField);
    procedure Table2F03Change(Sender: TField);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1BeforeInsert(DataSet: TDataSet);
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
  FM_2110: TFM_2110;
  lNeedCalQty : boolean = true;
  lNeedCalWeigh : boolean = true;
  IfEdit : string='0';
implementation

uses uDM, uFM_SES,utilities,uFunction, uRP_2110;

{$R *.DFM}

procedure TFM_2110.Table1BeforePost(DataSet: TDataSet);
begin
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;
  { <单号> 自动编号 }
  if (Table1.State = dsInsert) then begin
    if DBComboBox1.text = '领' then
       Auto_Item_Number(Table1,'F01',cYYMMDD_xxxS,'A',True,Table1F02.AsDateTime)
    else
       Auto_Item_Number(Table1,'F01',cYYMMDD_xxxS,'B',True,Table1F02.AsDateTime)
  end;
end;

procedure TFM_2110.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := True;
  DBComboBox1.Enabled := True;
  Table1F02.AsDateTime := Date();
  Table1F13.AsString := '领';
  DBDateEdit1.SetFocus
end;

procedure TFM_2110.DBGrid1EditButtonClick(Sender: TObject);
var
  iNo: integer;
begin
  inherited;
  if DBGrid1.SelectedField = Table2lkF01 then
    if not SelSemi(Table2lkF01.AsString,Table2lkF02.AsString,Table2lkF03.AsString,Table2lkF04.AsString,Table2lkF05.AsString,iNo) then Exit;
    if Table2.State in [dsBrowse] then Table2.Edit;
    Table2F02.asinteger := iNo;

  { 点选 <制令单号> }
  if DBGrid1.SelectedField = Table2F06 then  begin
    if Select_Data(DataSource2,'制令单选取窗口','select F01 as 制令单号,F02 as 需求物品编号,F03 as 型号,F04 as 品名,F05 as 规格,F06 as 材质,F07 as 心孔,F10 as 需求量 from T2020A where F08=''半成品'' and F11<F10','STK0311',['F06','F02','F03'],[0,1,7],[80,0])
    then begin
           DBGrid1.SelectedField := Table2F03;
    end;
  end;

end;

procedure TFM_2110.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  { 点选 <领料人> }
  SelSingle_Data(DataSource1,['姓名','性别'],'Select F01,F02 From T1040 Order By F01','T1040','F04','F01','F02',True,0);
end;

procedure TFM_2110.Table2AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.SelectedField := Table2F02;
end;

procedure TFM_2110.DetailEdit(DataSet: TDataSet);
begin
  if DBComboBox1.Text = '领' then
   begin
     UpdateStock(Qry1,'T1070','+','F06',Table2F03,Table2F02);
     UpdateStock(Qry1,'T1070','+','F12',Table2F03,Table2F02);
   end
  else
   begin
    UpdateStock(Qry1,'T1070','-','F06',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1070','-','F12',Table2F03,Table2F02);
   end;

  if (DBComboBox1.Text = '领') and (Table2F06.asstring <> '') then
    QryExec(Qry1,'update T2020A set F11=F11-'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False)
  else
    QryExec(Qry1,'update T2020A set F11=F11+'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False);

end;

procedure TFM_2110.DetailUpdate(DataSet: TDataSet);
begin
  if DBComboBox1.Text = '领' then
   begin
    UpdateStock(Qry1,'T1070','-','F06',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1070','-','F12',Table2F03,Table2F02);
   end
  else
   begin
    UpdateStock(Qry1,'T1070','+','F06',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1070','+','F12',Table2F03,Table2F02);
   end;

  if (DBComboBox1.Text = '领') and (Table2F06.asstring <> '') then
    QryExec(Qry1,'update T2020A set F11=F11+'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False)
  else
    QryExec(Qry1,'update T2020A set F11=F11-'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False);

end;

procedure TFM_2110.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := False;
  DBComboBox1.Enabled := False;
//显示资料新增与修改记录
  InforDisplay(Dataset,'半成品内制领(退)料主档');
end;

procedure TFM_2110.Table2BeforePost(DataSet: TDataSet);
begin
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;

end;

procedure TFM_2110.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'半成品内制领(退)料主档');
end;

procedure TFM_2110.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'半成品内制领(退)料明细档');
end;

procedure TFM_2110.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'半成品内制领(退)料明细档');
end;

procedure TFM_2110.Table1AfterCancel(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := False;
  DBComboBox1.Enabled := False;
end;

procedure TFM_2110.SB3Click(Sender: TObject);
begin
  inherited;
  Search_MasterDetailex(table1,[0,1,1,2,3,5],table2,[16,13],[0,1,2,3],[16,13],['T1070'],['AutoNo'],['F01,F02,F03,F04,F05,F07'],['型号,品名,材质,规格,心孔,单重'],['D.F02'],'');
end;

procedure TFM_2110.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('RP_2110')=nil then
    RP_2110 := TRP_2110.Create(Application);
  with Rp_2110 do
  begin
    Query1.Close;
    Query1.Params[0].AsString := Table1F01.AsString;
    Query1.Open;
    if DBComboBox1.Text = '领'  then
       QRLabel1.Caption := '半成品内制领料单'
    else
       QRLabel1.Caption := '半成品内制退料单';
    Preview;
  end;
end;

procedure TFM_2110.Table2F20Change(Sender: TField);
begin
  inherited;
  lNeedCalWeigh := False;
  if lNeedCalQty then
  Try
     table2F03.AsFloat := DealFractional((Table2F20.AsFloat/Table2lkF07.AsFloat),2);
  Except
     Table2F03.AsFloat := 0;
  end;
  lNeedCalWeigh := true;
end;

procedure TFM_2110.Table2F03Change(Sender: TField);
begin
  inherited;
  lNeedCalQty := false;
  if lNeedCalWeigh then
  Try
     table2F20.AsFloat := DealFractional(Table2lkF07.AsFloat * Table2F03.AsFloat,2);
  Except
     Table2F20.AsFloat := 0;
  end;
  lNeedCalQty := true;
end;

procedure TFM_2110.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2110.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if IfEdit = '0' then
     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     IfEdit :='0';
end;

procedure TFM_2110.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2110.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2110.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;

     IfDo('修改',Qry1,GlobalUser,Hint,'F04');

end;

procedure TFM_2110.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

end.
