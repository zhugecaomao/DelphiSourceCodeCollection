//打印预览  源程序
unit UnitPrint_tmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, qrprntr,Quickrpt,StdCtrls, ExtCtrls,qrextra, ImgList,
  QREXPORT, Menus, BaseForm;

type
  TfrmPrinttmp = class(TForm)
    ControlBar1: TControlBar;
    ToolBar_print: TToolBar;
    ImageList_print: TImageList;
    TB_allscr: TToolButton;
    TB_100: TToolButton;
    TB_auto: TToolButton;
    TB_first: TToolButton;
    ToolButton5: TToolButton;
    TB_PRI: TToolButton;
    TB_NEXT: TToolButton;
    TB_LAST: TToolButton;
    ToolButton9: TToolButton;
    TB_PRINTSETUP: TToolButton;
    TB_PRINT: TToolButton;
    ToolButton12: TToolButton;
    TB_OPEN: TToolButton;
    TB_SAVE: TToolButton;
    ToolButton15: TToolButton;
    TB_EXIT: TToolButton;
    StBar_print: TStatusBar;
    QRP_print: TQRPreview;
    Opendialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    MM_show: TMainMenu;
    showscal: TMenuItem;
    show_10: TMenuItem;
    show_20: TMenuItem;
    show_50: TMenuItem;
    show_75: TMenuItem;
    show_100: TMenuItem;
    show_150: TMenuItem;
    show_200: TMenuItem;
    show_400: TMenuItem;
    procedure TB_allscrClick(Sender: TObject);
    procedure TB_100Click(Sender: TObject);
    procedure TB_autoClick(Sender: TObject);
    procedure TB_firstClick(Sender: TObject);
    procedure TB_PRIClick(Sender: TObject);
    procedure TB_NEXTClick(Sender: TObject);
    procedure TB_LASTClick(Sender: TObject);
    procedure QRP_printPageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_EXITClick(Sender: TObject);
    procedure TB_PRINTSETUPClick(Sender: TObject);
    procedure TB_PRINTClick(Sender: TObject);
    procedure show_10Click(Sender: TObject);
    procedure QRP_printMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure QRP_printMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure QRP_printMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure QRP_printDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TB_SAVEClick(Sender: TObject);
    procedure TB_OPENClick(Sender: TObject);
  private
    { Private declarations }
    FPageCount : integer;
    I_mouseX,I_mouseY:integer;
    B_mouse:bool;
  public
    { Public declarations }
    CurRep : TQuickRep;
  end;

var
   frmPrinttmp: TfrmPrinttmp;
implementation

uses UnitData;


{$R *.DFM}
procedure TfrmPrinttmp.TB_allscrClick(Sender: TObject);
begin
   QRP_print.ZoomToFit;
end;

procedure TfrmPrinttmp.TB_100Click(Sender: TObject);
begin
   show_10.checked:=false;
   show_20.checked:=false;
   show_50.checked:=false;
   show_75.checked:=false;
   show_100.checked:=true;
   show_150.checked:=false;
   show_200.checked:=false;
   show_400.checked:=false;
   QRP_print.Zoom:=100;
   
end;

procedure TfrmPrinttmp.TB_autoClick(Sender: TObject);
begin
   QRP_print.ZoomToWidth;
end;

procedure TfrmPrinttmp.TB_firstClick(Sender: TObject);
begin
     QRP_print.PageNumber := 1;
     self.FormShow(self);
end;

procedure TfrmPrinttmp.TB_PRIClick(Sender: TObject);
begin
   QRP_PRINT.PageNumber := QRP_print.PageNumber-1;
     if QRP_print.PageNumber =0 then
        QRP_print.PageNumber:=1;
     self.FormShow(self);
end;

procedure TfrmPrinttmp.TB_NEXTClick(Sender: TObject);
begin
     QRP_print.PageNumber := QRP_print.PageNumber+1;
     self.FormShow(self);
end;

procedure TfrmPrinttmp.TB_LASTClick(Sender: TObject);
begin
     QRP_print.PageNumber := FPageCount;
     self.FormShow(self);
end;

procedure TfrmPrinttmp.QRP_printPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
     FPageCount := PageNum ;
     self.FormShow(self);
end;

procedure TfrmPrinttmp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     CurRep := nil;
     Action := caFree;
end;

procedure TfrmPrinttmp.TB_EXITClick(Sender: TObject);
begin
   close;
end;

procedure TfrmPrinttmp.TB_PRINTSETUPClick(Sender: TObject);
begin
   try
      QRP_print.QRPrinter.PrintSetup;
   except
      Msgs('没有找到或系统没有安装默认打印机!')
   end;

end;

procedure TfrmPrinttmp.TB_PRINTClick(Sender: TObject);
begin
   if Msgs('确定要按当前设置进行打印吗？','OKCANCEL')=mrok then
   begin
      tb_print.Enabled :=false;
      QRP_print.QRPrinter.Print;
      tb_print.Enabled :=true;
   end;
end;

