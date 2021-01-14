unit Unkaoshi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, Buttons, DBCtrls;

type
  Tkaoshifrm = class(TForm)
    DataSource1: TDataSource;
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    abox: TComboBox;
    bbox: TComboBox;
    cbox: TComboBox;
    dbox: TComboBox;
    ebox: TComboBox;
    firstbtn: TBitBtn;
    nextbtn: TBitBtn;
    priorbtn: TBitBtn;
    finishbtn: TBitBtn;
    countbtn: TBitBtn;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Shape2: TShape;
    DataSource2: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    DBImage1: TDBImage;
    Label7: TLabel;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure firstbtnClick(Sender: TObject);
    procedure nextbtnClick(Sender: TObject);
    procedure priorbtnClick(Sender: TObject);
//    procedure countbtnClick(Sender: TObject);
    procedure finishbtnClick(Sender: TObject);
    procedure countbtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kaoshifrm: Tkaoshifrm;

implementation

uses Undm, Unidentify;
var
    n,count:integer;
    selectbox:array[1..12,1..5] of integer;

{$R *.dfm}

procedure Tkaoshifrm.BitBtn1Click(Sender: TObject);
begin
application.terminate;
end;

procedure Tkaoshifrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure Tkaoshifrm.firstbtnClick(Sender: TObject);
begin
 selectbox[n,1]:=abox.ItemIndex;
 selectbox[n,2]:=bbox.ItemIndex;
 selectbox[n,3]:=cbox.ItemIndex;
 selectbox[n,4]:=dbox.ItemIndex;
 selectbox[n,5]:=ebox.ItemIndex;
 if n=12 then
  nextbtn.Enabled:=true;
 datamodule2.CDSKaoshi.First;
 n:=1;
 abox.ItemIndex:=selectbox[1,1];
 bbox.ItemIndex:=selectbox[1,2];
 cbox.ItemIndex:=selectbox[1,3];
 dbox.ItemIndex:=selectbox[1,4];
 ebox.ItemIndex:=selectbox[1,5];
 statictext3.Caption:='第'+inttostr(n)+'题';
 firstbtn.Enabled:=false;
 priorbtn.Enabled:=false;
end;

procedure Tkaoshifrm.nextbtnClick(Sender: TObject);
begin
selectbox[n,1]:=abox.ItemIndex;
selectbox[n,2]:=bbox.ItemIndex;
selectbox[n,3]:=cbox.ItemIndex;
selectbox[n,4]:=dbox.ItemIndex;
selectbox[n,5]:=ebox.ItemIndex;
datamodule2.CDSKaoshi.Next;
n:=n+1;
abox.ItemIndex:=selectbox[n,1];
bbox.ItemIndex:=selectbox[n,2];
cbox.ItemIndex:=selectbox[n,3];
dbox.ItemIndex:=selectbox[n,4];
ebox.ItemIndex:=selectbox[n,5];
statictext3.Caption:='第'+inttostr(n)+'题';
firstbtn.Enabled:=true;
priorbtn.Enabled:=true;
if n=12 then
 nextbtn.Enabled:=false;
end;

procedure Tkaoshifrm.priorbtnClick(Sender: TObject);
begin
 if n=12 then
  nextbtn.Enabled:=true;
 selectbox[n,1]:=abox.ItemIndex;
 selectbox[n,2]:=bbox.ItemIndex;
 selectbox[n,3]:=cbox.ItemIndex;
 selectbox[n,4]:=dbox.ItemIndex;
 datamodule2.CDSKaoshi.Prior;
 n:=n-1;
 abox.ItemIndex:=selectbox[n,1];
 bbox.ItemIndex:=selectbox[n,2];
 cbox.ItemIndex:=selectbox[n,3];
 dbox.ItemIndex:=selectbox[n,4];
 ebox.ItemIndex:=selectbox[n,5];
 statictext3.Caption:='第'+inttostr(n)+'题';
 if n=1 then
  begin
   priorbtn.Enabled:=false;
   firstbtn.Enabled:=false;
  end;
end;

procedure Tkaoshifrm.finishbtnClick(Sender: TObject);
var
 i:integer;
 bookmark1:tbookmark;
