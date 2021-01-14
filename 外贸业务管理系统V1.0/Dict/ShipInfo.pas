unit ShipInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, MemTableDataEh, Db, GridsEh,
  DBGridEh, SUIButton, StdCtrls, Mask, DBCtrls, SUIDBCtrls, fcLabel,
  SUIImagePanel, Menus, SUIPopupMenu, DataDriverEh, ADODB, MemTableEh,
  SUIGroupBox;

type
  TShipInfo_frm = class(TBaseFrm)
    MemTab_list: TMemTableEh;
    MemTab_listShipID: TWideStringField;
    MemTab_listStartPort: TWideStringField;
    MemTab_listEndPort: TWideStringField;
    MemTab_listPriceUSD20_1: TFloatField;
    MemTab_listPriceUSD20_2: TFloatField;
    MemTab_listPriceUSD40_1: TFloatField;
    MemTab_listPriceUSD40_2: TFloatField;
    MemTab_listPriceUSD40HQ_1: TFloatField;
    MemTab_listPriceUSD40HQ_2: TFloatField;
    MemTab_listPriceUSD00_1: TFloatField;
    MemTab_listPriceUSD00_2: TFloatField;
    MemTab_listPriceRMB20_1: TFloatField;
    MemTab_listPriceRMB20_2: TFloatField;
    MemTab_listPriceRMB40_1: TFloatField;
    MemTab_listPriceRMB40_2: TFloatField;
    MemTab_listPriceRMB40HQ_1: TFloatField;
    MemTab_listPriceRMB40HQ_2: TFloatField;
    MemTab_listPriceRMB00_1: TFloatField;
    MemTab_listPriceRMB00_2: TFloatField;
    Query_list: TADOQuery;
    DataSetDriverEh1: TDataSetDriverEh;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    DS_Port: TDataSource;
    Query_port: TADOQuery;
    ds_info: TDataSource;
    Query_info: TADOQuery;
    suiImagePanel2: TsuiImagePanel;
    btnSelect: TsuiButton;
    btnAdd: TsuiButton;
    btnDelete: TsuiButton;
    btnSave: TsuiButton;
    btnPrint: TsuiButton;
    btnClose: TsuiButton;
    albtnPrint: TsuiArrowButton;
    DBGridEh1: TDBGridEh;
    MemTab_liststartport1: TStringField;
    MemTab_listendport1: TStringField;
    ds_list: TDataSource;
    suiGroupBox1: TsuiGroupBox;
    suiDBEdit1: TsuiDBEdit;
    suiDBEdit2: TsuiDBEdit;
    suiDBEdit3: TsuiDBEdit;
    suiDBEdit4: TsuiDBEdit;
    suiDBEdit5: TsuiDBEdit;
    suiDBEdit6: TsuiDBEdit;
    suiDBEdit7: TsuiDBEdit;
    suiDBEdit8: TsuiDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnSelectClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure albtnPrintClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemTab_listBeforeEdit(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
        InsertFlag :boolean;
        procedure initialize();
   public
    TabID:string;
     procedure Query_ini(id:string);
  end;

var
  ShipInfo_frm: TShipInfo_frm;

implementation

uses BasePage, ShipInfoAdd, ShipInfoSel;

{$R *.dfm}

procedure TShipInfo_frm.Query_ini(id:string);
var
    sqlstr:string;
begin
  try
     sqlstr :='select * from ShipInfo where ShipID='''+ id + '''';
     Get_Query(Query_info, sqlstr);
     
     MemTab_list.Close;
     sqlstr :='select * from ShipInfoPrice where ShipID=''' + id + '''';
     Get_Query(Query_list, sqlstr);
     MemTab_list.Open;
  except
  end;
end;

procedure TShipInfo_frm.initialize();
var sqlstr:string;
begin
  sqlstr :='select * from DictPort ';
  Get_Query(Query_port, sqlstr);

  sqlstr :='select * from ShipInfo ';
  Get_Query(Query_info, sqlstr);
  
  sqlstr :='select * from ShipInfoPrice where ShipID=''' +Query_info.Fieldbyname('ShipID').AsString+ '''';
  Get_Query(Query_list, sqlstr);
  MemTab_list.Active :=true;
  //Query_ini('');
end;

procedure TShipInfo_frm.btnSelectClick(Sender: TObject);
begin
  inherited;
  //
   Application.CreateForm(TShipInfoSel_frm, ShipInfoSel_frm) ;
   ShipInfoSel_frm.ShowModal;
   ShipInfoSel_frm.Free;
end;

procedure TShipInfo_frm.btnAddClick(Sender: TObject);
var sqlstr, maxid:string;
begin
  inherited;
   InsertFlag := false;
   Application.CreateForm(TShipInfoAdd_frm, ShipInfoAdd_frm) ;
   ShipInfoAdd_frm.ShowModal;
   if ShipInfoAdd_frm.AddValue ='1' then
   begin
     try
       maxid :=Get_MaxTabID('ShipInfo', 3);
       Query_ini(maxid);
       Query_info.Append;
       Query_info.FieldByName('ShipID').AsString :=maxid;
       InsertFlag := true;
       btnSave.Enabled :=true;
        //MemTab_list.Filter :='ShipID=''000''';
        //MemTab_list.Locate('ShipID', '000', []);
     except
        on E: Exception do showmessage('数据索引出错.' +E.Message);
     end;
   end
   else if ShipInfoAdd_frm.AddValue ='2' then
   begin
      MemTab_list.Append;
      MemTab_list.FieldByName('ShipID').AsString :=Query_info.fieldbyname('ShipID').AsString;
      btnSave.Enabled :=true;
   end;
   ShipInfoAdd_frm.Free;
//
end;

procedure TShipInfo_frm.btnDeleteClick(Sender: TObject);
var sqlstr, id:string;
begin
  inherited;
   InsertFlag := false;
   Application.CreateForm(TShipInfoAdd_frm, ShipInfoAdd_frm) ;
   ShipInfoAdd_frm.ShowModal;
   if ShipInfoAdd_frm.AddValue ='1' then
   begin
     try
       Query_info.Delete;
       Query_info.Post;
       MemTab_list.Delete;
       MemTab_list.Post;
       Query_ini('000');
     except
        on E: Exception do showmessage('数据索引出错.' +E.Message);
     end;
   end
   else if ShipInfoAdd_frm.AddValue ='2' then
   begin
       MemTab_list.Delete;
       //MemTab_list.Post;
   end;
   ShipInfoAdd_frm.Free;
end;

procedure TShipInfo_frm.btnSaveClick(Sender: TObject);
begin
  inherited;
  if Query_info.State in[dsInsert] then
  begin
      try
        Query_info.Post;
        btnsave.Enabled :=false;
        if application.MessageBox(pchar('保存成功, 是否续继增加'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
        begin
           btnAdd.Click;
        end;
      except
        on ex :exception do showmessage(ex.Message);
      end;
  end
  else if Query_info.State=dsedit then
  begin
    try
       Query_info.Post;
       btnsave.Enabled :=false;
    except
       on ex :exception do showmessage(ex.Message);
    end;
  end;
  
  if MemTab_list.State in[dsInsert] then
  begin
      try
        MemTab_list.UpdateRecord;
        MemTab_list.Post;
        MemTab_list.ApplyUpdates(-1);
        btnSave.Enabled :=false;
        if application.MessageBox(pchar('保存成功, 是否续继增加'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
        begin
           btnAdd.Click;
        end;
      except
        on ex :exception do showmessage(ex.Message);
      end;
  end
  else if MemTab_list.State=dsedit then
  begin
    try
        MemTab_list.UpdateRecord;
        MemTab_list.Post;
        MemTab_list.ApplyUpdates(-1);
        btnSave.Enabled :=false;
    except
       on ex :exception do showmessage(ex.Message);
    end;
  end;
end;

procedure TShipInfo_frm.btnPrintClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TShipInfo_frm.albtnPrintClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TShipInfo_frm.N1Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TShipInfo_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TShipInfo_frm.FormShow(Sender: TObject);
begin
  inherited;
  initialize();
end;

procedure TShipInfo_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    Case Key of
    //VK_F9  : if btnadd.Enabled then  btnadd.Click;
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TShipInfo_frm.MemTab_listBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  btnSave.Enabled :=true;
end;

procedure TShipInfo_frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (Query_info.State in [dsEdit, dsinsert]) or (MemTab_list.State in [dsEdit, dsinsert]) then
  begin
     if application.MessageBox(pchar('是否保存当前数据'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
       Query_info.Post;
     if  MemTab_list.State in [dsEdit, dsinsert] then
        MemTab_list.Post;
  end;

end;

end.
