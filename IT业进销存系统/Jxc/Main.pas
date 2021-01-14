unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMain, Excel97, OleServer, Word97, AppEvnts, Menus, ImgList, ComCtrls,
  ToolWin, StdCtrls, ExtCtrls, Spin, Mask, Buttons, Excel2000, Word2000,
  XPMenu;

type
  TfrmMain = class(TfrmComMain)
    mnuZlGl: TMenuItem;
    mnuDq: TMenuItem;
    mnuKh: TMenuItem;
    mnuGys: TMenuItem;
    N4: TMenuItem;
    mnuZh: TMenuItem;
    mnuSfkfs: TMenuItem;
    mnuSrzclb: TMenuItem;
    N10: TMenuItem;
    mnuCk: TMenuItem;
    mnuHplb: TMenuItem;
    mnuHphsfs: TMenuItem;
    mnuHp: TMenuItem;
    mnuQtkcbdlx: TMenuItem;
    N18: TMenuItem;
    mnuBm: TMenuItem;
    mnuYglb: TMenuItem;
    mnuYg: TMenuItem;
    mnuSjzlZl: TMenuItem;
    mnuXsGl: TMenuItem;
    mnuBbGl: TMenuItem;
    mnuXsdd: TMenuItem;
    mnuXskd: TMenuItem;
    mnuXssk: TMenuItem;
    mnuXsth: TMenuItem;
    N9: TMenuItem;
    mnuCgsh: TMenuItem;
    mnuCgfk: TMenuItem;
    mnuCgth: TMenuItem;
    N15: TMenuItem;
    mnuLl: TMenuItem;
    mnuTl: TMenuItem;
    mnuCpjc: TMenuItem;
    mnuKcpd: TMenuItem;
    mnuChtj: TMenuItem;
    mnuQtkcbd: TMenuItem;
    mnuCkdb: TMenuItem;
    N24: TMenuItem;
    mnuFykz: TMenuItem;
    mnuQtsr: TMenuItem;
    mnuYhckqk: TMenuItem;
    mnuUserOption: TMenuItem;
    mnuXsBb: TMenuItem;
    mnuCgBb: TMenuItem;
    mnuZlfxBb: TMenuItem;
    mnuSzBb: TMenuItem;
    mnuBbKhXsHz: TMenuItem;
    mnuBbKhXsMx: TMenuItem;
    N5: TMenuItem;
    mnuBbHpXsHz: TMenuItem;
    mnuBbHpXsMx: TMenuItem;
    N12: TMenuItem;
    mnuBbYwyXsHz: TMenuItem;
    mnuBbYwyXsMx: TMenuItem;
    N17: TMenuItem;
    mnuBbHpXsMlHz: TMenuItem;
    mnuBbHpXsMlMx: TMenuItem;
    mnuBbXsMlAdjs: TMenuItem;
    mnuBbYwyYjtj: TMenuItem;
    mnuBbXsddQk: TMenuItem;
    mnuBbXsMsdj: TMenuItem;
    mnuBbXsNb: TMenuItem;
    N28: TMenuItem;
    mnuBbDqXsHz: TMenuItem;
    mnuBbDqXsMx: TMenuItem;
    mnuBbGysGhHz: TMenuItem;
    mnuBbGysGhMx: TMenuItem;
    N33: TMenuItem;
    mnuBbHpCgHz: TMenuItem;
    mnuBbHpCgMx: TMenuItem;
    N36: TMenuItem;
    mnuBbYwyCgHz: TMenuItem;
    mnuBbYwyCgMx: TMenuItem;
    mnuBbCgddQk: TMenuItem;
    mnuBbCgMfdj: TMenuItem;
    mnuBbCkkcHz: TMenuItem;
    mnuBbCkkcMx: TMenuItem;
    mnuBbKcCwb: TMenuItem;
    mnuBbYskZb: TMenuItem;
    mnuBbYskZlfx: TMenuItem;
    mnuBbYfkZlfx: TMenuItem;
    mnuBbYfkZb: TMenuItem;
    mnuBbSzHz: TMenuItem;
    mnuBbSzMx: TMenuItem;
    mnuBbXjyhHz: TMenuItem;
    mnuBbXjyhMx: TMenuItem;
    mnuBbKhLsz: TMenuItem;
    mnuBbGysLsz: TMenuItem;
    mnuBbCkLsz: TMenuItem;
    mnuBbSzLsz: TMenuItem;
    N2: TMenuItem;
    mnuBbHplbXsHz: TMenuItem;
    mnuBbHplbXsMx: TMenuItem;
    mnuBbYskMx: TMenuItem;
    mnuBbYfkMx: TMenuItem;
    N3: TMenuItem;
    mnuBbYskZlMx: TMenuItem;
    N7: TMenuItem;
    mnuBbYfkZlMx: TMenuItem;
    mnuBbRqLsz: TMenuItem;
    mnuCgGl: TMenuItem;
    mnuCkGl: TMenuItem;
    mnuCgdd: TMenuItem;
    mnuSzGl: TMenuItem;
    mnuZbGl: TMenuItem;
    N14: TMenuItem;
    N1: TMenuItem;
    mnuFckcb: TMenuItem;
    mnuCqYsk: TMenuItem;
    mnuJdqYsk: TMenuItem;
    mnuCqYfk: TMenuItem;
    mnuJdqYfk: TMenuItem;
    N6: TMenuItem;
    N11: TMenuItem;
    mnuYyLrb: TMenuItem;
    XPMenu1: TXPMenu;
    //
    procedure AppBtn2Click(Sender: TObject);override;
    procedure mnuOptionClick(Sender: TObject);override;
    procedure mnuUserOptionClick(Sender: TObject);
    //功能菜单
    procedure mnuDqClick(Sender: TObject);
    procedure mnuKhClick(Sender: TObject);
    procedure mnuGysClick(Sender: TObject);
    procedure mnuZhClick(Sender: TObject);
    procedure mnuSfkfsClick(Sender: TObject);
    procedure mnuSrzclbClick(Sender: TObject);
    procedure mnuCkClick(Sender: TObject);
    procedure mnuHplbClick(Sender: TObject);
    procedure mnuSjzlZlClick(Sender: TObject);
    procedure mnuBmClick(Sender: TObject);
    procedure mnuYglbClick(Sender: TObject);
    procedure mnuYgClick(Sender: TObject);
    procedure mnuHphsfsClick(Sender: TObject);
    procedure mnuQtkcbdlxClick(Sender: TObject);
    procedure mnuHpClick(Sender: TObject);
    procedure mnuCgdhClick(Sender: TObject);
    procedure mnuCgshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuCgfkClick(Sender: TObject);
    procedure mnuCgthClick(Sender: TObject);
    procedure mnuXsddClick(Sender: TObject);
    procedure mnuXskdClick(Sender: TObject);
    procedure mnuXsskClick(Sender: TObject);
    procedure mnuXsthClick(Sender: TObject);
    procedure mnuLlClick(Sender: TObject);
    procedure mnuTlClick(Sender: TObject);
    procedure mnuCpjcClick(Sender: TObject);
    procedure mnuKcpdClick(Sender: TObject);
    procedure mnuChtjClick(Sender: TObject);
    procedure mnuCkdbClick(Sender: TObject);
    procedure mnuQtkcbdClick(Sender: TObject);
    procedure mnuFykzClick(Sender: TObject);
    procedure mnuQtsrClick(Sender: TObject);
    procedure mnuYhckqkClick(Sender: TObject);
    procedure mnuBbzxClick(Sender: TObject);
    procedure mnuBbKhXsHzClick(Sender: TObject);
    procedure mnuBbKhXsMxClick(Sender: TObject);
    procedure mnuBbHpXsHzClick(Sender: TObject);
    procedure mnuBbHpXsMxClick(Sender: TObject);
    procedure mnuBbYwyXsHzClick(Sender: TObject);
    procedure mnuBbYwyXsMxClick(Sender: TObject);
    procedure mnuBbDqXsHzClick(Sender: TObject);
    procedure mnuBbDqXsMxClick(Sender: TObject);
    procedure mnuBbHplbXsHzClick(Sender: TObject);
    procedure mnuBbHplbXsMxClick(Sender: TObject);
    procedure mnuBbHpXsMlHzClick(Sender: TObject);
    procedure mnuBbHpXsMlMxClick(Sender: TObject);
    procedure mnuBbXsMlAdjsClick(Sender: TObject);
    procedure mnuBbYwyYjtjClick(Sender: TObject);
    procedure mnuBbXsddQkClick(Sender: TObject);
    procedure mnuBbXsMsdjClick(Sender: TObject);
    procedure mnuBbXsNbClick(Sender: TObject);
    procedure mnuBbGysGhHzClick(Sender: TObject);
    procedure mnuBbGysGhMxClick(Sender: TObject);
    procedure mnuBbHpCgHzClick(Sender: TObject);
    procedure mnuBbHpCgMxClick(Sender: TObject);
    procedure mnuBbYwyCgHzClick(Sender: TObject);
    procedure mnuBbYwyCgMxClick(Sender: TObject);
    procedure mnuBbCgddQkClick(Sender: TObject);
    procedure mnuBbCgMfdjClick(Sender: TObject);
    procedure mnuBbCkkcHzClick(Sender: TObject);
    procedure mnuBbCkkcMxClick(Sender: TObject);
    procedure mnuBbKcCwbClick(Sender: TObject);
    procedure mnuBbYskZbClick(Sender: TObject);
    procedure mnuBbYskMxClick(Sender: TObject);
    procedure mnuBbYskZlfxClick(Sender: TObject);
    procedure mnuBbYskZlMxClick(Sender: TObject);
    procedure mnuBbYfkZbClick(Sender: TObject);
    procedure mnuBbYfkMxClick(Sender: TObject);
    procedure mnuBbYfkZlfxClick(Sender: TObject);
    procedure mnuBbYfkZlMxClick(Sender: TObject);
    procedure mnuBbRqLszClick(Sender: TObject);
    procedure mnuBbKhLszClick(Sender: TObject);
    procedure mnuBbGysLszClick(Sender: TObject);
    procedure mnuBbCkLszClick(Sender: TObject);
    procedure mnuBbSzLszClick(Sender: TObject);
    procedure mnuBbSzHzClick(Sender: TObject);
    procedure mnuBbSzMxClick(Sender: TObject);
    procedure mnuBbXjyhHzClick(Sender: TObject);
    procedure mnuCqYskClick(Sender: TObject);
    procedure mnuCqYfkClick(Sender: TObject);
    procedure mnuJdqYskClick(Sender: TObject);
    procedure mnuJdqYfkClick(Sender: TObject);
    procedure mnuYyLrbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  pDataBaseType = 'ACCESS';

