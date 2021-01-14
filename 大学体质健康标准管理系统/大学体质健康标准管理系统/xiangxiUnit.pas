unit xiangxiUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables,
  BusinessSkinForm, ComCtrls, Excel2000, OleServer;

type
  Txiangxiform = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    StatusBar1: TStatusBar;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure panduan(); //判断listbox8中是否存在相同的项
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure runsqlz();    //执行sql语句查询
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    function  labe(str:string;strlen:integer):string;    //转换成竖排标签
    procedure BitBtn2Click(Sender: TObject);
    function  floatformat(var strnum:string):string; //取两为小数
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  xiangxiform: Txiangxiform;
  greadtag:Boolean;

implementation
uses mainunit,dataunit,xxreportunit;

{$R *.dfm}

procedure Txiangxiform.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure Txiangxiform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
mainform.closetable;
Query1.Close;
Query1.UnPrepare;
mainform.Show;
end;

procedure Txiangxiform.SpeedButton1Click(Sender: TObject);
begin
if ListBox2.Count<19 then
  begin
    panduan;
    ListBox2.Items.Add(ListBox1.Items.Strings[integer(ListBox1.ItemIndex)]);
    ListBox1.ItemIndex:=ListBox1.ItemIndex+1;
  end;
runsqlz;
BitBtn1.Enabled:=true;
BitBtn2.Enabled:=true;
end;

procedure Txiangxiform.FormShow(Sender: TObject);
begin
mainform.dataref;
ListBox1.SetFocus;
ListBox1.ItemIndex:=0;
greadtag:=false;
BitBtn1.Enabled:=false;
bitbtn2.Enabled:=false;
end;

procedure txiangxiform.panduan;
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


procedure Txiangxiform.FormCreate(Sender: TObject);
begin
mainform.dataref;
xiangxiform.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-xiangxiform.Width div 2;
xiangxiform.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-xiangxiform.Height div 2;
end;

procedure Txiangxiform.SpeedButton2Click(Sender: TObject);
begin
ListBox2.Clear;
if (ListBox1.Count<>0)and(ListBox2.Count<26) then
  begin
    ListBox1.ItemIndex:=0;
    while listBox1.Count-1<>ListBox1.ItemIndex do
      begin
        ListBox2.Items.Add(ListBox1.Items.Strings[integer(ListBox1.ItemIndex)]);
        ListBox1.ItemIndex:=ListBox1.ItemIndex+1;
      end;
      ListBox2.Items.Add(ListBox1.Items.Strings[integer(ListBox1.ItemIndex)]);
  end;
runsqlz;
BitBtn1.Enabled:=true;
bitbtn2.Enabled:=true;
end;

procedure Txiangxiform.SpeedButton4Click(Sender: TObject);
begin
if ListBox2.Count<>0 then
  ListBox2.Clear;
  BitBtn1.Enabled:=false;
  BitBtn2.Enabled:=false;
  greadtag:=false;
  Query1.Close;
  Query1.UnPrepare;
  Query1.SQL.Clear;
  Query1.Active:=false;
end;

procedure Txiangxiform.SpeedButton3Click(Sender: TObject);
var
  itemindex:integer;
begin
if ListBox2.Count<>0 then
  begin
    if (ListBox2.ItemIndex<0)or(ListBox2.Count-1<ListBox2.ItemIndex) then
      abort;
    if ListBox2.Items.Strings[integer(ListBox2.ItemIndex)]='总成绩' then
      greadtag:=false;
    itemindex:=ListBox2.ItemIndex;
    ListBox2.DeleteSelected;
    ListBox2.ItemIndex:=itemindex;
    runsqlz;
    BitBtn1.Enabled:=true;
    BitBtn2.Enabled:=true;
  end
else
  begin
    Query1.Close;
    Query1.UnPrepare;
    Query1.SQL.Clear;
    Query1.Active:=false;
    BitBtn1.Enabled:=false;
    bitbtn2.Enabled:=false;
  end;

end;

procedure Txiangxiform.ComboBox1Enter(Sender: TObject);
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

procedure Txiangxiform.ComboBox2Enter(Sender: TObject);
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


procedure txiangxiform.runsqlz;
var
  count1:integer;
  tagd:Boolean;
