unit ypgl_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, dbcgrids, DBCtrls, StdCtrls,
  Mask, Buttons, ToolWin, TeEngine, Series, TeeProcs, Chart, DbChart,
  XPMenu;

type
  Typgl = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Eypcx_bh: TEdit;
    Eypcx_mc: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label12: TLabel;
    Label13: TLabel;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    ControlBar2: TControlBar;
    addgys: TBitBtn;
    deletegys: TBitBtn;
    BTgysbb: TButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    add: TBitBtn;
    delete: TBitBtn;
    BTypbb: TBitBtn;
    Panel6: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DateTimedate: TDateTimePicker;
    DBEdit14: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label16: TLabel;
    DBEgysbh: TDBEdit;
    Label17: TLabel;
    DBEgysmc: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit21: TDBEdit;
    Label25: TLabel;
    DBEdit22: TDBEdit;
    Label26: TLabel;
    DBEdit23: TDBEdit;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    DBGrid3: TDBGrid;
    Bevel2: TBevel;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    Egyscx_bh: TEdit;
    Button_gyscx_bh: TButton;
    Label28: TLabel;
    Egyscx_mc: TEdit;
    Button_gyscx_mc: TButton;
    GroupBox4: TGroupBox;
    BitBtnjtcx: TBitBtn;
    Editgj: TEdit;
    Editdq: TEdit;
    Editcs: TEdit;
    RadioButtonjq: TRadioButton;
    RadioButtonmh: TRadioButton;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    XPMenu1: TXPMenu;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    
    procedure addClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure Button_gyscx_bhClick(Sender: TObject);
    procedure Button_gyscx_mcClick(Sender: TObject);
    procedure DBEgysbhDblClick(Sender: TObject);
    procedure addgysClick(Sender: TObject);
    procedure deletegysClick(Sender: TObject);
    procedure BTypbbClick(Sender: TObject);
    procedure BTgysbbClick(Sender: TObject);
    

    
    procedure DBEdit1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtnjtcxClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ypgl: Typgl;
  selectstr:string;//查询条件
implementation

uses DMypgl_, ypgl_xg_tj_, ypgl_tj_, gys_modify_, gys_add_, ypbb_, gysbb_,
  GQYPBB_, QHGYSBB_, gqypForm_, ypcx_2_, ypcx_3_, qhgysForm_, gysjtcxForm_;

{$R *.dfm}

procedure Typgl.Button1Click(Sender: TObject);
begin
 if Eypcx_bh.text<>'' then
 //按药品编号查询
   begin
   DMypgl.ADOTypgl.locate('编号',Eypcx_bh.Text,[]);
     if DBEdit1.Text <> Eypcx_bh.Text then
        begin
         showmessage('没有此编号');
        end;
        Eypcx_bh.Text:='';
        //获得焦点
        Eypcx_bh.SetFocus;
   end
  else
    begin
     showmessage('没有填写编号');
     //获得焦点
     Eypcx_bh.SetFocus;
    end;
end;


procedure Typgl.Button2Click(Sender: TObject);
begin
 if Eypcx_mc.text<>'' then
 //按药品名称查询
   begin
   DMypgl.ADOTypgl.locate('药品名称',Eypcx_mc.Text,[]);
     if DBEdit2.Text <> Eypcx_mc.Text then
        begin
         showmessage('没有这种药');
        end;
        Eypcx_mc.Text:='';
        //获得焦点
        Eypcx_mc.SetFocus;
   end
  else
    begin
     showmessage('没有填写药品名称');
     //获得焦点
     Eypcx_mc.SetFocus;
    end;
end;

procedure Typgl.FormActivate(Sender: TObject);
begin
//在edit1中显示当前时间
   DateTimedate.date:=now();
//系统判断是否有过期药品
   if DMypgl.ADOQypgq.RecordCount<>0 then
      begin
         Formgqyp.ShowModal;
      end;
//系统判断是否有欠货供应商
    if DMypgl.ADOQqhgys.RecordCount<>0 then
       begin
         Formqhgys.ShowModal;
       end;
end;





procedure Typgl.addClick(Sender: TObject);
begin
//显示药品添加窗体
   Faddyp.ShowModal;
end;

