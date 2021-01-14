unit SecSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Grids, DBGrids, ExtCtrls, StdCtrls,
  Buttons, DB, ADODB, DBCtrls, Mask;

type
  TSecSetting = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetToolBar(isEnable:bool);
  end;

var
  SecSetting: TSecSetting;

implementation

{$R *.dfm}
//---------------设置关闭窗体的模式-----------------
procedure TSecSetting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;


procedure TSecSetting.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  //显示数据数量
  label2.Caption:=inttostr(adoquery1.RecordCount);
  //设置数据表宽度
  dbgrid1.Columns[0].Width:=60;
  dbgrid1.Columns[1].Width:=90;
end;

//-----------专门写一个函数来实现工具栏按钮的设置，让代码更简练----------------
procedure TSecSetting.SetToolBar(isEnable: bool);
begin
 if isEnable=true then
  begin
   //将首记录等记录移动按钮设置为不可用
   toolbutton1.Enabled:=false;
   toolbutton2.Enabled:=false;
   toolbutton3.Enabled:=false;
   toolbutton4.Enabled:=false;
   //将新增修改等按钮设置为不可用
   toolbutton6.Enabled:=false;
   toolbutton7.Enabled:=false;
   toolbutton8.Enabled:=false;
   //将保存和取消按钮设置为可用
   toolbutton10.Enabled:=true;
   toolbutton11.Enabled:=true;
   //将窗体内的数据显示控件设为可读
   dbedit1.ReadOnly:=false;
   dbedit2.ReadOnly:=false;
   dbedit3.ReadOnly:=false;
   dbradiogroup1.ReadOnly:=false;
   dbradiogroup2.ReadOnly:=false;
 end;

 if isEnable=false then
  begin
   //将首记录等记录移动按钮设置为可用
   toolbutton1.Enabled:=true;
   toolbutton2.Enabled:=true;
   toolbutton3.Enabled:=true;
   toolbutton4.Enabled:=true;
   //将新增修改等按钮设置为可用
   toolbutton6.Enabled:=true;
   toolbutton7.Enabled:=true;
   toolbutton8.Enabled:=true;
   //将保存和取消按钮设置为不可用
   toolbutton10.Enabled:=false;
   toolbutton11.Enabled:=false;
   //将窗体内的数据显示控件设为只读
   dbedit1.ReadOnly:=true;
   dbedit2.ReadOnly:=true;
   dbedit3.ReadOnly:=true;
   dbradiogroup1.ReadOnly:=true;
   dbradiogroup2.ReadOnly:=true;
  end;


end;

//---------------新增记录----------------
procedure TSecSetting.ToolButton6Click(Sender: TObject);
begin
SetToolBar(true);
datasource1.DataSet.Insert;
end;

//---------------修改记录----------------
procedure TSecSetting.ToolButton7Click(Sender: TObject);
begin
SetToolBar(true);
datasource1.DataSet.Edit;
end;

//---------------删除记录----------------
procedure TSecSetting.ToolButton8Click(Sender: TObject);
begin
 if application.MessageBox('删除该条记录？','财务管理系统',MB_OKCANCEL)=IDOK then
  datasource1.DataSet.Delete;
end;

//---------------首记录----------------
procedure TSecSetting.ToolButton1Click(Sender: TObject);
begin
 datasource1.DataSet.First;
end;

//---------------上记录----------------
procedure TSecSetting.ToolButton2Click(Sender: TObject);
begin
 datasource1.DataSet.Prior;
end;

//---------------下记录----------------
procedure TSecSetting.ToolButton3Click(Sender: TObject);
begin
 datasource1.DataSet.Next;
end;

//---------------尾记录----------------
procedure TSecSetting.ToolButton4Click(Sender: TObject);
begin
 datasource1.DataSet.Last;
end;

//---------------关闭窗体----------------
procedure TSecSetting.ToolButton13Click(Sender: TObject);
begin
close;
end;

//---------------保存记录----------------
procedure TSecSetting.ToolButton10Click(Sender: TObject);
begin
  //检查科目代码是否已输入
  if dbedit2.Text='' then
   begin
   showmessage('科目代码不允许为空值');
   exit;
   end;
  datasource1.DataSet.Post;
  SetToolBar(false);
end;

//---------------取消操作----------------
procedure TSecSetting.ToolButton11Click(Sender: TObject);
begin
  datasource1.DataSet.Cancel;
  SetToolBar(false);
end;

//----------查询数据并显示-------------
procedure TSecSetting.BitBtn1Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from 科目表 where (科目代码 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(科目名称 like ''%'+edit2.Text+'%'')and(科目类别 like ''%'+edit3.Text+'%'')');
adoquery1.Open;
end;

end.




