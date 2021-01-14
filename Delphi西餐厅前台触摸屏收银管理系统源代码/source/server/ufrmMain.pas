unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, CSADOQuery, ComCtrls, ToolWin, FR_Desgn;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    ParentMenuq: TCSADOQuery;
    StatusBar1: TStatusBar;
    ChildMenuq: TCSADOQuery;
    frDesigner1: TfrDesigner;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Fb_Auto: Boolean;
    Fs_AutoTime, Fs_UserId: String; 
    procedure prip_OnMenuClick(Sender: TObject);
    procedure prip_OnSysMenuClick(Sender: TObject);
    procedure prip_CreateParentMenu;
    procedure prip_CreateMenu;
    procedure prip_CreateChildMenu(Ac_ParentMenu: TMenuItem; As_ParentId: String);
    procedure prip_GetAppParam;
    procedure prip_OpenForm(As_FormName: String);
  public
    function pubf_Ini: Boolean;
  end;
  procedure OnTimeExe;
var
  frmMain: TfrmMain;

implementation

uses udmData, ufrmLogin, ComObj, ufrmWorkView, ufrmEmpView, ufrmSaleView,
  ufrmSysUserView, ufrmSysUserPower, ufrmUnitView, ufrmRealTradeView,
  ufrmOutInvoceView, ufrmOriginalItemView, ufrmOriginalView,
  ufrmSaleItemView, ufrmShopView, ufrmFactoryView,
  ufrmPosParamView, ufrmSaleFixView, ufrmLSMSaleView, ufrmInOutView,
  ufrmLostOriginalView, upubCommon, ufrmAllocOriginalView, ufrmLostSaleView,
  ufrmTestSaleView, ufrmAllocSaleView, ufrmLostTestAllocSearch,
  ufrmSaleStructView, ufrmTradeSaleOrderStatic, ufrmTradeDetailStatic,
  ufrmTradeGatherStatic, ufrmTradeSaleDetailStatic, ufrmMachinesTradeStatic,
  ufrmSaleInnerOutStatic, ufrmSaleTradeUseStatic, ufrmWarerHouseView,
  ufrmTradeTimeGatherStatic, ufrmSaleTimeGatherStatic, ufrmCardInfoModify,
  ufrmCardInfoView, ufrmCardKindModify,  ufrmCardLost,
  ufrmCardPassModify, ufrmCardSaving, ufrmCardServiceFix, ufrmCMBirthday,
  ufrmCMModify, ufrmCMView, ufrmMachinesView, ufrmInOutOriginalSearch, StrUtils,
  ufrmSoftReg, ufrmActRecordSearch;

procedure OnTimeExe;
begin
  if frmMain.Fb_Auto then
  begin
    if frmMain.Fs_AutoTime = FormatDateTime('HH:MM:SS', Time) then
    begin
      frmMain.prip_OpenForm('frmMachData');
    end;
  end;
  frmMain.StatusBar1.Panels[2].Text := '当前时间:' + FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);
end;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.prip_CreateChildMenu(Ac_ParentMenu: TMenuItem; As_ParentId: String);
var
  lc_ChildMenu: TMenuItem;
  lb_IsEvent, lb_IsSysEvent: Boolean;
  li_I: Integer;
begin
  li_I := 1;
  with ChildMenuq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM sys_menu WHERE menu_parentid = ''%s'' AND menu_itemid ' +
     ' in (SELECT menu_itemid FROM sys_user_power WHERE user_id = ''%s'' AND menu_parentid = ''%s''' +
     ' )ORDER BY sort ASC', [As_ParentId, Fs_UserId, As_ParentId]);
    Open;
    if IsEmpty then Exit;
    First;
    while not Eof do
    begin
      lc_ChildMenu := TMenuItem.Create(nil);
      lc_ChildMenu.Caption := FieldByName('menu_caption').AsString;
      lc_ChildMenu.Name := FieldByName('menu_name').AsString;
      lc_ChildMenu.Visible := True;
      lb_IsEvent := FieldByName('is_event').AsBoolean;
      lb_IsSysEvent := FieldByName('is_sysevent').AsBoolean;
      if lb_IsEvent then
      begin
        if lb_IsSysEvent then
        begin
          lc_ChildMenu.OnClick := prip_OnSysMenuClick;
        end else begin
          lc_ChildMenu.OnClick := prip_OnMenuClick;
        end;
      end;
      Ac_ParentMenu.Insert(li_I - 1, lc_ChildMenu);
      Next;
      inc(li_I);
    end;
  end;
