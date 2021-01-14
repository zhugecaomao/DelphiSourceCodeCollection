unit Goods_Write;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, XPMenu;

type
  Tfrm_Goods_Write = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Cmd_Cancel: TSpeedButton;
    Panel3: TPanel;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Edit4: TLabeledEdit;
    Edit_Storage_Name: TLabeledEdit;
    Edit6: TLabeledEdit;
    Edit7: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit9: TLabeledEdit;
    Edit10: TLabeledEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    Cmd_HT: TSpeedButton;
    Edit5: TLabeledEdit;
    StringGrid1: TStringGrid;
    Cmd_DW: TSpeedButton;
    Label1: TLabel;
    procedure Cmd_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Cmd_HTClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Cmd_DWClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
     pcol,PROW:INTEGER;
    procedure init;
  public
    { Public declarations }
  end;

var
  frm_Goods_Write: Tfrm_Goods_Write;
  iColcount,Total_Count:integer;
  Pcol,Prow:integer;
  ss,tempstr:string;
implementation

uses func,  Data, Public_Don, Supply_Monad,
  Contract_Check, Storage_Select, Login_Man, ChildShop_Select, untdatadm,
  UntgoodCodeSelStr, Unt_PubStrGrid, Unitreportxf;

{$R *.dfm}
procedure tfrm_Goods_Write.init;
VAR
  TEMP,MAKE:STRING;
