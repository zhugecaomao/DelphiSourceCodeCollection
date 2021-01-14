unit UUnfinance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, StdCtrls, ExtCtrls, Buttons;

type
  TfmfinanceUnpos = class(TfmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Panel3: TPanel;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton9: TSpeedButton;
    Edit4: TLabeledEdit;
    Edit6: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit9: TLabeledEdit;
    Edit10: TLabeledEdit;
    Edit5: TLabeledEdit;
    Edit2: TLabeledEdit;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    StringGrid1: TStringGrid;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    iFlag:integer;
    Pcol,Prow:integer;
    No:string;
    procedure init;
    function ReadData(No:string):boolean;
    Function CheckData():boolean;
    Function SaveData():boolean;
  public
    { Public declarations }
  end;

var
  fmfinanceUnpos: TfmfinanceUnpos;

implementation

uses func, untdatadm, Unt_PubStrGrid, Unitreportxf, Public_Don,
  Uinputselect, Login_Man;

{$R *.dfm}
//////////////////////
procedure tfmfinanceUnpos.init;
var
  temp,make:string;
begin
    InitialStrGrid(stringgrid1,'财务退货');
    edit1.Text:=formatdatetime('yyyy''-''mm''-''dd',date);
    Edit8.Text:=Handle_Man;
    //edit5.Text:=shopid;
end;

Function TfmfinanceUnpos.ReadData (No:string):boolean;
var
  sqlsub:widestring;
  k:integer;
begin
  result:=false;
  if (Public_Do='Edited')  then
  begin
    sqlsub:='Select a.*,b.*,c.stock_amount,c.baseprice from Cancel_strip as a, Cancel_strip_detail as b,vselectgoods as c where a.stock_no=b.stock_no and b.goods_no=c.goods_no and c.storage_no=a.storage_no and a.stock_No='''+trim(No)+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
    dmmain.CDSexecsql.Open;
    StringGrid1.RowCount:=dmmain.CDSexecsql.RecordCount+1;
    if dmmain.CDSexecsql.IsEmpty then
    begin
        application.MessageBox('此退货单已被删除！',pchar(application.Title),mb_iconwarning);
        exit;
    end;
    //******************
    Edit1.Text:=dmmain.CDSexecsql.Fieldbyname('Copy_Date').AsString;
     Edit2.Text:=dmmain.CDSexecsql.Fieldbyname('stock_No').AsString;
    if iFlag<>1 then
    begin
      Edit6.Text:=dmmain.CDSexecsql.Fieldbyname('Transactor').AsString;
      Edit8.Text:=dmmain.CDSexecsql.Fieldbyname('proposer').AsString;
    end;
    Edit4.Text:=dmmain.CDSexecsql.Fieldbyname('WLDW').AsString;
    Edit5.Text:=dmmain.CDSexecsql.Fieldbyname('Storage_NO').AsString;
    Edit9.Text:=dmmain.CDSexecsql.Fieldbyname('Condense').AsString;
    Edit10.Text:=dmmain.CDSexecsql.Fieldbyname('Remark').AsString;
    wldwno:=trim(dmmain.CDSexecsql.Fieldbyname('Contract_No').AsString);//Contract_No
    for k:=1 to dmmain.CDSexecsql.RecordCount  do
    begin
      StringGrid1.Cells[0,K]:=IntTostr(k); //表示第0列第i行的名称
      StringGrid1.Cells[1,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Goods_NO').AsString);//商品编号
      StringGrid1.Cells[2,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Quality').AsString);//商品名称
      StringGrid1.Cells[3,k]:=trim(dmmain.CDSexecsql.Fieldbyname('amount').AsString);//数量
      StringGrid1.Cells[4,k]:=trim(format('%8.'+inttostr(len)+'f',[dmmain.CDSexecsql.Fieldbyname('PRICE').AsFloat]));
      StringGrid1.Cells[5,k]:=trim(dmmain.CDSexecsql.Fieldbyname('TOTAL_MONEY').AsString);
      StringGrid1.Cells[6,k]:=trim(dmmain.CDSexecsql.Fieldbyname('pass_no').AsString);
      StringGrid1.Cells[7,k]:=trim(dmmain.CDSexecsql.Fieldbyname('Fade_Name').AsString);
      StringGrid1.Cells[8,k]:=trim(dmmain.CDSexecsql.Fieldbyname('baseprice').AsString);
      StringGrid1.Cells[9,k]:=trim(inttostr(dmmain.CDSexecsql.Fieldbyname('stock_amount').AsInteger+dmmain.CDSexecsql.Fieldbyname('amount').AsInteger));
      dmmain.CDSexecsql.Next;
    end;
    GetDataPrint(dmmain.cdsprintmaster,dmmain.CDsexecsql);
    result:=true;
  end;
end;

function TfmfinanceUnpos.CheckData:boolean;
VAR
  i:integer;
begin
  result:=false;
  if Trim(Edit1.Text)='' then
  begin
      application.MessageBox('操作错误,【录单日期】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
      Edit1.SetFocus;
      Exit;
  end;
  if Trim(Edit2.Text)='' then
  begin
      application.MessageBox('操作错误,【单据编号】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
      Edit2.SetFocus;
      Exit;
  end;
  if Trim(Edit4.Text)='' then
  begin
      application.MessageBox('操作错误,【供货单位】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
      Edit4.SetFocus;
      Exit;
  end;
  if Trim(Edit5.Text)='' then
  begin
      application.MessageBox('操作错误,【退货仓库】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
      Edit5.SetFocus;
      Exit;
  end;
  if Trim(Edit6.Text)='' then
  begin
      application.MessageBox('操作错误,【经手人】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
      Edit6.SetFocus;
      Exit;
  end;
  if Trim(Edit8.Text)='' then
  begin
      application.MessageBox('操作错误,【制单人】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
      Edit8.SetFocus;
      Exit;
  end;
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    if StringGrid1.Cells[1,i]='' then
    begin
        application.MessageBox('操作错误,【商品编号】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
        Exit;
    end;
    if (StringGrid1.Cells[3,i]='') or (StringGrid1.Cells[3,i]='0') then
    begin
        application.MessageBox('操作错误,【数量】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
        Exit;
    end;
    if (StringGrid1.Cells[4,i]='') or (StringGrid1.Cells[4,i]='0') or (StringGrid1.Cells[4,i]='0.00') then
    begin
      application.MessageBox('操作错误,【退货单价】不能为空！请确认！',pchar(application.Title),mb_iconwarning);
      Exit;
    end;
  end;
  result:=true;
end;

function TfmfinanceUnpos.SaveData:boolean;
var
  sqlsub:widestring;
  i:integer;
begin
  if Public_Do_Result='02' then
  begin
    sqlsub:='select * from [Cancel_strip] where Stock_No='+''''+Trim(NO)+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
    dmmain.CDSexecsql.Open;
    dmmain.CDSexecsql.Edit;
    //dmmain.CDSexecsql.FieldByName('Stock_No').AsString:=Trim(Edit2.Text);
    dmmain.CDSexecsql.FieldByName('WLDW').AsString:=Trim(Edit4.Text);
    dmmain.CDSexecsql.FieldByName('Contract_No').AsString:=trim(wldwno);
    dmmain.CDSexecsql.FieldByName('Storage_NO').AsString:=Trim(Edit5.Text);
    dmmain.CDSexecsql.FieldByName('state').AsBoolean:=true; //财务状态
    dmmain.CDSexecsql.FieldByName('Transactor').AsString:=Trim(Edit6.Text);
    dmmain.CDSexecsql.FieldByName('proposer').AsString:=Trim(Edit8.Text);
    dmmain.CDSexecsql.FieldByName('Condense').AsString:=Trim(Edit9.Text);
    dmmain.CDSexecsql.FieldByName('Remark').AsString:=Trim(Edit10.Text);
    dmmain.CDSexecsql.Post;
    dmmain.cdsReceipt.Close;
    dmmain.cdsReceipt.Open;  //草稿
    dmmain.cdsReceipt.Append;
    dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(Edit2.Text);
    dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='财务退货单';
    dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=Trim(Edit1.Text);
    dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(Edit8.Text);
    dmmain.cdsReceipt.FieldByName('Condense').AsString:=Trim(Edit10.Text);
    dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
    dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
    dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
    dmmain.cdsReceipt.Post;
    try
      dmmain.cdsReceipt.ApplyUpdates(-1);
      dmmain.CDSexecsql.ApplyUpdates(-1);
    except
      Application.MessageBox('服务器发生故障！',Pchar(Application.Title),Mb_ICONwarning);
      Exit;
    end;
    sqlsub:='select * from [Cancel_strip_detail] where Stock_No='+''''+Trim(NO)+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
    dmmain.CDSexecsql.Open;
    for i:=1 to stringgrid1.RowCount-1 do
    begin
      dmmain.CDSexecsql.edit;
      //dmmain.CDSexecsql.FieldByName('Stock_No').AsString:=Trim(Edit2.Text);
      dmmain.CDSexecsql.FieldByName('Goods_NO').AsString:=Trim(StringGrid1.Cells[1,i]);
      dmmain.CDSexecsql.FieldByName('amount').AsString:= Trim(StringGrid1.Cells[3,i]);
      dmmain.CDSexecsql.FieldByName('Pass_NO').AsString:= Trim(StringGrid1.Cells[6,i]);
      dmmain.CDSexecsql.FieldByName('quality').AsString:=Trim(StringGrid1.Cells[2,i]);
      dmmain.CDSexecsql.FieldByName('Fade_Name').AsString:=Trim(StringGrid1.Cells[7,i]);
      dmmain.CDSexecsql.FieldByName('PRICE').AsString:=Trim(StringGrid1.Cells[4,i]);
      dmmain.CDSexecsql.FieldByName('TOTAL_MONEY').AsString:=Trim(StringGrid1.Cells[5,i]);
      dmmain.CDSexecsql.Post;
      dmmain.CDSexecsql.Next;
    end;
    try
      dmmain.CDSexecsql.ApplyUpdates(-1);
    except
      Application.MessageBox('服务器发生故障！',Pchar(Application.Title),Mb_ICONwarning);
      Exit;
    end;
  end ;
  if Public_Do_Result='03' then
  begin
    close;
  end;
end;
procedure TfmfinanceUnpos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='FGoods.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

procedure TfmfinanceUnpos.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if not checkDATA THEN EXIT;
  frm_Public_Don:=Tfrm_Public_Don.Create(self);
  frm_Public_Don.no:=trim(edit2.Text);
  frm_Public_Don.ShowModal;
  frm_Public_Don.FREE;
  SAVEDATA;
end;

procedure TfmfinanceUnpos.SpeedButton2Click(Sender: TObject);
var
  user,wldwname,remarks:widestring;
  flag,intof:olevariant;
  i:integer;
  totals:double;
begin
  inherited;
  if trim(Public_Do)<>'Edited' then exit;
  no:=trim(edit2.Text);
  typed:=' 财务退货单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then
  begin
    for i:=1 to stringgrid1.RowCount-1 do
    begin
      totals:=totals+strtofloat(stringgrid1.Cells[5,i]);
    end;
      /////////////////////////////////
    wldwname:=trim(edit4.Text);
    remarks:='向供货商：'+trim(edit4.Text)+'退货';
    intof:=ipubtemp.MoneyTable(7,no,totals,user,user,user,wldwno,wldwname,trim(edit5.Text),remarks);
    if vartostr(intof)='1' then
    begin
      flag:='3';
    end else
    begin
      flag:='2';
    end;
    ///////
    ipubtemp.Gether(wldwno,totals,0,1);
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

procedure TfmfinanceUnpos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  inherited;

end;

procedure TfmfinanceUnpos.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
   inherited;
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

procedure TfmfinanceUnpos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  frmselect:=tfrmselect.Create(self);
  frmselect.flag:=3;
  frmselect.ShowModal;
  frmselect.Free;
  if trim(stockinput)<>'' then
  begin
    iFlag:=1;
    Public_Do:='Edited';
    no:=stockinput;
    ReadData (stockinput);
  end;
end;

procedure TfmfinanceUnpos.FormShow(Sender: TObject);
begin
  inherited;
  init;
  iFlag:=0;
  if (Public_Do='Edited')  then
  begin
    No:=List_no;
    speedbutton5.Enabled:=false;
  end;
  ReadData (List_No);
end;

procedure TfmfinanceUnpos.SpeedButton9Click(Sender: TObject);
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

procedure TfmfinanceUnpos.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   IF ((PCOL=4) OR (PCOL=7)) AND (PROW>0) THEN
  BEGIN
    IF (Pcol=4)  then
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
      stringgrid1.Options:=stringgrid1.Options+[goediting];
    end;
  END ELSE
  BEGIN
    stringgrid1.Options:=stringgrid1.Options-[goediting];
    KEY:=#0;
  END;
end;

procedure TfmfinanceUnpos.StringGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
    i:integer;
begin
  inherited;
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    if (trim(stringgrid1.Cells[4,i])<>'') then
    begin
      stringgrid1.Cells[5,i]:=floattostr(strtoint(stringgrid1.Cells[3,i])*strtofloat(stringgrid1.Cells[4,i]));
    end;
  end;

end;

procedure TfmfinanceUnpos.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  PCOL:=ACOL;
  PROW:=AROW;
end;

end.
