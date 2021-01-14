unit gzdagl_employee_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Buttons,
  Mask, DB, ADODB;

type
  TForm_employee = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit_no: TEdit;
    Edit_name: TEdit;
    Edit_age: TEdit;
    Edit_xueli: TEdit;
    Edit_zhiwei: TEdit;
    Edit_phone: TEdit;
    BTaddemployee: TBitBtn;
    BTcancelemployee: TBitBtn;
    ComBox_sex: TComboBox;
    ComBox_ks: TComboBox;
    Tdatetime_rz: TDateTimePicker;
    DBNavigator1: TDBNavigator;
    Label11: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Edit_noChange(Sender: TObject);
    procedure BTaddemployeeClick(Sender: TObject);
    procedure BTcancelemployeeClick(Sender: TObject);
   

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_employee: TForm_employee;

implementation

uses gzdagl_DM_, gzdagl_department_, gzdagl_;

{$R *.dfm}


procedure TForm_employee.FormActivate(Sender: TObject);
var
ks:string;
//从课时表中循环找出科室名称
begin
//DMgzdagl.ADOTdepartment.Open;
while not DMgzdagl.ADOTdepartment.Eof do
 begin
  ks:=DMgzdagl.ADOTdepartment.fields.fieldbyname('科室名称').AsString;
  combox_ks.Items.Add(ks);
  DMgzdagl.ADOTdepartment.Next;
 end;
//DMgzdagl.ADOTdepartment.Close;
end;

procedure TForm_employee.Edit_noChange(Sender: TObject);
//控制BTaddemployee按钮的enabled属性
begin
  if length(edit_no.Text)>0 then
     BTaddemployee.Enabled:=true
  else
     BTaddemployee.Enabled:=false;
end;

procedure TForm_employee.BTaddemployeeClick(Sender: TObject);
begin
//判断员工编号是否已经存在
  if DMgzdagl.ADOTemployee.Locate('员工编号',edit_no.text,[])=false then
     with DMgzdagl.ADOTemployee do
        begin
          append;
          DMgzdagl.ADOTemployee.FieldByName('员工编号').AsString:=edit_no.Text;
          DMgzdagl.ADOTemployee.FieldByName('员工姓名').AsString:=edit_name.Text;
          DMgzdagl.ADOTemployee.FieldByName('性别').AsString:=combox_sex.text;
          DMgzdagl.ADOTemployee.FieldByName('学历').AsString:=edit_xueli.Text;
          DMgzdagl.ADOTemployee.FieldByName('职位').AsString:=edit_zhiwei.Text;
          DMgzdagl.ADOTemployee.FieldByName('年龄').AsString:=edit_age.Text;
          DMgzdagl.ADOTemployee.FieldByName('科室名称').AsString:=combox_ks.Text;
          DMgzdagl.ADOTemployee.FieldByName('入职时间').AsDateTime:=Tdatetime_rz.Date;
          DMgzdagl.ADOTemployee.FieldByName('电话').AsString:=edit_phone.Text;
          post;
          refresh;
          messagedlg('数据已成功入库！',mtinformation,[mbok],0);
          BTcancelemployee.Click;//即'取消新增'按钮
        end
   else
       messagedlg('记录已经存在，请从新输入！',mterror,[mbok],0);      

end;

procedure TForm_employee.BTcancelemployeeClick(Sender: TObject);
begin
//清空输入框
 edit_no.Clear;
 edit_name.Clear;
 edit_xueli.Clear;
 edit_zhiwei.Clear;
 edit_age.Clear;
 edit_phone.Clear;
 edit_no.SetFocus;//获得焦点
end;




end.