begin
  InitialStrGrid(stringgrid1,'来货登记');
  stringgrid1.ColCount:=stringgrid1.ColCount+1; //在预定商品时记录预定单编号；
  stringgrid1.ColWidths[stringgrid1.ColCount-1]:=-1;
  Edit1.Text:=formatdateTime('yyyy''-''mm''-''dd',date);
  Edit8.Text:=Handle_Man;
  temp:='select max(right(stock_no,4)) from STOCK_WRITE where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+'''';
  make:='LHDJ-'+trim(Handle_Part)+trim(handle_no);//用部门编号
  edit2.Text:=setcode(temp,make);
  if not LocalB then
  begin
    cmd_ht.Enabled:=false;
    edit3.ReadOnly:=false;
  end;
end;
procedure Tfrm_Goods_Write.Cmd_CancelClick(Sender: TObject);
var
    i,j,icol:integer;
    Check_Flag:string;
    sqlsub:widestring;
    t_i,t_j:integer;   //wy 循环变量
begin
    frm_Public_Don:=Tfrm_Public_Don.Create(self);
    frm_Public_Don.no:=trim(edit2.Text);
    frm_Public_Don.ShowModal;
    frm_Public_Don.Free;
    if Public_Do='Stock_0008' then
    begin
        //保存为草稿
        if Public_Do_Result='02' then
        begin
              if Trim(Edit1.Text)='' then
              begin
                  Application.MessageBox('操作错误,【录单日期】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Edit1.SetFocus;
                  Exit;
              end;
              if Trim(Edit2.Text)='' then
              begin
                  Application.MessageBox('操作错误,【单据编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Edit2.SetFocus;
                  Exit;
              end;
              if Trim(Edit4.Text)='' then
              begin
                  Application.MessageBox('操作错误,【供货单位】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Edit4.SetFocus;
                  Exit;
              end;
              if Trim(Edit5.Text)='' then
              begin
                  Application.MessageBox('操作错误,【验货仓库】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Edit5.SetFocus;
                  Exit;
              end;
              if Trim(Edit6.Text)='' then
              begin
                  Application.MessageBox('操作错误,【经手人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Edit6.SetFocus;
                  Exit;
              end;
              if Trim(Edit8.Text)='' then
              begin
                  Application.MessageBox('操作错误,【制单人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                  Edit8.SetFocus;
                  Exit;
              end;
              for i:=1 to StringGrid1.RowCount-1 do
              begin
                  if (StringGrid1.Cells[3,i]='') then
                  begin
                      Application.MessageBox('操作错误,【来货数量】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                      Exit;
                  end;
                  if StringGrid1.Cells[1,i]='' then
                  begin
                      Application.MessageBox('操作错误,【商品编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                      Exit;
                  end;
              end;
                        //Close;
                        //CommandText:='';
                        //CommandText:='SELECT * FROM [Stock_Write] where Copy_Date='''+Trim(Edit1.Text)+''' and Stock_NO='''+Trim(Edit2.Text)+''' and Gather_Name='''+Trim(Edit4.Text)+''' and Storage_No='''+Trim(Edit5.Text)+'''';
                sqlsub:='SELECT * FROM [Stock_Write] where Copy_Date='+''''+Trim(Edit1.Text)+''''+' and Stock_NO='+''''+Trim(Edit2.Text)+''''+' and wldw='+''''+Trim(Edit4.Text)+''''+' and Storage_No='+''''+Trim(Edit5.Text)+'''';
                dmmain.CDSquery.Close;
                dmmain.CDSquery.Data:=adisp.GetRecord(sqlsub);
                dmmain.CDSquery.Open;
                //Open;
                if dmmain.CDSquery.RecordCount>0 then
                begin
                    Application.MessageBox('该【来货登记】操作已经存在了，请确认！',pchar(application.Title),mb_iconwarning);
                    Exit;
                end else
                begin

                  //Close;
                  //CommandText:='';
                  //CommandText:='INSERT INTO [Stock_Write](Copy_Date,Stock_NO,Contract_NO,Contract_NO,Storage_NO,Transactor,Shop_NO,Proposer,Condense,Remark) values ('''+Trim(Edit1.Text)+''','''+Trim(Edit2.Text)+''','''+Trim(Edit3.Text)+''','''+Trim(Edit4.Text)+''','''+Trim(Edit5.Text)+''','''+Trim(Edit6.Text)+''','''+Trim(Edit7.Text)+''','''+Trim(Edit8.Text)+''','''+Trim(Edit9.Text)+''','''+Trim(Edit10.Text)+''')';
                  dmmain.csdStock_Write.Open;
                  dmmain.csdStock_Write.Append;
                  dmmain.csdStock_Write.FieldByName('Copy_Date').AsString:= Trim(Edit1.Text);
                  dmmain.csdStock_Write.FieldByName('Stock_NO').AsString:= Trim(Edit2.Text);
                  dmmain.csdStock_Write.FieldByName('Contract_NO').AsString:=Trim(Edit3.Text);
                  dmmain.csdStock_Write.FieldByName('wldw').AsString:=Trim(Edit4.Text);
                  dmmain.csdStock_Write.FieldByName('Storage_NO').AsString:=Trim(Edit5.Text);
                  dmmain.csdStock_Write.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
                  dmmain.csdStock_Write.FieldByName('Shop_NO').AsString:=Trim(Edit7.Text);
                  dmmain.csdStock_Write.FieldByName('Proposer').AsString:= Trim(Edit8.Text);
                  dmmain.csdStock_Write.FieldByName('Condense').AsString:=Trim(Edit9.Text);
                  dmmain.csdStock_Write.FieldByName('Remark').AsString:=Trim(Edit10.Text);
                  dmmain.csdStock_Write.FieldByName('wldw_no').AsString:=Trim(wldwno);//往来单位 
                  dmmain.csdStock_Write.post;
              //Execute;
                  //frm_data.ClientDataSet_Add.CommandText:='';
                  //CommandText:='Insert into [Receipt](Receipt_NO,Receipt_Name,Copy_Date,Proposer,Condense) values ('''+Trim(Edit2.Text)+''',''来货登记单'','''+Trim(Edit1.Text)+''','''+Trim(Edit8.Text)+''','''+Trim(Edit9.Text)+''')';
                  dmmain.cdsReceipt.Open;
                  dmmain.cdsReceipt.Append;  //审核表
                  dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=trim(edit2.Text);
                  dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='来货登记单';
                  dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=trim(edit1.Text);
                  dmmain.cdsReceipt.FieldByName('Proposer').AsString:=trim(edit7.Text);
                  dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
                  dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
                  dmmain.cdsReceipt.FieldByName('Condense').AsString:=trim(edit9.Text);
                  dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
                  dmmain.cdsReceipt.Post;

                  dmmain.cdsStock_Write_detail.Open; //open detail table;
                  Total_Count:=StringGrid1.RowCount;
                  for i:=1 to Total_Count-1 do
                  begin
                    dmmain.cdsStock_Write_detail.Append;//明细表；
                    dmmain.cdsStock_Write_detail.FieldByName('Stock_NO').AsString:= Trim(Edit2.Text);
                    dmmain.cdsStock_Write_detail.FieldByName('Goods_NO').AsString:=Trim(StringGrid1.Cells[1,i]);
                    dmmain.cdsStock_Write_detail.FieldByName('amount').AsString:=Trim(StringGrid1.Cells[3,i]);
                    dmmain.cdsStock_Write_detail.FieldByName('Write_Amount').AsString:=Trim(StringGrid1.Cells[4,i]);
                    dmmain.cdsStock_Write_detail.FieldByName('Write_Remark').AsString:= Trim(StringGrid1.Cells[7,i]);
                    dmmain.cdsStock_Write_detail.FieldByName('orders').AsString:= Trim(StringGrid1.Cells[StringGrid1.ColCount-1,i]);
                    dmmain.cdsStock_Write_detail.Post;
                  end;
                  try
                    dmmain.cdsReceipt.ApplyUpdates(-1);
                    dmmain.cdsStock_Write_detail.ApplyUpdates(-1);
                    dmmain.csdStock_Write.ApplyUpdates(-1);
                    if trim(edit3.Text)<>'' then
                    setpass(edit3.Text);
                    Edit_Storage_Name.Text:='';
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
                    init;
                  except
                    Application.MessageBox('应用服务器发生故障！',pchar(application.Title),mb_iconwarning);
                    Exit;
                  end;
                end;

        end;
        //废弃退出
        if Public_Do_Result='03' then
        begin
            Close;
            frm_data.ClientDataSet_Add.Close;
            frm_data.ClientDataSet_Add.Active:=False;
        end;
    end;
    //草稿单据操作
    if Public_Do='Business_Draft_0005' then
    begin
        //保存为单据
        if Public_Do_Result='01' then
        begin
            with frm_data.ClientDataSet2 do
            begin
//                Close;
//                CommandText:='';
//                Commandtext:='Select * from [V_Stock_Write_View] where Receipt_No='''+Trim(Edit2.Text)+'''';
                sqlsub:='Select * from [V_Stock_Write_View] where Receipt_No='''+Trim(Edit2.Text)+'''';
                dmmain.CDSquery.Close;
                dmmain.CDSquery.Data:=frm_data.Socket_Connection.AppServer.GetRecord(sqlsub);
                dmmain.CDSquery.Open;
//                    Open;
                Check_Flag:=dmmain.CDSquery.FieldValues['Check_Result'];
                if Check_Flag='0' then
                begin
                    Application.MessageBox('单据还没有完全审核，不能过帐',pchar(application.Title),mb_iconwarning);
                    Exit;
                end;
                if Check_Flag='1' then
                begin
                      with frm_data.ClientDataSet_Add do
                      begin
//                            Close;
//                            Commandtext:='';
        //                            Commandtext:='Update [Stock_Write] set Contract_No='''+Trim(Edit3.Text)+''',Gather_Name='''+Trim(Edit4.Text)+''',Storage_NO='''+Trim(Edit5.Text)+''',Transactor='''+Trim(Edit6.Text)+''',Shop_NO='''+Trim(Edit7.Text)+''',Proposer='''+Trim(Edit8.Text)+''',Condense='''+Trim(Edit9.Text)+''',Remark='''+Trim(Edit10.Text)+''' where Stock_No='''+Trim(List_NO)+'''';
                      sqlsub:='select * from [Stock_Write] where Stock_No='''+Trim(List_NO)+'''';
                      dmmain.CDSquery.Close;
                      dmmain.CDSquery.Data:=frm_data.Socket_Connection.AppServer.GetRecord(sqlsub);
                      dmmain.CDSquery.Open;
                      for t_i:=1 to dmmain.CDSquery.RecordCount do
                      begin
                          dmmain.CDSquery.Edit;
                          dmmain.CDSquery.FieldByName('Contract_No').AsString:=trim(edit3.Text);
                          dmmain.CDSquery.FieldByName('wldw').AsString:=trim(edit4.Text);
                          dmmain.CDSquery.FieldByName('Storage_NO').AsString:=trim(edit5.Text);
                          dmmain.CDSquery.FieldByName('Transactor').AsString:=trim(edit6.Text);
                          dmmain.CDSquery.FieldByName('Shop_NO').AsString:=trim(edit7.Text);
                          dmmain.CDSquery.FieldByName('Proposer').AsString:=trim(edit8.Text);
                          dmmain.CDSquery.FieldByName('Condense').AsString:=trim(edit9.Text);
                          dmmain.CDSquery.FieldByName('Remark').AsString:=trim(edit10.Text);
                          dmmain.CDSquery.FieldByName('wldw_no').AsString:=trim(wldwno);
                          dmmain.CDSquery.Post;
                          dmmain.CDSquery.Next;
                      end;
                      try
                        dmmain.CDSquery.ApplyUpdates(-1);
                      except
                        Application.MessageBox('保存[来货登记单]时失败,请检查连接网络是否正常数据输入是否正确？请确认！',pchar(application.Title),mb_iconwarning);
                        Exit;
                      end;
                      for i:=1 to stringgrid1.RowCount-1 do
                      begin
                          with frm_data.ClientDataSet_Add do
                          begin
                              Close;
                              frm_data.ClientDataSet_Add.CommandText:='';
                              CommandText:='update [Stock_Write_detail] set Write_Amount='''+Trim(StringGrid1.Cells[4,i])+''',Write_Remark='''+Trim(StringGrid1.Cells[24,i])+''' where Stock_NO='''+Trim(List_NO)+''' and Goods_NO='''+Trim(StringGrid1.Cells[1,i])+'''';
                              try
                                  Execute;
                              except
                                  Application.MessageBox('保存[来货登记单明细]时失败,请检查连接网络是否正常数据输入是否正确？请确认！',pchar(application.Title),mb_iconwarning);
                                  Exit;
                              end;
                          end;
                      end;

                      with frm_data.ClientDataSet_Add do
                      begin
//                            Close;
//                            Commandtext:='';
//                            Commandtext:='Update [Receipt] set Flag_sign=''单据'' where Receipt_No='''+Trim(Edit2.Text)+'''';
                          sqlsub:='select * from [Receipt] where Receipt_No='''+Trim(Edit2.Text)+'''';
                          dmmain.CDSquery.Close;
                          dmmain.CDSquery.Data:=frm_data.Socket_Connection.AppServer.GetRecord(sqlsub);
                          dmmain.CDSquery.Open;
                          for t_i:=1 to dmmain.CDSquery.RecordCount do
                          begin
                              dmmain.CDSquery.Edit;
                              dmmain.CDSquery.FieldByName('Flag_sign').AsString:='单据';
                              dmmain.CDSquery.Post;
                          end;
                          try
                              dmmain.CDSquery.ApplyUpdates(-1);
//                                Execute;
                              Application.MessageBox('恭喜你！[来货登记]单据过帐操作成功，请确认！',Pchar(Application.Title),MB_ICONwarning);
                          except
                              Application.MessageBox('保存[来货登记审核表]数据时，连接服务器数据库错误，请尝试重新连接，请确认！',Pchar(Application.Title),MB_ICONwarning);
                              Exit;
                          end;
                      end;
                   end;
                end;
            end;
        end;
        //修改草稿单据
        if Public_Do_Result='02' then
        begin
            try
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

                    sqlsub:='select * from [Stock_Write] where Stock_No='''+Trim(List_NO)+'''';
                    dmmain.CDSquery2.Close;
                    dmmain.CDSquery2.Data:=adisp.resultrecord (sqlsub);
                    dmmain.CDSquery2.Open;
                    //for t_i:=1 to dmmain.CDSquery2.RecordCount do
                    //begin
                      dmmain.CDSquery2.Edit;
                      dmmain.CDSquery2.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
                      dmmain.CDSquery2.FieldByName('Contract_No').AsString:=Trim(Edit3.Text);
                      dmmain.CDSquery2.FieldByName('wldw').AsString:=Trim(Edit4.Text);
                      //系统找不到该字段，请核对数据库
//                      dmmain.CDSquery2.FieldByName('Storage_Name').AsString:=Trim(Edit5.Text);
                      dmmain.CDSquery2.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
                      dmmain.CDSquery2.FieldByName('Shop_NO').AsString:=Trim(Edit7.Text);
                      dmmain.CDSquery2.FieldByName('proposer').AsString:=Trim(Edit8.Text);
                      dmmain.CDSquery2.FieldByName('Condense').AsString:=Trim(Edit9.Text);
                      dmmain.CDSquery2.FieldByName('Remark').AsString:=Trim(Edit10.Text);
                      dmmain.CDSquery2.FieldByName('wldw_no').AsString:=trim(wldwno);
                      dmmain.CDSquery2.Post;
                      //dmmain.CDSquery2.Next;
                    //end;
                    try
                       dmmain.CDSquery2.ApplyUpdates(-1);
                    except
                       Application.MessageBox('保存[来货登记单]时连接服务器数据库失败,请检查连接网络是否正常，请确认！',pchar(application.Title),mb_iconwarning);
                       Exit;
                    end;


                    try
                     sqlsub:='select * from [Stock_Write_detail] where Stock_No='''+Trim(List_NO)+'''';
                     dmmain.CDSexecsql.Close;
                     dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
                     dmmain.CDSexecsql.Open;
                     for i:=1 to stringgrid1.RowCount-1 do
                     begin
                     dmmain.CDSexecsql.Edit;
                     dmmain.CDSexecsql.FieldByName('Write_Amount').AsString:=Trim(StringGrid1.Cells[4,i]);
                     dmmain.CDSexecsql.FieldByName('Write_Remark').AsString:=Trim(StringGrid1.Cells[7,i]);
                     dmmain.CDSexecsql.post;
                     dmmain.CDSexecsql.Next;
                    end;
                      dmmain.CDSexecsql.ApplyUpdates(-1);
                        Application.MessageBox('保存[来货登记单]草稿操作成功，请确认！',pchar(application.Title),mb_iconwarning);
                    except
                        Application.MessageBox('保存[来货登记明细]时循环失败,请检查连接网络是否正常，请确认！',pchar(application.Title),mb_iconwarning);
                        Exit;
                    end;
                end;
            except
                Application.MessageBox('保存单据明细时失败,请检查连接网络是否正常，请确认！',pchar(application.Title),mb_iconwarning);
                Exit;
            end;
        end;
        if Public_Do_Result='03' then
        begin
            frm_data.ClientDataSet_Add.Active:=False;
            frm_data.ClientDataSet_Add.Close;
            frm_data.ClientDataSet2.Active:=False;
            frm_data.ClientDataSet2.Close;
            Close;
        end;
    end;
end;

procedure Tfrm_Goods_Write.FormShow(Sender: TObject);
var
    i,icount,k:integer;
    tt,yy,temppos:integer;
    tempstr:widestring;
begin
    StringGrid1.RowCount:=2;
    Total_Count:=StringGrid1.RowCount;
    init;

  //加载行号
  for i:=1 to StringGrid1.RowCount-1 do
  begin
      StringGrid1.Cells[0,i]:=IntTostr(i); //表示第0列第i行
  end;
  if Public_Do='Business_Draft_0005' then
  begin
    tempstr:='Select a.*,b.*,c.* from stock_write as a ,stock_write_detail as b, goods_code as c where a.stock_no=b.stock_no and b.goods_no=c.goods_no and a.stock_No='+''''+trim(List_No)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    dmmain.CDSquery2.Data:=adisp.resultrecord(tempstr);
    dmmain.CDSquery2.Open;
    if dmmain.CDSquery2.IsEmpty then exit;
    k:=dmmain.CDSquery2.RecordCount;
    StringGrid1.RowCount:=k+1;
    //******************
    Edit1.Text:=Formatdatetime('yyyy''-''mm''-''dd',dmmain.CDSquery2.FieldByName('Copy_Date').AsDateTime);
    Edit2.Text:=dmmain.CDSquery2.FieldByName('stock_No').AsString;
    Edit3.Text:=dmmain.CDSquery2.FieldByName('Contract_NO').AsString;
    Edit4.Text:=dmmain.CDSquery2.FieldByName('wldw').AsString;
    Edit6.Text:=dmmain.CDSquery2.FieldByName('Transactor').AsString;
    Edit5.Text:=dmmain.CDSquery2.FieldByName('storage_no').AsString;
    Edit8.Text:=dmmain.CDSquery2.FieldByName('Proposer').AsString;
    Edit9.Text:=dmmain.CDSquery2.FieldByName('Condense').AsString;
    Edit10.Text:=dmmain.CDSquery2.FieldByName('Remark').AsString;
    wldwno:=dmmain.CDSquery2.Fieldbyname('wldw_no').AsString;
    speedbutton7.Enabled:=false;
    for k:=1 to dmmain.CDSquery2.RecordCount  do
    begin
      StringGrid1.Cells[0,k]:=IntTostr(k);
      StringGrid1.Cells[1,k]:=trim(dmmain.CDSquery2.FieldByName('Goods_NO').AsString);//商品编号
      StringGrid1.Cells[2,k]:=trim(dmmain.CDSquery2.FieldByName('Goods_Name').AsString);//商品名称
      StringGrid1.Cells[3,k]:=trim(dmmain.CDSquery2.FieldByName('Amount').AsString);//数量
      StringGrid1.Cells[4,k]:=trim(dmmain.CDSquery2.FieldByName('Write_Amount').AsString); //登记数量
      StringGrid1.Cells[5,k]:=trim(dmmain.CDSquery2.FieldByName('type').AsString); //类别名称
      StringGrid1.Cells[6,k]:=trim(dmmain.CDSquery2.FieldByName('modedate').AsString); //有效日期
      StringGrid1.Cells[7,k]:=trim(dmmain.CDSquery2.FieldByName('write_Remark').AsString);  //备注说明
      StringGrid1.Cells[8,k]:=trim(dmmain.CDSquery2.FieldByName('orders').AsString);  //备注说明
      dmmain.CDSquery2.Next;
    end;
    GetDataPrint(dmmain.cdsprintmaster,dmmain.CDSquery2);
  end;
