unit SaleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, ComCtrls, ExtCtrls,
  Buttons, Grids, DBGrids,SaleRepP;

type
  TForm3 = class(TForm)
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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
 var j,k:integer;
begin
    DBEdit1.ReadOnly:=False;
    with StringGrid1 do
         for j:=1 to ColCount-1 do
           for k:= 1 to RowCount-1 do
              begin
               Cells[j,k]:='';
              end;
   Table1.Insert;
end;

procedure TForm3.BitBtn7Click(Sender: TObject);
var j:integer;
begin
 Table1.FieldValues['录单日期'] :=DateTimePicker1.Date;
 Table1.Post;

  with StringGrid1 do

           for j:=1 to StringGrid1.RowCount-1 do
               begin
               if Cells[1,j]<>'' then
               begin
               Table2.Insert;
               Table2.FieldByName('单据编号').AsString:=DBEdit1.Text;
               Table2.FieldByName('商品编号').AsString:=Cells[1,j];
               Table2.FieldByName('商品名称').AsString:=Cells[2,j];
               Table2.FieldByName('单位').AsString:=Cells[3,j];
               Table2.FieldByName('型号').AsString:=Cells[4,j];
               Table2.FieldByName('规格').AsString:=Cells[5,j];
               Table2.FieldByName('数量').AsString:=Cells[6,j];
               Table2.FieldByName('单价').AsString:=Cells[7,j];
               Table2.FieldByName('金额').AsString:=Cells[8,j];
               Table2.FieldByName('备注').AsString:=Cells[9,j];
               Table2.Post;
               end;
               end;
      Application.MessageBox('提交成功','新单据',0);
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
   Table1.Prior;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
   Table1.Next;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin


   Query2.Close;
    Query2.Params[0].AsString:=DBEdit1.Text;
   Query2.ExecSQL;
    Screen.Cursor:=crDefault;

    Table1.Delete;
  
end;

procedure TForm3.FormCreate(Sender: TObject);
  var i:integer;
begin

      StringGrid1.Cols[1].CommaText:='商品编号';
       StringGrid1.Cols[2].CommaText:='商品名称';
       StringGrid1.Cols[3].CommaText:='单位';
       StringGrid1.Cols[4].CommaText:='型号';
       StringGrid1.Cols[5].CommaText:='规格';
       StringGrid1.Cols[6].CommaText:='数量';
       StringGrid1.Cols[7].CommaText:='单价';
       StringGrid1.Cols[8].CommaText:='金额';
       StringGrid1.Cols[9].CommaText:='备注';
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
        StringGrid1.Cells[1,i]:=Query1.FieldByName('商品编号').AsString;
        StringGrid1.Cells[2,i]:=Query1.FieldByName('商品名称').AsString;
        StringGrid1.Cells[3,i]:=Query1.FieldByName('单位').AsString;
        StringGrid1.Cells[4,i]:=Query1.FieldByName('型号').AsString;
        StringGrid1.Cells[5,i]:=Query1.FieldByName('规格').AsString;
        StringGrid1.Cells[6,i]:= Query1.FieldByName('数量').AsString;
        StringGrid1.Cells[7,i]:= Query1.FieldByName('单价').AsString;
        StringGrid1.Cells[8,i]:= Query1.FieldByName('金额').AsString;
        StringGrid1.Cells[9,i]:= Query1.FieldByName('备注').AsString;
       Query1.Next;
       end;
       if DBEdit1.Text<>'' then DBEdit1.ReadOnly:=True;

end;



procedure TForm3.Table1AfterScroll(DataSet: TDataSet);
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
        StringGrid1.Cells[1,i]:=Query1.FieldByName('商品编号').AsString;
        StringGrid1.Cells[2,i]:=Query1.FieldByName('商品名称').AsString;
        StringGrid1.Cells[3,i]:=Query1.FieldByName('单位').AsString;
        StringGrid1.Cells[4,i]:=Query1.FieldByName('型号').AsString;
        StringGrid1.Cells[5,i]:=Query1.FieldByName('规格').AsString;
        StringGrid1.Cells[6,i]:= Query1.FieldByName('数量').AsString;
        StringGrid1.Cells[7,i]:= Query1.FieldByName('单价').AsString;
        StringGrid1.Cells[8,i]:= Query1.FieldByName('金额').AsString;
        StringGrid1.Cells[9,i]:= Query1.FieldByName('备注').AsString;
       Query1.Next;
       end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TForm3.BitBtn8Click(Sender: TObject);
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
               Table2.FieldByName('单据编号').AsString:=DBEdit1.Text;
               Table2.FieldByName('商品编号').AsString:=Cells[1,j];
               Table2.FieldByName('商品名称').AsString:=Cells[2,j];
               Table2.FieldByName('单位').AsString:=Cells[3,j];
               Table2.FieldByName('型号').AsString:=Cells[4,j];
               Table2.FieldByName('规格').AsString:=Cells[5,j];
               Table2.FieldByName('数量').AsString:=Cells[6,j];
               Table2.FieldByName('单价').AsString:=Cells[7,j];
               Table2.FieldByName('金额').AsString:=Cells[8,j];
               Table2.FieldByName('备注').AsString:=Cells[9,j];
               Table2.Post;
               end;
               end;
         Application.MessageBox('更新成功','单据',0);

end;

procedure TForm3.BitBtn6Click(Sender: TObject);
begin
    Application.CreateForm(TSaleRep,SaleRep);
    
    SaleRepP.SaleRep.QuickRep1.Preview;
end;

end.