var
  frmMain: TfrmMain;
  pstrComputerName: string;
  pintUserId: Integer;
  pstrUserCode: string;
  pstrUserName: string;
  pstrUserPassword: string;
  pstrUserGroup: string;
  pblnLoadAppSelect: boolean;
  pblnSaveAppSelect: boolean;
  pHKL: HKL;
  //My Public
  pintCKID: Integer;
  pintSJID: Integer;

implementation

uses Dq, Kh, Gys, Zh, Sfkfs, Srzclb, Ck, Hplb, SjzlZl, Cyjsdw, Bm, Yglb, Yg,
  Qtkcbdlx, Hphsff, Hp, SetCal, Cgddzb, Cgshzb, Common, ComFun, Cgfkzb,
  Cgthzb, Xsddzb, Xskdzb, Xsskzb, Xsthzb, Llzb, Tlzb, Cpjczb, Kcpdzb,
  Chtjzb, Ckdbzb, Qtkcbdzb, Fykzzb, Qtsrzb, Yhckqk, SysOption, UserOption,
  Bbzx, BbKhXsHz, Rqdsz, MyLib, BbKhXsMx, KhRqd, BbHpXsHz, BbHpXsMx, HpRqd,
  BbYwyXsHz, BbYwyXsMx, YwyRqd, DqRqd, BbDqXsHz, BbDqXsMx, BbHplbXsHz,
  BbHplbXsMx, HplbRqd, BbHpXsMlHz, BbHpXsMlMx, BbXsMlAdjs, BbYwyYjtj,
  BbXsddQk, BbXsMsdj, Ndsz, BbXsMlNb, BbGysGhHz, BbGysGhMx, BbXsMlNbMx,
  GysRqd, BbHpCgHz, BbHpCgMx, BbYwyCgHz, BbYwyCgMx, BbCgddQk, BbCgMfdj,
  CkRqd, BbCkkcHz, BbCkkcMx, CkHpRqd, BbHpCwb, BbYskZb, BbYskMx, ZlfxSz,
  BbYskZlfx, BbYskZlMx, ZlfxKhSz, BbYfkMx, BbYfkZb, BbYfkZlfx, BbYfkZlMx,
  ZlfxGysSz, BbRqLsz, BbKhLsz, BbGysLsz, BbCkLsz, BbSzLsz, BbSzHz, BbSzMx,
  SzlbRqd, BbXjyhHz, BbXjyhMx, BbCqYsk, BbCqYfk, JdqSz, BbJdqYsk, BbJdqYfk,
  BbYyLrb;

