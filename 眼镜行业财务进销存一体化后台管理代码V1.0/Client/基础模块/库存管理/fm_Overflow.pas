unit fm_Overflow;

//////////2004-4-14 modify ydy 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Menus;

type
  TfmOverflow = class(TfmBase)
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Panel1: TPanel;
    Label10: TLabel;
    edttotals: TLabel;
    Panel2: TPanel;
    BitBtn7: TBitBtn;
    BitBtn1: TBitBtn;
    btnSave: TBitBtn;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtremakt: TEdit;
    edtnewdate: TEdit;
    edtcode: TEdit;
    edtnewmen: TEdit;
    sgorder: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Bevel2: TBevel;
    CmbG: TComboBox;
    CmbC: TComboBox;
    Label5: TLabel;
    EdtTotalCount: TLabel;
    BitBtn2: TBitBtn;
    btnprint: TBitBtn;
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sgorderDblClick(Sender: TObject);
    procedure sgorderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgorderKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
    part_no,stockid:widestring;
    function readdata:boolean; //数据绑定
    procedure init;
    procedure DeleteRow(Row: Integer);
    procedure TotalCount;  //汇总计算
  public
    { Public declarations }
    ///不要求判断库存数量  2004-4-14
  end;

var
  fmOverflow: TfmOverflow;
implementation

uses UntgoodCodeSelStr, func, untdatadm, Unitreportxf;

var
  pcol,prow:integer;
  flag:string;

{$R *.dfm}
///////////////////////////////////

function tfmOverflow.readdata:boolean;
var
  temp:widestring;
  i:integer;
  r:boolean;
begin
  r:=false;
  if Public_Do='stock_outed' then
  begin
    temp:='select * from dp_Overflow as a,dp_Overflowdetail as b,goods_prices as c where c.goods_no=b.od_ccode and a.o_code=b.od_ocode and a.o_code='+''''+trim(list_no)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=NULL;
    dmmain.CDSquery2.Data:=adisp.resultrecord(temp);
    try
    dmmain.CDSquery2.Open;
    temp:='select * from dp_Overflow where o_code='+''''+trim(list_no)+'''';
    if dmmain.CDSexecsql.Active then dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.data:=null;
    dmmain.CDSexecsql.Data:=adisp.execSql(temp);
    dmmain.CDSexecsql.Open; 
    r:=true;
    bitbtn1.Enabled:=false;
    flag:='1';
    except
    end;
    edtnewdate.text:=dmmain.CDSquery2.fieldbyname('o_newdate').AsString;
    edtnewmen.text:=dmmain.CDSquery2.fieldbyname('o_newman').AsString;
    edtcode.text:=dmmain.CDSquery2.fieldbyname('o_code').AsString;
    cmbg.text:=dmmain.CDSquery2.fieldbyname('o_operater').AsString;
    cmbc.text:=dmmain.CDSquery2.fieldbyname('o_auditer').AsString;
    edtremakt.text:=dmmain.CDSquery2.fieldbyname('o_remark').AsString;
    part_no:=dmmain.CDSquery2.fieldbyname('o_shop').AsString;
     //stockid
    temp:='select storageid from part where part_no='+''''+trim(part_no)+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    try
    dmmain.CDSexecsql.Data:=adisp.execSql(temp);
    dmmain.CDSexecsql.Open;
    stockid:=trim(dmmain.CDSexecsql.fieldbyname('storageid').AsString);
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    except
      exit;
    end;
    ///
    sgorder.RowCount:=dmmain.CDSquery2.RecordCount+1;
    for i:=1 to dmmain.CDSquery2.RecordCount do
    begin
      sgorder.Cells[0,i]:=inttostr(i);
      sgorder.Cells[1,i]:=dmmain.CDSquery2.fieldbyname('od_ccode').AsString;
      sgorder.Cells[2,i]:=dmmain.CDSquery2.fieldbyname('od_cname').AsString;
      sgorder.Cells[4,i]:=dmmain.CDSquery2.fieldbyname('od_ccount').AsString;
      sgorder.Cells[8,i]:=dmmain.CDSquery2.fieldbyname('baseprice').AsString;
      dmmain.CDSquery2.Next;
    end;
    GetDataPrint(dmmain.cdsprintmaster,dmmain.CDsquery2);
  end;
  result:=r;
