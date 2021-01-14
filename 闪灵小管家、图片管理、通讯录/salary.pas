unit salary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls,mmsystem, Grids, DBGrids, DB, ADODB, XPMenu,
  ComCtrls, Menus;

type
  Tsalary_form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    Panel7: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel8: TPanel;
    Panel9: TPanel;
    Label3: TLabel;
    SpeedButton7: TSpeedButton;
    Panel10: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel11: TPanel;
    Panel12: TPanel;
    Notebook1: TNotebook;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    XPMenu1: TXPMenu;
    N1: TMenuItem;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo2: TMemo;
    DateTimePicker2: TDateTimePicker;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel14: TPanel;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    Panel15: TPanel;
    GroupBox6: TGroupBox;
    Panel16: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label12: TLabel;
    Label13: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    BitBtn5: TBitBtn;
    Panel17: TPanel;
    GroupBox7: TGroupBox;
    Memo3: TMemo;
    ADOQuery2: TADOQuery;
    GroupBox8: TGroupBox;
    DBGrid4: TDBGrid;
    Panel18: TPanel;
    GroupBox9: TGroupBox;
    Memo4: TMemo;
    BitBtn6: TBitBtn;
    PopupMenu2: TPopupMenu;
    select1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    where1: TMenuItem;
    and1: TMenuItem;
    or1: TMenuItem;
    like1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure select1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure where1Click(Sender: TObject);
    procedure and1Click(Sender: TObject);
    procedure or1Click(Sender: TObject);
    procedure like1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  salary_form: Tsalary_form;
  blank:string;

implementation
  uses main;
{$R *.dfm}

{自定义声音播放函数}
function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tsalary_form.Label1Click(Sender: TObject);
begin
if Panel4.Visible=true then
begin
Panel4.Visible:=false;
Panel2.Height:=Panel2.Height-Panel4.Height;
Panel5.Top:=Panel5.Top-Panel4.Height;
Panel8.Top:=Panel8.Top-Panel4.Height;
SpeedButton1.Caption:='■';
end
else
begin
Panel4.Visible:=true;
Panel2.Height:=Panel2.Height+Panel4.Height;
Panel5.Top:=Panel5.Top+Panel4.Height;
Panel8.Top:=Panel8.Top+Panel4.Height;
SpeedButton1.Caption:='▲';
end;
end;

procedure Tsalary_form.Label2Click(Sender: TObject);
begin
if Panel7.Visible=true then
begin
Panel7.Visible:=false;
Panel5.Height:=Panel5.Height-Panel7.Height;
Panel8.Top:=Panel8.Top-Panel7.Height;
SpeedButton4.Caption:='■';
end
else
begin
Panel7.Visible:=true;
Panel5.Height:=Panel5.Height+Panel7.Height;
Panel8.Top:=Panel8.Top+Panel7.Height;
SpeedButton4.Caption:='▲';
end;
end;

procedure Tsalary_form.Label3Click(Sender: TObject);
begin
if Panel10.Visible=true then
begin
Panel10.Visible:=false;
Panel8.Height:=Panel8.Height-Panel10.Height;
SpeedButton7.Caption:='■';
end
else
begin
Panel10.Visible:=true;
Panel8.Height:=Panel8.Height+Panel10.Height;
SpeedButton7.Caption:='▲';
end;
end;

procedure Tsalary_form.SpeedButton8Click(Sender: TObject);
begin
close;
end;

procedure Tsalary_form.FormCreate(Sender: TObject);
begin
DateTimePicker1.Date:=date();
DateTimePicker2.Date:=date();
SpeedButton2click(self);

end;

