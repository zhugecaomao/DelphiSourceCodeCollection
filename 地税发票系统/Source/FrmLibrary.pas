unit FrmLibrary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, AdvCombo, AdvEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, cxButtons, BaseGrid, AdvGrid, DBAdvGrid, DB, ADODB;

type
  TDel = record
    Del_Row: Integer;
    Del_Col: Integer;
  end;
  TGenLibrary = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    AdvEdit1: TAdvEdit;
    AdvComboBox1: TAdvComboBox;
    AdvEdit2: TAdvEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    cxTextEdit1: TcxTextEdit;
    Label7: TLabel;
    cxTextEdit2: TcxTextEdit;
    cxButton19: TcxButton;
    cxButton7: TcxButton;
    cxButton21: TcxButton;
    cxButton9: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton2: TcxButton;
    cxButton6: TcxButton;
    DataSource1: TDataSource;
    ADOGen: TADOQuery;
    CheckBox1: TCheckBox;
    DBAdvGrid1: TDBAdvGrid;
    procedure FormShow(Sender: TObject);
    procedure AdvComboBox1Change(Sender: TObject);
    procedure AdvEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButton7Click(Sender: TObject);
    procedure AdvEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton19Click(Sender: TObject);
    procedure DBAdvGrid1ClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    procedure SelectTax(aSql: string);
    
  public
    
  end;

var
  GenLibrary: TGenLibrary;
  TaxTable: string;
  Del_Data: TDel;
implementation

uses
  FrmData;
{$R *.dfm}

procedure TGenLibrary.FormShow(Sender: TObject);
begin
  with advCombobox1.Items do
  begin
    Add('租赁发票');
    Add('建筑发票');
    Add('固定资产');
    Add('服务行业');
    Add('无形资产');
  end;
  AdvComboBox1.ItemIndex:=0;
  TaxTable:='TaxZly';
  SelectTax('Select * From TaxZly');
end;

procedure TGenLibrary. SelectTax(aSql: string);
var
  aTmp1,aTmp2: string;
  i,j, aCount:Integer;
  aSum: Double;
begin
  try
    with ADOGen do
    begin
      SQL.Clear;
      sql.Add(aSql);
      Open;
    end;
    i:=0;
    aSum:=0.00;
    aCount:=0;
    j:=ADOGen.RecordCount;
    while (j)<>i do
    begin
      if i=0 then
        aTmp1:=DataSource1.DataSet.FieldByName('发票号码').AsString
      else
        aTmp2:=DataSource1.DataSet.FieldByName('发票号码').AsString;
      Inc(i);
      if aTmp1<>aTmp2 then
      begin
        aCount:=aCount+1;
        cxTextEdit2.Text:=IntToStr(aCount);
        aSum:=aSum+DataSource1.DataSet.FieldByName('金额合计').AsFloat;
        if aTmp2<>'' then
          aTmp1:=aTmp2;
      end;
      DataSource1.DataSet.Next;
    end;
    cxTextEdit1.Text:=FloatToStr(aSum);
  except
    SelectTax('Select * From '+TaxTable);
  end;
end;

procedure TGenLibrary.AdvComboBox1Change(Sender: TObject);
var
  aSql: string;
begin
  aSql:='Select * From ';
  case AdvComboBox1.ItemIndex of
    0:
      begin
        TaxTable:='TaxJzy';
        aSql:=aSql+TaxTable;
        SelectTax(aSql);
      end;
    1:
      begin
        TaxTable:='TaxJzy';
        aSql:=aSql+TaxTable;
        SelectTax(aSql);
      end;
    2:
      begin
        TaxTable:='TaxGdzc';
        aSql:=aSql+TaxTable;
        SelectTax(aSql);
      end;
    3:
      begin
        TaxTable:='TaxFwhy';
        aSql:=aSql+TaxTable;
        SelectTax(aSql);
      end;
    4:
      begin
        TaxTable:='TaxWxzc';
        aSql:=aSql+TaxTable;
        SelectTax(aSql);
      end;
  end;
end;

procedure TGenLibrary.AdvEdit1KeyPress(Sender: TObject; var Key: Char);
var
  aSql:string;
begin
  if not (Key in ['0'..'9', #13, #8, #22, #24, #9]) then Key := #0;
  if Key = #13 then
  begin
    aSql:='Select * From ' + TaxTable + ' Where 发票号码 = '+ QuotedStr(
      AdvEdit1.Text);
    SelectTax(aSql);
  end;
end;

procedure TGenLibrary.cxButton7Click(Sender: TObject);
begin
  SelectTax('Select * From ' + TaxTable );
end;

procedure TGenLibrary.AdvEdit2KeyPress(Sender: TObject; var Key: Char);
var
  aSql: string;
begin
  if Key=#13 then
  begin
    aSql:='Select * From ' + TaxTable + ' Where 客户名称 Like '''+'%'+ AdvEdit2.Text+'%'+'''';
    SelectTax(aSql);
  end;
end;

procedure TGenLibrary.cxButton2Click(Sender: TObject);
begin
  if cxButton2.Caption='修  改' then
  begin
    DataSource1.AutoEdit:=True;
    DBAdvGrid1.Options:=DBAdvGrid1.Options+[goEditing];
    cxButton2.Caption:='只  读'
  end
  else
  begin
    DataSource1.AutoEdit:=False;
    DBAdvGrid1.Options:=DBAdvGrid1.Options-[goEditing];
    cxButton2.Caption:='修  改'
  end;
end;

procedure TGenLibrary.cxButton19Click(Sender: TObject);
var
  aSql: string;
begin
  aSql:='Select * From ' + TaxTable + ' Where 开票日期>='+
    QuotedStr(DateTimeToStr(cxDateEdit1.Date)) +' and  '+ '开票日期<='+
    QuotedStr(DateTimeToStr(cxDateEdit2.Date));
  SelectTax(aSql);
end;

procedure TGenLibrary.DBAdvGrid1ClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if DataSource1.DataSet.FieldDefs[0].Name='ID' then
  begin
    Del_Data.Del_Row:=ARow;
    Del_Data.Del_Col:=ACol;
  end
  else
  begin
    Del_Data.Del_Row:=0;
    Del_Data.Del_Col:=0;
  end;
end;

procedure TGenLibrary.cxButton9Click(Sender: TObject);
var
  aSql: string;
begin
  if Del_Data.Del_Row<=0 then
  begin
    Application.MessageBox('没有选中要删除的数据！', '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    Exit;  
  end;
  aSql:='Delete from '+TaxTable+' Where 发票号码='+
    QuotedStr(DBAdvGrid1.Cells[2,Del_Data.Del_Row]);
  try
    ADOGen.SQL.Clear;
    ADOGen.SQL.Add(aSql);
    ADOGen.ExecSQL;
    SelectTax('Select * From '+ TaxTable);
    Application.MessageBox('作废成功！    ', '贝壳提示', MB_OK + MB_ICONWARNING
      + MB_DEFBUTTON3 + MB_TOPMOST);
  except
    SelectTax('Select * From '+ TaxTable);  
    Application.MessageBox('作废失败！    ', '贝壳提示', MB_OK + MB_ICONWARNING
      + MB_DEFBUTTON3 + MB_TOPMOST);
  end;
end;

procedure TGenLibrary.cxButton21Click(Sender: TObject);
begin
  Close;
end;

procedure TGenLibrary.cxButton3Click(Sender: TObject);
begin
  DBAdvGrid1.Print;
end;

end.
