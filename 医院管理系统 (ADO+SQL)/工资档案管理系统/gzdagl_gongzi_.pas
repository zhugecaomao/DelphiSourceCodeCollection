unit gzdagl_gongzi_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls;

type
  TForm_gongzi = class(TForm)
    pagecontrol1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit_no: TEdit;
    Edit_jbie: TEdit;
    Edit_gangwei: TEdit;
    Edit_base: TEdit;
    Edit_gongling: TEdit;
    Edit_other: TEdit;
    Edit_zhiwu: TEdit;
    Bevel1: TBevel;
    gongzi_BTyes: TBitBtn;
    gongzi_BTno: TBitBtn;
    gongzi_BTnext: TBitBtn;
    GroupBox1: TGroupBox;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit_butie_no: TEdit;
    Edit_yiliao: TEdit;
    Edit_zonghe: TEdit;
    Edit_wucan: TEdit;
    Edit_fudong: TEdit;
    Edit_oth: TEdit;
    Edit_zhufang: TEdit;
    Edit_tebie: TEdit;
    butie_BTyes: TBitBtn;
    butie_BTno: TBitBtn;
    Bevel2: TBevel;
    butie_BTnext: TBitBtn;
    GroupBox2: TGroupBox;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    Label17: TLabel;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit_kouchu_no: TEdit;
    Edit_yanglao: TEdit;
    Edit_kouchu_yiliao: TEdit;
    Edit_house: TEdit;
    Edit_kouchu_other: TEdit;
    kouchu_BTyes: TBitBtn;
    kouchu_BTno: TBitBtn;
    kouchu_BTnext: TBitBtn;
    Bevel3: TBevel;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    DBNavigator3: TDBNavigator;
    Label23: TLabel;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    Label24: TLabel;
    Edit_yggongzi_no: TEdit;
    yggongzi_BT_jisuan: TBitBtn;
    yggongzi_BT_add: TBitBtn;
    GroupBox4: TGroupBox;
    DBNavigator4: TDBNavigator;
    DBGrid4: TDBGrid;
    procedure gongzi_BTyesClick(Sender: TObject);
    procedure Edit_noChange(Sender: TObject);
    procedure gongzi_BTnoClick(Sender: TObject);
    
    procedure gongzi_BTnextClick(Sender: TObject);
    procedure butie_BTyesClick(Sender: TObject);
    procedure Edit_butie_noChange(Sender: TObject);
    procedure butie_BTnoClick(Sender: TObject);
    procedure butie_BTnextClick(Sender: TObject);
    procedure Edit_kouchu_noChange(Sender: TObject);
    procedure kouchu_BTyesClick(Sender: TObject);
    procedure kouchu_BTnoClick(Sender: TObject);
    procedure kouchu_BTnextClick(Sender: TObject);
    procedure yggongzi_BT_jisuanClick(Sender: TObject);
    procedure yggongzi_BT_addClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    function yggongzi_jisuan(const s_no:string):boolean;//声明yggongzi_jisuan函数
    function zq:boolean;//申明判断输入是否完整的函数
  public
    { Public declarations }
  end;

var
  Form_gongzi: TForm_gongzi;

implementation

uses gzdagl_DM_;

{$R *.dfm}
//调用zq函数
  function Tform_gongzi.zq:boolean;
    var i:integer;//循环变量
        t:boolean;//中间变量
        bh:string;
    begin
      result:=false;   //初始化为不完整输入
      //效验预算工资和预算补贴记录是否相等
      t:=DMgzdagl.ADOTgongzi.RecordCount=DMgzdagl.ADOTbutie.RecordCount;
      //效验预算工资和预算扣除记录是否相等
      t:=DMgzdagl.ADOTgongzi.RecordCount=DMgzdagl.ADOTkouchu.RecordCount;
      if not t then exit;//不相等，表明资料不一致
      DMgzdagl.ADOTgongzi.First;//否则进一步判断
      for i:=0 to DMgzdagl.ADOTgongzi.RecordCount-1 do//顺次扫描薪水表中员工编号
        begin  //在预算补贴表和预算扣除表中是否都存在
          bh:=DMgzdagl.ADOTgongzi.Fields[0].Value;//有一个不存在表示资料不整齐，退出
          if (DMgzdagl.ADOTbutie.Locate('员工编号',bh,[])=false)or (DMgzdagl.ADOTkouchu.Locate('员工编号',bh,[])=false) then exit;
             DMgzdagl.ADOTgongzi.Next;
        end;
        result:=true;//通过检验，说明资料完整
     end;     

