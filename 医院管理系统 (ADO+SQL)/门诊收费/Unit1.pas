unit Unit1;

interface

uses
  unit2,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Mask, DB;

type
  Tmzsf = class(TForm)
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    bh: TEdit;
    rq: TEdit;
    fy: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    sl: TEdit;
    Label6: TLabel;
    mc: TEdit;
    Label11: TLabel;
    ss: TEdit;
    Label12: TLabel;
    zb: TEdit;
    Button1: TButton;
    Label13: TLabel;
    zj: TEdit;
    Button2: TButton;
    Mdtzj: TEdit;
    Label8: TLabel;
    RichEdit1: TRichEdit;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure bhKeyPress(Sender: TObject; var Key: Char);
    procedure slKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure ssKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
 private
    { Private declarations }
   
  public
    { Public declarations }
  end;

var
  mzsf: Tmzsf;

implementation

uses Unit3, Unit4;

{$R *.dfm}


procedure Tmzsf.FormCreate(Sender: TObject);
begin
mzsf.WindowState:=wsmaximized;
button2.Enabled:=false;//button2状态不可用，直到填入了收费值
end;

procedure Tmzsf.Edit1Change(Sender: TObject);
begin
DMmzsf.ADOTyp.filtered:=false;
DMmzsf.ADOTyp.filtered:=true;
button2.Enabled:=false;//button2状态不可用，直到填入了收费值
end;



procedure Tmzsf.bhKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
   if trim(mzsf.bh.Text)<>'' then
      begin
           DMmzsf.ADOQmzsf.Close;
           //给参数赋值
           DMmzsf.ADOQmzsf.Parameters.ParamByName('编号').Value:=trim(mzsf.bh.Text)+'%';
           //执行sql
           DMmzsf.ADOQmzsf.open;
           ypjgview.ShowModal;
           bh.ReadOnly:=true;//编号edit状态为只读
           button2.Enabled:=false;//button2状态不可用，直到填入了收费值
      end;
end;
end;

procedure Tmzsf.slKeyPress(Sender: TObject; var Key: Char);
var
 strA,strB:string;
begin
  if key=#13 then
     begin
      try
     //根据数量计算费用
       if bh.Text<>'' then
         fy.text:=floattostr(strtofloat(sl.Text)*strtofloat(ypjgview.DBEsj.Text));
         fy.Enabled:=false;
         fy.ReadOnly:=true;
      //累计总费用
         strA:=fy.Text;
         strB:=zj.text;
         zj.Text:=floattostr(strtofloat(strB)+strtofloat(strA));
         //控制edit状态
         zj.Enabled:=false;
         zj.ReadOnly:=true;
         sl.enabled:=false;
         sl.ReadOnly:=true;
         button2.Enabled:=false;//button2状态不可用，直到填入了收费值
       except
         begin
         sl.Text:='';
         showmessage('数量输入不真确，请再输入');
         end;
       end;
     end;
 end;

procedure Tmzsf.Button1Click(Sender: TObject);
begin
 try
//提价数据库
        DMmzsf.ADOTmzsf.Append;
        DMmzsf.ADOTmzsf.FieldByName('编号').AsString:=bh.Text;
        DMmzsf.ADOTmzsf.FieldByName('数量').asinteger:=strtoint(sl.Text);
        DMmzsf.ADOTmzsf.FieldByName('费用').asfloat:=strtofloat(fy.Text);
        DMmzsf.ADOTmzsf.FieldByName('日期').asdatetime:=strtodate(rq.Text);
        DMmzsf.ADOTmzsf.Post;
        //为打印输出参数
       richedit1.Lines.Add('药品名称：'+mc.text+'  售价：$'+fy.text);
  except
        showmessage('不合法的输入');
  end;
        //刷新
        DMmzsf.ADOTmzsf.Close;
        DMmzsf.ADOTmzsf.Open;
        //清空edit中的值
        bh.Text:='';
        fy.Text:='';
        mc.Text:='';
        sl.text:='';
        bh.SetFocus;
        bh.Enabled:=true;
        bh.ReadOnly:=false;
        sl.Enabled:=true;
        sl.ReadOnly:=false;
        button2.Enabled:=false;//button2状态不可用，直到填入了收费值
end;

procedure Tmzsf.ssKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
     try
        zb.Text:=floattostr(strtofloat(ss.Text)-strtofloat(zj.Text));
        zb.Enabled:=false;
        zb.ReadOnly:=true;
        button2.Enabled:=true;//button2状态不可用，直到填入了收费值
          //在输入收费后,button1不可用
         button1.Enabled:=false;
      except
         showmessage('不合法的输入，请重新输入');
         ss.Text:='';
         ss.SetFocus;
      end;
   end;
end;


procedure Tmzsf.Button2Click(Sender: TObject);
var
sum:real;
begin
//统计当天收入
     richedit1.lines.add('总计：$'+zj.Text);
     richedit1.lines.add('实收：$'+ss.Text+'    补零：$'+zb.text);
     richedit1.Lines.add(datetostr(date()));
if  DMmzsf.ADOQdtzj.Active then
   DMmzsf.ADOQdtzj.Active:=false;
   //给参数赋值
DMmzsf.ADOQdtzj.Parameters.ParamByName('日期').value:=date();
   //执行sql语句
   DMmzsf.ADOQdtzj.Active:=true;
   if DMmzsf.ADOQdtzj.recordcount=0 then
     showmessage('没有任何数据')
   else
      begin
        sum:=0.00;
        DMmzsf.ADOQdtzj.First;
        while not DMmzsf.ADOQdtzj.Eof do
          begin
            sum:=sum+strtofloat(DMmzsf.ADOQdtzj.Fields.Fields[2].asstring);
            DMmzsf.ADOQdtzj.Next;
           end;
           Mdtzj.Text:=floattostr(sum);
           //让显示统计值的edit恢复为空
           zj.Text:='';
           ss.text:='';
           zb.Text:='';
           ss.Enabled:=true;
           ss.ReadOnly:=false;
            button3.SetFocus;//打印按钮获得焦点
            //将zj.text的值设置为零
            zj.Text:='0';
           //恢复button2的执行状态
           button2.Enabled:=false;
           //button1不可用，直到打印后
           button1.Enabled:=true;
       end;
end;


procedure Tmzsf.Button3Click(Sender: TObject);
begin
        //打印预览
        mzsfbb.QuickRep1.preview;
        //清空richedit1
        richedit1.Lines.Clear;
        //焦点返回bh.edit
        bh.SetFocus;
        //button1可用
    end;
end.
