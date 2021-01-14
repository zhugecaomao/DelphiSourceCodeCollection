unit printUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, DBTables,
  QRExport, ComCtrls, BusinessSkinForm, Excel2000, OleServer;

type
  Tprintform = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    SaveDialog1: TSaveDialog;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ListBox2: TListBox;
    BitBtn7: TBitBtn;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Edit1: TEdit;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    StatusBar1: TStatusBar;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure result();
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure panduan1();
    procedure BitBtn7Click(Sender: TObject);
    function floatformat(var strnum:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  printform: Tprintform;
  counttag:integer;
  temps:string;

implementation
uses reportunit,dataunit,mainunit;

{$R *.dfm}

procedure Tprintform.BitBtn1Click(Sender: TObject);
begin
if (ListBox1.Count<>0)and(ListBox2.Count<8)  then
  begin
    panduan1;
    ListBox2.Items.Add(ListBox1.Items.Strings[integer(ListBox1.ItemIndex)]);
    ListBox1.ItemIndex:=ListBox1.ItemIndex+1;
  end;
result;
BitBtn5.Enabled:=true;
bitbtn6.Enabled:=true;
end;

procedure Tprintform.FormShow(Sender: TObject);
begin
mainform.dataref;
if ListBox1.Count<>0 then
  ListBox1.ItemIndex:=0;
  BitBtn3.Click;
  ComboBox1.Text:='';
  ComboBox2.Text:='';
  counttag:=0;
end;

procedure Tprintform.BitBtn2Click(Sender: TObject);
begin
ListBox2.Clear;
if (ListBox1.Count<>0)and(ListBox2.Count<8) then
  begin
    ListBox1.ItemIndex:=0;
    while listBox1.Count-1<>ListBox1.ItemIndex do
      begin
        ListBox2.Items.Add(ListBox1.Items.Strings[integer(ListBox1.ItemIndex)]);
        ListBox1.ItemIndex:=ListBox1.ItemIndex+1;
      end;
      ListBox2.Items.Add(ListBox1.Items.Strings[integer(ListBox1.ItemIndex)]);
  end;
result;
BitBtn5.Enabled:=true;
bitbtn6.Enabled:=true;
end;

procedure Tprintform.BitBtn3Click(Sender: TObject);
begin
if ListBox2.Count<>0 then
  ListBox2.Clear;
  Query1.Close;
  Query1.UnPrepare;
  Query1.SQL.Clear;
  Query1.Active:=false;
  BitBtn5.Enabled:=false;
  BitBtn6.Enabled:=false;
  counttag:=0;
end;

procedure Tprintform.BitBtn4Click(Sender: TObject);
var
  itemindex:integer;
begin
if ListBox2.Count<>0 then
  begin
    if (ListBox2.ItemIndex<0)or(ListBox2.Count-1<ListBox2.ItemIndex) then
      abort;
    if (ListBox2.Items.Strings[integer(ListBox2.ItemIndex)]='总成绩') or(ListBox2.Items.Strings[integer(ListBox2.ItemIndex)]='等级评定')then
      counttag:=0;
    itemindex:=ListBox2.ItemIndex;
    ListBox2.DeleteSelected;
    ListBox2.ItemIndex:=itemindex;
    result;
    BitBtn5.Enabled:=true;
    bitbtn6.Enabled:=true;
  end
else
  begin
    Query1.Close;
    Query1.UnPrepare;
    Query1.SQL.Clear;
    Query1.Active:=false;
    counttag:=0;
  end;

end;

procedure tprintform.panduan1;
var
  tag:integer;
begin
  tag:=0;
  if ListBox2.Count<>0 then
    begin
      while tag<>ListBox2.Count do
        begin
          if ListBox1.Items.Strings[integer(ListBox1.ItemIndex)]=ListBox2.Items.Strings[tag] then
            Abort;
          tag:=tag+1;
        end;
    end;
end;


procedure tprintform.result;            //查询执行过程
var
  count:integer;
  tag:Boolean;
begin
  count:=0;
  tag:=false;
  counttag:=0;
if ListBox2.Count<>0 then
  begin
  Query1.Close;;
  Query1.UnPrepare;
  Query1.SQL.Clear;
  Query1.SQL.Add('select'+'');
   while ListBox2.Count-1<>count-1 do
     begin
       if ListBox2.Items.Strings[count]='总成绩' then
          counttag:=1
       else if ListBox2.Items.Strings[count]='等级评定'then
         counttag:=2;
       if (ListBox2.Items.Strings[count]='总成绩')or(ListBox2.Items.Strings[count]='等级评定') then
         begin
          if tag=true then
             Query1.SQL.Add(',');
          Query1.SQL.Add('stugread.'+ListBox2.Items.Strings[count]);
          tag:=true;
         end
       else
         begin
          if tag=true then
             Query1.SQL.Add(',');
         Query1.SQL.Add(ListBox2.Items.Strings[count]);
         tag:=true;
         end;
       count:=count+1;
     end;
       Query1.SQL.Add('from xueshengxinxi join stugread on xueshengxinxi.学生编号=stugread.学生编号 where xueshengxinxi.所属班级名称='+QuotedStr(ComboBox2.Text));
       Query1.Prepare;
       Query1.ExecSQL;
       Query1.Active:=true;
    end;
end;



procedure Tprintform.BitBtn5Click(Sender: TObject);
var
  count:integer;           //统计不及格人数
  count1:integer;          //统计及格人数
  count2:integer;          //统计良好人数
  count3:integer;           //统计优秀人数
  you:string;
  liang:string;
  jige:string;
  bujige:string;
  heji:string;
begin
count:=0;
count1:=0;
count2:=0;
count3:=0;
reportform.QRLabel1.Caption:=printform.Edit1.Text;
reportform.QRLabel10.Caption:='总人数:'+inttostr(DBGrid1.DataSource.DataSet.RecordCount);
if (DBGrid1.DataSource.DataSet.RecordCount<>0)and(counttag=1) then
  begin
    DBGrid1.DataSource.DataSet.First;
    while DBGrid1.DataSource.DataSet.Eof<>true do
      begin
        if DBGrid1.DataSource.DataSet.FieldValues['总成绩']<60 then
          count:=count+1
        else if (DBGrid1.DataSource.DataSet.FieldValues['总成绩']>59)and(DBGrid1.DataSource.DataSet.FieldValues['总成绩']<76) then
          count1:=count1+1
        else if ((DBGrid1.DataSource.DataSet.FieldValues['总成绩']>75))and((DBGrid1.DataSource.DataSet.FieldValues['总成绩']<86)) then
          count2:=count2+1
        else if (DBGrid1.DataSource.DataSet.FieldValues['总成绩']>85) then
          count3:=count3+1;
         DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
with reportform do
begin
  QRLabel11.Caption:='不及格(人):'+IntToStr(count);
  QRLabel12.Caption:='及格(人):'+IntToStr(count1);
  QRLabel13.Caption:='良(人):'+IntToStr(count2);
  QRLabel14.Caption:='优(人):'+IntToStr(count3);
  QRLabel20.Caption:='总及格数(人):'+IntToStr(count1+count2+count3);
if strtofloat(copy(QRLabel10.Caption,pos(':',QRLabel10.Caption)+1,length(QRLabel10.Caption)-pos(':',QRLabel10.Caption)))<>0 then
  begin
  heji:=copy(QRLabel10.Caption,pos(':',QRLabel10.Caption)+1,length(QRLabel10.Caption)-pos(':',QRLabel10.Caption));
  you:=copy(QRLabel14.Caption,pos(':',QRLabel14.Caption)+1,length(QRLabel14.Caption)-pos(':',QRLabel14.Caption));
  liang:=copy(QRLabel13.Caption,pos(':',QRLabel13.Caption)+1,length(QRLabel13.Caption)-pos(':',QRLabel13.Caption));
  jige:=copy(QRLabel12.Caption,pos(':',QRLabel12.Caption)+1,length(QRLabel12.Caption)-pos(':',QRLabel12.Caption));
  bujige:=copy(QRLabel11.Caption,pos(':',QRLabel11.Caption)+1,length(QRLabel11.Caption)-pos(':',QRLabel11.Caption));
  QRLabel16.Caption:='比率:'+FloatToStr(StrToFloat(bujige) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel16.Caption;
  QRLabel16.Caption:=floatformat(temps);
  QRLabel17.Caption:='比率:'+FloatToStr(StrToFloat(jige) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel17.Caption;
  QRLabel17.Caption:=floatformat(temps);
  QRLabel18.Caption:='比率:'+FloatToStr(StrToFloat(liang) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel18.Caption;
  QRLabel18.Caption:=floatformat(temps);
  QRLabel19.Caption:='比率:'+FloatToStr(StrToFloat(you) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel19.Caption;
  QRLabel19.Caption:=floatformat(temps);
  QRLabel15.Caption:='及格率:'+FloatToStr((StrToFloat(heji)-strtofloat(bujige)) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel15.Caption;
  QRLabel15.Caption:=floatformat(temps);
  end;
end;
  end
else if (DBGrid1.DataSource.DataSet.RecordCount<>0)and(counttag=2) then
  begin
    DBGrid1.DataSource.DataSet.First;
    while DBGrid1.DataSource.DataSet.Eof<>true do
      begin
        if DBGrid1.DataSource.DataSet.FieldValues['等级评定']='不及格' then
          count:=count+1
        else if  DBGrid1.DataSource.DataSet.FieldValues['等级评定']='及格' then
          count1:=count1+1
        else if DBGrid1.DataSource.DataSet.FieldValues['等级评定']='良' then
          count2:=count2+1
        else if DBGrid1.DataSource.DataSet.FieldValues['等级评定']='优' then
          count3:=count3+1;
         DBGrid1.DataSource.DataSet.Next;
      end;
    DBGrid1.DataSource.DataSet.First;
with reportform do
begin
  QRLabel11.Caption:='不及格(人):'+IntToStr(count);
  QRLabel12.Caption:='及格(人):'+IntToStr(count1);
  QRLabel13.Caption:='良(人):'+IntToStr(count2);
  QRLabel14.Caption:='优(人):'+IntToStr(count3);
  QRLabel20.Caption:='总及格数(人):'+IntToStr(count1+count2+count3);
if strtofloat(copy(QRLabel10.Caption,pos(':',QRLabel10.Caption)+1,length(QRLabel10.Caption)-pos(':',QRLabel10.Caption)))<>0 then
  begin
  heji:=copy(QRLabel10.Caption,pos(':',QRLabel10.Caption)+1,length(QRLabel10.Caption)-pos(':',QRLabel10.Caption));
  you:=copy(QRLabel14.Caption,pos(':',QRLabel14.Caption)+1,length(QRLabel14.Caption)-pos(':',QRLabel14.Caption));
  liang:=copy(QRLabel13.Caption,pos(':',QRLabel13.Caption)+1,length(QRLabel13.Caption)-pos(':',QRLabel13.Caption));
  jige:=copy(QRLabel12.Caption,pos(':',QRLabel12.Caption)+1,length(QRLabel12.Caption)-pos(':',QRLabel12.Caption));
  bujige:=copy(QRLabel11.Caption,pos(':',QRLabel11.Caption)+1,length(QRLabel11.Caption)-pos(':',QRLabel11.Caption));
  QRLabel16.Caption:='比率:'+FloatToStr(StrToFloat(bujige) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel16.Caption;
  QRLabel16.Caption:=floatformat(temps);
  QRLabel17.Caption:='比率:'+FloatToStr(StrToFloat(jige) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel17.Caption;
  QRLabel17.Caption:=floatformat(temps);
  QRLabel18.Caption:='比率:'+FloatToStr(StrToFloat(liang) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel18.Caption;
  QRLabel18.Caption:=floatformat(temps);
  QRLabel19.Caption:='比率:'+FloatToStr(StrToFloat(you) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel19.Caption;
  QRLabel19.Caption:=floatformat(temps);
  QRLabel15.Caption:='及格率:'+FloatToStr((StrToFloat(heji)-strtofloat(bujige)) / StrToFloat(heji)*100)+'%';
  temps:=QRLabel15.Caption;
  QRLabel15.Caption:=floatformat(temps);
  end;
end;
  end
else
  begin
with reportform do
begin
  QRLabel11.Caption:='';
  QRLabel12.Caption:='';
  QRLabel13.Caption:='';
  QRLabel14.Caption:='';
  QRLabel15.Caption:='';
  QRLabel20.Caption:='';
  QRLabel16.Caption:='';
  QRLabel17.Caption:='';
  QRLabel18.Caption:='';
  QRLabel19.Caption:='';
  QRLabel20.Caption:='';
end;

  end;

with ListBox2.Items do
begin

case ListBox2.Count of
  1: begin
       reportform.QRDBText1.Enabled:=true;
       reportform.QRDBText1.DataField:=strings[0];
       reportform.QRDBText2.Enabled:=false;
       reportform.QRDBText3.Enabled:=false;
       reportform.QRDBText4.Enabled:=false;
       reportform.QRDBText5.Enabled:=false;
       reportform.QRDBText6.Enabled:=false;
       reportform.QRDBText7.Enabled:=false;
       reportform.QRLabel2.Caption:=Strings[0];
       reportform.QRLabel3.Caption:='';
       reportform.QRLabel4.Caption:='';
       reportform.QRLabel5.Caption:='';
       reportform.QRLabel6.Caption:='';
       reportform.QRLabel7.Caption:='';
       reportform.QRLabel8.Caption:='';
       reportform.QRShape5.Enabled:=false;
       reportform.QRShape6.Enabled:=false;
       reportform.QRShape7.Enabled:=false;
       reportform.QRShape8.Enabled:=false;
       reportform.QRShape9.Enabled:=false;
       reportform.QRShape4.Enabled:=false;
     end;
  2: begin
       reportform.QRShape4.Enabled:=true;
       reportform.QRDBText1.Enabled:=true;
       reportform.QRDBText2.Enabled:=true;
       reportform.QRDBText1.DataField:=Strings[0];
       reportform.QRDBText2.DataField:=Strings[1];
       reportform.QRDBText3.Enabled:=false;
       reportform.QRDBText4.Enabled:=false;
       reportform.QRDBText5.Enabled:=false;
       reportform.QRDBText6.Enabled:=false;;
       reportform.QRDBText7.Enabled:=false;
       reportform.QRLabel2.Caption:=Strings[0];
       reportform.QRLabel3.Caption:=Strings[1];
       reportform.QRLabel4.Caption:='';
       reportform.QRLabel5.Caption:='';
       reportform.QRLabel6.Caption:='';
       reportform.QRLabel7.Caption:='';
       reportform.QRLabel8.Caption:='';
       reportform.QRShape6.Enabled:=false;
       reportform.QRShape7.Enabled:=false;
       reportform.QRShape8.Enabled:=false;
       reportform.QRShape9.Enabled:=false;
       reportform.QRShape5.Enabled:=false;
     end;
  3: begin
       reportform.QRShape5.Enabled:=true;
       reportform.QRShape4.Enabled:=true;
       reportform.QRDBText1.Enabled:=true;
       reportform.QRDBText2.Enabled:=true;
       reportform.QRDBText3.Enabled:=true;
       reportform.QRDBText1.DataField:=Strings[0];
       reportform.QRDBText2.DataField:=Strings[1];
       reportform.QRDBText3.DataField:=Strings[2];
       reportform.QRDBText4.Enabled:=false;
       reportform.QRDBText5.Enabled:=false;
       reportform.QRDBText6.Enabled:=false;
       reportform.QRDBText7.Enabled:=false;
       reportform.QRLabel2.Caption:=Strings[0];
       reportform.QRLabel3.Caption:=Strings[1];
       reportform.QRLabel4.Caption:=Strings[2];
       reportform.QRLabel5.Caption:='';
       reportform.QRLabel6.Caption:='';
       reportform.QRLabel7.Caption:='';
       reportform.QRLabel8.Caption:='';
       reportform.QRShape7.Enabled:=false;
       reportform.QRShape8.Enabled:=false;
       reportform.QRShape9.Enabled:=false;
       reportform.QRShape6.Enabled:=false;
     end;
  4: begin
       reportform.QRShape5.Enabled:=true;
       reportform.QRShape6.Enabled:=true;
       reportform.QRShape4.Enabled:=true;
       reportform.QRDBText1.Enabled:=true;
       reportform.QRDBText2.Enabled:=true;
       reportform.QRDBText3.Enabled:=true;
       reportform.QRDBText4.Enabled:=true;
       reportform.QRDBText1.DataField:=Strings[0];
       reportform.QRDBText2.DataField:=Strings[1];
       reportform.QRDBText3.DataField:=Strings[2];
       reportform.QRDBText4.DataField:=Strings[3];
       reportform.QRDBText5.Enabled:=false;
       reportform.QRDBText6.Enabled:=false;
       reportform.QRDBText7.Enabled:=false;
       reportform.QRLabel2.Caption:=Strings[0];
       reportform.QRLabel3.Caption:=Strings[1];
       reportform.QRLabel4.Caption:=Strings[2];
       reportform.QRLabel5.Caption:=Strings[3];
       reportform.QRLabel6.Caption:='';
       reportform.QRLabel7.Caption:='';
       reportform.QRLabel8.Caption:='';
       reportform.QRShape8.Enabled:=false;
       reportform.QRShape9.Enabled:=false;
       reportform.QRShape7.Enabled:=false;
     end;
  5: begin
       reportform.QRShape5.Enabled:=true;
       reportform.QRShape6.Enabled:=true;
       reportform.QRShape7.Enabled:=true;
       reportform.QRShape4.Enabled:=true;
       reportform.QRDBText1.Enabled:=true;
       reportform.QRDBText2.Enabled:=true;
       reportform.QRDBText3.Enabled:=true;
       reportform.QRDBText4.Enabled:=true;
       reportform.QRDBText5.Enabled:=true;
       reportform.QRDBText1.DataField:=Strings[0];
       reportform.QRDBText2.DataField:=Strings[1];
       reportform.QRDBText3.DataField:=Strings[2];
       reportform.QRDBText4.DataField:=Strings[3];
       reportform.QRDBText5.DataField:=Strings[4];
       reportform.QRDBText6.Enabled:=false;
       reportform.QRDBText7.Enabled:=false;
       reportform.QRLabel2.Caption:=Strings[0];
       reportform.QRLabel3.Caption:=Strings[1];
       reportform.QRLabel4.Caption:=Strings[2];
       reportform.QRLabel5.Caption:=Strings[3];
       reportform.QRLabel6.Caption:=Strings[4];
       reportform.QRLabel7.Caption:='';
       reportform.QRLabel8.Caption:='';
       reportform.QRShape9.Enabled:=false;
       reportform.QRShape8.Enabled:=false;
     end;
  6: begin
       reportform.QRShape5.Enabled:=true;
       reportform.QRShape6.Enabled:=true;
       reportform.QRShape7.Enabled:=true;
       reportform.QRShape8.Enabled:=true;
       reportform.QRShape4.Enabled:=true;
       reportform.QRDBText1.Enabled:=true;
       reportform.QRDBText2.Enabled:=true;
       reportform.QRDBText3.Enabled:=true;
       reportform.QRDBText4.Enabled:=true;
       reportform.QRDBText5.Enabled:=true;
       reportform.QRDBText6.Enabled:=true;
       reportform.QRDBText1.DataField:=Strings[0];
       reportform.QRDBText2.DataField:=Strings[1];
       reportform.QRDBText3.DataField:=Strings[2];
       reportform.QRDBText4.DataField:=Strings[3];
       reportform.QRDBText5.DataField:=Strings[4];
       reportform.QRDBText6.DataField:=Strings[5];
       reportform.QRDBText7.Enabled:=false;      
       reportform.QRLabel2.Caption:=Strings[0];
       reportform.QRLabel3.Caption:=Strings[1];
       reportform.QRLabel4.Caption:=Strings[2];
       reportform.QRLabel5.Caption:=Strings[3];
       reportform.QRLabel6.Caption:=Strings[4];
       reportform.QRLabel7.Caption:=Strings[5];
       reportform.QRLabel8.Caption:='';
       reportform.QRShape9.Enabled:=false;
     end;
  7: begin
       reportform.QRShape5.Enabled:=true;
       reportform.QRShape6.Enabled:=true;
       reportform.QRShape7.Enabled:=true;
       reportform.QRShape8.Enabled:=true;
       reportform.QRShape9.Enabled:=true;
       reportform.QRShape4.Enabled:=true;
       reportform.QRDBText1.Enabled:=true;
       reportform.QRDBText2.Enabled:=true;
       reportform.QRDBText3.Enabled:=true;
       reportform.QRDBText4.Enabled:=true;
       reportform.QRDBText5.Enabled:=true;
       reportform.QRDBText6.Enabled:=true;
       reportform.QRDBText7.Enabled:=true;
       reportform.QRDBText1.DataField:=Strings[0];
       reportform.QRDBText2.DataField:=Strings[1];
       reportform.QRDBText3.DataField:=Strings[2];
       reportform.QRDBText4.DataField:=Strings[3];
       reportform.QRDBText5.DataField:=Strings[4];
       reportform.QRDBText6.DataField:=Strings[5];
       reportform.QRDBText7.DataField:=Strings[6];
       reportform.QRLabel2.Caption:=Strings[0];
       reportform.QRLabel3.Caption:=Strings[1];
       reportform.QRLabel4.Caption:=Strings[2];
       reportform.QRLabel5.Caption:=Strings[3];
       reportform.QRLabel6.Caption:=Strings[4];
       reportform.QRLabel7.Caption:=Strings[5];
       reportform.QRLabel8.Caption:=Strings[6];
     end;
end;
end;
reportform.QuickRep1.Preview;
end;

procedure Tprintform.FormCreate(Sender: TObject);
begin
mainform.dataref;
printform.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-printform.Width div 2;
printform.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-printform.Height div 2;
end;

procedure Tprintform.ComboBox1Enter(Sender: TObject);
begin
ComboBox1.Items.Clear;
DataModule1.xibie.Refresh;
if DataModule1.xibie.RecordCount<>0 then
  begin
    DataModule1.xibie.First;
    while DataModule1.xibie.Eof<>true do
      begin
        ComboBox1.Items.Add(DataModule1.xibie.FieldValues['院系名称']);
        DataModule1.xibie.Next;
      end;
    DataModule1.xibie.First;
  end;
end;

procedure Tprintform.ComboBox2Enter(Sender: TObject);
begin
ComboBox2.Items.Clear;
DataModule1.banjixinxi.Filtered:=false;
if ComboBox1.Text<>'' then
  begin
    if DataModule1.banjixinxi.RecordCount<>0 then
      begin
        DataModule1.banjixinxi.First;
        while DataModule1.banjixinxi.Eof<>true do
          begin
            if DataModule1.banjixinxi.FieldValues['所属院系名称']=ComboBox1.Text then
              ComboBox2.Items.Add(DataModule1.banjixinxi.FieldValues['班级名称']);
            DataModule1.banjixinxi.Next;
          end;
        DataModule1.banjixinxi.First;
      end;
  end
else
  begin
    if DataModule1.banjixinxi.RecordCount<>0 then
      begin
        DataModule1.banjixinxi.First;
        while DataModule1.banjixinxi.Eof<>true do
          begin
            ComboBox2.Items.Add(DataModule1.banjixinxi.FieldValues['班级名称']);
            DataModule1.banjixinxi.Next;
          end;
        DataModule1.banjixinxi.First;
      end;
  end;
end;

procedure Tprintform.ComboBox2Change(Sender: TObject);
begin
BitBtn3.Click;
end;



procedure Tprintform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
mainform.closetable;
Query1.Close;
Query1.UnPrepare;
mainform.Show;
end;

procedure Tprintform.BitBtn6Click(Sender: TObject);
var
  filename:string;
  row:integer;
  col:integer;
begin
if edit1.Text<>'' then
SaveDialog1.FileName:=edit1.Text+'.xls';
if DBGrid1.DataSource.DataSet.RecordCount<>0 then
begin
if SaveDialog1.Execute then
  begin
    try
      filename:=SaveDialog1.FileName;
        if FileExists(filename) then
          begin
            MessageDlg('文件已存在，请以不同文件名重新导出！',mtWarning,[mbok],0);
            abort;
          end;
      ExcelApplication1.Connect;
      ExcelApplication1.Workbooks.Add(EmptyParam,0);
      ExcelWorkbook1.ConnectTo(ExcelApplication1.Workbooks[1]);
      ExcelWorksheet1.ConnectTo(ExcelWorkbook1.Worksheets[1] as _worksheet);
      //生成导出表格的标题栏//
      col:=0;
      while ListBox2.Count-1<>col-1 do
        begin
          ExcelWorksheet1.Cells.Item[1,col+1]:=ListBox2.Items.Strings[col];
          col:=col+1;
        end;
      with DBGrid1.DataSource.DataSet do
        begin
          First;
          row:=2;
          ProgressBar1.Min:=0;
          ProgressBar1.Position:=0;
          ProgressBar1.Max:=RecordCount;
          col:=0;
          while Eof<>true do
            begin
              while ListBox2.Count-1<>col-1 do
                begin
                  ExcelWorksheet1.Cells.Item[Row,col+1]:=''''+DBGrid1.Fields[col].AsString;
                  col:=col+1;
                end;
              col:=0;
              row:=row+1;
              ProgressBar1.Position:=ProgressBar1.Position+1;
              Next;
            end;
          ExcelWorksheet1.Columns.AutoFit;
        end;
        ExcelWorksheet1.SaveAs(filename);
        MessageDlg('数据导出完毕！',mtInformation,[mbok],0);
        DBGrid1.DataSource.DataSet.First;
        ProgressBar1.Position:=0;
        try
          ExcelApplication1.Quit;
          ExcelWorksheet1.Disconnect;
          ExcelWorkbook1.Disconnect;
          ExcelApplication1.Disconnect;
         Except on E: Exception do
         ShowMessage(E.Message);
         End;
         except on E: Exception do
         begin
           ShowMessage(E.Message);
           ProgressBar1.Position:=0;
         end;
       end;
  end;
end
else
  Application.MessageBox('没有所需数据导出！','提示');
end;

procedure Tprintform.ComboBox1Change(Sender: TObject);
begin
ComboBox2.Text:='';
BitBtn3.Click;
end;

procedure Tprintform.ListBox1DblClick(Sender: TObject);
begin
BitBtn1.Click;
end;

procedure Tprintform.ListBox2DblClick(Sender: TObject);
begin
BitBtn4.Click;
end;

procedure Tprintform.BitBtn7Click(Sender: TObject);
begin
Close;
end;


function tprintform.floatformat(var strnum:string):string;
begin
 if pos('.',strnum)<>0 then
   begin
     delete(strnum,pos('.',strnum)+3,length(strnum)-pos('.',strnum)+3);
     floatformat:=strnum+'%';
   end
 else
   floatformat:=strnum;
end;


end.
