unit addman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, ADODB, dxdbtrel, ExtCtrls;

type
  Tfaddman = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    ComboBox2: TComboBox;
    TabSheet4: TTabSheet;
    Label7: TLabel;
    ComboBox3: TComboBox;
    Label8: TLabel;
    Edit4: TEdit;
    Label9: TLabel;
    Edit5: TEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    ComboBox4: TComboBox;
    Label11: TLabel;
    Edit6: TEdit;
    Label12: TLabel;
    ComboBox5: TComboBox;
    Label13: TLabel;
    ComboBox6: TComboBox;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label15: TLabel;
    DataSource1: TDataSource;
    cxLookupComboBox1: TcxLookupComboBox;
    Memo1: TMemo;
    ADOTable1: TADOTable;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    Edit7: TEdit;
    Label17: TLabel;
    Edit8: TEdit;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Edit9: TEdit;
    Label19: TLabel;
    Edit10: TEdit;
    Label20: TLabel;
    Edit11: TEdit;
    Label21: TLabel;
    dxLookupTreeView1: TdxLookupTreeView;
    Label22: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label23: TLabel;
    Edit12: TEdit;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    etype:integer;      //1.增加  2.编辑
    bmchange:integer;   //原部门ID
    bmname:string;      //原部门名称
  end;

var
  faddman: Tfaddman;

implementation

uses fmain;

{$R *.dfm}

procedure Tfaddman.Button2Click(Sender: TObject);
begin
  close
end;

procedure Tfaddman.FormShow(Sender: TObject);
begin
  self.Edit1.SetFocus;
end;

procedure Tfaddman.FormCreate(Sender: TObject);
begin
  self.DateTimePicker2.Date:=now;
  self.DateTimePicker3.Date:=now;
end;

