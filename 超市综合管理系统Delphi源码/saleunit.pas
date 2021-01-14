unit saleunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls, Menus;

type
  TSale_Form = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1id: TAutoIncField;
    ADOQuery1p_id: TSmallintField;
    ADOQuery1p_name: TWideStringField;
    ADOQuery1p_price: TBCDField;
    ADOQuery1p_unit: TWideStringField;
    ADOQuery1p_type: TSmallintField;
    ADOQuery1p_store: TSmallintField;
    ADOQuery1p_time: TDateTimeField;
    ADOQuery1p_sale: TSmallintField;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    ADOQuery2: TADOQuery;
    Button2: TButton;
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOTable1: TADOTable;
    N2: TMenuItem;
    N3: TMenuItem;
    Button3: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Button4: TButton;
    Edit4: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button5: TButton;
    Button6: TButton;
    N4: TMenuItem;
    Timer1: TTimer;
    N5: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    count:double;
  public
    { Public declarations }
  end;

var
  Sale_Form: TSale_Form;

implementation

uses datamodule, UseLogin, help;

{$R *.dfm}

procedure TSale_Form.Button1Click(Sender: TObject); //提交商品的操作
var
sqls:string;
Parami:tparameter;
count1:double;
left:integer;
begin
count1:=0;
if (edit1.text='') and (edit2.text='') then
showmessage('请输入条形码或者是商品名称噢^_^')
else
 begin
   with adoquery1 do    //从库存中查找提交的商品是否存在
        begin
           close;
           sql.clear;
           sqls:='select * from produce_t where 1=1';
           if edit2.Text<>'' then
              sqls:=sqls+'and p_name='''+edit2.Text+'''';
           if edit1.Text<>'' then
              begin
                sqls:=sqls+'and p_id=:id';
                Parameters.Clear;
                Parami:=Parameters.ADDParameter; //创建参数1
                Parami.Name:='id';
                Parami.Value:=strtoint(edit1.text);
               end;
            sql.add(sqls);
            Prepared;
            open;
            if recordcount=0 then
            showmessage('对不起，该商品不存在')
            else          //如果商品存在就将他写入sell_t表中保存
            begin
             if not adoquery2.active then
             adoquery2.open;
             adoquery2.insert;
             adoquery2.fields.fields[0]:=fields.fields[1];   //条形码
             adoquery2.fields.fields[1]:=fields.fields[2];   //商品名
             adoquery2.fields.fields[2]:=fields.fields[3];   //商品价格
             adoquery2.fields.fields[3]:=fields.fields[4];   //商品计量单位
               with datamodule1.adocommand1 do               //修改produce_t中sale_p的值
                 begin
                 commandtext:='update produce_t set p_sale=p_sale+1 where p_id=:i';
                 parameters.ParamValues['i']:=adoquery2.fields[0].AsInteger;
                 execute;
                 end;
             left:=fields.fields[6].asinteger-fields.fields[8].asinteger;
             adoquery2.fields.fields[4].asinteger:=left; //得到此时的库存量
             if left<=0 then
               begin
                 showmessage('确货中');
                 adoquery2.Cancel;
               end
               else
               begin
                adoquery2.post;
                count1:=fields.Fields[3].AsFloat;  //求当前商品应付金额
                end;
            end;
        end;
        count:=count+count1;    //求出总的应付金额
        richedit1.text:='购物金额共计：'+floattostr(count)+'元整。'; //显示应付金额数
  end;
end;

procedure TSale_Form.Button2Click(Sender: TObject);
begin
if count=0 then        //当没有商品卖出时结算操作为错误操作
   showmessage('错误操作')
else
begin
  edit3.Text:=floattostr(count);      //应付金额
  panel2.Visible:=true;
end;
end;

procedure TSale_Form.Button3Click(Sender: TObject);
begin
if count>0 then  //必需先结算方可离开
showmessage('！！还没结算，请结算后再离开吧！！')
else
begin
adoquery1.close;
adoquery2.close;
adotable1.close;
close;
end;
end;

procedure TSale_Form.Button4Click(Sender: TObject);
var
money:double;
ret:integer;
begin
if edit4.text='' then
 showmessage('请输入你的付款金额')
else
begin
 money:=strtofloat(edit4.Text)-count;
 if money<0 then
     showmessage('金额不足')
 else
   begin
     ret:=messagebox(0,pchar('找零：'+floattostr(money)),'交易确定',1);
     if ret=2 then
       begin
         with adoquery2 do
          begin
           first;
           while not eof do
             begin
               with datamodule1.adocommand1 do               //修改produce_t中sale_p的值
                 begin
                  commandtext:='update produce_t set p_sale=p_sale-1 where p_id=:i';
                  parameters.ParamValues['i']:=adoquery2.fields[0].AsInteger;
                  execute;
                 end;
                next;
            end;
          end;
         richedit1.text:='上次'+richedit1.text+'  交易被取消！！！';
        end
        else
         begin
          with adoquery2 do//查找商品库中库存量
           begin
           first;
            begin
            while not eof do
             begin
               with adotable1 do   //如果可以交易就将sell_t中的数据保存到sell_back_t中
                   begin
                   insert;
                   fields.fields[1]:=adoquery2.fields[0];
                   fields.fields[2]:=adoquery2.fields[1];
                   fields.fields[3]:=adoquery2.fields[2];
                   fields.fields[4].asinteger:=1;
                   fields.fields[5].asdatetime:=now;
                   fields.fields[6].asboolean:=true;
                   post;
                   end;
               next;
             end;
            richedit1.text:='上次'+richedit1.text+'实收：'+edit4.text+'元整'+'  找零：'+floattostr(money)+'元整，交易成功^_^'+'交易时间:'+datetimetostr(now);
            edit1.clear;
            edit2.clear;
            edit3.clear;
            edit4.clear;
            end;   //一次成功交易完成
          end;
         end;
       with datamodule1.adocommand1 do    //删除sell_t中的数据
        begin
        commandtext:='delete from sell_t';
        execute;
        adoquery2.close;
        panel2.visible:=false;
        count:=0;
        end;
   end;
 end;

end;

procedure TSale_Form.FormActivate(Sender: TObject);
begin
  if not adoquery1.active then
  adoquery1.open;
   if not adoquery2.active then
  adoquery2.open;
    if not adotable1.active then
  adotable1.open;
end;

procedure TSale_Form.Button5Click(Sender: TObject); //取消本次交易
var
money:double;
begin
if edit4.text='' then
edit4.text:='0';
 money:=strtofloat(edit4.Text)-count;
 with adoquery2 do
  begin
   first;
   while not eof do
    begin
     with datamodule1.adocommand1 do               //恢复produce_t中sale_p的值
      begin
       commandtext:='update produce_t set p_sale=p_sale-1 where p_id=:i';
       parameters.ParamValues['i']:=adoquery2.fields[0].AsInteger;
       execute;
      end;
     next;
    end;
   end;                                     //清除sell_t中的数据
   with datamodule1.adocommand1 do
    begin
     commandtext:='delete from sell_t';
      execute;
      adoquery2.close;
      panel2.visible:=false;
      count:=0;
      if money<0 then
        richedit1.text:='上次'+richedit1.text+'  交易因金额不足被取消！！！'
      else
          richedit1.text:='上次'+richedit1.text+'  交易被迫取消！！！' ;
      end;
end;

procedure TSale_Form.Button6Click(Sender: TObject);
begin
  with adoquery2 do
  begin
   first;
   while not eof do
    begin
     with datamodule1.adocommand1 do               //恢复produce_t中sale_p的值
      begin
       commandtext:='update produce_t set p_sale=p_sale-1 where p_id=:i';
       parameters.ParamValues['i']:=adoquery2.fields[0].AsInteger;
       execute;
      end;
     next;
    end;
   end;                                     //清除sell_t中的数据
   with datamodule1.adocommand1 do
    begin
     commandtext:='delete from sell_t';
      execute;
      adoquery2.close;
      panel2.visible:=false;
      count:=0;
     richedit1.text:='上次'+richedit1.text+'  所有记录被强制删除' ;
      end;
end;

procedure TSale_Form.Timer1Timer(Sender: TObject);
begin
statusbar1.panels[6].text:='系统时间:'+DateTimeToStr(now);
statusbar1.panels[0].text:='收银员: '+Login_Form.UseName;
end;

procedure TSale_Form.N5Click(Sender: TObject);
begin
help_form.show;
end;

end.
