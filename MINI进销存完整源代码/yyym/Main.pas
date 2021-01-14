unit Main;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ActnList,CustomerInfo,
  ComCtrls,ProductInfomation, ToolWin, ImgList, jpeg,SaleForm,StrUtils,
  setsec,SaleEarnForm,SaleListUnit;


type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
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
    ActionList1: TActionList;
    Customer: TAction;
    Product: TAction;
    Buy: TAction;
    Pay: TAction;
    Back: TAction;
    BuyQuery: TAction;
    Sale: TAction;
    earn: TAction;
    cancel: TAction;
    SaleQuery: TAction;
    InHouse: TAction;
    PriceChange: TAction;
    OutHouse: TAction;
    StoreQuery: TAction;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N22: TMenuItem;
    N23: TMenuItem;
    Timer1: TTimer;
    S1: TMenuItem;
    X1: TMenuItem;
    Exit: TAction;
    R1: TMenuItem;
    syspwd: TMenuItem;
    pwdset: TAction;
    procedure CustomerExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ProductExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure earnExecute(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure SaleExecute(Sender: TObject);
    procedure syspwdClick(Sender: TObject);
    procedure pwdsetExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure cancelExecute(Sender: TObject);
    procedure SaleQueryExecute(Sender: TObject);
    procedure N15Click(Sender: TObject);
   
  end;

var
  MainForm: TMainForm;

implementation

uses ReturnForm;



{$r *.dfm}


procedure TMainForm.CustomerExecute(Sender: TObject);
begin
  Application.CreateForm(TCustomerForm, CustomerForm);
  
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  Customer.Execute;
end;

procedure TMainForm.ProductExecute(Sender: TObject);
begin
   Application.CreateForm(TProductInfo, ProductInfo);
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
      Product.Execute;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
     Sale.Execute;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
  var mytime:TDateTime;
begin
      mytime:=Now;

  StatusBar1.Panels[0].Text:=LeftStr('当前时间:'+DateToStr(mytime)+' '+TimeToStr(mytime),24);
end;


procedure TMainForm.earnExecute(Sender: TObject);
begin
     Application.CreateForm(TForm5,Form5);
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
   Earn.Execute;
end;

procedure TMainForm.X1Click(Sender: TObject);
begin
    Exit.Execute;
end;

procedure TMainForm.ExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.SaleExecute(Sender: TObject);
begin
            Application.CreateForm(TForm3,Form3);
end;

procedure TMainForm.syspwdClick(Sender: TObject);
begin
 pwdset.Execute;     
end;

procedure TMainForm.pwdsetExecute(Sender: TObject);
begin
   Application.CreateForm(TSetsecForm,SetsecForm);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    MainForm.ToolBar1.Enabled:=False;
    MainForm.PopupMenu1.AutoPopup:=False;
    MainForm.N1.Enabled:=False;
      MainForm.N4.Enabled:=False;
        MainForm.N10.Enabled:=False;
         MainForm.N16.Enabled:=False;
           MainForm.R1.Enabled:=False;


end;


procedure TMainForm.N13Click(Sender: TObject);
begin
  Cancel.Execute;
end;

procedure TMainForm.cancelExecute(Sender: TObject);
begin
      Application.CreateForm(TSaleReturnForm,SaleReturnForm);
end;

procedure TMainForm.SaleQueryExecute(Sender: TObject);
begin
  application.CreateForm(TSaleList,SaleList);
  
   
end;

procedure TMainForm.N15Click(Sender: TObject);
begin
  SaleQuery.Execute;
end;

end.