end;
procedure tfmOverflow.DeleteRow(Row: Integer);
var
  i : integer;
begin
//最后一行直接删除
 if (Row = sgorder.RowCount-1) and (row >1)  then
    Sgorder.RowCount := Sgorder.RowCount - 1;

//自动上移
  if (Row < Sgorder.RowCount) and (Row > Sgorder.FixedRows-1) then
  begin
    if Row < Sgorder.RowCount - 1 then
    begin
      for i := Row to Sgorder.RowCount-1 do
        Sgorder.Rows[i] := Sgorder.Rows[i+1];
      Sgorder.RowCount := Sgorder.RowCount - 1;
    end;
  end;
end;
procedure TfmOverflow.init;
var
  maks,sql,s_newdate:string;
begin
  s_newdate:=formatdatetime('yyyy''-''mm''-''dd',date);
  sql:='select max(right(o_Code,4)) from DP_Overflow where o_newdate='+''''+s_NewDate+''''+' and o_shop='+''''+trim(Handle_Part)+''''; //部门编号
  maks:='BY-'+Handle_Part+trim(handle_no);
  edtcode.Text:=setcode(sql,maks); //Autoid

  edtnewdate.Text:=formatdatetime('yyyy''-''mm''-''dd',Date);
  edtnewmen.Text:=Handle_Man;
  flag:='1';
  if not dmmain.cdsOverflow.Active  then dmmain.cdsOverflow.Open;
  if not dmmain.cdsOverflowdetail.Active  then dmmain.cdsOverflowdetail.Open;

  EdtTotalCount.Caption :='';
  edttotals.Caption :='';

end;

procedure TfmOverflow.BitBtn7Click(Sender: TObject);
begin
  inherited;
  ////2004-3-8加入
 dmmain.CDSexecsql.Data := null; //客户端内存减少
  dmmain.CDSexecsql.Close;   //ydy add

  close;
end;