begin
count1:=0;
tagd:=false;
  if ListBox2.Count<>0 then
    begin
      with Query1 do
        begin
          Close;
          UnPrepare;
          SQL.Clear;
          sql.Add('select'+'');
           while ListBox2.Count-1<>count1-1 do
             begin
               if (ListBox2.Items.Strings[count1]='50米跑')or(ListBox2.Items.Strings[count1]='身高')or
                  (ListBox2.Items.Strings[count1]='体重')or(ListBox2.Items.Strings[count1]='800米跑')or
                  (ListBox2.Items.Strings[count1]='1000米跑')or(ListBox2.Items.Strings[count1]='握力体重')or(ListBox2.Items.Strings[count1]='握力体重指数')or
                  (ListBox2.Items.Strings[count1]='肺活量体重')or(ListBox2.Items.Strings[count1]='肺活量体重指数')or(ListBox2.Items.Strings[count1]='立定跳远')or
                  (ListBox2.Items.Strings[count1]='仰卧起做')or(ListBox2.Items.Strings[count1]='坐立体前屈')or(ListBox2.Items.Strings[count1]='总成绩')  then
                    begin
                      if ListBox2.Items.Strings[count1]='总成绩' then
                        greadtag:=true;
                      if tagd=true then
                        SQL.Add(',');
                      query1.SQL.Add('stugread.'+QuotedStr(ListBox2.Items.Strings[count1]));
                      tagd:=true;
                    end
              else if (ListBox2.Items.Strings[count1]='50米跑成绩')or(ListBox2.Items.Strings[count1]='身高体重成绩')or(ListBox2.Items.Strings[count1]='800米跑成绩')or
                  (ListBox2.Items.Strings[count1]='1000米跑成绩')or(ListBox2.Items.Strings[count1]='握力体重指数成绩')or
                  (ListBox2.Items.Strings[count1]='肺活量体重指数成绩')or(ListBox2.Items.Strings[count1]='立定跳远成绩')or
                  (ListBox2.Items.Strings[count1]='仰卧起做成绩')or(ListBox2.Items.Strings[count1]='坐立体前屈成绩')  then
                    begin
                      if tagd=true then
                        SQL.Add(',');
                      query1.SQL.Add('stugreaninfo.'+QuotedStr(ListBox2.Items.Strings[count1]));
                      tagd:=true;
                    end
              else
                begin
                  if Tagd=true then
                    SQL.Add(',');
                   SQL.Add(ListBox2.Items.Strings[count1]);
                   tagd:=true;
                end;
               count1:=count1+1;
             end;
            SQL.Add(' from xueshengxinxi join stugread on xueshengxinxi.学生编号=stugread.学生编号 join stugreaninfo on xueshengxinxi.学生编号=stugreaninfo.学生编号  where xueshengxinxi.所属班级名称='+QuotedStr(ComboBox2.Text));
            Prepare;
            ExecSQL;
            Active:=true;
        end;
    end;
end;


procedure Txiangxiform.ComboBox1Change(Sender: TObject);
begin
ComboBox2.Text:='';
SpeedButton4.Click;
end;

procedure Txiangxiform.ComboBox2Change(Sender: TObject);
begin
SpeedButton4.Click;
end;

procedure Txiangxiform.BitBtn1Click(Sender: TObject);
var
  heji,liang,you,jige,bujige,zhongjige:Double;//等级信息
  temps:string;
