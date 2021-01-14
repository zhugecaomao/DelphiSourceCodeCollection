program GD_Glasses_Client;

uses
  Forms,
  Windows,
  Connect in 'Connect.pas' {frm_Connect},
  Data in 'Data.pas' {frm_Data: TDataModule},
  Login in 'Login.pas' {frm_Login},
  Main in 'Main.pas' {frm_Main},
  func in 'func.pas',
  IMCode in 'IMCode.pas',
  Spalsh in 'Spalsh.pas' {frm_Spalsh},
  Member in 'Member.pas' {frm_Member},
  Goods_demand in 'Goods_demand.pas' {frm_Goods_demand},
  Stock_Report in 'Stock_Report.pas' {frm_Stock_Report},
  Stock_Contract in 'Stock_Contract.pas' {frm_Stock_Contract},
  Order_Select in 'Order_Select.pas' {frm_Order_Select},
  Stock_State in 'Stock_State.pas' {frm_Stock_State},
  Storage_Select in 'Storage_Select.pas' {frm_Storage_Select},
  Goods_Cent in 'Goods_Cent.pas' {frm_Goods_Cent},
  Demand_Enter in 'Demand_Enter.pas' {frm_Demand_Enter},
  Demand_Fad in 'Demand_Fad.pas' {frm_Demand_Fad},
  Demand_Balance in 'Demand_Balance.pas' {frm_Demand_Balance},
  Umanage_Enter in 'Umanage_Enter.pas' {frm_Umanage_Enter},
  Umanage_Fad in 'Umanage_Fad.pas' {frm_Umanage_Fad},
  Price_Chang in 'Price_Chang.pas' {frm_Price_Chang},
  Storage_damage in 'Storage_damage.pas' {frm_Storage_damage},
  Storage_Extravasate in 'Storage_Extravasate.pas' {frm_Storage_Extravasate},
  Storage_Check in 'Storage_Check.pas' {frm_Storage_Check},
  Storage_Check_Search in 'Storage_Check_Search.pas' {frm_Storage_Check_Search},
  price_attemper in 'price_attemper.pas' {frm_price_attemper},
  Uprice_attemper in 'Uprice_attemper.pas' {frm_Uprice_attemper},
  Storage_police in 'Storage_police.pas' {frm_Storage_police},
  Storage_Warn in 'Storage_Warn.pas' {frm_Storage_Warn},
  limit in 'limit.pas' {frm_limit},
  Sale_Contract in 'Sale_Contract.pas' {frm_Sale_Contract},
  Sale_Out in 'Sale_Out.pas' {frm_Sale_Out},
  Total_Search in 'Total_Search.pas' {frm_Total_Search},
  Sale_Report in 'Sale_Report.pas' {frm_Sale_Report},
  Storage_List in 'Storage_List.pas' {frm_Storage_List},
  Sign_Search in 'Sign_Search.pas' {frm_Sign_Search},
  Thing_Base in 'Thing_Base.pas' {frm_Thing_Base},
  Stock_Contract_Search in 'Stock_Contract_Search.pas' {frm_Stock_Contract_Search},
  Login_Man in 'Login_Man.pas' {frm_Login_Man},
  Goods_Requirement in 'Goods_Requirement.pas' {frm_Goods_Requirement},
  Begin_Build in 'Begin_Build.pas' {frm_Begin_Build},
  Begin_Goods in 'Begin_Goods.pas' {frm_Begin_Goods},
  Goods_Information in 'Goods_Information.pas' {frm_Goods_Information},
  Supply_Monad in 'Supply_Monad.pas' {frm_Supply_Monad},
  Begin_Edit in 'Begin_Edit.pas' {frm_Begin_Edit},
  Money_Edit in 'Money_Edit.pas' {frm_Money_Edit},
  Parameter_Set in 'Parameter_Set.pas' {frm_Parameter_Set},
  Goods_Select in 'Goods_Select.pas' {frm_Goods_Select},
  Goods_Choose in 'Goods_Choose.pas' {frm_Goods_Choose},
  Examine_Verify in 'Examine_Verify.pas' {frm_Examine_Verify},
  Man_Check in 'Man_Check.pas' {frm_Man_Check},
  Public_Don in 'Public_Don.pas' {frm_Public_Don},
  Goods_Check in 'Goods_Check.pas' {frm_Goods_Check},
  Business_Draft in 'Business_Draft.pas' {frm_Business_Draft},
  SystemSet in 'SystemSet.pas' {frm_SystemSet},
  Goods_Write in 'Goods_Write.pas' {frm_Goods_Write},
  Quality_Check in 'Quality_Check.pas' {frm_Quality_Check},
  Stock_Write_Check in 'Stock_Write_Check.pas' {frm_Stock_Write_Check},
  Quality_Check_Select in 'Quality_Check_Select.pas' {frm_Quality_Check_Select},
  Data_Manage in 'Data_Manage.pas' {frm_Data_Manage},
  Contract_Check in 'Contract_Check.pas' {frm_Contract_Check},
  Chang_Login in 'Chang_Login.pas' {frm_Chang_Login},
  ChildShop_Select in 'ChildShop_Select.pas' {frm_ChildShop_Select},
  Batch_Insert in 'Batch_Insert.pas' {frm_Batch_Insert},
  Stock_Enter_Report in 'Stock_Enter_Report.pas' {frm_Stock_Enter_Report},
  Goods_Requipment_Search in 'Goods_Requipment_Search.pas' {frm_Goods_Requipment_Search},
  Stock_Enter in 'Stock_Enter.pas' {frm_Stock_Enter},
  Stock_Pay in 'Stock_Pay.pas' {frm_Stock_Pay},
  Stock_Fad in 'Stock_Fad.pas' {frm_Stock_Fad},
  Storage_Guide in 'Storage_Guide.pas' {frm_Storage_Guide},
  Storage_warn_Limit in 'Storage_warn_Limit.pas' {frm_Storage_warn_Limit},
  Goods in 'Goods.pas' {frm_Goods},
  Company in 'Company.pas' {frm_Company},
  Part_Set in 'Part_Set.pas' {frm_Part_Set};

