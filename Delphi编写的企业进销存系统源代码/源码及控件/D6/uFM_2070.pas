unit uFM_2070;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_MD_ITEM, DBTables, Db, DBVrtNav, Grids, DBGrids,
  Buttons, DBCtrls, DBNavPlus, ToolWin, ComCtrls, StdCtrls, Mask, ExtCtrls,
  ToolEdit, RXDBCtrl;

type
  TFM_2070 = class(TS_MasterDetail_With_Item)
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
    Table2lkF01: TStringField;
    Table2lkF02: TStringField;
    Table2lkF03: TStringField;
    Table2lkF04: TStringField;
    Table2lkF05: TStringField;
    Table1F12: TStringField;
    Table1F13: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Table1lkF04: TStringField;
    RxDBComboEdit2: TRxDBComboEdit;
    RxDBComboEdit3: TRxDBComboEdit;
    DBComboBox1: TDBComboBox;
    Table2lkF07: TFloatField;
    Table1lkF03: TStringField;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Table2F20: TFloatField;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure RxDBComboEdit3ButtonClick(Sender: TObject);
    procedure RxDBComboEdit2ButtonClick(Sender: TObject);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure Table2F03Change(Sender: TField);
    procedure Table2F20Change(Sender: TField);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure Table2BeforeEdit(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure DetailEdit(DataSet: TDataSet); override;
    procedure DetailUpdate(DataSet: TDataSet); override;
    { Public declarations }
  end;

var
  FM_2070: TFM_2070;
  lNeedCalWeigh :boolean = true;
  lNeedCalQty :boolean = true;
  IfEdit : string='0';
implementation

uses utilities, uDM, uFM_SES, uFunction, uFM_SCM, uRP_2070;

{$R *.DFM}

procedure TFM_2070.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  //把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  if Table1.State in [dsInsert] then
    if Table1F13.AsString = '入' then
       Auto_Item_Number(Table1,'F01',cYYMMDD_xxxS,'A',true,Table1F02.AsDateTime)
    else
       Auto_Item_Number(Table1,'F01',cYYMMDD_xxxS,'B',true,Table1F02.AsDateTime)
end;

procedure TFM_2070.DBGrid1EditButtonClick(Sender: TObject);
var
  iNo: integer;
begin
  inherited;
  if DBGrid1.SelectedField = Table2lkF01 then
    if not SelComeMaterial(Table1F01.AsString,Table1F03.AsString,Table1F04.AsString,Table2lkF01.AsString,Table2lkF02.AsString,Table2lkF03.AsString,Table2lkF04.AsString,Table2lkF05.AsString,Table2lkF07.AsInteger,iNo) then Exit;
    if Table2.State in [dsBrowse] then Table2.Edit;
    Table2F02.asinteger := iNo;

end;



procedure TFM_2070.DetailEdit(DataSet: TDataSet);
begin
  //删除一笔明细,减去对应的数量
  if Table1F13.AsString = '入' then
   begin
    UpdateStock(Qry1,'T1090','-','F06',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1090','-','F12',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1090','-','F13',Table2F20,Table2F02);
    UpdateStock(Qry1,'T1090','-','F14',Table2F20,Table2F02);
   end
  else
   begin
    UpdateStock(Qry1,'T1090','+','F06',Table2F03,Table2F02) ;
    UpdateStock(Qry1,'T1090','+','F12',Table2F03,Table2F02) ;
    UpdateStock(Qry1,'T1090','+','F13',Table2F20,Table2F02) ;
    UpdateStock(Qry1,'T1090','+','F14',Table2F20,Table2F02) ;
   end;

end;

procedure TFM_2070.DetailUpdate(DataSet: TDataSet);
begin
  //增加一笔明细,加上对应的数量
  if Table1F13.AsString = '入' then
   begin
    UpdateStock(Qry1,'T1090','+','F06',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1090','+','F12',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1090','+','F13',Table2F20,Table2F02);
    UpdateStock(Qry1,'T1090','+','F14',Table2F20,Table2F02);
   end
  else
   begin
    UpdateStock(Qry1,'T1090','-','F06',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1090','-','F12',Table2F03,Table2F02);
    UpdateStock(Qry1,'T1090','-','F13',Table2F20,Table2F02);
    UpdateStock(Qry1,'T1090','-','F14',Table2F20,Table2F02);
   end;
end;



procedure TFM_2070.RxDBComboEdit3ButtonClick(Sender: TObject);
begin
  inherited;
  Select_Data(DataSource1,'人员点选窗口','select F01 as 姓名 from T1040','STK0311',['F12'],[0],[]);
end;

procedure TFM_2070.RxDBComboEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  Select_Data(DataSource1,'客户点选窗口','select F01 as 客户编号,F03 as 客户简称 from T1010 ','STK0311',['F03'],[0],[]);
end;

procedure TFM_2070.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  Select_Data(DataSource1,'送料厂商点选窗口','select F01 as 送料厂商编号,F03 as 送料厂商简称 from T1011 ','STK0311',['F04'],[0],[]);
end;

procedure TFM_2070.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
 //把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  //QryExec(Qry1,'Update T1090 set F12='''+Table2F03.asstring+''' where F10='''+Table1F03.AsString+''' and F11='''+Table1F04.AsString+''' and AutoNo='''+Table2F02.AsString+'''',false);
end;

procedure TFM_2070.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBComboBox1.Enabled := false;
  DBDateEdit1.Enabled := false;
  InforDisplay(DataSet,'客户来料入(退)库单主档');
end;

procedure TFM_2070.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBComboBox1.Enabled := true;
  DBDateEdit1.Enabled := true;
  Table1F02.AsDateTime := Date();
  Table1F13.AsString := '入';
end;

procedure TFM_2070.Table1AfterScroll(DataSet: TDataSet);
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
  InforDisplay(DataSet,'客户来料入(退)库单主档');
end;

procedure TFM_2070.Table2AfterPost(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'客户来料入(退)库单明细档');
end;

procedure TFM_2070.Table2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'客户来料入(退)库单明细档');
end;

procedure TFM_2070.SB3Click(Sender: TObject);
begin
  inherited;
    Search_MasterDetailex(table1,[0,1,1,2,3,5],table2,[5],[0,1,2,3,5],[5,15],['T1010','T1090'],['F01','AutoNo'],['F03','F01,F02,F03,F04,F05,F07'],['客户简称','型号,品名,材质,规格,心孔,单重'],['M.F03','D.F02'],'');
end;

procedure TFM_2070.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_2070')=nil then
    Rp_2070 := TRp_2070.Create(self);
  with Rp_2070 do
   begin
    Query1.Close;
    Query1.params[0].AsString := Table1F01.AsString;
    Query1.Params[1].AsString := Table1F13.AsString;
    Query1.Open;
    if DBComboBox1.text = '入' then
       QRLabel1.Caption := '客户来料入库单'
    else
       QRLabel1.Caption := '客户来料退料单';
    Preview;
   end;
end;

procedure TFM_2070.Table2F03Change(Sender: TField);
begin
  inherited;
  {LNeedCalQty := false;
  if lNeedCalWeigh then
  Try
     table2f20.AsFloat := DealFractional(Table2lkF07.AsFloat * Table2F03.AsFloat,2) ;
  Except
     Table2F03.AsFloat := 0;
  end;
  lNeedCalQty := true;}
end;

procedure TFM_2070.Table2F20Change(Sender: TField);
begin
  inherited;
  {lNeedCalWeigh := false;
  if  lNeedCalQty then
  Try
      table2F03.AsFloat := DealFractional((Table2F20.AsFloat/Table2lkF07.AsFloat),2) ;
  Except
      tABLE2F03.AsFloat := 0;
  end;
  lNeedCalWeigh := true;}
end;

procedure TFM_2070.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

procedure TFM_2070.Table1BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if IfEdit = '0' then
     IfDo('修改',Qry1,GlobalUser,Hint,'F04');
     IfEdit :='0';
end;

procedure TFM_2070.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2070.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  IfDo('新增',Qry1,GlobalUser,Hint,'F02');
end;

procedure TFM_2070.Table2BeforeEdit(DataSet: TDataSet);
begin
  inherited;

     IfDo('修改',Qry1,GlobalUser,Hint,'F04');

end;

procedure TFM_2070.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IfDo('删除',Qry1,GlobalUser,Hint,'F03');
end;

end.