end;

procedure Tfrm_Goods_Write.Cmd_AddClick(Sender: TObject);
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

procedure Tfrm_Goods_Write.Cmd_DeleteClick(Sender: TObject);
begin
  deletegridrows(stringgrid1,prow);
end;

procedure Tfrm_Goods_Write.StringGrid1DblClick(Sender: TObject);
var
    openstr:string;
    S1,s2,s3:string;
    I:INTEGER;
begin
  if pcol in [1,2] then
  begin
   fmgoodCodeSelStr:= TfmgoodCodeSelStr.Create(self);
   try
   fmgoodcodeselStr.show_mode:='6';
   fmgoodcodeselStr.ShowModal;
   finally
   fmgoodcodeselStr.Free;
   end;
  end;
  if pcol = 4 then  //复制数量
  begin
   for i := prow+1 to STRINGGRID1.rowcount -1 do
   begin
   STRINGGRID1.cells[4,i]:= STRINGGRID1.cells[4,prow];
   //同时要计算金额
   end;
  end;
  if pcol = 3 then  //复制数量
  begin
   for i := prow+1 to STRINGGRID1.rowcount -1 do
   begin
   STRINGGRID1.cells[3,i]:= STRINGGRID1.cells[3,prow];
   //同时要计算金额
   end;
  end;
