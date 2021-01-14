unit Main;

interface

uses
    SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls,DB, DBTables, jpeg;

type
    TMainForm = class(TForm)
        MainMenu: TMainMenu;
        menuSystem: TMenuItem;
        menuSLogin: TMenuItem;
        menuSQuit: TMenuItem;
    menuSWarehouse: TMenuItem;
        menuSRight: TMenuItem;
        ImageBackgroud: TImage;
    btnZGDA: TSpeedButton;
    btnBMDA: TSpeedButton;
    btnSLD: TSpeedButton;
        btnLogin: TSpeedButton;
        btnRightSetting: TSpeedButton;
    btnWarehouseSetting: TSpeedButton;
        btnQuit: TSpeedButton;
    menuWarehouse: TMenuItem;
    menuWSld: TMenuItem;
    menuWBMLL: TMenuItem;
    menuWBmda: TMenuItem;
    btnBMLL: TSpeedButton;
    menuWZGDA: TMenuItem;
    SpeedButton1: TSpeedButton;
    btnKCPD: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    menuWKCPD: TMenuItem;
    menuWCLGL: TMenuItem;
    btnCLGL: TSpeedButton;
        procedure menuSLoginClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure menuSRightClick(Sender: TObject);
        procedure menuSQuitClick(Sender: TObject);
        procedure btnLoginClick(Sender: TObject);
        procedure btnRightSettingClick(Sender: TObject);
        procedure btnQuitClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    procedure menuSWarehouseClick(Sender: TObject);
    procedure btnWarehouseSettingClick(Sender: TObject);
    procedure menuWSldClick(Sender: TObject);
    procedure btnSLDClick(Sender: TObject);
    procedure menuWBmdaClick(Sender: TObject);
    procedure menuWZGDAClick(Sender: TObject);
    procedure btnBMDAClick(Sender: TObject);
    procedure btnZGDAClick(Sender: TObject);
    procedure menuWCLGLClick(Sender: TObject);
    procedure btnCLGLClick(Sender: TObject);
    procedure menuWKCPDClick(Sender: TObject);
    procedure menuWBMLLClick(Sender: TObject);
    procedure btnBMLLClick(Sender: TObject);
    end;

var
    MainForm: TMainForm;

implementation

uses uLogin, uRightsSetting,U_ckxxwh, uWarehouseSetting,uSLD, U_Bmda,
  U_zgda, U_fzlr_clbm, U_kcpd, U_bmlldgl;

{$r *.dfm}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

end;

//登陆主操作界面
procedure TMainForm.btnLoginClick(Sender: TObject);
begin
    if menuSLogin.Enabled then
        menuSLoginClick(Sender) ;
end;

procedure TMainForm.menuSLoginClick(Sender: TObject);
begin
    if frmLogin = nil then
        frmLogin := TfrmLogin.Create(nil);
    frmLogin.ShowModal;
end;

//权限设置
procedure TMainForm.btnRightSettingClick(Sender: TObject);
begin
    if menuSRight.Enabled then
        menuSRightClick(Sender);
end;

procedure TMainForm.menuSRightClick(Sender: TObject);
begin
    if frmRightSetting = nil then
        frmRightSetting := TfrmRightSetting.Create(nil);
   frmRightSetting.ShowModal ;
end;

//退出系统
procedure TMainForm.btnQuitClick(Sender: TObject);
begin
    if menuSQuit.Enabled then
        menuSQuitClick(Sender);
end;

procedure TMainForm.menuSQuitClick(Sender: TObject);
begin
    close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    if frmLogin = nil then
        frmLogin := TfrmLogin.Create(nil);
    frmLogin.ShowModal;
end;

//仓库设置
procedure TMainForm.menuSWarehouseClick(Sender: TObject);
begin
  if frmWarehouseSetting = nil then
    frmWarehouseSetting := TfrmWarehouseSetting.Create(nil);
  frmWarehouseSetting.ShowModal;
  FreeAndNil(frmWarehouseSetting);
end;

procedure TMainForm.btnWarehouseSettingClick(Sender: TObject);
begin
  if menuSWarehouse.enabled = true then
    menuSWarehouseClick(Sender);
end;

//收料单管理
procedure TMainForm.menuWSldClick(Sender: TObject);
begin
    if frmSLD = nil then
        frmSLD := TfrmSLD.Create(nil);
    frmSLD.ShowModal;
    FreeAndNil(frmSLD);
end;

procedure TMainForm.btnSLDClick(Sender: TObject);
begin
  if menuWSld.Enabled then 
    menuWSldClick(Sender);
end;

//部门档案录入
procedure TMainForm.menuWBmdaClick(Sender: TObject);
begin
    if frmBmda = nil then
        frmBmda := TfrmBmda.Create(nil);
    frmBmda.Show;
end;
procedure TMainForm.btnBMDAClick(Sender: TObject);
begin
  if menuWBmda.Enabled then
    menuWBmdaClick(sender);
end;

//职工档案录入
procedure TMainForm.menuWZGDAClick(Sender: TObject);
begin
    if frmZGDA = nil then
        frmZGDA := TfrmZGDA.Create(nil);
    frmZGDA.Show;
end;

procedure TMainForm.btnZGDAClick(Sender: TObject);
begin
  if menuWZGDA.Enabled then
    menuWZGDAClick(sender);
end;

//材料管理
procedure TMainForm.menuWCLGLClick(Sender: TObject);
begin
  if frmCLBM_FZLR = nil then
    frmCLBM_FZLR := TfrmCLBM_FZLR.Create(nil);
  frmCLBM_FZLR.Show;
end;

procedure TMainForm.btnCLGLClick(Sender: TObject);
begin
  if menuWCLGL.Enabled then
    menuWCLGLClick(Sender);
end;

//库存盘点
procedure TMainForm.menuWKCPDClick(Sender: TObject);
begin
//
end;

//部门领料单
procedure TMainForm.menuWBMLLClick(Sender: TObject);
begin
  if frmBMLLD = nil then
    frmBMLLD := TfrmBMLLD.Create(nil);
  frmBMLLD.Show;
end;

procedure TMainForm.btnBMLLClick(Sender: TObject);
begin
  if menuWBMLL.Enabled then
    menuWBMLLClick(Sender);
end;
//整理自_codefans.net
end.
