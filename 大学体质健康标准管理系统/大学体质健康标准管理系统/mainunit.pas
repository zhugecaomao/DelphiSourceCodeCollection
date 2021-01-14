unit mainunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  ImgList, OleCtrls, SHDocVw, Buttons, jpeg, bsSkinData, BusinessSkinForm,
  bsSkinCtrls,inifiles,shellapi,registry;

type
  Tmainform = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    toolpan1: TPanel;
    GroupBox1: TGroupBox;
    TreeView1: TTreeView;
    DBGrid1: TDBGrid;
    N14: TMenuItem;
    GroupBox3: TGroupBox;
    PopupMenu1: TPopupMenu;
    ImageList1: TImageList;
    Timer1: TTimer;
    N8: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    ToolBar1: TToolBar;
    N21: TMenuItem;
    N22: TMenuItem;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    zongshu: TEdit;
    Label2: TLabel;
    info: TEdit;
    Label3: TLabel;
    dengji: TEdit;
    Image1: TImage;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    chengjiinfo: TEdit;
    N23: TMenuItem;
    N24: TMenuItem;
    bsSkinMainMenuBar1: TbsSkinMainMenuBar;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    bsStoredSkin1: TbsStoredSkin;
    SpeedButton1: TToolButton;
    ToolButton3: TToolButton;
    SpeedButton3: TToolButton;
    SpeedButton4: TToolButton;
    SpeedButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton22: TToolButton;
    PopupMenu2: TPopupMenu;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    ToolButton1: TToolButton;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N210: TMenuItem;
    bsStoredSkin2: TbsStoredSkin;
    bsStoredSkin3: TbsStoredSkin;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    procedure N11Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure TreeView1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N12Click(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N210Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    runtag:Boolean;
    procedure dataref();
    procedure closetable();
    { Public declarations }
  end;

var
  mainform: Tmainform;
  inifile:TIniFile;
  surfile:TIniFile;
  inistr,vers,idstr,regstr,locatreg,locatid:string;  //取ini值
  longtime:integer;    //设置程序运行时间
  regeditsure:TRegistry;

implementation
uses aboutunit,dataunit,jianyaounit,chengjiunit,biaozhununit,anquanunit,passunit,backunit,chaxununit,printunit,helpunit,
  DB,zhuangkuangunit,xiangxiunit,toexcelunit,chushiunit;
var
  hnd: THandle;

{$R *.dfm}

procedure Tmainform.N11Click(Sender: TObject);
begin
aboutform.ShowModal;
end;

procedure Tmainform.N6Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tmainform.FormCreate(Sender: TObject);
var
  regdatasure:Boolean;
begin
/////////////////////////////////////////判断是否有注册值///////////////
regdatasure:=false;
regeditsure:=TRegistry.Create;
regeditsure.RootKey:=HKEY_LOCAL_MACHINE;
if regeditsure.OpenKey('software\大学体质健康标准管理系统\infomation',false) then
  begin
   if (regeditsure.ValueExists('user'))and(regeditsure.ValueExists('num'))and(regeditsure.ValueExists('id')) then
     if regeditsure.ReadString('num')=chushiform.newr(regeditsure.ReadString('user')+regeditsure.ReadString('id')) then
        regdatasure:=true;
   regeditsure.CloseKey;
   regeditsure.Destroy;
  end;
////////////////////////////////////////////////////////////////////////
longtime:=0;
runtag:=false;
inifile:=TIniFile.Create(ExtractFileDir(Application.ExeName)+'\data.ini');
surfile:=TIniFile.Create('c:\windows\system32\datasys.ini');
vers:=inifile.ReadString('section','version','');
inistr:=inifile.ReadString('section','styl','');
locatreg:=inifile.ReadString('section','reg','');
locatid:=inifile.ReadString('section','id','');
idstr:=surfile.ReadString('section','id','');
regstr:=surfile.ReadString('section','reg','');
if vers='' then             //判断ini文件的值是否存在
  begin
    inifile.WriteString('section','version','1.5');
    inifile.WriteString('section','styl','1');
    inifile.WriteString('section','col','1');
    inifile.WriteString('section','reg','false');
    inifile.WriteString('section','id','dataf');
    n33.Checked:=true;
    surfile.Free;
    CopyFile(pchar(ExtractFileDir(Application.ExeName)+'\data.ini'),'c:\windows\system32\datasys.ini',false);
    surfile:=TIniFile.Create('c:\windows\system32\datasys.ini');
  end
else
  begin
    if inistr='1' then
      bsSkinData1.StoredSkin:=bsStoredSkin1
    else if inistr='2' then
      bsSkinData1.StoredSkin:=bsStoredSkin2
    else if inistr='3' then
      bsSkinData1.StoredSkin:=bsStoredSkin3;
      
    if inifile.ReadString('section','col','')='1' then
      n33.Checked:=true
    else if inifile.ReadString('section','col','')='0' then
      n33.Checked:=false;
  end;
if (locatreg='true')and(locatid='datat')and(idstr='datat')and(regstr='true')and(regdatasure=true) then
  begin
    runtag:=true;
  end
else
  Application.MessageBox('此软件尚未注册！','提示');
mainform.Left:=GetSystemMetrics(SM_CXSCREEN) div 2-mainform.Width div 2;
mainform.Top:=GetSystemMetrics(SM_CYSCREEN) div 2-mainform.Height div 2;
end;

procedure Tmainform.N13Click(Sender: TObject);
begin
mainform.Hide;
jianyaoform.ShowModal;
end;

procedure Tmainform.FormShow(Sender: TObject);
var
  tree1,tree2,tree3:TTreeNode;
  rootinf,rootinf1:string;
begin
mainform.dataref;
TreeView1.Items.Clear;
DBGrid1.DataSource:=DataModule1.Dxibie;
  tree1:=TreeView1.Items.Add(nil,'体育成绩管理系统');
  TreeView1.SetFocus;
    with DataModule1 do
      begin
        xibie.First;
        while (xibie.RecordCount<>0)and(xibie.Eof<>true) do
          begin
            tree2:=TreeView1.Items.AddChild(tree1,xibie.FieldValues['院系名称']);
            rootinf:=xibie.FieldValues['院系名称'];
            banjixinxi.First;
            while (banjixinxi.RecordCount<>0)and(banjixinxi.Eof<>true) do
              begin
                if banjixinxi.FieldByName('所属院系名称').AsString=rootinf then
                  begin
                    tree3:=TreeView1.Items.AddChild(tree2,banjixinxi.FieldValues['班级名称']);
                    rootinf1:=banjixinxi.FieldValues['班级名称'];
                    xueshengxinxi.First;
                    while (xueshengxinxi.RecordCount<>0)and(xueshengxinxi.Eof<>true) do
                      begin
                        if xueshengxinxi.FieldByName('所属班级名称').AsString=rootinf1 then
                          begin
                            TreeView1.Items.AddChild(tree3,xueshengxinxi.FieldValues['学生编号']);
                          end;
                        xueshengxinxi.Next;
                      end;
                  end;
                  banjixinxi.Next;
              end;
            DataModule1.xibie.Next;
          end;
      end;
if passform.admin=2 then
  begin
    N2.Enabled:=false;
    N12.Enabled:=false;
    N13.Enabled:=false;
    N16.Enabled:=false;
    SpeedButton1.Enabled:=false;
    SpeedButton3.Enabled:=false;
    SpeedButton4.Enabled:=false;
    SpeedButton5.Enabled:=false;
  end
else if passform.admin=1 then
  begin
    n12.Enabled:=false;
    n2.Enabled:=false;
    SpeedButton1.Enabled:=false;
    SpeedButton3.Enabled:=false;
  end;
with  DataModule1 do
  begin
    xibie.Refresh;
    banjixinxi.Refresh;
    xueshengxinxi.Refresh;
    yonghu.Refresh;
    stugread.Refresh;
    studengji.Refresh;
    stugreadinfo.Refresh;
    zdxbothstandboy.Refresh;
    zdxbothstandgirl.Refresh;
    zdxstandhboy.Refresh;
    zdxstandhgirl.Refresh;
    zgzonestandboy.Refresh;
    zgzonestandgirl.Refresh;
    zgzstandhboy.Refresh;
    zgzstandhgirl.Refresh;
    zgzthreestandboy.Refresh;
    zgzthreestandgirl.Refresh;
    zgztwostandboy.Refresh;
    zgztwostandgirl.Refresh;
  end;
zongshu.Text:='';
info.Text:='';
chengjiinfo.Text:='';
dengji.Text:='';
end;

procedure Tmainform.TreeView1Click(Sender: TObject);
begin
with DBGrid1 do
begin
if TreeView1.Selected.Level=0 then
  begin
    DataSource:=DataModule1.Dxibie;
    zongshu.Text:=IntToStr(DataSource.DataSet.RecordCount);
    info.Text:=TreeView1.Selected.Text;
  end
else if TreeView1.Selected.Level=1 then
  begin
    DataSource:=DataModule1.Dbanjixinxi;
    DataSource.DataSet.Filtered:=true;
    DataSource.DataSet.Filter:='所属院系名称='+QuotedStr(TreeView1.Selected.Text);
    zongshu.Text:=IntToStr(DataSource.DataSet.RecordCount);
    info.Text:=TreeView1.Selected.Text;
  end
else if TreeView1.Selected.Level=2 then
  begin
    DataSource:=DataModule1.Dxueshengxinxi;
    DataSource.DataSet.Filtered:=true;
    DataSource.DataSet.Filter:='所属班级名称='+QuotedStr(TreeView1.Selected.Text);
    zongshu.Text:=IntToStr(DataSource.DataSet.RecordCount);
    info.Text:=TreeView1.Selected.Text;
  end
else if TreeView1.Selected.Level=3 then
  begin
     DataSource:=DataModule1.dstugread;
     DataSource.DataSet.Filter:='学生编号='+QuotedStr(TreeView1.Selected.Text);
     DataSource.DataSet.Filtered:=true;
     zongshu.Text:=inttostr(DataSource.DataSet.RecordCount);
     info.Text:=TreeView1.Selected.Text;
  end;
end;
end;


procedure Tmainform.N16Click(Sender: TObject);
begin
mainform.Hide;
chengjiform.ShowModal;
end;

procedure Tmainform.TreeView1KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tmainform.Timer1Timer(Sender: TObject);
begin
StatusBar1.Panels.Items[2].Text:=DateToStr(date())+'　'+TimeToStr(time());
if (runtag=false)and(longtime<360) then
  longtime:=longtime+1
else if (runtag=false)and(longtime>359) then
  Application.Terminate;
end;

procedure Tmainform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Timer1.Enabled:=false;
closetable;
if n33.Checked=true then
Application.MessageBox('为保证数据的安全性请注意备份！','每日提醒！');

end;

procedure Tmainform.N12Click(Sender: TObject);
begin
mainform.Hide;
biaozhunform.ShowModal;
end;

procedure Tmainform.DBGrid1ColEnter(Sender: TObject);
begin
if TreeView1.Selected.Level=3 then
  begin
    if (DataModule1.Ddengji.DataSet.Locate('学生编号',TreeView1.Selected.Text,[])=true)and(DataModule1.Dstugreadinfo.DataSet.Locate('学生编号',TreeView1.Selected.Text,[])=true) then
    begin
    with DBGrid1.SelectedField do
      begin
        if FieldName='50米跑' then
          begin
             dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['50米跑等级'];
             chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['50米跑成绩'];
          end
        else  if fieldName='800米跑' then
          begin
            dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['800米跑等级'];
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['800米跑成绩'];
          end
        else  if FieldName='1000米跑' then
          begin
            dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['1000米跑等级'];
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['1000米跑成绩'];
          end
        else  if FieldName='立定跳远' then
          begin
            dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['立定跳远等级'];
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['立定跳远成绩'];
          end
        else  if (FieldName='握力体重')or(FieldName='握力体重指数') then
          begin
            dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['握力体重指数等级'];
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['握力体重指数成绩'];
          end
        else  if (FieldName='肺活量体重')or(FieldName='肺活量体重指数') then
          begin
            dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['肺活量体重指数等级'];
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['肺活量体重指数成绩'];
          end
        else  if FieldName='坐立体前屈' then
          begin
            dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['坐立体前屈等级'];
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['坐立体前屈成绩'];
          end
        else  if FieldName='仰卧起坐' then
          begin
            dengji.Text:=DataModule1.Ddengji.DataSet.FieldValues['仰卧起坐等级'];
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['仰卧起坐成绩'];
          end
        else if (FieldName='身高')or(FieldName='体重') then
          begin
            chengjiinfo.Text:=DataModule1.Dstugreadinfo.DataSet.FieldValues['身高体重成绩'];
          end
        else
          begin
            dengji.Text:='';
            chengjiinfo.Text:='';
          end;
      end;
    end
    else
      dengji.Text:='无信息';
  end;
end;

procedure Tmainform.N2Click(Sender: TObject);
begin
mainform.Hide;
anquanform.ShowModal;
end;

procedure Tmainform.N4Click(Sender: TObject);
begin
mainform.Hide;
backform.ShowModal;
end;

procedure Tmainform.N8Click(Sender: TObject);
begin
mainform.Hide;
chaxunform.ShowModal;
end;

procedure Tmainform.SpeedButton1Click(Sender: TObject);
begin
N2.Click;
end;

procedure Tmainform.SpeedButton8Click(Sender: TObject);
begin

end;


////防止程序二次运行//////////
procedure Tmainform.N17Click(Sender: TObject);
begin
mainform.Hide;
printform.ShowModal;
end;

procedure Tmainform.N21Click(Sender: TObject);
begin
helpinfo.ShowModal;
end;

procedure Tmainform.N19Click(Sender: TObject);
begin
mainform.Hide;
zhuangkuangfenxi.ShowModal;
end;

procedure Tmainform.N23Click(Sender: TObject);
begin
mainform.Hide;
xiangxiform.ShowModal;
end;

procedure Tmainform.ToolButton3Click(Sender: TObject);
begin
n4.Click;
end;

procedure Tmainform.SpeedButton3Click(Sender: TObject);
begin
n12.Click;
end;

procedure Tmainform.SpeedButton4Click(Sender: TObject);
begin
n13.Click;
end;

procedure Tmainform.SpeedButton5Click(Sender: TObject);
begin
n16.Click;
end;

procedure Tmainform.ToolButton7Click(Sender: TObject);
begin
n8.Click;
end;

procedure Tmainform.N25Click(Sender: TObject);
begin
N17.Click;
end;

procedure Tmainform.N26Click(Sender: TObject);
begin
n23.Click;
end;

procedure Tmainform.ToolButton10Click(Sender: TObject);
begin
n19.Click;
end;

procedure Tmainform.ToolButton11Click(Sender: TObject);
begin
n6.Click;
end;

procedure Tmainform.N30Click(Sender: TObject);
begin
bsSkinData1.StoredSkin:=bsStoredSkin1;
inifile.WriteString('section','styl','1');
end;

procedure Tmainform.N31Click(Sender: TObject);
begin
bsSkinData1.StoredSkin:=bsStoredSkin2;
inifile.WriteString('section','styl','2');
end;

procedure Tmainform.N210Click(Sender: TObject);
begin
bsSkinData1.StoredSkin:=bsStoredSkin3;
inifile.WriteString('section','styl','3');
end;

procedure Tmainform.N33Click(Sender: TObject);
begin
if n33.Checked=true then
  begin
    n33.Checked:=false;
    inifile.WriteString('section','col','0');
  end
else
  begin
    n33.Checked:=true;
    inifile.WriteString('section','col','1');
  end;
end;

procedure Tmainform.N34Click(Sender: TObject);
begin
mainform.Hide;
toexcel.ShowModal;
end;


procedure tmainform.dataref;
begin
with DataModule1 do
  begin
    xibie.Close;
    banjixinxi.Close;
    xueshengxinxi.Close;
    yonghu.Close;
    stugread.Close;
    studengji.Close;
    stugreadinfo.Close;
    zdxbothstandboy.Close;
    zdxbothstandgirl.Close;
    zdxstandhboy.Close;
    zdxstandhgirl.Close;
    zgzonestandboy.Close;
    zgzonestandgirl.Close;
    zgzstandhboy.Close;
    zgzstandhgirl.Close;
    zgzthreestandboy.Close;
    zgzthreestandgirl.Close;
    zgztwostandboy.Close;
    zgztwostandgirl.Close;

    xibie.Filtered:=false;
    banjixinxi.Filtered:=false;
    xueshengxinxi.Filtered:=false;
    yonghu.Filtered:=false;
    stugread.Filtered:=false;
    studengji.Filtered:=false;
    stugreadinfo.Filtered:=false;
    zdxbothstandboy.Filtered:=false;
    zdxbothstandgirl.Filtered:=false;
    zdxstandhboy.Filtered:=false;
    zdxstandhgirl.Filtered:=false;
    zgzonestandboy.Filtered:=false;
    zgzonestandgirl.Filtered:=false;
    zgzstandhboy.Filtered:=false;
    zgzstandhgirl.Filtered:=false;
    zgzthreestandboy.Filtered:=false;
    zgzthreestandgirl.Filtered:=false;
    zgztwostandboy.Filtered:=false;
    zgztwostandgirl.Filtered:=false;

    xibie.Open;
    banjixinxi.Open;
    xueshengxinxi.Open;
    yonghu.Open;
    stugread.Open;
    studengji.Open;
    stugreadinfo.open;
    zdxbothstandboy.Open;
    zdxbothstandgirl.Open;
    zdxstandhboy.Open;
    zdxstandhgirl.Open;
    zgzonestandboy.Open;
    zgzonestandgirl.Open;
    zgzstandhboy.Open;
    zgzstandhgirl.Open;
    zgzthreestandboy.Open;
    zgzthreestandgirl.Open;
    zgztwostandboy.Open;
    zgztwostandgirl.Open;
  end;
end;



procedure tmainform.closetable;
begin
  with DataModule1 do
    begin
    xibie.Close;
    banjixinxi.Close;
    xueshengxinxi.Close;
    yonghu.Close;
    stugread.Close;
    studengji.Close;
    stugreadinfo.Close;
    zdxbothstandboy.Close;
    zdxbothstandgirl.Close;
    zdxstandhboy.Close;
    zdxstandhgirl.Close;
    zgzonestandboy.Close;
    zgzonestandgirl.Close;
    zgzstandhboy.Close;
    zgzstandhgirl.Close;
    zgzthreestandboy.Close;
    zgzthreestandgirl.Close;
    zgztwostandboy.Close;
    zgztwostandgirl.Close;
    end;
end;




procedure tmainform.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
   with msg.minmaxinfo^ do

    begin
      ptMinTrackSize:=point(817,515);//  限定大小
      ptMaxTrackSize:=point(817,515); // 限定大小
    end;
end;


procedure Tmainform.N32Click(Sender: TObject);
begin
try
ShellExecute(handle,nil,pchar(ExtractFileDir(Application.ExeName)+'\help.chm'),nil,nil,sw_shownormal);
except
abort;
end;
end;

procedure Tmainform.ToolButton2Click(Sender: TObject);
begin
n34.Click;
end;

procedure Tmainform.N40Click(Sender: TObject);
begin
chushiform.ShowModal;
end;

initialization
hnd := CreateMutex(nil, True, 'irgendwaseinmaliges');
if GetLastError = ERROR_ALREADY_EXISTS then  Halt;

finalization
if hnd <> 0 then
begin
  CloseHandle(hnd);
end;




end.
