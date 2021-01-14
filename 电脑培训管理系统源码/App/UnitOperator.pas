unit UnitOperator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDBForm, ComCtrls, DBCtrls, ExtCtrls, MenuBar, ToolWin,
  StdCtrls, DB, Grids, DBGrids, Mask;

type
  TfrmOperator = class(TBaseDBFrm)
    DS: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure ToolButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetWarrant;
  public
    { Public declarations }
  end;

var
  frmOperator: TfrmOperator;

implementation

uses UnitDM;

{$R *.dfm}

procedure TfrmOperator.ToolButton4Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
    DN.DataSource.DataSet.Post;

end;

procedure TfrmOperator.FormShow(Sender: TObject);
begin
  inherited;
self.Caption:='操作员管理';
CheckBox1.Caption:='权限1';
CheckBox2.Caption:='权限2';
CheckBox3.Caption:='权限3';
CheckBox4.Caption:='权限4';
CheckBox5.Caption:='权限5';
CheckBox6.Caption:='权限6';
CheckBox7.Caption:='权限7';
CheckBox8.Caption:='权限8';
CheckBox9.Caption:='权限9';
CheckBox10.Caption:='权限10';

DN.DataSource.DataSet.Active:=true;
end;

procedure TfrmOperator.FormDestroy(Sender: TObject);
begin
  inherited;
DN.DataSource.DataSet.Active:=false;
end;

procedure TfrmOperator.ToolButton1Click(Sender: TObject);
begin
  inherited;
DBEdit1.SetFocus;
DN.DataSource.DataSet.FieldByName('FLAG').AsString:='Y';
end;

procedure TfrmOperator.SetWarrant;
var
    ss:string[10];
begin
if CheckBox1.Checked then
    ss[1]:='1'
else
    ss[1]:='0';
if CheckBox2.Checked then
    ss[2]:='1'
else
    ss[2]:='0';
if CheckBox3.Checked then
    ss[3]:='1'
else
    ss[3]:='0';
if CheckBox4.Checked then
    ss[4]:='1'
else
    ss[4]:='0';
if CheckBox5.Checked then
    ss[5]:='1'
else
    ss[5]:='0';
if CheckBox6.Checked then
    ss[6]:='1'
else
    ss[6]:='0';
if CheckBox7.Checked then
    ss[7]:='1'
else
    ss[7]:='0';
if CheckBox8.Checked then
    ss[8]:='1'
else
    ss[8]:='0';
if CheckBox9.Checked then
    ss[9]:='1'
else
    ss[9]:='0';
if CheckBox10.Checked then
    ss[10]:='1'
else
    ss[10]:='0';

ss:=Trim(ss);
if DN.DataSource.DataSet.State in[dsEdit,dsInsert]then
    DN.DataSource.DataSet.FieldByName('WARRANT').AsString:=ss;
end;

procedure TfrmOperator.CheckBox1Click(Sender: TObject);
begin
  inherited;
SetWarrant
end;

end.
