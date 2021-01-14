unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB, ADODB, ToolWin, ComCtrls, ExtCtrls,
  ImgList, WinSkinData;

type
  TMain_Form = class(TForm)
    Menu1: TMainMenu;
    System_M: TMenuItem;
    Back_M: TMenuItem;
    Front_S: TMenuItem;
    Rave_C: TMenuItem;
    Person_M: TMenuItem;
    Help: TMenuItem;
    System_Tool: TMenuItem;
    System_Back: TMenuItem;
    System_Exit: TMenuItem;
    Back_input: TMenuItem;
    Back_Type: TMenuItem;
    Back_Select: TMenuItem;
    Back_Manage: TMenuItem;
    Front_Sell: TMenuItem;
    Front_day: TMenuItem;
    Rave_Sto: TMenuItem;
    Rave_day: TMenuItem;
    Person_Sup: TMenuItem;
    Person_Comm: TMenuItem;
    Help_Top: TMenuItem;
    Help_About: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    Image1: TImage;
    ImageList1: TImageList;
    ToolButton18: TToolButton;
    ImageList2: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton12: TToolButton;
    ToolButton20: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    SkinData1: TSkinData;
    procedure Help_AboutClick(Sender: TObject);
    procedure Back_ManageClick(Sender: TObject);
    procedure System_ExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Back_TypeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Front_SellClick(Sender: TObject);
    procedure Back_inputClick(Sender: TObject);
    procedure Back_SelectClick(Sender: TObject);
    procedure Front_dayClick(Sender: TObject);
    procedure Rave_StoClick(Sender: TObject);
    procedure System_BackClick(Sender: TObject);
    procedure Person_SupClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ToolButton12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton18MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton20MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Rave_dayClick(Sender: TObject);
    procedure Help_TopClick(Sender: TObject);
    procedure Person_CommClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses about, datamodule, producetype, putproducet, saleunit, entergoo,
  select, backup, UseLogin, admin_unit, help;

{$R *.dfm}

procedure TMain_Form.Help_AboutClick(Sender: TObject);
begin
AboutBox.show;
end;

procedure TMain_Form.Back_ManageClick(Sender: TObject);
begin
Put_Form.show;
end;

procedure TMain_Form.System_ExitClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TMain_Form.N1Click(Sender: TObject);
begin
  if N1.Checked then
    begin
         N1.Checked:=false;
         Back_M.visible:=false;
    end
  else
     begin
          N1.Checked:=true;
          Back_M.visible:=true;
      end;
end;
procedure TMain_Form.N2Click(Sender: TObject);
begin
  if N2.Checked then
    begin
         N2.Checked:=false;
         Front_S.visible:=false;
    end
  else
     begin
          N2.Checked:=true;
          Front_S.visible:=true;
      end;
end;

procedure TMain_Form.N3Click(Sender: TObject);
begin
  if N3.Checked then
    begin
         N3.Checked:=false;
         Rave_C.visible:=false;
    end
  else
     begin
          N3.Checked:=true;
          Rave_C.visible:=true;
      end;
end;

procedure TMain_Form.N4Click(Sender: TObject);
begin
  if N4.Checked then
    begin
         N4.Checked:=false;
         Person_M.visible:=false;
    end
  else
     begin
          N4.Checked:=true;
          Person_M.visible:=true;
      end;
end;

procedure TMain_Form.N5Click(Sender: TObject);
begin
  if N5.Checked then
    begin
         N5.Checked:=false;
         Help.visible:=false;
    end
  else
     begin
          N5.Checked:=true;
          Help.visible:=true;
      end;
end;

procedure TMain_Form.Back_TypeClick(Sender: TObject);
begin
PType_Form.show;
end;

procedure TMain_Form.FormActivate(Sender: TObject);
begin
     with datamodule1 do
         begin
             if adoconnection1.connectionstring='' then
                begin
                  adoconnection1.connectionstring:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+extractfilepath(application.exename)+'\date\super.mdb;Persist Security Info=False';
                  adoconnection1.connected:=true;
                  if not adoquery1.active then
                  adoquery1.open;
                  Login_Form.ShowModal;
                end;
         end;
     if Login_Form.UseType>1 then
     begin
      admin_form.panel1.enabled:=false;
      person_sup.enabled:=false;
     end;
     if Login_Form.UseType>2 then
     begin
     System_M.enabled:=false;
     back_m.enabled:=false;
     person_m.enabled:=false;
     toolbar1.enabled:=false
     end;