//调用yggongzi_jisuan函数
     function Tform_gongzi.yggongzi_jisuan(const s_no:string):boolean;//参数：员工编号
    var
    syz,syb,syk:real;//中间变量，保存预算内总工资，预算内总补贴，总扣除
     begin
      result:=false;//初始化结果
      if DMgzdagl.ADOTemployee.Locate('员工编号',s_no,[])=false then//检验编号合法性
         begin
         messagedlg('编号不存在',mterror,[mbok],0);
         exit;
         end;
      if DMgzdagl.ADOTgongzi.Locate('员工编号',s_no,[])=false then //查看是否有预算内工资
         begin
         messagedlg('缺预算内工资资料！',mterror,[mbok],0);
         pagecontrol1.ActivePageIndex :=0;//返回第一页
         exit;
         end;
         syz:=DMgzdagl.ADOTgongzi.fieldbyname('小计').asfloat;//取预算内工资，并赋值给变量syz
      if DMgzdagl.ADOTbutie.Locate('员工编号',s_no,[])=false then//查看是否有该员工的预算内补贴工资
         begin
         messagedlg('缺少预算内补贴资料',mterror,[mbok],0);
         pagecontrol1.Activepageindex:=1;//返回第二页
         exit;
         end;
         syb:=DMgzdagl.ADOTbutie.Fieldbyname('小计').asfloat;//取补贴的总工资
      if DMgzdagl.ADOTkouchu.locate('员工编号',s_no,[])=false then//查看是否有扣除工资数据
         begin
         messagedlg('缺少扣除工资资料！',mterror,[mbok],0);
         pagecontrol1.ActivePageIndex:=2;//返回第三页
         exit;
         end;
         syk:=DMgzdagl.ADOTkouchu.Fieldbyname('小计').asfloat;//取扣除总工资
         //计算实际工资
      if DMgzdagl.ADOTemployee.Locate('员工编号',s_no,[])=true then//如果有该员工编号
         begin
         DMgzdagl.ADOTemployee.edit;
         DMgzdagl.ADOTemployee.Fieldbyname('工资').asfloat:=syz+syb-syk;
         DMgzdagl.ADOTemployee.post;
         result:=true;
         end;
       end;

procedure TForm_gongzi.gongzi_BTyesClick(Sender: TObject);
var
s:real;//统计中间变量
begin
   //判断员工编号必须不存在薪水表中，但有要存在于员工信息表中
   //确保有该员工的基本资料，便于计算工资，否则不与录入
   if (DMgzdagl.ADOTgongzi.Locate('员工编号',edit_no.Text,[])=false) and  (DMgzdagl.ADOTemployee.Locate('员工编号',edit_no.Text,[])=true) then
      with DMgzdagl.ADOTgongzi do
      begin
        append;
        DMgzdagl.ADOTgongzi.FieldByName('员工编号').asstring:=edit_no.Text;
        DMgzdagl.ADOTgongzi.FieldByName('基本工资').AsString:=edit_base.text;
        DMgzdagl.ADOTgongzi.FieldByName('职位工资').asstring:=edit_zhiwu.Text;
        DMgzdagl.ADOTgongzi.FieldByName('级别工资').asstring:=edit_jbie.Text;
        DMgzdagl.ADOTgongzi.FieldByName('工龄工资').asstring:=edit_gongling.Text;
        DMgzdagl.ADOTgongzi.FieldByName('岗位工资').asstring:=edit_gangwei.Text;
        DMgzdagl.ADOTgongzi.FieldByName('其他').asstring:=edit_other.Text;
        //统计
        s:=strtofloat(edit_base.Text)+strtofloat(edit_zhiwu.Text)+
        strtofloat(edit_jbie.Text)+strtofloat(edit_gongling.Text)+
        strtofloat(edit_gangwei.Text)+strtofloat(edit_other.Text);
        //录入小计
        DMgzdagl.ADOTgongzi.FieldByName('小计').asfloat:=s;
        Post;
        Refresh;
        messagedlg('预算工资数据已经成功录入！',mtinformation,[mbok],0);
        gongzi_BTnext.Enabled:=true; //gongzi_BTnext按钮enabled属性可用
        end
     else
         messagedlg('记录已经存在或则员工编号不存在，请重新输入！',mtError,[mbok],0);
