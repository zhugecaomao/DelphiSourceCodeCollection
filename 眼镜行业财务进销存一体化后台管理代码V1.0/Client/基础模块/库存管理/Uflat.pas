unit Uflat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  Tfmflat = class(TfmBase)
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Cmd_JSR: TSpeedButton;
    Edit5: TLabeledEdit;
    Edit7: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Panel6: TPanel;
    Panel7: TPanel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    SpeedButton5: TSpeedButton;
    edtshop: TLabeledEdit;
    Label1: TLabel;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    procedure StringGrid2DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Cmd_JSRClick(Sender: TObject);
    procedure StringGrid2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
  private
    { Private declarations }
    pcol1,prow1,pcol2,prow2:integer;
    procedure init;
  public
    { Public declarations }
    psum:tstringlist;
  end;

var
  fmflat: Tfmflat;

implementation

uses UntgoodCodeSelStr, untdatadm, func, Public_Don, Storage_Select,
  Login_Man, Unt_PubStrGrid;

{$R *.dfm}
procedure tfmflat.init;
var
  temp,make:string;
begin
  InitialStrGrid(stringgrid1,'套餐定义1');
  InitialStrGrid(stringgrid2,'套餐定义2');
  stringgrid1.RowCount:=2;
  stringgrid2.RowCount:=2;
  psum:=tstringlist.Create;
  if public_do<>'flatnew' then exit;
  edit1.Text:=formatdatetime('yyyy''-''mm''-''dd',date);
  temp:='select max(right(stock_No,4)) from dp_flat where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+'''';
  make:='TC-'+trim(Handle_Part)+trim(handle_no); //5-11 用部门编号
  edit2.Text:=setcode(temp,make);
  edit7.Text:=trim(Handle_Man);
end;

procedure Tfmflat.StringGrid2DblClick(Sender: TObject);
var
  i:integer;
  tm:double;
  bmbh:string;
begin
  inherited;
   if (trim(edtshop.Text)='') then
  begin
      Application.MessageBox('请选择仓库编号！',pchar(application.Title),mb_iconwarning);
      stringgrid1.SetFocus;
      Exit;
  end;
  if (trim(stringgrid1.Cells[1,1])='') then
  begin
      Application.MessageBox('请输入套餐商品编号！',pchar(application.Title),mb_iconwarning);
      stringgrid1.SetFocus;
      Exit;
  end;
  if pcol2 in [1,2] then
  begin
   bmbh:=shopid;
   shopid:=edtshop.Text;
   fmgoodCodeSelStr:= TfmgoodCodeSelStr.Create(self);
   try
   fmgoodcodeselStr.show_mode:='9';
   fmgoodcodeselStr.ShowModal;
   finally
   fmgoodcodeselStr.Free;
   shopid:=bmbh;
   end;
  end;
  tm:=0.00;
  for i:=1 to stringgrid2.RowCount-1 do
  begin
    if trim(stringgrid2.Cells[3,i])='' then stringgrid2.Cells[3,i]:='0';
    tm:=tm+strtofloat(stringgrid2.Cells[3,i]);
  end;
  if trim(stringgrid1.Cells[1,prow1])<>'' then
  BEGIN
    stringgrid1.Cells[3,prow1]:=FLOATTOSTR(tm);
  END;
end;

procedure Tfmflat.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol1:=acol;
  prow1:=arow;
end;

procedure Tfmflat.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if pcol1 in [1,2,4,6,7,8] then
  begin
    if pcol1=4 then //输入单价
    begin
      if key in ['0'..'9',#8] then
      begin
      ////////////////////////////////////////////
        if key<> #8 then  //字符第一个不为‘0’；
        begin
          if StringGrid1.Cells[4,prow1]<>'0' then
          begin
            StringGrid1.Cells[4,prow1]:=StringGrid1.Cells[4,prow1]+key;
          end else
          begin
            StringGrid1.Cells[4,prow1]:=key;
          end;
          if trim(StringGrid1.Cells[3,prow1])<>'' then
          begin
            StringGrid1.Cells[5,prow1]:=floattostr(strtofloat(StringGrid1.Cells[3,prow1])*strtofloat(StringGrid1.Cells[4,prow1]));//总价格；
          end else
          begin
            StringGrid1.Cells[5,prow1]:='0';
          end;
         ///////////////////////////////////
        end else
        begin
          StringGrid1.Cells[4,prow1]:=copy(StringGrid1.Cells[4,prow1],1,length(StringGrid1.Cells[4,prow1])-1);   //减去最后数字
          if trim(StringGrid1.Cells[4,prow1])='' then
          begin
            StringGrid1.Cells[4,prow1]:='0';
          end;
          if trim(StringGrid1.Cells[3,prow1])<>'' then
          begin
            StringGrid1.Cells[5,prow1]:=floattostr(strtofloat(StringGrid1.Cells[3,prow1])*strtofloat(StringGrid1.Cells[4,prow1]));//总价格；
          end else
          begin
            StringGrid1.Cells[5,prow1]:='0';
          end;
        end;
      end else
      begin
        applicaTION.MessageBox('只能输入数字！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end else
    begin
      if key<>#8 then   //类型，生产厂商，说明
      begin
        StringGrid1.Cells[pcol1,prow1]:=StringGrid1.Cells[pcol1,prow1]+key;
      end else
      begin
        StringGrid1.Cells[pcol1,prow1]:=copy(StringGrid1.Cells[pcol1,prow1],1,length(StringGrid1.Cells[pcol1,prow1])-1);   //减去最后
      end;
    end;
  end;
end;

procedure Tfmflat.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol2:=acol;
  prow2:=arow;
end;

procedure Tfmflat.FormShow(Sender: TObject);
var
  i:integer;
  tempstr:string;
begin
  inherited;
  init;
  if public_do='flatedit' then
  begin
    tempstr:='Select a.*,b.goods_no as goods_code,b.amount as tamount, c.goods_name as name,baseprice as bprice,type,provider,stock_amount from dp_flat as a ,dp_flatdetail as b, vSelectGoods as c where c.goods_no=b.goods_no and a.stock_No=b.stock_No and a.stock_No='+''''+trim(List_No)+'''';
    dmmain.CDSquery2.Data:=null;
    dmmain.CDSquery2.Close;
     //wy edit 3-14   begin
    dmmain.CDSquery2.Data:=adisp.resultrecord(tempstr);
    dmmain.CDSquery2.Open;
    edit1.Text:=dmmain.CDSquery2.fieldbyname('copy_date').AsString;
    edit2.Text:=dmmain.CDSquery2.fieldbyname('stock_no').AsString;
    edtshop.Text:=dmmain.CDSquery2.fieldbyname('storage').AsString;
    edit5.Text:=dmmain.CDSquery2.fieldbyname('tranman').AsString;
    edit7.Text:=dmmain.CDSquery2.fieldbyname('operater').AsString;
    stringgrid1.Cells[1,1]:=dmmain.CDSquery2.fieldbyname('goods_no').AsString;
    stringgrid1.Cells[2,1]:=dmmain.CDSquery2.fieldbyname('goods_name').AsString;
    stringgrid1.Cells[3,1]:=dmmain.CDSquery2.fieldbyname('price').AsString;
    stringgrid1.Cells[4,1]:=dmmain.CDSquery2.fieldbyname('amount').AsString;
    stringgrid1.Cells[5,1]:=dmmain.CDSquery2.fieldbyname('totalmoney').AsString;
    stringgrid2.RowCount:=dmmain.CDSquery2.RecordCount+1;
    for i:=1 to stringgrid2.RowCount-1 do
    begin
      stringgrid2.Cells[0,i]:=inttostr(i);
      stringgrid2.Cells[1,i]:=dmmain.CDSquery2.fieldbyname('goods_code').AsString;
      stringgrid2.Cells[2,i]:=dmmain.CDSquery2.fieldbyname('name').AsString;
      stringgrid2.Cells[3,i]:=dmmain.CDSquery2.fieldbyname('bprice').AsString;
      stringgrid2.Cells[4,i]:=dmmain.CDSquery2.fieldbyname('tamount').AsString;
      stringgrid2.Cells[5,i]:=floattostr(dmmain.CDSquery2.fieldbyname('bprice').AsFloat*dmmain.CDSquery2.fieldbyname('tamount').AsFloat); //总金额
      stringgrid2.Cells[6,i]:=dmmain.CDSquery2.fieldbyname('type').AsString;
      stringgrid2.Cells[7,i]:=dmmain.CDSquery2.fieldbyname('provider').AsString;
      psum.Add(dmmain.CDSquery2.fieldbyname('stock_amount').AsString);
      dmmain.CDSquery2.next;
    end;
  end;
end;

procedure Tfmflat.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if trim(StringGrid2.Cells[1,1])='' then exit;
  if pcol2=4 then //输入单价
  begin
    if key in ['0'..'9',#8] then
    begin
    ////////////////////////////////////////////
      if key<> #8 then  //字符第一个不为‘0’；
      begin
        if StringGrid2.Cells[4,prow2]<>'0' then
        begin
          StringGrid2.Cells[4,prow2]:=StringGrid2.Cells[4,prow2]+key;
        end else
        begin
          StringGrid2.Cells[4,prow2]:=key;
        end;
        if trim(StringGrid2.Cells[3,prow2])<>'' then
        begin
          StringGrid2.Cells[5,prow2]:=floattostr(strtofloat(StringGrid2.Cells[3,prow2])*strtofloat(StringGrid2.Cells[4,prow2]));//总价格；
        end else
        begin
          StringGrid2.Cells[5,prow2]:='0';
        end;
       ///////////////////////////////////
      end else
      begin
        StringGrid2.Cells[4,prow2]:=copy(StringGrid2.Cells[4,prow2],1,length(StringGrid2.Cells[4,prow2])-1);   //减去最后数字
        if trim(StringGrid2.Cells[4,prow2])='' then
        begin
          StringGrid2.Cells[4,prow2]:='0';
        end;
        if trim(StringGrid2.Cells[3,prow2])<>'' then
        begin
          StringGrid2.Cells[5,prow2]:=floattostr(strtofloat(StringGrid2.Cells[3,prow2])*strtofloat(StringGrid2.Cells[4,prow2]));//总价格；
        end else
        begin
          StringGrid2.Cells[5,prow2]:='0';
        end;
      end;
      if strtoint(StringGrid2.Cells[4,prow2])>strtoint(psum.Strings[prow2-1]) then
      begin
        StringGrid2.Cells[4,prow2]:='0';
        application.MessageBox('输入数量已经超过库存数量！',pchar(application.Title),mb_iconinformation);
        exit; 
      end;
    end;
  end;
end;

procedure Tfmflat.SpeedButton4Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  frm_Public_Don:=Tfrm_Public_Don.Create(self);
  frm_Public_Don.no:=trim(edit2.Text);
  frm_Public_Don.ShowModal;
  if Public_Do_Result='02' then
  BEGIN
    if trim(edtshop.Text)='' then
    begin
      application.MessageBox('请选择店面或仓库！',pchar(application.Title),mb_iconinformation);
      edtshop.SetFocus;
      exit;
    end;
    if trim(edit5.Text)='' then
    begin
      application.MessageBox('请选择经手人！',pchar(application.Title),mb_iconinformation);
      edit5.SetFocus;
      exit;
    end;
    if (trim(stringgrid1.Cells[1,1])='') or (trim(stringgrid1.Cells[4,1])='') then
    begin
      application.MessageBox('请输入套餐商品的编号或数量',pchar(application.Title),mb_iconinformation);
      stringgrid1.SetFocus;
      exit;
    end;
    for i:=1 to stringgrid2.RowCount-1 do
    begin
      if (trim(stringgrid2.Cells[1,i])='') or (trim(stringgrid2.Cells[4,1])='') then
      begin
        application.MessageBox('请输入组成商品的编号或数量',pchar(application.Title),mb_iconinformation);
        stringgrid2.SetFocus;
        exit;
      end;
    end;
  END;
  if Public_Do='flatnew' then
  begin
    if Public_Do_Result='02' then
    begin
      if dmmain.cdsflat.Active then dmmain.cdsflat.Close;
      dmmain.cdsflat.Params.ParamByName('no').AsString:='1';
      dmmain.cdsflat.Open;
      dmmain.cdsflat.Insert;
      dmmain.cdsflat.FieldByName('stock_no').AsString:=trim(edit2.Text);
      dmmain.cdsflat.FieldByName('copy_date').AsString:=trim(edit1.Text);
      dmmain.cdsflat.FieldByName('storage').AsString:=trim(edtshop.Text);
      dmmain.cdsflat.FieldByName('tranman').AsString:=trim(edit5.Text);
      dmmain.cdsflat.FieldByName('operater').AsString:=trim(edit7.Text);
      dmmain.cdsflat.FieldByName('goods_no').AsString:=trim(stringgrid1.Cells[1,1]);
      dmmain.cdsflat.FieldByName('goods_name').AsString:=trim(stringgrid1.Cells[2,1]);
      dmmain.cdsflat.FieldByName('price').AsString:=trim(stringgrid1.Cells[3,1]);
      dmmain.cdsflat.FieldByName('amount').AsString:=trim(stringgrid1.Cells[4,1]);
      dmmain.cdsflat.FieldByName('totalmoney').AsString:=trim(stringgrid1.Cells[5,1]);
      dmmain.cdsflat.Post;
      if dmmain.cdsflatdetail.Active then dmmain.cdsflatdetail.Close;
      dmmain.cdsflatdetail.Params.ParamByName('no').AsString:='1';
      dmmain.cdsflatdetail.Open;
      for i:=1 to stringgrid2.RowCount-1 do
      begin
        dmmain.cdsflatdetail.Insert;
        dmmain.cdsflatdetail.FieldByName('stock_no').AsString:=trim(edit2.Text);
        dmmain.cdsflatdetail.FieldByName('goods_no').AsString:=trim(stringgrid2.Cells[1,i]);
        dmmain.cdsflatdetail.FieldByName('goods_name').AsString:=trim(stringgrid2.Cells[2,i]);
        dmmain.cdsflatdetail.FieldByName('price').AsString:=trim(stringgrid2.Cells[3,i]);
        dmmain.cdsflatdetail.FieldByName('amount').AsString:=trim(stringgrid2.Cells[4,i]);
        dmmain.cdsflatdetail.FieldByName('flatgoods').AsString:=trim(stringgrid1.Cells[1,1]); //组合后商品编码；
        dmmain.cdsflatdetail.Post;
      end;
      dmmain.cdsReceipt.Open;
      dmmain.cdsReceipt.Append;  //审核表
      dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=trim(edit2.Text);
      dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='套餐定义';
      dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=trim(edit1.Text);
      dmmain.cdsReceipt.FieldByName('Proposer').AsString:=trim(edit7.Text);
      dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
      dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
      dmmain.cdsReceipt.FieldByName('Condense').AsString:='仓库【'+trim(edtshop.Text)+'】定义套餐【'+trim(stringgrid1.cells[1,1])+'】';
      dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
      dmmain.cdsReceipt.Post;
      try
        dmmain.cdsReceipt.ApplyUpdates(-1);
        dmmain.cdsflat.ApplyUpdates(-1);
        dmmain.cdsflatdetail.ApplyUpdates(-1);
      except
        application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
    end else
    begin
      close;
    end;
  end;
  if Public_Do='flatedit' then  //修改
  begin
    if Public_Do_Result='02' then
    begin
      if not bedit then
      begin
        if trim(Handle_Man)<>trim(edit7.Text) then
        begin
          Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
          exit;
        end;
      end;
      if dmmain.cdsflat.Active then dmmain.cdsflat.Close;
      dmmain.cdsflat.Params.ParamByName('no').AsString:=trim(list_no);
      dmmain.cdsflat.Open;
      dmmain.cdsflat.edit;
      dmmain.cdsflat.FieldByName('storage').AsString:=trim(edtshop.Text);
      dmmain.cdsflat.FieldByName('tranman').AsString:=trim(edit5.Text);
      dmmain.cdsflat.FieldByName('operater').AsString:=trim(edit7.Text);
      dmmain.cdsflat.FieldByName('goods_no').AsString:=trim(stringgrid1.Cells[1,1]);
      dmmain.cdsflat.FieldByName('goods_name').AsString:=trim(stringgrid1.Cells[2,1]);
      dmmain.cdsflat.FieldByName('price').AsString:=trim(stringgrid1.Cells[3,1]);
      dmmain.cdsflat.FieldByName('amount').AsString:=trim(stringgrid1.Cells[4,1]);
      dmmain.cdsflat.FieldByName('totalmoney').AsString:=trim(stringgrid1.Cells[5,1]);
      dmmain.cdsflat.Post;
      if dmmain.cdsflatdetail.Active then dmmain.cdsflatdetail.Close;
      dmmain.cdsflatdetail.Params.ParamByName('no').AsString:=trim(list_no);
      dmmain.cdsflatdetail.Open;
      for i:=1 to stringgrid2.RowCount-1 do
      begin
        dmmain.cdsflatdetail.edit;
        dmmain.cdsflatdetail.FieldByName('goods_no').AsString:=trim(stringgrid2.Cells[1,i]);
        dmmain.cdsflatdetail.FieldByName('goods_name').AsString:=trim(stringgrid2.Cells[2,i]);
        dmmain.cdsflatdetail.FieldByName('price').AsString:=trim(stringgrid2.Cells[3,i]);
        dmmain.cdsflatdetail.FieldByName('amount').AsString:=trim(stringgrid2.Cells[4,i]);
        dmmain.cdsflatdetail.FieldByName('flatgoods').AsString:=trim(stringgrid1.Cells[1,1]); //组合后商品编码；
        dmmain.cdsflatdetail.Post;
        dmmain.cdsflatdetail.Next;
      end;
      try
        dmmain.cdsflat.ApplyUpdates(-1);
        dmmain.cdsflatdetail.ApplyUpdates(-1);
      except
        application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
    end else
    begin
      close;
    end;
  end;
  close;
end;

procedure Tfmflat.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Check_Storage:='';
  Check_Storage_Result:='';
  Check_Storage:='Goods_Write';
  frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
  frm_Storage_Select.ShowModal;
  Edtshop.Text:=Trim(Check_Storage_Result_NO);
  frm_Storage_Select.Free;
end;

procedure Tfmflat.Cmd_JSRClick(Sender: TObject);
begin
  inherited;
  Employe_Check:='';
  Employe_Check:='Goods_Write_Str';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='经手人选择';
  frm_Login_Man.ShowModal;
  Edit5.Text:=Employe_Check_Result;
  frm_Login_Man.Free;
end;

procedure Tfmflat.StringGrid2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  var
    i:integer;
    tm:double;
begin
  inherited;
  tm:=0.00;
  for i:=1 to stringgrid2.RowCount-1 do
  begin
    if trim(stringgrid2.Cells[5,i])<>'' then
    tm:=tm+strtofloat(stringgrid2.Cells[5,i]);
  end;
  stringgrid1.Cells[3,1]:=floattostr(tm);
end;

procedure Tfmflat.SpeedButton2Click(Sender: TObject);
var
  user,sql,no,shopno:widestring;
  flag:olevariant;
begin
    inherited;
  if trim(public_do)<>'flatedit' then exit;
  no:=trim(edit2.Text);
  typed:='套餐定义';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag=3 then
  begin
    sql:='select goods_no from goods_code where goods_no='+''''+trim(stringgrid1.Cells[1,1])+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    dmmain.CDSexecsql.Data:=adisp.execSql(sql);
    dmmain.CDSexecsql.Open;
    if dmmain.CDSexecsql.IsEmpty then
    begin
      sql:='insert into goods_code (goods_no,goods_name,type_no,type,brand_no,brand,breed_no,breed,norms_type_no,norms_type) values ('+''''+trim(stringgrid1.Cells [1,1])+''''+','+''''+trim(stringgrid1.Cells[2,1])+''''+','+''''+trim('tc')+''''+','+''''+trim('套餐商品')+''''+','+''''+trim('zdy')+''''+','+''''+trim('自定义')+''''+','+''''+trim('zdy')+''''+','+''''+trim('自定义')+''''+','+''''+trim('zdy')+''''+','+''''+trim('自定义')+''''+')';
      ipubtemp.scrapsate(sql);//写入商品信息表
      sql:='insert into goods_prices (goods_no,baseprice) values ('+''''+trim(stringgrid1.Cells [1,1])+''''+','+''''+trim(stringgrid1.Cells[3,1])+''''+')';
      ipubtemp.scrapsate(sql);//写入商品财流表
      //////////生成出入库单///////////////
      shopno:=trim(edtshop.Text);
      ipubtemp.inputFlat(no,shopno);
      //////////////////////////////////////
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

end;

procedure Tfmflat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  psum.Free;
  psum:=nil;
  DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  dmmain.cdsflat.Close;
  dmmain.cdsflat.Data:=null;
  dmmain.cdsflatdetail.Close;
  dmmain.cdsflatdetail.Data:=null;
  inherited;
end;

procedure Tfmflat.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure Tfmflat.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure Tfmflat.Cmd_DeleteClick(Sender: TObject);
begin
  inherited;
  deletegridrows(stringgrid2,prow2);
end;

procedure Tfmflat.Cmd_AddClick(Sender: TObject);
begin
  inherited;
  addgridrows(stringgrid2);
end;

end.