procedure Tsalary_form.Edit2KeyPress(Sender: TObject; var Key: Char);
var
m:boolean;
begin
m:=(key<#8)or(key>#8)and(key<#45)or(key>#46)and(key<#48)or(key>#57);
if m then
key:=#0;
end;

procedure Tsalary_form.BitBtn1Click(Sender: TObject);
var
f:single;
begin
if trim(edit1.Text)='' then
begin
playwav('sound\error.wav');
MessageBox(handle,'请填写收入来源！','错误',MB_OK+MB_ICONERROR);
edit1.SetFocus;
exit;
end;
if (trim(edit2.Text)='') or (not trystrtofloat(trim(edit2.Text),f)) then
begin
playwav('sound\error.wav');
MessageBox(handle,'请填写正确的收入金额！','错误',MB_OK+MB_ICONERROR);
edit2.Clear;
edit2.SetFocus;
exit;
end;

with ADOQuery1 do
begin
 close;
 sql.Clear;
 sql.Add('select * from salary');
 prepared;
 open;
 append;
 edit;
 ADOQuery1.FieldValues['subject']:=trim(edit1.Text);
 ADOQuery1.FieldValues['money']:=trim(edit2.Text);
 ADOQuery1.FieldValues['date']:=formatdatetime('yyyy-mm-dd',DateTimePicker1.Date);
 ADOQuery1.FieldValues['note']:=trim(memo1.Text);
 ADOQuery1.FieldValues['type']:='in';
 post;
 refresh;
end;
BitBtn2click(self);
end;

procedure Tsalary_form.N1Click(Sender: TObject);
begin
playwav('sound\info.wav');
if not ADOQuery1.Eof then
if MessageBox(handle,'请确定要删除此记录吗？','提示',MB_YESNO+MB_ICONQUESTION)=ID_YES then
ADOQuery1.Delete;
end;

procedure Tsalary_form.BitBtn2Click(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
memo1.Clear;
DateTimePicker1.Date:=now();
end;

procedure Tsalary_form.SpeedButton2Click(Sender: TObject);
begin
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from salary where type="in"');
open;
end;
Notebook1.PageIndex:=0;
end;

procedure Tsalary_form.SpeedButton3Click(Sender: TObject);
begin
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from salary where type="out"');
open;
end;
DateTimePicker3.Date:=now();
DateTimePicker4.Date:=now();
Notebook1.PageIndex:=2;
end;

procedure Tsalary_form.BitBtn3Click(Sender: TObject);
var
f:single;
begin
if trim(edit3.Text)='' then
begin
playwav('sound\error.wav');
MessageBox(handle,'请填写支出项目！','错误',MB_OK+MB_ICONERROR);
edit3.SetFocus;
exit;
end;
if (trim(edit4.Text)='') or (not trystrtofloat(trim(edit4.Text),f)) then
begin
playwav('sound\error.wav');
MessageBox(handle,'请填写正确的支出金额！','错误',MB_OK+MB_ICONERROR);
edit4.Clear;
edit4.SetFocus;
exit;
end;

with ADOQuery1 do
begin
 close;
 sql.Clear;
 sql.Add('select * from salary');
 prepared;
 open;
 append;
 edit;
 ADOQuery1.FieldValues['subject']:=trim(edit3.Text);
 ADOQuery1.FieldValues['money']:=trim(edit4.Text);
 ADOQuery1.FieldValues['date']:=formatdatetime('yyyy-mm-dd',DateTimePicker2.Date);
 ADOQuery1.FieldValues['note']:=trim(memo2.Text);
 ADOQuery1.FieldValues['type']:='out';
 post;
 refresh;
end;
BitBtn4click(self);
end;

procedure Tsalary_form.BitBtn4Click(Sender: TObject);
begin
edit3.Clear;
edit4.Clear;
memo2.Clear;
DateTimePicker2.Date:=now();
end;

procedure Tsalary_form.SpeedButton5Click(Sender: TObject);
var
i,year:integer;
begin
DateTimePicker3.Date:=now();
DateTimePicker4.Date:=now();
year:=strtoint(formatdatetime('yyyy',date()));
for i:=year-5 to year+5 do
begin
 ComboBox1.Items.Add(inttostr(i));
end;
RadioButton1.Checked:=true;
ComboBox1.Enabled:=false;
ComboBox2.Enabled:=false;
ComboBox3.Enabled:=false;
memo3.Clear;
with ADOQuery1 do
begin
 close;
 sql.Clear;
 sql.Add('select * from salary');
 prepared;
 open;
end;
Notebook1.PageIndex:=1;
end;

procedure Tsalary_form.RadioButton1Click(Sender: TObject);
begin
DateTimePicker3.Enabled:=true;
DateTimePicker4.Enabled:=true;
ComboBox1.Enabled:=false;
ComboBox2.Enabled:=false;
ComboBox3.Enabled:=false;
RadioButton1.Checked:=true;
end;

procedure Tsalary_form.RadioButton2Click(Sender: TObject);
begin
DateTimePicker3.Enabled:=false;
DateTimePicker4.Enabled:=false;
ComboBox1.Enabled:=true;
RadioButton2.Checked:=true;
end;

procedure Tsalary_form.BitBtn5Click(Sender: TObject);
var
time_start,time_end,csql,csql_in,csql_out:string;
earn,pay:single;
i:integer;
begin
if RadioButton1.Checked then
begin
  time_start:=formatdatetime('yyyy-mm-dd',DateTimePicker3.Date);
  time_end:=formatdatetime('yyyy-mm-dd',DateTimePicker4.Date);
  if time_start>time_end then
  begin
  playwav('sound\error.wav');
  MessageBox(handle,'请填写正确时间查询段！','错误',MB_OK+MB_ICONERROR);
  exit;
  end;
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from salary where date between "'+time_start+'" and "'+time_end+'"');
    prepared;
    open;
  end;
  if  ADOQuery1.RecordCount=0 then
  begin
  memo3.Clear;
  memo3.Lines.Insert(0,'没有找到相关记录！');
  exit;
  end;
    with ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from salary where date>="'+time_start+'" and date<="'+time_end+'" and type="in"');
    prepared;
    open;
  end;
  //统计收入，支出，以及本次节余；
  if ADOQuery2.RecordCount<>0 then
  for i:=1 to ADOQuery2.RecordCount do
  begin
   earn:=earn+ADOQuery2.FieldValues['money'];
   ADOQuery2.Next;
  end
  else
  earn:=0;
  
   with ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from salary where date>="'+time_start+'" and date<="'+time_end+'" and type="out"');
    prepared;
    open;
  end;
  if ADOQuery2.RecordCount<>0 then
  for i:=1 to ADOQuery2.RecordCount do
  begin
   pay:=pay+ADOQuery2.FieldValues['money'];
   ADOQuery2.Next;
  end
  else
  pay:=0;

  memo3.Clear;
  memo3.Lines.Insert(0,'请稍候。。。正在统计查询结果。');
  sleep(1000);
  //输出统计结果
  memo3.Clear;
  memo3.Lines.Insert(0,'从'+time_start+' 到 '+time_end+'期间，总收入为：'+floattostr(earn));
  memo3.Lines.Insert(1,'从'+time_start+' 到 '+time_end+'期间，总支出为：'+floattostr(pay));
  if earn>pay then
  memo3.Lines.Insert(2,'从'+time_start+' 到 '+time_end+'期间，总节余为：'+floattostr(earn-pay))
  else
  memo3.Lines.Insert(2,'从'+time_start+' 到 '+time_end+'期间，总超支为：'+floattostr(pay-earn));
end;
if RadioButton2.Checked then
begin
csql:='select * from salary ';
if (combobox1.Text<>'') and (combobox2.Text='') and (combobox3.Text='') then
csql:=csql+'where date like "%'+combobox1.Text+'%" ';
if (combobox1.Text<>'') and (combobox2.Text<>'') and (combobox3.Text='') then
csql:=csql+'where date like "%'+combobox1.Text+'-'+combobox2.Text+'%" ';
if (combobox1.Text<>'') and (combobox2.Text<>'') and (combobox3.Text<>'') then
csql:=csql+'where date="'+combobox1.Text+'-'+combobox2.Text+'-'+combobox3.Text+'" ';
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add(csql);
prepared;
open;
end;
memo3.Clear;
if  ADOQuery1.RecordCount=0 then
begin
memo3.Clear;
memo3.Lines.Insert(0,'没有找到相关记录！');
exit;
end;
csql_in:=csql+'and type="in"';
csql_out:=csql+'and type="out"';
with ADOQuery2 do
begin
close;
sql.Clear;
sql.Add(csql_in);
prepared;
open;
end;
 if ADOQuery2.RecordCount<>0 then
  for i:=1 to ADOQuery2.RecordCount do
  begin
   earn:=earn+ADOQuery2.FieldValues['money'];
   ADOQuery2.Next;
  end
  else
  earn:=0;
with ADOQuery2 do
begin
close;
sql.Clear;
sql.Add(csql_out);
prepared;
open;
end;
if ADOQuery2.RecordCount<>0 then
  for i:=1 to ADOQuery2.RecordCount do
  begin
   pay:=pay+ADOQuery2.FieldValues['money'];
   ADOQuery2.Next;
  end
  else
  pay:=0;

  memo3.Clear;
  memo3.Lines.Insert(0,'请稍候。。。正在统计查询结果。');
  sleep(1000);
  //输出统计结果
  memo3.Clear;
  memo3.Lines.Insert(0,'总收入为：'+floattostr(earn));
  memo3.Lines.Insert(1,'总支出为：'+floattostr(pay));
  if earn>pay then
  memo3.Lines.Insert(2,'总节余为：'+floattostr(earn-pay))
  else
  memo3.Lines.Insert(2,'总超支为：'+floattostr(pay-earn));
end;
combobox2.Enabled:=false;
combobox3.Enabled:=false;
earn:=0;
pay:=0;
end;

procedure Tsalary_form.ComboBox1Change(Sender: TObject);
begin
if combobox1.Text<>'' then
 combobox2.Enabled:=true;
end;

procedure Tsalary_form.ComboBox2Change(Sender: TObject);
begin
if ComboBox2.Text<>'' then
ComboBox3.Enabled:=true;
end;

procedure Tsalary_form.select1Click(Sender: TObject);

begin
memo4.Clear;
memo4.Lines[0]:='select';
end;

procedure Tsalary_form.SpeedButton6Click(Sender: TObject);
begin
blank:=' ';
ADOQuery1.Active:=false;
Notebook1.PageIndex:=3;
end;

procedure Tsalary_form.N3Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'*';
end;

procedure Tsalary_form.N4Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'subject';
end;

procedure Tsalary_form.N5Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+',subject';
end;

procedure Tsalary_form.N6Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+',date';
end;

procedure Tsalary_form.N7Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+',note';
end;

procedure Tsalary_form.where1Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'where';
end;

procedure Tsalary_form.and1Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'and';
end;

procedure Tsalary_form.or1Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'or';
end;

procedure Tsalary_form.like1Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'like';
end;

procedure Tsalary_form.N14Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'!=';
end;

procedure Tsalary_form.N10Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'asc';
end;

procedure Tsalary_form.N11Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'desc';
end;

procedure Tsalary_form.BitBtn6Click(Sender: TObject);
var
csql:string;
begin
if trim(memo4.Text)='' then
  begin
  playwav('sound\error.wav');
  MessageBox(handle,'请填写SQL查询语句！','错误',MB_OK+MB_ICONERROR);
  exit;
  end;
  csql:=trim(memo4.Text);
  try
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add(csql);
prepared;
open;
end;
  except
  begin
  memo1.Clear;
  playwav('sound\error.wav');
  MessageBox(handle,'你填写的SQL语句有错！','错误',MB_OK+MB_ICONERROR);
  end;
  end;
end;

procedure Tsalary_form.N15Click(Sender: TObject);
begin
memo4.Lines[0]:=memo4.Text+blank+'from salary';
end;

procedure Tsalary_form.SpeedButton9Click(Sender: TObject);
begin
  playwav('sound\error.wav');
if MessageBox(handle,'你确定要清空数据表吗？'+#13#10+'你会丢失所有的数据！'+#13#10+'请先备份数据库。','错误',MB_YESNO+MB_ICONQUESTION)=ID_YES THEN
begin
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('delete * from salary');
ExecSQL;
end;
playwav('sound\sucess.wav');
MessageBox(handle,'数据成功空！','提示',MB_OK+MB_ICONINFORMATION);
end;
end;

end.