procedure TfmOverflow.FormShow(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  sgorder.Cells[1,0]:='商品编号';
  sgorder.ColWidths[0] := 20;
  sgorder.ColWidths[1] := 130;
  sgorder.ColWidths[2] := 190;
  sgorder.ColWidths[6] := 70;
  sgorder.Cells[2,0]:='商品名称';
  sgorder.Cells[3,0]:='商品单价';
  sgorder.Cells[4,0]:='商品数量';
  sgorder.Cells[5,0]:='商品折扣';
  sgorder.Cells[6,0]:='折扣后单价';
  sgorder.Cells[7,0]:='金额';
  sgorder.ColWidths[8]:=0;
  if not readdata then
  begin
    init;
     t_sql:='select p_name from  [dp_person] where p_workid ='+''''+trim(Handle_Part)+'''';
  GetDataToComBoX(cmbg,t_sql,'p_name');
  cmbg.ItemIndex := -1;
  cmbc.Items := cmbg.Items;
  end;
end;

procedure TfmOverflow.BitBtn1Click(Sender: TObject);
var
  sql:widestring;
  i:integer;
  quedata:olevariant;
begin
  inherited;
  //sql:='select cd_ccode as code ,cd_cname as name ,CD_Amount as count from dp_checkdetail where cd_checkcode in (select c_code from dp_check where c_state='+''''+'4'+''''+' or c_shop='+''''+trim(shopid)+''''+') and cd_state='+''''+'2'+''''; //盘点转单
  flag:='2';
  //select * from vcheckdata where c_shop
  sql:='select * from [vcheckdata]  where count>0 and c_shop='+''''+trim(Handle_Part)+''''+' and cd_state='+''''+'1'+'''';  // 加工的定单；
  if dmmain.CDSexecsql.Active then dmmain.CDSexecsql.Close;
  try
    dmmain.CDSexecsql.Data:=adisp.execSql(sql);
  except
  end;
  dmmain.CDSexecsql.Open;
  dmmain.CDSexecsql.First;
  i:=1;
  while not dmmain.CDSexecsql.Eof do //加载显示(thing)
  begin
    sgorder.Cells[1,i]:=trim(dmmain.CDSexecsql.fieldbyname('code').AsString );
    sgorder.Cells[2,i]:=trim(dmmain.CDSexecsql.fieldbyname('name').AsString );
    sgorder.Cells[8,i]:=trim(dmmain.CDSexecsql.fieldbyname('baseprice').Asstring);
    sgorder.Cells[4,i]:=trim(dmmain.CDSexecsql.fieldbyname('count').AsString);
    dmmain.CDSexecsql.Next;
    if i<>1 then
    begin
      sgorder.RowCount:= sgorder.RowCount+1;
    end;
    inc(i);
  end;
end;

procedure TfmOverflow.sgorderDblClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if flag='1' then
  begin
    if pcol in [1,2,3] then
    begin
////2004-4-12 add
   fmgoodCodeSelStr:= TfmgoodCodeSelStr.Create(nil);
   try
    fmgoodcodeselStr.show_mode:='4';
   fmgoodcodeselStr.ShowModal;
   finally
   fmgoodcodeselStr.Free;
   end;
{
      with tfmgoods.Create(self) do
      try
        show_mode:='4';  ///ydy modify
        ShowModal;
      finally
        Free;
      end;
}
    end;
  if pcol = 4 then  //复制数量
  begin
   for i := prow+1 to sgorder.rowcount -1 do
   begin
   sgorder.cells[4,i]:= sgorder.cells[4,prow];
   //同时要计算金额
   if trim(sgorder.Cells[4,i]) <>''  then
   begin
        sgorder.Cells[7,i]:=floattostrf(strtofloat(sgorder.Cells[3,i])*strtofloat(sgorder.Cells[4,i]),ffFixed,11,2);  //无折扣单价
   end;
    TotalCount;
  end;
  end;

  end;
end;

procedure TfmOverflow.sgorderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
end;

procedure TfmOverflow.sgorderKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if flag='1' then
  begin
    if pcol in [4] then
    begin
      if not (key in ['0'..'9',#8,'.']) then
      begin
        key:=#0;
      end else
      begin
        if key<>#8 then
        begin
          if pcol=4 then  sgorder.Cells[4,prow]:=sgorder.Cells[4,prow]+key;
        end else
        begin
          if pcol=4 then
          begin
            sgorder.Cells[4,prow]:='';  //不加退格符号;
            sgorder.Cells[7,prow]:='';
           //汇总计算
           TotalCount;
          end;
          exit;
        end;
      end;
    end;
    if trim(sgorder.Cells[3,prow])<>'' then
    begin
      if sgorder.Cells[4,prow]<>'' then
      begin
        sgorder.Cells[7,prow]:=floattostrf(strtofloat(sgorder.Cells[3,prow])* strtofloat(sgorder.Cells[4,prow]),ffFixed,11,2);  //无折扣单价
      end ;
    end else
    begin
      sgorder.Cells[7,prow]:='0';
    end;
  end;

   //汇总计算
   TotalCount;


end;

procedure TfmOverflow.btnSaveClick(Sender: TObject);
var
  i,j:integer;
  sql,temp:widestring;
begin
  inherited;
  if (trim(cmbg.Text)='') or (trim(cmbc.Text)='') then
  begin
    application.MessageBox('请选择报损经手人或审核人！',pchar(application.Title),mb_iconinformation);
    cmbg.SetFocus;
    exit;
  end;

  if trim(sgorder.Cells[1,1])='' then
  begin
    application.MessageBox('请选择报损商品明细！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if Public_Do='Overflow_0001' then
  begin
  dmmain.cdsOverflow.Insert;
  dmmain.cdsOverflow.FieldByName('o_code').AsString:=trim(edtcode.Text );
  dmmain.cdsOverflow.FieldByName('o_shop').AsString:=trim(Handle_Part);//修改 5-19
  dmmain.cdsOverflow.FieldByName('o_newdate').AsString:=formatdatetime('yyyy''-''mm''-''dd',date);
  dmmain.cdsOverflow.FieldByName('o_newman').AsString:=trim(edtnewmen.Text );
  dmmain.cdsOverflow.FieldByName('o_remark').AsString:=trim(edtremakt.Text);
  dmmain.cdsOverflow.FieldByName('o_operater').AsString:=trim(cmbg.Text);
  dmmain.cdsOverflow.FieldByName('o_auditer').AsString:=trim(cmbc.Text);
  ////////add auditer//////////////////////
  dmmain.cdsOverflow.FieldByName('o_state').AsString:='0';
  /////////////////////////////////////////
  dmmain.cdsOverflow.Post;
  j:=sgorder.RowCount-1;
  for i:=1 to  j do
  begin
    with dmmain.cdsOverflowdetail do
    begin
      insert;
      fieldbyname('od_ocode').AsString:=trim(edtcode.Text);
      fieldbyname('od_ccode').AsString:=trim(sgorder.Cells[1,i]);
      fieldbyname('od_cname').AsString:=trim(sgorder.Cells[2,i]);
      fieldbyname('od_ccount').AsString:=trim(sgorder.Cells[4,i]);
      post;
    end;
  end;
  dmmain.cdsReceipt.Close;
  dmmain.cdsReceipt.Open;
  dmmain.cdsReceipt.Append;
  dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(Edtcode.Text);
  dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='库存报溢单';
  dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=Trim(Edtnewdate.Text);
  dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(edtnewmen.Text);
  dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
  dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
  dmmain.cdsReceipt.FieldByName('Condense').AsString:=Trim(edtremakt.Text);
  dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
  dmmain.cdsReceipt.Post;
  try
    if flag='2' then
    begin
      sql:='update dp_checkdetail set cd_state='+''''+'5'+''''+' where cd_ccount>0 and cd_state='+''''+'1'+''''+' and cd_checkcode in (select c_code from dp_check where c_shop='+''''+trim(Handle_Part)+''''+' )';
      ipubtemp.scrapsate(sql);//盘点单盘赢；  wg edit 2004-2-26
    end;
  loadborlanced(dmmain.cdsReceipt);
  loadborlanced(dmmain.cdsOverflow);
  loadborlanced(dmmain.cdsOverflowdetail);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  end else
  begin        //修改
    if not bedit then
    begin
      if trim(Handle_Man)<>trim(edtnewmen.Text) then
      begin
        Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end;
    temp:='select * from dp_Overflow where od_ocode='+''''+trim(list_no)+'''';
    if dmmain.CDSexecsql.Active then dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.data:=null;
    dmmain.CDSexecsql.Data :=adisp.execSql(temp);
    dmmain.CDSexecsql.Open;
    dmmain.CDSexecsql.edit;
    dmmain.CDSexecsql.FieldByName('o_newdate').AsString:=formatdatetime('yyyy''-''mm''-''dd',date);
    dmmain.CDSexecsql.FieldByName('o_newman').AsString:=trim(edtnewmen.Text );
    dmmain.CDSexecsql.FieldByName('o_remark').AsString:=trim(edtremakt.Text);
    dmmain.CDSexecsql.FieldByName('o_operater').AsString:=trim(cmbg.Text);
    dmmain.CDSexecsql.FieldByName('o_auditer').AsString:=trim(cmbc.Text);
    dmmain.CDSexecsql.Post;
    try
    dmmain.CDSexecsql.ApplyUpdates(-1);
    except
      application.MessageBox('服务器终止服务！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
    temp:='select * from dp_Overflowdetail where od_ocode='+''''+trim(list_no)+'''';
    if dmmain.CDSexecsql.Active then dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.data:=null;
    dmmain.CDSexecsql.Data:=adisp.execSql(temp);
    dmmain.CDSexecsql.Open;
    j:=sgorder.RowCount-1;
    for i:=1 to  j do
    begin
      with dmmain.CDSexecsql do
      begin
        edit;
        fieldbyname('od_ccode').AsString:=trim(sgorder.Cells[1,i]);
        fieldbyname('od_cname').AsString:=trim(sgorder.Cells[2,i]);
        fieldbyname('od_ccount').AsString:=trim(sgorder.Cells[4,i]);
        post;
      end;
    end;
    try
    dmmain.CDSexecsql.ApplyUpdates(-1);
    except
      application.MessageBox('服务器终止服务！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
  end;
  close;
end;

procedure TfmOverflow.N1Click(Sender: TObject);
var
  rows:integer;
begin
  inherited;
  rows:=sgorder.RowCount-1;
  if (trim(sgorder.Cells[1,rows])<>'') and (trim(sgorder.Cells[4,rows])<>'') then
  begin
    sgorder.RowCount:=sgorder.RowCount+1;
    sgorder.Rows[sgorder.RowCount-1].Text:='';
  end;
end;

procedure TfmOverflow.N2Click(Sender: TObject);
begin
  inherited;
  if sgorder.RowCount=1 then
  begin
    Application.MessageBox('没有记录可以删除!','提示信息',mb_iconwarning);
    exit;
  end;
  if Application.MessageBox('确实要删除记录吗?','提示信息',mb_iconquestion+mb_yesno)=idyes then
  begin
 //ydy add
     if sgorder.RowCount = 2 then   //只是清除第二行的内容
     sgorder.Rows[sgorder.Row].Clear;
    //ydy add
    if sgorder.RowCount > 2 then
    begin
    //ydy changed
    deleteRow(sgorder.row);
//    sgorder.RowCount:=sgorder.RowCount-1;
    end;
  end;
    //汇总计算
   TotalCount;

end;

procedure TfmOverflow.sgorderDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
//ydy add 设置显示颜色
 with Sender as Tstringgrid do
        begin
        if gdSelected in State then
        Canvas.Brush.Color:= clTeal; //clyellow;//clRed;
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

////汇总计算
procedure TfmOverflow.TotalCount;
var
  i:integer;
begin
    edttotals.caption :='0';
    EdtTotalCount.caption  :='0';
    for i:= 1 to  sgorder.RowCount -1 do
    begin
        //合计金额
       if   sgorder.Cells[7,i] <>'' then
       begin
       edttotals.caption := floattostrf(strtofloat(edttotals.caption)+strtofloat( sgorder.Cells[7,i]),ffFixed,11,2);
       end;
       if   sgorder.Cells[4,i] <>'' then
       begin
       //合计数量
       EdtTotalCount.caption :=floattostr(strtofloat(edttotalcount.caption) + strtofloat(sgorder.Cells[4,i]));
       end;
     end;
end;



procedure TfmOverflow.BitBtn2Click(Sender: TObject);
var
  user,wldwname,remarks:widestring;
  flag,inmethod,intof:olevariant;
  flagd,i:integer;
  totals:double;
begin
  if trim(sgorder.Cells[1,1])='' then exit;
  no:=trim(edtcode.Text);
  typed:='库存报溢单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    ///修改库存，写入库单////
    flagd:=1;
    try
    ipubtemp.stock(flagd,stockid,user,part_no); //wg edit 4-8
    totals:=0;
    for i:=1 to sgorder.RowCount-1 do   //写财务主表;
    begin
      if trim(sgorder.Cells[8,i])='' then sgorder.Cells[8,i]:='0';
      totals:=totals+(strtofloat(sgorder.Cells[8,i])* strtofloat(sgorder.Cells[4,i])); //已结算金额
    end;
    wldwname:='无';
    wldwno:='无';
    remarks:='从:'+shopid+'仓库 库存报溢';
    intof:=ipubtemp.MoneyTable(10,no,totals,user,user,user,wldwno,wldwname,shopid,remarks);
    if vartostr(intof)='1' then
    begin
      flag:='3';
    end else
    begin
      flag:='2';
    end;
    except
     application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
     exit;
    end;
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
  inherited;
end;

procedure TfmOverflow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  dmmain.cdsprintmaster.Close;
  dmmain.cdsprintmaster.Data:=null;
  dmmain.cdsOverflow.Close;
  dmmain.cdsOverflow.Data:=null;
  dmmain.cdsOverflowdetail.Close;
  dmmain.cdsOverflowdetail.Data:=null;
  inherited;
end;

procedure TfmOverflow.btnprintClick(Sender: TObject);
begin
  inherited;
   if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='OverFlow.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

end.
