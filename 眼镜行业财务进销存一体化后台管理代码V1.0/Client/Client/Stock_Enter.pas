 unit Stock_Enter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, XPMenu;

type
  Tfrm_Stock_Enter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Cmd_Cancel: TSpeedButton;
    Panel3: TPanel;
    Cmd_HT: TSpeedButton;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Edit4: TLabeledEdit;
    Edit_Stock_Name: TLabeledEdit;
    Edit6: TLabeledEdit;
    Edit7: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit9: TLabeledEdit;
    Edit10: TLabeledEdit;
    Edit5: TEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure Cmd_CancelClick(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Cmd_HTClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    //procedure Stock_States_Total;
    stockid:widestring;
    pcol,prow:integer;
    PROCEDURE INIT;
  public
    { Public declarations }
  end;

var
  frm_Stock_Enter: Tfrm_Stock_Enter;
  iColcount,Total_Count:Integer;
  Pcol,Prow:integer;
  Insert_Sql:String;
  ss,tempstr:string;
implementation

uses Data, Public_Don, Main, Contract_Check, Supply_Monad, Storage_Select,
  ChildShop_Select, Quality_Check_Select, Stock_Write_Check, 
  func, untdatadm, Login_Man, Unt_PubStrGrid, Unitreportxf;

{$R *.dfm}
PROCEDURE TFRM_STOCK_ENTER.INIT;
VAR
 I:INTEGER;
 temp,make:string;
BEGIN
     edit1.Text:='';
     edit2.Text:='';
     edit3.Text:='';
     edit4.Text:='';
     edit5.Text:='';
     edit6.Text:='';
     edit7.Text:='';
     edit8.Text:='';
     edit9.Text:='';
     edit10.Text:='';
//                    FUNC.setnull(frm_Goods_Write);   //清除窗体上的控件内容
  for i:=1 to stringgrid1.RowCount-1 do   //清空网格，不能只减去行，避免下次新建时数据重复出现
  stringgrid1.Rows[i].Clear;
      stringgrid1.RowCount:=2;
  if (Public_Do='Business_Storage_in') or (Public_Do='instock_0001') then
  begin
     InitialStrGrid(stringgrid1,'非营业性入库');
  end else
  begin
    InitialStrGrid(stringgrid1,'采购入库');
    stringgrid1.ColCount:=stringgrid1.ColCount+1; //在预定商品时记录预定单编号；
    stringgrid1.ColWidths[stringgrid1.ColCount-1]:=-1;
  end;
  if (Public_Do='Business_Storage_in') or (Public_Do='Business_Draft_0001') then exit;
  temp:='select max(right(stock_no,4)) from stock_jion where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+''''+' and part_no='+''''+trim(Handle_Part)+'''';
  make:='ISK-'+trim(Handle_Part)+trim(handle_no);//5-11编码中部门编号
  edit2.Text:=setcode(temp,make);
  edit1.Text:=formatdatetime('yyyy''-''mm''-''dd',date);
  edit8.Text:=trim(Handle_Man);
END;

//*******************************************
//*******************************************


procedure Tfrm_Stock_Enter.Cmd_CancelClick(Sender: TObject);
var
    i,j,icol:integer;
    Check_Flag:string;
    sqlsub:widestring;
    t_i,t_j:integer;
begin
    frm_Public_Don:=Tfrm_Public_Don.Create(self);
    frm_Public_Don.no:=trim(edit2.Text);
    frm_Public_Don.no:=trim(edit2.Text);
    frm_Public_Don.ShowModal;

    //直接操作入库界面
        //保存为草稿单据
    if (Public_Do='Stock_0003') or (Public_Do='instock_0001')then
    begin
        if Public_Do_Result='02' then
        begin
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
              application.MessageBox('操作错误,【收货仓库】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
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
          if (Public_Do<>'instock_0001') and (public_do<>'Business_Storage_in') then   //非营业入库不给提示;
          begin
            if Trim(Edit3.Text)='' then
            begin
              application.MessageBox('操作错误,【质量验收单据号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
              Edit3.SetFocus;
              Exit;
            end;
          end;
          for i:=1 to StringGrid1.RowCount-1 do
          begin
              if StringGrid1.Cells[1,i]='' then
              begin
                  application.MessageBox('操作错误,【商品编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Exit;
              end;
              if (StringGrid1.Cells[4,i]='') or (StringGrid1.Cells[4,i]='0') then
              begin
                  application.MessageBox('操作错误,【数量】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Exit;
              end;
          end;
          sqlsub:='Select * from [Stock_Jion] where Copy_Date='''+Trim(Edit1.Text)+''' and Stock_NO='''+Trim(Edit2.Text)+''' ';
          dmmain.CDSquery.Close;
          dmmain.CDSquery.Data:=frm_data.Socket_Connection.AppServer.GetRecord(sqlsub);
          dmmain.CDSquery.Open;
          if dmmain.CDSquery.RecordCount>0 then
          begin
              Application.MessageBox('添加失败,该记录已经存在，请确认！',pchar(application.Title),mb_iconwarning);
              Exit;
          end else
          begin
//                                Close;
//                                CommandText:='';
       if  not dmmain.cdsStock_Jion.Active then  dmmain.cdsStock_Jion.Open;                    //CommandText:='Insert into [Stock_Jion] (Copy_Date,Stock_No,Contract_No,WLDW,Storage_Name,Transactor,Shop_NO,proposer,Resume,remark,Quality_Check_ID) values ('''+Trim(Edit1.Text)+''','''+Trim(Edit2.Text)+''','''+Trim(Edit3.Text)+''','''+Trim(Edit4.Text)+''','''+Trim(Edit5.Text)+''','''+Trim(Edit6.Text)+''','''+Trim(Edit7.Text)+''','''+Trim(Edit8.Text)+''','''+Trim(Edit9.Text)+''','''+Trim(Edit10.Text)+''','''+Trim(Edit11.Text)+''')';
          dmmain.cdsStock_Jion.Append;
          dmmain.cdsStock_Jion.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
          dmmain.cdsStock_Jion.FieldByName('Stock_No').AsString:=Trim(Edit2.Text);
          dmmain.cdsStock_Jion.FieldByName('Contract_No').AsString:=Trim(Edit3.Text);
          dmmain.cdsStock_Jion.FieldByName('WLDW').AsString:=Trim(Edit4.Text);
          dmmain.cdsStock_Jion.FieldByName('WLDW_no').AsString:=Trim(wldwno);/////////////////

          //原来字段名为Storage_Name,系统要出错(无此字段名)，改为Stock_Name
          if (Public_Do='Stock_0003') then
          begin
           dmmain.cdsStock_Jion.FieldByName('Stock_Name').AsString:='采购入库单';
          end;
          if (Public_Do='instock_0001') then
          begin
            dmmain.cdsStock_Jion.FieldByName('Stock_Name').AsString:='非营业性入库单';
          end;
          dmmain.cdsStock_Jion.FieldByName('Storage_no').AsString:=Trim(Edit5.Text);  //写库房号或分店号
          dmmain.cdsStock_Jion.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
          dmmain.cdsStock_Jion.FieldByName('Shop_NO').AsString:=Trim(Edit7.Text);
          dmmain.cdsStock_Jion.FieldByName('proposer').AsString:=Trim(Edit8.Text);
          dmmain.cdsStock_Jion.FieldByName('Resume').AsString:=Trim(Edit9.Text);
          dmmain.cdsStock_Jion.FieldByName('remark').AsString:=Trim(Edit10.Text);
          dmmain.cdsStock_Jion.FieldByName('Quality_Check_ID').AsString:=Trim(Edit3.Text);
          dmmain.cdsStock_Jion.FieldByName('part_no').AsString:=Trim(Handle_Part);//制单部门;
          dmmain.cdsStock_Jion.Post;
          //草稿单据
          dmmain.cdsReceipt.close;
          dmmain.cdsReceipt.Open;
          dmmain.cdsReceipt.Append;
          dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(Edit2.Text);
          if (Public_Do='Stock_0003') then
          begin
            dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='采购入库单';
          end;
          if (Public_Do='instock_0001') then
          begin
            dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='非营业性入库单';
          end;
          dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
          dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edit8.Text);
          dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
          dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
          dmmain.cdsReceipt.FieldByName('Condense').AsString:=Trim(Edit10.Text);
          dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
          dmmain.cdsReceipt.Post;

          //Total_Count:=StringGrid1.RowCount;
          dmmain.cdsstockdetail.Close;
          dmmain.cdsstockdetail.Open;
          for i:=1 to StringGrid1.RowCount-1 do
          begin
            dmmain.cdsstockdetail.Append;
            dmmain.cdsstockdetail.FieldByName('Stock_NO').AsString :=Trim(Edit2.Text);
            dmmain.cdsstockdetail.FieldByName('Goods_NO').AsString :=Trim(StringGrid1.Cells[1,i]);
            dmmain.cdsstockdetail.FieldByName('goods_name').AsString :=Trim(StringGrid1.Cells[2,i]);
            dmmain.cdsstockdetail.FieldByName('amount').AsString :=Trim(StringGrid1.Cells[4,i]);
            if (Public_Do='instock_0001')then
            begin
              dmmain.cdsstockdetail.FieldByName('price').AsString :=Trim(StringGrid1.Cells[3,i]); //非营业入库写入单价;
              dmmain.cdsstockdetail.FieldByName('total_money').AsString :=Trim(StringGrid1.Cells[5,i]);
              dmmain.cdsstockdetail.FieldByName('quality').AsString :=Trim(StringGrid1.Cells[7,i]); //非营业入库写入金额

            end else
            begin

              dmmain.cdsstockdetail.FieldByName('quality').AsString :=Trim(StringGrid1.Cells[6,i]);
              dmmain.cdsstockdetail.FieldByName('orders').AsString :=Trim(StringGrid1.Cells[StringGrid1.ColCount-1,i]);  //采购时记录预定商品单
            end;
            dmmain.cdsstockdetail.Post;
          end;
          try
             dmmain.cdsReceipt.ApplyUpdates(-1);
             dmmain.cdsStock_Jion.ApplyUpdates(-1);
             dmmain.cdsstockdetail.ApplyUpdates(-1);
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
             init;
          except
              Application.MessageBox('系统错误,请检查连接网络是否正常，请确认！',pchar(application.Title),mb_iconwarning);
              Exit;
          end;
       end;
       INIT;
   END;
 end;  
        frm_Main.Panel_Title.Caption:='[连锁管理系统]->[采购信息管理]';
        //废弃退出
        if Public_Do_Result='03' then
        begin
            frm_data.ClientDataSet_Add.Close;
            frm_data.ClientDataSet_Add.Active:=False;
            Close;
        end;
    //草稿单据操作
     if (Public_Do='Business_Draft_0005') or (Public_Do='Business_Storage_in') then
     begin
        //修改草稿单据
        if Public_Do_Result='02' then
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

                sqlsub:='select * from [Stock_Jion] where Stock_No='''+Trim(List_NO)+'''';
                dmmain.CDSquery2.Close;
                dmmain.CDSquery2.Data:=adisp.resultrecord (sqlsub);
                dmmain.CDSquery2.Open;
                dmmain.CDSquery2.Edit;
                dmmain.CDSquery2.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
                dmmain.CDSquery2.FieldByName('Contract_No').AsString:=Trim(Edit3.Text);
                dmmain.CDSquery2.FieldByName('WLDW').AsString:=Trim(Edit4.Text);
                dmmain.CDSquery2.FieldByName('WLDW_no').AsString:=Trim(wldwno);
                dmmain.CDSquery2.FieldByName('Storage_Name').AsString:=Trim(Edit5.Text);
                dmmain.CDSquery2.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
                dmmain.CDSquery2.FieldByName('Shop_NO').AsString:=Trim(Edit7.Text);
                dmmain.CDSquery2.FieldByName('proposer').AsString:=Trim(Edit8.Text);
                dmmain.CDSquery2.FieldByName('Resume').AsString:=Trim(Edit9.Text);
                dmmain.CDSquery2.FieldByName('Remark').AsString:=Trim(Edit10.Text);
                dmmain.CDSquery2.FieldByName('Quality_Check_ID').AsString:=Trim(Edit3.Text);
                dmmain.CDSquery2.Post;
                try
                    dmmain.CDSquery.ApplyUpdates(-1);
                except
                    Application.MessageBox('保存［采购入库单］时失败,请检查连接网络是否正常，请确认！',pchar(application.Title),mb_iconwarning);
                    Exit;
                end;
                try
                  sqlsub:='select * from [Stock_Jion_detail] where Stock_No='''+Trim(List_NO)+'''';
                  dmmain.CDSquery2.Close;
                  dmmain.CDSquery2.Data:=adisp.resultrecord (sqlsub);
                  dmmain.CDSquery2.Open;
                    for i:=1 to stringgrid1.RowCount-1 do
                    begin
                       dmmain.CDSquery2.edit;
                       dmmain.CDSquery2.FieldByName('Stock_NO').AsString :=Trim(Edit2.Text);
                       dmmain.CDSquery2.FieldByName('Goods_NO').AsString :=Trim(StringGrid1.Cells[1,i]);
                       dmmain.CDSquery2.FieldByName('goods_name').AsString :=Trim(StringGrid1.Cells[2,i]);
                       dmmain.CDSquery2.FieldByName('amount').AsString :=Trim(StringGrid1.Cells[4,i]);
                       if  (public_do='Business_Storage_in') then
                       begin
                          dmmain.CDSquery2.FieldByName('price').AsString :=Trim(StringGrid1.Cells[3,i]); //非营业入库写入单价;
                          dmmain.CDSquery2.FieldByName('total_money').AsString :=Trim(StringGrid1.Cells[5,i]); //非营业入库写入单价;
                          dmmain.CDSquery2.FieldByName('quality').AsString :=Trim(StringGrid1.Cells[7,i]);
                       end else
                       begin
                         dmmain.CDSquery2.FieldByName('quality').AsString :=Trim(StringGrid1.Cells[6,i]);
                       end;
                       dmmain.CDSquery2.Post;
                       dmmain.CDSquery2.Next;
                    end;
                   dmmain.CDSquery2.ApplyUpdates(-1); 
                except
                    Application.MessageBox('保存［采购入库明细］时循环失败,请确认！',pchar(application.Title),mb_iconwarning);
                    Exit;
                end;
            end;
        end;
      end;
        if func.Public_Do_Result='03' then  //废弃退出
        begin
            frm_data.ClientDataSet_Add.Close;
            frm_data.ClientDataSet_Add.Active:=False;
            Close;
        end;
    frm_Public_Don.Free;
end;


procedure Tfrm_Stock_Enter.Edit1DblClick(Sender: TObject);
begin
    Edit1.Text:=ForMatDatetime('yyyy''-''mm''-''dd',now);
end;

procedure Tfrm_Stock_Enter.Cmd_HTClick(Sender: TObject);
var
    sqlsub:widestring;
begin
    Contract_Check_Result_Str:='';
    Contract_Check_Str:='Stock_Enterstr';
    frm_Contract_Check:=Tfrm_Contract_Check.Create(self);
    frm_Contract_Check.ShowModal;
    sqlsub:='Select * from Quality_Check  where  stock_No='''+Trim(Contract_Check_Result_Str)+'''';
    dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=frm_data.Socket_Connection.AppServer.GetRecord(sqlsub);
    dmmain.CDSquery.Open;
    Edit4.Text:=dmmain.CDSquery.FieldByName('wldw').AsString;
    //edit_stock_name.Text:=dmmain.CDSquery.FieldByName('').AsString;
    edit5.Text :=dmmain.CDSquery.FieldByName('storage_no').AsString;
    edit6.Text:=dmmain.CDSquery.FieldByName('transactor').AsString;
    edit7.Text:=dmmain.CDSquery.FieldByName('storage_no').AsString;
    edit8.Text:=dmmain.CDSquery.FieldByName('proposer').AsString;
    edit9.Text:=dmmain.CDSquery.FieldByName('Condense').AsString;
    edit10.Text:=dmmain.CDSquery.FieldByName('Quality_Remark').AsString;
    wldwno:=dmmain.CDSquery.FieldByName('wldw_no').AsString;
    frm_Contract_Check.Free;
    dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
    Edit3.Text:=Contract_Check_Result_Str;
    if stringgrid1.RowCount<2 then
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.FixedRows:=1;
    end;
end;

procedure Tfrm_Stock_Enter.SpeedButton5Click(Sender: TObject);
begin
   Check_Storage:='';
   Check_Storage_Result:='';
   Check_Storage:='Storage_Umanage_Fad';
  frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
  frm_Storage_Select.ShowModal;
  Edit_stock_Name.Text:=Trim(Check_Storage_Result);
  edit5.Text:=Check_Storage_Result_NO;
  frm_Storage_Select.Free;
end;

procedure Tfrm_Stock_Enter.SpeedButton8Click(Sender: TObject);
begin
    ChildShop_Str:='';
    ChildShop_Result_NO:='';
    ChildShop_Result_Name:='';
    ChildShop_Str:='Stock_Enter_str';
    frm_ChildShop_Select:=Tfrm_ChildShop_Select.Create(self);
    frm_ChildShop_Select.ShowModal;
    Edit7.Text:=ChildShop_Result_NO;
    //Edit_Shop_Name.Text:=ChildShop_Result_Name;
    frm_ChildShop_Select.Free;
end;

procedure Tfrm_Stock_Enter.SpeedButton7Click(Sender: TObject);
begin
    frm_Login_Man:=Tfrm_Login_Man.Create(self);
    frm_Login_Man.Caption:='制单人选择';
    frm_Login_Man.ShowModal;
    Edit8.Text:=Employe_Check_Result;
    frm_Login_Man.Free;
end;

procedure Tfrm_Stock_Enter.StringGrid1DblClick(Sender: TObject);
var
    openstr:string;
    S1,s2,s3:string;
    sqlsub:widestring;
begin
    if Trim(Edit2.Text)='' then
    begin
        Application.MessageBox('操作失败，【单据编号】不能为空！',pchar(application.Title),mb_iconwarning);
        Edit2.SetFocus;
        Exit;
    end;
    if Trim(Edit4.Text)='' then
    begin
        Application.MessageBox('操作失败，【供货单位】不能为空！',pchar(application.Title),mb_iconwarning);
        Edit4.SetFocus;
        Exit;
    end;
    if Trim(Edit5.Text)='' then
    begin
        Application.MessageBox('操作失败，【经手人】不能为空！',pchar(application.Title),mb_iconwarning);
        Edit5.SetFocus;
        Exit;
    end;
    
end;


procedure Tfrm_Stock_Enter.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
//ydy add 设置显示颜色
 with Sender as Tstringgrid do
        begin
        if gdSelected in State then
        Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
        Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
        if gdFocused in State then
        Canvas.DrawFocusRect(Rect);
        end;

//不但水平居中，还垂直居中
  with Sender as Tstringgrid do
    begin
      Canvas.FillRect(Rect);
      s:=Cells[ACol,ARow];
      r:=Rect;
      DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
    end;
    with sender as TStringGrid do
    begin
        if (GDFocused in state) then
        begin
            Pcol:=Acol;
            Prow:=ARow;
            String_Col:=ARow;
        end;
    end;
end;

procedure Tfrm_Stock_Enter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    dmmain.cdsprintmaster.Close;
    dmmain.cdsprintmaster.Data:=null;
    dmmain.cdsstockdetail.Close;
    dmmain.cdsstockdetail.Data:=null;
    dmmain.cdsStock_Jion.close;
    dmmain.cdsStock_Jion.Data:=null;
    Action:=Cafree;
end;

procedure Tfrm_Stock_Enter.FormShow(Sender: TObject);
var
    i,icount,k:integer;
    tt,yy,temppos:integer;
    FWidth:integer;
    sqlsub:widestring;
begin
    StringGrid1.RowCount:=2;
    iColcount:=StringGrid1.ColCount-1; //需要的填充数据的网络表格的列数
    StringGrid1.RowCount:=2;
    Total_Count:=StringGrid1.RowCount;

    init;
    //草稿单据查看
    if ((Public_Do='Business_Draft_0001')or (Public_Do='Business_Storage_in'))  then   //采购或非营业入库；
    begin
      sqlsub:='Select a.*,b.*,c.* from stock_jion as a,stock_jion_detail as b,Goods_code as c where a.stock_no=b.stock_no and b.goods_no=c.goods_no and a.stock_No='''+List_No+'''';
      dmmain.CDSexecsql.Close;
      dmmain.CDSexecsql.Data:=frm_data.Socket_Connection.AppServer.execSql(sqlsub);
      dmmain.CDSexecsql.Open;
      k:=dmmain.CDSexecsql.RecordCount;
      StringGrid1.RowCount:=k+1;
      //自动加载STRINGGRID的行数
      //******************
      Edit1.Text:=trim(dmmain.CDSexecsql.Fieldbyname('Copy_Date').AsString);//.FieldValues['Copy_Date'];
      Edit2.Text:=trim(dmmain.CDSexecsql.Fieldbyname('stock_No').AsString);//FieldValues['Receipt_No'];
      Edit3.Text:=trim(dmmain.CDSexecsql.Fieldbyname('Contract_NO').AsString);//FieldValues['Contract_NO'];
      Edit4.Text:=trim(dmmain.CDSexecsql.Fieldbyname('wldw').AsString);//FieldValues['wldw'];
      Edit5.Text:=trim(dmmain.CDSexecsql.Fieldbyname('Storage_NO').AsString);//FieldValues['Storage_NO'];
      Edit6.Text:=trim(dmmain.CDSexecsql.Fieldbyname('Transactor').AsString);//FieldValues['Transactor'];
      Edit7.Text:=trim(dmmain.CDSexecsql.Fieldbyname('Shop_NO').AsString);//FieldValues['Shop_NO'];
      Edit8.Text:=trim(dmmain.CDSexecsql.Fieldbyname('proposer').AsString);//FieldValues['proposer'];
      Edit9.Text:=trim(dmmain.CDSexecsql.Fieldbyname('Resume').AsString);//FieldValues['Remark'];
      Edit10.Text:=trim(dmmain.CDSexecsql.Fieldbyname('Remark').AsString);//FieldValues['Condense'];
      //Edit.Text:=dmmain.CDSexecsql.Fieldbyname('Quality_Check_ID').AsString;//FieldValues[''];
      wldwno:=trim(dmmain.CDSexecsql.FieldByName('wldw_no').AsString);
      for k:=1 to StringGrid1.RowCount  do
      begin
        StringGrid1.Cells[0,K]:=IntTostr(k); //表示第0列第i行的名称
        StringGrid1.Cells[1,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Goods_NO').AsString);//FieldValues['Goods_NO'];//商品编号
        StringGrid1.Cells[2,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Goods_Name').AsString);//FieldValues['Goods_Name'];//商品名称
        StringGrid1.Cells[4,k]:=trim(dmmain.CDSexecsql.Fieldbyname('amount').AsString);//FieldValues['amount'];//金额
        if  (public_do='Business_Storage_in') then   //非营业性入库
        begin
          StringGrid1.Cells[3,k]:=trim(dmmain.CDSexecsql.Fieldbyname('price').AsString);
          StringGrid1.Cells[5,k]:=trim(dmmain.CDSexecsql.Fieldbyname('total_money').AsString);
          StringGrid1.Cells[6,k]:=trim(dmmain.CDSexecsql.Fieldbyname('type').AsString);//FieldValues['Valid_Day']; //有效日期
          StringGrid1.Cells[7,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Remark').AsString);//FieldValues['Remark'];  //备注说明
        end else
        begin
          StringGrid1.Cells[5,k]:=trim(dmmain.CDSexecsql.Fieldbyname('type').AsString);//FieldValues['Valid_Day']; //有效日期
          StringGrid1.Cells[6,k]:=trim(dmmain.CDSexecsql.Fieldbyname('quality').AsString);//FieldValues['Remark'];  //备注说明
          StringGrid1.Cells[StringGrid1.ColCount-1,k]:=trim(dmmain.CDSexecsql.Fieldbyname('orders').AsString);//FieldValues['Remark'];  //订单
        end;
        dmmain.CDSexecsql.Next;
      end;
      GetDataPrint(dmmain.cdsprintmaster,dmmain.CDsexecsql);
       // end;
    end;
end;


procedure Tfrm_Stock_Enter.Cmd_AddClick(Sender: TObject);
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

procedure Tfrm_Stock_Enter.Cmd_DeleteClick(Sender: TObject);
begin
  deletegridrows(stringgrid1,prow);
end;

procedure Tfrm_Stock_Enter.SpeedButton9Click(Sender: TObject);
begin
    Employe_Check:='';
    Employe_Check:='Goods_Write_Str';
    Employe_Check_Result:='';
    frm_Login_Man:=Tfrm_Login_Man.Create(self);
    frm_Login_Man.Caption:='经手人选择';
    frm_Login_Man.ShowModal;
    Edit6.Text:=Employe_Check_Result;
    frm_Login_Man.Free;
end;

procedure Tfrm_Stock_Enter.SpeedButton2Click(Sender: TObject);
var
  user,s:widestring;
  flag,inmethod:olevariant;
begin
  if (Public_Do='Stock_0003') or (Public_Do='instock_0001') then exit;
  if trim(stringgrid1.Cells[1,1])='' then exit;
  no:=trim(edit2.Text);
  s:=trim(edit5.Text);
  if (Public_Do='Business_Draft_0001') then
  begin
    typed:='采购入库单';
  end;
  if (Public_Do='Business_Storage_in') then
  begin
    typed:='非营业性入库单'
  end;
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    inmethod:=1;
    flag:=adisp.inputstorage(no,inmethod,s);  //数量入库！！//5-19 edit
    //添加财务入库///////////////////////////////////////
    /////////////////向对应的商品单价表里添加单价////////
  end;
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
    //exit;
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

procedure Tfrm_Stock_Enter.Edit3Change(Sender: TObject);
var
  sql:widestring;
  i:integer;
begin
  if (Public_Do='Business_Draft_0001') or (Public_Do='Business_Storage_in') or (public_do='instock_0001') then exit;
  if trim(edit3.Text)<>'' then
  begin
    sql:='Select a.*,b.*,c.* from Quality_Check_detail as a, Goods_code as b,Quality_Check as c where a.goods_no=b.goods_no and a.stock_No=c.stock_No and a.regular_amount>0 and a.stock_No='+''''+trim(edit3.Text)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    i:=1;
    if not dmmain.CDSquery2.IsEmpty then StringGrid1.RowCount:=dmmain.CDSquery2.RecordCount+1 else StringGrid1.RowCount:=2; //wy edit
    Edit4.Text:=dmmain.CDSquery2.Fieldbyname('wldw').AsString;//FieldValues['wldw'];
    Edit5.Text:=dmmain.CDSquery2.Fieldbyname('Storage_NO').AsString;//FieldValues['Storage_NO'];
    Edit6.Text:=dmmain.CDSquery2.Fieldbyname('Transactor').AsString;//FieldValues['Transactor'];
    Edit7.Text:=dmmain.CDSquery2.Fieldbyname('Shop_NO').AsString;//FieldValues['Shop_NO'];
    Edit8.Text:=dmmain.CDSquery2.Fieldbyname('proposer').AsString;//FieldValues['proposer'];
    wldwno:= dmmain.CDSquery2.FieldByName('wldw_no').AsString;
    while not dmmain.CDSquery2.Eof do
    begin
      StringGrid1.Cells[0,i]:=inttostr(i);
      StringGrid1.Cells[1,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_NO').AsString);//FieldValues['Goods_NO'];//商品编号
      StringGrid1.Cells[2,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_Name').AsString);//FieldValues['Goods_Name'];//商品名称
      StringGrid1.Cells[4,i]:=trim(dmmain.CDSquery2.Fieldbyname('regular_amount').AsString);//FieldValues['amount'];//金额
      StringGrid1.Cells[5,i]:=trim(dmmain.CDSquery2.Fieldbyname('type').AsString);//FieldValues['Valid_Day']; //有效日期
      StringGrid1.Cells[6,i]:=trim(dmmain.CDSquery2.Fieldbyname('GoodsMemo').AsString);//FieldValues['Remark'];  //备注说明
      StringGrid1.Cells[StringGrid1.ColCount-1,i]:=trim(dmmain.CDSquery2.Fieldbyname('orders').AsString);//FieldValues['Remark'];  //备注说明
      dmmain.CDSquery2.Next;
      inc(i);
    end;
  end;
end;

procedure Tfrm_Stock_Enter.SpeedButton1Click(Sender: TObject);
begin
  Check_Mond:='';
  wldwno:='';
  Check_Mond:='DW-0001';
  frm_Supply_Monad:=Tfrm_Supply_Monad.Create(self);
  frm_Supply_Monad.Caption:='【收货单位】';
  frm_Supply_Monad.ShowModal;
  edit4.Text:=Trim(check_Mond_Result);
  frm_Supply_Monad.Free;
end;

procedure Tfrm_Stock_Enter.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure Tfrm_Stock_Enter.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if trim(StringGrid1.Cells[1,StringGrid1.Row])='' then exit;
  if pcol =4 then
  begin
    if not (key in ['0'..'9',#8,'.']) then
    begin
      key:=#0;
    end else
    begin
      if key<>#8 then
      begin
        if pcol=4 then
        begin
          if StringGrid1.Cells[4,prow]<>'0' then
          begin
            StringGrid1.Cells[4,prow]:=StringGrid1.Cells[4,prow]+key;
          end else
          begin
            StringGrid1.Cells[4,prow]:=key;
          end;
        end;
        if (Public_Do='Business_Storage_in') or (Public_Do='instock_0001') then
        begin
          if  trim(StringGrid1.Cells[3,prow])<>'' then
          begin
            StringGrid1.Cells[5,prow]:=floattostr(strtofloat(StringGrid1.Cells[3,prow])*strtofloat(StringGrid1.Cells[4,prow]));
          end else
          begin
            StringGrid1.Cells[5,prow]:='0';
          end;
        end;
      end else
      begin
        if pcol=4 then
        begin
          StringGrid1.Cells[4,prow]:=copy(StringGrid1.Cells[4,prow],1,length(StringGrid1.Cells[4,prow])-1);   //减去最后数字
          if  StringGrid1.Cells[4,prow]='' then
          begin
            StringGrid1.Cells[4,prow]:='0';
          end;
          if trim(StringGrid1.Cells[4,prow])='0' then
          begin
            StringGrid1.Cells[5,prow]:='0';
          end else
          begin
            if (Public_Do='Business_Storage_in') or (Public_Do='instock_0001') then
            begin
              if  trim(StringGrid1.Cells[3,prow])<>'' then
              begin
                StringGrid1.Cells[5,prow]:=floattostr(strtofloat(StringGrid1.Cells[3,prow])*strtofloat(StringGrid1.Cells[4,prow]));
              end else
              begin
                StringGrid1.Cells[5,prow]:='0';
              end;
            end;
            //StringGrid1.Cells[5,prow]:=floattostr(strtofloat(StringGrid1.Cells[3,prow])*strtofloat(StringGrid1.Cells[4,prow]));
          end;
        end;
      end;
    end;
  end else
  begin
    key:=#0;
    application.MessageBox('只能输入商品数量！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
end;

procedure Tfrm_Stock_Enter.SpeedButton3Click(Sender: TObject);
begin
  if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='EnterStock.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

end.
