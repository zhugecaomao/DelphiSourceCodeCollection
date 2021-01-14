unit chaxunUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, DB,
  DBTables, BusinessSkinForm;

type
  Tchaxunform = class(TForm)
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    classinfo: TGroupBox;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton1: TRadioButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    edit1: TEdit;
    edit2: TEdit;
    combox2: TComboBox;
    combox1: TComboBox;
    stugre: TGroupBox;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel3: TBevel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    dengji: TComboBox;
    BitBtn3: TBitBtn;
    GroupBox7: TGroupBox;
    DBGrid3: TDBGrid;
    stuinfo: TGroupBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    xsbh: TEdit;
    xsxm: TEdit;
    ssbj: TEdit;
    ssmz: TComboBox;
    xb: TComboBox;
    BitBtn2: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    StatusBar1: TStatusBar;
    RadioButton4: TRadioButton;
    DataSource1: TDataSource;
    Query1: TQuery;
    sqlgroup: TGroupBox;
    GroupBox8: TGroupBox;
    Memo1: TMemo;
    BitBtn4: TBitBtn;
    GroupBox9: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox10: TGroupBox;
    DBGrid4: TDBGrid;
    Bevel4: TBevel;
    Bevel5: TBevel;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    procedure FormShow(Sender: TObject);
    procedure edit1Exit(Sender: TObject);
    procedure edit2Exit(Sender: TObject);
    procedure combox1Exit(Sender: TObject);
    procedure combox2Exit(Sender: TObject);
    procedure edit1Enter(Sender: TObject);
    procedure combox1Enter(Sender: TObject);
    procedure combox2Enter(Sender: TObject);
    procedure edit2Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure xsbhExit(Sender: TObject);
    procedure xsxmExit(Sender: TObject);
    procedure ssbjExit(Sender: TObject);
    procedure ssmzExit(Sender: TObject);
    procedure xbExit(Sender: TObject);
    procedure xsbhEnter(Sender: TObject);
    procedure xsxmEnter(Sender: TObject);
    procedure ssbjEnter(Sender: TObject);
    procedure ssmzEnter(Sender: TObject);
    procedure xbEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure dengjiExit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure dengjiEnter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chaxunform: Tchaxunform;

implementation
uses dataunit,mainunit;

{$R *.dfm}

procedure Tchaxunform.FormShow(Sender: TObject);
begin
mainform.dataref;
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit5.Text:='';
dengji.Text:='';
combox2.Text:='';
combox1.Text:='';
xsbh.Text:='';
xsxm.Text:='';
ssbj.Text:='';
ssmz.Text:='';
xb.Text:='';
DBGrid1.DataSource:=DataModule1.dbanjixinxi;
DBGrid2.DataSource:=DataModule1.dxueshengxinxi;
DBGrid3.DataSource:=DataModule1.dstugread;
end;

procedure Tchaxunform.edit1Exit(Sender: TObject);
begin
if edit1.Text<>'' then
  begin
    edit2.Enabled:=false;
    combox1.Enabled:=false;
    combox2.Enabled:=false;
  end;
end;

procedure Tchaxunform.edit2Exit(Sender: TObject);
begin
if edit2.Text<>'' then
  begin
    edit1.Enabled:=false;
    combox1.Enabled:=false;
    combox2.Enabled:=false;
  end;
end;

procedure Tchaxunform.combox1Exit(Sender: TObject);
begin
if combox1.Text<>'' then
  begin
    edit2.Enabled:=false;
    edit1.Enabled:=false;
    combox2.Enabled:=false;
  end;
end;

procedure Tchaxunform.combox2Exit(Sender: TObject);
begin
if combox2.Text<>'' then
  begin
    edit2.Enabled:=false;
    edit1.Enabled:=false;
    combox1.Enabled:=false;
  end;
end;

procedure Tchaxunform.edit1Enter(Sender: TObject);
begin
  edit2.Enabled:=true;
  combox1.Enabled:=true;
  combox2.Enabled:=true;
end;

procedure Tchaxunform.combox1Enter(Sender: TObject);
begin
edit1.Enabled:=true;
edit2.Enabled:=true;
combox2.Enabled:=true;
end;

procedure Tchaxunform.combox2Enter(Sender: TObject);
begin
edit1.Enabled:=true;
edit2.Enabled:=true;
combox1.Enabled:=true;
end;

procedure Tchaxunform.edit2Enter(Sender: TObject);
begin
edit1.Enabled:=true;
combox2.Enabled:=true;
combox1.Enabled:=true;
end;

procedure Tchaxunform.BitBtn1Click(Sender: TObject);
begin
if edit1.Enabled=true then
  begin
    DBGrid1.DataSource.DataSet.Filter:='班级代码='+QuotedStr(edit1.Text);
    DBGrid1.DataSource.DataSet.Filtered:=true;
  end
