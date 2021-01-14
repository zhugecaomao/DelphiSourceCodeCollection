unit gys_add_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, XPMenu;

type
  TFaddgys = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Egysbh: TEdit;
    Label2: TLabel;
    Egysmc: TEdit;
    Label3: TLabel;
    Elxrxm: TEdit;
    Label4: TLabel;
    Elxrtx: TEdit;
    Label5: TLabel;
    Edz: TEdit;
    Label6: TLabel;
    Ecs: TEdit;
    Label7: TLabel;
    Edq: TEdit;
    Label8: TLabel;
    Eyb: TEdit;
    Label9: TLabel;
    Egj: TEdit;
    Label11: TLabel;
    Ecz: TEdit;
    Label10: TLabel;
    Edh: TEdit;
    YESaddgys: TBitBtn;
    NOaddgys: TBitBtn;
    XPMenu1: TXPMenu;
    procedure YESaddgysClick(Sender: TObject);
    procedure NOaddgysClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Faddgys: TFaddgys;

implementation

uses DMypgl_;

{$R *.dfm}

procedure TFaddgys.YESaddgysClick(Sender: TObject);
begin
  try
      begin
             //添加数据
             DMypgl.ADOTgys.Append;
             DMypgl.ADOTgys.FieldByName('供应商编号').AsString:=Egysbh.text;
             DMypgl.ADOTgys.FieldByName('供应商名称').AsString:=Egysmc.text;
             DMypgl.ADOTgys.FieldByName('联系人姓名').AsString:=Elxrxm.text;
             DMypgl.ADOTgys.FieldByName('联系人头衔').AsString:=Elxrtx.text;
             DMypgl.ADOTgys.FieldByName('地址').AsString:=Edz.text;
             DMypgl.ADOTgys.FieldByName('城市').AsString:=Ecs.text;
             DMypgl.ADOTgys.FieldByName('地区').AsString:=Edq.text;
             DMypgl.ADOTgys.FieldByName('邮编').AsString:=Eyb.text;
             DMypgl.ADOTgys.FieldByName('国家').AsString:=Egj.text;
             DMypgl.ADOTgys.FieldByName('电话').AsString:=Edh.text;
             DMypgl.ADOTgys.FieldByName('传真').AsString:=Ecz.text;
             DMypgl.ADOTgys.Post;
             showmessage('添加成功！！');

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
    except
        begin
           showmessage('添加类型有误，请重新输入！！');
           exit;
        end;
    end;
end;

procedure TFaddgys.NOaddgysClick(Sender: TObject);
begin
DMypgl.ADOTgys.Cancel;
//清空edit
                Egysbh.clear;
                Egysmc.clear;
                Elxrxm.clear;
                Elxrtx.clear;
                Edz.clear;
                Ecs.clear;
                Edq.clear;
                Eyb.clear;
                Egj.clear;
                Edh.clear;
                Ecz.clear;
end;

procedure TFaddgys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Egysbh.Clear;
    Egysmc.Clear;
    Elxrtx.Clear;
    Edz.Clear;
    Edq.Clear;
    Eyb.Clear;
    Egj.Clear;
    Ecz.Clear;
    Elxrxm.Clear;
    Ecs.Clear;
    Edh.Clear;
end;

end.