end;

procedure TfrmMain.prip_CreateMenu;
begin
  prip_CreateParentMenu;
end;

procedure TfrmMain.prip_CreateParentMenu;
var
  li_MenuCount, li_I: Integer;
  lc_ParentMenu: TMenuItem;
  ls_MenuItemId: String;
begin
  li_MenuCount := MainMenu.Items.Count;
  if li_MenuCount > 0 then
  begin
    for li_I := 0 to li_MenuCount - 1 do
    begin
      MainMenu.Items[li_I].Free;
    end;
  end;
  li_MenuCount := 1;
  with ParentMenuq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM sys_menu WHERE is_parent = 1 AND menu_itemid in (SELECT ' +
      ' menu_itemid FROM sys_user_power WHERE user_id = ''%s'') ORDER BY sort ASC', [Fs_UserId]);
    Open;
    if IsEmpty then Exit;
    First;
    while not Eof do
    begin
      lc_ParentMenu := TMenuItem.Create(nil);
      lc_ParentMenu.Caption := FieldByName('menu_caption').AsString;
      lc_ParentMenu.Name := FieldByName('menu_name').AsString;
      MainMenu.Items.Insert(li_MenuCount - 1, lc_ParentMenu);
      lc_ParentMenu.Visible := True;
      ls_MenuItemId := FieldByName('menu_itemid').AsString;
      prip_CreateChildMenu(lc_ParentMenu, ls_MenuItemId);
      Next;
      li_MenuCount := li_MenuCount + 1;
    end;
  end;
end;

function TfrmMain.pubf_Ini: Boolean;
begin
  dmData := TDmData.Create(nil);
  if not dmData.pubf_Connect then
  begin
    Result := False;
    Exit;
  end;
  Sleep(1000);
  frmLogin := TfrmLogin.Create(nil);
  try
    frmLogin.pubp_Ini;
    frmLogin.ShowModal;
    if frmLogin.ModalResult = mrOK then
    begin
      Self.StatusBar1.Panels[1].Text := frmLogin.As_UserName;
      Fs_UserId := Copy(frmLogin.As_UserName, 1, 4);
      Result := True;
    end else Result := False;
  finally
    frmLogin.Free;
  end;
  if not dmData.IsReg then
  begin
    prip_OpenForm('frmSoftReg');
    if dmData.Ai_Count <= 0 then
    begin
      prip_OpenForm('miClose');
    end;
    dmData.adocon.Execute('UPDATE sys_date set iscount = iscount - 1');
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  prip_GetAppParam;
  prip_CreateMenu;
  with ChildMenuq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM sys_menu';
    Open;
  end;
  //Skin.Active := True;
  Windows.SetTimer(Application.Handle, 1, 1, @OnTimeExe);
end;

procedure TfrmMain.prip_OnMenuClick(Sender: TObject);
var
  ls_Name, ls_SQL, ls_Caption: String;
  ls_FormName: String;
begin
  ls_Name := TMenuItem(Sender).Name;
  ls_Caption := TMenuItem(Sender).Caption;
  ls_SQL := Format('INSERT INTO T_ACT_RECORD_MS VALUES (''%s'', ''%s'', ''%s'', ''%s'')',
  [ls_Caption, dmData.As_OptName, FormatDateTime('YYYY-MM-DD', Date),
  FormatDateTime('HH:MM:SS', Time)]);
  dmData.adocon.BeginTrans;
  try
    dmData.adocon.Execute(ls_SQL);
    dmData.adocon.CommitTrans;
  except
    dmData.adocon.RollbackTrans;
  end;
  //ShowMessage(ls_Name);
  if ChildMenuq.Locate('menu_name', ls_Name, []) then
  begin
    ls_FormName := ChildMenuq.FieldByName('form_name').AsString;
    //ShowMessage(ls_FormName);
    prip_OpenForm(ls_FormName);
    LoginInfo.UserId := Fs_UserId;
  end;
