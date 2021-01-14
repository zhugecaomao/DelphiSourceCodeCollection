unit ufrmSysUserPower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB,
  ADODB, CSADOQuery, dxCntner, dxDBTLCl, dxGrClms, dxmdaset, Buttons;

type
  TfrmSysUserPower = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    grdListUser: TdxDBGrid;
    Userd: TDataSource;
    Userq: TCSADOQuery;
    Userquser_id: TStringField;
    Userquser_name: TStringField;
    grdListUseruser_id: TdxDBGridMaskColumn;
    grdListUseruser_name: TdxDBGridMaskColumn;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    grdListMenuPrent: TdxDBGrid;
    grdListMenuChild: TdxDBGrid;
    memMenuParent: TdxMemData;
    MenuParentq: TCSADOQuery;
    MenuChildq: TCSADOQuery;
    memMenuChild: TdxMemData;
    memMenuParentmenu_name: TStringField;
    MenuParentd: TDataSource;
    MenuChildd: TDataSource;
    memMenuParentmenu_itemid: TStringField;
    memMenuParentis_enable: TBooleanField;
    memMenuChildmenu_itemid: TStringField;
    memMenuChildmenu_name: TStringField;
    memMenuChildis_enable: TBooleanField;
    grdListMenuPrentRecId: TdxDBGridColumn;
    grdListMenuPrentmenu_itemid: TdxDBGridMaskColumn;
    grdListMenuPrentmenu_caption: TdxDBGridMaskColumn;
    grdListMenuPrentis_enable: TdxDBGridCheckColumn;
    grdListMenuChildRecId: TdxDBGridColumn;
    grdListMenuChildmenu_itemid: TdxDBGridMaskColumn;
    grdListMenuChildmenu_caption: TdxDBGridMaskColumn;
    grdListMenuChildis_enable: TdxDBGridCheckColumn;
    MenuParentqmenu_itemid: TStringField;
    MenuParentqmenu_caption: TStringField;
    MenuChildqmenu_itemid: TStringField;
    MenuChildqmenu_caption: TStringField;
    bbtnSave: TBitBtn;
    Panel2: TPanel;
    bbtnExit: TBitBtn;
    GroupBox5: TGroupBox;
    chbDelete: TCheckBox;
    chbDiscount: TCheckBox;
    bbtnSaveOther: TBitBtn;
    procedure memMenuParentAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnExitClick(Sender: TObject);
    procedure bbtnSaveClick(Sender: TObject);
    procedure UserqAfterScroll(DataSet: TDataSet);
    procedure bbtnSaveOtherClick(Sender: TObject);
  private
    //Fb_Delete, Fb_Discount: Boolean; //用于初始化当前用户是否具有特殊权限
    procedure prip_IniInterFace;
    procedure prip_IniData;
    procedure prip_GetUserInfo;
    procedure prip_GetParentMenuInfo;
    procedure prip_GetChildMenuInfo(As_MenuParentId: String);
    procedure prip_SavePower;
    procedure prip_SaveOtherPower(As_PowerCode: String; Ab_IsEnable: Boolean);
    procedure prip_GetOtherPower;
  public
    procedure pubp_Ini;
  end;

var
  frmSysUserPower: TfrmSysUserPower;

implementation
uses udmData, ufrmBase;
{$R *.dfm}

{ TfrmSysUserPower }

