//---------------------------------------------------------
// 数据库开发经典实例解析  清华大学出版社

unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, DB, ADODB, StdCtrls;
type
  Ttable=array[0..2] of string;
type
  Tmain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    StatusBar1: TStatusBar;
    ADOQuery3: TADOQuery;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
    //para用于保存系统参数，FindForm用于寻找MDI子窗体，setpara用于更新para的值
    para:Ttable;
    function FindForm(caption:string):bool;
    procedure setpara();
  end;

var
  main: Tmain;
  para:Ttable;

implementation

{$R *.dfm}
uses SecSettingForm,AccountSettingForm,DocuInputForm,TotalAccountForm,DetailAccountForm,SumAccountForm,FinalReportForm;

//-------------------通过用户定义的函数，判断窗体是否已存在--------------------
function Tmain.FindForm(caption: string): bool;
var
i:integer;
begin
 for i:=0 to main.MDIChildCount do
  begin
   // 通过对窗体标题判断窗体是否存在
    if main.MDIChildren[i].Caption=caption then
     begin
      //如果窗体已存在，则恢复窗体，并返回true
      SendMessage(mdichildren[i].Handle, WM_SYSCOMMAND, SC_restore, 0);
      mdichildren[i].Enabled:=true;
      mdichildren[i].Show;
      mdichildren[i].SetFocus;
      result:=true;
      break;
     end
     else
     //如窗体不存在，则返回false，程序将创建窗体
      result:=false;
  end
end;

//----该函数的作用是保存系统参数表中的参数，并在调用前更新---
procedure Tmain.setpara;
var
 i:integer;
begin
  adoquery3.Active:=false;
  adoquery3.Active:=true;
  i:=0;
while not adoquery3.Eof do
 begin
  //保存系统参数
  para[i]:=adoquery3.FieldByName('取值').AsString;
  i:=i+1;
  adoquery3.Next;
 end;
end;


//----------------显示会计科目设置窗体-------------------
procedure Tmain.N2Click(Sender: TObject);
var
newform:TSecSetting;
begin
if findForm('会计科目设置')=false then
 begin
   //若窗体不存在，则创建窗体
   newform:=Tsecsetting.Create(application);
   newform.Caption:='会计科目设置';
  end;
end;
//----------------显示帐户设置窗体-------------------
procedure Tmain.N3Click(Sender: TObject);
var
newform:TaccountSetting;
begin
 if findForm('帐户设置（期初数据录入）')=false then
 begin
   //若窗体不存在，则创建窗体
   newform:=TaccountSetting.Create(application);
   newform.Caption:='帐户设置（期初数据录入）';
  end;
end;

//----------------显示凭证设置窗体-------------------
procedure Tmain.N5Click(Sender: TObject);
var
newform:TDocuInput;
begin
  if findForm('会计凭证输入')=false then
   begin
    //若窗体不存在，则创建窗体
    newform:=Tdocuinput.Create(application);
    newform.Caption:='会计凭证输入';
   end;
end;




//----------------显示总分类帐查询窗体-------------------
procedure Tmain.N8Click(Sender: TObject);
var
newform:Ttotalaccount;
begin
  if findForm('总分类帐查询')=false then
   begin
    //若窗体不存在，则创建窗体
    newform:=Ttotalaccount.Create(application);
    newform.Caption:='总分类帐查询';
   end;
end;
//----------------显示明细帐查询窗体-------------------
procedure Tmain.N9Click(Sender: TObject);

var
newform:Tdetailaccount;
begin
  if findForm('明细帐查询')=false then
   begin
    //若窗体不存在，则创建窗体
    newform:=Tdetailaccount.Create(application);
    newform.Caption:='明细帐查询';
   end;
end;


//----------------显示试算平衡表窗体-------------------
procedure Tmain.N11Click(Sender: TObject);
var
newform:Tsumaccount;
begin
  if findForm('试算平衡表(正式使用)')=false then
   begin
    //若窗体不存在，则创建窗体
    newform:=Tsumaccount.Create(application);
    newform.Caption:='试算平衡表(正式使用)';
    //在正式平衡表中使用
    newform.foruse;
   end;
end;

//----------------执行凭证过帐储存过程---------------------
procedure Tmain.N6Click(Sender: TObject);
var
pnum,inputsum,outputsum:string;
begin

if application.MessageBox('凭证过帐后即不可修改，是否确认过帐？','确认',MB_OKCANCEL)=IDOK then
begin
//获得分录表中的统计数据
adoquery1.Active:=false;
adoquery1.Active:=true;
pnum:=adoquery1.FieldByName('凭证数').AsString;
inputsum:=adoquery1.FieldByName('借方金额').AsString;
outputsum:=adoquery1.FieldByName('贷方金额').AsString;
//执行储存过程，实现凭证过帐
try
adocommand1.CommandText:='exec sf_凭证过帐';
adocommand1.Execute;
except
showmessage('过帐失败');
exit;
end;
//显示成功信息，并显示统计数据
showmessage('过帐成功'+#13+#13+'过帐凭证数目为:'+pnum+#13+'借方金额合计:'+inputsum+#13+'贷方金额合计'+outputsum);
//删除分录表和凭证表
adocommand1.CommandText:='delete from 分录表';
adocommand1.Execute;
adocommand1.CommandText:='delete from 凭证表';
adocommand1.Execute;
end;
end;


//-----执行期末结帐的储存过程--------
procedure Tmain.N12Click(Sender: TObject);
begin

 if application.MessageBox('结帐将进入下一个会计期间，是否结帐？','确认',MB_OKCANCEL)=IDOK then
 begin
  try
   adocommand1.CommandText:='exec sf_期末结帐';
   adocommand1.Execute;
  except
    showmessage('结帐失败');
    exit;
  end;
 showmessage('结帐成功');
 end;
end;

//--------资产负债报表的生成和打印----------
procedure Tmain.N13Click(Sender: TObject);
var
index:integer;
inputstring:string;
newform:TFinalReport;
begin
 //取得当前会计期间的值
 setpara();
 index:=strtoint(para[2]);
 //提示用户输入要显示的会计期间
 inputstring:= InputBox('请选择所要统计的会计期间', '会计期间', inttostr(index-1));
 index:=strtoint(inputstring);
 //计算资产负债表
 adocommand1.CommandText:='exec sf_计算资产负债表 '''+inputstring+'''';
 adocommand1.Execute;

 //显示报表窗体，这里不需要再查找是否已有报表窗体
 //因为每次调用的报表窗体都可能显示不同的会计期间
 newform:=TFinalReport.Create(application);
 newform.SetPeriod(index);
 newform.QuickRep1.Preview;
end;

//------关闭窗体--------------------
procedure Tmain.N15Click(Sender: TObject);
begin
close;
end;


end.
