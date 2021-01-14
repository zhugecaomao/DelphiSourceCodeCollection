unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatButtonUnit, TFlatPanelUnit, Menus,SHellapi, jpeg;
   const
   ChildFormNum=10;
type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    Image1: TImage;
    N32: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N19: TMenuItem;
    N11: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    Timer1: TTimer;
    FlatPanel1: TFlatPanel;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    FlatButton7: TFlatButton;
    FlatButton8: TFlatButton;
    FlatButton10: TFlatButton;
    FlatButton11: TFlatButton;
    FlatButton12: TFlatButton;
    FlatButton13: TFlatButton;
    FlatButton9: TFlatButton;
    Panel1: TPanel;
    FlatPanel2: TFlatPanel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FlatButton13Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FlatButton10Click(Sender: TObject);
    procedure FlatButton11Click(Sender: TObject);
    procedure FlatButton12Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  FirstTime:Boolean;
   vmo,vho,vso:Real;
    { Private declarations }
  public
   QuanXian:integer;
   FName:String;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
   PrintFile:integer;
implementation

uses HUANYINUnit, DENLUUnit, BangZhuUnit, YHGLUnit, XGKLUnit, HYUnit,
  KUUnit, CDUnit, BFHFUnit, FHXXUnit, SHXXUnit, HYDJUnit, DLUnit,
  YWYUnit, KHFYUnit, DMUnit, PrintUnit, CallPrint, MonthUnit, YEARUnit;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
i:integer;
begin
   { if date > strtodate(trim('2003-9-30')) then
      try
        ShowMessage('本系统使用已到期,请注册!');
        Application.Terminate;
      except
    end; }

    with MainForm.Image2.Canvas do
    begin
      Pen.Color:=clwhite;
      Pen.Style:=psSolid;
      Brush.Color:=clwhite;
       Brush.Style:=bsSolid;
      Rectangle(0,0,width,Height);
      pen.Color:=clBlack;
      for i:=1 to 12 do
       Pixels[17+Round(17*sin(i/12.0*2*pi)),17-round(17*cos(i/12.0*2*pi))]:=clblack;
     end;
     FirstTime:=true;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  DENLUForm:=TDENLUForm.Create(Application);
  DENLUForm.ShowModal;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  BangZhuForm:=TBangZhuForm.Create(Self);
    BangZhuForm.ShowModal;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  YHGLForm:=TYHGLForm.Create(Self);
    YHGLForm.ShowModal;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  XGKLForm:=TXGKLForm.Create(Self);
    XGKLForm.ShowModal;
end;

procedure TMainForm.FlatButton13Click(Sender: TObject);
begin
 close;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  BFHFForm:=TBFHFForm.Create(Self);
  BFHFForm.ShowModal;
end;

procedure TMainForm.N15Click(Sender: TObject);
var
i,j:Integer;
FindOne:Boolean;
begin
  FindOne:=False;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
      if MDIChildRen[i] is TFHXXForm then
        begin
          FindOne:=True;
          FHXXForm.Show;
          Break;
          end;
      if not FindOne then
        FHXXForm := TFHXXForm.Create(Self);
end;

procedure TMainForm.N16Click(Sender: TObject);
var
I,j:Integer;
FindOne:Boolean;
begin
  FindOne:=False;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
      if MDIChildRen[i] is TSHXXForm then
      begin
        FindOne:=True;
        SHXXForm.Show;
        Break;
        end;
        if not FindOne then
         SHXXFORM:=TSHXXForm.Create(Self);
end;

procedure TMainForm.N63Click(Sender: TObject);
var
 i,j:Integer;
 FindOne:Boolean;
begin
  FindOne:=False;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
     if MDIChildren[i] is THYDJForm then
     begin
      FindOne:=True;
      HYDJForm.Show;
      Break;
      end;
      if not FindOne then
         HYDJForm:=THYDJForm.Create(Self);
end;

procedure TMainForm.N64Click(Sender: TObject);
var
 i,j:Integer;
 FindOne:Boolean;
begin
  FindOne:=False;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
    If MDIChildRen[i] is TKHForm then
    begin
    FindOne:=True;
    KHForm.Show;
    Break;
    end;
    If not FindOne then
     KHForm:=TkHForm.Create(self);
end;

procedure TMainForm.N65Click(Sender: TObject);
var
  i,j:Integer;
  FindOne:Boolean;
begin
  FindOne:=False;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
     If MDIChildRen[i] is TCDForm then
      begin
      FindOne:=True;
      CDForm.Show;
      Break;
      end;
      If not Findone then
       CDForm:=TCDForm.Create(self);

