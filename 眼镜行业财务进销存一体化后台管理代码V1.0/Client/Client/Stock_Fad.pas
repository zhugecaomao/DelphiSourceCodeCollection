unit Stock_Fad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, XPMenu;

type
  Tfrm_Stock_Fad = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Edit4: TLabeledEdit;
    Edit_Storage_Name: TLabeledEdit;
    Edit6: TLabeledEdit;
    Edit_Shop_Name: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit9: TLabeledEdit;
    Edit10: TLabeledEdit;
    Edit5: TLabeledEdit;
    Edit7: TLabeledEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    Panel6: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    SpeedButton6: TSpeedButton;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    procedure SpeedButton4Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    iColcount,Total_Count:Integer;
     ss,tempstr:string;
    Pcol,Prow:integer;
    procedure init;
    procedure DeleteRow(Row:Integer);
  public
    { Public declarations }
  end;

var
  frm_Stock_Fad: Tfrm_Stock_Fad;

implementation

uses Public_Don, Data,  Supply_Monad, Storage_Select,
  ChildShop_Select, Login_Man, func, untdatadm, Contract_Check,
  Unt_PubStrGrid, Unitreportxf;

{$R *.dfm}
procedure tfrm_stock_fad.init;
var
  temp,make:string;
begin
  InitialStrGrid(stringgrid1,'采购退货');
  edit1.Text:=formatdatetime('yyyy''-''mm''-''dd',date);
  Edit8.Text:=Handle_Man;
  temp:='select max(right(stock_no,4)) from Cancel_strip where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+'''';
  make:='CTH-'+trim(Handle_Part)+trim(handle_no);//5-11用部门编号
  edit2.Text:=setcode(temp,make);
end;
procedure Tfrm_Stock_Fad.DeleteRow(Row:Integer);
var
    i : integer;
begin
    //最后一列直接删除
    if (Row = StringGrid1.RowCount-1) and (row >1) then
        StringGrid1.RowCount := StringGrid1.RowCount - 1;
    //自动上移
    if (Row < StringGrid1.RowCount) and (Row > StringGrid1.FixedRows-1) then
    begin
        if Row < StringGrid1.RowCount - 1 then
        begin
            for i := Row to StringGrid1.RowCount-1 do
            StringGrid1.Rows[i] := StringGrid1.Rows[i+1];
            StringGrid1.RowCount :=StringGrid1.RowCount - 1;
        end;
    end;
end;
procedure Tfrm_Stock_Fad.SpeedButton4Click(Sender: TObject);
var
    i,j:integer;
    Insert_Sql:String;
    Check_Flag:string;
    sqlsub:widestring;
begin
    frm_Public_Don:=Tfrm_Public_Don.Create(self);
    frm_Public_Don.no:=trim(edit2.Text);
    frm_Public_Don.ShowModal;
    //直接操作单据
    if Public_Do='Stock_0004' then
    begin
        Insert_Sql:='Insert into [Cancel_strip_detail](Stock_NO,Goods_NO,Pass_NO,amount,quality,Fade_Name) values ';
        //如果废弃退出
        if Public_Do_Result='03' then
        begin
            frm_data.ClientDataSet_Add.Close;
            frm_data.ClientDataSet_Add.Active:=False;
            Close;
        end;
        //如果保存草稿
        if Public_Do_Result='02' then
        begin
            for i:=1 to StringGrid1.ColCount-1 do
            begin
                for j:=1 to StringGrid1.RowCount-1 do
                begin
                    if StringGrid1.Cells[1,j]='' then
                    begin
                        application.MessageBox('操作错误,【商品编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                        Exit;
                    end;
                end;
            end;
            if Trim(Edit1.Text)='' then
            begin
                application.MessageBox('操作错误,【录单日期】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                Edit1.SetFocus;
                Exit;
            end;
            if Trim(Edit2.Text)='' then
            begin
                application.MessageBox('操作错误,【单据编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                Edit2.SetFocus;
                Exit;
            end;
            if Trim(Edit4.Text)='' then
            begin
                application.MessageBox('操作错误,【供货单位】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                Edit4.SetFocus;
                Exit;
            end;
            if Trim(Edit5.Text)='' then
            begin
                application.MessageBox('操作错误,【退货仓库】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                Edit5.SetFocus;
                Exit;
            end;
            if Trim(Edit6.Text)='' then
            begin
                application.MessageBox('操作错误,【经手人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                Edit6.SetFocus;
                Exit;
            end;
            if Trim(Edit8.Text)='' then
            begin
                application.MessageBox('操作错误,【制单人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                Edit8.SetFocus;
                Exit;
            end;
            for i:=1 to stringgrid1.RowCount-1 do
            begin
                if StringGrid1.Cells[3,i]='' then
                begin
                    application.MessageBox('操作错误,【数量】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                    Exit;
                end;
            end;
          sqlsub:='Select * from [Cancel_strip] where Copy_Date='''+Trim(Edit1.Text)+''' and Stock_No='''+Trim(Edit2.Text)+''' ';
          dmmain.CDSexecsql.Close;
          dmmain.CDSexecsql.Data:=frm_data.Socket_Connection.AppServer.execSql(sqlsub);
          dmmain.CDSexecsql.Open;
          if dmmain.CDSexecsql.RecordCount>0 then
          begin
              Application.MessageBox('添加失败,该记录已经存在，请确认！',pchar(application.Title),mb_iconwarning);
              Exit;
          end else
          begin
            dmmain.cdsCancel_strip.Close;  //主表
            dmmain.cdsCancel_strip.Open;
            dmmain.cdsCancel_strip.Append;
            dmmain.cdsCancel_strip.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
            dmmain.cdsCancel_strip.FieldByName('Stock_No').AsString:=Trim(Edit2.Text);
            dmmain.cdsCancel_strip.FieldByName('Contract_No').AsString:=Trim(Edit3.Text);
            dmmain.cdsCancel_strip.FieldByName('WLDW').AsString:=Trim(Edit4.Text);
            dmmain.cdsCancel_strip.FieldByName('Storage_NO').AsString:=Trim(Edit5.Text);
            dmmain.cdsCancel_strip.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
            dmmain.cdsCancel_strip.FieldByName('Shop_NO').AsString:=Trim(Edit7.Text);
            dmmain.cdsCancel_strip.FieldByName('Proposer').AsString:=Trim(Edit8.Text);
            dmmain.cdsCancel_strip.FieldByName('Condense').AsString:=Trim(Edit9.Text);
            dmmain.cdsCancel_strip.FieldByName('Remark').AsString:=Trim(Edit10.Text);
            dmmain.cdsCancel_strip.Post;
            dmmain.cdsReceipt.Close;
            dmmain.cdsReceipt.Open;  //草稿
            dmmain.cdsReceipt.Append;
            dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(Edit2.Text);
            dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='采购退货单';
            dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
            dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edit8.Text);
            dmmain.cdsReceipt.FieldByName('Condense').AsString:=Trim(Edit10.Text);
            dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
            dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
            dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
            dmmain.cdsReceipt.Post;
            if not dmmain.cdsCanceldetail.Active then dmmain.cdsCanceldetail.Open;
            for i:=1 to stringgrid1.RowCount-1 do  //细表
            begin
              dmmain.cdsCanceldetail.Insert;
              dmmain.cdsCanceldetail.FieldByName('Stock_NO').AsString:= Trim(Edit2.Text);
              dmmain.cdsCanceldetail.FieldByName('Goods_NO').AsString:=Trim(StringGrid1.Cells[1,i]);
              dmmain.cdsCanceldetail.FieldByName('amount').AsString:= Trim(StringGrid1.Cells[3,i]);
              dmmain.cdsCanceldetail.FieldByName('Pass_NO').AsString:= Trim(StringGrid1.Cells[5,i]);
              dmmain.cdsCanceldetail.FieldByName('quality').AsString:=Trim(StringGrid1.Cells[2,i]);
              dmmain.cdsCanceldetail.FieldByName('Fade_Name').AsString:=Trim(StringGrid1.Cells[5,i]);
              dmmain.cdsCanceldetail.FieldByName('GoodsMemo').AsString:=Trim(StringGrid1.Cells[6,i]);
              dmmain.cdsCanceldetail.Post;

            end;
            try
                dmmain.cdsReceipt.ApplyUpdates(-1);
                dmmain.cdsCancel_strip.ApplyUpdates(-1);
                dmmain.cdsCanceldetail.ApplyUpdates(-1);
                if trim(edit3.Text)<>'' then
                begin
                  if ReCheck=6 then
                   begin
                     setpass(edit3.Text);
                   end else
                   begin
                     setPassed(edit3.Text);//最后不能重用！！
                   end;
                end;
                setnull(frm_Stock_Fad);
                init;
            except
                Application.MessageBox('服务器发生故障！',Pchar(Application.Title),Mb_ICONwarning);
                Exit;
            end;
            //Application.MessageBox('恭喜你！【采购退货单】保存草稿单据操作成功，请确认！',pchar(application.Title),mb_iconwarning);
          end;
        end;
    end;
    //操作草稿单据
    if Public_Do='Business_Draft_0003' then
    begin
        //单据过帐
        if Public_Do_Result='01' then
        begin
            with frm_data.ClientDataSet2 do
            begin
                sqlsub:='Select * from [V_Stock_Cancel_strip_View] where Receipt_No='''+Trim(List_NO)+'''';
                dmmain.CDSexecsql.Close;
                dmmain.CDSexecsql.Data:=frm_data.Socket_Connection.AppServer.execSql(sqlsub);
                dmmain.CDSexecsql.Open;
                Check_Flag:=dmmain.CDSexecsql.FieldValues['Check_Result'];
                if Check_Flag='0' then
                begin
                    Application.MessageBox('该【采购退货单】草稿单据还没有完全审核，不能过帐',pchar(application.Title),mb_iconwarning);
                    Exit;
                end;
                if Check_Flag='1' then
                begin
                    with frm_data.ClientDataSet_Add do
                    begin
//                        Close;
//                        Commandtext:='';
//                        Commandtext:='Update [Cancel_strip] set Contract_No='''+Trim(Edit3.Text)+''',WLDW='''+Trim(Edit4.Text)+''',Storage_NO='''+Trim(Edit5.Text)+''',Transactor='''+Trim(Edit6.Text)+''',Shop_NO='''+Trim(Edit7.Text)+''',proposer='''+Trim(Edit8.Text)+''',Condense='''+Trim(Edit9.Text)+''',Remark='''+Trim(Edit10.Text)+''' where Stock_No='''+Trim(List_NO)+'''';
                        sqlsub:='select * from [Cancel_strip] where Stock_No='''+Trim(List_NO)+'''';
                        dmmain.CDSexecsql.Close;
                        dmmain.CDSexecsql.Data:=frm_data.Socket_Connection.AppServer.execSql(sqlsub);
                        dmmain.CDSexecsql.Open;
                        for i:=1 to dmmain.CDSexecsql.RecordCount do
                        begin
                            dmmain.CDSexecsql.Edit;
                            dmmain.CDSexecsql.FieldByName('Contract_No').AsString:=Trim(Edit3.Text);
                            dmmain.CDSexecsql.FieldByName('WLDW').AsString:=Trim(Edit4.Text);
                            dmmain.CDSexecsql.FieldByName('Storage_NO').AsString:=Trim(Edit5.Text);
                            dmmain.CDSexecsql.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
                            dmmain.CDSexecsql.FieldByName('Shop_NO').AsString:=Trim(Edit7.Text);
                            dmmain.CDSexecsql.FieldByName('proposer').AsString:=Trim(Edit8.Text);
                            dmmain.CDSexecsql.FieldByName('Condense').AsString:=Trim(Edit9.Text);
                            dmmain.CDSexecsql.FieldByName('Remark').AsString:=Trim(Edit10.Text);
                            dmmain.CDSexecsql.Post;
                            dmmain.CDSexecsql.Next;
                        end;
                        try
                            dmmain.CDSexecsql.ApplyUpdates(-1);
                        except
                            Application.MessageBox('系统错误，在修改数据表【采购退货单】时出错，'+#13#10+'请检查远程服务器连接是否正常？请确认！',Pchar(Application.Title),Mb_ICONwarning);
                            Exit;
                        end;
                        try
                            sqlsub:='select * from [Cancel_strip_detail] where Stock_No='''+Trim(List_NO)+'''';
                            dmmain.CDSexecsql.Close;
                            dmmain.CDSexecsql.Data:=frm_data.Socket_Connection.AppServer.execSql(sqlsub);
                            dmmain.CDSexecsql.Open;
                            for i:=1 to Total_Count-1 do
                            begin
                              dmmain.CDSexecsql.edit;
                              dmmain.CDSexecsql.FieldByName('Goods_NO').AsString:=Trim(StringGrid1.Cells[1,i]);
                              dmmain.CDSexecsql.FieldByName('amount').AsString:= Trim(StringGrid1.Cells[3,i]);
                              dmmain.CDSexecsql.FieldByName('Pass_NO').AsString:= Trim(StringGrid1.Cells[4,i]);
                              dmmain.CDSexecsql.FieldByName('quality').AsString:=Trim(StringGrid1.Cells[2,i]);
                              dmmain.CDSexecsql.FieldByName('Fade_Name').AsString:=Trim(StringGrid1.Cells[5,i]);
                              dmmain.CDSexecsql.Post;
                              dmmain.CDSexecsql.Next;
                            end;
                            try
                              dmmain.CDSexecsql.ApplyUpdates(-1);
                            except
                              Application.MessageBox('服务器发生故障！',Pchar(Application.Title),Mb_ICONwarning);
                              Exit;
                            end;
                            sqlsub:='select * from where Receipt_No='''+Trim(List_NO)+'''';
                            dmmain.CDSexecsql.Close;
                            dmmain.CDSexecsql.Data:=frm_data.Socket_Connection.AppServer.execSql(sqlsub);
                            dmmain.CDSexecsql.Open;
                            for i:=1 to dmmain.CDSexecsql.RecordCount do
                            begin
                              dmmain.CDSexecsql.Edit;
                              dmmain.CDSexecsql.FieldByName('Flag_sign').AsString:='单据';
                              dmmain.CDSexecsql.Post;
                              dmmain.CDSexecsql.Next;
                            end;
                            try
                                dmmain.CDSexecsql.ApplyUpdates(-1);
                                //Application.MessageBox('恭喜你！【采购退货单】单据过帐完毕！',pchar(application.Title),mb_iconwarning);
                            except
                                Application.MessageBox('系统错误，在单据过帐时，修改数据表【采购退货审核表】时出错，'+#13#10+'请检查远程服务器连接是否正常？请确认！',Pchar(Application.Title),Mb_ICONwarning);
                                Exit;
                            end;
                        except
                            Application.MessageBox('系统错误，在操作数据表【采购退货明细表】循环时出错，'+#13#10+'请检查远程服务器连接是否正常？请确认！',Pchar(Application.Title),Mb_ICONwarning);
                            Exit;
                        end;
                    end;
                end;
            end;
        end;
        if Public_Do_Result='02' then //存入草稿
        begin
            with frm_data.ClientDataSet_Add do
            begin
              if not bedit then
              begin
                if trim(Handle_Man)<>trim(edit8.Text) then
                begin
                  Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
                  exit;
                end;
              end;
                sqlsub:='select * from [Cancel_strip] where Stock_No='''+Trim(List_NO)+'''';
                dmmain.CDSexecsql.Close;
                dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
                dmmain.CDSexecsql.Open;
                for i:=1 to dmmain.CDSexecsql.RecordCount do
                begin
                    dmmain.CDSexecsql.Edit;
                    dmmain.CDSexecsql.FieldByName('Contract_No').AsString:=Trim(Edit3.Text);
                    dmmain.CDSexecsql.FieldByName('WLDW').AsString:=Trim(Edit4.Text);
                    dmmain.CDSexecsql.FieldByName('Storage_NO').AsString:=Trim(Edit5.Text);
                    dmmain.CDSexecsql.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
                    dmmain.CDSexecsql.FieldByName('Shop_NO').AsString:=Trim(Edit7.Text);
                    dmmain.CDSexecsql.FieldByName('proposer').AsString:=Trim(Edit8.Text);
                    dmmain.CDSexecsql.FieldByName('Condense').AsString:=Trim(Edit9.Text);
                    dmmain.CDSexecsql.FieldByName('Remark').AsString:=Trim(Edit10.Text);
                    dmmain.CDSexecsql.Post;
                    //dmmain.CDSexecsql.Next;
                end;
                try
                    dmmain.CDSexecsql.ApplyUpdates(-1);
                except
                    Application.MessageBox('服务器发生故障！',Pchar(Application.Title),Mb_ICONwarning);
                    Exit;
                end;
                sqlsub:='select * from [Cancel_strip_detail] where Stock_No='''+Trim(List_NO)+'''';
                dmmain.CDSexecsql.Close;
                dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
                dmmain.CDSexecsql.Open;
                for i:=1 to stringgrid1.RowCount-1 do
                begin
                  dmmain.CDSexecsql.edit;
                  dmmain.CDSexecsql.FieldByName('Goods_NO').AsString:=Trim(StringGrid1.Cells[1,i]);
                  dmmain.CDSexecsql.FieldByName('amount').AsString:= Trim(StringGrid1.Cells[3,i]);
                  dmmain.CDSexecsql.FieldByName('Pass_NO').AsString:= Trim(StringGrid1.Cells[5,i]);
                  dmmain.CDSexecsql.FieldByName('quality').AsString:=Trim(StringGrid1.Cells[2,i]);
                  dmmain.CDSexecsql.FieldByName('Fade_Name').AsString:=Trim(StringGrid1.Cells[5,i]);
                  dmmain.CDSexecsql.Post;
                  dmmain.CDSexecsql.Next;
                end;
                try
                  dmmain.CDSexecsql.ApplyUpdates(-1);
                except
                  Application.MessageBox('服务器发生故障！',Pchar(Application.Title),Mb_ICONwarning);
                  Exit;
                end;
            end;
        end;
        if Public_Do_Result='03' then //废弃退出
        begin
            Close;
        end;
    end;
end;


procedure Tfrm_Stock_Fad.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  with Sender as Tstringgrid do
  begin
  if gdSelected in State then
  Canvas.Brush.Color:= clTeal; //clyellow;//clRed;
  Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
  if gdFocused in State then
  Canvas.DrawFocusRect(Rect);
  end;
  with Sender as Tstringgrid do
  begin
    Canvas.FillRect(Rect);
    s:=Cells[ACol,ARow];
    r:=Rect;
    DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;

end;
procedure Tfrm_Stock_Fad.SpeedButton1Click(Sender: TObject);
begin
    Check_Mond:='';
    Check_Mond:='Stock_pay_Str';
    frm_Supply_Monad:=Tfrm_Supply_Monad.Create(self);
    frm_Supply_Monad.Caption:='【供货单位】';
    frm_Supply_Monad.ShowModal;
    Edit4.Text:=check_Mond_Result;
    frm_Supply_Monad.Free;
end;

procedure Tfrm_Stock_Fad.SpeedButton5Click(Sender: TObject);
begin
    Check_Storage:='';Check_Storage_Result:='';
    Check_Storage:='Stock_Fad_Str';
    frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
    frm_Storage_Select.ShowModal;
    Edit_Storage_Name.Text:=Trim(Check_Storage_Result);
    Edit5.Text:=Trim(Check_Storage_Result_NO);
    frm_Storage_Select.Free;
end;

procedure Tfrm_Stock_Fad.SpeedButton7Click(Sender: TObject);
begin
///    Edit8.Text:=Handle_Man;
    frm_Login_Man:=Tfrm_Login_Man.Create(self);
    frm_Login_Man.Caption:='制单人选择';
    frm_Login_Man.ShowModal;
    Edit8.Text:=Employe_Check_Result;
    frm_Login_Man.Free;
end;

procedure Tfrm_Stock_Fad.SpeedButton8Click(Sender: TObject);
begin
    ChildShop_Str:='';
    ChildShop_Result_NO:='';
    ChildShop_Result_Name:='';
    ChildShop_Str:='Stock_Fad_str';
    frm_ChildShop_Select:=Tfrm_ChildShop_Select.Create(self);
    frm_ChildShop_Select.ShowModal;
    Edit7.Text:=ChildShop_Result_NO;
    Edit_Shop_Name.Text:=ChildShop_Result_Name;
    frm_ChildShop_Select.Free;
end;

procedure Tfrm_Stock_Fad.SpeedButton9Click(Sender: TObject);
begin
    Employe_Check:='';
    Employe_Check:='Stock_Fad_str';
    Employe_Check_Result:='';
    frm_Login_Man:=Tfrm_Login_Man.Create(self);
    frm_Login_Man.Caption:='经手人选择';
    frm_Login_Man.ShowModal;
    Edit6.Text:=Employe_Check_Result;
    frm_Login_Man.Free;
end;

procedure Tfrm_Stock_Fad.FormShow(Sender: TObject);
var
    i,icount,k:integer;
    tt,yy,temppos:integer;
    sqlsub:widestring;
begin
    iColcount:=StringGrid1.ColCount-1; //需要的填充数据的网络表格的列数
    StringGrid1.RowCount:=2; 
    Total_Count:=StringGrid1.RowCount;
    init;

    //草稿单据查看
    if (Public_Do='Business_Draft_0003')  then
    begin
        with frm_data.ClientDataSet_Add do
        begin
//            Close;
//            CommandText:='';
//            CommandText:='Select * from [V_Stock_Cancel_strip_View] where Receipt_No='''+List_No+'''';
//            Open;
            sqlsub:='Select * from Cancel_strip as a, Cancel_strip_detail as b,goods_code as c where a.stock_no=b.stock_no and b.goods_no=c.goods_no and a.stock_No='''+List_No+'''';
            dmmain.CDSexecsql.Close;
            dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
            dmmain.CDSexecsql.Open;
            StringGrid1.RowCount:=dmmain.CDSexecsql.RecordCount+1;
            if dmmain.CDSexecsql.IsEmpty then
            begin
                application.MessageBox('此退货单已被删除！',pchar(application.Title),mb_iconwarning);
                exit;
            end;
            //自动加载STRINGGRID的行数
            for K:=1 to StringGrid1.RowCount do
            begin
                StringGrid1.Cells[0,K]:=IntTostr(k); //表示第0列第i行的名称
            end;
            //******************
            Edit1.Text:=dmmain.CDSexecsql.Fieldbyname('Copy_Date').AsString;
            Edit2.Text:=dmmain.CDSexecsql.Fieldbyname('stock_No').AsString;
            Edit3.Text:=dmmain.CDSexecsql.Fieldbyname('Contract_NO').AsString;
            Edit4.Text:=dmmain.CDSexecsql.Fieldbyname('WLDW').AsString;
            //Edit5.Text:=dmmain.CDSexecsql.Fieldbyname('Storage_Name').AsString;
            Edit6.Text:=dmmain.CDSexecsql.Fieldbyname('Transactor').AsString;
            Edit5.Text:=dmmain.CDSexecsql.Fieldbyname('Storage_NO').AsString;
            Edit8.Text:=dmmain.CDSexecsql.Fieldbyname('proposer').AsString;
            Edit9.Text:=dmmain.CDSexecsql.Fieldbyname('Condense').AsString;
            Edit10.Text:=dmmain.CDSexecsql.Fieldbyname('Remark').AsString;
            for k:=1 to dmmain.CDSexecsql.RecordCount  do

            begin
                StringGrid1.Cells[0,K]:=IntTostr(k); //表示第0列第i行的名称
                StringGrid1.Cells[1,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Goods_NO').AsString);//商品编号
                StringGrid1.Cells[2,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Goods_Name').AsString);//商品名称
                StringGrid1.Cells[3,k]:=trim(dmmain.CDSexecsql.Fieldbyname('amount').AsString);//数量
                StringGrid1.Cells[4,k]:=trim(dmmain.CDSexecsql.Fieldbyname('type').AsString);//商品类别
                StringGrid1.Cells[5,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Fade_Name').AsString);  //商品说明
                StringGrid1.Cells[6,k]:=trim(dmmain.CDSexecsql.Fieldbyname('GoodsMemo').AsString);
                dmmain.CDSexecsql.Next;
            end;
            GetDataPrint(dmmain.cdsprintmaster,dmmain.CDsexecsql);
        end;
    end;
end;


procedure Tfrm_Stock_Fad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
   DMMAIN.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  dmmain.cdsprintmaster.Close;
  dmmain.cdsprintmaster.Data:=null;
  dmmain.cdsCancel_strip.Close;
  dmmain.cdsCancel_strip.Data:=null;
  dmmain.cdsCanceldetail.Close;
  dmmain.cdsCanceldetail.Data:=null;
  Action:=Cafree;
end;

procedure Tfrm_Stock_Fad.Cmd_AddClick(Sender: TObject);
var
    i:integer;
begin
    StringGrid1.RowCount:=StringGrid1.RowCount+1;
    Total_Count:=StringGrid1.RowCount;
    for i:=1 to StringGrid1.RowCount-1 do
    begin
        StringGrid1.Cells[0,i]:=IntTostr(i); //表示第0列第i行
    end;
end;

procedure Tfrm_Stock_Fad.Cmd_DeleteClick(Sender: TObject);
begin
   deletegridrows(stringgrid1,prow);
end;

procedure Tfrm_Stock_Fad.SpeedButton2Click(Sender: TObject);
var
  user:widestring;
  flag:olevariant;
begin
  if trim(stringgrid1.Cells[1,1])='' then exit;
  no:=trim(edit2.Text);
  typed:='采购退货单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='1' then
  begin
    application.MessageBox('审核成功！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='2' then
  begin
    application.MessageBox('无权进行进行审核',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='3' then
  begin
    application.MessageBox('审核完毕！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='4' then
  begin
    application.MessageBox('反审核完毕！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='5' then
  begin
    application.MessageBox('反审核成功！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='6' then
  begin
    application.MessageBox('单据过帐后，不能进行审核或反审核！',pchar(application.Title),mb_iconinformation);
    exit;
  end;

end;

procedure Tfrm_Stock_Fad.SpeedButton6Click(Sender: TObject);
begin
    Contract_Check_Result_Str:='';
    Contract_Check_Str:='Stock_Fad';
    frm_Contract_Check:=Tfrm_Contract_Check.Create(self);
    frm_Contract_Check.ShowModal;
    frm_Contract_Check.Free;
    Edit3.Text:=Contract_Check_Result_Str;
    if stringgrid1.RowCount<2 then
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.FixedRows:=1;
    end;
end;

procedure Tfrm_Stock_Fad.Edit3Change(Sender: TObject);
var
  sql:widestring;
  i:integer;
begin
 if trim(edit3.Text)<>'' then
  begin
    sql:='Select a.*,b.*,c.* from Quality_Check_detail as a, Goods_code as b,Quality_Check as c where a.goods_no=b.goods_no and a.stock_No=c.stock_No and a.Un_Regular_Amount>0 and a.stock_No='+''''+trim(edit3.Text)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    i:=1;
    StringGrid1.RowCount:=dmmain.CDSquery2.RecordCount+1;
    Edit4.Text:=dmmain.CDSquery2.Fieldbyname('WLDW').AsString;//FieldValues['wldw'];
    Edit5.Text:=dmmain.CDSquery2.Fieldbyname('Storage_NO').AsString;//FieldValues['Storage_NO'];
    //Edit6.Text:=dmmain.CDSquery2.Fieldbyname('Transactor').AsString;//FieldValues['Transactor'];
    Edit7.Text:=dmmain.CDSquery2.Fieldbyname('Shop_NO').AsString;//FieldValues['Shop_NO'];
    //Edit8.Text:=dmmain.CDSquery2.Fieldbyname('proposer').AsString;//FieldValues['proposer'];
    Edit9.Text:=dmmain.CDSquery2.Fieldbyname('Quality_Remark').AsString;//FieldValues['Remark'];
    Edit10.Text:=dmmain.CDSquery2.Fieldbyname('Condense').AsString;//
    while not dmmain.CDSquery2.Eof do
    begin
      StringGrid1.Cells[0,i]:=inttostr(i);
      StringGrid1.Cells[1,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_NO').AsString);//FieldValues['Goods_NO'];//商品编号
      StringGrid1.Cells[2,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_Name').AsString);//FieldValues['Goods_Name'];//商品名称
      StringGrid1.Cells[3,i]:=trim(dmmain.CDSquery2.Fieldbyname('Un_Regular_Amount').AsString);//FieldValues['amount'];//金额
      StringGrid1.Cells[4,i]:=trim(dmmain.CDSquery2.Fieldbyname('type').AsString);//FieldValues['Goods_Modal'];//球面度数
      StringGrid1.Cells[5,i]:=trim(dmmain.CDSquery2.Fieldbyname('Check_Remark').AsString);//FieldValues['Remark'];  //备注说明
      StringGrid1.Cells[6,i]:=trim(dmmain.CDSquery2.Fieldbyname('GoodsMEMO').AsString);
      dmmain.CDSquery2.Next;
      inc(i);
    end;
  end;

end;

procedure Tfrm_Stock_Fad.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure Tfrm_Stock_Fad.SpeedButton3Click(Sender: TObject);
begin
  if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='GoodsFad.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

procedure Tfrm_Stock_Fad.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if pcol=5 then
  begin
    stringgrid1.cells[5,prow]:=stringgrid1.cells[5,prow]+key;
  end else
  begin
    stringgrid1.Options:=stringgrid1.Options-[goediting];
    key:=#0;
  end;
end;

end.