{$R *.DFM}

{-Create AppAction-}

procedure TfrmMain.FormShow(Sender: TObject);
begin
  inherited;
  pblnLoadAppSelect := False;
  pblnSaveAppSelect := False;
  //User Option
  pintCKID := StrToInt(Float2Str(GetFieldValue('select Top 1 ID from CK order by XH')));
  pintSJID := StrToInt(Float2Str(GetFieldValue('select Top 1 ID from SJZL order by XH')));
end;

procedure TfrmMain.AppBtn2Click(Sender: TObject);
begin
  inherited;
  screen.Cursor := crHourGlass;
  //资料
  SAction('mnuDq', 'Dq', '');
  SAction('mnuKh', 'Kh', '');
  SAction('mnuGys', 'Gys', '');
  SAction('mnuZh', 'Zh', '');
  SAction('mnuSfkfs', 'Sfkfs', '');
  SAction('mnuSrzclb', 'Srzclb', '');
  SAction('mnuCk', 'Ck', '');
  SAction('mnuHplb', 'Hplb', '');
  SAction('mnuSjzlZl', 'SjzlZl', '');
  SAction('mnuHp', 'Hp', '');
  SAction('mnuBm', 'Bm', '');
  SAction('mnuYglb', 'Yglb', '');
  SAction('mnuYg', 'Yg', '');
  //进销存
  screen.Cursor := crDefault;
  MessageDlg('Set AppAction OK!', mtInformation, [mbOk], 0);
end;

//系统设置
procedure TfrmMain.mnuOptionClick(Sender: TObject);
begin
  frmSysOption := TfrmSysOption.Create(Application);
  frmSysOption.ShowModal;
end;

//我的设置
procedure TfrmMain.mnuUserOptionClick(Sender: TObject);
begin
  frmUserOption := TfrmUserOption.Create(Application);
  frmUserOption.ShowModal;
end;

{-ZL 资料-}

//地区
procedure TfrmMain.mnuDqClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmDq') then
    frmDq := TfrmDq.Create(Application);
  frmDq.Show;
  EndShow(Sender);