procedure Typgl.deleteClick(Sender: TObject);
begin
//判断药品表中有无数据
  if DMypgl.ADOTypgl.recordcount=0 then
    begin
    showmessage('没有任何药品');
    end
   else
   //果要点击消息框中的确定既删除
       DMypgl.adotypgl.Edit;
        if messagedlg('确定要删除吗？',mtconfirmation,[mbno,mbyes],2)=mryes then
         DMypgl.adotypgl.Delete;
 //更新数据集
                DMypgl.ADOTypgl.Close;
                DMypgl.ADOTypgl.Open;

                DMypgl.adotgys.Close;
                DMypgl.ADOTgys.Open;

                Dmypgl.ADOQypgq.Close;
                Dmypgl.ADOQypgq.Open;

                DMypgl.ADOQyp_xg_tj.Close;
                DMypgl.ADOQyp_xg_tj.Open;

                DMYpgl.ADOQgys.Close;
                DMypgl.adoqgys.Open;

                DMypgl.ADOTyp.Close;
                DMypgl.ADOTyp.Open;

                DMypgl.ADOTgys2.Close;
                DMypgl.ADOTgys2.Open;

                DMypgl.ADOQgys_modify.Close;
                DMypgl.ADOQgys_modify.Open;

                DMypgl.ADOQqhgys.Close;
                DMypgl.adoqqhgys.Open;
      end;

procedure Typgl.Button_gyscx_bhClick(Sender: TObject);
begin
 if Egyscx_bh.text<>''then
    //按供应商编号查询
    begin
    DMypgl.ADOTgys2.Locate('供应商编号',Egyscx_bh.text,[]);
      if DBEgysbh.text<>Egyscx_bh.Text then
        begin
        showmessage('没有此编号');
        end;
        Egyscx_bh.Text:='';
        Egyscx_bh.SetFocus;
     end
  else
     begin
       showmessage('没有填写供应商编号');
      //获得焦点
        Egyscx_bh.SetFocus;
     end;

end;

procedure Typgl.Button_gyscx_mcClick(Sender: TObject);
begin
 if Egyscx_mc.text<>''then
    //按供应商名称查询
    begin
    DMypgl.ADOTgys2.Locate('供应商名称',Egyscx_mc.text,[]);
      if DBEgysmc.text<>Egyscx_mc.Text then
        begin
        showmessage('没有此名称');
        end;
        Egyscx_mc.Text:='';
        Egyscx_mc.SetFocus;
     end
  else
     begin
       showmessage('没有填写供应商名称');
      //获得焦点
        Egyscx_mc.SetFocus;
     end;

end;

procedure Typgl.DBEgysbhDblClick(Sender: TObject);
begin
DMypgl.ADOQgys_modify.Close;//先关闭adoqgys_modify
//给adqgys_modify的'编号'赋值
DMypgl.ADOQgys_modify.Parameters.ParamByName('供应商编号').value:=DMypgl.ADOTgys2.Fields.fieldbyname('供应商编号').AsString;
DMypgl.ADOQgys_modify.Open;
DMypgl.ADOQgys_modify.Refresh;
//显示Fgys_modify窗口
Fgys_modify.ShowModal;
end;





procedure Typgl.addgysClick(Sender: TObject);
begin
Faddgys.showmodal;
end;

procedure Typgl.deletegysClick(Sender: TObject);
begin
//判断供应商表中有无数据
  if DMypgl.adotgys2.recordcount=0 then
    begin
    showmessage('没有任何供应商');
    end
   else
   //果要点击消息框中的确定既删除
       DMypgl.adotgys2.Edit;
        if messagedlg('确定要删除吗？',mtconfirmation,[mbno,mbyes],2)=mryes then
         DMypgl.adotgys2.Delete;
 //更新数据集
                DMypgl.ADOTypgl.Close;
                DMypgl.ADOTypgl.Open;

                DMypgl.adotgys.Close;
                DMypgl.ADOTgys.Open;

                Dmypgl.ADOQypgq.Close;
                Dmypgl.ADOQypgq.Open;

                DMypgl.ADOQyp_xg_tj.Close;
                DMypgl.ADOQyp_xg_tj.Open;

                DMYpgl.ADOQgys.Close;
                DMypgl.adoqgys.Open;

                DMypgl.ADOTyp.Close;
                DMypgl.ADOTyp.Open;

                DMypgl.ADOTgys2.Close;
                DMypgl.ADOTgys2.Open;

                DMypgl.ADOQgys_modify.Close;
                DMypgl.ADOQgys_modify.Open;

                DMypgl.ADOQqhgys.Close;
                DMypgl.adoqqhgys.Open;
      end;