end;

procedure TForm_gongzi.Edit_noChange(Sender: TObject);
begin
//控制进入预算工资页时按钮gongzi_BTyes的enabled属性
if length(edit_no.Text)>0 then
  gongzi_BTyes.Enabled:=true
else
  gongzi_BTyes.Enabled:=false;
end;

procedure TForm_gongzi.gongzi_BTnoClick(Sender: TObject);
begin
//清空输入框，或置零
edit_no.Clear;
edit_base.Text:='0';
edit_zhiwu.Text:='0';
edit_jbie.Text:='0';
edit_gongling.Text:='0';
edit_gangwei.Text:='0';
edit_other.Text:='0';
edit_no.SetFocus;//获得焦点
end;



procedure TForm_gongzi.gongzi_BTnextClick(Sender: TObject);
begin
//edit_butie_no是第二页的员工编号输入框
//把本页的员工编号传递过去，减少输入错误
edit_butie_no.Text:=edit_no.Text;
pagecontrol1.ActivePageIndex:=1;//进入第二页进行补贴输入
end;

procedure TForm_gongzi.butie_BTyesClick(Sender: TObject);
var
s:real;//统计中间变量
begin
   //判断员工编号必须不存在补贴表中，但有要存在于员工信息表中
   //确保有该员工的基本资料，便于计算工资，否则不与录入
   if (DMgzdagl.ADOTbutie.Locate('员工编号',edit_butie_no.Text,[])=false) and  (DMgzdagl.ADOTemployee.Locate('员工编号',edit_butie_no.Text,[])=true) then
      with DMgzdagl.ADOTbutie  do
      begin
        append;
        DMgzdagl.ADOTbutie.FieldByName('员工编号').asstring:=edit_butie_no.Text;
        DMgzdagl.ADOTbutie.FieldByName('综合补贴').AsString:=edit_zonghe.text;
        DMgzdagl.ADOTbutie.FieldByName('误餐补贴').asstring:=edit_wucan.Text;
        DMgzdagl.ADOTbutie.FieldByName('住房补贴').asstring:=edit_zhufang.Text;
        DMgzdagl.ADOTbutie.FieldByName('医疗补贴').asstring:=edit_yiliao.Text;
        DMgzdagl.ADOTbutie.FieldByName('浮动工资').asstring:=edit_fudong.Text;
        DMgzdagl.ADOTbutie.FieldByName('特殊津贴').asstring:=edit_tebie.Text;
        DMgzdagl.ADOTbutie.FieldByName('其它').asstring:=edit_oth.Text;
        //统计
        s:=strtofloat(edit_zonghe.Text)+strtofloat(edit_wucan.Text)+
        strtofloat(edit_zhufang.Text)+strtofloat(edit_yiliao.Text)+
        strtofloat(edit_fudong.Text)+strtofloat(edit_tebie.Text)+strtofloat(edit_oth.Text);
        //录入小计
        DMgzdagl.ADOTbutie.FieldByName('小计').asfloat:=s;
        Post;
        Refresh;
        messagedlg('预算补贴数据已经成功录入！',mtinformation,[mbok],0);
         butie_BTnext.Enabled:=true; //butie_BTnext按钮enabled属性可用
        end
     else
         messagedlg('记录已经存在或则员工编号不存在，请重新输入！',mtError,[mbok],0);
end;

procedure TForm_gongzi.Edit_butie_noChange(Sender: TObject);
begin
//控制进入预算内补贴页时按钮butie_BTyes的enabled属性
if length(edit_butie_no.Text)>0 then
  butie_BTyes.Enabled:=true
else
  butie_BTyes.Enabled:=false;
end;

procedure TForm_gongzi.butie_BTnoClick(Sender: TObject);
begin
//清零
edit_butie_no.Clear;
edit_zonghe.Text:='0';
edit_wucan.Text:='0';
edit_zhufang.Text:='0';
edit_yiliao.Text:='0';
edit_fudong.Text:='0';
edit_tebie.Text:='0';
edit_oth.Text:='0';
edit_butie_no.SetFocus;//获得焦点
end;