procedure Tfaddman.Button1Click(Sender: TObject);
var tmpid:string;
begin
  if trim(self.Edit1.Text)='' then
    begin
      MessageBox(handle,'您是否忘记输入职工姓名！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.Edit1.SetFocus;
      exit;
    end;
  if trim(self.Edit3.Text)='' then
    begin
      MessageBox(handle,'身份证号码不能为空！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.Edit3.SetFocus;
      exit;
    end;
  if trim(self.cxLookupComboBox1.Text)='' then
    begin
      MessageBox(handle,'请选择职工类型！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=1;
      self.cxLookupComboBox1.SetFocus;
      exit;
    end;
  if trim(self.dxLookupTreeView1.Text)='' then
    begin
      MessageBox(handle,'请选择所在部门！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=1;
      self.dxLookupTreeView1.SetFocus;
      exit;
    end;
  if self.etype=1 then  //..增加
    begin
      self.ADOTable1.Close;
      self.ADOTable1.Open;
      self.ADOTable1.Append;
      self.ADOTable1.FieldByName('name').AsString:=self.Edit1.Text;                     //姓名
      self.ADOTable1.FieldByName('sex').AsString:=self.ComboBox1.Text;                  //性别
      self.ADOTable1.FieldByName('ename').AsString:=self.Edit2.Text;                    //英文名
      self.ADOTable1.FieldByName('idnum').AsString:=self.Edit3.Text;                    //身份证号码
      self.ADOTable1.FieldByName('ifmarriage').AsString:=self.ComboBox2.Text;           //婚否
      self.ADOTable1.FieldByName('birthday').AsDateTime:=self.DateTimePicker1.Date;     //生日
      self.ADOTable1.FieldByName('Nationality').AsString:=self.ComboBox3.Text;          //民族
      self.ADOTable1.FieldByName('Nativeplace').AsString:=self.Edit4.Text;              //籍贯
      self.ADOTable1.FieldByName('Residence').AsString:=self.Edit5.Text;                //户口所在地
      self.ADOTable1.FieldByName('knowledge').AsString:=self.ComboBox4.Text;            //学历
      self.ADOTable1.FieldByName('School').AsString:=self.Edit6.Text;                   //毕业院校
      self.ADOTable1.FieldByName('forlang').AsString:=self.ComboBox5.Text;              //外语语种
      self.ADOTable1.FieldByName('howforlang').AsString:=self.ComboBox6.Text;           //熟练程度
      self.ADOTable1.FieldByName('intime').AsDateTime:=self.DateTimePicker2.Date;       //入职日期
      self.ADOTable1.FieldByName('exigenceman').AsString:=self.Edit7.Text;              //紧急联系人
      self.ADOTable1.FieldByName('exigencephone').AsString:=self.Edit8.Text;            //紧急联系电话号码
      self.ADOTable1.FieldByName('Telephone').AsString:=self.Edit9.Text;//联系电话
      self.ADOTable1.FieldByName('Address').AsString:=self.Edit10.Text;//通讯地址
      self.ADOTable1.FieldByName('Email').AsString:=self.Edit11.Text;//电子邮件
      self.ADOTable1.FieldByName('branchid').AsInteger:=self.dxLookupTreeView1.ListSource.DataSet.fieldbyname('id').AsInteger;//所在部门
      self.ADOTable1.FieldByName('imemo').AsVariant:=self.Memo1.Lines.Text;//备注
      self.ADOTable1.FieldByName('classcodeID').AsInteger:=self.cxLookupComboBox1.EditValue;//职工类别
      self.ADOTable1.FieldByName('delrecy').AsString:='0';  //删除标记
      self.ADOTable1.FieldByName('staffid').AsString:=self.Edit12.Text;
      self.ADOTable1.Post;
      tmpid:=self.ADOTable1.fieldbyname('id').AsString;
          self.ADOTable1.Close;
          self.ADOTable1.TableName:='r_staffbranchedit';
          self.ADOTable1.IndexName:='id';
          self.ADOTable1.Open;
          self.ADOTable1.Append;
          self.ADOTable1.FieldByName('staffid').AsString:=tmpid;
          self.ADOTable1.FieldByName('indate').AsDateTime:=self.DateTimePicker3.Date;
          self.ADOTable1.FieldByName('branchid').AsInteger:=self.dxLookupTreeView1.ListSource.DataSet.fieldbyname('id').AsInteger;
          self.ADOTable1.Post;
    end;
  if self.etype>=2 then  //..编辑
    begin
      tmpid:= main.staffinfo.fieldbyname('r_staffinfo.id').AsString;
      if self.etype=3 then tmpid:= main.Noset.fieldbyname('id').AsString;
      self.ADOTable1.Close;
      self.ADOTable1.Filtered:=false;
      self.ADOTable1.Filter:=format('id'+'='+'''%s''',[tmpid]);
      self.ADOTable1.Filtered:=true;
      self.ADOTable1.Open;
      self.ADOTable1.Edit; 
      self.ADOTable1.FieldByName('name').AsString:=self.Edit1.Text;                     //姓名
      self.ADOTable1.FieldByName('sex').AsString:=self.ComboBox1.Text;                  //性别
      self.ADOTable1.FieldByName('ename').AsString:=self.Edit2.Text;                    //英文名
      self.ADOTable1.FieldByName('idnum').AsString:=self.Edit3.Text;                    //身份证号码
      self.ADOTable1.FieldByName('ifmarriage').AsString:=self.ComboBox2.Text;           //婚否
      self.ADOTable1.FieldByName('birthday').AsDateTime:=self.DateTimePicker1.Date;     //生日
      self.ADOTable1.FieldByName('Nationality').AsString:=self.ComboBox3.Text;          //民族
      self.ADOTable1.FieldByName('Nativeplace').AsString:=self.Edit4.Text;              //籍贯
      self.ADOTable1.FieldByName('Residence').AsString:=self.Edit5.Text;                //户口所在地
      self.ADOTable1.FieldByName('knowledge').AsString:=self.ComboBox4.Text;            //学历
      self.ADOTable1.FieldByName('School').AsString:=self.Edit6.Text;                   //毕业院校
      self.ADOTable1.FieldByName('forlang').AsString:=self.ComboBox5.Text;              //外语语种
      self.ADOTable1.FieldByName('howforlang').AsString:=self.ComboBox6.Text;           //熟练程度
      self.ADOTable1.FieldByName('intime').AsDateTime:=self.DateTimePicker2.Date;       //入职日期
      self.ADOTable1.FieldByName('exigenceman').AsString:=self.Edit7.Text;              //紧急联系人
      self.ADOTable1.FieldByName('exigencephone').AsString:=self.Edit8.Text;            //紧急联系电话号码
      self.ADOTable1.FieldByName('Telephone').AsString:=self.Edit9.Text;//联系电话
      self.ADOTable1.FieldByName('Address').AsString:=self.Edit10.Text;//通讯地址
      self.ADOTable1.FieldByName('Email').AsString:=self.Edit11.Text;//电子邮件
      self.ADOTable1.FieldByName('branchid').AsInteger:=self.dxLookupTreeView1.ListSource.DataSet.fieldbyname('id').AsInteger;//所在部门
      self.ADOTable1.FieldByName('imemo').AsVariant:=self.Memo1.Lines.Text;//备注
      self.ADOTable1.FieldByName('classcodeID').AsInteger:=self.cxLookupComboBox1.EditValue;//职工类别
      self.ADOTable1.FieldByName('staffid').AsString:=self.Edit12.Text;
      self.ADOTable1.Post;
      //----------以下为查看是否有部门变动------------//
      if (self.bmchange<>self.dxLookupTreeView1.ListSource.DataSet.fieldbyname('id').AsInteger) or (self.bmname<>self.dxLookupTreeView1.Text) then
        begin
          self.ADOTable1.Close;
          self.ADOTable1.TableName:='r_staffbranchedit';
          self.ADOTable1.IndexName:='id';
          self.ADOTable1.Open;
          self.ADOTable1.Append;
          self.ADOTable1.FieldByName('staffid').AsString:=tmpid;
          self.ADOTable1.FieldByName('indate').AsDateTime:=self.DateTimePicker3.Date;
          self.ADOTable1.FieldByName('branchid').AsInteger:=self.dxLookupTreeView1.ListSource.DataSet.fieldbyname('id').AsInteger;
          self.ADOTable1.Post;
        end;
    end;
  self.Close;
end;

procedure Tfaddman.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', DecimalSeparator,#8]) then
  begin
    key:=#0;     // 强制输入的字符类型
    beep;
  end;
end;

end.