begin
heji:=0;
liang:=0;
you:=0;
jige:=0;
bujige:=0;
zhongjige:=0;
//表头设置//
xxreport.biaoti.Caption:=edit1.Text;
xxreport.banji.Caption:=ComboBox2.Text;
xxreport.jiaoshi.Caption:=edit2.Text;
heji:=DBGrid1.DataSource.DataSet.RecordCount;
with DBGrid1.DataSource.DataSet do
begin
if (RecordCount<>0)and(greadtag=true) then
  begin
    First;
    while Eof<>true do
      begin
        if StrToInt(FieldValues['总成绩'])<60 then
          bujige:=bujige+1
        else if (StrToInt(FieldValues['总成绩'])>69)and(StrToInt(FieldValues['总成绩'])<76) then
          begin
          jige:=jige+1;
          zhongjige:=zhongjige+1;
          end
        else if (StrToInt(FieldValues['总成绩'])>75)and(StrToInt(FieldValues['总成绩'])<86) then
          begin
          liang:=liang+1;
          zhongjige:=zhongjige+1;
          end
        else if  StrToInt(FieldValues['总成绩'])>85 then
          begin
          you:=you+1;
          zhongjige:=zhongjige+1;
          end;
        Next;
      end;
      First;
      xxreport.zhonghe.Caption:=FloatToStr(heji);
      xxreport.bujigec.Caption:=FloatToStr(bujige);
      xxreport.jigec.Caption:=FloatToStr(jige);
      xxreport.liangc.Caption:=FloatToStr(liang);
      xxreport.youc.Caption:=FloatToStr(you);
      xxreport.zongjigec.Caption:=FloatToStr(zhongjige);
      if heji<>0 then
        begin
          xxreport.bujigel.Caption:=FloatToStr(bujige/heji*100)+'%';
          temps:=xxreport.bujigel.Caption;
          xxreport.bujigel.Caption:=floatformat(temps);
          xxreport.jigel.Caption:=FloatToStr(jige/heji*100)+'%';
          temps:=xxreport.jigel.Caption;
          xxreport.jigel.Caption:=floatformat(temps);
          xxreport.liangl.Caption:=FloatToStr(liang/heji*100)+'%';
          temps:=xxreport.liangl.Caption;
          xxreport.liangl.Caption:=floatformat(temps);
          xxreport.youl.Caption:=FloatToStr(you/heji*100)+'%';
          temps:=xxreport.youl.Caption;
          xxreport.youl.Caption:=floatformat(temps);
          xxreport.zongjigel.Caption:=FloatToStr(zhongjige/heji*100)+'%';
          temps:=xxreport.zongjigel.Caption;
          xxreport.zongjigel.Caption:=floatformat(temps);
        end;
  end
else
  begin
    with xxreport do
      begin
        zhonghe.Caption:=FloatToStr(heji);
        bujigec.Caption:='';
        jigec.Caption:='';
        liangc.Caption:='';
        youc.Caption:='';
        zongjigec.Caption:='';
        bujigel.Caption:='';
        jigel.Caption:='';
        liangl.Caption:='';
        youl.Caption:='';
        zongjigel.Caption:='';
      end;
  end;