end;

//客户
procedure TfrmMain.mnuKhClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmKh') then
    frmKh := TfrmKh.Create(Application);
  frmKh.Show;
  EndShow(Sender);
end;

//供应商
procedure TfrmMain.mnuGysClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmGys') then
    frmGys := TfrmGys.Create(Application);
  frmGys.Show;
  EndShow(Sender);
end;

//帐户
procedure TfrmMain.mnuZhClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmZh') then
    frmZh := TfrmZh.Create(Application);
  frmZh.Show;
  EndShow(Sender);
end;

//收付款方式
procedure TfrmMain.mnuSfkfsClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmSfkfs') then
    frmSfkfs := TfrmSfkfs.Create(Application);
  frmSfkfs.Show;
  EndShow(Sender);
end;

//收入支出类别
procedure TfrmMain.mnuSrzclbClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmSrzclb') then
    frmSrzclb := TfrmSrzclb.Create(Application);
  frmSrzclb.Show;
  EndShow(Sender);
end;

//仓库
procedure TfrmMain.mnuCkClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmCk') then
    frmCk := TfrmCk.Create(Application);
  frmCk.Show;
  EndShow(Sender);
end;

//货品类别
procedure TfrmMain.mnuHplbClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmHplb') then
    frmHplb := TfrmHplb.Create(Application);
  frmHplb.Show;
  EndShow(Sender);
end;

//售价种类
procedure TfrmMain.mnuSjzlZlClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmSjzlZl') then
    frmSjzlZl := TfrmSjzlZl.Create(Application);
  frmSjzlZl.Show;
  EndShow(Sender);
end;

//货品核算方法
procedure TfrmMain.mnuHphsfsClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmHphsff') then
    frmHphsff := TfrmHphsff.Create(Application);
  frmHphsff.Show;
  EndShow(Sender);
end;

//货品
procedure TfrmMain.mnuHpClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmHp') then
    frmHp := TfrmHp.Create(Application);
  frmHp.Show;
  EndShow(Sender);
end;

//其它库存变动类型
procedure TfrmMain.mnuQtkcbdlxClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmQtkcbdlx') then
    frmQtkcbdlx := TfrmQtkcbdlx.Create(Application);
  frmQtkcbdlx.Show;
  EndShow(Sender);
end;

//部门
procedure TfrmMain.mnuBmClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmBm') then
    frmBm := TfrmBm.Create(Application);
  frmBm.Show;
  EndShow(Sender);
end;

//员工类别
procedure TfrmMain.mnuYglbClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmYglb') then
    frmYglb := TfrmYglb.Create(Application);
  frmYglb.Show;
  EndShow(Sender);
end;

//员工
procedure TfrmMain.mnuYgClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmYg') then
    frmYg := TfrmYg.Create(Application);
  frmYg.Show;
  EndShow(Sender);
end;

{-JXC 进销存-}

//采购订单
procedure TfrmMain.mnuCgdhClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmCgddzb') then
    frmCgddzb := TfrmCgddzb.Create(Application);
  frmCgddzb.Show;
  EndShow(Sender);
end;

//采购收货
procedure TfrmMain.mnuCgshClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmCgshzb') then
    frmCgshzb := TfrmCgshzb.Create(Application);
  frmCgshzb.Show;
  EndShow(Sender);
end;

//采购付款
procedure TfrmMain.mnuCgfkClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmCgfkzb') then
    frmCgfkzb := TfrmCgfkzb.Create(Application);
  frmCgfkzb.Show;
  EndShow(Sender);
end;

//采购退货
procedure TfrmMain.mnuCgthClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmCgthzb') then
    frmCgthzb := TfrmCgthzb.Create(Application);
  frmCgthzb.Show;
  EndShow(Sender);
end;

//销售订单
procedure TfrmMain.mnuXsddClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmXsddzb') then
    frmXsddzb := TfrmXsddzb.Create(Application);
  frmXsddzb.Show;
  EndShow(Sender);
end;

//销售开单
procedure TfrmMain.mnuXskdClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmXskdzb') then
    frmXskdzb := TfrmXskdzb.Create(Application);
  frmXskdzb.Show;
  EndShow(Sender);
end;

//销售收款
procedure TfrmMain.mnuXsskClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmXsskzb') then
    frmXsskzb := TfrmXsskzb.Create(Application);
  frmXsskzb.Show;
  EndShow(Sender);
end;

//销售退货
procedure TfrmMain.mnuXsthClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmXsthzb') then
    frmXsthzb := TfrmXsthzb.Create(Application);
  frmXsthzb.Show;
  EndShow(Sender);
end;

//领料
procedure TfrmMain.mnuLlClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmLlzb') then
    frmLlzb := TfrmLlzb.Create(Application);
  frmLlzb.Show;
  EndShow(Sender);
end;

//退料
procedure TfrmMain.mnuTlClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmTlzb') then
    frmTlzb := TfrmTlzb.Create(Application);
  frmTlzb.Show;
  EndShow(Sender);
end;

