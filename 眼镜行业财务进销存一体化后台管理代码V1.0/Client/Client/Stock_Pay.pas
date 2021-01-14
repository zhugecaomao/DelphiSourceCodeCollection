unit Stock_Pay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, XPMenu;

type
  Tfrm_Stock_Pay = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Cmd_Exit: TSpeedButton;
    Panel3: TPanel;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton6: TSpeedButton;
    Edit9: TLabeledEdit;
    Edit10: TLabeledEdit;
    Edit11: TLabeledEdit;
    Edit12: TLabeledEdit;
    Edit6: TComboBox;
    Edit7: TComboBox;
    Edit4: TLabeledEdit;
    Edit5: TLabeledEdit;
    Edit2: TLabeledEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel7: TPanel;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    P_Check: TPanel;
    StringGrid1: TStringGrid;
    lbjs: TLabel;
    lbwj: TLabel;
    Label1: TLabel;
    procedure Cmd_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    pcol,prow:integer;
    iColcount,Total_Count:Integer;
    ss,tempstr:string;
    procedure init;
    procedure ChangGRID(btypes:boolean);
    function READGoodsORBill(Accountid:string;BILLTYPE:boolean):boolean;
  public
    { Public declarations }
  end;

var
  frm_Stock_Pay: Tfrm_Stock_Pay;
implementation

uses Public_Don, Data, func, untdatadm, Uinputselect, Login_Man,
  Unt_PubStrGrid, Supply_Monad, Unitreportxf;

{$R *.dfm}
////////////////////////////////////////////////////
procedure Tfrm_Stock_Pay.ChangGRID(btypes:boolean);
var
  i:integer;
begin
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    stringgrid1.Rows[i].Clear;
  end;
  stringgrid1.RowCount:=2;
  if btypes then
  begin
    StringGrid1.Cells[0,0]:='序号';
    StringGrid1.Cells[1,0]:='商品编号';
    StringGrid1.Cells[2,0]:='商品名称';
  end else
  begin
    StringGrid1.Cells[0,0]:='序号';
    StringGrid1.Cells[1,0]:='单据编号';
    StringGrid1.Cells[2,0]:='单据日期';
  end;
   StringGrid1.Cells[3,0]:='应付金额';
    StringGrid1.Cells[4,0]:='本次结算金额';
    StringGrid1.ColWidths[4]:=90;
    StringGrid1.Cells[5,0]:='已结算金额';
    StringGrid1.Cells[6,0]:='未结算金额';
end;
function tfrm_Stock_Pay.READGoodsORBill(Accountid:string;BILLTYPE:boolean):boolean;    //按行或按单；
var
  i:integer;
  sql:widestring;
begin
  if billtype then
  begin
    sql:='EXEC FILLGRIDS '+''''+trim('1')+''''+','+''''+TRIM(ACCOUNTID)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
  end else
  begin
     sql:='EXEC FILLGRIDS '+''''+trim('0')+''''+','+''''+TRIM(ACCOUNTID)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
  end;

  if not dmmain.CDSquery2.IsEmpty then
  begin
    if stringgrid1.RowCount>2 then
    stringgrid1.RowCount:=stringgrid1.RowCount+dmmain.CDSquery2.RecordCount-1;
    i:=stringgrid1.RowCount-1;
    while not dmmain.CDSquery2.Eof do
    begin
      stringgrid1.Cells[0,i]:=inttostr(i);
      stringgrid1.Cells[1,i]:=trim(dmmain.CDSquery2.fieldbyname('account_no').AsString);
      stringgrid1.Cells[2,i]:=trim(dmmain.CDSquery2.fieldbyname('account_name').AsString);
      //stringgrid1.Cells[3,i]:=trim(dmmain.CDSquery2.fieldbyname('baseprice').AsString);
      stringgrid1.Cells[3,i]:=trim(dmmain.CDSquery2.fieldbyname('account_money').AsString);
      stringgrid1.Cells[4,i]:='0';
      stringgrid1.Cells[5,i]:=trim(dmmain.CDSquery2.fieldbyname('foot').AsString);
      stringgrid1.Cells[6,i]:=trim(dmmain.CDSquery2.fieldbyname('UNfoot').AsString);
      dmmain.CDSquery2.Next;
      inc(i);
    end;
  end;