end;
//报表内容设置//
with xxreport do
  begin
    if ListBox2.Count<>0 then
      begin
        case ListBox2.Count of
           1:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';
               b8.Caption:='';
               b7.Caption:='';
               b6.Caption:='';
               b5.Caption:='';
               b4.Caption:='';
               b3.Caption:='';
               b2.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;
               s7.Enabled:=false;
               s6.Enabled:=false;
               s5.Enabled:=false;
               s4.Enabled:=false;
               s3.Enabled:=false;
               s2.Enabled:=false;
               s1.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;
               a8.Enabled:=false;
               a7.Enabled:=false;
               a6.Enabled:=false;
               a5.Enabled:=false;
               a4.Enabled:=false;
               a3.Enabled:=false;
               a2.Enabled:=false;
               
               a1.Enabled:=true;
               a1.DataField:=ListBox2.Items.Strings[0];
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
             end;
           2:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';
               b8.Caption:='';
               b7.Caption:='';
               b6.Caption:='';
               b5.Caption:='';
               b4.Caption:='';
               b3.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;
               s7.Enabled:=false;
               s6.Enabled:=false;
               s5.Enabled:=false;
               s4.Enabled:=false;
               s3.Enabled:=false;
               s2.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;
               a8.Enabled:=false;
               a7.Enabled:=false;
               a6.Enabled:=false;
               a5.Enabled:=false;
               a4.Enabled:=false;
               a3.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               s1.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
             end;
           3:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';
               b8.Caption:='';
               b7.Caption:='';
               b6.Caption:='';
               b5.Caption:='';
               b4.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;
               s7.Enabled:=false;
               s6.Enabled:=false;
               s5.Enabled:=false;
               s4.Enabled:=false;
               s3.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;
               a8.Enabled:=false;
               a7.Enabled:=false;
               a6.Enabled:=false;
               a5.Enabled:=false;
               a4.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
             end;
           4:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';
               b8.Caption:='';
               b7.Caption:='';
               b6.Caption:='';
               b5.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;
               s7.Enabled:=false;
               s6.Enabled:=false;
               s5.Enabled:=false;
               s4.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;
               a8.Enabled:=false;
               a7.Enabled:=false;
               a6.Enabled:=false;
               a5.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
             end;
           5:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';
               b8.Caption:='';
               b7.Caption:='';
               b6.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;
               s7.Enabled:=false;
               s6.Enabled:=false;
               s5.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;
               a8.Enabled:=false;
               a7.Enabled:=false;
               a6.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
             end;
           6:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';
               b8.Caption:='';
               b7.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;
               s7.Enabled:=false;
               s6.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;
               a8.Enabled:=false;
               a7.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
             end;
           7:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';
               b8.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;
               s7.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;
               a8.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
             end;
           8:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';
               b9.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;
               s8.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;
               a9.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
             end;
           9:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';
               b10.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;
               s9.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;
               a10.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
             end;
           10:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';
               b11.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;
               s10.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;
               a11.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
             end;
           11:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';
               b12.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;
               s11.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;
               a12.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
             end;
           12:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';
               b13.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;
               s12.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;
               a13.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
             end;
           13:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';
               b14.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;
               s13.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;
               a14.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               a13.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               s12.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               b13.Caption:=labe(ListBox2.Items.Strings[12],length(ListBox2.Items.Strings[12]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
               a13.DataField:=ListBox2.Items.Strings[12];
             end;
           14:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';
               b15.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;
               s14.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;
               a15.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               a13.Enabled:=true;
               a14.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               s12.Enabled:=true;
               s13.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               b13.Caption:=labe(ListBox2.Items.Strings[12],length(ListBox2.Items.Strings[12]));
               b14.Caption:=labe(ListBox2.Items.Strings[13],length(ListBox2.Items.Strings[13]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
               a13.DataField:=ListBox2.Items.Strings[12];
               a14.DataField:=ListBox2.Items.Strings[13];
             end;
           15:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';
               b16.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;
               s15.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;
               a16.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               a13.Enabled:=true;
               a14.Enabled:=true;
               a15.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               s12.Enabled:=true;
               s13.Enabled:=true;
               s14.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               b13.Caption:=labe(ListBox2.Items.Strings[12],length(ListBox2.Items.Strings[12]));
               b14.Caption:=labe(ListBox2.Items.Strings[13],length(ListBox2.Items.Strings[13]));
               b15.Caption:=labe(ListBox2.Items.Strings[14],length(ListBox2.Items.Strings[14]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
               a13.DataField:=ListBox2.Items.Strings[12];
               a14.DataField:=ListBox2.Items.Strings[13];
               a15.DataField:=ListBox2.Items.Strings[14];
             end;
           16:begin
               b19.Caption:='';
               b18.Caption:='';
               b17.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;
               s16.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;
               a17.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               a13.Enabled:=true;
               a14.Enabled:=true;
               a15.Enabled:=true;
               a16.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               s12.Enabled:=true;
               s13.Enabled:=true;
               s14.Enabled:=true;
               s15.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               b13.Caption:=labe(ListBox2.Items.Strings[12],length(ListBox2.Items.Strings[12]));
               b14.Caption:=labe(ListBox2.Items.Strings[13],length(ListBox2.Items.Strings[13]));
               b15.Caption:=labe(ListBox2.Items.Strings[14],length(ListBox2.Items.Strings[14]));
               b16.Caption:=labe(ListBox2.Items.Strings[15],length(ListBox2.Items.Strings[15]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
               a13.DataField:=ListBox2.Items.Strings[12];
               a14.DataField:=ListBox2.Items.Strings[13];
               a15.DataField:=ListBox2.Items.Strings[14];
               a16.DataField:=ListBox2.Items.Strings[15];
            end;
           17:begin
               b19.Caption:='';
               b18.Caption:='';

               s18.Enabled:=false;
               s17.Enabled:=false;

               a19.Enabled:=false;
               a18.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               a13.Enabled:=true;
               a14.Enabled:=true;
               a15.Enabled:=true;
               a16.Enabled:=true;
               a17.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               s12.Enabled:=true;
               s13.Enabled:=true;
               s14.Enabled:=true;
               s15.Enabled:=true;
               s16.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               b13.Caption:=labe(ListBox2.Items.Strings[12],length(ListBox2.Items.Strings[12]));
               b14.Caption:=labe(ListBox2.Items.Strings[13],length(ListBox2.Items.Strings[13]));
               b15.Caption:=labe(ListBox2.Items.Strings[14],length(ListBox2.Items.Strings[14]));
               b16.Caption:=labe(ListBox2.Items.Strings[15],length(ListBox2.Items.Strings[15]));
               b17.Caption:=labe(ListBox2.Items.Strings[16],length(ListBox2.Items.Strings[16]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
               a13.DataField:=ListBox2.Items.Strings[12];
               a14.DataField:=ListBox2.Items.Strings[13];
               a15.DataField:=ListBox2.Items.Strings[14];
               a16.DataField:=ListBox2.Items.Strings[15];
               a17.DataField:=ListBox2.Items.Strings[16];
             end;
           18:begin
               b19.Caption:='';

               s18.Enabled:=false;

               a19.Enabled:=false;

               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               a13.Enabled:=true;
               a14.Enabled:=true;
               a15.Enabled:=true;
               a16.Enabled:=true;
               a17.Enabled:=true;
               a18.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               s12.Enabled:=true;
               s13.Enabled:=true;
               s14.Enabled:=true;
               s15.Enabled:=true;
               s16.Enabled:=true;
               s17.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               b13.Caption:=labe(ListBox2.Items.Strings[12],length(ListBox2.Items.Strings[12]));
               b14.Caption:=labe(ListBox2.Items.Strings[13],length(ListBox2.Items.Strings[13]));
               b15.Caption:=labe(ListBox2.Items.Strings[14],length(ListBox2.Items.Strings[14]));
               b16.Caption:=labe(ListBox2.Items.Strings[15],length(ListBox2.Items.Strings[15]));
               b17.Caption:=labe(ListBox2.Items.Strings[16],length(ListBox2.Items.Strings[16]));
               b18.Caption:=labe(ListBox2.Items.Strings[17],length(ListBox2.Items.Strings[17]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
               a13.DataField:=ListBox2.Items.Strings[12];
               a14.DataField:=ListBox2.Items.Strings[13];
               a15.DataField:=ListBox2.Items.Strings[14];
               a16.DataField:=ListBox2.Items.Strings[15];
               a17.DataField:=ListBox2.Items.Strings[16];
               a18.DataField:=ListBox2.Items.Strings[17];
             end;
           19..25:begin
               a1.Enabled:=true;
               a2.Enabled:=true;
               a3.Enabled:=true;
               a4.Enabled:=true;
               a5.Enabled:=true;
               a6.Enabled:=true;
               a7.Enabled:=true;
               a8.Enabled:=true;
               a9.Enabled:=true;
               a10.Enabled:=true;
               a11.Enabled:=true;
               a12.Enabled:=true;
               a13.Enabled:=true;
               a14.Enabled:=true;
               a15.Enabled:=true;
               a16.Enabled:=true;
               a17.Enabled:=true;
               a18.Enabled:=true;
               a19.Enabled:=true;
               s1.Enabled:=true;
               s2.Enabled:=true;
               s3.Enabled:=true;
               s4.Enabled:=true;
               s5.Enabled:=true;
               s6.Enabled:=true;
               s7.Enabled:=true;
               s8.Enabled:=true;
               s9.Enabled:=true;
               s10.Enabled:=true;
               s11.Enabled:=true;
               s12.Enabled:=true;
               s13.Enabled:=true;
               s14.Enabled:=true;
               s15.Enabled:=true;
               s16.Enabled:=true;
               s17.Enabled:=true;
               s18.Enabled:=true;
               b1.Caption:=labe(ListBox2.Items.Strings[0],length(ListBox2.Items.Strings[0]));
               b2.Caption:=labe(ListBox2.Items.Strings[1],length(ListBox2.Items.Strings[1]));
               b3.Caption:=labe(ListBox2.Items.Strings[2],length(ListBox2.Items.Strings[2]));
               b4.Caption:=labe(ListBox2.Items.Strings[3],length(ListBox2.Items.Strings[3]));
               b5.Caption:=labe(ListBox2.Items.Strings[4],length(ListBox2.Items.Strings[4]));
               b6.Caption:=labe(ListBox2.Items.Strings[5],length(ListBox2.Items.Strings[5]));
               b7.Caption:=labe(ListBox2.Items.Strings[6],length(ListBox2.Items.Strings[6]));
               b8.Caption:=labe(ListBox2.Items.Strings[7],length(ListBox2.Items.Strings[7]));
               b9.Caption:=labe(ListBox2.Items.Strings[8],length(ListBox2.Items.Strings[8]));
               b10.Caption:=labe(ListBox2.Items.Strings[9],length(ListBox2.Items.Strings[9]));
               b11.Caption:=labe(ListBox2.Items.Strings[10],length(ListBox2.Items.Strings[10]));
               b12.Caption:=labe(ListBox2.Items.Strings[11],length(ListBox2.Items.Strings[11]));
               b13.Caption:=labe(ListBox2.Items.Strings[12],length(ListBox2.Items.Strings[12]));
               b14.Caption:=labe(ListBox2.Items.Strings[13],length(ListBox2.Items.Strings[13]));
               b15.Caption:=labe(ListBox2.Items.Strings[14],length(ListBox2.Items.Strings[14]));
               b16.Caption:=labe(ListBox2.Items.Strings[15],length(ListBox2.Items.Strings[15]));
               b17.Caption:=labe(ListBox2.Items.Strings[16],length(ListBox2.Items.Strings[16]));
               b18.Caption:=labe(ListBox2.Items.Strings[17],length(ListBox2.Items.Strings[17]));
               b19.Caption:=labe(ListBox2.Items.Strings[18],length(ListBox2.Items.Strings[18]));
               a1.DataField:=ListBox2.Items.Strings[0];
               a2.DataField:=ListBox2.Items.Strings[1];
               a3.DataField:=ListBox2.Items.Strings[2];
               a4.DataField:=ListBox2.Items.Strings[3];
               a5.DataField:=ListBox2.Items.Strings[4];
               a6.DataField:=ListBox2.Items.Strings[5];
               a7.DataField:=ListBox2.Items.Strings[6];
               a8.DataField:=ListBox2.Items.Strings[7];
               a9.DataField:=ListBox2.Items.Strings[8];
               a10.DataField:=ListBox2.Items.Strings[9];
               a11.DataField:=ListBox2.Items.Strings[10];
               a12.DataField:=ListBox2.Items.Strings[11];
               a13.DataField:=ListBox2.Items.Strings[12];
               a14.DataField:=ListBox2.Items.Strings[13];
               a15.DataField:=ListBox2.Items.Strings[14];
               a16.DataField:=ListBox2.Items.Strings[15];
               a17.DataField:=ListBox2.Items.Strings[16];
               a18.DataField:=ListBox2.Items.Strings[17];
               a19.DataField:=ListBox2.Items.Strings[18];
             end;
          end;
        end;
  end;
xxreport.QuickRep1.Preview;
end;

procedure Txiangxiform.ListBox2DblClick(Sender: TObject);
begin
SpeedButton3.Click;
end;

procedure Txiangxiform.ListBox1DblClick(Sender: TObject);
begin
SpeedButton1.Click;
end;



function txiangxiform.labe(str:string;strlen:integer):string;
var
  cishu:integer;
  res:string;
  mlen:integer;
begin
res:='';
cishu:=0;
if strlen<>0 then
  begin
    if pos('8',str)<>0 then
      begin
        res:=res+#13+copy(str,1,1);
        mlen:=length(copy(str,pos('8',str)+1,length(str)-pos('8',str))) ;
        while cishu<>mlen do
          begin
            res:=res+#13+copy(str,pos('8',str)+cishu+1,2);
            cishu:=cishu+2;
          end;
        labe:=res;
      end
    else
      begin
        while cishu<>strlen do
          begin
            res:=res+#13+copy(str,1+cishu,2);
            cishu:=cishu+2;
          end;
        labe:=res;
      end;
  end;
end;



procedure Txiangxiform.BitBtn2Click(Sender: TObject);
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
          while not Eof do
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

function txiangxiform.floatformat(var strnum:string):string;
begin
  if pos('.',strnum)<>0 then
    begin
      Delete(strnum,pos('.',strnum)+3,length(strnum)-pos('.',strnum)+3);
      floatformat:=strnum+'%';
    end
  else
    floatformat:=strnum;
end;


end.