//产品进仓
procedure TfrmMain.mnuCpjcClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmCpjczb') then
    frmCpjczb := TfrmCpjczb.Create(Application);
  frmCpjczb.Show;
  EndShow(Sender);
end;

//库存盘点
procedure TfrmMain.mnuKcpdClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmKcpdzb') then
    frmKcpdzb := TfrmKcpdzb.Create(Application);
  frmKcpdzb.Show;
  EndShow(Sender);
end;

//存货调价
procedure TfrmMain.mnuChtjClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmChtjzb') then
    frmChtjzb := TfrmChtjzb.Create(Application);
  frmChtjzb.Show;
  EndShow(Sender);
end;

//仓库调拨
procedure TfrmMain.mnuCkdbClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmCkdbzb') then
    frmCkdbzb := TfrmCkdbzb.Create(Application);
  frmCkdbzb.Show;
  EndShow(Sender);
end;

//其它库存变动
procedure TfrmMain.mnuQtkcbdClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmQtkcbdzb') then
    frmQtkcbdzb := TfrmQtkcbdzb.Create(Application);
  frmQtkcbdzb.Show;
  EndShow(Sender);
end;

//费用开支
procedure TfrmMain.mnuFykzClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmFykzzb') then
    frmFykzzb := TfrmFykzzb.Create(Application);
  frmFykzzb.Show;
  EndShow(Sender);
end;


//其它收入
procedure TfrmMain.mnuQtsrClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmQtsrzb') then
    frmQtsrzb := TfrmQtsrzb.Create(Application);
  frmQtsrzb.Show;
  EndShow(Sender);
end;

//银行存款/取款
procedure TfrmMain.mnuYhckqkClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmYhckqk') then
    frmYhckqk := TfrmYhckqk.Create(Application);
  frmYhckqk.Show;
  EndShow(Sender);
end;

{-BB 报表-}

//表报中心
procedure TfrmMain.mnuBbzxClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmBbzx') then
    frmBbzx := TfrmBbzx.Create(Application);
  frmBbzx.Show;
  EndShow(Sender);
end;

//客户销售汇总表
procedure TfrmMain.mnuBbKhXsHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbKhXsHz') then
        frmBbKhXsHz := TfrmBbKhXsHz.Create(Application);
      frmBbKhXsHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//客户销售明细表
procedure TfrmMain.mnuBbKhXsMxClick(Sender: TObject);
begin
  frmKhRqd := TfrmKhRqd.Create(Application);
  with frmKhRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbKhXsMx := TfrmBbKhXsMx.Create(Application);
      with frmBbKhXsMx do
      begin
        intKHID := frmKhRqd.intKHID;
        dteRQA := frmKhRqd.dtpRqa.Date;
        dteRQB := frmKhRqd.dtpRqb.Date;
        frmKhRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//货品销售汇总表
procedure TfrmMain.mnuBbHpXsHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbHpXsHz') then
        frmBbHpXsHz := TfrmBbHpXsHz.Create(Application);
      frmBbHpXsHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//货品销售明细表
procedure TfrmMain.mnuBbHpXsMxClick(Sender: TObject);
begin
  frmHpRqd := TfrmHpRqd.Create(Application);
  with frmHpRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbHpXsMx := TfrmBbHpXsMx.Create(Application);
      with frmBbHpXsMx do
      begin
        intHPID := frmHpRqd.intHPID;
        dteRQA := frmHpRqd.dtpRqa.Date;
        dteRQB := frmHpRqd.dtpRqb.Date;
        frmHpRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//业务员销售汇总表
procedure TfrmMain.mnuBbYwyXsHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYwyXsHz') then
        frmBbYwyXsHz := TfrmBbYwyXsHz.Create(Application);
      frmBbYwyXsHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//业务员销售明细表
procedure TfrmMain.mnuBbYwyXsMxClick(Sender: TObject);
begin
  frmYwyRqd := TfrmYwyRqd.Create(Application);
  with frmYwyRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbYwyXsMx := TfrmBbYwyXsMx.Create(Application);
      with frmBbYwyXsMx do
      begin
        strYWY := frmYwyRqd.strYWY;
        dteRQA := frmYwyRqd.dtpRqa.Date;
        dteRQB := frmYwyRqd.dtpRqb.Date;
        frmYwyRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//地区销售汇总表
procedure TfrmMain.mnuBbDqXsHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbDqXsHz') then
        frmBbDqXsHz := TfrmBbDqXsHz.Create(Application);
      frmBbDqXsHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//地区销售明细表
procedure TfrmMain.mnuBbDqXsMxClick(Sender: TObject);
begin
  frmDqRqd := TfrmDqRqd.Create(Application);
  with frmDqRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbDqXsMx := TfrmBbDqXsMx.Create(Application);
      with frmBbDqXsMx do
      begin
        strMC := frmDqRqd.strMC;
        dteRQA := frmDqRqd.dtpRqa.Date;
        dteRQB := frmDqRqd.dtpRqb.Date;
        frmDqRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//货品类别销售汇总表
procedure TfrmMain.mnuBbHplbXsHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbHplbXsHz') then
        frmBbHplbXsHz := TfrmBbHplbXsHz.Create(Application);
      frmBbHplbXsHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//货品类别销售明细表