end;
///////////////////////////
procedure tfrm_stock_pay.init;
var
  i:integer;
  TEMP,MAKE:STRING;
begin
  ChangGRID(false);
  EDIT1.Text:=FORMATDATETIME('YYYY''-''MM''-''DD',DATE);
  StringGrid1.Cells[0,1]:='1';
  temp:='select max(right(stock_no,4)) from PayReciveBill where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+'''';
  make:='FK-'+trim(Handle_Part)+trim(handle_no); //编码中为部门编号；
  edit2.Text:=setcode(temp,make);
  edit10.Text:=trim(Handle_Man);
end;


procedure Tfrm_Stock_Pay.Cmd_ExitClick(Sender: TObject);
var
    i,j,icol,t:integer;
    Check_Flag:string;
    sql:widestring;

begin
    frm_Public_Don:=Tfrm_Public_Don.Create(self);
    frm_Public_Don.ShowModal;
    if Public_Do='Stock_0005' then
    begin
        if func.Public_Do_Result='02' then //保存草稿
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
                    Application.MessageBox('操作错误,【票据编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                    Edit4.SetFocus;
                    Exit;
                end;
                if Trim(Edit5.Text)='' then
                begin
                    Application.MessageBox('操作错误,【入库单号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                    Edit5.SetFocus;
                    Exit;
                end;

                for j:=1 to StringGrid1.RowCount-1 do
                begin
                    if StringGrid1.Cells[5,j]='' then
                    begin
                        Application.MessageBox('操作错误,【结算金额】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
                        Exit;
                    end;
                end;
                sql:='SELECT * FROM PayReciveBill where Copy_date='''+Trim(Edit1.Text)+''' and Stock_No='''+Trim(Edit2.Text)+''' and billtype=0';
                dmmain.CDSquery2.Close;
                dmmain.CDSquery2.Data:=null;
                dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
                dmmain.CDSquery2.Open;
                if dmmain.CDSquery2.RecordCount>0 then
                begin
                    Application.MessageBox('添加失败,该记录已经存在，请确认！',pchar(application.Title),mb_iconwarning);
                    Exit;
                end else
                begin
                 if not dmmain.cdspay.Active then dmmain.cdspay.Open;
                 if not dmmain.cdspaydetail.Active then dmmain.cdspaydetail.Open;
                 if not dmmain.cdsreceipt.Active then dmmain.cdsreceipt.Open;
                    dmmain.cdspay.Insert;
                    dmmain.cdspay.FieldByName('billtype').AsString:='0';
                    dmmain.cdspay.FieldByName('copy_date').AsString:=trim(edit1.Text);
                    dmmain.cdspay.FieldByName('stock_no').AsString:=trim(edit2.Text);
                    dmmain.cdspay.FieldByName('stock_name').AsString:='采购付款单';
                    dmmain.cdspay.FieldByName('Contract_NO').AsString:=trim(edit6.Text); //付款方式
                    dmmain.cdspay.FieldByName('bill_no').AsString:=trim(edit4.Text);
                    dmmain.cdspay.FieldByName('join_no').AsString:=trim(wldwno);//往来单位编号
                    dmmain.cdspay.FieldByName('Balance_Modal').AsString:=trim(edit7.Text);
                    dmmain.cdspay.FieldByName('gather_Name').AsString:=trim(edit5.Text);
                    dmmain.cdspay.FieldByName('transactor').AsString:=trim(edit9.Text );
                    dmmain.cdspay.FieldByName('proposer').AsString:=trim(edit10.Text);
                    dmmain.cdspay.FieldByName('AccountId').AsString:=trim(edit2.Text);
                    dmmain.cdspay.FieldByName('Condense').AsString:=trim(edit11.Text);
                    dmmain.cdspay.FieldByName('remark').AsString:=trim(edit12.Text);
                    dmmain.cdspay.FieldByName('type').Asinteger:=edit7.ItemIndex;
                    dmmain.cdspay.Post;
                    dmmain.cdsReceipt.Open;
                    dmmain.cdsReceipt.Append;
                    dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=trim(edit2.Text);
                    dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='采购付款单';
                    dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=trim(edit1.Text);
                    dmmain.cdsReceipt.FieldByName('Proposer').AsString:=trim(edit10.Text);
                    dmmain.cdsReceipt.FieldByName('Condense').AsString:=trim(edit11.Text);
                    dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
                    dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
                    dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
                    dmmain.cdsReceipt.Post;
                    for i:=1 to StringGrid1.RowCount-1 do
                    begin
                      dmmain.cdspaydetail.Insert;
                      dmmain.cdspaydetail.FieldByName('ord').Asinteger:=i;
                      dmmain.cdspaydetail.FieldByName('stock_no').AsString:=trim(edit2.Text);
                      dmmain.cdspaydetail.FieldByName('Account_NO').AsString:=trim(StringGrid1.Cells[1,i]);
                      dmmain.cdspaydetail.FieldByName('Account_name').AsString:=trim(StringGrid1.Cells[2,i]);
                      dmmain.cdspaydetail.FieldByName('Account_money').AsString:=trim(StringGrid1.Cells[3,i]);
                      dmmain.cdspaydetail.FieldByName('good_id').AsString:=trim(StringGrid1.Cells[1,i]);
                      dmmain.cdspaydetail.FieldByName('Settlemented_money').AsString:=trim(StringGrid1.Cells[4,i]);//已结算
                      dmmain.cdspaydetail.FieldByName('NonSettlemented_money').AsString:=trim(StringGrid1.Cells[6,i]);//未结算
                      dmmain.cdspaydetail.FieldByName('Account_Remark').AsString:=trim(StringGrid1.Cells[3,i]);
                      dmmain.cdspaydetail.Post;
                    end;
                    try
                    dmmain.cdsReceipt.ApplyUpdates(-1);
                    dmmain.cdspay.ApplyUpdates(-1);
                    dmmain.cdspaydetail.ApplyUpdates(-1);
                    setnull(frm_Stock_Pay);
                    init;
                    except
                      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
                      exit;
                    end;
                 end;

        end;

        if func.Public_Do_Result='03' then // 废弃退出
        begin
            frm_data.ClientDataSet_Add.Active:=False;
            frm_data.ClientDataSet_Add.Close;
            frm_data.ClientDataSet2.Active:=False;
            frm_data.ClientDataSet2.Close;
            Close;
        end;
    end;
    //草稿单据的操作
    if Public_Do<>'Stock_0005' then
    begin
        if Public_Do_Result='02' then //保存审核后的草稿
        begin
          if not bedit then
          begin
            if trim(Handle_Man)<>trim(edit10.Text) then
            begin
              Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
              exit;
            end;
          end;
            dmmain.cdspay.edit;
            dmmain.cdspay.FieldByName('Contract_NO').AsString:=trim(edit4.Text);
            dmmain.cdspay.FieldByName('bill_no').AsString:=trim(edit4.Text);
            dmmain.cdspay.FieldByName('join_no').AsString:=trim(wldwno);
            dmmain.cdspay.FieldByName('Balance_Modal').AsString:=trim(edit7.Text);
            dmmain.cdspay.FieldByName('gather_Name').AsString:=trim(edit5.Text);
            dmmain.cdspay.FieldByName('transactor').AsString:=trim(edit9.Text );
            dmmain.cdspay.FieldByName('proposer').AsString:=trim(edit10.Text);
            dmmain.cdspay.FieldByName('AccountId').AsString:=trim(edit2.Text);
            dmmain.cdspay.FieldByName('Condense').AsString:=trim(edit11.Text);
            dmmain.cdspay.FieldByName('remark').AsString:=trim(edit12.Text);
            dmmain.cdspay.Post;
            for i:=1 to StringGrid1.RowCount-1 do
            begin
              dmmain.cdspaydetail.edit;
              dmmain.cdspaydetail.FieldByName('ord').Asinteger:=i;
              dmmain.cdspaydetail.FieldByName('stock_no').AsString:=trim(edit2.Text);
              dmmain.cdspaydetail.FieldByName('Account_NO').AsString:=trim(StringGrid1.Cells[1,i]);
              dmmain.cdspaydetail.FieldByName('Account_name').AsString:=trim(StringGrid1.Cells[2,i]);
              dmmain.cdspaydetail.FieldByName('Account_money').AsString:=trim(StringGrid1.Cells[3,i]);
              dmmain.cdspaydetail.FieldByName('good_id').AsString:=trim(StringGrid1.Cells[1,i]);
              dmmain.cdspaydetail.FieldByName('Settlemented_money').AsString:=trim(StringGrid1.Cells[4,i]);
              dmmain.cdspaydetail.FieldByName('NonSettlemented_money').AsString:=trim(StringGrid1.Cells[6,i]);
              dmmain.cdspaydetail.FieldByName('Account_Remark').AsString:=trim(StringGrid1.Cells[3,i]);
              dmmain.cdspaydetail.Post;
              try
              dmmain.cdspay.ApplyUpdates(-1);
              dmmain.cdspaydetail.ApplyUpdates(-1);
              except
                application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
                exit;
              end;
          end;
        end;
        if Public_Do_Result='03' then
        begin
            dmmain.cdspaydetail.Close;
            dmmain.cdspay.Close;
            Close;
        end;
     end;   
    frm_Public_Don.Free;
    setnull(SELF);
    init;
end;


procedure Tfrm_Stock_Pay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  dmmain.cdsprintmaster.Close;
  dmmain.cdsprintmaster.Data:=null;
    Action:=cafree;
end;

procedure Tfrm_Stock_Pay.FormShow(Sender: TObject);
var
    i,icount,k:integer;
    tt,yy,temppos:integer;
    sql:widestring;
begin
    //草稿单据查看
  INIT;
  if (Public_Do='Business_Draft_0004')  then
  begin
    edit7.Enabled:=false;
    sql:= 'Select a.*,b.* from PayReciveBill as a,PayReciveBill_detail as b where a.stock_no=b.stock_no and A.stock_No='+''''+List_No+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    k:=dmmain.CDSquery2.RecordCount;
    StringGrid1.RowCount:=k+1;
    //自动加载STRINGGRID的行数
    //Edit1.Text:=dmmain.CDSquery2.FieldValues['Copy_Date'];
    Edit1.Text:=dmmain.CDSquery2.FieldByName('Copy_Date').AsString;
    Edit2.Text:=dmmain.CDSquery2.FieldByName('STOCK_No').AsVariant;
    Edit6.Text:=dmmain.CDSquery2.FieldByName('Contract_NO').Asstring; //付款方式
    Edit4.Text:=dmmain.CDSquery2.FieldByName('Bill_NO').AsString;
     wldwno:=dmmain.CDSquery2.FieldByName('Join_NO').AsString;
    Edit6.Text:=dmmain.CDSquery2.FieldByName('Type').AsString;  //wg edit;
    Edit7.Text:=dmmain.CDSquery2.FieldByName('Balance_Modal').AsString;
    Edit5.Text:=dmmain.CDSquery2.FieldByName('Gather_Name').AsString;
    Edit9.Text:=dmmain.CDSquery2.FieldByName('Transactor').AsString;
    Edit10.Text:=dmmain.CDSquery2.FieldByName('Proposer').AsString;
    Edit11.Text:=dmmain.CDSquery2.FieldByName('Condense').AsString;
    Edit12.Text:=dmmain.CDSquery2.FieldByName('Remark').AsString;
    for k:=1 to StringGrid1.RowCount -1do
    begin
      StringGrid1.Cells[0,K]:=trim(dmmain.CDSquery2.FieldByName('ord').AsString);
      StringGrid1.Cells[1,k]:=trim(dmmain.CDSquery2.FieldByName('Account_NO').AsString);//商品编号
      StringGrid1.Cells[2,k]:=trim(dmmain.CDSquery2.FieldByName('Account_Name').AsString);//商品名称
      StringGrid1.Cells[3,k]:=trim(dmmain.CDSquery2.FieldByName('Account_Money').AsString);//数量
      StringGrid1.Cells[4,k]:=trim(dmmain.CDSquery2.FieldByName('Settlemented_money').AsString);//单价
      StringGrid1.Cells[5,k]:=trim(floattostr(dmmain.CDSquery2.FieldByName('Account_Money').Asfloat-dmmain.CDSquery2.FieldByName('NonSettlemented_money').Asfloat-dmmain.CDSquery2.FieldByName('Settlemented_money').Asfloat));//已结算
      StringGrid1.Cells[6,k]:=floattostr(dmmain.CDSquery2.FieldByName('ACCOUNT_money').Asfloat-strtofloat(StringGrid1.Cells[5,k]));//未结算;
      dmmain.CDSquery2.Next;
    end;
    GetDataPrint(dmmain.cdsprintmaster,dmmain.CDsquery2);
  end;
