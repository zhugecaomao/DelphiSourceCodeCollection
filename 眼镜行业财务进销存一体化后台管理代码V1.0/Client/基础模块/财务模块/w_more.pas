{
财务模块
write by Lqiao at 2004-02-29
}
unit w_more;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids,Mask, ExtCtrls, ComCtrls, DB, DBClient,variants;

const
     w_form1:array[0..2]of string=('费用项目编号','费用项目名称','金额');
     w_form2:array[0..2]of string=('费用项目编号','费用项目名称','金额');
     w_form3:array[0..2]of string=('收入项目编号','收入项目名称','收入金额');
     w_form7:array[0..2]of string=('支款帐户编号','支款帐户名称','支款金额');
     w_form8:array[0..2]of string=('费用项目编号','摊销转移的费用项目名称','金额');

type
  Tw_morefm = class(TForm)
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label13: TLabel;
    TotalMoneyTb: TLabel;
    Panel4: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    BtnSelPayComponey: TSpeedButton;
    Label9: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Panel5: TPanel;
    SuperDataGrid1: TStringGrid;
    StringGrid1: TStringGrid;
    Label24: TLabel;
    CheckEdit: TEdit;
    BtnSelCheck: TSpeedButton;
    Label4: TLabel;
    EditDoman: TEdit;
    BtnSelDoman: TSpeedButton;
    Label25: TLabel;
    BillEEdit: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    BtnSelPayAccount: TSpeedButton;
    MaskEdit1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    cdsdata: TClientDataSet;
    bitcheck: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure SuperDataGrid1EditButtonClick(Sender: TObject);
    procedure BtnSelPayComponeyClick(Sender: TObject);
    procedure SuperDataGrid1AfterEdit(Sender: TObject; col, row: Integer);
    procedure FormShow(Sender: TObject);
    procedure BtnSelCheckClick(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure SuperDataGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SuperDataGrid1BeforeEdit(Sender: TObject; col, row: Integer);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditDomanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SuperDataGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSelPayAccountClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SuperDataGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SuperDataGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSelDomanClick(Sender: TObject);
    procedure bitcheckClick(Sender: TObject);
  private
    bRed:boolean;
    lNumberID,czShowMode,szEnterText,szUnitId:string;
    lnewNumberId,lbilltype:integer;
    szBillEId,szPassEId,szCheckEId,szAccountId2,szAccountName2,szAccountId,szAccountName,
    szUserCode,szUserCode2:string;
    procedure RefreshTotal;
    function CheckGrid(bCheckAll:boolean=true):integer ;
    function ShowAccountWin(row:integer):integer;
    procedure FormClear;
    procedure FormShowMode;
    procedure ReadData;
    function writeMainBill: integer;
    function writeDetailBill: integer;
    function DeleteBill(billId:string):integer;
    function SaveDraft: boolean;
    procedure RefreshGrid;
    procedure RefreshTitle;
 private
     { Private declarations }
     editmode:integer;
     BIllid:integer;
  public
      w_formid:integer;
    { Public declarations }
  end;

var
   w_morefm: Tw_morefm;
procedure w_skBill(czShowMode,lNumberID:String;formid:integer;bRedWord:Boolean);

implementation

uses ExitInfo, AccountSelect, Supply_Monad, Login_Man,
  func, untdatadm, Data, UntSQpspart;

{$R *.DFM}

procedure w_skBill(czShowMode,lNumberID:String;formid:integer;bRedWord:Boolean);
begin
  w_morefm:=Tw_morefm.Create(nil);
  w_morefm.czShowMode:=czShowMode;
  if czShowMode='Edit' then
  begin

    w_morefm.editmode:=1;
  end else
  begin
    w_morefm.editmode:=0;
  end;
  w_morefm.lNumberID:=lNumberID;
  w_morefm.bRed:=bRedWord;
  w_morefm.w_formid:=formid;
  w_morefm.BillEEdit.Text:=trim(Handle_Man);
  w_morefm.CheckEdit.Text:=trim(Handle_Man);
  try
    w_morefm.ShowModal;
  finally
    w_morefm.Free;
  end;
end;

procedure Tw_morefm.FormShowMode;
begin
  if czShowMode ='Edit' then
  begin
    edit2.Enabled:=False;
    edit3.Enabled:=False;
    EditDoman.Enabled:=False;
    edit5.Enabled:=False;
    edit6.Enabled:=False;
    CheckEdit.Enabled:=False;
    maskedit1.Enabled:=False;
    BtnSelDoman.Enabled:=False;
    BtnSelPayComponey.Enabled:=False;
    BtnSelPayAccount.Enabled:=False;
    BtnSelCheck.Enabled:=False;
    ReadData;
    RefreshTotal;
   end;



end;

procedure tw_morefm.ReadData;
var
  sql:widestring;
  datas:olevariant;
begin
  cdsdata.close;
  cdsdata.data:=null;
  datas:=null;
  sql:='select * from MainTable where BillCode='+''''+trim(lNumberID)+'''';
  try
    datas:=adisp.execsql(sql);
    if not varisnull(datas) then
    begin
      cdsdata.data:=datas;
      cdsdata.open;
      billid:=cdsdata.fieldbyname('billid').AsInteger;
    end;
    RefreshTitle;
  except
  end;
   cdsdata.close;
  cdsdata.data:=null;
  datas:=null;
  sql:='select *,(select UserCode from AccountTable where AccountId=a.AccountId) as UserCode from financebill a where BillId='+inttostr(billid)+' order by ord';
  try
    datas:=adisp.execsql(sql);
    if not varisnull(datas) then
    begin
      cdsdata.data:=datas;
      cdsdata.open;
    end;
  except
  end;
  RefreshGrid;
end;

procedure tw_morefm.RefreshTitle;
begin     //根据基本信息表把Title值取出来，并更新单元内的相应变量。由于基本信息单元不全，暂不写这部分。
  edit3.Text:=cdsdata.fieldbyname('unitname').AsString;
  edit2.Text:=cdsdata.fieldbyname('billcode').AsString;
  maskedit1.Date :=cdsdata.fieldbyname('billdate').AsDateTime;
  //edit5.Text:=cdsdata.fieldbyname('billdate').AsString;
  edit6.Text:=cdsdata.fieldbyname('Explain').AsString;
  checkedit.Text:=cdsdata.fieldbyname('checkeid').AsString;
  editdoman.Text:=cdsdata.fieldbyname('passeid').AsString;
  BILLeedit.Text:=cdsdata.fieldbyname('billeid').AsString;
  szUnitId:=trim(cdsdata.fieldbyname('Unitid').AsString);
end;

procedure tw_morefm.RefreshGrid;
var i:integer;
begin
  if SuperDataGrid1.RowCount+2<= cdsdata.RecordCount then
     SuperDataGrid1.RowCount:=cdsdata.RecordCount+5;
  i:=1;
  while not cdsdata.Eof do
     begin
        SuperDataGrid1.Cells[1,i]:=trim(cdsdata.fieldbyname('UserCode').AsString);
        SuperDataGrid1.Cells[2,i]:=trim(cdsdata.fieldbyname('AccountName').AsString);
        SuperDataGrid1.Cells[3,i]:=trim(cdsdata.fieldbyname('Total').AsString);
        SuperDataGrid1.Cells[4,i]:=trim(cdsdata.fieldbyname('Comment').AsString);
        cdsdata.Next;
        inc(i);
     end;
  cdsdata.First;
  szAccountId2:=trim(cdsdata.fieldbyname('AccountId2').AsString);
  szAccountName2:=trim(cdsdata.fieldbyname('AccountName2').AsString);
  for i:=1 to SuperDataGrid1.RowCount -1 do
  begin
    if czShowMode='Edit' then
    begin
      szAccountId:=trim(SuperDataGrid1.Cells[2,i]);
      ShowAccountWin(i);
    end;
  end;
  edit5.Text:=szAccountName2;
end;


procedure Tw_morefm.FormClear;
begin
  edit2.text := '';
  edit3.text := '';
  EditDoman.text := '';
  edit6.text := '';
  edit5.text:='现  金';
  //Checkedit.Text:='';
  clearGrid(SuperDataGrid1);
  if czShowMode='' then//录新单
    begin
      Edit2.Text:='';
    end;
  maskedit1.Date:=date;
  totalmoneytb.Caption := '0.00';

  if maskedit1.CanFocus then maskedit1.SetFocus
  else if Edit2.CanFocus then edit2.SetFocus;
end;

procedure Tw_morefm.RefreshTotal;
var
 i: integer;
 n:double;
begin
  totalMoneytb.Caption:='0.00';
    for i := 1 to superDataGrid1.RowCount do
    begin
      if SuperDataGrid1.Cells[1,i] <> '' then
         begin
           if not TryStrToFloat(SuperDataGrid1.Cells[3,i],n) then SuperDataGrid1.Cells[3,i]:='0';
           TotalMoneyTb.Caption := FloatToStr(StrtoFloat(TotalMoneytb.caption)+StrtoFloat(SuperDataGrid1.Cells[3,i]));
         end;
    end;
end;

function Tw_morefm.ShowAccountWin(row:integer):integer;
var i:string;
begin
{     00000                   会计科目
     0000100004              银行账户
     0000100002              固定资产
     0000300003              其他收入
     0000400003              费用合计       }
  if czShowMode<>'Edit' then
  begin
  i:='';
  if w_formid=1 then  szAccountId:='0000400003';
  if w_formid in [2,6,9] then  szAccountId:='0000400003';
  if w_formid in [3,7,8] then  szAccountId:='0000300003';
  if w_formid=4 then  begin szAccountId:='00001';i:='1';end;
  if w_formid=5 then  begin szAccountId:='0000400003';end;
  if AccountSelectShow(szUserCode,szAccountId,szAccountName,i)=1 then
     begin
       SuperDataGrid1.Cells[1,row]:=  szUserCode;
       SuperDataGrid1.Cells[2,row]:=  szAccountName;
       StringGrid1.Cells[1,row]   :=  szAccountId;
       result:=0;
     end;
  end else
  begin
    StringGrid1.Cells[1,row]   :=  szAccountId;
  end;
end;

function Tw_morefm.CheckGrid(bCheckAll:boolean=true):integer ;
var i:integer;
begin
 if strtofloat(TotalMoneyTb.Caption)=0 then
    begin
      application.messagebox('还没有录入数据！',pchar(application.title),mb_iconinformation);
      Result:=-1;
      exit;
    end;
 for i:=1 to SuperDataGrid1.RowCount-1 do
    begin
      if ((SuperDataGrid1.Cells[1,i]<>'') or (SuperDataGrid1.Cells[2,i]<>'')
           or (SuperDataGrid1.Cells[3,i]<>'') or (SuperDataGrid1.Cells[4,i]<>''))
      and (StringGrid1.Cells[1,i]='') then
          begin
             application.messagebox(pchar('第'+inttostr(i)+'行数据错误，请重新选择！'),pchar(application.title),mb_iconinformation);
             Result:=-1;
             exit;
          end;
    end;
 if (EditDoman.text='') then
    begin
       showmessage('数据不完整，请录入经手人！');
       //EditDoman.SetFocus;
       Result:=-1;
       exit;
    end;
  if (CheckEdit.text='')  then
    begin
       showmessage('数据不完整，请录入审核人！');
       //CheckEdit.SetFocus;
       Result:=-1;
       exit;
    end;
    if ((Edit5.text='') or (szAccountId2='')) and (Edit5.Visible=true) then
    begin
       showmessage('数据不完整，请录入'+label6.Caption+'！');
      // Edit5.SetFocus;
       Result:=-1;
       exit;
    end;
   if (Edit3.text='') or (szUnitId='') then
    begin
       showmessage('数据不完整，请录入'+label6.Caption+'！');
       //Edit5.SetFocus;
       Result:=-1;
       exit;
    end;

 result:=0;
end;


procedure Tw_morefm.BitBtn2Click(Sender: TObject);
  var
  tempModalResult :TModalResult;
  szSql:string;
  nret:integer;
begin
  if czShowmode <> 'ReadOnly' then  //只读直接退出
  begin
    tempModalResult := Exitinfowin;
    case tempModalResult of
        mrCancel : begin            //返回
                     abort;
                   end;
        mrAbort  : begin            //废弃退出
                     close;
                   end;
        mrOk     : begin            //过帐
                     if SaveDraft then
                        begin
                           nret:=ipubtemp.EditMoney(lnewNumberId,'');
                           if nRet=-1 then
                              begin
                                 DeleteBill(inttostr(lnewNumberId));
                                 Showmessage('过帐失败');
                              end;
                        end
                        else
                        begin

                        end;
                     end;
       mrRetry  : begin            //存草稿
                      if not SaveDraft then exit;
                   end;
    end;
  end;
end;

procedure Tw_morefm.SuperDataGrid1EditButtonClick(Sender: TObject);
begin
  if czShowMode = 'ReadOnly' then exit;
  if (superdatagrid1.Col <> 1) and (superdatagrid1.Col <> 2) then  exit
  else  ShowAccountWin(superdatagrid1.row);
end;

procedure Tw_morefm.BtnSelPayComponeyClick(Sender: TObject);
var
  czText: string;
begin
  if czShowMode = 'ReadOnly' then exit;
  if not (w_formid in [4,5]) then
  begin
    edit3.SetFocus;
    Check_Mond:='DW-0001';
    frm_Supply_Monad:=Tfrm_Supply_Monad.Create(self);
    frm_Supply_Monad.Caption:='【付款单位】';
    frm_Supply_Monad.ShowModal;
    frm_Supply_Monad.Free;
    edit3.Text:=Trim(check_Mond_Result);
    szUnitId:=trim(wldwno);
  end else
  begin
    dlgSQpspart:=tdlgSQpspart.Create(self);
    dlgSQpspart.Caption:='选择部门';
    dlgSQpspart.ShowModal;
    dlgSQpspart.Free;
    if dmmain.CDSdata.IsEmpty  then exit;
    edit3.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
    szUnitId:=trim(dmmain.CDSdata.fieldbyname('part_no').AsString);
  end;
end;

procedure Tw_morefm.SuperDataGrid1AfterEdit(Sender: TObject; col,
  row: Integer);
begin
  if Row =0 then Exit;
  RefreshTotal;
  if (col=1)  or (col=2) then
  begin
    if  (SuperDataGrid1.cells[1,row]='') and (SuperDataGrid1.Cells[2,row]='') then exit;
      if SuperDataGrid1.Cells[col,row]='' then
      begin
       RefreshTotal;
      end;
      RefreshTotal;
      exit;

    if ShowAccountWin(SuperDataGrid1.row)=0 then
    begin
       RefreshTotal;
       Exit;
    end
    else
      szEnterText:=SuperDataGrid1.Cells[SuperDataGrid1.col,SuperDataGrid1.row];
  end;

  RefreshTotal;
end;


procedure Tw_morefm.FormShow(Sender: TObject);
var
  recno:integer;
  sqls,make:string;
begin
   szUnitId :='0000100001';//住来单位编号
  szBillEId:='0000100001';//制单人编号
  szPassEId:='0000100001';//经手人编号
  szCheckEId:='0000100001';//审核人编号
  RefreshOrd(SuperDataGrid1);
  superdatagrid1.Cells[0,0]:='序号';
  superdatagrid1.Cells[4,0]:='备注';
  FormClear;
  case w_formid of
   1:  begin
        superdatagrid1.Cells[1,0]:=w_form1[0] ;
        superdatagrid1.Cells[2,0]:=w_form1[1] ;
        superdatagrid1.Cells[3,0]:=w_form1[2] ;
        label9.Caption:='现金费用单';
        w_morefm.Caption:='现金费用单';
        edit5.Visible:=false;
        label6.Visible:=false;
        BtnSelPayAccount.Visible:=false;
        szAccountId2:='0000100003';//现金帐户
        szAccountName2:='现  金';
        Edit5.Text:='现  金';
        if editmode=0 then
        begin
          sqls:='select max(right(BillCode,4)) from maintable where BillType=801 and BillDate='+''''+trim(formatdatetime('yyyy-mm-dd',date))+''''+' and shopNo='+''''+trim(shopid)+'''';
          make:='XJFY-'+trim(Handle_Part)+trim(handle_no);
          edit2.Text:=setcode(SQLS,make);
        end;
      end;
  2,6,9: begin
       superdatagrid1.Cells[1,0]:=w_form2[0] ;
       superdatagrid1.Cells[2,0]:=w_form2[1] ;
       superdatagrid1.Cells[3,0]:=w_form2[2] ;
       if w_formid=2 then
       begin
         label9.Caption:='一般费用单';
         w_morefm.Caption:='一般费用单';
       end ;
       if w_formid=6 then
       begin
         label9.Caption:='应付款增加';
         w_morefm.Caption:='应付款增加';
       end;
       if w_formid=9 then
       begin
         label9.Caption:='应收款减少';
         w_morefm.Caption:='应收款减少';
       end;
       label3.caption:='收款单位';
       if editmode=0 then
       begin
        sqls:='select max(right(BillCode,4)) from maintable where BillType=802 and BillDate='+''''+trim(formatdatetime('yyyy-mm-dd',date))+''''+' and shopNo='+''''+trim(shopid)+'''';
        make:='YBFY-'+trim(Handle_Part)+trim(handle_no);
        edit2.Text:=setcode(SQLS,make);
       end;
     end;
   3,7,8: begin
       superdatagrid1.Cells[1,0]:=w_form3[0] ;
       superdatagrid1.Cells[2,0]:=w_form3[1] ;
       superdatagrid1.Cells[3,0]:=w_form3[2] ;
       if w_formid=3 then
       begin
         label9.Caption:='其它收入单';
         w_morefm.Caption:='其它收入单';
       end;
       if w_formid=7 then
       begin
         label9.Caption:='应收款增加';
         w_morefm.Caption:='应收款增加';
       end;
       if w_formid=8 then
       begin
         label9.Caption:='应付款减少';
         w_morefm.Caption:='应付款减少';
       end;
       label6.Caption:='收款帐户';
       label3.caption:='付款单位';
      if editmode=0 then
      begin
        sqls:='select max(right(BillCode,4)) from maintable where BillType=803 and BillDate='+''''+trim(formatdatetime('yyyy-mm-dd',date))+''''+' and shopNo='+''''+trim(shopid)+'''';
        make:='QTFY-'+trim(Handle_Part)+trim(handle_no);
        edit2.Text:=setcode(SQLS,make);
      end;
     end;
   4: begin
        superdatagrid1.Cells[1,0]:=w_form7[0] ;
        superdatagrid1.Cells[2,0]:=w_form7[1] ;
        superdatagrid1.Cells[3,0]:=w_form7[2] ;
        label9.Caption:='待摊费用发生单';
        w_morefm.Caption:='待摊费用发生单';
        edit5.Visible:=false;
        label6.Visible:=false;
        BtnSelPayAccount.Visible:=false;
        szAccountId2:='0000100007';
        szAccountName2:='待摊费用';
        Edit5.Text:='待摊费用';
        label3.caption:='发生部门';
        if editmode=0 then
        begin
          sqls:='select max(right(BillCode,4)) from maintable where BillType=804 and BillDate='+''''+trim(formatdatetime('yyyy-mm-dd',date))+''''+' and shopNo='+''''+trim(shopid)+'''';
          make:='DTFS-'+trim(Handle_Part)+trim(handle_no);
          edit2.Text:=setcode(SQLS,make);
        end;
      end;
   5: begin
        superdatagrid1.Cells[1,0]:=w_form8[0] ;
        superdatagrid1.Cells[2,0]:=w_form8[1] ;
        superdatagrid1.Cells[3,0]:=w_form8[2] ;
        label9.Caption:='待摊费用摊销单';
        w_morefm.Caption:='待摊费用摊销';
        edit5.Visible:=false;
        label6.Visible:=false;
        BtnSelPayAccount.Visible:=false;
        szAccountId2:='0000100007';//现金帐户
        szAccountName2:='待摊费用';
        Edit5.Text:='待摊费用';
        label3.caption:='摊销单位';
        if editmode=0 then
        begin
          sqls:='select max(right(BillCode,4)) from maintable where BillType=805 and BillDate='+''''+trim(formatdatetime('yyyy-mm-dd',date))+''''+' and shopNo='+''''+trim(shopid)+'''';
          make:='DTTX-'+trim(Handle_Part)+trim(handle_no);
          edit2.Text:=setcode(SQLS,make);
        end;
      end;
 end;

 if czShowmode='Edit' then
 begin
    ReadData;
    RefreshTotal;
 end;
 FormShowMode;
 Screen.Cursor:=crDefault;
end;

procedure Tw_morefm.BtnSelCheckClick(Sender: TObject);
var
 cztext :string;
begin
  if czShowMode = 'ReadOnly' then exit;
  perform(WM_NEXTDLGCTL,0,0);
  Employe_Check:='';
  Employe_Check:='Storage_Umanage_Fad';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='经手人选择';
  frm_Login_Man.ShowModal;
  checkedit.Text := Employe_Check_Result;

end;

procedure Tw_morefm.Edit3Enter(Sender: TObject);
begin
  if czShowMode = 'ReadOnly' then exit;
  szEnterText:=(sender as TEdit).text;
end;

procedure Tw_morefm.SuperDataGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if czShowMode = 'ReadOnly' then exit;
 if (key = vk_Delete) and ((SuperDataGrid1.col=1) or (SuperDataGrid1.col=2)) and
    (SuperDataGrid1.Cells[1,SuperDataGrid1.row]='') then
     begin
        DelRow(SuperDataGrid1,SuperDataGrid1.Row);
        DelRow(StringGrid1,SuperDataGrid1.Row);
     end;
 if (Key = VK_RETURN) then
 begin
   if SuperDataGrid1.RowCount<SuperDataGrid1.Row+2 then
      begin
        SuperDataGrid1.RowCount:=SuperDataGrid1.RowCount+1;
        StringGrid1.RowCount:=SuperDataGrid1.RowCount;
        RefreshOrd(SuperDataGrid1);
      end;
   if (SuperDataGrid1.col=3) then
      begin
        SuperDataGrid1.col:=4;
        if (SuperDataGrid1.Cells[1,SuperDataGrid1.row]<>'') and
           (SuperDataGrid1.Cells[3,SuperDataGrid1.row]='') then
            SuperDataGrid1.Cells[3,SuperDataGrid1.row]:='0';
      end
   else if (SuperDataGrid1.col=4) then
      begin
         SuperDataGrid1.col:=1;
         SuperDataGrid1.Row:=SuperDataGrid1.Row+1;
      end
   else if ((SuperDataGrid1.col=1) or (SuperDataGrid1.col=2))  then
      begin
        SuperDataGrid1.col:=3;
        ShowAccountWin(SuperDataGrid1.row);//选择会计科目。
      end;
    end;
end;

procedure Tw_morefm.SuperDataGrid1BeforeEdit(Sender: TObject; col,
  row: Integer);
begin
  if czShowMode = 'ReadOnly' then exit;
  szEnterText:=SuperDataGrid1.Cells[col,row];
end;

procedure Tw_morefm.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  czText : string;
begin
  if Key=VK_RETURN then
  begin
    if czShowMode = 'ReadOnly' then exit;
    edit3.SetFocus;
  end;
end;

procedure Tw_morefm.EditDomanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    if czShowMode = 'ReadOnly' then exit;
  end;
end;

procedure Tw_morefm.SuperDataGrid1DblClick(Sender: TObject);
begin
  if czShowMode = 'ReadOnly' then exit;
  if ((SuperDataGrid1.col=1) or (SuperDataGrid1.col=2)) then
    if ShowaccountWin(SuperDataGrid1.row)=0 then
    begin
    end else
      szEnterText:=SuperDataGrid1.Cells[SuperDataGrid1.col,SuperDataGrid1.row];
end;

function Tw_morefm.writeMainBill:integer;
var nret:integer;
begin
  case w_Formid of
    1:lbilltype:=801;
    2,6,9:lbilltype:=802;
    3,7,8:lbilltype:=803;
    4:lbilltype:=804;
    5:lbilltype:=805;
  end;
  try
    ipubtemp.WriteMainBill(Edit2.text,lbilltype,
            formatdatetime('YYYY-MM-DD',MaskEdit1.Date),BillEEdit.Text, CheckEdit.text,EditDoman.Text,szUnitId,//往来单位编号
            edit3.text,strtofloat(TotalMoneyTb.Caption),0,0,shopid,Edit6.Text,nret,editmode,BillID);
    lnewNumberId:=nret;
   except
   end;


    result:=nret;
end;

function   Tw_morefm.writeDetailBill:integer;  //写明细表。
var nret,i:Integer;
begin
  for i:=1 to  SuperDataGrid1.RowCount-1 do
    begin
        if   SuperDataGrid1.Cells[1,i]='' then Break;
        ipubtemp.LQ_WriteFinanceBill(lnewNumberId,lbilltype,
            formatdatetime('YYYY-MM-DD',MaskEdit1.Date),StringGrid1.Cells[1,i],SuperDataGrid1.Cells[2,i],szAccountId2,
            szAccountName2,strtofloat(SuperDataGrid1.Cells[3,i]),SuperDataGrid1.Cells[4,i],i,nret,Handle_Part,editmode);
       if nret=-1 then
         begin
           result:=nret;
           exit;
         end;
    end;
end;

function Tw_morefm.DeleteBill(billId:string):integer;
var
  sqlpub:widestring;
begin
 sqlpub:='delete MainTable where Billid='+billId;
try
   adisp.updatesql(sqlpub);
   result:=0;
except
   result:=-1;
end;
end;

procedure Tw_morefm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  tempModalResult :TModalResult;
  szSql:string;
  nret:integer;
begin
  Action := caFree;
end;

function Tw_morefm.SaveDraft:boolean;
var
  szSql:string;
  //temp:widestring;
  datas:olevariant;
  result_billId:integer;
begin
   Result:=true;
   if CheckGrid=-1 then
      begin
         Result:=false;
         exit;
      end;
   if czShowMode='Edit' then
   begin
     if not bedit then
      begin
        if trim(Handle_Man)<>trim(Billeedit.Text) then
        begin
          Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
          exit;
        end;
      end;
     end;
     result_billID:=writeMainBill ;
   if  result_billID= -1 then      //写主表
      begin
        Application.MessageBox('写主写失败，可能是网络忙！',pchar(application.title),mb_iconwarning);
        Result:=false;
        exit;
      end ;
          //////////////////////////写入草稿
  /////////////////////////
     result_billID:= writeDetailBill ;
   if result_billID=-1 then       //写明细表；
      begin
        Application.MessageBox('写明细表失败，可能是网络忙！',pchar(application.title),mb_iconwarning);
        Result:=false;
        exit;
      end else
      begin
        try
         if czShowMode<>'Edit' then
         begin
          dmmain.cdsReceipt.close;
          dmmain.cdsReceipt.Open;
          dmmain.cdsReceipt.Append;
          dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=Trim(edit2.Text);
          dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:=trim(label9.caption);
          dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=formatdatetime('yyyy''-''mm''-''dd',date);
          dmmain.cdsReceipt.FieldByName('Proposer').AsString:=Trim(billeedit.text);
          dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
          dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
          dmmain.cdsReceipt.FieldByName('Condense').AsString:=trim(edit6.text);
          dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
          dmmain.cdsReceipt.Post;
          dmmain.cdsReceipt.ApplyUpdates(-1);
         end;
       except
       end;
      end;
   FormClear;
end;

procedure Tw_morefm.BtnSelPayAccountClick(Sender: TObject);
begin
    szAccountId2:='00001';
    AccountSelectShow(szUserCode2,szAccountId2,szAccountName2,'1');
    Edit5.text:= szAccountName2;
end;

procedure Tw_morefm.BitBtn1Click(Sender: TObject);
begin
SuperDataGrid1.RowCount:=SuperDataGrid1.RowCount+1;
RefreshOrd(SuperDataGrid1);
end;

procedure Tw_morefm.BitBtn3Click(Sender: TObject);
begin
 DelRow( SuperDataGrid1,SuperDataGrid1.Row);
 RefreshTotal;
end;

procedure Tw_morefm.SuperDataGrid1KeyPress(Sender: TObject; var Key: Char);
var n:double;
begin
  if key=#8 then exit;
  if SuperDataGrid1.col=3 then
    if not TryStrToFloat(key,n) then key:=#0;
end;

procedure Tw_morefm.SuperDataGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF SuperDataGrid1.col=3 then RefreshTotal;
end;

procedure Tw_morefm.BtnSelDomanClick(Sender: TObject);
begin
  if czShowMode = 'ReadOnly' then exit;

 Employe_Check:='';
  Employe_Check:='Storage_Umanage_Fad';
  Employe_Check_Result:='';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='经手人选择';
  frm_Login_Man.ShowModal;
  editdoman.Text := Employe_Check_Result;

end;

procedure Tw_morefm.bitcheckClick(Sender: TObject);
var
  nret,i:integer;
  user:string;
  flag:olevariant;
  TotalMoney:double;
begin
  if not (lNumberID<>'') then exit;
  if trim(SuperDataGrid1.Cells[1,1])='' then exit;
  no:=trim(lNumberID);
  typed:=trim(label9.caption);
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  if flag='3' then //
  begin
    try
       nret:=ipubtemp.EditMoney(BILLid,'');
       if nret=-1 then flag:='2' else flag:='3';
       if w_formid>5 then
       begin
         totalMoney:=0;
         for i:=1 to superdatagrid1.RowCount-1 do
         begin
           totalMoney:=TotalMoney+strtofloat(superdatagrid1.Cells[3,i]);
         end;
       end;
      if flag='3' then
      begin
         if w_formid=6 then  ///////////应付增加减少
         begin
           ipubtemp.Gether(szUnitId,totalmoney,1,1);
         end;
         if w_formid=8 then
         begin
           ipubtemp.Gether(szUnitId,totalmoney,1, 0);
         end;
          if w_formid=7 then  ///////////应手增加减少
         begin
           ipubtemp.Gether(szUnitId,totalmoney,0,1);
         end;
         if w_formid=9 then
         begin
           ipubtemp.Gether(szUnitId,totalmoney,0, 0);
         end;
      end;
    except
      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
    ////////////////////
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

end.