procedure TfrmSysUserPower.prip_GetChildMenuInfo(As_MenuParentId: String);
begin
  with MenuChildq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT menu_itemid, menu_caption FROM sys_menu WHERE menu_parentid = ''%s''',
      [As_MenuParentId]);
    Open;
    if not IsEmpty then
    begin
      First;
      if memMenuChild.Active then memMenuChild.Close;
      memMenuChild.Open;
      memMenuChild.DisableControls;
      while not Eof do
      begin
        memMenuChild.Append;
        memMenuChild.FieldByName('menu_itemid').AsString := FieldByName('menu_itemid').AsString;
        memMenuChild.FieldByName('menu_caption').AsString := FieldByName('menu_caption').AsString;
        memMenuChild.FieldByName('is_enable').AsBoolean := False;
        memMenuChild.Post;
        Next;
      end;
      memMenuChild.EnableControls;
    end;
  end;
end;

procedure TfrmSysUserPower.prip_GetParentMenuInfo;
begin
  with MenuParentq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT menu_itemid, menu_caption FROM sys_menu WHERE is_parent = 1';
    Open;
    if not IsEmpty then
    begin
      First;
      if memMenuParent.Active then memMenuParent.Close;
      memMenuParent.Open;
      memMenuParent.DisableControls;
      while not Eof do
      begin
        memMenuParent.Append;
        memMenuParent.FieldByName('menu_itemid').AsString := FieldByName('menu_itemid').AsString;
        memMenuParent.FieldByName('menu_caption').AsString := FieldByName('menu_caption').AsString;
        memMenuParent.FieldByName('is_enable').AsBoolean := False;
        memMenuParent.Post;
        Next;
      end;
      memMenuParent.EnableControls;
    end;
  end;
end;

procedure TfrmSysUserPower.prip_GetUserInfo;
begin
  Userq.AfterScroll := nil;
  with Userq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT user_id, user_name FROM sys_user';
    Open;
  end;
  Userq.AfterScroll := UserqAfterScroll;
  if not Userq.IsEmpty then Userq.Last;
end;

procedure TfrmSysUserPower.prip_IniData;
begin
  prip_GetParentMenuInfo;
  prip_GetUserInfo;
end;

procedure TfrmSysUserPower.prip_IniInterFace;
begin
  FormStyle := fsMDIChild;
  Position := poScreenCenter;
end;

procedure TfrmSysUserPower.pubp_Ini;
begin
  prip_IniInterFace;
  prip_IniData;
end;

procedure TfrmSysUserPower.memMenuParentAfterScroll(DataSet: TDataSet);
var
  ls_MenuItemId: String;
begin
  ls_MenuItemId := memMenuParent.FieldByName('menu_itemid').AsString;
  prip_GetChildMenuInfo(ls_MenuItemId);
end;

procedure TfrmSysUserPower.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  frmSysUserPower := nil;
end;

procedure TfrmSysUserPower.bbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSysUserPower.prip_SavePower;
var
  ls_UserId, ls_SQL, ls_SQL1, ls_MenuItemId, ls_MenuParentId, ls_SQL2: String;
begin
  ls_UserId := Userq.FieldByName('user_id').AsString;
  if memMenuParent.FieldByName('is_enable').AsBoolean then
  begin
    ls_MenuParentId := memMenuParent.FieldByName('menu_itemid').AsString;
    ls_SQL := Format('DELETE sys_user_power WHERE menu_itemid = ''%s'' AND user_id = ''%s''',
      [ls_MenuParentId, ls_UserId]);
    ls_SQL1 := Format('DELETE sys_user_power WHERE menu_parentid = ''%s'' AND user_id = ''%s''',
      [ls_MenuParentId, ls_UserId]);
    ls_SQL2 := Format('INSERT INTO sys_user_power (user_id, menu_itemid, menu_parentid) VALUES (' +
      ' ''%s'', ''%s'', ''%s'')', [ls_UserId, ls_MenuParentId, '']);
    try
      dmData.adocon.BeginTrans;
      dmData.adocon.Execute(ls_SQL);
      dmData.adocon.Execute(ls_SQL1);
      dmData.adocon.Execute(ls_SQL2);
      dmData.adocon.CommitTrans;
    except
      On E: Exception do
      begin
        DispInfo(e.Message);
        dmData.adocon.RollbackTrans;
        DispInfo('权限修改失败');
        Exit;
      end;
    end;
    with memMenuChild do
    begin
      First;
      while not Eof do
      begin
        if memMenuChild.FieldByName('is_enable').AsBoolean then
        begin
          ls_MenuItemId := FieldByName('menu_itemid').AsString;
          ls_SQL := Format('INSERT INTO sys_user_power (user_id, menu_itemid, menu_parentid)'+
            ' VALUES (''%s'', ''%s'', ''%s'')', [ls_Userid, ls_MenuItemid, ls_MenuParentId]);
          try
            dmData.adocon.BeginTrans;
            dmData.adocon.Execute(ls_SQL);
            dmData.adocon.CommitTrans;
          except
            dmData.adocon.RollbackTrans;
            break;
            DispInfo('权限修改失败');
            Exit;
          end;
        end;
        Next;
      end;
      DispInfo('权限修改完成', 2);
    end;
  end else DispInfo('主菜单必须为可用才能设定子菜单');
