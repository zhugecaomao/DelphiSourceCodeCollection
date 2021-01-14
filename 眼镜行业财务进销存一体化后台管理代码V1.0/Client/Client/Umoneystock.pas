unit Umoneystock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ubase, StdCtrls, Buttons, ExtCtrls, Grids;

type
  Tfrmmoneystock = class(Tfrmbase)
    Panel3: TPanel;
    Cmd_HT: TSpeedButton;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Edit4: TLabeledEdit;
    Edit_Stock_Name: TLabeledEdit;
    Edit6: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit9: TLabeledEdit;
    Edit10: TLabeledEdit;
    Edit5: TEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    sgorder: TStringGrid;
    Label2: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    LbPRICE: TLabel;
    Label3: TLabel;
    LbMONEY: TLabel;
    procedure spbexitClick(Sender: TObject);
    procedure Cmd_HTClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure sgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgorderKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgorderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton3Click(Sender: TObject);
  private
    locatcol,locatrow:integer;
    procedure init;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmoneystock: Tfrmmoneystock;

implementation

uses Uinputselect, untdatadm, Public_Don, func, Login_Man, Unt_PubStrGrid,
  Unitreportxf;

{$R *.dfm}
procedure tfrmmoneystock.init;
var
  temp,make:string;
begin
  InitialStrGrid(sgorder,'财务入库');
  temp:='select max(right(stock_no,4)) from MONEYINPUT where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+'''';
  make:='CW-'+trim(Handle_Part)+trim(handle_no); //5-11  编码中用部门编号；
  edit2.Text:=setcode(temp,make);
  edit1.Text:=formatdatetime('yyyy''-''mm''-''dd',date);
  edit8.Text:=trim(Handle_Man);
end;
procedure Tfrmmoneystock.spbexitClick(Sender: TObject);
var
  i:integer;
  sql:string;
begin
  ////////////////
  frm_Public_Don:=Tfrm_Public_Don.Create(self);
  frm_Public_Don.ShowModal;
  if Public_Do='money_stock' then
  begin
    if Public_Do_Result='02' then //添加
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
      if Trim(Edit3.Text)='' then
      begin
          application.MessageBox('操作错误,【入库单据号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
          Edit3.SetFocus;
          Exit;
      end;
      for i:=1 to sgorder.RowCount-1 do
      begin
          if sgorder.Cells[1,i]='' then
          begin
              application.MessageBox('操作错误,【商品编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
              Exit;
          end;
          if sgorder.Cells[5,i]='' then
          begin
              application.MessageBox('操作错误,【单价】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
              Exit;
          end;
      end;
      if not dmmain.cdsmoneyinput.Active then  dmmain.cdsmoneyinput.Open;
      dmmain.cdsmoneyinput.Insert;  //财务入库主表;
      dmmain.cdsmoneyinput.FieldByName('copy_date').AsString:=trim(edit1.text);
      dmmain.cdsmoneyinput.FieldByName('stock_no').AsString:=trim(edit2.text);
      dmmain.cdsmoneyinput.FieldByName('input_no').AsString:=trim(edit3.text);
      dmmain.cdsmoneyinput.FieldByName('wldw').AsString:=trim(edit4.text);
      dmmain.cdsmoneyinput.FieldByName('wldw_no').AsString:=trim(wldwno);
      dmmain.cdsmoneyinput.FieldByName('shop_no').AsString:=trim(edit5.text);
      dmmain.cdsmoneyinput.FieldByName('Transactor').AsString:=trim(edit6.text);
      dmmain.cdsmoneyinput.FieldByName('proposer').AsString:=trim(edit8.text);
      dmmain.cdsmoneyinput.FieldByName('Condense').AsString:=trim(edit9.text);
      dmmain.cdsmoneyinput.FieldByName('remark').AsString:=trim(edit10.text);
      dmmain.cdsmoneyinput.Post;
      dmmain.cdsReceipt.Close;
      dmmain.cdsReceipt.Open;
      dmmain.cdsReceipt.Append;
      dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(Edit2.Text);
      dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='财务入库单';
      dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
      dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edit8.Text);
      dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
      dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
      dmmain.cdsReceipt.FieldByName('Condense').AsString:=Trim(Edit10.Text);
      dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
      dmmain.cdsReceipt.Post;
      if dmmain.cdsmoneydetail.Active then dmmain.cdsmoneydetail.Close;
      dmmain.cdsmoneydetail.Open;
      for i:=1 to sgorder.RowCount-1 do
      begin
        dmmain.cdsmoneydetail.Insert;
        dmmain.cdsmoneydetail.FieldByName('stock_no').AsString:=trim(edit2.Text);
        dmmain.cdsmoneydetail.FieldByName('goods_no').AsString:=trim(sgorder.Cells[1,i]);
        dmmain.cdsmoneydetail.FieldByName('amount').AsString:=trim(sgorder.Cells[3,i]);
        dmmain.cdsmoneydetail.FieldByName('baseprice').AsString:=trim(sgorder.Cells[4,i]);
        dmmain.cdsmoneydetail.FieldByName('money').AsString:=trim(sgorder.Cells[5,i]);
        dmmain.cdsmoneydetail.Post;
      end;
      try
        dmmain.cdsReceipt.ApplyUpdates(-1);
        dmmain.cdsmoneyinput.ApplyUpdates(-1);
        dmmain.cdsmoneydetail.ApplyUpdates(-1);
        if trim(edit3.Text)<>'' then
          setpass(edit3.Text);
        setnull(frmmoneystock);
        init;
      except
        application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end;
  end;
  if Public_Do='Business_money' then
   begin
      //修改草稿单据
      if Public_Do_Result='02' then
      begin
        if not bedit then
        begin
          if trim(Handle_Man)<>trim(edit8.Text) then
          begin
            Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
            exit;
          end;
        end;
        sql:='select * from moneyinput where stock_no='+''''+Trim(List_NO)+'''';
        if dmmain.CDSexecsql.Active then  dmmain.cdsmoneyinput.close;
        dmmain.CDSexecsql.Data:=null;
        dmmain.CDSexecsql.Data:=adisp.execSql(sql);
        dmmain.CDSexecsql.Open;
        dmmain.CDSexecsql.edit;  //财务入库主表;
        dmmain.CDSexecsql.FieldByName('copy_date').AsString:=trim(edit1.text);
        dmmain.CDSexecsql.FieldByName('stock_no').AsString:=trim(edit2.text);
        dmmain.CDSexecsql.FieldByName('input_no').AsString:=trim(edit3.text);
        dmmain.CDSexecsql.FieldByName('wldw').AsString:=trim(edit4.text);
        dmmain.CDSexecsql.FieldByName('wldw_no').AsString:=trim(wldwno); //////////
        dmmain.CDSexecsql.FieldByName('shop_no').AsString:=trim(edit5.text);
        dmmain.CDSexecsql.FieldByName('Transactor').AsString:=trim(edit6.text);
        dmmain.CDSexecsql.FieldByName('proposer').AsString:=trim(edit8.text);
        dmmain.CDSexecsql.FieldByName('Condense').AsString:=trim(edit9.text);
        dmmain.CDSexecsql.FieldByName('remark').AsString:=trim(edit10.text);
        dmmain.CDSexecsql.Post;
        try
          dmmain.CDSexecsql.ApplyUpdates(-1);
        except
          application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconinformation);
          exit;
        end;
         sql:='select * from moneyinput_detail where stock_no='+''''+Trim(List_NO)+'''';
        if dmmain.CDSexecsql.Active then  dmmain.cdsmoneyinput.close;
        dmmain.CDSexecsql.Data:=null;
        dmmain.CDSexecsql.Data:=adisp.execSql(sql);
        dmmain.CDSexecsql.Open;
        if dmmain.CDSexecsql.Active then dmmain.CDSexecsql.Close;
        dmmain.CDSexecsql.Open;
        for i:=1 to sgorder.RowCount-1 do
        begin
          dmmain.CDSexecsql.edit;
          dmmain.CDSexecsql.FieldByName('stock_no').AsString:=trim(edit2.Text);
          dmmain.CDSexecsql.FieldByName('goods_no').AsString:=trim(sgorder.Cells[1,i]);
          dmmain.CDSexecsql.FieldByName('amount').AsString:=trim(sgorder.Cells[3,i]);
          dmmain.CDSexecsql.FieldByName('baseprice').AsString:=trim(sgorder.Cells[4,i]);
          dmmain.CDSexecsql.FieldByName('money').AsString:=trim(sgorder.Cells[5,i]);
          dmmain.CDSexecsql.Post;
          dmmain.CDSexecsql.Next;
        end;
        try
          dmmain.CDSexecsql.ApplyUpdates(-1);
        except
          application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconinformation);
          exit;
        end;
      end;
    end;
   if func.Public_Do_Result='03' then  //废弃退出
    begin
      dmmain.CDSexecsql.Close;
      Close;
    end;
  //inherited;
end;

procedure Tfrmmoneystock.Cmd_HTClick(Sender: TObject);
begin
  inherited;
  frmselect:=tfrmselect.Create(self);
  frmselect.flag:=1;
  frmselect.ShowModal;
  frmselect.Free;
  //if not DMMAIN.CDSquery.IsEmpty  then 
  edit3.Text:=stockinput;
end;

procedure Tfrmmoneystock.Edit3Change(Sender: TObject);
var
  sql:widestring;
  i:integer;
begin
  inherited;
  if trim(Public_Do)='money_stock' then
  begin
    if trim(edit3.Text)<>'' then
    begin
      sql:='Select a.*,b.*,c.* from stock_jion_detail as a, Goods_code as b,stock_jion as c where a.goods_no=b.goods_no and a.stock_No=c.stock_No and a.stock_No='+''''+trim(edit3.Text)+'''';
      dmmain.CDSquery2.Close;
      dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
      dmmain.CDSquery2.Open;
      i:=1;
      if not dmmain.CDSquery2.IsEmpty then sgorder.RowCount:=dmmain.CDSquery2.RecordCount+1 else sgorder.RowCount:=2;
      Edit4.Text:=dmmain.CDSquery2.Fieldbyname('wldw').AsString;//FieldValues['wldw'];
      Edit5.Text:=dmmain.CDSquery2.Fieldbyname('storage_NO').AsString;//FieldValues['Storage_NO'];
      Edit9.Text:=dmmain.CDSquery2.Fieldbyname('resume').AsString;//FieldValues['Remark'];
      Edit10.Text:=dmmain.CDSquery2.Fieldbyname('Remark').AsString;//
      wldwno:=dmmain.CDSquery2.Fieldbyname('wldw_no').AsString;
      while not dmmain.CDSquery2.Eof do
      begin
        sgorder.Cells[0,i]:=inttostr(i);
        sgorder.Cells[1,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_NO').AsString);//FieldValues['Goods_NO'];//商品编号
        sgorder.Cells[2,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_Name').AsString);//FieldValues['Goods_Name'];//商品名称
        sgorder.Cells[3,i]:=trim(dmmain.CDSquery2.Fieldbyname('amount').AsString);//FieldValues['amount'];//金额
        sgorder.Cells[6,i]:=trim(dmmain.CDSquery2.Fieldbyname('type').AsString);//FieldValues['Valid_Day']; //有效日期
        sgorder.Cells[7,i]:=trim(dmmain.CDSquery2.Fieldbyname('quality').AsString);//FieldValues['Remark'];  //备注说明
        dmmain.CDSquery2.Next;
        inc(i);
      end;
    end;
  end;
end;

procedure Tfrmmoneystock.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  locatcol:=acol;
  locatrow:=arow;
  sgorderMouseMove(sender,[ssshift],0,0);
end;

procedure Tfrmmoneystock.sgorderKeyPress(Sender: TObject;
  var Key: Char);
begin
  if trim(sgorder.Cells[1,1])='' then exit;
  if locatcol=4 then
  begin
    if not (key in ['0'..'9',#8,'.']) then
    begin
      key:=#0;
    end else
    begin
      if key<>#8 then
      begin
        if sgorder.Cells[4,locatrow]<>'0' then
        begin
          sgorder.Cells[4,locatrow]:=sgorder.Cells[4,locatrow]+key;
        end else
        begin
          sgorder.Cells[4,locatrow]:=key;
        end;
        sgorder.Cells[5,locatrow]:=floattostr(strtofloat(sgorder.Cells[3,locatrow])*strtofloat(sgorder.Cells[4,locatrow]));
      end else
      begin
        sgorder.Cells[4,locatrow]:=copy(sgorder.Cells[4,locatrow],1,length(sgorder.Cells[4,locatrow])-1);   //减去最后数字
        if  sgorder.Cells[4,locatrow]='' then
        begin
          sgorder.Cells[4,locatrow]:='0';
        end;
        if trim(sgorder.Cells[4,locatrow])='0' then
        begin
          sgorder.Cells[5,locatrow]:='0';
        end else
        begin
          sgorder.Cells[5,locatrow]:=floattostr(strtofloat(sgorder.Cells[3,locatrow])*strtofloat(sgorder.Cells[4,locatrow]));
        end;
      end;
    end;
  end else
  begin
    application.MessageBox('只能输入商品单价！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  //inherited;
end;


procedure Tfrmmoneystock.FormShow(Sender: TObject);
var
 tempstr:string ;
 i,k:integer;
begin
  inherited;
  init;
  if Public_Do='Business_money' then
  begin
    tempstr:='Select a.*,b.*,c.* from moneyinput as a,moneyinput_detail as b,goods_code as c where a.stock_no=b.stock_no and b.goods_no=c.goods_no and a.stock_No='+''''+trim(List_No)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
     //wy edit 3-14   begin
    dmmain.CDSquery2.Data:=adisp.resultrecord(tempstr);
    if not dmmain.CDSquery2.IsEmpty then       //返回记录集为空时在往下走要报错，Wy
    begin
      dmmain.CDSquery2.Open;
      k:=dmmain.CDSquery2.RecordCount;
      sgorder.RowCount:=k+1;
      i:=1;
      edit2.Text:=dmmain.CDSquery2.Fieldbyname('stock_no').AsString;
      edit3.Text:=dmmain.CDSquery2.Fieldbyname('input_no').AsString;
      Edit4.Text:=dmmain.CDSquery2.Fieldbyname('wldw').AsString;//FieldValues['wldw'];
      Edit5.Text:=dmmain.CDSquery2.Fieldbyname('shop_NO').AsString;//FieldValues['Storage_NO'];
      Edit9.Text:=dmmain.CDSquery2.Fieldbyname('condense').AsString;//FieldValues['Remark'];
      Edit10.Text:=dmmain.CDSquery2.Fieldbyname('Remark').AsString;//
      edit6.Text:=dmmain.CDSquery2.Fieldbyname('Transactor').AsString;
      edit8.Text:=dmmain.CDSquery2.Fieldbyname('proposer').AsString;
      wldwno:=dmmain.CDSquery2.Fieldbyname('wldw_no').AsString;
      while not dmmain.CDSquery2.Eof do
      begin
        sgorder.Cells[0,i]:=inttostr(i);
        sgorder.Cells[1,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_NO').AsString);//FieldValues['Goods_NO'];//商品编号
        sgorder.Cells[2,i]:=trim(dmmain.CDSquery2.Fieldbyname('Goods_Name').AsString);//FieldValues['Goods_Name'];//商品名称
        sgorder.Cells[3,i]:=trim(dmmain.CDSquery2.Fieldbyname('amount').AsString);//FieldValues['amount'];//金额
        sgorder.Cells[4,i]:=trim(dmmain.CDSquery2.Fieldbyname('baseprice').AsString);
        sgorder.Cells[5,i]:=trim(dmmain.CDSquery2.Fieldbyname('money').AsString);
        sgorder.Cells[6,i]:=trim(dmmain.CDSquery2.Fieldbyname('type').AsString);//FieldValues['Goods_Modal'];//球面度数
        sgorder.Cells[7,i]:=trim(dmmain.CDSquery2.Fieldbyname('Remark').AsString);//FieldValues['Remark'];  //备注说明
        dmmain.CDSquery2.Next;
        inc(i);
      end;
    end;
    GetDataPrint(dmmain.cdsprintmaster,dmmain.CDsquery2);
  end;
end;

procedure Tfrmmoneystock.SpeedButton2Click(Sender: TObject);
var
  temp:integer;
  user,no,typed,wldwname,remarks:widestring;
  flag,intof:olevariant;
  i:integer;
  totals:double;
begin
  inherited;
  if trim(sgorder.Cells[1,1])='' then exit;
  no:=trim(edit2.Text);
  //shopid:=trim(edit5.Text);
  typed:='财务入库单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    /////////////////向对应的商品单价表里添加单价////////
    temp:=1;
    flag:=adisp.inputMoney(no,temp); //财务入库
    totals:=0;
    for i:=1 to sgorder.RowCount-1 do
    begin
      totals:=totals+strtofloat(sgorder.Cells[4,i]);
    end;
    /////////////////////////////////
    wldwname:=trim(edit4.Text);
    remarks:='对入库单编号为：'+trim(edit3.Text)+'进行财务入库';
    intof:=ipubtemp.MoneyTable(1,no,totals,user,user,user,wldwno,wldwname,shopid,remarks);
    if vartostr(intof)='1' then
    begin
      flag:='3';
    end else
    begin
      flag:='2';
    end;
    ////////////////////////////////////////////////////////////////////////////////
     ipubtemp.Gether(wldwno,totals,1,1);
    ////////////////////////////////////////////////////
  end;
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

procedure Tfrmmoneystock.sgorderDrawCell(Sender: TObject; ACol,
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

procedure Tfrmmoneystock.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  Employe_Check:='';
  Employe_Check:='Stock_Fad_str';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='经手人选择';
  frm_Login_Man.ShowModal;
  Edit6.Text:=Employe_Check_Result;
  frm_Login_Man.Free;
end;

procedure Tfrmmoneystock.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  DMMAIN.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  dmmain.cdsprintmaster.Close;
  dmmain.cdsprintmaster.Data:=null;
  inherited;

end;

procedure Tfrmmoneystock.sgorderMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
    i:integer;
    Dprices,Dmoney:double;
begin
  inherited;
  DPRICES:=0.00;
  Dmoney:=0.00;
  for i:=1 to sgorder.RowCount -1 do
  begin
    if trim(sgorder.Cells[4,i])<>'' then
    begin
      Dprices:=Dprices+strtofloat(trim(sgorder.Cells[4,i]));
      Dmoney:= Dmoney+strtofloat(trim(sgorder.Cells[5,i]));
    end;
  end;
  Lbprice.Caption:=format('%8.'+inttostr(len)+'f',[Dprices]);
  Lbmoney.Caption:=format('%8.'+inttostr(len)+'f',[Dmoney]);

end;

procedure Tfrmmoneystock.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='MoneyEnter.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

end.
