unit SaleEarnForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, ComCtrls, ExtCtrls,
  Buttons, Grids, DBGrids,SaleEarnRepP,Math;

type
  TForm5 = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Table2: TTable;
    DataSource2: TDataSource;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    StringGrid1: TStringGrid;
    Query1: TQuery;
    Query2: TQuery;
    BitBtn8: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    Query3: TQuery;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Table2CalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation


var sum:double;
{$R *.dfm}

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
 var j,k:integer;
begin
     DBEdit1.ReadOnly:=False;
     StringGrid1.Cols[2].CommaText:='';

    with StringGrid1 do
         for j:=1 to ColCount-1 do
           for k:= 1 to RowCount-1 do
              begin
               Cells[j,k]:='';
              end;
   Table1.Insert;
end;

procedure TForm5.BitBtn7Click(Sender: TObject);
var i,j:integer;
begin

  StringGrid1.Cols[2].CommaText:='销售日期';
 Table1.FieldValues['录单日期'] :=DateTimePicker1.Date;





 Table1.Post;

  with StringGrid1 do

           for j:=1 to StringGrid1.RowCount-1 do
               begin
               if Cells[1,j]<>'' then
               begin
               Table2.Insert;
               Table2.FieldByName('单据编号').AsString:=DBEdit1.Text;
               Table2.FieldByName('销售单号').AsString:=Cells[1,j];

                 Query3.Close;
       Query3.Params[0].AsString:=StringGrid1.Cells[1,j];
       Query3.Open;


               Table2.FieldByName('销售日期').AsString:=Query3.FieldByName('录单日期').AsString;
               Table2.FieldByName('总金额').AsString:=Cells[3,j];
               Table2.FieldByName('已收金额').AsString:=Cells[4,j];
               Table2.FieldByName('未收金额').AsString:=Cells[5,j];
               Table2.FieldByName('本次收款').AsString:=Cells[6,j];
               Table2.FieldByName('备注').AsString:=Cells[7,j];

               Table2.Post;
               end;
               end;

             For i:=1 to StringGrid1.RowCount do
       begin

        Query3.Close;
       Query3.Params[0].AsString:=StringGrid1.Cells[1,i];
       Query3.Open;

        StringGrid1.Cells[2,i]:=Query3.FieldByName('录单日期').AsString;
         end;





      Application.MessageBox('提交成功','新单据',0);
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
   Table1.Prior;
end;

procedure TForm5.BitBtn5Click(Sender: TObject);
begin
   Table1.Next;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin


   Query2.Close;
    Query2.Params[0].AsString:=DBEdit1.Text;
   Query2.ExecSQL;
    Screen.Cursor:=crDefault;

    Table1.Delete;

end;

procedure TForm5.FormCreate(Sender: TObject);
  var i:integer;
begin

      StringGrid1.Cols[1].CommaText:='销售单号';
       StringGrid1.Cols[2].CommaText:='销售日期';

               StringGrid1.Cols[3].CommaText:='总金额';
       StringGrid1.Cols[4].CommaText:='已收金额';
       StringGrid1.Cols[5].CommaText:='未收金额';
       StringGrid1.Cols[6].CommaText:='本次收款';
       StringGrid1.Cols[7].CommaText:='备注';

       For i:=1 to 100 do
       begin
         StringGrid1.Rows[i].CommaText:=IntToStr(i);
       end;

        
      Query1.Close;
       Query1.Params[0].AsString:=DBEdit1.Text;
       Query1.Open;

       

         Screen.Cursor:=crDefault;

       For i:=1 to Query1.RecordCount do
       begin
       StringGrid1.Cells[1,i]:=Query1.FieldByName('销售单号').AsString;
       Query3.Close;
       Query3.Params[0].AsString:=StringGrid1.Cells[1,i];
       Query3.Open;

        StringGrid1.Cells[2,i]:=Query3.FieldByName('录单日期').AsString;
        StringGrid1.Cells[3,i]:=Query1.FieldByName('总金额').AsString;
        StringGrid1.Cells[4,i]:=Query1.FieldByName('已收金额').AsString;
        StringGrid1.Cells[5,i]:=Query1.FieldByName('未收金额').AsString;
        StringGrid1.Cells[6,i]:= Query1.FieldByName('本次收款').AsString;
        StringGrid1.Cells[7,i]:= Query1.FieldByName('备注').AsString;
        
       Query1.Next;
       end;
       if DBEdit1.Text<>'' then DBEdit1.ReadOnly:=True;

end;



procedure TForm5.Table1AfterScroll(DataSet: TDataSet);
var i,j,k:integer;
begin
       if DBEdit1.Text<>'' then DBEdit1.ReadOnly:=True;
       with StringGrid1 do
         for j:=1 to ColCount-1 do
           for k:= 1 to RowCount-1 do
              begin
               Cells[j,k]:='';
              end;


       Query1.Close;
       Query1.Params[0].AsString:=DBEdit1.Text;
       Query1.Open;
         Screen.Cursor:=crDefault;

       For i:=1 to Query1.RecordCount do
       begin
        StringGrid1.Cells[1,i]:=Query1.FieldByName('销售单号').AsString;
        Query3.Close;
       Query3.Params[0].AsString:=StringGrid1.Cells[1,i];
       Query3.Open;

        StringGrid1.Cells[2,i]:=Query3.FieldByName('录单日期').AsString;


        StringGrid1.Cells[3,i]:=Query1.FieldByName('总金额').AsString;
        StringGrid1.Cells[4,i]:=Query1.FieldByName('已收金额').AsString;
        StringGrid1.Cells[5,i]:=Query1.FieldByName('未收金额').AsString;
        StringGrid1.Cells[6,i]:= Query1.FieldByName('本次收款').AsString;
        StringGrid1.Cells[7,i]:= Query1.FieldByName('备注').AsString;
        
       Query1.Next;
       end;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TForm5.BitBtn8Click(Sender: TObject);
 var j:integer;

begin

  Table1.Refresh;
   Query2.Close;
    Query2.Params[0].AsString:=DBEdit1.Text;
   Query2.ExecSQL;
    Screen.Cursor:=crDefault;

    with StringGrid1 do

           for j:=1 to StringGrid1.RowCount-1 do
               begin
               if Cells[1,j]<>'' then
               begin
               Table2.Insert;
               Table2.FieldByName('销售单号').AsString:=DBEdit1.Text;
               //Table2.FieldByName('销售日期').AsString:=Cells[1,j];
               Table2.FieldByName('总金额').AsString:=Cells[2,j];
               Table2.FieldByName('已收金额').AsString:=Cells[3,j];
               Table2.FieldByName('未收金额').AsString:=Cells[4,j];
               Table2.FieldByName('本次收款').AsString:=Cells[5,j];
               Table2.FieldByName('备注').AsString:=Cells[6,j];

               Table2.Post;
               end;
               end;
         Application.MessageBox('更新成功','单据',0);

end;

procedure TForm5.BitBtn6Click(Sender: TObject);
begin
    Application.CreateForm(TSaleEarnRep,SaleEarnRep);

    SaleEarnRepP.SaleEarnRep.QuickRep1.Preview;
end;

procedure TForm5.Table2CalcFields(DataSet: TDataSet);
   var Goodsgold:Double;
begin
    Goodsgold:=table2.fieldbyname('本次收款').asfloat;
    Sum:=Sum+Goodsgold;
  end;

end.