end;


procedure Tfrm_Goods_Write.StringGrid1DrawCell(Sender: TObject; ACol,
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
            func.String_Col:=ARow;
        end;
    end;
end;

procedure Tfrm_Goods_Write.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then
        Edit8.Text:=Handle_Man;
end;

procedure Tfrm_Goods_Write.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
        Edit1.Text:=ForMatdateTime('yyyy''-''mm''-''dd',now);
end;

procedure Tfrm_Goods_Write.Cmd_HTClick(Sender: TObject);
var
    sqlsub:widestring;
begin
  Contract_Check_Result_Str:='';
  Contract_Check_Str:='Goods_Writestr';
  frm_Contract_Check:=Tfrm_Contract_Check.Create(self);
  frm_Contract_Check.ShowModal;
  Edit3.Text:=Contract_Check_Result_Str;
  if stringgrid1.RowCount<2 then
  begin
    stringgrid1.RowCount:=2;
    stringgrid1.FixedRows:=1;
  end;
  cmd_dw.Enabled:=false;
end;

procedure Tfrm_Goods_Write.SpeedButton5Click(Sender: TObject);
begin
    Check_Storage:='';
    Check_Storage_Result:='';
    Check_Storage:='Goods_Write';
    frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
    frm_Storage_Select.ShowModal;
    Edit5.Text:=Trim(Check_Storage_Result_NO);
    Edit_Storage_Name.Text:=Trim(Check_Storage_Result);
    frm_Storage_Select.Free;
end;

procedure Tfrm_Goods_Write.SpeedButton9Click(Sender: TObject);
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

procedure Tfrm_Goods_Write.SpeedButton8Click(Sender: TObject);
begin
    ChildShop_Str:='';
    ChildShop_Result_NO:='';
    ChildShop_Result_Name:='';
    ChildShop_Str:='Goods_Write_Str';
    frm_ChildShop_Select:=Tfrm_ChildShop_Select.Create(self);
    frm_ChildShop_Select.ShowModal;
    Edit7.Text:=ChildShop_Result_NO;
    frm_ChildShop_Select.Free;
end;

procedure Tfrm_Goods_Write.SpeedButton7Click(Sender: TObject);
begin
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='制单人选择';
  frm_Login_Man.ShowModal;
  Edit8.Text:=Employe_Check_Result;
  frm_Login_Man.Free;
end;

procedure Tfrm_Goods_Write.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  dmmain.CDSexecsql.close;
  dmmain.CDSexecsql.Data:=null;
  dmmain.cdsprintmaster.Close;
  dmmain.cdsprintmaster.Data:=null;
  dmmain.cdsStock_Write_detail.Close;
  dmmain.cdsStock_Write_detail.Data:=null;
  dmmain.csdStock_Write.Close;
  dmmain.csdStock_Write.Data:=null;
  action:=cafree;
end;

procedure Tfrm_Goods_Write.SpeedButton2Click(Sender: TObject);
var
  user,tablename:widestring;
  flag:olevariant;
begin
  if trim(stringgrid1.Cells[1,1])='' then exit;
  no:=trim(edit2.Text);
  typed:='来货登记单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  tablename:='select a.storage_no,b.goods_no,b.stock_no,b.write_amount as amount from Stock_write as a ,Stock_write_detail as b where a.stock_no=b.stock_no and a.stock_no='+''''+trim(No)+'''';
  flag:=inttostr(adisp.UpdateOrder(tablename));
  if flag='1' then
  begin
    application.MessageBox('审核成功！',pchar(application.Title),mb_iconinformation);
    close;
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
    close;
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

procedure Tfrm_Goods_Write.Edit3Change(Sender: TObject);
var
  sql:widestring;
  i:integer;
begin
  if Public_Do='Business_Draft_0005' then exit;
  if trim(edit3.Text)<>'' then
  begin
    sql:='Select b.*,a.*,C.* from [Stock_contract_detail] as a,stock_contract as B,GOODS_CODE AS C where A.GOODS_NO=C.GOODS_NO AND a.contract_no=B.contract_no and a.Contract_No='+''''+Trim(Edit3.Text)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    if dmmain.CDSquery2.IsEmpty then exit;
    i:=1;
    Edit4.Text:=dmmain.CDSquery2.FieldByName('wldw').AsString;
    Edit9.Text:=dmmain.CDSquery2.FieldByName('resume').AsString;
    Edit10.Text:=dmmain.CDSquery2.FieldByName('Remark').AsString;
    wldwno:=dmmain.CDSquery2.FieldByName('wldw_no').AsString;
    StringGrid1.RowCount:=dmmain.CDSquery2.RecordCount+1;
    while not dmmain.CDSquery2.Eof do
    begin
      StringGrid1.Cells[0,i]:=inttostr(i);
      StringGrid1.Cells[1,I]:=trim(dmmain.CDSquery2.FieldByName('Goods_NO').AsString);//商品编号
      StringGrid1.Cells[2,I]:=trim(dmmain.CDSquery2.FieldByName('Goods_Name').AsString);//商品名称
      StringGrid1.Cells[3,I]:=trim(dmmain.CDSquery2.FieldByName('GOODS_Amount').AsString);//数量
      StringGrid1.Cells[5,I]:=trim(dmmain.CDSquery2.FieldByName('type').AsString); //类别名称
      StringGrid1.Cells[7,I]:=trim(dmmain.CDSquery2.FieldByName('remark').AsString); //类别名称
      StringGrid1.Cells[StringGrid1.ColCount-1,I]:=trim(dmmain.CDSquery2.FieldByName('orders').AsString); //预定订单编号
      inc(i);
      dmmain.CDSquery2.Next;
    end;
  end;

end;

procedure Tfrm_Goods_Write.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure Tfrm_Goods_Write.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if trim(StringGrid1.Cells[1,Stringgrid1.Row])='' then exit;
  if pcol=7 then
  begin
    stringgrid1.Options:=stringgrid1.Options+[goediting];
    exit;
  end  
  else stringgrid1.Options:=stringgrid1.Options-[goediting];
  if pcol in [3,4] then
  begin
    if not (key in ['0'..'9',#8]) then
    begin
      key:=#0;
    end else
    begin
      if key<>#8 then
      begin
        if pcol=3 then
        begin
          if StringGrid1.Cells[3,prow]<>'0' then
          begin
            StringGrid1.Cells[3,prow]:=StringGrid1.Cells[3,prow]+key;
          end else
          begin
            StringGrid1.Cells[3,prow]:=key;
          end;
        end;
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
      end else
      begin
        if pcol=3 then
        begin
          StringGrid1.Cells[3,prow]:=copy(StringGrid1.Cells[3,prow],1,length(StringGrid1.Cells[3,prow])-1);   //减去最后数字
          if  StringGrid1.Cells[3,prow]='' then
          begin
            StringGrid1.Cells[3,prow]:='0';
          end;
        end;
        if pcol=4 then
        begin
          StringGrid1.Cells[4,prow]:=copy(StringGrid1.Cells[4,prow],1,length(StringGrid1.Cells[4,prow])-1);   //减去最后数字
          if  StringGrid1.Cells[4,prow]='' then
          begin
            StringGrid1.Cells[4,prow]:='0';
          end;
        end;
      end;
    end;
  end else
  begin
    application.MessageBox('只能输入采购数量,登记数量,备注说明！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
end;

procedure Tfrm_Goods_Write.Cmd_DWClick(Sender: TObject);
begin
  Check_Mond:='';
  wldwno:='';
  Check_Mond:='DW-0001';
  frm_Supply_Monad:=Tfrm_Supply_Monad.Create(self);
  frm_Supply_Monad.Caption:='【供货单位】';
  frm_Supply_Monad.ShowModal;
  Edit4.Text:=check_Mond_Result;
  frm_Supply_Monad.Free;
end;

procedure Tfrm_Goods_Write.SpeedButton3Click(Sender: TObject);
begin
  if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='Write.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

end.
