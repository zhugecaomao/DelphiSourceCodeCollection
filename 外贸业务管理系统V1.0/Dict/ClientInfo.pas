unit ClientInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, StdCtrls, Mask, DBCtrls,
  SUIImagePanel, SUIGroupBox, DB, ADODB, SUIButton, SUIPageControl,
  SUITabControl, Menus, SUIPopupMenu, GridsEh, DBGridEh, ShellAPI;

type
  TClientInfo_frm = class(TBaseFrm)
    DataSource1: TDataSource;
    Query: TADOQuery;
    suiGroupBox1: TsuiGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    btnOpenEmail: TsuiButton;
    btnOpenWeb: TsuiButton;
    PageControl1: TsuiPageControl;
    TabSheet1: TsuiTabSheet;
    TabSheet2: TsuiTabSheet;
    suiImagePanel1: TsuiImagePanel;
    btnSelect: TsuiButton;
    btnAdd: TsuiButton;
    btnDelete: TsuiButton;
    btnSave: TsuiButton;
    btnBrower: TsuiButton;
    btnClose: TsuiButton;
    albtnPrint: TsuiArrowButton;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    DBGridPrice: TDBGridEh;
    DBGridContract: TDBGridEh;
    procedure btnSelectClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBrowerClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOpenEmailClick(Sender: TObject);
    procedure btnOpenWebClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryBeforeEdit(DataSet: TDataSet);
  private
  public
        procedure Query_ini(id:string);
  end;

var
  ClientInfo_frm: TClientInfo_frm;

implementation

uses BasePage, DataModule, ClientInfoSel;

{$R *.dfm}

procedure TClientInfo_frm.Query_ini(id:string);
var
    sqlstr, whsql:string;
begin
  try
    if id <>'' then
        whsql :=' where ClientID='''+ id + '''';
     sqlstr :='select * from ClientInfo ' + whsql;
     Get_Query(Query, sqlstr);
     
     {MemTab_list.Close;
     sqlstr :='select * from ShipInfoPrice where ShipID=''' + id + '''';
     Get_Query(Query_list, sqlstr);
     MemTab_list.Open;}
  except
  end;
end;

procedure TClientInfo_frm.btnSelectClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TClientInfoSel_frm, ClientInfoSel_frm) ;
   ClientInfoSel_frm.ShowModal;
   ClientInfoSel_frm.Free;

end;

procedure TClientInfo_frm.btnAddClick(Sender: TObject);
begin
  inherited;   //增加
  Query.Append;
  Query.FieldByName('ClientID').AsString :=Get_MaxTabID('ClientInfo', 3);
  Set_MaxTabID('ClientInfo');
  btnsave.Enabled :=true;
  DBEdit9.SetFocus;
end;

procedure TClientInfo_frm.btnDeleteClick(Sender: TObject);
begin
  inherited;
// 删除
  Query.Delete;

end;

procedure TClientInfo_frm.btnSaveClick(Sender: TObject);
begin
  inherited;
//保存
  if Query.State in[dsinsert] then
  begin
    try
     Query.Post;
     btnsave.Enabled :=false;
     if application.MessageBox(pchar('保存成功, 是否续继增加'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
     begin
        btnAdd.Click;
     end;
    except
       on ex :exception do showmessage(ex.Message);
    end;
  end
  else if Query.State=dsedit then
  begin
    try
       Query.Post;
       btnsave.Enabled :=false;
    except
       on ex :exception do showmessage(ex.Message);
    end;
  end;

end;

procedure TClientInfo_frm.btnBrowerClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TClientInfo_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
// 退出
  self.Close();
end;

procedure TClientInfo_frm.btnOpenEmailClick(Sender: TObject);
var emai:string;
begin
  inherited;
//
  if Query.Active then
  begin
    emai :='mailto:'+Query.FieldByName('Email').AsString;
    ShellExecute(handle,nil,pchar(emai),nil,nil,sw_shownormal);
  end;
end;

procedure TClientInfo_frm.btnOpenWebClick(Sender: TObject);
VAR web:string;
begin
  inherited;
//  打开WEB
  if Query.Active then
  begin
    web :=''+Query.FieldByName('webUrl').AsString;
    ShellExecute(handle,nil,pchar(web),nil,nil,sw_shownormal);
  end;

end;

procedure TClientInfo_frm.FormShow(Sender: TObject);
begin
  inherited;
  //
  Query_ini('');
end;

procedure TClientInfo_frm.QueryBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  btnSave.Enabled :=true;
end;

end.