procedure TfrmPrinttmp.show_10Click(Sender: TObject);
begin
   show_10.checked:=false;
   show_20.checked:=false;
   show_50.checked:=false;
   show_75.checked:=false;
   show_100.checked:=false;
   show_150.checked:=false;
   show_200.checked:=false;
   show_400.checked:=false;
   (sender as TMenuItem).Checked :=true;
   if sender=show_10 then
      QRP_print.Zoom:=10
   else if sender=show_20 then
      QRP_print.Zoom:=20
   else if sender=show_50 then
      QRP_print.Zoom:=50
   else if sender=show_75 then
      QRP_print.Zoom:=75
   else if sender=show_100 then
      QRP_print.Zoom:=100
   else if sender=show_150 then
      QRP_print.Zoom:=150
   else if sender=show_200 then
      QRP_print.Zoom:=200
   else if sender=show_400 then
      QRP_print.Zoom:=400;

end;

procedure TfrmPrinttmp.QRP_printMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if button<>mbRight then
   begin
      I_mouseX:=x;
      I_mouseY:=y;
      b_mouse:=true;
   end
   else
   begin
      if QRP_print.Zoom>20 then QRP_print.Zoom:=QRP_print.Zoom-10;
      show_10.checked:=false;
      show_20.checked:=false;
      show_50.checked:=false;
      show_75.checked:=false;
      show_100.checked:=false;
      show_150.checked:=false;
      show_200.checked:=false;
      show_400.checked:=false;
   end;
end;

procedure TfrmPrinttmp.QRP_printMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   if b_mouse then
   begin
     with qrp_print.HorzScrollBar do
     begin
        Position :=position+(I_mousex-x);
     end;
     with qrp_print.vertScrollBar do
     begin
        Position :=position+(I_mousey-y);
     end;
   end;
     self.StBar_print.Panels.Items[1].Text:=' 第 '+inttostr(self.QRP_print.PageNumber)+
   ' 页  共 '+inttostr(self.FPageCount)+' 页';

end;

procedure TfrmPrinttmp.QRP_printMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   b_mouse:=false;
end;

procedure TfrmPrinttmp.QRP_printDblClick(Sender: TObject);
begin
   if QRP_print.Zoom<400 then QRP_print.Zoom:=QRP_print.Zoom+10;
   show_10.checked:=false;
   show_20.checked:=false;
   show_50.checked:=false;
   show_75.checked:=false;
   show_100.checked:=false;
   show_150.checked:=false;
   show_200.checked:=false;
   show_400.checked:=false;
end;

procedure TfrmPrinttmp.FormResize(Sender: TObject);
begin
  toolbar_print.Width :=self.Width;
end;

procedure TfrmPrinttmp.FormShow(Sender: TObject);
begin
   toolbar_print.Width :=self.Width;
   if qrp_print.pagenumber=1 then
     begin
       tb_first.enabled:=false;
       tb_pri.Enabled :=false;
     end;
     if qrp_print.pagenumber>1 then
     begin
       tb_first.enabled:=true;
       tb_pri.Enabled :=true;
     end;
     if QRP_print.PageNumber>=fpagecount then
     begin
       tb_next.Enabled :=false;
       tb_last.Enabled :=false;
     end
     else
     begin
       tb_next.Enabled :=true;
       tb_last.Enabled :=true;
     end;
     self.StBar_print.Panels.Items[1].Text:=' 第 '+inttostr(self.QRP_print.PageNumber)+
   ' 页  总 '+inttostr(self.FPageCount)+' 页';
end;

procedure TfrmPrinttmp.TB_SAVEClick(Sender: TObject);
var
   fn:string;
begin
   SaveDialog.Filter :='打印文件（*.PRN）|*.PRN';
   SaveDialog.Title :='保存 PRN格式文件';
   SaveDialog.DefaultExt :='PRN';
   if SaveDialog.Execute  then
   begin
      fn:=SaveDialog.FileName;
      if FileExists(fn) then
      begin
         if Msgs('文件已经存在，是否覆盖？','YESNO')=mrno then
         begin
            exit;        //不保存退出
         end;
      end;
      try
         QRP_print.QRPrinter.Save(fn);
         Msgs('PRN格式文件保存成功，文件名为“'+fn+'”');
      except
         Msgs('PRN格式文件保存失败！');
      end;
   end;
end;

procedure TfrmPrinttmp.TB_OPENClick(Sender: TObject);
var
   fname:string;
begin
   opendialog.Filter :='ThinkNet打印文件（*.PRN）|*.PRN';
   opendialog.Title :='打开 PRN格式文件';
   if opendialog.Execute  then
   begin
      fname:=opendialog.FileName ;
      if not fileexists(fname) then
      begin
         Msgs('ThinkNET打印数据文件不存在，请重新选择');
         exit;
      end;
      try
         QRP_print.QRPrinter.Load(fname);
         Msgs('ThinkNET打印文件导入成功。');
      except
         Msgs('ThinkNET打印文件导入失败。');
      end;
   end;
end;

end.
