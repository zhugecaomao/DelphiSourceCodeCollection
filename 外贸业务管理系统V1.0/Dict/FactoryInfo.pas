unit FactoryInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIButton, SUIImagePanel, StdCtrls,
  Mask, DBCtrls, SUIGroupBox, GridsEh, DBGridEh, SUIPageControl,
  SUITabControl, DB, ADODB, Menus, SUIPopupMenu, ShellAPI;

type
  TFactoryInfo_frm = class(TBaseFrm)
    suiGroupBox1: TsuiGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    btnOpenEmail: TsuiButton;
    btnOpenWeb: TsuiButton;
    suiImagePanel1: TsuiImagePanel;
    btnSelect: TsuiButton;
    btnAdd: TsuiButton;
    btnDelete: TsuiButton;
    btnSave: TsuiButton;
    btnBrower: TsuiButton;
    btnClose: TsuiButton;
    albtnPrint: TsuiArrowButton;
    DataSource1: TDataSource;
    Query: TADOQuery;
    PageControl1: TsuiPageControl;
    TabSheet1: TsuiTabSheet;
    DBGridProduct: TDBGridEh;
    TabSheet2: TsuiTabSheet;
    DBGridContract: TDBGridEh;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    TabSheet3: TsuiTabSheet;
    suiGroupBox2: TsuiGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    Label8: TLabel;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    suiGroupBox3: TsuiGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBGridFax: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelectClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBrowerClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOpenEmailClick(Sender: TObject);
    procedure btnOpenWebClick(Sender: TObject);
    procedure QueryBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
        procedure Query_ini(id:string);
  end;

var
  FactoryInfo_frm: TFactoryInfo_frm;

implementation

uses FactoryInfoSel, BasePage;

{$R *.dfm}

procedure TFactoryInfo_frm.Query_ini(id:string);
var
    sqlstr, whsql:string;
begin
  try
    if id <>'' then
        whsql :=' where FactoryID='''+ id + '''';
     sqlstr :='select * from FactoryInfo ' + whsql;
     Get_Query(Query, sqlstr);
     
     {MemTab_list.Close;
     sqlstr :='select * from ShipInfoPrice where ShipID=''' + id + '''';
     Get_Query(Query_list, sqlstr);
     MemTab_list.Open;}
  except
  end;
end;

procedure TFactoryInfo_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  Query_ini('');
end;

procedure TFactoryInfo_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//
end;

procedure TFactoryInfo_frm.btnSelectClick(Sender: TObject);
begin
  inherited;
//
   Application.CreateForm(TFactoryInfoSel_frm, FactoryInfoSel_frm) ;
   FactoryInfoSel_frm.ShowModal;
   FactoryInfoSel_frm.Free;

end;

procedure TFactoryInfo_frm.btnAddClick(Sender: TObject);
begin
  inherited;
//
  Query.Append;
  Query.FieldByName('FactoryID').AsString :=Get_MaxTabID('FactoryInfo', 3);
  Set_MaxTabID('FactoryInfo');
  btnsave.Enabled :=true;
  DBEdit9.SetFocus;

end;

procedure TFactoryInfo_frm.btnDeleteClick(Sender: TObject);
begin
  inherited;
// 删除
  Query.Delete;
end;

procedure TFactoryInfo_frm.btnSaveClick(Sender: TObject);
begin
  inherited;
//保存
  if Query.State= dsinsert then
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

procedure TFactoryInfo_frm.btnBrowerClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFactoryInfo_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
// 退出
  self.Close();
end;

procedure TFactoryInfo_frm.btnOpenEmailClick(Sender: TObject);
var emai:string;
begin
  inherited;
  if Query.Active then
  begin
    emai :='mailto:'+Query.FieldByName('Email').AsString;
    ShellExecute(handle,nil,pchar(emai),nil,nil,sw_shownormal);
  end;

end;

procedure TFactoryInfo_frm.btnOpenWebClick(Sender: TObject);
var web:string;
begin
  inherited;
//  打开WEB
  if Query.Active then
  begin
    web :=''+Query.FieldByName('webUrl').AsString;
    ShellExecute(handle,nil,pchar(web),nil,nil,sw_shownormal);
  end;

end;

procedure TFactoryInfo_frm.QueryBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  btnSave.Enabled :=true;
end;

end.
