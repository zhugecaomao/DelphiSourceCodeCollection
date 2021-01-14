unit UntZsManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, StdCtrls, ExtCtrls, Buttons;

type
  TfmZSmanager = class(TfmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Cmd_Cancel: TSpeedButton;
    Label3: TLabel;
    Panel3: TPanel;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton9: TSpeedButton;
    edit5: TLabeledEdit;
    Edit7: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit9: TLabeledEdit;
    Edit2: TLabeledEdit;
    Panel6: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    StringGrid1: TStringGrid;
    RdB1: TRadioButton;
    RdB2: TRadioButton;
    procedure SpeedButton9Click(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_CancelClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    pcol,prow:integer;
     procedure init;
  public
    { Public declarations }
  end;

var
  fmZSmanager: TfmZSmanager;

implementation

uses Unt_PubStrGrid, func, untdatadm, Login_Man, Public_Don,
  UntgoodCodeSelStr;

{$R *.dfm}
////////////////////////////
procedure tfmZSmanager.init;
var
  temp,make:string;
begin
  InitialStrGrid(stringgrid1,'赠送定义');
  if (Public_Do='edited') then exit;
  edit1.Text:=formatdatetime('yyyy''-''mm''-''dd',date);
  Edit7.Text:=Handle_Man;
  temp:='select max(right(present_NO,4)) from present where copy_date='+''''+trim(edit1.Text)+''''+' and part_no='+''''+trim(Handle_Part)+'''';
  make:='ZP-'+trim(Handle_Part)+trim(handle_no); //用部门编号
  edit2.Text:=setcode(temp,make);
end;
////////////////////////////

procedure TfmZSmanager.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  Employe_Check:='';
  Employe_Check:='Storage_Umanage_Fad';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='经手人选择';
  frm_Login_Man.ShowModal;
  Edit5.Text:=Employe_Check_Result;
  frm_Login_Man.Free;
end;

procedure TfmZSmanager.Cmd_DeleteClick(Sender: TObject);
begin
  inherited;
  deletegridrows(stringgrid1,prow);
end;

procedure TfmZSmanager.Cmd_AddClick(Sender: TObject);
begin
  inherited;
  addgridrows(stringgrid1);
end;

procedure TfmZSmanager.Cmd_CancelClick(Sender: TObject);
var
    i,j,icol:integer;
    Check_Flag:string;
    temp:widestring;
    Rb:boolean;
begin
  inherited;
  if rdb1.Checked then rb:=true else rb:=false;
  Public_Do_Result:='';
  frm_Public_Don:=Tfrm_Public_Don.Create(self);
  frm_Public_Don.ShowModal;
  frm_Public_Don.Free;
  if Public_Do='new' then
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
      if Trim(Edit5.Text)='' then
      begin
          application.MessageBox('操作错误,【经手人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
          Edit5.SetFocus;
          Exit;
      end;
      if Trim(Edit7.Text)='' then
      begin
          application.MessageBox('操作错误,【制单人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
          Edit7.SetFocus;
          Exit;
      end;
      for i:=1 to StringGrid1.RowCount-1 do
      begin
        if StringGrid1.Cells[1,i]='' then
        begin
            application.MessageBox('操作错误,【商品编号】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
         if StringGrid1.Cells[3,i]='' then
        begin
          application.MessageBox('操作错误,【赠送比例】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
          Exit;
        end;
      end;
      if dmmain.cdspresent.Active then dmmain.cdspresent.Close;
      dmmain.cdspresent.Open;
      dmmain.cdspresent.Insert;
      dmmain.cdspresent.FieldByName('copy_date').AsString:=trim(edit1.Text);
      dmmain.cdspresent.FieldByName('present_no').AsString:=trim(edit2.Text);
      dmmain.cdspresent.FieldByName('transactor').AsString:=trim(edit5.Text);
      dmmain.cdspresent.FieldByName('proposer').AsString:=trim(edit7.Text);
      dmmain.cdspresent.FieldByName('resume').AsString:=trim(edit8.Text);
      dmmain.cdspresent.FieldByName('remark').AsString:=trim(edit9.Text);
      dmmain.cdspresent.FieldByName('part_no').AsString:=trim(Handle_Part);
      dmmain.cdspresent.FieldByName('Checkid').AsBoolean:=rb;
      dmmain.cdspresent.Post;
      dmmain.cdsReceipt.close;
      dmmain.cdsReceipt.Open;
      dmmain.cdsReceipt.Append;
      dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(Edit2.Text);
      dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='赠品定义单';
      dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
      dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edit7.Text);
      dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
      dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
      dmmain.cdsReceipt.FieldByName('Condense').AsString:=Trim(Edit8.Text);
      dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
      dmmain.cdsReceipt.Post;
      if dmmain.cdspresentdetail.Active then  dmmain.cdspresentdetail.Close;
      dmmain.cdspresentdetail.Open;
      for i:=1 to stringgrid1.RowCount-1 do
      begin
        dmmain.cdspresentdetail.Insert;
        dmmain.cdspresentdetail.FieldByName('present_no').AsString:=trim(edit2.Text);
        dmmain.cdspresentdetail.FieldByName('goods_no').AsString:=trim(stringgrid1.Cells[1,i]);
        dmmain.cdspresentdetail.FieldByName('amount_agion').AsString:=trim(stringgrid1.Cells[3,i]);
        dmmain.cdspresentdetail.Post;
      end;
      try
      dmmain.cdsReceipt.ApplyUpdates(-1);
      dmmain.cdspresentdetail.ApplyUpdates(-1);
      dmmain.cdspresent.ApplyUpdates(-1);
      setnull(fmZSmanager);
      init;
      except
        Application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        Exit;
      end;
    end;
    if Public_Do_Result='03' then
    begin
      Close;
    end;
  end;
  if Public_Do='edited' then
  begin
    if Public_Do_Result='02' then //保存单据
    begin
      if not bedit then
      begin
        if trim(Handle_Man)<>trim(edit7.Text) then
        begin
          Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
          exit;
        end;
      end;
      temp:='select * from present where present_no='+''''+trim(edit2.Text)+'''';
      dmmain.CDSexecsql.Close;
      dmmain.CDSexecsql.Data:=null;
      dmmain.CDSexecsql.Data:=adisp.execSql(temp);
      dmmain.CDSexecsql.Open;
      dmmain.CDSexecsql.Edit;
      dmmain.CDSexecsql.FieldByName('transactor').AsString:=trim(edit5.Text);
      dmmain.CDSexecsql.FieldByName('resume').AsString:=trim(edit8.Text);
      dmmain.CDSexecsql.FieldByName('remark').AsString:=trim(edit9.Text);
      dmmain.CDSexecsql.Post;
      try
        dmmain.CDSexecsql.ApplyUpdates(-1);
      except
        application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
      temp:='select * from present_detail where present_no='+''''+trim(edit2.Text)+'''';
      dmmain.CDSexecsql.Close;
      dmmain.CDSexecsql.Data:=null;
      dmmain.CDSexecsql.Data:=adisp.execSql(temp);
      dmmain.CDSexecsql.Open;
      for i:=1 to stringgrid1.RowCount-1 do
      begin
        dmmain.CDSexecsql.Edit;
        dmmain.CDSexecsql.FieldByName('amount_agion').AsString:=trim(stringgrid1.Cells[3,i]);
        dmmain.CDSexecsql.FieldByName('goods_no').AsString:=trim(stringgrid1.Cells[1,i]);
        dmmain.CDSexecsql.Post;
        dmmain.CDSexecsql.Next;
      end;
      try
        dmmain.CDSexecsql.ApplyUpdates(-1);
      except
        application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
    end;
    if Public_Do_Result='03' then
    begin
        Close;
    end;
  end;
end;

procedure TfmZSmanager.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
end;

procedure TfmZSmanager.FormShow(Sender: TObject);
var
  icount,k:integer;
  tt,yy,temppos:integer;
  sqlsub:widestring;
begin
  inherited;
    //iColcount:=StringGrid1.ColCount-1; //需要的填充数据的网络表格的列数
    StringGrid1.RowCount:=2;
    init;
    //草稿单据查看
    if (Public_Do='edited') then
    begin
      sqlsub:='Select a.*,b.*,c.* from present as a,present_detail as b,Goods_code as c where a.present_no=b.present_no and b.goods_no=c.goods_no and a.present_No='''+List_No+'''';
      dmmain.CDSquery2.Close;
      dmmain.CDSquery2.Data:=null;
      dmmain.CDSquery2.Data:=adisp.resultrecord(sqlsub);
      try
      dmmain.CDSquery2.Open;
      except
      end;
      k:=dmmain.CDSquery2.RecordCount;
      StringGrid1.RowCount:=k+1;
      //自动加载STRINGGRID的行数
      for K:=1 to StringGrid1.RowCount do
      begin
        StringGrid1.Cells[0,K]:=IntTostr(k); //表示第0列第i行的名称
      end;
      //******************
      Edit1.Text:=trim(dmmain.CDSquery2.FieldByName('Copy_Date').AsString);
      Edit2.Text:=trim(dmmain.CDSquery2.FieldByName('present_No').AsString);
      Edit5.Text:=trim(dmmain.CDSquery2.FieldByName('Transactor').AsString);
      Edit7.Text:=trim(dmmain.CDSquery2.FieldByName('proposer').AsString);
      Edit8.Text:=trim(dmmain.CDSquery2.FieldByName('resume').AsString);
      Edit9.Text:=trim(dmmain.CDSquery2.FieldByName('Remark').AsString);
      if dmmain.CDSquery2.FieldByName('Checkid').AsBoolean then rdb1.Checked:=true else rdb2.Checked:=true ;
      for k:=1 to dmmain.CDSquery2.RecordCount do
      begin
        StringGrid1.Cells[0,k]:=trim(inttostr(k));//编号
        StringGrid1.Cells[1,k]:=trim(dmmain.CDSquery2.FieldByName('Goods_NO').AsString);//商品编号
        StringGrid1.Cells[2,k]:=trim(dmmain.CDSquery2.FieldByName('Goods_Name').AsString);//商品名称
        StringGrid1.Cells[3,k]:=trim(format('%8.'+inttostr(len)+'f',[dmmain.CDSquery2.FieldByName('amount_agion').Asfloat]));//金额
        StringGrid1.Cells[4,k]:=trim(dmmain.CDSquery2.FieldByName('type').AsString);
        StringGrid1.Cells[5,k]:=trim(dmmain.CDSquery2.FieldByName('provider').AsString);
        dmmain.CDSquery2.Next;
      end;
      dmmain.CDSquery2.Close;
      dmmain.CDSquery2.Data:=null;
    end;

end;

procedure TfmZSmanager.StringGrid1DblClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if pcol in [1,2] then
  begin
    fmgoodCodeSelStr:= TfmgoodCodeSelStr.Create(self);
    try
    fmgoodcodeselStr.show_mode:='13';
    fmgoodcodeselStr.ShowModal;
    finally
    fmgoodcodeselStr.Free;
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

procedure TfmZSmanager.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
  with Sender as Tstringgrid do
  begin
  if gdSelected in State then
  Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
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

procedure TfmZSmanager.SpeedButton2Click(Sender: TObject);
var
  user,wldwname,remarks:widestring;
  flag,inmethod,intof:olevariant;
  bmbh:string;
  IFlag:integer;
begin
  inherited;
 if trim(stringgrid1.Cells[1,1])='' then exit;
  if (Public_Do<>'edited') then exit;  //保存后才修改
  no:=trim(edit2.Text);
  typed:='赠品定义单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    if rdb1.Checked then Iflag:=1 else iflag:=2;
    flag:=ipubtemp.MZSGOODS(no,iflag);
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

procedure TfmZSmanager.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (pcol=3) and (prow>0) then
  begin
    if key in ['0'..'9','.',#8,#13,#37] then
    begin
      stringgrid1.Options:=stringgrid1.Options+[goediting];
    end else
    begin
      stringgrid1.Options:=stringgrid1.Options-[goediting];
      key:=#0;
    end;  end else
  begin
    stringgrid1.Options:= stringgrid1.Options-[goediting];
    key:=#0;
  end;
end;

procedure TfmZSmanager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
   DMMAIN.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  inherited;

end;

end.