end;

procedure TfrmMain.prip_OnSysMenuClick(Sender: TObject);
var
  ls_Name, ls_SQL, ls_Caption: String;
begin
  ls_Name := TMenuItem(Sender).Name; 
  ls_Caption := TMenuItem(Sender).Caption;
  ls_SQL := Format('INSERT INTO T_ACT_RECORD_MS VALUES (''%s'', ''%s'', ''%s'', ''%s'')',
  [ls_Caption, dmData.As_OptName, FormatDateTime('YYYY-MM-DD', Date),
  FormatDateTime('HH:MM:SS', Time)]);
  dmData.adocon.BeginTrans;
  try
    dmData.adocon.Execute(ls_SQL);
    dmData.adocon.CommitTrans;
  except
    dmData.adocon.RollbackTrans;
  end;
  prip_OpenForm(ls_Name);
end;

procedure TfrmMain.prip_GetAppParam;
var
  ls_Param: String;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT param_value FROM T_SYS_PARAM WHERE param_code = ''%s''', ['000001']);
    Open;
    if IsEmpty then Exit;
    ls_Param := FieldByName('param_value').AsString;
    Application.Title := ls_Param;
    Caption := ls_Param;
    StatusBar1.Panels[0].Text := ls_Param;
    Close;
    SQL.Text := Format('SELECT param_value FROM T_SYS_PARAM WHERE param_code = ''%s''', ['000005']);
    Open;
    if FieldByName('param_value').AsString = 'y' then
    begin
      Fb_Auto := True;
    end;
    Close;
    if Fb_Auto then
    begin
      SQL.Text := Format('SELECT param_value FROM T_SYS_PARAM WHERE param_code = ''%s''', ['000006']);
      Open;
      Fs_AutoTime := FieldByName('param_value').AsString;
      Close;
    end;
  end;
end;

procedure TfrmMain.prip_OpenForm(As_FormName: String);
var
  li_I: Integer;
  lc_MsWord: Variant;
  ls_Path: String;
  //ls_SQL: String;
  //, ls_SQL1, ls_SQL2, ls_SQL3: String;
  lc_WarerHouseView: TpfrmWarerHouseView;
