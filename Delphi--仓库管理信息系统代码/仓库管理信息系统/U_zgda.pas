unit U_zgda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, ImgList, Menus, ComCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls,
  Grids, DBGrids, Buttons, ADODB;

type
  TfrmZgda = class(TForm)
    Panel2: TPanel;
    ImageList1: TImageList;
    dsZGDA: TDataSource;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ImageList2: TImageList;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBNavigator1: TDBNavigator;
    N5: TMenuItem;
    N6: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    DataSource2: TDataSource;
    aqZGDA: TADOQuery;
    btnCancel: TSpeedButton;
    Label13: TLabel;
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmZgda: TfrmZgda;
  gs_bmbm: string;
  gb_pd: bool;
implementation

uses uDB,uPublic, U_zgdakp, U_szcx;

{$R *.DFM}


procedure TfrmZgda.N2Click(Sender: TObject);
begin
  try
    application.createform(TfrmZgda_Kp, frmZgda_Kp);
    aqZGDA.edit;
    frmZgda_Kp.showmodal;
  finally
    frmZgda_Kp.free;
  end;
end;

procedure TfrmZgda.N1Click(Sender: TObject);
begin
  if aqZGDA.recordcount <> 0 then
  begin
    if Application.messagebox('请确认是否要删除', '仓库管理系统', mb_iconinformation + mb_yesno) = idyes then
    begin
      aqZGDA.delete;
    end;
  end
  else
  begin
    Application.messagebox('已没有记录可删除，请确认!', '仓库管理系统', mb_iconinformation + mb_defbutton1);
  end;
end;


procedure TfrmZgda.N3Click(Sender: TObject);
var
  vs_value: string;
  vi, i: integer;
begin
  application.createform(TfrmSzcx, frmSzcx);
  frmSzcx.srclist.items.add('EmpID');
  frmSzcx.srclist.items.add('EmpName');
  frmSzcx.srclist.items.add('Sex');
  frmSzcx.srclist.items.add('BirthDate');
  frmSzcx.srclist.items.add('Policits');
  frmSzcx.srclist.items.add('Caption');
  try
    frmSzcx.showmodal;
  finally
    if Ordered then
    begin
      vi := frmSzcx.DstList.Items.Count;
      if vi > 0 then
      begin
        vs_value := frmSzcx.dstlist.items[0];
      end;
      for i := 2 to vi do
      begin
        vs_value := vs_value + ';' + frmSzcx.dstlist.items[i - 1];
      end;
      aqZGDA.SQL.Text:= 'select * from ZGDA order by "'+ vs_value + '"';
      aqZGDA.Open;
    end;
    frmSzcx.free;
  end;
end;

procedure TfrmZgda.N5Click(Sender: TObject);
begin
  application.CreateForm(TfrmZgda_Kp, frmZgda_Kp);
  try
    aqZGDA.insert;
    frmZgda_Kp.showmodal;
  finally
    frmZgda_Kp.free;
  end;
end;

procedure TfrmZgda.SpeedButton1Click(Sender: TObject);
begin
  N5.click;
end;

procedure TfrmZgda.SpeedButton2Click(Sender: TObject);
begin
  N1.click;
end;

procedure TfrmZgda.SpeedButton3Click(Sender: TObject);
begin
  N2.click;
end;

procedure TfrmZgda.SpeedButton4Click(Sender: TObject);
begin
  N4.click;
end;

procedure TfrmZgda.SpeedButton5Click(Sender: TObject);
begin
  N6.click;
end;

procedure TfrmZgda.DBGrid1TitleClick(Column: TColumn);
begin
  DbGridSort(dbgrid1, column);
end;

procedure TfrmZgda.FormCreate(Sender: TObject);
begin
  aqZGDA.FieldByName('birthdate').editmask := '9999/99;1;_';
end;

procedure TfrmZgda.btnCancelClick(Sender: TObject);
begin
  close;
end;

end.

