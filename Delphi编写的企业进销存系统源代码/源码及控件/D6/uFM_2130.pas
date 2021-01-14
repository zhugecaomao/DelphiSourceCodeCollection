unit uFM_2130;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  ToolEdit, RXDBCtrl;

type
  TFM_2130 = class(TS_MasterDetail_With_Item)
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
    Table2F02: TStringField;
    Table2F03: TFloatField;
    Table2Buser: TStringField;
    Table2Btime: TDateTimeField;
    Table2Euser: TStringField;
    Table2Etime: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBComboBox1: TDBComboBox;
    Table2lkPName: TStringField;
    Table2lkPSpec: TStringField;
    RxDBComboEdit1: TRxDBComboEdit;
    Table2F04: TFloatField;
    RxDBComboEdit2: TRxDBComboEdit;
    Table1lkF02: TStringField;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    Table2F06: TStringField;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table2F02Validate(Sender: TField);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
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
  FM_2130: TFM_2130;
  IfEdit : string='0';
implementation

uses uDM, uRP_2130,utilities,uFunction;

{$R *.DFM}

procedure TFM_2130.Table1BeforePost(DataSet: TDataSet);
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

procedure TFM_2130.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := True;
  DBComboBox1.Enabled := True;
  Table1F02.AsDateTime := Date();
  Table1F13.AsString := '领';
  DBDateEdit1.SetFocus
end;

procedure TFM_2130.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  { 点选 <原料编号> }
  if DBGrid1.SelectedField = Table2F02 then  begin
    if Select_Data(DataSource2,'原料选取窗口','SELECT F01 as ''编号'' , F02 as ''品名'' , F03 as ''规格'' From T1050 Order By F01','STK0311',['F02'],[0],[])
    then begin
           DBGrid1.SelectedField := Table2F03;
    end;
  end;

  { 点选 <制令单号> }
  if DBGrid1.SelectedField = Table2F06 then  begin
    if Select_Data(DataSource2,'制令单选取窗口','select F01 as 制令单号,F02 as 原料编号,F10 as 需求量 from T2020A where F08=''原料'' and F11<F10','STK0311',['F06','F02','F03'],[0,1,2],[])
    then begin
           DBGrid1.SelectedField := Table2F03;
    end;
  end;
      
end;

procedure TFM_2130.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  { 点选 <领料人> }
  SelSingle_Data(DataSource1,['姓名','性别'],'Select F01,F02 From T1040 Order By F01','T1040','F04','F01','F02',True,0);
end;

procedure TFM_2130.Table2AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.SelectedField := Table2F02;
end;

procedure TFM_2130.DetailEdit(DataSet: TDataSet);
begin
  if DBComboBox1.Text = '领' then
   begin
    UpdateDatumStock(Qry1,'T1050','+','F04',Table2F03,Table2F02);
    UpdateDatumStock(Qry1,'T1050','+','F12',Table2F03,Table2F02);
   end
  else
   begin
    UpdateDatumStock(Qry1,'T1050','-','F04',Table2F03,Table2F02);
    UpdateDatumStock(Qry1,'T1050','-','F12',Table2F03,Table2F02);
   end;

  if (DBComboBox1.Text = '领') and (Table2F06.asstring <> '') then
    QryExec(Qry1,'update T2020A set F11=F11-'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False)
  else
    QryExec(Qry1,'update T2020A set F11=F11+'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False);

end;

procedure TFM_2130.DetailUpdate(DataSet: TDataSet);
begin
  if DBComboBox1.Text = '领' then
   begin
    UpdateDatumStock(Qry1,'T1050','-','F04',Table2F03,Table2F02);
    UpdateDatumStock(Qry1,'T1050','-','F12',Table2F03,Table2F02);
   end
  else
   begin
    UpdateDatumStock(Qry1,'T1050','+','F04',Table2F03,Table2F02);
    UpdateDatumStock(Qry1,'T1050','+','F12',Table2F03,Table2F02);
   end;
  if (DBComboBox1.Text = '领') and (Table2F06.asstring <> '') then
  QryExec(Qry1,'update T2020A set F11=F11+'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False)
  else
  QryExec(Qry1,'update T2020A set F11=F11-'''+Table2F03.AsString+''' where F01='''+Table2F06.AsString+''' and F02='''+Table2F02.AsString+'''',False);

end;

procedure TFM_2130.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := False;
  DBComboBox1.Enabled := False;
//显示资料新增与修改记录
  InforDisplay(Dataset,'原料委外领(退)料主档');
end;

procedure TFM_2130.Table2F02Validate(Sender: TField);
begin
  inherited;
  DatumNoValidate(Qry1,'T1050',sender)
end;

procedure TFM_2130.Table2BeforePost(DataSet: TDataSet);
begin
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;

end;

procedure TFM_2130.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'原料委外领(退)料主档');
end;

procedure TFM_2130.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'原料委外领(退)料明细档');
end;

procedure TFM_2130.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
//显示资料新增与修改记录
  InforDisplay(Dataset,'原料委外领(退)料明细档');
end;

procedure TFM_2130.Table1AfterCancel(DataSet: TDataSet);
begin
  inherited;
  DBDateEdit1.Enabled := False;
  DBComboBox1.Enabled := False;
end;

procedure TFM_2130.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  Select_Data(DataSource1,'委外厂商点选窗口','select F01 as 编号,F03 AS 厂商简称,F21 AS 币别,F22 AS 税别,F23 AS 税率 from T1030','STK0311',['F03'],[0],[]);
end;

procedure TFM_2130.SB3Click(Sender: TObject);
begin
  inherited;
  Search_MasterDetailex(table1,[0,1,1,4,6],table2,[12,11,4],[0,1,4,6],[12,11,4],['T1030','T1050'],['F01','F01'],['F03','F02,F03'],['厂商简称','品名,规格'],['M.F03','D.F02'],'');
end;

procedure TFM_2130.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('RP_2130')=nil then
    RP_2130 := TRP_2130.Create(Application);
  with Rp_2130 do
  begin
    Query1.Close;
    Query1.Params[0].AsString := Table1F01.AsString;
    Query1.Open;
    IF DBComboBox1.Text = '领' then
      QRLabel1.Caption := '原料委外领料单'
    else
      QRLabel1.Caption := '原料委外退料单';
    Preview;
  end;
end;

procedure TFM_2130.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2130.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if IfEdit = '0' then
     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     IfEdit :='0';
end;

procedure TFM_2130.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
   IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2130.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
   IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2130.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;

     IfDo('修改',Qry1,GlobalUser,Hint,'F04');

end;

procedure TFM_2130.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

end.
