unit U_kcpd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Db, DBClient, Grids, DBGrids, Buttons,
  DBCtrls, QuickRpt, Qrctrls, Menus;

type
  TfrmKCPD = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label3: TLabel;
    ClientDataSet3: TClientDataSet;
    SpeedButton8: TSpeedButton;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ClientDataSet_index: TClientDataSet;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKCPD: TfrmKCPD;

implementation

uses   U_fzlr_clbm,  U_fzlr_zgxm;

{$R *.DFM}

procedure TfrmKCPD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmKCPD.SpeedButton1Click(Sender: TObject);
begin
  speedbutton1.enabled := not speedbutton1.Enabled;
  speedbutton2.enabled := not speedbutton2.enabled;
  speedbutton4.enabled := not speedbutton4.enabled;
  speedbutton5.enabled := not speedbutton5.enabled;
  speedbutton6.enabled := not speedbutton6.enabled;
  speedbutton7.enabled := not speedbutton7.enabled;
  speedbutton8.enabled := not speedbutton8.enabled;
  dbedit4.enabled := true;
  bitbtn3.visible := not bitbtn3.visible;
  dbgrid1.columns[3].readonly := not dbgrid1.columns[3].readonly;
  panel1.enabled := not panel1.enabled;
  dbgrid1.PopupMenu := popupMenu1;
end;

procedure TfrmKCPD.SpeedButton2Click(Sender: TObject);
var
  i: integer;
  d_date: Tdatetime;
  vs_pdbh: string;
begin
  if dbcombobox1.text = '' then
  begin
    application.MessageBox('请先选择仓库', '材料与计划管理系统', mb_iconinformation + mb_defbutton1);
    dbcombobox1.setfocus;
    exit;
  end;
  if length(trim(dbedit4.text)) <> 9 then
  begin
    application.MessageBox('当前盘店号应为九位', '材料与计划管理系统', mb_iconinformation + mb_defbutton1);
    dbedit4.setfocus;
    exit;
  end;
  vs_pdbh := dbedit4.Text;
  clientdataset_index.IndexFieldNames := '盘点编号';
  clientdataset_index.Refresh;
end;

procedure TfrmKCPD.SpeedButton8Click(Sender: TObject);
var
  i: integer;
  d_date: Tdate;
  vs_pdbh: string;
begin
  if dbcombobox1.text = '' then
  begin
    application.MessageBox('请先选择仓库', '材料与计划管理系统', mb_iconinformation + mb_defbutton1);
    dbcombobox1.setfocus;
    exit;
  end;
 { try
    d_date := strtodate(dbedit3.text);
  except
    application.MessageBox('盘点日期输入是否正确', '材料与计划管理系统', mb_iconinformation + mb_defbutton1);
    dbedit3.setfocus;
    exit;
  end;   }
  if length(trim(dbedit4.text)) <> 9 then
  begin
    application.MessageBox('当前盘店号应为九位', '材料与计划管理系统', mb_iconinformation + mb_defbutton1);
    dbedit4.setfocus;
    exit;
  end;
  vs_pdbh := dbedit4.Text;
  clientdataset_index.IndexFieldNames := '盘点编号';
  clientdataset_index.Refresh;
end;

procedure TfrmKCPD.SpeedButton4Click(Sender: TObject);
var
  i: integer;
  vi_count: integer;
begin
  vi_count := clientdataset2.recordcount;
  clientdataset2.DisableControls;
  clientdataset2.First;
  for i := 0 to vi_count - 1 do
  begin
    if clientdataset2.fieldbyname('实存数量').asfloat = clientdataset2.fieldbyname('盘点数量').asfloat then
      clientdataset2.Delete;
  end;
  clientdataset2.EnableControls;
  dbgrid1.Refresh;
end;

procedure TfrmKCPD.SpeedButton7Click(Sender: TObject);
var
  i: integer;
  vi_count: integer;
begin
  vi_count := clientdataset2.recordcount;
  clientdataset2.DisableControls;
  clientdataset2.First;
  if clientdataset2.recordcount = 0 then
  begin
    application.messagebox('请添加物资', '物资管理系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  for i := 0 to vi_count - 1 do
  begin
    if clientdataset2.fieldbyname('实存数量').asfloat = clientdataset2.fieldbyname('盘点数量').asfloat then
    begin
      application.messagebox('有实存数量同盘店数量一致', '物资管理系统', mb_iconinformation + mb_defbutton1);
      clientdataset2.enablecontrols;
      exit;
    end;
  end;

  speedbutton1.enabled := not speedbutton1.Enabled;
  speedbutton2.enabled := not speedbutton2.enabled;
  speedbutton4.enabled := not speedbutton4.enabled;
  speedbutton5.enabled := not speedbutton5.enabled;
  speedbutton6.enabled := not speedbutton6.enabled;
  speedbutton7.enabled := not speedbutton7.enabled;
  speedbutton8.enabled := not speedbutton8.enabled;
  bitbtn3.visible := not bitbtn3.visible;
  panel1.enabled := not panel1.enabled;
  dbgrid1.columns[3].readonly := not dbgrid1.columns[3].readonly;
  dbgrid1.PopupMenu := nil;
end;

procedure TfrmKCPD.SpeedButton5Click(Sender: TObject);
begin
  speedbutton1.enabled := not speedbutton1.Enabled;
  speedbutton2.enabled := not speedbutton2.enabled;
  speedbutton4.enabled := not speedbutton4.enabled;
  speedbutton5.enabled := not speedbutton5.enabled;
  speedbutton6.enabled := not speedbutton6.enabled;
  speedbutton7.enabled := not speedbutton7.enabled;
  speedbutton8.enabled := not speedbutton8.enabled;
  bitbtn3.visible := not bitbtn3.visible;
  panel1.enabled := not panel1.enabled;
  dbgrid1.columns[3].readonly := not dbgrid1.columns[3].readonly;
  dbgrid1.PopupMenu := nil;
end;

procedure TfrmKCPD.SpeedButton6Click(Sender: TObject);
begin
  speedbutton1.enabled := not speedbutton1.Enabled;
  speedbutton2.enabled := not speedbutton2.enabled;
  speedbutton4.enabled := not speedbutton4.enabled;
  speedbutton5.enabled := not speedbutton5.enabled;
  speedbutton6.enabled := not speedbutton6.enabled;
  speedbutton7.enabled := not speedbutton7.enabled;
  speedbutton8.enabled := not speedbutton8.enabled;
  dbedit4.Enabled := false;
  bitbtn3.visible := not bitbtn3.visible;
  dbgrid1.columns[3].readonly := not dbgrid1.columns[3].readonly;
  panel1.enabled := not panel1.enabled;
  dbgrid1.PopupMenu := popupmenu1;
end;

procedure TfrmKCPD.FormCreate(Sender: TObject);
begin
  clientdataset3.first;
  while not clientdataset3.Eof do
  begin
    dbcombobox1.Items.add(clientdataset3.fieldbyname('仓库名称').asstring);
    clientdataset3.Next;
  end;
end;

procedure TfrmKCPD.FormActivate(Sender: TObject);
begin
//  dbcombobox1.SetFocus;
end;

procedure TfrmKCPD.N1Click(Sender: TObject);
begin
  if clientdataset2.recordcount <> 0 then
    clientdataset2.Delete;
end;

end.