end;

procedure TfrmSysUserPower.bbtnSaveClick(Sender: TObject);
begin
  prip_SavePower;
end;

procedure TfrmSysUserPower.prip_SaveOtherPower(As_PowerCode: String; Ab_IsEnable: Boolean);
var
  ls_SQL, ls_UserID, ls_SQL1: String;
begin
  ls_UserId := Userq.FieldByName('user_id').AsString;
  if Ab_IsEnable then
  begin
    ls_SQL1 := Format('DELETE sys_user_power WHERE user_id = ''%s'' AND  menu_itemid = ''%s'' ' +
      ' AND menu_parentid = ''%s''', [ls_Userid, As_PowerCode, As_PowerCode]);
    ls_SQL := Format('INSERT INTO sys_user_power (user_id, menu_itemid, menu_parentid)'+
      ' VALUES (''%s'', ''%s'', ''%s'')', [ls_Userid, As_PowerCode, As_PowerCode]);
    dmData.adocon.BeginTrans;
    try
      dmData.adocon.Execute(ls_SQL1);
      dmData.adocon.Execute(ls_SQL);
      dmData.adocon.CommitTrans;
      DispInfo('权限修改完成', 2);
    except
      dmData.adocon.RollbackTrans;
    end;
  end
  else
  begin  
    ls_SQL := Format('DELETE sys_user_power WHERE user_id = ''%s'' AND  menu_itemid = ''%s'' ' +
      ' AND menu_parentid = ''%s''', [ls_Userid, As_PowerCode, As_PowerCode]); 
    dmData.adocon.BeginTrans;
    try
      dmData.adocon.Execute(ls_SQL);
      dmData.adocon.CommitTrans;
      DispInfo('权限修改完成', 2);
    except
      On E: Exception do
      begin
        DispInfo(E.Message);
        dmData.adocon.RollbackTrans;
      end;
    end;
  end;
end;

procedure TfrmSysUserPower.prip_GetOtherPower;
var
  ls_UserId: String;
begin           
  ls_UserId := Userq.FieldByName('user_id').AsString;
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT user_id FROM sys_user_power WHERE menu_itemid = ''%s'' AND ' +
      ' menu_parentid = ''%s'' AND user_id = ''%s''', ['8888', '8888', ls_UserId]);
    Open;
    chbDelete.Checked := not IsEmpty;
    Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT user_id FROM sys_user_power WHERE menu_itemid = ''%s'' AND ' +
      ' menu_parentid = ''%s'' AND user_id = ''%s''', ['9999', '9999', ls_UserId]);
    Open;
    chbDiscount.Checked := not IsEmpty;
    Close;
  end;
end;

procedure TfrmSysUserPower.UserqAfterScroll(DataSet: TDataSet);
begin
  prip_GetOtherPower;
end;

procedure TfrmSysUserPower.bbtnSaveOtherClick(Sender: TObject);
begin
  prip_SaveOtherPower('8888', chbDelete.Checked);
  prip_SaveOtherPower('9999', chbDiscount.Checked); 
end;

end.
