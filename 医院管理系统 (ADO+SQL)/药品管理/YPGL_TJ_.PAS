unit ypgl_tj_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, XPMenu;

type
  TFaddyp = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Ebh: TEdit;
    Label2: TLabel;
    Emc: TEdit;
    Label3: TLabel;
    Ejj: TEdit;
    Label4: TLabel;
    Esj: TEdit;
    Label5: TLabel;
    Ezxjg: TEdit;
    Label6: TLabel;
    Edgl: TEdit;
    Label7: TLabel;
    Egg: TEdit;
    Label8: TLabel;
    Edwsl: TEdit;
    Label12: TLabel;
    Egysbh: TEdit;
    Label9: TLabel;
    DTimegq: TDateTimePicker;
    Label10: TLabel;
    DTimedg: TDateTimePicker;
    Label11: TLabel;
    DTimerk: TDateTimePicker;
    Label13: TLabel;
    Ezxdw: TEdit;
    BB_addyp: TBitBtn;
    BB_exit: TBitBtn;
    XPMenu1: TXPMenu;
    procedure BB_addypClick(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure EgysbhKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Faddyp: TFaddyp;

implementation

uses DMypgl_, ypgl_gys_mc_;


{$R *.dfm}

procedure TFaddyp.BB_addypClick(Sender: TObject);
begin
  try
  //是adotypgl处于编辑状态
          DMypgl.ADOTypgl.Edit;
          //判断是否提交相同编号的药品编号
          if DMypgl.ADOTypgl.locate('编号',Ebh.Text,[])=false then
             //添加药品
             DMypgl.ADOTypgl.Append;
             DMypgl.ADOTypgl.FieldByName('编号').AsString:=Ebh.text;
             DMypgl.ADOTypgl.FieldByName('药品名称').AsString:=Emc.text;
             DMypgl.ADOTypgl.FieldByName('进价').asfloat:=strtofloat(Ejj.text);
             DMypgl.ADOTypgl.FieldByName('售价').Asfloat:=strtofloat(Esj.text);
             DMypgl.ADOTypgl.FieldByName('最小价格').Asfloat:=strtofloat(Ezxjg.text);
             DMypgl.ADOTypgl.FieldByName('订购量').asinteger:=strtoint(Edgl.text);
             DMypgl.ADOTypgl.FieldByName('过期时间').asdatetime:=DTimegq.date;
             DMypgl.ADOTypgl.FieldByName('订购时间').Asdatetime:=DTimedg.date;
             DMypgl.ADOTypgl.FieldByName('入库时间').Asdatetime:=DTimerk.date;
             DMypgl.ADOTypgl.FieldByName('规格').AsString:=Egg.text;
             DMypgl.ADOTypgl.FieldByName('单位数量').asstring:=Edwsl.text;
             DMypgl.ADOTypgl.FieldByName('供应商编号').asstring:=Egysbh.text;
             DMypgl.ADOTypgl.FieldByName('最小单位').AsString:=Ezxdw.Text;
             DMypgl.ADOTypgl.FieldByName('库存量').AsInteger:=strtoint(Edgl.Text);
             DMypgl.ADOTypgl.Post;

             //如果添加成功就显示提示窗体
             showmessage('添加成功');
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
                
      except
         showmessage('添加有误，请重新输入');
   end;


end;

procedure TFaddyp.BB_exitClick(Sender: TObject);
begin
DMypgl.ADOTypgl.Cancel; //取消添加
//清空edit
               Ebh.text:='';
               Emc.Text:='';
               Ejj.text:='';
               Esj.Text:='';
               Ezxjg.Text:='';
               Edgl.Text:='';
               Egg.Text:='';
               Edwsl.Text:='';
               Egysbh.Text:='';
               Ezxdw.Text:='';
end;

procedure TFaddyp.EgysbhKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      if Egysbh.text<>'' then
        begin
          DMypgl.ADOQgys.Close;
           //给参数赋值
           DMypgl.ADOQgys.Parameters.ParamByName('供应商编号').Value:=Egysbh.Text+'%';
           //执行sql语句
           DMypgl.ADOQgys.Open;
           Fgysmc.ShowModal;
        end;
     end;      
end;

procedure TFaddyp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Egg.Clear;
Ebh.Clear;
Emc.Clear;
Ezxdw.Clear;
Egysbh.Clear;
Esj.Text:='0';
Ezxjg.Text:='0';
Edwsl.Text:='0';
Ejj.Text:='0';
Edgl.Text:='0';
end;

end.