begin
  selectbox[n,1]:=abox.ItemIndex;    //保存答案；
  selectbox[n,2]:=bbox.ItemIndex;   //保存答案；
  selectbox[n,3]:=cbox.ItemIndex;  //保存答案；
  selectbox[n,4]:=dbox.ItemIndex;  //保存答案；
  selectbox[n,5]:=ebox.ItemIndex;  //保存答案；
  count:=0;
  bookmark1:=datamodule2.CDSKaoshi.GetBookmark;
  datamodule2.CDSKaoshi.First;
  for i:=1 to 12 do
   begin
    if datamodule2.CDSKaoshi.Fields[2].Value=inttostr(selectbox[i,1]+1) then
     inc(count);
    if datamodule2.CDSExam.Fields[3].Value=inttostr(selectbox[i,2]+1) then
     inc(count);
    if datamodule2.CDSKaoshi.Fields[4].Value=inttostr(selectbox[i,3]+1) then
     inc(count);
    if datamodule2.CDSKaoshi.Fields[5].Value=inttostr(selectbox[i,4]+1) then
     inc(count);
    if datamodule2.CDSKaoshi.Fields[6].Value=inttostr(selectbox[i,5]+1) then
     inc(count);
    datamodule2.CDSKaoshi.Next;
   end; //统计得分；
  datamodule2.CDSStudent.Edit;
  datamodule2.CDSStudent.Fields[9].Value:=trunc(count*1.67);
  datamodule2.CDSKaoshi.GotoBookmark(bookmark1);
  datamodule2.CDSKaoshi.FreeBookmark(bookmark1);
  finishbtn.Enabled:=false;
  countbtn.Enabled:=true;
  abox.Enabled:=false;
  bbox.Enabled:=false;
  cbox.Enabled:=false;
  dbox.Enabled:=false;
  ebox.Enabled:=false;
  timer1.Enabled:=false;
  bitbtn1.Enabled:=true;
  datamodule2.CDSInformation.Edit;
  datamodule2.CDSStudent.Edit;
  datamodule2.CDSStudent.FieldByName('状态').AsInteger:=3;
  datamodule2.CDSInformation.FieldByName('状态').AsInteger:=4;
  datamodule2.CDSInformation.FieldByName('准考证号').AsString:='*';
  datamodule2.CDSStudent.Post;
  datamodule2.CDSInformation.Post;
  datamodule2.CDSStudent.ApplyUpdates(0);
  datamodule2.CDSInformation.ApplyUpdates(0);
end;

procedure Tkaoshifrm.countbtnClick(Sender: TObject);
begin
showmessage('你的成绩是:'+floattostr(count*1.67)+'分');
end;

procedure Tkaoshifrm.BitBtn2Click(Sender: TObject);
//先创建一个题目号数组，随机产生一题号
var
  problem:array of integer;//题目数组
  scproblem:array of integer;//生成题目的数组
  total:integer;//总题目数
  sctotal:integer;//生成的题目数(total>sctotal)
  i,j,k:integer;
begin
  total:=datamodule2.CDSExam.RecordCount;
  statictext3.Caption:=datamodule2.CDSExam.Fields[0].Value;
  setlength(problem,total);//初始化
  for i:=0 to total-1 do
    problem[i]:=i+1;
  sctotal:=12;
  setlength(scproblem,sctotal);
  randomize;
  for i:=0 to sctotal-1 do
   begin
    j:=random(total);
    scproblem[i]:=problem[j];  //选种的题号，存入数组
    total:=total-1;            //没有选过的题目数
    for k:=j to total-1 do     //除去选种的题号
      problem[k]:=problem[k+1];
   end;
  for i:=0 to sctotal-1 do
   begin
    datamodule2.CDSExam.Locate('题号',scproblem[i],[]);
    datamodule2.CDSKaoshi.InsertRecord([datamodule2.CDSExam.Fields[0].Value,
    datamodule2.CDSExam.Fields[1].Value,datamodule2.CDSExam.Fields[2].Value,
    datamodule2.CDSExam.Fields[3].Value,datamodule2.CDSExam.Fields[4].Value,
    datamodule2.CDSExam.Fields[5].Value,datamodule2.CDSExam.Fields[6].Value]);
   end;
  //下面初始化程序，开始考试。
  bitbtn2.enabled:=false;
  timer1.Enabled:=true;
  label15.Caption:=timetostr(time);
  label16.Caption:=timetostr(time+strtotime('02:00:00'));
  n:=1;
  abox.Enabled:=true;
  bbox.Enabled:=true;
  cbox.Enabled:=true;
  dbox.Enabled:=true;
  ebox.Enabled:=true;
  nextbtn.Enabled:=true;
  finishbtn.Enabled:=true;
  statictext3.Caption:='第'+inttostr(n)+'题';
  datamodule2.CDSKaoshi.First;
