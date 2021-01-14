unit Unchengji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, Grids, DBGrids, ComCtrls;

type
  Tchengjifrm = class(TForm)
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    RGselect: TRadioGroup;
    RGid: TRadioGroup;
    Edit2: TEdit;
    Edit3: TEdit;
    GBdate: TGroupBox;
    Label3: TLabel;
    DatePick: TDateTimePicker;
    RGpass: TRadioGroup;
    Button2: TButton;
    Button3: TButton;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RGselectClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chengjifrm: Tchengjifrm;

implementation

uses Undm, Unchengjiprint;

{$R *.dfm}

procedure Tchengjifrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tchengjifrm.Button1Click(Sender: TObject);
var item:string;
begin
ITEM:=combobox1.ITEMS.strings[combobox1.ITEMINDEX];
if not (edit1.Text='') then
 begin
  if item='准考证号' then
   begin
    datamodule1.cdsstudent.filtered:=false;
    datamodule1.cDSStudent.filter:=format('准考证号=%s',[edit1.text]);
    datamodule1.cdsstudent.filtered:=true;
    if datamodule1.CDSStudent.IsEmpty then
     showmessage('数据库中没有符合条件的数据！');
  end;
 if item='姓名' then
  begin
   datamodule1.cdsstudent.filtered:=false;
   datamodule1.cDSStudent.filter:=format('姓名=%s',[edit1.text]);
   datamodule1.cdsstudent.filtered:=true;
   if datamodule1.CDSStudent.IsEmpty then
     showmessage('数据库中没有符合条件的数据！');
  end;
 if item='身份证号' then
  begin
   datamodule1.cdsstudent.filtered:=false;
   datamodule1.cDSStudent.filter:=format('身份证号=%d',[strtoint(edit1.text)]);
   datamodule1.cdsstudent.filtered:=true;
   if datamodule1.CDSStudent.IsEmpty then
     showmessage('数据库中没有符合条件的数据！');
  end;
{if item='状态' then
  begin
   datamodule1.cDSStudent.filter:=format('状态=%s',[edit1.text]);
   datamodule1.cdsstudent.filtered:=true;
 if datamodule1.CDSStudent.IsEmpty then
     showmessage('数据库中没有符合条件的数据！');

  end; }
 end
else
 if item='' then
   datamodule1.cdsstudent.filtered:=false
 else
   showmessage('请输入查询值！');
end;

procedure Tchengjifrm.RGselectClick(Sender: TObject);
begin
 case rgselect.ItemIndex of
  0:begin
     rgid.Enabled:=true;
     gbdate.Enabled:=false;
     rgpass.Enabled:=false;
    end;
  1:begin
     rgid.Enabled:=false;
     gbdate.Enabled:=true;
     rgpass.Enabled:=false;
    end;
  else
    begin
     rgid.Enabled:=false;
     gbdate.Enabled:=false;
     rgpass.Enabled:=true;
    end;
 end;
end;

procedure Tchengjifrm.Button2Click(Sender: TObject);
begin
datamodule1.CDSStudent.Filtered:=false;
 if rgselect.Enabled=true then
  if rgselect.ItemIndex=1 then
   begin
    datamodule1.CDSStudent.Filter:=format('准考证号>=''%s'' AND 准考证号<=''%S''',[edit2.text,edit3.text]);
    datamodule1.cDSStudent.Filtered:=TRUE;
   end;
 if gbdate.Enabled=true then
  begin
   datamodule1.CDSStudent.Filter:=format('考试日期=''%s''',[datetostr(datepick.Date)]);
   datamodule1.cDSStudent.Filtered:=TRUE;
  end;
 if rgpass.Enabled=true then
  if rgpass.ItemIndex=0 then
   begin
    datamodule1.CDSStudent.Filter:='得分>=60';
    datamodule1.cDSStudent.Filtered:=TRUE;
   end
  else
   begin
    datamodule1.CDSStudent.Filter:='得分<=60';
    datamodule1.cDSStudent.Filtered:=TRUE;
   end;
reportfrm.QuickRep1.Preview;
end;

procedure Tchengjifrm.Button3Click(Sender: TObject);
begin
datamodule1.CDSStudent.Filtered:=false;
 if rgselect.Enabled=true then
  if rgselect.ItemIndex=1 then
   begin
    datamodule1.CDSStudent.Filter:=format('准考证号>=''%s'' AND 准考证号<=''%S''',[edit2.text,edit3.text]);
    datamodule1.cDSStudent.Filtered:=TRUE;
   end;
 if gbdate.Enabled=true then
  begin
   datamodule1.CDSStudent.Filter:=format('考试日期=''%s''',[datetostr(datepick.Date)]);
   datamodule1.cDSStudent.Filtered:=TRUE;
  end;
 if rgpass.Enabled=true then
  if rgpass.ItemIndex=0 then
   begin
    datamodule1.CDSStudent.Filter:='得分>=60';
    datamodule1.cDSStudent.Filtered:=TRUE;
   end
  else
   begin
    datamodule1.CDSStudent.Filter:='得分<=60';
    datamodule1.cDSStudent.Filtered:=TRUE;
   end;
reportfrm.QuickRep1.Print;
end;

procedure Tchengjifrm.FormShow(Sender: TObject);
begin
 datamodule1.CDSStudent.Filtered:=false;
end;

procedure Tchengjifrm.FormActivate(Sender: TObject);
begin
 datamodule1.CDSStudent.Filtered:=false;
end;

end.
