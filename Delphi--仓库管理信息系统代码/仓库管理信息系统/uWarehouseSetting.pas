unit uWarehouseSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, ADODB,
  Mask, DBCtrls;

type
  TfrmWarehouseSetting = class(TForm)
    Label1: TLabel;
    btnCancel: TSpeedButton;
    DataSourceCKDYB: TDataSource;
    btnAppend: TSpeedButton;
    btnDelete: TSpeedButton;
    btnModify: TSpeedButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    dbeName: TDBEdit;
    Label3: TLabel;
    dbePostion: TDBEdit;
    Label4: TLabel;
    dbeAdmin: TDBEdit;
    Label5: TLabel;
    dbePhone: TDBEdit;
    Label6: TLabel;
    dbeMemo: TDBEdit;
    aqWarehouse: TADOQuery;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWarehouseSetting: TfrmWarehouseSetting;

implementation

uses uDB;

{$R *.dfm}

procedure TfrmWarehouseSetting.btnCancelClick(Sender: TObject);
begin
  close;
  aqWarehouse.Free;
end;

//增加新的仓库信息
procedure TfrmWarehouseSetting.btnAppendClick(Sender: TObject);
var
  queryc: TADOQuery;
begin
  if btnAppend.Caption = '添 加' then
  begin

    dbeName.SetFocus;
    aqWarehouse.Append;
    btnAppend.Caption := '提 交';
    btnModify.Caption := '取 消';
    btnDelete.Visible := false;
  end
  else
  begin
    if dbeName.Text <> '' then
    begin
      queryc := TADOquery.Create(self);
      queryc.Connection:= dmWarehouse.ACWarehouse;
      queryc.SQL.Text := 'select * from CKDYB where WName="' + dbeName.Text + '"' ;
      queryc.open;
      if not queryc.Eof then
      begin
        MessageBox(handle, '此仓库名称已存在!', '提示', mb_IconInformation + mb_Ok);
        aqWarehouse.Cancel;
        exit;
      end
      else
      begin
        aqWarehouse.Post;
        btnAppend.Caption := '添 加';
        btnModify.Caption := '更 新';
        btnDelete.Visible := true;
      end;
    end
    else
    begin
      MessageBox(handle, '请输入仓库名!', '提示', mb_IconInformation + mb_Ok);
      dbeName.SetFocus;
      exit
    end;
  end;
end;

//删除记录
procedure TfrmWarehouseSetting.btnDeleteClick(Sender: TObject);
begin
  if aqWarehouse.recordcount = 0 then
  begin
    application.MessageBox('已无记录可删除', '仓库管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if application.MessageBox('请确认是否要删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
  begin
    aqWarehouse.Delete;
    aqWarehouse.Close;
    aqWarehouse.SQL.clear;
    aqWarehouse.sql.Text := 'select * from CKDYB';
    aqWarehouse.Open;
  end;
end;

//编辑仓库信息
procedure TfrmWarehouseSetting.btnModifyClick(Sender: TObject);
begin
 
  if btnModify.Caption ='更 新' then
  begin
    aqWarehouse.Edit;
    aqWarehouse.Post;
    aqWarehouse.sql.Text := 'select * from CKDYB';
    aqWarehouse.Open;
  end
  else
  begin
    aqWarehouse.Cancel;
    btnAppend.Caption := '添 加';
    btnModify.Caption := '更 新';
    btnDelete.Visible := true;
  end;
end;

procedure TfrmWarehouseSetting.FormShow(Sender: TObject);
begin
  aqWarehouse.sql.Text := 'select * from CKDYB';
  aqWarehouse.Open;
end;

end.