{$R *.res}

var
  hMutex:HWND;
  Ret: Integer;
begin
    Application.Initialize;
    begin
        hMutex:=CreateMutex(nil,False,'abcdefghijklmn');
        Ret:=GetLastError;
        If Ret<>ERROR_ALREADY_EXISTS Then
        begin
//            frm_Spalsh:=Tfrm_Spalsh.Create(application);
//            frm_Spalsh.Show;
//            frm_spalsh.update ;
            Application.Initialize;
            Application.Title := '【连锁销售管理系统】.....后台版本';
            Application.CreateForm(Tfrm_Main, frm_Main);

//  Application.CreateForm(Tfrm_Part_Set, frm_Part_Set);  //????ydy 2004-2-29
            try
            Application.CreateForm(Tfrm_Data, frm_Data);
            except
//                frm_spalsh.close;
                //frm_spalsh.free;
                application.MessageBox('【远程服务器连接错误】,请重新连接','错误',mb_iconwarning);
                application.CreateForm(Tfrm_connect,frm_connect);
                frm_connect.ShowModal;
                frm_connect.Close;
                frm_connect.Free; /////
            end;
//ydy modify 2004-2-29
//            sleep(5);
//            frm_spalsh.close;
//            frm_spalsh.free;
//            try

                frm_Login := Tfrm_Login.Create(Application);
                frm_Login.ShowModal;
//                frm_login.Close;
//                frm_Login.Free;/////
//            finally
                frm_login.close;
//            end;

            try
//               Application.CreateForm(Tfrm_Main, frm_Main);
                frm_Main.Visible := true;
                Application.Run;
            except
                Application.MessageBox('系统错误。请确认！',pchar(application.Title),MB_iconwarning);
            end;
        end
        else
        begin
            Application.MessageBox('【连锁销售管理系统】　不能在同一系统下运行二次！',pchar(application.Title),MB_iconwarning);
            ReleaseMutex(hMutex);
        end;
    end;
end.
