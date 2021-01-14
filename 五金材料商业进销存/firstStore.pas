unit firstStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, KvLabel, ExtCtrls, DBCtrls, Mask, TFlatEditUnit,
  TFlatSpinEditUnit, DBFlatSpinEdit, TFlatButtonUnit, DosMove,
  TFlatSpeedButtonUnit, ImgList, Grids, Wwdbigrd, Wwdbgrid, wwDBGridEx,
  DBGrids, DB, ADODB;

type
  TfrmFirstStoreAdd = class(TForm)
    Panel1: TPanel;
    labQua: TKvLabel;
    labAmo: TKvLabel;
    btnAdd: TFlatButton;
    ImageList1: TImageList;
    FlatSpeedButton2: TFlatButton;
    DosMove1: TDosMove;
    btnPostClose: TFlatButton;
    labGds: TKvLabel;
    DBGrid1: TDBGrid;
    btnpost: TFlatButton;
    tmpSQL: TADOQuery;
    procedure btnAddClick(Sender: TObject);
    procedure btnPostCloseClick(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnpostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure updatescreen;
    { Private declarations }
  public
    tmpgdsid, tmpgdsname: string;
  end;

var
  frmFirstStoreAdd: TfrmFirstStoreAdd;

implementation

uses data;

{$R *.dfm}

procedure TfrmFirstStoreAdd.btnAddClick(Sender: TObject);
begin
  with dm.tabFirstStore do
    begin
      append;
      Fieldbyname('gdsid').value := tmpgdsid;
    end;
end;

procedure TfrmFirstStoreAdd.btnPostCloseClick(Sender: TObject);
begin
  with dm.tabFirstStore do
    begin
      cancel;
    end;
end;

procedure TfrmFirstStoreAdd.FlatSpeedButton2Click(Sender: TObject);
begin
  with dm.tabFirstStore do
    begin
      cancel;
    end;
  self.close;
end;

procedure TfrmFirstStoreAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;
end;

procedure TfrmFirstStoreAdd.FormCreate(Sender: TObject);
begin
  with dm do
    begin
      if not tabstore.Active then tabstore.open;
      if not tabgoods.active then tabgoods.Open;
      if not tabFirstStore.Active then tabFirstStore.Open;
    end;
end;

procedure TfrmFirstStoreAdd.btnpostClick(Sender: TObject);
begin
  with dm.tabFirstStore do
    begin
      post;
      UpdateScreen;
    end;
end;

procedure TfrmFirstStoreAdd.UpdateScreen;
begin
  if (tmpgdsid = null) or (tmpgdsid = '') then exit;
  with tmpSQL do
    begin
      close;
      sql.clear;
      sql.Add('select sum(qua) as quaamo,sum(amo) as amoamo FROM FirstStore'); //始终只会返回一条记录。所以下面没有recordcount就没有了。
      sql.Add('where gdsid = :gdsid');
      Parameters.parambyname('gdsid').value := tmpgdsid;
      open;
      labGDS.Caption := format('编号为 :    %s    的商品   %s   库存分布如下 ：', [tmpgdsid, tmpgdsname]);
      labQua.Caption := format('全部库存数量 ：%s', [Fieldbyname('quaamo').asstring]);
      labAmo.Caption := format('全部库存总价 ：%s', [Fieldbyname('amoamo').asstring]);
    end;
end;

procedure TfrmFirstStoreAdd.FormShow(Sender: TObject);
begin
  UpdateScreen;
end;

end.
