unit Contract_Check;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB;

type
  Tfrm_Contract_Check = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    GroupBox2: TGroupBox;
    Cmd_Check: TSpeedButton;
    Cmd_Close: TSpeedButton;
    dsdata: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Cmd_CheckClick(Sender: TObject);
    procedure Cmd_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Contract_Check: Tfrm_Contract_Check;

implementation

uses Data, func, untdatadm;

{$R *.dfm}

procedure Tfrm_Contract_Check.FormShow(Sender: TObject);
var
  sqldemo:widestring;
begin
  if (Contract_Check_Str='Stock_Fad') then
  begin
     sqldemo:= 'Select distinct RECEIPT_NO,RECEIPT_NAME,a.copy_date,a.proposer,Check_Result from [receipt] as a , [quality_check_detail] as b,cancel_strip as c where a.receipt_no=b.stock_no and c.Contract_NO <> b.stock_no and b.un_regular_amount>0 and '+
     '(a.Check_Result=6 or a.Check_Result=7)  and a.flag_sign='+''''+'单据'+''''+' and a.receipt_name='+''''+'质量验收单'+'''';
  end;
  if (Contract_Check_Str='Stock_Enterstr') then
  begin
    sqldemo:= 'Select distinct RECEIPT_NO,RECEIPT_NAME,a.copy_date,a.proposer,Check_Result from [receipt] as a , [quality_check_detail] as b,[stock_jion] as c  where a.receipt_no=b.stock_no  and c.Contract_NO <> b.stock_no and b.regular_amount>0 and'
    +' (a.Check_Result=6 or a.Check_Result=7)  and a.flag_sign='+''''+'单据'+''''+' and a.receipt_name='+''''+'质量验收单'+'''';
  end;
  if (Contract_Check_Str='Goods_Writestr')  then
  begin
    sqldemo:= 'Select * from [receipt] where flag_sign='+''''+'单据'+''''+' and Check_Result=6 and  receipt_name='+''''+'采购合同'+'''';
  end;
   dmmain.CDSexecsql.Close;
   dmmain.CDSexecsql.Data:=null;
   dmmain.CDSexecsql.Data:=adisp.execSql(sqldemo);
   try
   dmmain.CDSexecsql.Open;
   while not dmmain.CDSexecsql.eof do
   begin
      ComboBox1.Items.Add(dmmain.CDSexecsql.FieldByName('receipt_Name').AsString);
      ComboBox2.Items.Add(dmmain.CDSexecsql.FieldByName('Copy_Date').AsString);
      ComboBox3.Items.Add(dmmain.CDSexecsql.FieldByName('receipt_No').AsString);
      dmmain.CDSexecsql.Next;
   end;
   except;
      Application.MessageBox('连接服务器数据库出错，请重新连接，请确认！',pchar(application.Title),mb_iconwarning);
      Exit;
   end;
  dmmain.CDSexecsql.first;
  Edit1.Text:=dmmain.CDSexecsql.FieldByName('receipt_Name').AsString;
  Edit2.Text:=dmmain.CDSexecsql.FieldByName('receipt_No').AsString;
  Edit3.Text:=ForMatDateTime('yyyy''-''mm''-''dd',dmmain.CDSexecsql.FieldByName('Copy_Date').AsDateTime);
end;

procedure Tfrm_Contract_Check.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    Action:=Cafree;
end;

procedure Tfrm_Contract_Check.DBGrid1CellClick(Column: TColumn);
begin
    Edit1.Text:=dmmain.CDSexecsql.FieldByName('receipt_Name').AsString;
    Edit2.Text:=dmmain.CDSexecsql.FieldByName('receipt_No').AsString;
    Edit3.Text:=ForMatDateTime('yyyy''-''mm''-''dd',dmmain.CDSexecsql.FieldByName('Copy_Date').AsDateTime);
end;

procedure Tfrm_Contract_Check.Cmd_CheckClick(Sender: TObject);
begin
  if Trim(Edit2.Text)='' then
  begin
      Application.MessageBox('没有符合条件的单据！',pchar(application.Title),mb_iconinformation);
      Exit;
  end;
  Contract_Check_Result_Str:=Trim(Edit2.Text);
  ReCheck:=dmmain.CDSexecsql.fieldbyname('Check_Result').AsInteger;
  Close;

end;

procedure Tfrm_Contract_Check.Cmd_CloseClick(Sender: TObject);
begin
  close;
end;

end.
