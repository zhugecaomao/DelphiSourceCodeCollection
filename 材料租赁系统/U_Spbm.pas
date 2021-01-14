unit U_Spbm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons;

type
  TfrmSpbm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    btn_refresh: TSpeedButton;
    btn_insert: TSpeedButton;
    btn_edit: TSpeedButton;
    btn_cancel: TSpeedButton;
    btn_save: TSpeedButton;
    btn_delete: TSpeedButton;
    DBNavigator: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btn_refreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_insertClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpbm: TfrmSpbm;

implementation
      uses main,u_dm,u_public,common,u_SpbmInput;
{$R *.dfm}

procedure TfrmSpbm.FormCreate(Sender: TObject);
begin
top:=0;
left:=0;
dm.ADO_SPBMK.Active :=true;
end;

procedure TfrmSpbm.DBGrid1TitleClick(Column: TColumn);
begin
DBGridSort(dbgrid1, column);
end;

procedure TfrmSpbm.btn_refreshClick(Sender: TObject);
begin
close;
end;

procedure TfrmSpbm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmspbm := nil;
  dm.ADO_SPBMK.Close ;
end;

procedure TfrmSpbm.btn_insertClick(Sender: TObject);
begin
dm.ADO_SPBMK.Insert ;
dm.ADO_SPBMK.FieldByName('hsbl').AsFloat :=1; 
ShowModalForm(TfrmSpbmInput);
end;

procedure TfrmSpbm.btn_deleteClick(Sender: TObject);
begin
 if dm.ADO_SPBMK.recordcount <> 0 then
 begin
  if Application.messagebox('请确认是否要删除!?', '材料租赁系统', mb_iconinformation + mb_yesno) = idyes then
   dm.ADO_SPBMK.Delete
else
   Application.messagebox('已无记录可删除', '材料租赁系统', mb_iconinformation + mb_defbutton1);
exit;
end;
end;
procedure TfrmSpbm.btn_editClick(Sender: TObject);
begin
if dm.ADO_SPBMK.recordcount <> 0 then
begin
 dm.ADO_SPBMK.edit;
 ShowModalForm(TfrmSpbmInput);
end
else
  begin
   Application.messagebox('已无记录可编辑!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
   exit;
  end;
end;

procedure TfrmSpbm.DBGrid1DblClick(Sender: TObject);
begin
if application.MessageBox('是否要修改此编码?！','材料租赁系统!',MB_YESNO)=IDYES then
  btn_edit.Click ; 
end;

end.
