unit Goods_Requipment_Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, Buttons, StdCtrls, Mask, DB;

type
  Tfrm_Goods_Requipment_Search = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Edit4: TMaskEdit;
    Edit5: TMaskEdit;
    Edit1: TComboBox;
    Edit2: TComboBox;
    Edit3: TComboBox;
    Panel2: TPanel;
    Cmd_Search: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Cmd_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Goods_Requipment_Search: Tfrm_Goods_Requipment_Search;

implementation

uses untdatadm, Data, func;

{$R *.dfm}

procedure Tfrm_Goods_Requipment_Search.CheckBox1Click(Sender: TObject);
begin
    edit1.Visible:=(Sender as TCheckBox).Checked;
    if (Sender as TCheckBox).Checked then
    begin
        checkbox4.Checked:=false;
        edit4.Visible:=not (Sender as TCheckBox).Checked;
        edit5.Visible:=not (Sender as TCheckBox).Checked;
        label1.Visible:=not (Sender as TCheckBox).Checked;
    end;
end;

procedure Tfrm_Goods_Requipment_Search.CheckBox2Click(Sender: TObject);
begin
    edit2.Visible:=(Sender as TCheckBox).Checked;
end;

procedure Tfrm_Goods_Requipment_Search.CheckBox4Click(Sender: TObject);
begin
    edit4.Visible:=(Sender as TCheckBox).Checked;
    edit5.Visible:=(Sender as TCheckBox).Checked;
    label1.Visible:=(Sender as TCheckBox).Checked;
    if (Sender as TCheckBox).Checked then
    begin
        checkbox1.Checked:=false;
        edit1.Visible:=not (Sender as TCheckBox).Checked;
    end;
end;

procedure Tfrm_Goods_Requipment_Search.CheckBox3Click(Sender: TObject);
begin
    edit3.Visible:=(Sender as TCheckBox).Checked;
end;

procedure Tfrm_Goods_Requipment_Search.Cmd_SearchClick(Sender: TObject);
var
  t_sql:widestring;
  tdate:Tdatetime;
begin
  t_sql:='select id,Copy_Date,Stock_NO,Stock_NO,Storage_NO,Shop_NO,Transactor,Proposer,Condense,R_Remark from Goods_Requirement where';
  if checkbox1.Checked then
  begin
    if trim(edit1.Text)<>'' then t_Sql:=t_Sql+' Copy_Date ='+''''+ Trim(Edit1.Text)+''''+' and '
    else
    begin
      showmessage('请填写录单日期！');
      exit;
    end;
  end;
  if checkbox2.Checked then
  begin
    if trim(edit2.Text)<>'' then t_Sql:=t_Sql+' Stock_NO ='+''''+ Trim(Edit2.Text)+''''+' and '
    else
    begin
      showmessage('请填写单据编号！');
      exit;
    end;
  end;
  if checkbox4.Checked then
  begin
    try
      tdate:=strtodate(edit4.Text);
      tdate:=strtodate(edit5.Text);
      t_sql:=t_sql+' Copy_Date between '''+Edit4.Text+''' and '''+Edit5.Text+''''+' and '
    except
      showmessage('请填写正确的录单日期段！');
      exit;
    end;
  end;
  if checkbox3.Checked then
  begin
    if trim(edit3.Text)<>'' then t_Sql:=t_Sql+' transactor Like '+''''+'%'+ Trim(Edit3.Text)+'%'+''''+' and '
    else
    begin
      showmessage('请填写经手人员！');
      exit;
    end;
  end;
  t_Sql:=Copy(t_Sql,0,length(t_Sql)-4);
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=adisp.resultrecord(t_sql);
  dmmain.CDSquery2.Open;
  DataSource1.DataSet:=dmmain.CDSquery2;
  DataSource1.Enabled:=True;
  DBGrid1.DataSource:=DataSource1;
  DBGrid1.Columns[0].Title.Caption:='序号';
  DBGrid1.Columns[0].Width:=30;
  DBGrid1.Columns[1].Title.Caption:='录单日期';
  DBGrid1.Columns[1].Width:=90;
  DBGrid1.Columns[2].Title.Caption:='单据编号';
  DBGrid1.Columns[2].Width:=120;
  DBGrid1.Columns[3].Title.Caption:='单据名称';
  DBGrid1.Columns[3].Width:=140;
  DBGrid1.Columns[4].Title.Caption:='仓库编号';
  DBGrid1.Columns[4].Width:=90;
  DBGrid1.Columns[5].Title.Caption:='店面名称';
  DBGrid1.Columns[5].Width:=140;
  DBGrid1.Columns[6].Title.Caption:='经手人';
  DBGrid1.Columns[6].Width:=70;
  DBGrid1.Columns[7].Title.Caption:='制单人';
  DBGrid1.Columns[7].Width:=70;
  DBGrid1.Columns[8].Title.Caption:='摘要';
  DBGrid1.Columns[8].Width:=200;
  DBGrid1.Columns[9].Title.Caption:='说明';
  DBGrid1.Columns[9].Width:=200;

end;

procedure Tfrm_Goods_Requipment_Search.FormShow(Sender: TObject);
var
  t_sql:widestring;
begin
  t_sql:='select distinct Copy_Date from Goods_Requirement';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=adisp.execSql(t_sql);
  dmmain.CDSexecsql.Open;
  edit1.Clear;
  while not dmmain.CDSexecsql.Eof do
  begin
    edit1.Items.Add(dmmain.CDSexecsql.fieldbyname('Copy_Date').AsString);
    dmmain.CDSexecsql.Next;
  end;
  t_sql:='select distinct Stock_NO from Goods_Requirement';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=adisp.execSql(t_sql);
  dmmain.CDSexecsql.Open;
  edit2.Clear;
  while not dmmain.CDSexecsql.Eof do
  begin
    edit2.Items.Add(dmmain.CDSexecsql.fieldbyname('Stock_NO').AsString);
    dmmain.CDSexecsql.Next;
  end;
  t_sql:='select distinct transactor from Goods_Requirement';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=adisp.execSql(t_sql);
  dmmain.CDSexecsql.Open;
  edit3.Clear;
  while not dmmain.CDSexecsql.Eof do
  begin
    edit3.Items.Add(dmmain.CDSexecsql.fieldbyname('transactor').AsString);
    dmmain.CDSexecsql.Next;
  end;


end;

end.
