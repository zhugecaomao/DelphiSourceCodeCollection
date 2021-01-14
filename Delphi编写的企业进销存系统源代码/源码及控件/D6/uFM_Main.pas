unit uFM_Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, uLogin,StdCtrls, Buttons, ToolWin, Db, DBTables,
  ExtCtrls;

type
  TFM_Main = class(TForm)
    MainMenu1: TMainMenu;
    N0: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    StatusBar1: TStatusBar;
    N5: TMenuItem;
    N6: TMenuItem;
    B01_C: TMenuItem;
    B02_C: TMenuItem;
    B12_C: TMenuItem;
    Qry1: TQuery;
    B13_M: TMenuItem;
    N9: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    B11_CP: TSpeedButton;
    B01_CP: TSpeedButton;
    Bevel1: TBevel;
    C01_CP: TSpeedButton;
    C02_CP: TSpeedButton;
    C03_CP: TSpeedButton;
    Bevel2: TBevel;
    A03_CP: TSpeedButton;
    C05_CP: TSpeedButton;
    Bevel3: TBevel;
    A04_CP: TSpeedButton;
    Bevel4: TBevel;
    C18_CP: TSpeedButton;
    Bevel5: TBevel;
    SpeedButton4: TSpeedButton;
    Bevel6: TBevel;
    B03_C: TMenuItem;
    B04_C: TMenuItem;
    N12: TMenuItem;
    B05_C: TMenuItem;
    A02_C: TMenuItem;
    B07_C: TMenuItem;
    B08_C: TMenuItem;
    B09_C: TMenuItem;
    N18: TMenuItem;
    B10_C: TMenuItem;
    B11_C: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    C01_C: TMenuItem;
    C02_C: TMenuItem;
    C18_C: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    C03_C: TMenuItem;
    A03_C: TMenuItem;
    C05_C: TMenuItem;
    A04_C: TMenuItem;
    N25: TMenuItem;
    C07_C: TMenuItem;
    C08_C: TMenuItem;
    N28: TMenuItem;
    C09_C: TMenuItem;
    A05_C: TMenuItem;
    C11_C: TMenuItem;
    N32: TMenuItem;
    C12_C: TMenuItem;
    C13_C: TMenuItem;
    N35: TMenuItem;
    C14_C: TMenuItem;
    C15_C: TMenuItem;
    N38: TMenuItem;
    C16_C: TMenuItem;
    C17_C: TMenuItem;
    N11: TMenuItem;
    F01_C: TMenuItem;
    F02_C: TMenuItem;
    F03_C: TMenuItem;
    F04_C: TMenuItem;
    F05_C: TMenuItem;
    N17: TMenuItem;
    D02_C: TMenuItem;
    D03_C: TMenuItem;
    D05_C: TMenuItem;
    N29: TMenuItem;
    D07_C: TMenuItem;
    D09_C: TMenuItem;
    N36: TMenuItem;
    D11_C: TMenuItem;
    D13_C: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    D01_C: TMenuItem;
    D04_C: TMenuItem;
    D06_C: TMenuItem;
    D08_C: TMenuItem;
    D10_C: TMenuItem;
    D12_C: TMenuItem;
    F06_C: TMenuItem;
    N19: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N26: TMenuItem;
    B14_C: TMenuItem;
    N30: TMenuItem;
    N4: TMenuItem;
    A01_C: TMenuItem;
    N31: TMenuItem;
    B06_C: TMenuItem;
    Image1: TImage;
    N16: TMenuItem;
    N20: TMenuItem;
    A06_C: TMenuItem;
    A07_C: TMenuItem;
    A08_C: TMenuItem;
    A09_C: TMenuItem;
    F07_C: TMenuItem;
    F08_C: TMenuItem;
    C19_C: TMenuItem;
    C20_C: TMenuItem;
    N34: TMenuItem;
    LoginForm1: TLoginForm;
    procedure ShowFM(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure D04_CClick(Sender: TObject);
    procedure D08_CClick(Sender: TObject);
    procedure D12_CClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure A08_CClick(Sender: TObject);
  private
    { Private declarations }
    FClientInstance,FPrevClientProc : TFarProc;
    procedure IfEnabled;
    procedure ClientWndProc(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  FM_Main : TFM_Main;
  LoginForm1 : TLoginForm;

implementation

uses uDM, utilities, uFM_USR, uFM_PSW, uFM_1010, uFM_1020, uFM_1030, uFM_1040,
  uFM_1050, uFM_1060, uFM_1070, uFM_1080, uFM_1090, uFM_1100, uFM_SYS, uFM_2030,
  uFM_2040, uFM_2010, uFM_2020, uFM_2160, uFM_2150, uFM_2070, uFM_2080, uFM_2120,
  uFM_2121, uFM_2151, uFM_2100, uFM_2130, uFM_2090, uFM_2110, uFM_2140, uFM_2050,
  uFM_2060, uFM_4010, uFM_4011, uFM_4012, uFM_4013, uFM_4014, uFM_3010, uFM_3020,
  uFM_3040, uFM_3060, uFM_3080, uFM_3100, uFM_3120, uFM_4010A, uFM_3090, uFM_4020,
  uFM_3050, uRp_3020, uRp_3060, uRp_3110, uFM_3021, uFM_1091, uFM_1011, uFM_5010,
  uFM_5070, uFM_5090, uFM_5060, uRp_5080, uFM_4030, uFM_4040, uFM_2170, uFM_2180;

Const
  FMClass_B: array[1..14] of TFormClass
             = (TFM_1010,TFM_1020,TFM_1030,TFM_1040,TFM_1050,TFM_1011,TFM_1070,TFM_1080,
                TFM_1090,TFM_1100,TFM_SYS,TFM_USR,TFM_PSW,TFM_1091);
  FMClass_C: array[1..20] of TFormClass
             = (TFM_2010,TFM_2020,TFM_2030,nil,TFM_2050,nil,TFM_2070,TFM_2080,
                TFM_2090,nil,TFM_2110,TFM_2120,TFM_2121,TFM_2130,TFM_2140,TFM_2150,TFM_2151,TFM_2160,TFM_2170,TFM_2180);
  FMClass_D: array[1..13] of TFormClass
             = (TFM_3010,TFM_3020,TFM_3021,nil,TFM_3040,TFM_3050,TFM_3060,nil,TFM_3080,
                TFM_3090,TFM_3100,TFM_3100,TFM_3120);
               //TFM_3030,TFM_3070
  FMClass_F: array[1..8] of TFormClass
             = (TFM_4010,TFM_4011,TFM_4012,TFM_4013,TFM_4014,TFM_4020,TFM_4030,TFM_4040);

  FMClass_A: array[1..9] of TFormClass
             = (TFM_5010,TFM_1060,TFM_2040,TFM_2060,TFM_2100,TFM_5060,TFM_5070,nil,TFM_5090);

  //FMClass_G: array[1..2] of TFormClass
            // = (TFM_DataClear,TFM_DataClear);

{$R *.DFM}
procedure TFM_Main.ClientWndProc(var Message: TMessage);
VAR
  MyDC : hDC;
  Ro, Co : Word;
begin
  with Message do
    case Msg of
      WM_ERASEBKGND: begin
        MyDC := TWMEraseBkGnd(Message).DC;
        for Ro := 0 TO ClientHeight DIV Image1.Picture.Height do
          for Co := 0 TO ClientWIDTH DIV Image1.Picture.Width do
            BitBlt(MyDC, Co*Image1.Picture.Width, Ro*Image1.Picture.Height,
            Image1.Picture.Width, Image1.Picture.Height,
            Image1.Picture.Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
        Result := 1;
      end;
      WM_KEYDOWN: begin
        case wParam of
          VK_ESCAPE : Self.Close;
        end;
      end;
      else
        Result := CallWindowProc(FPrevClientProc, ClientHandle, Msg, wParam, lParam);
    end;
end;



procedure TFM_Main.IfEnabled;  //检查使用者的权限，确定功能项 Enabled 属性的值.
var
  I: Integer;
  Temp: TComponent;
  sSql : string;
begin
  for I := ComponentCount - 1 downto 0 do begin
    Temp := Components[I];
    if (Temp is TMenuItem) then begin
       sSql := 'select F01 from TUserRight where NM='+''''+GlobalUser+'''' +' and K_SN='+''''+TMenuItem(Temp).hint+'''';
       QryExec(Qry1,sSql);
       if qry1.RecordCount >= 1  then
          TMenuItem(Temp).enabled :=Qry1.FieldByName('F01').AsBoolean;
     end;

     if (Temp is TSpeedButton)  then begin
       sSql := 'select F01 from TUserRight where NM='+''''+GlobalUser+'''' +' and K_SN='+''''+TSpeedButton(Temp).hint+'''';
       QryExec(Qry1,sSql);
       if qry1.RecordCount >= 1  then
          TSpeedButton(Temp).enabled :=Qry1.FieldByName('F01').AsBoolean;
     end;
  end;
end;



procedure TFM_Main.ShowFM(Sender: TObject);
begin
      { 菜单 Click 时, 弹出对应窗口的通用程式 }
   case TWinControl(Sender).name[1] of
    'B','b': ShowWorkForm(FMClass_B, Sender);
    'C','c': ShowWorkForm(FMClass_C, Sender);
    'D','d': ShowWorkForm(FMClass_D, Sender);
    'F','f': ShowWorkForm(FMClass_F, Sender);
    'A','a': ShowWorkForm(FMClass_A, Sender);
  end;

end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  IfEnabled;
  FClientInstance := MakeObjectInstance(ClientWndProc);
  FPrevClientProc := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FClientInstance));
end;

procedure TFM_Main.N9Click(Sender: TObject);
begin
  LoginForm1 := TLoginForm.Create(Application);
  LoginForm1.Exec := True;
  LoginForm1.DataBaseName := 'STK0311';
  LoginForm1.TableName:='TUser';
  LoginForm1.KeyFields:='NM';
  LoginForm1.NameField:='NM';
  LoginForm1.RightField:='PW';
  LoginForm1.PassWordField:='PW';

  if LoginForm1.RunL then begin //执行使用者登录的动作
     GlobalUser_Level := LoginForm1.UserRight;
     GlobalUser := LoginForm1.UserName;
     IfEnabled;
     R_OkMessage(['重新登入成功!'],'',MB_ICONINFORMATION);
  end 
end;


procedure TFM_Main.N22Click(Sender: TObject);
begin
  close;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not R_YesNoMessage(['您确定要退出本系统?']) Then
     Action := caNone;
end;
procedure TFM_Main.D04_CClick(Sender: TObject);
var
 s: string;
begin
   s := formatdatetime('YYMM',Date);
  if not inputQuery('帐款年月','请输入您要列印的帐款年月        ',s) then
   exit;

  Rp_3020 := TRp_3020.Create(self);
  try
  with Rp_3020 do
   begin
    Query1.Close;
    Query1.Params[0].AsString := s;
    Query1.Open;
    Preview;
   end;
   finally
   Rp_3020.Free;
   end;
end;

procedure TFM_Main.D08_CClick(Sender: TObject);
var
  s:string;
begin
  s := formatdatetime('YYMM',Date);
  if not inputQuery('帐款年月','请输入您要列印的帐款年月        ',s) then
   exit;

  Rp_3060 := TRp_3060.Create(self);
  try
  with Rp_3060 do
   begin
    Query1.Close;
    Query1.Params[0].AsString := s;
    Query1.Open;
    Preview;
   end;
   finally
   Rp_3060.Free;
   end;

end;

procedure TFM_Main.D12_CClick(Sender: TObject);
var
  s:string;
begin
  s := formatdatetime('YYMM',Date);
  if not inputQuery('帐款年月','请输入您要列印的帐款年月        ',s) then
   exit;

  Rp_3110 := TRp_3110.Create(self);
  try
  with Rp_3110 do
   begin
    Query1.Close;
    Query1.Params[0].AsString := s;
    Query1.Open;
    Preview;
   end;
   finally
   Rp_3110.Free;
   end;

end;

procedure TFM_Main.N19Click(Sender: TObject);
begin
  { MDI Child 窗口重叠排列命令 }
  Cascade;
end;

procedure TFM_Main.N23Click(Sender: TObject);
begin
  { MDI Child 窗口水平排列命令 }
  TileMode := tbHorizontal;
  Tile;
end;

procedure TFM_Main.N24Click(Sender: TObject);
begin
  { MDI Child 窗口垂直排列命令 }
  TileMode := tbVertical;
  Tile;
end;

procedure TFM_Main.A08_CClick(Sender: TObject);
var
  s:string;
begin
  s := formatdatetime('YYMM',Date);
  if not inputQuery('帐款年月','请输入您要列印的帐款年月        ',s) then
   exit;

  Rp_5080 := TRp_5080.Create(self);
  try
  with Rp_5080 do
   begin
    Query1.Close;
    Query1.Params[0].AsString := s;
    Query1.Open;
    Preview;
   end;
   finally
   Rp_5080.Free;
   end;

end;

end.

