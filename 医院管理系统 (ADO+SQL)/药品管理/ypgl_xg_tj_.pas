unit ypgl_xg_tj_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls, XPMenu;

type
  Typgl_xg_tj = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEbh: TDBEdit;
    Label2: TLabel;
    DBEmc: TDBEdit;
    Label5: TLabel;
    DBEzxjg: TDBEdit;
    Label3: TLabel;
    DBEjj: TDBEdit;
    Label4: TLabel;
    DBEsj: TDBEdit;
    Label9: TLabel;
    DateTimerk: TDateTimePicker;
    Label8: TLabel;
    DateTimedg: TDateTimePicker;
    DateTimegq: TDateTimePicker;
    Label7: TLabel;
    Label6: TLabel;
    DBEdgl: TDBEdit;
    Label10: TLabel;
    DBEgg: TDBEdit;
    Label11: TLabel;
    DBEdwsl: TDBEdit;
    Label13: TLabel;
    DBEzxdw: TDBEdit;
    Label12: TLabel;
    DBEgysbh: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn_cancel: TBitBtn;
    XPMenu1: TXPMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ypgl_xg_tj: Typgl_xg_tj;

implementation

uses DMypgl_;

{$R *.dfm}

procedure Typgl_xg_tj.BitBtn1Click(Sender: TObject);
begin
  //使edit,datetime为可修改状态
  dbebh.ReadOnly:=false;
  dbemc.ReadOnly:=false;
  dbejj.ReadOnly:=false;
  dbesj.ReadOnly:=false;
  dbezxjg.ReadOnly:=false;
  dbedgl.ReadOnly:=false;
  dbegg.ReadOnly:=false;
  dbedwsl.ReadOnly:=false;
  dbegysbh.ReadOnly:=false;
  Datetimedg.Enabled:=true;
  Datetimegq.Enabled:=true;
  Datetimerk.Enabled:=true;
end;

procedure Typgl_xg_tj.BitBtn5Click(Sender: TObject);
begin
 try
  begin
  DMypgl.ADOTypgl.Edit;
  //添加修改的记录
  DMypgl.ADOTypgl.FieldValues['编号']:=DBebh.Text;
  DMypgl.ADOTypgl.FieldValues['药品名称']:=DBemc.Text;
  DMypgl.ADOTypgl.FieldValues['进价']:=strtofloat(DBejj.Text);
  DMypgl.ADOTypgl.FieldValues['售价']:=strtofloat(DBesj.Text);
  DMypgl.ADOTypgl.FieldValues['最小价格']:=strtofloat(DBezxjg.Text);
  DMypgl.ADOTypgl.FieldValues['订购量']:=strtoint(DBedgl.Text);
  DMypgl.ADOTypgl.FieldValues['过期时间']:=DateTimegq.date;
  DMypgl.ADOTypgl.FieldValues['订购时间']:=DateTimedg.date;
  DMypgl.ADOTypgl.FieldValues['规格']:=DBEgg.text;
  DMypgl.ADOTypgl.FieldValues['入库时间']:=DateTimerk.date;
  DMypgl.ADOTypgl.FieldValues['单位数量']:=DBEdwsl.text;
  DMypgl.ADOTypgl.FieldValues['供应商编号']:=DBegysbh.text;
  Dmypgl.ADOTypgl.FieldValues['最小单位']:=DBEzxdw.Text;
  DMypgl.ADOTypgl.FieldValues['库存量']:=strtoint(DBedgl.Text);
  DMypgl.ADOTypgl.Post;
 //更新数据集
                DMypgl.adotgys.Close;
                DMypgl.ADOTgys.Open;

                Dmypgl.ADOQypgq.Close;
                Dmypgl.ADOQypgq.Open;

                DMypgl.ADOTypgl.Close;
                DMypgl.ADOTypgl.Open;


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
                
  showmessage('数据修改成功！！');
  end;
 except
  showmessage('不匹配的输入');
 end;
end;


procedure Typgl_xg_tj.BitBtn_cancelClick(Sender: TObject);
begin
DMypgl.ADOTypgl.Cancel;
end;

end.