else if edit2.Enabled=true then
  begin
    DBGrid1.DataSource.DataSet.Filter:='班级名称='+QuotedStr(edit2.Text);
    DBGrid1.DataSource.DataSet.Filtered:=true;
  end
else if combox1.Enabled=true then
  begin
    DBGrid1.DataSource.DataSet.Filter:='入学年限='+QuotedStr(combox1.Text);
    DBGrid1.DataSource.DataSet.Filtered:=true;
  end
else if combox2.Enabled=true then
  begin
    DBGrid1.DataSource.DataSet.Filter:='学制类型='+QuotedStr(combox2.Text);
    DBGrid1.DataSource.DataSet.Filtered:=true;
  end;
end;

procedure Tchaxunform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
mainform.closetable;
DBGrid1.DataSource:=DataModule1.Dnull;
DBGrid2.DataSource:=DataModule1.Dnull;
DBGrid3.DataSource:=DataModule1.Dnull;
mainform.Show;
end;

procedure Tchaxunform.xsbhExit(Sender: TObject);
begin
if xsbh.Text<>'' then
  begin
    xsxm.Enabled:=false;
    ssbj.Enabled:=false;
    ssmz.Enabled:=false;
    xb.Enabled:=false;
  end;
end;

procedure Tchaxunform.xsxmExit(Sender: TObject);
begin
if xsxm.Text<>'' then
  begin
    xsbh.Enabled:=false;
    ssbj.Enabled:=false;
    ssmz.Enabled:=false;
    xb.Enabled:=false;
  end;
end;

procedure Tchaxunform.ssbjExit(Sender: TObject);
begin
if ssbj.Text<>'' then
  begin
    xsbh.Enabled:=false;
    xsxm.Enabled:=false;
    ssmz.Enabled:=false;
    xb.Enabled:=false;
  end;
end;

procedure Tchaxunform.ssmzExit(Sender: TObject);
begin
if ssmz.Text<>'' then
  begin
    xsbh.Enabled:=false;
    xsxm.Enabled:=false;
    ssbj.Enabled:=false;
    xb.Enabled:=false;
  end;
end;

procedure Tchaxunform.xbExit(Sender: TObject);
begin
if xb.Text<>''then
  begin
    xsbh.Enabled:=false;
    xsxm.Enabled:=false;
    ssbj.Enabled:=false;
    ssmz.Enabled:=false;
  end;
end;

procedure Tchaxunform.xsbhEnter(Sender: TObject);
begin
xsxm.Enabled:=true;
ssbj.Enabled:=true;
ssmz.Enabled:=true;
xb.Enabled:=true;
end;

procedure Tchaxunform.xsxmEnter(Sender: TObject);
begin
xsbh.Enabled:=true;
ssbj.Enabled:=true;
ssmz.Enabled:=true;
xb.Enabled:=true;
end;

procedure Tchaxunform.ssbjEnter(Sender: TObject);
begin
xsbh.Enabled:=true;
xsxm.Enabled:=true;
ssmz.Enabled:=true;
xb.Enabled:=true;
end;

procedure Tchaxunform.ssmzEnter(Sender: TObject);
begin
xsbh.Enabled:=true;
xsxm.Enabled:=true;
ssbj.Enabled:=true;
xb.Enabled:=true;
end;

procedure Tchaxunform.xbEnter(Sender: TObject);
begin
xsbh.Enabled:=true;
xsxm.Enabled:=true;
ssbj.Enabled:=true;
ssmz.Enabled:=true;
end;

procedure Tchaxunform.BitBtn2Click(Sender: TObject);
begin
if xsbh.Enabled=true then
  begin
    DBGrid2.DataSource.DataSet.Filter:='学生编号='+QuotedStr(xsbh.Text);
    DBGrid2.DataSource.DataSet.Filtered:=true;
  end
else if xsxm.Enabled=true then
  begin
    DBGrid2.DataSource.DataSet.Filter:='学生姓名='+QuotedStr(xsxm.Text);
    DBGrid2.DataSource.DataSet.Filtered:=true;
  end
else if ssbj.Enabled=true then
  begin
    DBGrid2.DataSource.DataSet.Filter:='所属班级名称='+QuotedStr(ssbj.Text);
    DBGrid2.DataSource.DataSet.Filtered:=true;
  end
else if ssmz.Enabled=true then
  begin
    DBGrid2.DataSource.DataSet.Filter:='民族属性='+QuotedStr(ssmz.Text);
    DBGrid2.DataSource.DataSet.Filtered:=true;
  end
