unit uFM_4011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Db,
  ToolEdit, DBTables, DBNavPlus;

type
  TFM_4011 = class(TS_Form)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    DataSource2: TDataSource;
    Qry1: TQuery;
    Table2F01: TStringField;
    Table2K_SN: TSmallintField;
    Table2F02: TStringField;
    Table2F03: TFloatField;
    Table2F04: TFloatField;
    Table2F05: TFloatField;
    Table2F06: TFloatField;
    Table1F01: TStringField;
    Table1F02: TDateTimeField;
    Table1F03: TStringField;
    Table2lkF02: TStringField;
    Table2lkF03: TStringField;
    Table2CalF05: TFloatField;
    Table2CalF06: TFloatField;
    Qry2: TQuery;
    Table1F04: TBooleanField;
    DBNavigator1: TDBNavPlus;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterDelete(DataSet: TDataSet);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure Table2CalcFields(DataSet: TDataSet);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table2BeforeInsert(DataSet: TDataSet);
    procedure Table2BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_4011: TFM_4011;
   sEdittxt: String;
implementation

uses uDM,utilities, uFM_4010A, uRp_4011A, uRp_4011B;

{$R *.DFM}

procedure TFM_4011.BitBtn1Click(Sender: TObject);
 var
   sName,sNo,NN: string;
   MM: Integer;
begin
  inherited;
   sName := GetSeleChMan;
   if sName = '' then Exit;

   QryExec(Qry1,'Select Max(F01) from T4011');
   if Qry1.Fields[0].AsString = '' then
     sNo := 'C' + copy(datetostr(Date),3,2) + '_01'
   else
     begin
       MM := strtoint(copy(Qry1.fields[0].AsString,5,2)) + 1;
       NN := inttostring(MM,2,'0');
       sNo := 'C' + Copy(Datetostr(Date),3,2) + '_' + NN;
     end;

     with Qry1 do
      begin
       Close;
       Sql.Clear;
       Sql.Add('Insert into T4011(F01,F02,F03) select :MNo,:MDate,:MMan');

       Qry1.Params[0].AsString := sNo;
       Qry1.Params[1].AsDate := Date;
       Qry1.Params[2].AsString := sName;

       ExecSql;
      end;


       QryExec(Qry1,'Select F01,F04 from T1060');
       while not Qry1.Eof do
        begin
         Qry2.Close;
         Qry2.SQL.Clear;

         Qry2.SQL.Add('Insert into T4011A(F01,F02,F03) select :DNo,:PNo,:PQty');

         Qry2.Params[0].AsString := SNo;
         Qry2.Params[1].AsString := Qry1.Fields[0].AsString;
         Qry2.Params[2].AsFloat := Qry1.Fields[1].AsFloat;

         Qry2.ExecSQL;

         Qry1.Next;
        end;

     Table2.Refresh;
     Table1.FindKey([sNo]);
       if Table1.State in [dsBrowse] then Table1.Edit;
     //设置更新标识
     Table1F04.AsBoolean := false;
     //设置更新按钮的致能
     BitBtn2.Enabled := True;
     //设置能否修改数量
     DBGrid1.ReadOnly := false;
     if Table1.State in [dsInsert,dsEdit] then Table1.Post;



end;

procedure TFM_4011.BitBtn2Click(Sender: TObject);
begin
  inherited;
  QryExec(Qry1,'select F04 from T4011A where (F04='''' or F04 IS Null) and F01='''+Table1F01.AsString+'''');
  if Qry1.RecordCount > 0 then
  begin
    R_OKMessage(['您还未填好实际盘点重量']);
    Exit;
  end;

  QryExec(Qry1,'Select F02,F04 from T4011A where F03<>F04 and F01="'+DBEdit1.Text+'"');

  while not Qry1.Eof do
  begin
    QryExec(Qry2,'Update T1060 set F04='+Qry1.Fields[1].AsString+' where F01="'+Qry1.Fields[0].AsString+'"',False);
    Qry1.Next;
  end;
  
  if Table1.State in [dsBrowse] then Table1.Edit;
  //设置更新标识
  Table1F04.AsBoolean := True;
  //设置更新按钮的致能
  BitBtn2.Enabled := false;
  //设置能否修改数量
  DBGrid1.ReadOnly := True;
  if Table1.State in [dsInsert,dsEdit] then Table1.Post;
  R_OKMessage(['该张盘点单已更新至库存!'],'',MB_ICONINFORMATION);  
end;

procedure TFM_4011.FormShow(Sender: TObject);
begin
  inherited;
  QryExec(Qry1,'Select Max(F01) from T4011');
  Table1.Locate('F01',Qry1.fields[0].AsString,[]);
end;

procedure TFM_4011.FormCreate(Sender: TObject);
begin
  inherited;
  Table1.Active := True;
  Table2.Active := True;
  if Table1.RecordCount=0 then
  begin
    BitBtn2.Enabled := false;
    DBGrid1.ReadOnly := true;
  end;
end;

procedure TFM_4011.Table1AfterDelete(DataSet: TDataSet);
begin
   Qry1.Close;
   Qry1.SQL.Clear;
   Qry1.SQL.Add('Delete from T4011A where F01='''+ sEditTxt + '''');
   Qry1.ExecSQL;
   Table2.Refresh;
   

inherited;
end;

procedure TFM_4011.Table1BeforeDelete(DataSet: TDataSet);
begin

  R_OkMessage(['该操作不影响库存'],'',MB_ICONINFORMATION);
  sEditTxt:=Table1F01.AsString;

inherited;
end;

procedure TFM_4011.BitBtn5Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFM_4011.Table2CalcFields(DataSet: TDataSet);
begin
  inherited;
  if Table2F04.AsFloat > Table2F03.AsFloat then
    Table2CalF05.AsFloat := Table2F04.AsFloat - Table2F03.AsFloat
  else
    Table2CalF06.AsFloat := Table2F03.AsFloat - Table2F04.AsFloat;
end;

procedure TFM_4011.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
  Table2F05.AsFloat := Table2CalF05.AsFloat;
  Table2F06.AsFloat := Table2CalF06.AsFloat;
end;

procedure TFM_4011.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_4011A')=nil then
     Rp_4011A := TRp_4011A.Create(self);
  with Rp_4011A do
    begin
      Query1.Close;
      Query1.Params[0].AsString := DBEdit1.Text;
      Query1.Open;
    end;
  Rp_4011A.Preview;
end;

procedure TFM_4011.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_4011B')=nil then
     Rp_4011B := TRp_4011B.Create(self);
  with Rp_4011B do
    begin
      Query1.Close;
      Query1.Params[0].AsString := DBEdit1.Text;
      Query1.Open;
    end;
  Rp_4011B.Preview;
end;

procedure TFM_4011.BitBtn6Click(Sender: TObject);
var
 xs: Tstrings;
begin
  inherited;
  xs := Select_text('选择物料编号','select F01 as ''编号'',F02 as ''品名'' from T1060 order by f01','STK0311',[0,1],[]);
  if Assigned(xs) then
  try
    Table2.Locate('F02',xs.Strings[0],[])
  finally
    xs.Free;
  end;
end;

procedure TFM_4011.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
   //设置更新按钮致能,数量可否更改
   if Table1F04.AsBoolean or (Table1.RecordCount=0) then
   begin
     BitBtn2.Enabled := false;
     DBGrid1.ReadOnly := true;
   end
   else
   begin
     BitBtn2.Enabled := True;
     DBGrid1.ReadOnly := false; 
   end;
end;

procedure TFM_4011.Table2BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TFM_4011.Table2BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

end.
