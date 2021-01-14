unit Unit1;

interface

uses
  Windows, Messages, SysUtils,comobj, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, ToolWin, ImgList;

type
  Tmainform = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    K1: TMenuItem;
    W1: TMenuItem;
    Z1: TMenuItem;
    C1: TMenuItem;
    N3: TMenuItem;
    Z2: TMenuItem;
    H1: TMenuItem;
    N5: TMenuItem;
    Q1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N4: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
   
    procedure ToolButton4Click(Sender: TObject);
  private
   ExcelID:Variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainform: Tmainform;

implementation

uses Unit2,unit3,  Unit7, Unit4, Unita, Unit5, Unit6, form21, form31,
  formquery1, formquery2, form41, formquery3, form51, formquery4, form62,
  formquery5, form71, formquery6, unitkey, unitkey2;

{$R *.dfm}

procedure Tmainform.FormCreate(Sender: TObject);
begin
timer1timer(nil);
sleep(4000);
mainform.WindowState:=wsMaximized;

end;

procedure Tmainform.N8Click(Sender: TObject);
begin
    if messagedlg('真的要退出吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
     application.Terminate;
end;

procedure Tmainform.N5Click(Sender: TObject);
begin
application.CreateForm(taboutbox,aboutbox);
aboutbox.showmodal;
end;

procedure Tmainform.N12Click(Sender: TObject);
begin
application.CreateForm(tform3,form3);
form3.showmodal;
end;

procedure Tmainform.N14Click(Sender: TObject);
begin
application.CreateForm(tform4,form4);
form4.showmodal;
end;

procedure Tmainform.N16Click(Sender: TObject);
begin
application.CreateForm(tform5,form5);
form5.showmodal;
end;

procedure Tmainform.N22Click(Sender: TObject);
begin
application.CreateForm(tform7,form7);
form7.showmodal;
end;

procedure Tmainform.N9Click(Sender: TObject);
begin
application.CreateForm(tform2,form2);
form2.showmodal;
end;

procedure Tmainform.N18Click(Sender: TObject);
begin
application.CreateForm(tform6_1,form6_1);
form6_1.showmodal;
end;

procedure Tmainform.N4Click(Sender: TObject);
begin
application.CreateForm(tform1_1,form1_1);
form1_1.showmodal;
end;

procedure Tmainform.N11Click(Sender: TObject);
begin
application.CreateForm(tform2_1,form2_1);
form2_1.showmodal;
end;

procedure Tmainform.N10Click(Sender: TObject);
begin
application.CreateForm(tform_query1,form_query1);
form_query1.showmodal;
end;

procedure Tmainform.N13Click(Sender: TObject);
begin
application.CreateForm(tform_query2,form_query2);
form_query2.showmodal;
end;

procedure Tmainform.N6Click(Sender: TObject);
begin
application.CreateForm(tform4_1,form4_1);
form4_1.showmodal;
end;

procedure Tmainform.N15Click(Sender: TObject);
begin
application.CreateForm(tform_query3,form_query3);
form_query3.showmodal;
end;

procedure Tmainform.N7Click(Sender: TObject);
begin
application.CreateForm(tform5_1,form5_1);
form5_1.showmodal;
end;

procedure Tmainform.N17Click(Sender: TObject);
begin
application.CreateForm(tformquery_4,formquery_4);
formquery_4.showmodal;
end;

procedure Tmainform.N19Click(Sender: TObject);
begin
application.CreateForm(tform6_2,form6_2);
form6_2.showmodal;;
end;

procedure Tmainform.N20Click(Sender: TObject);
begin
application.CreateForm(tformquery_5,formquery_5);
formquery_5.showmodal;
end;

procedure Tmainform.N21Click(Sender: TObject);
begin
application.CreateForm(tform7_1,form7_1);
form7_1.showmodal;
end;

procedure Tmainform.N23Click(Sender: TObject);
begin
application.CreateForm(tformquery_6,formquery_6);
formquery_6.showmodal;
end;

procedure Tmainform.N25Click(Sender: TObject);
begin
application.CreateForm(tformkey2,formkey2);
formkey2.ShowModal;
end;

procedure Tmainform.N27Click(Sender: TObject);
begin
 try
    ExcelID:=CreateOleObject('Excel.Application');
    ExcelID.Caption := '车辆动态运营表';

    try
      ExcelID.WorkBooks.Open('C:\Program Files\和信科技\车辆管理系统\date\car.xls');
       ExcelID.Visible:=True;
    except
     OpenDialog1.Filter:='工作表文件|*.xls';
      if(OpenDialog1.Execute)then
        begin
         ExcelID.WorkBooks.Open( OpenDialog1.Filename);
         ExcelID.Visible:=True;
        end;
    end;
 except
    Application.MessageBox('本机没有安装Excel，请安装！','警告');
    Exit;
 end;
end;

procedure Tmainform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tmainform.FormActivate(Sender: TObject);
begin

Application.CreateForm(Tformkey, formkey);
formkey.ShowModal;
end;

procedure Tmainform.Timer1Timer(Sender: TObject);
begin
STATUSBAR1.PANELS[2].TEXT:='现在时间  '+timetostr(time);
end;

procedure Tmainform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);

begin
    if messagedlg('真的要退出吗？',mtconfirmation,[mbyes,mbno],0)=mrno then
     canclose:=false;
end;

procedure Tmainform.ToolButton1Click(Sender: TObject);
begin
application.CreateForm(tformkey2,formkey2);
formkey2.ShowModal;
end;

procedure Tmainform.ToolButton2Click(Sender: TObject);
begin
application.CreateForm(taboutbox,aboutbox);
aboutbox.showmodal;
end;

procedure Tmainform.ToolButton3Click(Sender: TObject);
begin
 if messagedlg('真的要退出吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    application.Terminate;
end;

procedure Tmainform.ToolButton4Click(Sender: TObject);
begin
 try
    ExcelID:=CreateOleObject('Excel.Application');
    ExcelID.Caption := '车辆动态运营表';

    try
      ExcelID.WorkBooks.Open('C:\Program Files\和信科技\车辆管理系统\date\car.xls');
       ExcelID.Visible:=True;
    except
     OpenDialog1.Filter:='工作表文件|*.xls';
      if(OpenDialog1.Execute)then
        begin
         ExcelID.WorkBooks.Open( OpenDialog1.Filename);
         ExcelID.Visible:=True;
        end;
    end;
 except
    Application.MessageBox('本机没有安装Excel，请安装！','警告');
    Exit;
 end;
end;

end.