begin
  //SHowMessage(as_FormName);
  //软件注册
  if As_FormName = 'frmSoftReg' then
  begin
    frmSoftReg := TfrmSoftReg.Create(nil);
    try
      frmSoftReg.pubp_Ini;
      frmSoftReg.ShowModal;
    finally
      FreeAndNil(frmSoftReg);
    end;
  end;
  //收银机管理
  if As_FormName = 'frmMachinesView' then
  begin
    if frmMachinesView = nil then
    begin
      frmMachinesView := TfrmMachinesView.Create(Self);
      with frmMachinesView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmMachinesView := nil;
          raise;
        end;
      end;
    end else frmMachinesView.Show;
  end;
  //会员卡管理
  if As_FormName = 'frmCardInfoView' then
  begin
    if frmCardInfoView = nil then
    begin
      frmCardInfoView := TfrmCardInfoView.Create(Self);
      with frmCardInfoView do
      begin
        try
          pubp_Ini(nil, 1);
        except
          try
            Free;
          except
          end;
          frmCardInfoView := nil;
          raise;
        end;
      end;
    end else frmCardInfoView.Show;
  end;
  //会员卡类型
  {if As_FormName = 'frmCardKindView' then
  begin
    if frmCardKindView = nil then
    begin
      frmCardKindView := TfrmCardKindView.Create(Self);
      with frmCardKindView do
      begin
        try
          pubp_Ini(nil, 1);
        except
          try
            Free;
          except
          end;
          frmCardKindView := nil;
          raise;
        end;
      end;
    end else frmCardKindView.Show;
  end;  }
  //客户资料管理
  if As_FormName = 'frmCMView' then
  begin
    if frmCMView = nil then
    begin
      frmCMView := TfrmCMView.Create(Self);
      with frmCMView do
      begin
        try
          pubp_Ini(nil, 1);
        except
          try
            Free;
          except
          end;
          frmCMView := nil;
          raise;
        end;
      end;
    end else frmCMView.Show;
  end;
  //会员挂失
  if As_FormName = 'frmCardLost' then
  begin
    frmCardLost := TfrmCardLost.Create(nil);
    try
      frmCardLost.pubp_Ini;
      frmCardLost.ShowModal;
    finally
      FreeAndNil(frmCardLost);
    end;
  end;
  //会员充值
  if As_FormName = 'frmCardSaving' then
  begin
    frmCardSaving := TfrmCardSaving.Create(nil);
    try
      frmCardSaving.pubp_Ini;
      frmCardSaving.ShowModal;
    finally
      FreeAndNil(frmCardSaving);
    end;
  end;    
  //会员修改密码
  if As_FormName = 'frmCardPassModify' then
  begin
    frmCardPassModify := TfrmCardPassModify.Create(nil);
    try
      frmCardPassModify.pubp_Ini('', 1);
      frmCardPassModify.ShowModal;
    finally
      FreeAndNil(frmCardPassModify);
    end;
  end;
  //原料月盘点
  if As_FormName = 'frmMonthWarerHouseView' then
  begin
    lc_WarerHouseView := @frmMonthWarerHouseView;
    if lc_WarerHouseView^ = nil then
    begin
      lc_WarerHouseView^ := TfrmWarerHouseView.Create(Self);
      try
        lc_WarerHouseView^.pubp_Ini('3', 1);
      except
        try
          lc_WarerHouseView^.Free;
        except
        end;
        lc_WarerHouseView^ := nil;
        raise;
      end;
    end else lc_WarerHouseView^.Show;
  end;
  //原料周盘点
  if As_FormName = 'frmWeekWarerHouseView' then
  begin
    lc_WarerHouseView := @frmWeekWarerHouseView;
    if lc_WarerHouseView^ = nil then
    begin
      lc_WarerHouseView^ := TfrmWarerHouseView.Create(Self);
      try
        lc_WarerHouseView^.pubp_Ini('2', 1);
      except
        try
          lc_WarerHouseView^.Free;
        except
        end;
        lc_WarerHouseView^ := nil;
        raise;
      end;
    end else lc_WarerHouseView^.Show;
  end;
  //原料日盘点
  if As_FormName = 'frmDayWarerHouseView' then
  begin
    lc_WarerHouseView := @frmDayWarerHouseView;
    if lc_WarerHouseView^ = nil then
    begin
      lc_WarerHouseView^ := TfrmWarerHouseView.Create(Self);
      try
        lc_WarerHouseView^.pubp_Ini('1', 1);
      except
        try
          lc_WarerHouseView^.Free;
        except
        end;
        lc_WarerHouseView^ := nil;
        raise;
      end;
    end else lc_WarerHouseView^.Show;
  end; 
  //操作记录
  if As_FormName = 'frmActRecordSearch' then
  begin
    if frmActRecordSearch = nil then
    begin
      frmActRecordSearch := TfrmActRecordSearch.Create(Self);
      with frmActRecordSearch do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmActRecordSearch := nil;
          raise;
        end;
      end;
    end else frmActRecordSearch.Show;
  end;
  //进出货查询
  if As_FormName = 'frmInOutOriginalSearch' then
  begin
    if frmInOutOriginalSearch = nil then
    begin
      frmInOutOriginalSearch := TfrmInOutOriginalSearch.Create(Self);
      with frmInOutOriginalSearch do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmInOutOriginalSearch := nil;
          raise;
        end;
      end;
    end else frmInOutOriginalSearch.Show;
  end;
  //单品销售明细
  if As_FormName = 'frmTradeSaleDetailStatic' then
  begin
    if frmTradeSaleDetailStatic = nil then
    begin
      frmTradeSaleDetailStatic := TfrmTradeSaleDetailStatic.Create(Self);
      with frmTradeSaleDetailStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmTradeSaleDetailStatic := nil;
          raise;
        end;
      end;
    end else frmTradeSaleDetailStatic.Show;
  end;
  //成品销售用量报表
  if As_FormName = 'frmSaleTradeUseStatic' then
  begin
    if frmSaleTradeUseStatic = nil then
    begin
      frmSaleTradeUseStatic := TfrmSaleTradeUseStatic.Create(Self);
      with frmSaleTradeUseStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmSaleTradeUseStatic := nil;
          raise;
        end;
      end;
    end else frmSaleTradeUseStatic.Show;
  end;
  //成品内用/外带/外送报表
  if As_FormName = 'frmSaleInnerOutStatic' then
  begin
    if frmSaleInnerOutStatic = nil then
    begin
      frmSaleInnerOutStatic := TfrmSaleInnerOutStatic.Create(Self);
      with frmSaleInnerOutStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmSaleInnerOutStatic := nil;
          raise;
        end;
      end;
    end else frmSaleInnerOutStatic.Show;
  end;
  //收银机销售报表
  if As_FormName = 'frmMachinesTradeStatic' then
  begin
    if frmMachinesTradeStatic = nil then
    begin
      frmMachinesTradeStatic := TfrmMachinesTradeStatic.Create(Self);
      with frmMachinesTradeStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmMachinesTradeStatic := nil;
          raise;
        end;
      end;
    end else frmMachinesTradeStatic.Show;
  end;  
  //成品小时用量
  if As_FormName = 'frmSaleTimeGatherStatic' then
  begin
    if frmSaleTimeGatherStatic = nil then
    begin
      frmSaleTimeGatherStatic := TfrmSaleTimeGatherStatic.Create(Self);
      with frmSaleTimeGatherStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmSaleTimeGatherStatic := nil;
          raise;
        end;
      end;
    end else frmSaleTimeGatherStatic.Show;
  end;
  //时段销售汇总查询
  if As_FormName = 'frmTradeTimeGatherStatic' then
  begin
    if frmTradeTimeGatherStatic = nil then
    begin
      frmTradeTimeGatherStatic := TfrmTradeTimeGatherStatic.Create(Self);
      with frmTradeTimeGatherStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmTradeTimeGatherStatic := nil;
          raise;
        end;
      end;
    end else frmTradeGatherStatic.Show;
  end;
  //销售汇总查询
  if As_FormName = 'frmTradeGatherStatic' then
  begin
    if frmTradeGatherStatic = nil then
    begin
      frmTradeGatherStatic := TfrmTradeGatherStatic.Create(Self);
      with frmTradeGatherStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmTradeGatherStatic := nil;
          raise;
        end;
      end;
    end else frmTradeGatherStatic.Show;
  end;
  //单品交易查询
  if As_FormName = 'frmTradeDetailStatic' then
  begin
    if frmTradeDetailStatic = nil then
    begin
      frmTradeDetailStatic := TfrmTradeDetailStatic.Create(Self);
      with frmTradeDetailStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmTradeDetailStatic := nil;
          raise;
        end;
      end;
    end else frmTradeDetailStatic.Show;
  end;
  //单品销售排序
  if As_FormName = 'frmTradeSaleOrderStatic' then
  begin
    if frmTradeSaleOrderStatic = nil then
    begin
      frmTradeSaleOrderStatic := TfrmTradeSaleOrderStatic.Create(Self);
      with frmTradeSaleOrderStatic do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmTradeSaleOrderStatic := nil;
          raise;
        end;
      end;
    end else frmTradeSaleOrderStatic.Show;
  end;
  //成品西方管理
  if As_FormName = 'frmSaleStructView' then
  begin
    if frmSaleStructView = nil then
    begin
      frmSaleStructView := TfrmSaleStructView.Create(Self);
      with frmSaleStructView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmSaleStructView := nil;
          raise;
        end;
      end;
    end else frmSaleStructView.Show;
  end;
  //成品调拨损耗测试查询
  if As_FormName = 'frmLostTestAllocSearch' then
  begin
    if frmLostTestAllocSearch = nil then
    begin
      frmLostTestAllocSearch := TfrmLostTestAllocSearch.Create(Self);
      with frmLostTestAllocSearch do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmLostTestAllocSearch := nil;
          raise;
        end;
      end;
    end else frmLostTestAllocSearch.Show;
  end;
  //成品调拨处理
  if As_FormName = 'frmAllocSaleView' then
  begin
    if frmAllocSaleView = nil then
    begin
      frmAllocSaleView := TfrmAllocSaleView.Create(Self);
      with frmAllocSaleView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmAllocSaleView := nil;
          raise;
        end;
      end;
    end else frmAllocSaleView.Show;
  end;
  //成品测试处理
  if As_FormName = 'frmTestSaleView' then
  begin
    if frmTestSaleView = nil then
    begin
      frmTestSaleView := TfrmTestSaleView.Create(Self);
      with frmTestSaleView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmTestSaleView := nil;
          raise;
        end;
      end;
    end else frmTestSaleView.Show;
  end;
  //成品损耗处理
  if As_FormName = 'frmLostSaleView' then
  begin
    if frmLostSaleView = nil then
    begin
      frmLostSaleView := TfrmLostSaleView.Create(Self);
      with frmLostSaleView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmLostSaleView := nil;
          raise;
        end;
      end;
    end else frmLostSaleView.Show;
  end;
  //原料调拨处理
  if As_FormName = 'frmAllocOriginalView' then
  begin
    if frmAllocOriginalView = nil then
    begin
      frmAllocOriginalView := TfrmAllocOriginalView.Create(Self);
      with frmAllocOriginalView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmAllocOriginalView := nil;
          raise;
        end;
      end;
    end else frmAllocOriginalView.Show;
  end;
  //原料损耗处理
  if As_FormName = 'frmLostOriginalView' then
  begin
    if frmLostOriginalView = nil then
    begin
      frmLostOriginalView := TfrmLostOriginalView.Create(Self);
      with frmLostOriginalView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmLostOriginalView := nil;
          raise;
        end;
      end;
    end else frmLostOriginalView.Show;
  end;
  //LSM促销管理
  if As_FormName = 'frmLSMSaleView' then
  begin
    if frmLSMSaleView = nil then
    begin
      frmLSMSaleView := TfrmLSMSaleView.Create(Self);
      with frmLSMSaleView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmLSMSaleView := nil;
          raise;
        end;
      end;
    end else frmLSMSaleView.Show;
  end;
  //套餐内容管理
  if As_FormName = 'frmSaleFixView' then
  begin
    if frmSaleFixView = nil then
    begin
      frmSaleFixView := TfrmSaleFixView.Create(Self);
      with frmSaleFixView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmSaleFixView := nil;
          raise;
        end;
      end;
    end else frmSaleFixView.Show;
  end;
  //进退货管理
  if As_FormName = 'frmInOutView' then
  begin
    if frmInOutView = nil then
    begin
      frmInOutView := TfrmInOutView.Create(Self);
      with frmInOutView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmInOutView := nil;
          raise;
        end;
      end;
    end else frmInOutView.Show;
  end;
  //厂商信息管理
  if As_FormName = 'frmFactoryView' then
  begin
    if frmFactoryView = nil then
    begin
      frmFactoryView := TfrmFactoryView.Create(Self);
      with frmFactoryView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmFactoryView := nil;
          raise;
        end;
      end;
    end else frmFactoryView.Show;
  end;
  //餐厅信息管理
  if As_FormName = 'frmShopView' then
  begin
    if frmShopView = nil then
    begin
      frmShopView := TfrmShopView.Create(Self);
      with frmShopView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmShopView := nil;
          raise;
        end;
      end;
    end else frmShopView.Show;
  end;
  //成品分类管理
  if As_FormName = 'frmSaleItemView' then
  begin
    if frmSaleItemView = nil then
    begin
      frmSaleItemView := TfrmSaleItemView.Create(Self);
      with frmSaleItemView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmSaleItemView := nil;
          raise;
        end;
      end;
    end else frmSaleItemView.Show;
  end;
  //原料管理
  if As_FormName = 'frmOriginalView' then
  begin
    if frmOriginalView = nil then
    begin
      frmOriginalView := TfrmOriginalView.Create(Self);
      with frmOriginalView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmOriginalView := nil;
          raise;
        end;
      end;
    end else frmOriginalView.Show;
  end;
  //原料分类管理
  if As_FormName = 'frmOriginalItemView' then
  begin
    if frmOriginalItemView = nil then
    begin
      frmOriginalItemView := TfrmOriginalItemView.Create(Self);
      with frmOriginalItemView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmOriginalItemView := nil;
          raise;
        end;
      end;
    end else frmOriginalItemView.Show;
  end;
  //AA零用金报支单处理
  if As_FormName = 'frmOutInvoceView' then
  begin
    if frmOutInvoceView = nil then
    begin
      frmOutInvoceView := TfrmOutInvoceView.Create(Self);
      with frmOutInvoceView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmOutInvoceView := nil;
          raise;
        end;
      end;
    end else frmOutInvoceView.Show;
  end;
  //收银员实收处理
  if As_FormName = 'frmRealTradeView' then
  begin
    if frmRealTradeView = nil then
    begin
      frmRealTradeView := TfrmRealTradeView.Create(Self);
      with frmRealTradeView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmRealTradeView := nil;
          raise;
        end;
      end;
    end else frmRealTradeView.Show;
  end;
  //原料单位管理
  if As_FormName = 'frmUnitView' then
  begin
    if frmUnitView = nil then
    begin
      frmUnitView := TfrmUnitView.Create(Self);
      with frmUnitView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmUnitView := nil;
          raise;
        end;
      end;
    end else frmUnitView.Show;
  end;
  //用户权限
  if As_FormName = 'frmSysUserPower' then
  begin
    if frmSysUserPower = nil then
    begin
      frmSysUserPower := TfrmSysUserPower.Create(Self);
      with frmSysUserPower do
      begin
        try
          pubp_Ini;
        except
          try
            Free;
          except
          end;
          frmSysUserPower := nil;
          raise;
        end;
      end;
    end else frmSysUserPower.Show;
  end;
  //用户管理
  if As_FormName = 'frmSysUserView' then
  begin
    if frmSysUserView = nil then
    begin
      frmSysUserView := TfrmSysUserView.Create(Self);
      with frmSysUserView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          raise;
          frmSysUserView := nil;
        end;
      end;
    end else frmSysUserView.Show;
  end;     
  //成品
  if As_FormName = 'frmSaleView' then
  begin
    if frmSaleView = nil then
    begin
      frmSaleView := TfrmSaleView.Create(Self);
      with frmSaleView do
      begin
        try
          frmSaleView.pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmSaleView := nil;
          raise;
        end;
      end;
    end else frmSaleView.Show;
  end;
  //班次设定
  if As_FormName = 'frmWorkView' then
  begin
    if frmWorkView = nil then
    begin
      frmWorkView := TfrmWorkView.Create(Self);
      with frmWorkView do
      begin
        try
          frmWorkView.pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmWorkView := nil;
          raise;
        end;
      end;
    end else frmWorkView.Show;
  end; 
  //POS参数配置
  if As_FormName = 'frmPosParamView' then
  begin
    if frmPosParamView = nil then
    begin
      frmPosParamView := TfrmPosParamView.Create(Self);
      with frmPosParamView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmPosParamView := nil;
          raise;
        end;
      end;
    end else frmPosParamView.Show;
  end;
  //员工管理
  if As_FormName = 'frmEmpView' then
  begin
    if frmEmpView = nil then
    begin
      frmEmpView := TfrmEmpView.Create(Self);
      with frmEmpView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          frmEmpView := nil;
          raise;
        end;
      end;
    end else frmEmpView.Show;
  end;
  //营业数据初始化
  {if As_FormName = 'miRestart' then
  begin
    if Application.MessageBox('您是否真的删除当前所有账单', PChar(Caption), MB_YESNO) =
      IDYES then
    begin
      ls_SQL := 'DELETE FROM consumeinfo';
      ls_SQL1 := 'DELETE FROM csserviceinfo';
      ls_SQL2 := 'DELETE FROM csempinfo';
      ls_SQL3 := 'DELETE FROM csprcinfo';
      dmData.adocon.BeginTrans;
      try
        dmData.adocon.Execute(ls_SQL);
        dmData.adocon.Execute(ls_SQL1);
        dmData.adocon.Execute(ls_SQL2);
        dmData.adocon.Execute(ls_SQL3);
        dmData.adocon.CommitTrans;
        ShowMessage('删除账单完成');
      except
        dmData.adocon.RollbackTrans;
        ShowMessage('删除账单失败');
      end;
    end;
  end;    }
  //退出本系统
  if As_FormName = 'miClose' then
  begin
    dmData.ADOCon.Execute(Format('UPDATE sys_user set modify_time = GETDATE(), is_login = 0 ' +
      ' WHERE user_id = ''%s''', [dmData.As_OptName]));
    for li_I := 0 to Self.MDIChildCount - 1 do
    begin
      Self.MDIChildren[li_I].Free;
    end;
    Application.Terminate;
  end;
  //重装登陆
  if As_FormName = 'miLogoff' then
  begin
    dmData.ADOCon.Execute(Format('UPDATE sys_user set modify_time = GETDATE(), is_login = 0 ' +
      ' WHERE user_id = ''%s''', [dmData.As_OptName]));
    for li_I := 0 to Self.MDIChildCount - 1 do
    begin
      Self.MDIChildren[li_I].Close;
    end;
    for li_I := MainMenu.Items.Count - 1 downto 0 do
    begin
      MainMenu.Items[li_I].Free;
    end;
    Hide;
    //Skin.Active := False;
    frmLogin := TfrmLogin.Create(nil);
    try
      frmLogin.pubp_Ini;
      frmLogin.ShowModal;
      if frmLogin.ModalResult = mrOK then
      begin
        Self.StatusBar1.Panels[1].Text := frmLogin.As_UserName;
        Fs_UserId := Copy(frmLogin.As_UserName, 1, 4);
        Show;  
        //Skin.Active := False;
        //prip_CreateMenu;
        {with ChildMenuq do
        begin
          if Active then Close;
          Connection := dmData.adocon;
          SQL.Text := 'SELECT * FROM sys_menu';
          Open;
        end;}
        Repaint;
      end
      else prip_OpenForm('miClose');
    finally
      frmLogin.Free;
    end;
  end;
  //帮助
  if As_FormName = 'miHelp' then
  begin
    ls_Path := ExtractFilePath(Application.ExeName);
    lc_MsWord := CreateOLEObject('Word.Application');
    lc_MsWord.Documents.Open(FileName := ls_Path + 'Help.doc', ReadOnly:=True);
    lc_MsWord.Visible := True;
    lc_MsWord.Left := 0;
    lc_MsWord.Top := 0;
    lc_MsWord.Height := Height;
    lc_MsWord.Width := Width;
  end;
 { //用户管理
  if As_FormName = 'frmSysUserView' then
  begin
    if frmSysUserView = nil then
    begin
      frmSysUserView := TfrmSysUserView.Create(Self);
      with frmSysUserView do
      begin
        try
          pubp_Ini('', 1);
        except
          try
            Free;
          except
          end;
          raise;
          frmSysUserView := nil;
        end;
      end;
    end else frmSysUserView.Show;
  end; }
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  dmData.ADOCon.Execute(Format('UPDATE sys_user set modify_time = GETDATE(), is_login = 0 ' +
    ' WHERE user_id = ''%s''', [dmData.As_OptName]));
end;


end.