procedure TForm_gongzi.butie_BTnextClick(Sender: TObject);
begin
//edit_kouchu_no是第三页的员工编号输入框
//把本页的员工编号传递过去，减少输入错误
edit_kouchu_no.Text:=edit_butie_no.Text;
pagecontrol1.ActivePageIndex:=2;//进入第三页进行扣除输入
end;

procedure TForm_gongzi.Edit_kouchu_noChange(Sender: TObject);
begin
//控制进入扣除工资页时按钮kouchu_BTyes的enabled属性
if length(edit_kouchu_no.Text)>0 then
  kouchu_BTyes.Enabled:=true
else
  kouchu_BTyes.Enabled:=false;
end;

procedure TForm_gongzi.kouchu_BTyesClick(Sender: TObject);
var
s1:real;
begin
      //判断员工编号必须不存在扣除表中，但有要存在于员工信息表中
   //确保有该员工的基本资料，便于计算工资，否则不与录入
   if (DMgzdagl.ADOTkouchu.Locate('员工编号',edit_kouchu_no.Text,[])=false) and  (DMgzdagl.ADOTemployee.Locate('员工编号',edit_kouchu_no.Text,[])=true) then
      with DMgzdagl.ADOTkouchu  do
      begin
        append;
        DMgzdagl.ADOTkouchu .FieldByName('员工编号').asstring:=edit_kouchu_no.Text;
        DMgzdagl.ADOTkouchu .FieldByName('住房公积').AsString:=edit_house.text;
        DMgzdagl.ADOTkouchu .FieldByName('养老基金').asstring:=edit_yanglao.Text;
        DMgzdagl.ADOTkouchu .FieldByName('医疗基金').asstring:=edit_kouchu_yiliao.Text;
        DMgzdagl.ADOTkouchu.FieldByName('其它').asstring:=edit_kouchu_other.Text;
        //统计
        s1:=strtofloat(edit_house.Text)+strtofloat(edit_yanglao.Text)+
        strtofloat(edit_kouchu_yiliao.Text)+strtofloat(edit_kouchu_other.Text);
        //录入小计
        DMgzdagl.ADOTkouchu.FieldByName('小计').asfloat:=s1;
        Post;
        Refresh;
        messagedlg('扣除工资已经成功录入！',mtinformation,[mbok],0);
         kouchu_BTnext.Enabled:=true; //kouchu_BTnext按钮enabled属性可用
        end
     else
         messagedlg('记录已经存在或则员工编号不存在，请重新输入！',mtError,[mbok],0);
end;

procedure TForm_gongzi.kouchu_BTnoClick(Sender: TObject);
begin
//清'0'
edit_kouchu_no.Clear;
edit_house.Text:='0';
edit_yanglao.Text:='0';
edit_kouchu_yiliao.Text:='0';
edit_kouchu_other.Text:='0';
edit_kouchu_no.SetFocus;//获得焦点
end;

procedure TForm_gongzi.kouchu_BTnextClick(Sender: TObject);
begin
edit_yggongzi_no.text:=edit_kouchu_no.Text;//第四页的'员工编号'被赋值
pagecontrol1.ActivePageIndex:=3;//转到第四页
end;

procedure TForm_gongzi.yggongzi_BT_jisuanClick(Sender: TObject);
begin
  if edit_yggongzi_no.text<>''then //根据员工编号计算
     if yggongzi_jisuan(edit_yggongzi_no.Text) then//调用函数计算出工资
        messagedlg('计算员工工资完毕！',mtinformation,[mbok],0);
end;

procedure TForm_gongzi.yggongzi_BT_addClick(Sender: TObject);
begin
pagecontrol1.ActivePageIndex:=0;//返回第一页
gongzi_BTno.OnClick(self);
edit_butie_no.Clear;
edit_kouchu_no.Clear;//清'0'
end;

procedure TForm_gongzi.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if not zq then //调用zq函数，检验录入是否完整
 if messagedlg('员工资料未输入完或者资料不一致，确定要退出吗？',mtconfirmation,[mbyes,mbno],0)=mrno then
 canclose:=false;
end;

procedure TForm_gongzi.FormShow(Sender: TObject);
begin
if not zq then  //如果资料不完整，提示用户
messagedlg('员工工资资料不完整，请先整理资料！',mtinformation,[mbok],0);
end;

end.