end;

procedure TMain_Form.Front_SellClick(Sender: TObject);
begin
Sale_Form.show;
end;

procedure TMain_Form.Back_inputClick(Sender: TObject);
begin
enterFrom.show;
end;

procedure TMain_Form.Back_SelectClick(Sender: TObject);
begin
 sel_From.show;
end;

procedure TMain_Form.Front_dayClick(Sender: TObject);
begin
 with datamodule1.adoquery1 do
 begin
  close;
  SQL.Clear;
  SQL.Add('select sum(s_p_price) as TDResult from sell_back_t where year(s_time)=year(now()) and month(s_time)=month(now()) and day(s_time)=day(now())');
  Open;
  messagebox(handle,PChar('今日销售额为 '+FieldByName('TDResult').AsString+' 元。'),'今日盘点',MB_ICONinformation+mb_ok);
 end;
end;

procedure TMain_Form.Rave_StoClick(Sender: TObject);
begin
with datamodule1 do
begin
adoquery3.close;
adoquery3.open;
rvproject1.projectfile:=extractfilepath(application.exename)+'Super_report.rav';
rvproject1.execute;
rvproject1.close;
end;
end;

procedure TMain_Form.System_BackClick(Sender: TObject);
begin
backup_From.show;
end;

procedure TMain_Form.Person_SupClick(Sender: TObject);
begin
admin_form.show;
end;

procedure TMain_Form.N6Click(Sender: TObject);
begin
 with datamodule1.adoquery2 do
 begin
  close;
  SQL.Clear;
  SQL.Add('select sum(s_p_price) as TDResult from sell_back_t');
  Open;
  messagebox(handle,PChar('历史记录中共统计销售额： '+FieldByName('TDResult').AsString+' 元。'),'销售统计',MB_ICONinformation+mb_ok);
 end;
 if messagebox(handle,'历史记录删除后不能被恢复，销售数据将被置空！是否清除？','确定清空',mb_iconinformation+mb_yesno)=IDNo then exit;
   with datamodule1.adocommand1 do
    begin
     commandtext:='delete from sell_back_t';
      execute;
      showmessage('清空历史记录的操作成功，为了防止数据库过大，建议您定期清空历史记录！！');
    end;
datamodule1.adoquery2.close;
end;

procedure TMain_Form.ToolButton12MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton12.hint:='数据库备份';
end;

procedure TMain_Form.ToolButton18MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton18.hint:='进货单';
end;

procedure TMain_Form.ToolButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton1.hint:='商品类型';
end;

procedure TMain_Form.ToolButton2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton2.hint:='商品查询';
end;

procedure TMain_Form.ToolButton3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton3.hint:='库存管理';
end;

procedure TMain_Form.ToolButton4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton4.hint:='销售库清理';
end;

procedure TMain_Form.ToolButton16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton16.hint:='帮助主题';
end;

procedure TMain_Form.ToolButton5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton5.hint:='关于软件';
end;

procedure TMain_Form.ToolButton8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton8.hint:='退出系统';
end;

procedure TMain_Form.ToolButton20MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton20.hint:='收银台';
end;

procedure TMain_Form.ToolButton13MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton13.hint:='今日盘点';
end;

procedure TMain_Form.ToolButton14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton14.hint:='库存报表';
end;

procedure TMain_Form.ToolButton15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 toolbutton15.hint:='日销售报表';
end;

procedure TMain_Form.Rave_dayClick(Sender: TObject);
begin
with datamodule1 do
begin
adoquery4.close;
adoquery4.open;
rvproject2.projectfile:=extractfilepath(application.exename)+'Super_report2.rav';
rvproject2.execute;
rvproject2.close;
end;
end;

procedure TMain_Form.Help_TopClick(Sender: TObject);
begin
help_form.show;
end;

procedure TMain_Form.Person_CommClick(Sender: TObject);
begin
admin_form.show;
end;

end.