end;


procedure Tfrm_Stock_Pay.Cmd_AddClick(Sender: TObject);
begin
  addgridrows(stringgrid1);
end;
procedure Tfrm_Stock_Pay.SpeedButton2Click(Sender: TObject);
var
  user,wldwname,remarks:widestring;
  flag,intof:olevariant;
  i:integer;
  totals:double;
begin
  if trim(stringgrid1.Cells[1,1])='' then exit;
  no:=trim(edit2.Text);
  typed:='采购付款单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  totals:=0;
   for i:=1 to stringgrid1.RowCount-1 do
   begin
     totals:=totals+strtofloat(stringgrid1.Cells[5,i]); //本次结算金额
   end;
    wldwname:=trim(edit4.Text);
    remarks:='对财务入库单编号为：'+trim(edit5.Text)+'进行采购付款';
    intof:=ipubtemp.MoneyTable(12,no,totals,user,user,user,wldwno,wldwname,shopid,remarks);
    if vartostr(intof)='1' then
    begin
      flag:='3';
    end else
    begin
      flag:='2';
    end;
    ipubtemp.Gether(wldwno,totals,1,0);
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

procedure Tfrm_Stock_Pay.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  pcol:=acol;
  prow:=arow;
end;

procedure Tfrm_Stock_Pay.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if trim(stringgrid1.Cells[1,1])='' then exit;
  if (pcol=4) and (prow>0) then
  begin
    if key in ['0'..'9',#8,#13,'.'] then
    begin
      stringgrid1.Options:=stringgrid1.Options+[goediting];
    end else
    begin
      key:=#0;
    end;
  end else
  begin
    application.MessageBox('只能输入商品结算金额！',pchar(application.Title),mb_iconinformation);
    stringgrid1.Options:=stringgrid1.Options-[goediting];
    key:=#0;
    exit;
  end;
end;

procedure Tfrm_Stock_Pay.StringGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  jsmoney,wjmoney:double;
  i:integer;
begin
  jsmoney:=0;
  wjmoney:=0;
  if trim(stringgrid1.Cells[1,1])='' then exit;
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    if trim(stringgrid1.Cells[3,i])<>'' then
    begin
      if (Public_Do<>'Business_Draft_0004')  then
      begin
        stringgrid1.Cells[6,i]:=floattostr(strtofloat(stringgrid1.Cells[3,i])-strtofloat(stringgrid1.Cells[4,i])-strtofloat(stringgrid1.Cells[5,i]));
        IF (strtofloat(stringgrid1.Cells[3,i])-strtofloat(stringgrid1.Cells[5,i]))<strtofloat(stringgrid1.Cells[4,i]) THEN
        BEGIN
          APPLICATION.MessageBox('本次结算不能大于应付费用！',pchar(application.Title),mb_iconinformation);
          stringgrid1.Cells[4,i]:='0';
          exit;
        END;
      end else
      begin
       // if  strtofloat(stringgrid1.Cells[5,i])<>strtofloat(stringgrid1.Cells[4,i]) then
       // begin
          //stringgrid1.Cells[5,i]:=floattostr(strtofloat(stringgrid1.Cells[3,i])-strtofloat(stringgrid1.Cells[4,i]));
        //end else
       // begin
          //stringgrid1.Cells[5,i]:='0';
       // end;
        stringgrid1.Cells[6,i]:=floattostr(strtofloat(stringgrid1.Cells[3,i])-strtofloat(stringgrid1.Cells[5,i]));
      end;
      jsmoney:=jsmoney+strtofloat(stringgrid1.Cells[4,i])+strtofloat(stringgrid1.Cells[5,i]);
      wjmoney:=wjmoney+strtofloat(stringgrid1.Cells[3,i])-strtofloat(stringgrid1.Cells[4,i])-strtofloat(stringgrid1.Cells[5,i]);
    end;
  end;
  lbjs.Caption:=format('%11.'+inttostr(len)+'f',[jsmoney]);
  lbwj.Caption:=format('%11.'+inttostr(len)+'f',[wjmoney]);
end;

procedure Tfrm_Stock_Pay.StringGrid1DrawCell(Sender: TObject; ACol,
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

end;

procedure Tfrm_Stock_Pay.SpeedButton9Click(Sender: TObject);
begin
  Employe_Check:='';
    Employe_Check:='Stock_Fad_str';
    Employe_Check_Result:='';
    frm_Login_Man:=Tfrm_Login_Man.Create(self);
    frm_Login_Man.Caption:='经手人选择';
    frm_Login_Man.ShowModal;
    Edit9.Text:=Employe_Check_Result;
    frm_Login_Man.Free;
end;

procedure Tfrm_Stock_Pay.SpeedButton7Click(Sender: TObject);
begin
  Employe_Check:='';
    Employe_Check:='Stock_Fad_str';
    Employe_Check_Result:='';
    frm_Login_Man:=Tfrm_Login_Man.Create(self);
    frm_Login_Man.Caption:='制单人选择';
    frm_Login_Man.ShowModal;
    Edit10.Text:=Employe_Check_Result;
    frm_Login_Man.Free;
end;

procedure Tfrm_Stock_Pay.Cmd_DeleteClick(Sender: TObject);
begin
  deletegridrows(stringgrid1,prow);
end;

procedure Tfrm_Stock_Pay.StringGrid1DblClick(Sender: TObject);
var
  b:boolean;
begin
  if trim(edit5.Text)='' then
  begin
    application.MessageBox('请选择往来单位！',pchar(application.Title),mb_iconinformation);
    exit; 
  end;
  if pcol in [1,2] then
  begin
  frmselect:=tfrmselect.Create(self);
  frmselect.flag:=2;
  frmselect.ShowModal;
  frmselect.Free;
  if edit7.ItemIndex =0 then b:=false;
  if edit7.ItemIndex =1 then b:=true;
  READGoodsORBill(stockinput,b);
  end;
end;

procedure Tfrm_Stock_Pay.Edit7Change(Sender: TObject);
var
  b:boolean;
begin
  if edit7.ItemIndex =0 then b:=false;
  if edit7.ItemIndex =1 then b:=true;
  ChangGRID(b);
end;

procedure Tfrm_Stock_Pay.SpeedButton6Click(Sender: TObject);
begin
  Check_Mond:='';
  wldwno:='';
  Check_Mond:='DW-0001';
  frm_Supply_Monad:=Tfrm_Supply_Monad.Create(self);
  frm_Supply_Monad.Caption:='【往来单位】';
  frm_Supply_Monad.ShowModal;
  edit5.Text:=Trim(check_Mond_Result);
  frm_Supply_Monad.Free;
end;

procedure Tfrm_Stock_Pay.SpeedButton3Click(Sender: TObject);
begin
  if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='payment.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

end.
