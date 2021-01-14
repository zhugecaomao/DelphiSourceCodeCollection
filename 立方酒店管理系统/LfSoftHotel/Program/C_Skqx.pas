{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Skqx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables, C_Define;

type
  TSkqxForm = class(TStdJdForm)
    edtKfh: TLabeledEdit;
    edtFkfs: TLabeledEdit;
    lblKrxm: TLabel;
    Edit1: TEdit;
    tblBqj: TTable;
    procedure edtKfhExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FKfxx: TKFXX;
    FYjxx: TYjxx;
    procedure ShowYjxx;
  public
    { Public declarations }
  end;

var
  SkqxForm: TSkqxForm;

procedure Skqx;

implementation

uses C_HotelData;

{$R *.dfm}

//散客取消客房
procedure Skqx;
begin
  if CZY.CzyXm <> '巢经理' then Exit;
  SkqxForm := TSkqxForm.Create(Application);
  try
    with SkqxForm do
    begin
      ShowModal;
    end;
  finally
    SkqxForm.Free;
  end;
end;

//显示押金信息
procedure TSkqxForm.ShowYjxx;
begin
  FYjxx := HotelData.GetYjxx(FKfxx.AYjbh);

  edtFkfs.Text := FYjxx.AFkfs;
  if FYjxx.AFkfs=FKFS_RMB then
    edtFkfs.Text := edtFkfs.Text + ' ' + CurrToStr(FYjxx.AYfje)+'元';
end;

procedure TSkqxForm.edtKfhExit(Sender: TObject);
begin
  inherited;
  if edtKfh.Text<>'' then
  begin
    if (HotelData.CheckKfzt(edtKfh.Text)=KFZT_BF) then
    begin
      FKfxx := HotelData.GetKfxx(edtKfh.Text);
      Edit1.Text := FKfxx.AKrxm;
      ShowYjxx;
    end
    else
    begin
      ShowInfo('该客房不能取消！');
      edtKfh.Text := '';
      edtKfh.SetFocus;
    end;
  end;
end;

//确认
procedure TSkqxForm.btnOKClick(Sender: TObject);
var
  s: string;
begin
  inherited;
  //edit by ls .20021120
  if edtKfh.Text = '' then
  begin
    ShowMessage('请输入房间号！');
    Exit;
  end;
  if FKfxx.AKfbz=KFBZ_FT then
  begin
    ShowWarning('此房间的客人不是当天来的客人，不能取消');
    Exit;
  end;

  s := 'select sum(D_XFJE) from KRZD where D_ZDBH="'+FKfxx.AZdbh+'"';
  if HotelData.SumJe(s)<>0 then
  begin
    ShowWarning('该房已经存在消费入帐，你不能取消');
    Exit;
  end;
  if not Confirm('你确认取消房间：'+edtKfh.Text+'?') then Exit;

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    tblBqj.Open;
    if tblBqj.Locate('D_KFBH',FKfxx.AKfbh,[]) then
    begin
      tblBqj.Edit;
      tblBqj.FieldByName('D_SJFJ').AsCurrency := 0;
      tblBqj.Post;
    end;
    tblBqj.Close;
    //清空客人帐单
    //s := 'select * from KRZD where D_ZDBH="'+FKfxx.AZdbh+'"';
    s := 'delete from KRZD where D_ZDBH="'+FKfxx.AZdbh+'"';
    HotelData.EmptyData(s);

    //清空客人信息
    //s := 'select * from KRXX where D_KRBH="'+FKfxx.AKrbh+'"';
    s := 'delete from KRXX where D_KRBH="'+FKfxx.AKrbh+'"';
    HotelData.EmptyData(s);

    //清空客人押金
    //s := 'select * from KRYJ where D_YJBH="'+FKfxx.AYjbh+'"';
    s := 'delete from KRYJ where D_YJBH="'+FKfxx.AYjbh+'"';
    HotelData.EmptyData(s);

    
    //初始化客房状态
    HotelData.ClearKfzt(FKfxx.AKfbh);//20020626 修改 by ls.

    ShowInfo('房间取消成功！');

    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;

  Close;
end;

end.
