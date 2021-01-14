unit U_ckxxwh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, ExtCtrls, ComCtrls, Menus, ImgList,
  DBCtrls, Buttons, StdCtrls;

type
  TfrmCkxx = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DataSource: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCkxx: TfrmCkxx;

implementation

uses main, U_ckdakp, U_general_print, u_public, WzglDB;

{$R *.DFM}

procedure TfrmCkxx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  FrmCkxx := nil;
end;

procedure TfrmCkxx.N1Click(Sender: TObject);
begin
  application.createform(TfrmCkxx_KP, frmCkxx_KP);
  try
    DM.CDS_CKXX.edit;
    frmCkxx_KP.showmodal;
  finally
    frmCkxx_KP.free;
  end;
end;

procedure TfrmCkxx.N2Click(Sender: TObject);
begin
  DM.CDS_CKXX.refresh;
end;

procedure TfrmCkxx.N3Click(Sender: TObject);
begin
  application.createform(TfrmCkxx_KP, frmCkxx_KP);
  try
    DM.CDS_CKXX.append;
    frmCkxx_KP.showmodal;
  finally
    frmCkxx_KP.free;
  end;
end;

procedure TfrmCkxx.N4Click(Sender: TObject);
begin
  if DM.CDS_CKXX.recordcount = 0 then
  begin
    application.MessageBox('已无记录可删除', '物资管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  if application.MessageBox('请确认是否要删除', '物资管理系统', mb_iconinformation + mb_yesno) = idyes then
  begin
    DM.CDS_CKXX.Delete;
    DM.CDS_CKXX.ApplyUpdates(0);
  end;
end;

procedure TfrmCkxx.SpeedButton3Click(Sender: TObject);
begin
  N1.click;
end;

procedure TfrmCkxx.SpeedButton1Click(Sender: TObject);
begin
  N3.click;
end;

procedure TfrmCkxx.SpeedButton2Click(Sender: TObject);
begin
  N4.click;
end;

procedure TfrmCkxx.SpeedButton5Click(Sender: TObject);
begin
  N2.click;
end;

procedure TfrmCkxx.SpeedButton4Click(Sender: TObject);
begin
  N9.click;
end;

procedure TfrmCkxx.N9Click(Sender: TObject);
begin
  application.createform(TfrmPrint, frmPrint);
  with frmPrint do
  begin
    srclist.items.add('仓库名称');
    srclist.items.add('仓库地点');
    srclist.items.add('负责人');
    srclist.items.add('联系电话');
    srclist.items.add('备注');
    vps_tablename := 'CL_ckdyb';
    vps_filter := DM.CDS_CKXX.Filter;
    vps_index := DM.CDS_CKXX.IndexFieldNames;
    edtPrintTitle.Text := '仓库信息';
    try
      showmodal;
    finally
      free;
    end;
  end;
end;

procedure TfrmCkxx.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSort(dbgrid1, column);
end;

procedure TfrmCkxx.FormCreate(Sender: TObject);
begin
  with DM do
  begin
    CDS_CKXX.Active := True;
    CDS_CKXX_INDEX.Active := True;
  end;
end;

end.