end;

procedure Tkaoshifrm.FormCreate(Sender: TObject);
var i,j:integer;
begin
 for i:=1 to 12 do
  for j:=1 to 5 do
   selectbox[i,j]:=-1; //初始化大案；
 abox.ItemIndex:=-1;
 bbox.ItemIndex:=-1;
 cbox.ItemIndex:=-1;
 dbox.ItemIndex:=-1;
 ebox.ItemIndex:=-1;  //初始化组合框；
 nextbtn.Enabled:=false;
 countbtn.Enabled:=false;
 finishbtn.Enabled:=false;
 label15.Caption:='';
 label16.Caption:='';
 label17.Caption:='';
 statictext3.Caption:='';
 timer1.Enabled:=false;
 firstbtn.Enabled:=false;
 priorbtn.Enabled:=false;
 bitbtn1.Enabled:=false;
 abox.Enabled:=false;
 bbox.Enabled:=false;
 cbox.Enabled:=false;
 dbox.Enabled:=false;
 ebox.Enabled:=false;
end;

procedure Tkaoshifrm.Timer1Timer(Sender: TObject);
var
 i:integer;
 bookmark1:tbookmark;
begin
label17.Caption:=timetostr(time);
if label17.Caption=label16.Caption then
 begin
  datamodule2.CDSStudent.FieldByName('状态').AsInteger:=3;
  datamodule2.CDSInformation.FieldByName('状态').AsInteger:=4;
  datamodule2.CDSInformation.FieldByName('准考证号').AsString:='*';
  timer1.Enabled:=false;
  selectbox[n,1]:=abox.ItemIndex;
  selectbox[n,2]:=bbox.ItemIndex;
  selectbox[n,3]:=cbox.ItemIndex;
  selectbox[n,4]:=dbox.ItemIndex;
  selectbox[n,5]:=ebox.ItemIndex;
  showmessage('时间到！请停止作答。谢谢你的使用。');
  finishbtn.Enabled:=false;
  countbtn.Enabled:=true;
  abox.Enabled:=false;
  bbox.Enabled:=false;
  cbox.Enabled:=false;
  dbox.Enabled:=false;
  ebox.Enabled:=false;
  count:=0;
  bookmark1:=datamodule2.CDSKaoshi.GetBookmark;
  datamodule2.CDSKaoshi.First;
  for i:=1 to 12 do
   begin
    if datamodule2.CDSKaoshi.Fields[2].Value=inttostr(selectbox[i,1]+1) then
     inc(count);
    if datamodule2.CDSExam.Fields[3].Value=inttostr(selectbox[i,2]+1) then
     inc(count);
    if datamodule2.CDSKaoshi.Fields[4].Value=inttostr(selectbox[i,3]+1) then
     inc(count);
    if datamodule2.CDSKaoshi.Fields[5].Value=inttostr(selectbox[i,4]+1) then
     inc(count);
    if datamodule2.CDSKaoshi.Fields[6].Value=inttostr(selectbox[i,5]+1) then
     inc(count);
    datamodule2.CDSKaoshi.Next;
   end;
  datamodule2.CDSStudent.Edit;
  datamodule2.CDSStudent.Fields[9].Value:=trunc(count*1.67);
  datamodule2.CDSKaoshi.GotoBookmark(bookmark1);
  datamodule2.CDSKaoshi.FreeBookmark(bookmark1);
  bitbtn1.Enabled:=true;
  datamodule2.CDSInformation.Edit;
  datamodule2.CDSStudent.Edit;
  datamodule2.CDSStudent.FieldByName('状态').AsInteger:=3;
  datamodule2.CDSInformation.FieldByName('状态').AsInteger:=4;
  datamodule2.CDSInformation.FieldByName('准考证号').AsString:='*';
  datamodule2.CDSStudent.Post;
  datamodule2.CDSInformation.Post;
  datamodule2.CDSStudent.ApplyUpdates(0);
  datamodule2.CDSInformation.ApplyUpdates(0);
 end;
end;

end.