else if xb.Enabled=true then
  begin
    DBGrid2.DataSource.DataSet.Filter:='学生性别='+QuotedStr(xb.Text);
    DBGrid2.DataSource.DataSet.Filtered:=true;
  end;
end;

procedure Tchaxunform.Edit3Exit(Sender: TObject);
begin
  if edit3.Text<>'' then
    begin
      edit4.Enabled:=false;
      edit5.Enabled:=false;
      dengji.Enabled:=false;
    end;
end;

procedure Tchaxunform.Edit4Exit(Sender: TObject);
begin
if edit4.Text<>''then
  begin
    edit3.Enabled:=false;
    edit5.Enabled:=false;
    dengji.Enabled:=false;
  end;
end;

procedure Tchaxunform.Edit5Exit(Sender: TObject);
begin
if edit5.Text<>'' then
  begin
    edit3.Enabled:=false;
    edit4.Enabled:=false;
    dengji.Enabled:=false;
  end;
end;

procedure Tchaxunform.dengjiExit(Sender: TObject);
begin
if dengji.Text<>''then
  begin
    edit3.Enabled:=false;
    edit4.Enabled:=false;
    edit5.Enabled:=false;
  end;
end;

procedure Tchaxunform.Edit3Enter(Sender: TObject);
begin
edit5.Enabled:=true;
dengji.Enabled:=true;
end;

procedure Tchaxunform.Edit4Enter(Sender: TObject);
begin
edit3.Enabled:=true;
edit5.Enabled:=true;
dengji.Enabled:=true;
end;

procedure Tchaxunform.Edit5Enter(Sender: TObject);
begin
edit3.Enabled:=true;
dengji.Enabled:=true;
end;

procedure Tchaxunform.dengjiEnter(Sender: TObject);
begin
edit3.Enabled:=true;
edit5.Enabled:=true;
end;

procedure Tchaxunform.BitBtn3Click(Sender: TObject);
begin
if edit3.Enabled=true then
  begin
    DBGrid3.DataSource.DataSet.Filter:='学生编号='+QuotedStr(edit3.Text);
    DBGrid3.DataSource.DataSet.Filtered:=true;
  end
else if edit4.Enabled=true then
  begin

  end
else if edit5.Enabled=true then
  begin
    DBGrid3.DataSource.DataSet.Filter:='总成绩='+QuotedStr(edit5.Text);
    DBGrid3.DataSource.DataSet.Filtered:=true;
  end
else if dengji.Enabled=true then
  begin
    DBGrid3.DataSource.DataSet.Filter:='等级评定='+QuotedStr(dengji.Text);
    DBGrid3.DataSource.DataSet.Filtered:=true;
  end;
end;

procedure Tchaxunform.RadioButton1Click(Sender: TObject);
begin
if RadioButton1.Checked=true then
  begin
    stuinfo.Visible:=false;
    stugre.Visible:=false;
    sqlgroup.Visible:=false;
    classinfo.Visible:=true;
  end;
end;

procedure Tchaxunform.RadioButton3Click(Sender: TObject);
begin
if RadioButton3.Checked=true then
  begin
    classinfo.Visible:=false;
    stuinfo.Visible:=false;
    sqlgroup.Visible:=false;
    stugre.Visible:=true;
  end;
end;

procedure Tchaxunform.RadioButton2Click(Sender: TObject);
begin
if RadioButton2.Checked=true then
  begin
  classinfo.Visible:=false;
  stugre.Visible:=false;
  sqlgroup.Visible:=false;
  stuinfo.Visible:=true;
  end;
end;

procedure Tchaxunform.FormCreate(Sender: TObject);
begin
mainform.dataref;
chaxunform.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-chaxunform.Width div 2;
chaxunform.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-chaxunform.Height div 2;
end;




procedure Tchaxunform.BitBtn4Click(Sender: TObject);
begin
if Memo1.Lines.Text<>'' then
  begin
    with Query1 do
      begin
        Close;
        UnPrepare;
        SQL.Clear;
        SQL.Add(Memo1.Lines.Text);
        try
          query1.Prepare;
          query1.ExecSQL;
        except
          Application.MessageBox('语法错误！','提示');
          abort;
        end;
        Active:=true;
      end;
  end
else
  Application.MessageBox('没有查询语句！','提示');
end;

procedure Tchaxunform.RadioButton4Click(Sender: TObject);
begin
if RadioButton4.Checked=true then
  begin
    classinfo.Visible:=false;
    stuinfo.Visible:=false;
    stugre.Visible:=false;
    sqlgroup.Visible:=true;
  end;
end;

procedure tchaxunform.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
    with msg.minmaxinfo^ do

    begin
      ptMinTrackSize:=point(672,465);//  限定大小
      ptMaxTrackSize:=point(672,465); // 限定大小
    end;
end;


end.