procedure TfrmMain.mnuBbHplbXsMxClick(Sender: TObject);
begin
  frmHplbRqd := TfrmHplbRqd.Create(Application);
  with frmHplbRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbHplbXsMx := TfrmBbHplbXsMx.Create(Application);
      with frmBbHplbXsMx do
      begin
        strMC := frmHplbRqd.strMC;
        dteRQA := frmHplbRqd.dtpRqa.Date;
        dteRQB := frmHplbRqd.dtpRqb.Date;
        frmHplbRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//销售毛利汇总表
procedure TfrmMain.mnuBbHpXsMlHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbHpXsMlHz') then
        frmBbHpXsMlHz := TfrmBbHpXsMlHz.Create(Application);
      frmBbHpXsMlHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//销售毛利明细表
procedure TfrmMain.mnuBbHpXsMlMxClick(Sender: TObject);
begin
  frmHpRqd := TfrmHpRqd.Create(Application);
  with frmHpRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbHpXsMlMx := TfrmBbHpXsMlMx.Create(Application);
      with frmBbHpXsMlMx do
      begin
        intHPID := frmHpRqd.intHPID;
        dteRQA := frmHpRqd.dtpRqa.Date;
        dteRQB := frmHpRqd.dtpRqb.Date;
        frmHplbRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//销售毛利按单计算
procedure TfrmMain.mnuBbXsMlAdjsClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbXsMlAdjs') then
        frmBbXsMlAdjs := TfrmBbXsMlAdjs.Create(Application);
      frmBbXsMlAdjs.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//销售毛利年报
procedure TfrmMain.mnuBbXsNbClick(Sender: TObject);
begin
  frmNdsz := TfrmNdsz.Create(Application);
  with frmNdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbXsMlNb') then
        frmBbXsMlNb := TfrmBbXsMlNb.Create(Application);
      frmBbXsMlNb.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//业务员业绩统计
procedure TfrmMain.mnuBbYwyYjtjClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYwyYjtj') then
        frmBbYwyYjtj := TfrmBbYwyYjtj.Create(Application);
      frmBbYwyYjtj.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//销售订单执行情况
procedure TfrmMain.mnuBbXsddQkClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbXsddQk') then
        frmBbXsddQk := TfrmBbXsddQk.Create(Application);
      frmBbXsddQk.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//销售未收单据
procedure TfrmMain.mnuBbXsMsdjClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbXsMsdj') then
        frmBbXsMsdj := TfrmBbXsMsdj.Create(Application);
      frmBbXsMsdj.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//供应商供货汇总表
procedure TfrmMain.mnuBbGysGhHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbGysGhHz') then
        frmBbGysGhHz := TfrmBbGysGhHz.Create(Application);
      frmBbGysGhHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//供应商供货明细表
procedure TfrmMain.mnuBbGysGhMxClick(Sender: TObject);
begin
  frmGysRqd := TfrmGysRqd.Create(Application);
  with frmGysRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbGysGhMx := TfrmBbGysGhMx.Create(Application);
      with frmBbGysGhMx do
      begin
        intGysID := frmGysRqd.intGysID;
        dteRQA := frmGysRqd.dtpRqa.Date;
        dteRQB := frmGysRqd.dtpRqb.Date;
        frmGysRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//货品采购汇总表
procedure TfrmMain.mnuBbHpCgHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbHpCgHz') then
        frmBbHpCgHz := TfrmBbHpCgHz.Create(Application);
      frmBbHpCgHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//货品采购明细表
procedure TfrmMain.mnuBbHpCgMxClick(Sender: TObject);
begin
  frmHpRqd := TfrmHpRqd.Create(Application);
  with frmHpRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbHpCgMx := TfrmBbHpCgMx.Create(Application);
      with frmBbHpCgMx do
      begin
        intHPID := frmHpRqd.intHPID;
        dteRQA := frmHpRqd.dtpRqa.Date;
        dteRQB := frmHpRqd.dtpRqb.Date;
        frmHpRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//业务员采购汇总表
procedure TfrmMain.mnuBbYwyCgHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYwyCgHz') then
        frmBbYwyCgHz := TfrmBbYwyCgHz.Create(Application);
      frmBbYwyCgHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//业务员采购明细表
procedure TfrmMain.mnuBbYwyCgMxClick(Sender: TObject);
begin
  frmYwyRqd := TfrmYwyRqd.Create(Application);
  with frmYwyRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbYwyCgMx := TfrmBbYwyCgMx.Create(Application);
      with frmBbYwyCgMx do
      begin
        strYWY := frmYwyRqd.strYWY;
        dteRQA := frmYwyRqd.dtpRqa.Date;
        dteRQB := frmYwyRqd.dtpRqb.Date;
        frmYwyRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//采购订单执行情况
procedure TfrmMain.mnuBbCgddQkClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbCgddQk') then
        frmBbCgddQk := TfrmBbCgddQk.Create(Application);
      frmBbCgddQk.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//采购未收单据