procedure Typgl.BTypbbClick(Sender: TObject);
begin
Formypbb.QuickRep1.Preview;
end;

procedure Typgl.BTgysbbClick(Sender: TObject);
begin
Formgysbb.QuickRep1.Preview;
end;





procedure Typgl.DBEdit1DblClick(Sender: TObject);
begin
DMypgl.ADOQyp_xg_tj.Close;//先关闭adoqyp_xg_tj
//给adqyp_xg_tj的'编号'赋值
DMypgl.ADOQyp_xg_tj.Parameters.ParamByName('编号').value:=DMypgl.ADOTypgl.Fields.fieldbyname('编号').AsString;
//给过期时间赋值
ypgl_xg_tj.DateTimegq.Date:=DMypgl.ADOTypgl.FieldValues['过期时间'];
//给订购时间赋值
ypgl_xg_tj.DateTimedg.Date:=DMypgl.ADOTypgl.FieldValues['订购时间'];
//给入库时间赋值
ypgl_xg_tj.DateTimerk.Date:=DMypgl.ADOTypgl.FieldValues['入库时间'];
//打开adoqyp_xg_tj
DMypgl.ADOQyp_xg_tj.Open;
DMypgl.adoqyp_xg_tj.Refresh;
//显示ypgl_xg_tj窗口
ypgl_xg_tj.ShowModal;
end;





procedure Typgl.BitBtn1Click(Sender: TObject);
begin
     //参数赋值
       DMypgl.ADOQypcx.Close;
       Dmypgl.ADOQypcx.Parameters.ParamByName('始时间').Value:=(DateTimePicker1.date-1);//因为。。。还是不懂
       DMypgl.ADOQypcx.Parameters.ParamByName('终时间').Value:=DateTimePicker2.date;
       DMypgl.ADOQypcx.Open;//执行sql语句

     if DMypgl.ADOQypcx.RecordCount=0 then
     begin
       showmessage('没有您所要的资料！！');
       exit;
     end
     else
     Formypcx_2.ShowModal;
     end;


procedure Typgl.BitBtn2Click(Sender: TObject);
begin
     //参数赋值
       DMypgl.ADOQypcx2.Close;
       Dmypgl.ADOQypcx2.Parameters.ParamByName('始').Value:=(DateTimePicker3.date-1);//因为。。。还是不懂
       DMypgl.ADOQypcx2.Parameters.ParamByName('终').Value:=DateTimePicker4.date;
       DMypgl.ADOQypcx2.Open;//执行sql语句

     if DMypgl.ADOQypcx2.RecordCount=0 then
     begin
       showmessage('没有您所要的资料！！');
       exit;
     end
     else
     Formypcx_3.ShowModal;
     end;

procedure Typgl.BitBtnjtcxClick(Sender: TObject);
var
str:string;
begin
  if radiobuttonjq.Checked then
      begin
      str:='select * from 供应商表 where 国家='+''''+editgj.Text+''''+'and 地区='+''''+editdq.Text+''''+'and 城市='+''''+editcs.Text+'''';
        DMypgl.ADOQjtcx.Close;
        DMypgl.ADOQjtcx.SQL.Clear;
        DMypgl.ADOQjtcx.SQL.Add(str);
        DMYpgl.ADOQjtcx.Open;
      if DMypgl.ADOQjtcx.RecordCount=0 then
         begin
           showmessage('Sorry,没有吻合的记录！！');
         end
       else
         Formgysjtcx.ShowModal;   
      end
   else if radiobuttonmh.Checked then
       begin
       str:='select * from 供应商表 where 国家='+''''+editgj.Text+''''+'or 地区='+''''+editdq.Text+''''+'or 城市='+''''+editcs.Text+'''';
          DMypgl.ADOQjtcx.Close;
          DMypgl.ADOQjtcx.SQL.Clear;
          DMypgl.ADOQjtcx.SQL.Add(str);
          DMYpgl.ADOQjtcx.Open;
      if DMypgl.ADOQjtcx.RecordCount=0 then
         begin
           showmessage('Sorry,没有吻合的记录！！');
         end
       else
           Formgysjtcx.ShowModal;

   end;
end;


end.












