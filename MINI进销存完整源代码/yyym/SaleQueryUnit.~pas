unit SaleQueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls,salequeryrepunit,
  Buttons;

type
  TSaleQuery = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Query2: TQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaleQuery: TSaleQuery;

implementation

{$R *.dfm}

uses SaleListUnit;

procedure TSaleQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TSaleQuery.Button1Click(Sender: TObject);

begin

  if SaleListUnit.SaleList.ListBox1.Selected[0] then
    begin
     salequery.Caption:='销售单据查询';
     if combobox1.Text='单据编号' then
     begin
       Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售单据 where 单据编号=:FormNo');
       Query1.Close;
       Query1.Params[0].AsString:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
      end
     else if combobox1.Text='录单日期'  then
       begin
       Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售单据 where 录单日期=:FormDate');
       Query1.Close;
       Query1.Params[0].DataType:=ftdate;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=strToDate(Edit1.Text);
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
        end
     else if combobox1.Text='客户' then
       begin
            Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售单据 where 客户=:Customer');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
        end
     else if combobox1.Text='经手人' then
      begin
         Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售单据 where 经手人=:doer');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;

      end
    else if combobox1.Text='备注'     then
      begin
        Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售单据 where 备注=:FormDate');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;

      end;
    end
   else if  SaleListUnit.SaleList.ListBox1.Selected[1] then
   begin
      salequery.Caption:='销售收款单据查询';
     if combobox1.Text='单据编号' then
     begin
       Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售收款 where 单据编号=:FormNo');
       Query1.Close;
       Query1.Params[0].AsString:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
      end
     else if combobox1.Text='录单收款'  then
       begin
       Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售单据 where 录单日期=:FormDate');
       Query1.Close;
       Query1.Params[0].DataType:=ftdate;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=strToDate(Edit1.Text);
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
        end
     else if combobox1.Text='客户' then
       begin
            Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售收款 where 客户=:Customer');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
        end
     else if combobox1.Text='经手人' then
      begin
         Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售收款 where 经手人=:doer');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;

      end
    else if combobox1.Text='备注'     then
      begin
        Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售收款 where 备注=:FormDate');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;

      end;
        end
      Else if    SaleListUnit.SaleList.ListBox1.Selected[2] then
      begin
            SaleQuery.Caption:='销售退货单据查询' ;
          if combobox1.Text='单据编号' then
     begin
       Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售退货 where 单据编号=:FormNo');
       Query1.Close;
       Query1.Params[0].AsString:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
      end
     else if combobox1.Text='录单日期'  then
       begin
       Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售退货 where 录单日期=:FormDate');
       Query1.Close;
       Query1.Params[0].DataType:=ftdate;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=strToDate(Edit1.Text);
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
        end
     else if combobox1.Text='客户' then
       begin
            Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售退货 where 客户=:Customer');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;
        end
     else if combobox1.Text='经手人' then
      begin
         Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售退货 where 经手人=:doer');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;

      end
    else if combobox1.Text='备注'     then
      begin
        Query1.Sql.Clear;
       Query1.SQL.Add('Select * from 销售退货 where 备注=:FormDate');
       Query1.Close;
       Query1.Params[0].DataType:=ftstring;
       Query1.Params[0].ParamType:=ptInput;
       Query1.Params[0].Value:=Edit1.Text;
       Query1.Active:=True;
       Query1.open;
       DBGrid1.Repaint;

      end;
      end
end;

procedure TSaleQuery.Button4Click(Sender: TObject);
begin
  CLose;
  salelistunit.SaleList.Release;
end;

procedure TSaleQuery.BitBtn1Click(Sender: TObject);
begin
   application.CreateForm(Tsalequeryrep,salequeryrep);

    SaleQueryUnit.SaleQuery.Query1.Active:=true;


     if SaleListUnit.SaleList.ListBox1.Selected[0] then
  saleQueryrep.QRlabel1.Caption:='销售单查询报表'
     else if SaleListUnit.SaleList.ListBox1.Selected[1] then
  saleQueryrep.Qrlabel1.Caption:='销售付款单查询报表'
  else if SaleListUnit.SaleList.ListBox1.Selected[2] then
  saleQueryrep.qrlabel1.Caption:='销售退货单查询报表';


   saleQueryrep.qrdbtext1.DataField:='单据编号';
   saleQueryrep.qrdbtext2.DataField:='录单日期';
   saleQueryrep.qrdbtext3.DataField:='客户';
   saleQueryrep.qrdbtext4.DataField:='经手人';
   saleQueryrep.qrdbtext5.DataField:='备注';

    salequeryrepunit.salequeryrep.QuickRep1.Preview;

end;

procedure TSaleQuery.BitBtn2Click(Sender: TObject);
begin
  close;
  SaleListUnit.SaleList.Show;
end;

end.