procedure TfrmMain.mnuBbCgMfdjClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbCgMfdj') then
        frmBbCgMfdj := TfrmBbCgMfdj.Create(Application);
      frmBbCgMfdj.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//仓库库存汇总表
procedure TfrmMain.mnuBbCkkcHzClick(Sender: TObject);
begin
  frmCkRqd := TfrmCkRqd.Create(Application);
  with frmCkRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbCkkcHz') then
        frmBbCkkcHz := TfrmBbCkkcHz.Create(Application);
      frmBbCkkcHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//仓库库存明细表
procedure TfrmMain.mnuBbCkkcMxClick(Sender: TObject);
begin
  frmCkHpRqd := TfrmCkHpRqd.Create(Application);
  with frmCkHpRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbCkkcMx := TfrmBbCkkcMx.Create(Application);
      with frmBbCkkcMx do
      begin
        intCKID := frmCkHpRqd.intCKID;
        intHPID := frmCkHpRqd.intHPID;
        dteRQA := frmCkHpRqd.dtpRqa.Date;
        dteRQB := frmCkHpRqd.dtpRqb.Date;
        frmCkHpRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//货品仓位表
procedure TfrmMain.mnuBbKcCwbClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmBbHpCwb') then
    frmBbHpCwb := TfrmBbHpCwb.Create(Application);
  frmBbHpCwb.Show;
  EndShow(Sender);
end;

//应收款帐薄
procedure TfrmMain.mnuBbYskZbClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYskZb') then
        frmBbYskZb := TfrmBbYskZb.Create(Application);
      frmBbYskZb.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//应收款明细帐
procedure TfrmMain.mnuBbYskMxClick(Sender: TObject);
begin
  frmKhRqd := TfrmKhRqd.Create(Application);
  with frmKhRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbYskMx := TfrmBbYskMx.Create(Application);
      with frmBbYskMx do
      begin
        intKHID := frmKhRqd.intKHID;
        dteRQA := frmKhRqd.dtpRqa.Date;
        dteRQB := frmKhRqd.dtpRqb.Date;
        frmKhRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//应收款帐龄分析
procedure TfrmMain.mnuBbYskZlfxClick(Sender: TObject);
begin
  frmZlfxSz := TfrmZlfxSz.Create(Application);
  with frmZlfxSz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    IniName := 'ZLFXSZ_YSK';
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYskZlfx') then
        frmBbYskZlfx := TfrmBbYskZlfx.Create(Application);
      frmBbYskZlfx.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//应收款帐龄明细
procedure TfrmMain.mnuBbYskZlMxClick(Sender: TObject);
begin
  frmZlfxKhSz := TfrmZlfxKhSz.Create(Application);
  with frmZlfxKhSz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    IniName := 'ZLFXSZ_YSK';
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbYskZlMx := TfrmBbYskZlMx.Create(Application);
      with frmBbYskZlMx do
      begin
        intKHID := frmZlfxKhSz.intKHID;
        dteRQ := frmZlfxKhSz.dtpRq.Date;
        aTS[0] := 0;
        aTS[1] := StrToInt(frmZlfxKhSz.TS1.Text);
        aTS[2] := StrToInt(frmZlfxKhSz.TS2.Text);
        aTS[3] := StrToInt(frmZlfxKhSz.TS3.Text);
        aTS[4] := StrToInt(frmZlfxKhSz.TS4.Text);
        aTS[5] := StrToInt(frmZlfxKhSz.TS5.Text);
        aTS[6] := StrToInt(frmZlfxKhSz.TS6.Text);
        aTS[7] := StrToInt(frmZlfxKhSz.TS7.Text);
        frmZlfxKhSz.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//应付款帐薄
procedure TfrmMain.mnuBbYfkZbClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYfkZb') then
        frmBbYfkZb := TfrmBbYfkZb.Create(Application);
      frmBbYfkZb.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//应付款明细帐
procedure TfrmMain.mnuBbYfkMxClick(Sender: TObject);
begin
  frmGysRqd := TfrmGysRqd.Create(Application);
  with frmGysRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbYfkMx := TfrmBbYfkMx.Create(Application);
      with frmBbYfkMx do
      begin
        intGYSID := frmGysRqd.intGYSID;
        dteRQA := frmGysRqd.dtpRqa.Date;
        dteRQB := frmGysRqd.dtpRqb.Date;
        frmGysRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//应付款帐龄分析
procedure TfrmMain.mnuBbYfkZlfxClick(Sender: TObject);
begin
  frmZlfxSz := TfrmZlfxSz.Create(Application);
  with frmZlfxSz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    IniName := 'ZLFXSZ_YFK';
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYfkZlfx') then
        frmBbYfkZlfx := TfrmBbYfkZlfx.Create(Application);
      frmBbYfkZlfx.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//应付款帐龄明细
