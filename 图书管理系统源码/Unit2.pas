unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, XPMenu, DB, ADODB;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    XPMenu1: TXPMenu;
    ADOQuery1: TADOQuery;
    Button3: TButton;
    DataSource1: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    str_humanid:string;   //权限编号
  public
    { Public declarations }
    fm_bool:boolean;      //控制窗体显示的变量
    procedure Clear_edit_and_checkbox();
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  ADOQuery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  fm_bool:=true;
end;


procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fm_bool:=false;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select user_name,emp_name,emp_sex,tab_login.human_id as hu_id from tab_login,tab_empinfo where tab_login.employer_id=tab_empinfo.employer_id and user_name=:A');
  ADOQuery1.Parameters.ParamByName('A').Value:=trim(edit1.Text);
  ADOQuery1.Open;
  if ADOQuery1.RecordCount>0 then
  begin
    DBGrid1.DataSource:= DataSource1;
    DBGrid1.Columns.Items[0].FieldName:='user_name';
    DBGrid1.Columns.Items[1].FieldName:='emp_name';
    DBGrid1.Columns.Items[2].FieldName:='emp_sex';
    str_humanid:=ADOQuery1.FieldValues['hu_id'];
    button2.Enabled:=true;
  end
  else
  begin
    MessageDlg('用户不存在！！', mtWarning, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_human where human_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=str_humanid;
  ADOQuery.Open;
  Checkbox1.Checked:=ADOQuery.FieldByName('human_select').AsBoolean;
  Checkbox2.Checked:=ADOQuery.FieldByName('human_insert').AsBoolean;
  Checkbox3.Checked:=ADOQuery.FieldByName('human_update').AsBoolean;
  Checkbox4.Checked:=ADOQuery.FieldByName('human_delete').AsBoolean;
  ADOQuery.Free;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('update tab_human set human_select=:A,human_insert=:S,human_update=:D,human_delete=:F where human_id=:G');
  ADOQuery.Parameters.ParamByName('A').Value:=Checkbox1.Checked;
  ADOQuery.Parameters.ParamByName('S').Value:=Checkbox2.Checked;
  ADOQuery.Parameters.ParamByName('D').Value:=Checkbox3.Checked;
  ADOQuery.Parameters.ParamByName('F').Value:=Checkbox4.Checked;
  ADOQuery.Parameters.ParamByName('G').Value:=str_humanid;
  TRY
    ADOQuery.ExecSQL;
    MessageDlg('重设权限成功！！', mtInformation, [mbYes],0);
  except
    MessageDlg('操作失败！！', mtWarning, [mbYes],0);
  end;
  ADOQuery.Free;
  button2.Enabled:=false;
end;

procedure TForm2.Clear_edit_and_checkbox;
begin
  edit1.Text:='';
  checkbox1.Checked:=false;
  checkbox2.Checked:=false;
  checkbox3.Checked:=false;
  checkbox4.Checked:=false;
  DBGrid1.DataSource:=nil;
end;

end.
