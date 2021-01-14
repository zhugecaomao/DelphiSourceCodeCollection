unit gys_modify_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, XPMenu;

type
  TFgys_modify = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEgysbh: TDBEdit;
    Label2: TLabel;
    DBEgysmc: TDBEdit;
    Label3: TLabel;
    DBElxrxm: TDBEdit;
    Label4: TLabel;
    DBElxrtx: TDBEdit;
    Label5: TLabel;
    DBEdz: TDBEdit;
    Label6: TLabel;
    DBEcs: TDBEdit;
    Label7: TLabel;
    DBEdq: TDBEdit;
    Label8: TLabel;
    DBEyp: TDBEdit;
    Label9: TLabel;
    DBEgj: TDBEdit;
    Label10: TLabel;
    DBEdh: TDBEdit;
    Label11: TLabel;
    DBEcz: TDBEdit;
    BTgys_modify: TBitBtn;
    BTgys_YESmodify: TBitBtn;
    BTgys_NOmodify: TBitBtn;
    XPMenu1: TXPMenu;
    procedure BTgys_modifyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BTgys_YESmodifyClick(Sender: TObject);
    procedure BTgys_NOmodifyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fgys_modify: TFgys_modify;

implementation

uses DMypgl_;

{$R *.dfm}

procedure TFgys_modify.BTgys_modifyClick(Sender: TObject);
begin
//点击修改按钮，让dbedit处于可编辑状态
  dbegysmc.ReadOnly:=false;
  dbelxrxm.ReadOnly:=false;
  dbelxrtx.ReadOnly:=false;
  dbedz.ReadOnly:=false;
  dbecs.ReadOnly:=false;
  dbedq.ReadOnly:=false;
  dbeyp.ReadOnly:=false;
  dbegj.ReadOnly:=false;
  dbedh.ReadOnly:=false;
  dbecz.ReadOnly:=false;
end;

procedure TFgys_modify.FormActivate(Sender: TObject);
begin
//BTgys_modify获得焦点

  BTgys_modify.SetFocus;
end;

procedure TFgys_modify.BTgys_YESmodifyClick(Sender: TObject);
begin
  try
    begin
     DMypgl.ADOTgys2.Edit;
     //添加修改的记录
     DMypgl.ADOTgys2.fieldvalues['供应商名称']:=dbegysmc.Text;
     DMypgl.ADOTgys2.fieldvalues['联系人姓名']:=dbelxrxm.Text;
     DMypgl.ADOTgys2.fieldvalues['联系人头衔']:=dbelxrtx.Text;
     DMypgl.ADOTgys2.fieldvalues['地址']:=dbedz.Text;
     DMypgl.ADOTgys2.fieldvalues['城市']:=dbecs.Text;
     DMypgl.ADOTgys2.fieldvalues['地区']:=dbedq.Text;
     DMypgl.ADOTgys2.fieldvalues['邮编']:=dbeyp.Text;
     DMypgl.ADOTgys2.fieldvalues['国家']:=dbegj.Text;
     DMypgl.ADOTgys2.fieldvalues['电话']:=dbedh.Text;
     DMypgl.ADOTgys2.fieldvalues['传真']:=dbecz.Text;
     DMypgl.ADOTgys2.Post;//提交数据
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
                
     //显示消息框
     showmessage('数据修改成功!!');
    end;
  except
     showmessage('有不合法的输入，请重新输入');
  end;
end;

procedure TFgys_modify.BTgys_NOmodifyClick(Sender: TObject);
begin
DMypgl.ADOTgys2.Cancel;
end;

end.