procedure TfrmMain.mnuBbYfkZlMxClick(Sender: TObject);
begin
  frmZlfxGysSz := TfrmZlfxGysSz.Create(Application);
  with frmZlfxGysSz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    IniName := 'ZLFXSZ_YFK';
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbYfkZlMx := TfrmBbYfkZlMx.Create(Application);
      with frmBbYfkZlMx do
      begin
        intGYSID := frmZlfxGysSz.intGYSID;
        dteRQ := frmZlfxGysSz.dtpRq.Date;
        aTS[0] := 0;
        aTS[1] := StrToInt(frmZlfxGysSz.TS1.Text);
        aTS[2] := StrToInt(frmZlfxGysSz.TS2.Text);
        aTS[3] := StrToInt(frmZlfxGysSz.TS3.Text);
        aTS[4] := StrToInt(frmZlfxGysSz.TS4.Text);
        aTS[5] := StrToInt(frmZlfxGysSz.TS5.Text);
        aTS[6] := StrToInt(frmZlfxGysSz.TS6.Text);
        aTS[7] := StrToInt(frmZlfxGysSz.TS7.Text);
        frmZlfxGysSz.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//日期流水帐
procedure TfrmMain.mnuBbRqLszClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbRqLsz') then
        frmBbRqLsz := TfrmBbRqLsz.Create(Application);
      frmBbRqLsz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//客户流水帐
procedure TfrmMain.mnuBbKhLszClick(Sender: TObject);
begin
  frmKhRqd := TfrmKhRqd.Create(Application);
  with frmKhRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbKhLsz') then
        frmBbKhLsz := TfrmBbKhLsz.Create(Application);
      frmBbKhLsz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//供应商流水帐
procedure TfrmMain.mnuBbGysLszClick(Sender: TObject);
begin
  frmGysRqd := TfrmGysRqd.Create(Application);
  with frmGysRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbGysLsz') then
        frmBbGysLsz := TfrmBbGysLsz.Create(Application);
      frmBbGysLsz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//仓库流水帐
procedure TfrmMain.mnuBbCkLszClick(Sender: TObject);
begin
  frmCkRqd := TfrmCkRqd.Create(Application);
  with frmCkRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbCkLsz') then
        frmBbCkLsz := TfrmBbCkLsz.Create(Application);
      frmBbCkLsz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//收支流水帐
procedure TfrmMain.mnuBbSzLszClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbSzLsz') then
        frmBbSzLsz := TfrmBbSzLsz.Create(Application);
      frmBbSzLsz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//收支汇总表
procedure TfrmMain.mnuBbSzHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbSzHz') then
        frmBbSzHz := TfrmBbSzHz.Create(Application);
      frmBbSzHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//收支明细表
procedure TfrmMain.mnuBbSzMxClick(Sender: TObject);
begin
  frmSzlbRqd := TfrmSzlbRqd.Create(Application);
  with frmSzlbRqd do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      frmBbSzMx := TfrmBbSzMx.Create(Application);
      with frmBbSzMx do
      begin
        intSRZCLBID := frmSzlbRqd.intSRZCLBID;
        dteRQA := frmSzlbRqd.dtpRqa.Date;
        dteRQB := frmSzlbRqd.dtpRqb.Date;
        frmSzlbRqd.Free;
        ShowModal;
        Free;
      end;
      EndShow(Sender);
    end;
  end;
end;

//日记帐汇总表
procedure TfrmMain.mnuBbXjyhHzClick(Sender: TObject);
begin
  frmRqdsz := TfrmRqdsz.Create(Application);
  with frmRqdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbXjyhHz') then
        frmBbXjyhHz := TfrmBbXjyhHz.Create(Application);
      frmBbXjyhHz.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//超期应收款
procedure TfrmMain.mnuCqYskClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmBbCqYsk') then
    frmBbCqYsk := TfrmBbCqYsk.Create(Application);
  frmBbCqYsk.Show;
  EndShow(Sender);
end;

//将到期应收款
procedure TfrmMain.mnuJdqYskClick(Sender: TObject);
begin
  frmJdqSz := TfrmJdqSz.Create(Application);
  with frmJdqSz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbJdqYsk') then
        frmBbJdqYsk := TfrmBbJdqYsk.Create(Application);
      frmBbJdqYsk.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//超期应付款
procedure TfrmMain.mnuCqYfkClick(Sender: TObject);
begin
  BeginShow(Sender);
  if not IsOpenMdiForm('frmBbCqYfk') then
    frmBbCqYfk := TfrmBbCqYfk.Create(Application);
  frmBbCqYfk.Show;
  EndShow(Sender);
end;

//将到期应付款
procedure TfrmMain.mnuJdqYfkClick(Sender: TObject);
begin
  frmJdqSz := TfrmJdqSz.Create(Application);
  with frmJdqSz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbJdqYfk') then
        frmBbJdqYfk := TfrmBbJdqYfk.Create(Application);
      frmBbJdqYfk.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

//营业利润一览表
procedure TfrmMain.mnuYyLrbClick(Sender: TObject);
begin
  frmNdsz := TfrmNdsz.Create(Application);
  with frmNdsz do
  begin
    Caption := ClearHotKey(TMenuItem(Sender).Caption);
    ShowModal;
    if ModalResult = MROK then
    begin
      BeginShow(Sender);
      if not IsOpenMdiForm('frmBbYyLrb') then
        frmBbYyLrb := TfrmBbYyLrb.Create(Application);
      frmBbYyLrb.Show;
      EndShow(Sender);
    end;
    Free;
  end;
end;

end.
