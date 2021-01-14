program DressSale;

uses
  Forms,Controls,
  Main in 'Main.pas' {MainForm},
  CustomerInfo in 'CustomerInfo.pas' {CustomerForm},
  ProductInfomation in 'ProductInfomation.pas' {ProductInfo},
  CustomerRep in 'CustomerRep.pas' {Form1},
  ProductRep in 'ProductRep.pas' {Form2},
  SaleEarnForm in 'SaleEarnForm.pas' {Form5},
  SaleEarnRepP in 'SaleEarnRepP.pas' {SaleEarnRep},
  login in 'mima\login.pas' {loginform},
  md5 in 'mima\md5.pas',
  setsec in 'mima\setsec.pas' {SetsecForm},
  ReturnForm in 'ReturnForm.pas' {SaleReturnForm},
  SaleReturnRep in 'SaleReturnRep.pas' {SaleReturnRepF},
  SaleListUnit in 'SaleListUnit.pas' {SaleList},
  SaleQueryUnit in 'SaleQueryUnit.pas' {SaleQuery},
  salequeryrepunit in 'salequeryrepunit.pas' {salequeryrep},
  splashformunit in 'splashformunit.pas' {splashform};

{$R *.RES}

begin
  Application.Initialize;
   SplashForm :=TSplashForm.Create(Application);

  SplashForm.ShowModal;
   if  (SplashForm.ModalResult = mrOK) then
   begin
  Application.CreateForm(TMainForm, MainForm);
  MainForm.Show;
  SplashForm.Hide;
  SplashForm.Release;

  loginform :=Tloginform.Create(Application);
  loginform.ShowModal;
  Application.Run;
  end;
end.