end;

procedure TMainForm.N66Click(Sender: TObject);
var
i,j:integer;
FindOne:Boolean;
begin
  FindOne:=false;
  For i:=0 to MDIChildCount-1 do
   For j:=0 to ChildFormNum-1 do
     if MDIChildren[i] is TDLForm then
      begin
      FindOne:=true;
      DLForm.Show;
      Break;
      end;
      if not FindOne then
     DLForm:=TDLForm.Create(self);
end;

procedure TMainForm.N19Click(Sender: TObject);
begin
   YWYForm:=TYWYForm.Create(Application);
    YWYForm.ShowModal;
end;

procedure TMainForm.N20Click(Sender: TObject);
var
  i,j:Integer;
  FindOne:Boolean;
begin
  FindOne:=False;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
     If MDIChildRen[i] is THYForm then
     begin
       FindOne:=True;
       HYForm.Show;
       Break;
     end;
       If not FindOne then
         HYForm := THYForm.Create(Self);
end;

procedure TMainForm.N21Click(Sender: TObject);
var
i,j:integer;
FindOne:Boolean;
begin
   FindOne:=False;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
     If MDIChildRen[i] is TKHFYForm then
     begin
       FindOne:=True;
       KHFYForm.Show;
       Break;
     end;
       If not FindOne then
         KHFYForm := TKHFYForm.Create(Self);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var
 MyNow:Tdatetime;
 Hour,Min,Sec,mSec:word;
 vm,vs,vh:Real;
begin
 MyNow:=Now;
 DecodeTime(MyNow,Hour,Min,Sec,mSec);
 vh:=Hour/12.0*2*pi;
 vm:=Min/60.0*2*pi;
 vs:=Sec/60.0*2*pi;
 with MainForm.Image2.Canvas do
  begin
   if not FirstTime then begin
    pen.Color:=clwhite;
    Moveto(17,17);
    Lineto(17+round(12*sin(vho)),17-round(12*cos(vho)));
    Moveto(17,17);
    Lineto(17+round(15*sin(vmo)),17-round(15*cos(vmo)));
    Moveto(17,17);
    Lineto(17+round(15*sin(vso)),17-round(15*cos(vso)));
    end
    else
    FirstTime:=False;
    Pen.Color:=clBlack ;
    Moveto(17,17);
    Lineto(17+round(12*sin(vh)),17-round(12*cos(vh)));
    Moveto(17,17);
    Lineto(17+round(15*sin(vm)),17-round(15*cos(vm)));
    Moveto(17,17);
    Lineto(17+round(15*sin(vs)),17-round(15*cos(vs)));
   end;
   vho:=vh;
   vmo:=vm;
   vso:=vs;

end;

procedure TMainForm.FlatButton10Click(Sender: TObject);
var
 i,j:integer;
 FindOne:Boolean;
begin
  FindOne:=false;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
    If MDIChildRen[i] is TMonthForm then
    begin
    FindOne:=True;
    MonthForm.Show;
    Break;
    end;
    If not FindOne then
     MonthForm:=TMonthForm.Create(self);
end;

procedure TMainForm.FlatButton11Click(Sender: TObject);
var
 i,j:integer;
 FindOne:Boolean;
begin
  FindOne:=false;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
    If MDIChildRen[i] is TYEARForm then
    begin
    FindOne:=True;
    YEARForm.Show;
    Break;
    end;
    If not FindOne then
     YEARForm:=TYEARForm.Create(self);

end;

procedure TMainForm.FlatButton12Click(Sender: TObject);
begin
ShellExecute(handle,nil,'RR.hlp',nil,nil,sw_ShowNormal);
end;

procedure TMainForm.N8Click(Sender: TObject);
var
 i,j:integer;
 FindOne:Boolean;
begin
   FindOne:=false;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
    If MDIChildRen[i] is TMonthForm then
    begin
    FindOne:=True;
    MonthForm.Show;
    Break;
    end;
    If not FindOne then
     MonthForm:=TMonthForm.Create(self);
end;

procedure TMainForm.N9Click(Sender: TObject);
var
 i,j:integer;
 FindOne:Boolean;
begin
  FindOne:=false;
  For i:=0 to MDIChildCount-1 do
    For j:=0 to ChildFormNum-1 do
    If MDIChildRen[i] is TYEARForm then
    begin
    FindOne:=True;
    YEARForm.Show;
    Break;
    end;
    If not FindOne then
     YEARForm:=TYEARForm.Create(self);

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('是否退出畅海货运管理系统？','系统提示',MB_YesNO)=mrNO then
    Abort;
end;

end.
