unit UBacthDataQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, DBGrids, DB, DBClient, StdCtrls, ExtCtrls,
  Buttons, ComCtrls;

type
  TfmBacthQuery = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbtop: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    DsMtable: TDataSource;
    DsDtable: TDataSource;
    CDSmTABLE: TClientDataSet;
    CDSDTABLE: TClientDataSet;
    CDSTotal: TClientDataSet;
    DsTotal: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    btnprint: TBitBtn;
    Panel4: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    ckbnewDate: TCheckBox;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    cbamount: TCheckBox;
    edtamount: TEdit;
    Cbproposer: TCheckBox;
    Edtproposer: TEdit;
    SpeedButton7: TSpeedButton;
    R1: TRadioButton;
    R2: TRadioButton;
    R3: TRadioButton;
    R4: TRadioButton;
    R5: TRadioButton;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ckbnewDateClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure CbproposerClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbtopChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure btnpagedownClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    Filedsname:string;
    QueryS,SElTop,tGroup:string;
    LocalCount,Flag,Dcount,tcount:integer;
  public
    { Public declarations }
  end;

var
  fmBacthQuery: TfmBacthQuery;

implementation

uses fm_SetColumn, func, Login_Man;

{$R *.dfm}

procedure TfmBacthQuery.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmBacthQuery.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmBacthQuery.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if cbproposer.Checked  then
  begin
  Employe_Check:='';
    Employe_Check:='Goods_Requirement_str';
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='制单人选择';
  frm_Login_Man.ShowModal;
  frm_Login_Man.Free;
  Edtproposer.Text:=Employe_Check_Result;
  end;
end;

procedure TfmBacthQuery.ckbnewDateClick(Sender: TObject);
begin
  inherited;
  ckbDtps(ckbnewdate,dtpbegin,dtpend);
end;

procedure TfmBacthQuery.cbamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbamount,edtamount);
end;

procedure TfmBacthQuery.CbproposerClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbproposer,edtproposer);
end;

procedure TfmBacthQuery.BitBtn1Click(Sender: TObject);
var
  TableType,temp,Tname,St,Sp,Sman:String;
  i:integer;
  Sql:widestring;
  datas:olevariant;
begin
  inherited;
  dbgCur:=dbgrid1;
  for i:=0 to self.ComponentCount-1 do
  begin
    if (self.Components[i] is TRadioButton) then
    begin
      if (self.Components[i] as TRadioButton).Checked  then
      begin
        CASE (self.Components[i] as TRadioButton).Tag of
          0: begin
               tabletype:='501';
               Tname:=' a.vcgetgoodsplanid as BNO,a.VCBILLNO as BillNo,a.dgetdate as newdate,a.vceid as newman,a.vcchecke as Tid,a.vcStockid as Storageid,id,a.ibilltype FROM GETgoodsplanmaster as a  where 1=1 ';
               temp:=' and  a.vcofficeid='+''''+trim(Handle_Part)+'''';
               dbgrid2.Columns.Items[5].Title.caption:='申请数量';
               dbgrid3.Columns.Items[5].Title.caption:='申请数量';
               st:='dgetdate';
               Sp:='vcbillno';
               sman:='vceid';
             end;
          1:begin
               tabletype:='';
               Tname:=' vcsendbillid as Bno,billno,dtdrawdate as newdate,vclisterid as newman,vceid as tid,vcrecvstockid as storageid,a.id,ibilltype,sendstatus,convert (varchar(25),B.Check_Result) AS status FROM SendmasterTable as a, '
               +'receipt as b where 1=1 and  a.BILLNO=b.receipt_no ';
               Temp:='  and a.BillStatus='+'0'+' and a.vcsendstockid='+''''+trim(shopid)+'''';
               dbgrid2.Columns.Items[5].Title.caption:='配送数量';
               dbgrid3.Columns.Items[5].Title.caption:='配送数量';
               st:='dtdrawdate';
               Sp:='billno';
             end;
          2:begin
               tabletype:='';
               Tname:=' vcsendbillid as Bno,billno,dtdrawdate as newdate,vclisterid as newman,vceid as tid,vcrecvstockid as storageid,a.id,ibilltype,sendstatus,convert (varchar(25),B.Check_Result) AS status FROM SendmasterTable as a, '
               +'receipt as b where 1=1 and a.BILLNO=b.receipt_no ';
               Temp:='  and a.BillStatus='+'5'+' and a.vcsendstockid='+''''+trim(shopid)+'''';
                dbgrid2.Columns.Items[5].Title.caption:='预定配送数量';
               dbgrid3.Columns.Items[5].Title.caption:='预定配送数量';
               st:='dtdrawdate';
               Sp:='billno';
               sman:='vclisterid';
             end;
          3:begin
               tabletype:='505';
               Tname:=' vcsendbillid as Bno,billno,dtdrawdate as newdate,vclisterid as newman,vceid as tid,vcrecvstockid as storageid,a.id,ibilltype,sendstatus,convert (varchar(25),B.Check_Result) AS status FROM SendmasterTable as a,'
               +' receipt as b where 1=1 and  a.BILLNO=b.receipt_no';
               Temp:=' and a.BillStatus='+'0'+' a.ibilltype='+tabletype+' and a.vcsendstockid='+''''+trim(shopid)+'''';
               dbgrid2.Columns.Items[5].Title.caption:='配送退货数量';
               dbgrid3.Columns.Items[5].Title.caption:='配送退货数量';
               st:='dtdrawdate';
               Sp:='billno';
               sman:='vclisterid';
            end;
          4:begin
               //tabletype:='501';
               Tname:=' vcsendbillid as Bno,billno,dtdrawdate as newdate,vclisterid as newman,vceid as tid,vcrecvstockid as storageid,id,ibilltype,sendstatus FROM SendmasterTable as a where 1=1';
               Temp:=' and  a.SendStatus='+'2'+' and a.vcrecvstockid='+''''+trim(Shopid)+'''';
                dbgrid2.Columns.Items[5].Title.caption:='收货数量';
               dbgrid3.Columns.Items[5].Title.caption:='收货数量';
               st:='dtdrawdate';
               Sp:='billno';
               sman:='vclisterid';
             end;
        end;
      end;
    end;
  end;
  if ckbnewdate.Checked then
  begin
    temp:=temp+' and '+st+' between '+''''+formatdatetime('yyyy-mm-dd',dtpbegin.Date)+''''+' and '+''''+formatdatetime('yyyy-mm-dd',dtpend.Date)+'''';
  end;
  if cbamount.Checked then
  begin
    temp:=temp+' and '+trim(sp)+'='+''''+trim(edtamount.Text)+'''';
  end;
  if cbproposer.Checked then
  begin
    temp:=temp+' and '+trim(sman)+'='+''''+trim(edtproposer.Text)+'''';
  end;
  Sql:=SelTop+Tname+temp;
  try
    screen.Cursor :=  crHourGlass;
    datas:=null;
    cdsmtable.Close;
    cdsmtable.Data:=null;
    cdsmtable.IndexName:='';
    cdsmtable.IndexDefs.Clear;
    datas:=adisp.execSql(sql);
    filedsname:=tname;
    querys:=temp;
    Flag:=1;
    if not varisnull(datas) then
    begin
      cdsmtable.Data:=datas;
      cdsmtable.Open;
      datas:=null;
      cdsmtable.Last;
      if not cdsmtable.IsEmpty then
      LocalCount:=GetKeyFieldValue('id',cdsmtable);
      btnpagedown.Enabled:=true;
      dbgrid1.Visible:=true;
      dbgrid2.Visible:=false;
      dbgrid3.Visible:=false;
      bitbtn3.Enabled:=true;
    end;
     screen.Cursor :=  crdefault;
  except
  end;
end;

procedure TfmBacthQuery.FormShow(Sender: TObject);
begin
  inherited;
  CMBtop.ItemIndex:=0;
  Seltop:='select top '+cmbtop.Text;
  dtpbegin.Date:=date-30;
  dtpend.Date:=date;
end;

procedure TfmBacthQuery.cmbtopChange(Sender: TObject);
begin
  inherited;
  Seltop:='select top '+cmbtop.Text;
end;

procedure TfmBacthQuery.DBGrid1DblClick(Sender: TObject);
var
  TableType,temp,Tname:String;
  i:integer;
  Sql:widestring;
  datas:olevariant;
begin
  inherited;
  if dbgrid1.DataSource.DataSet.IsEmpty  then exit;
  for i:=0 to self.ComponentCount-1 do
  begin
    if (self.Components[i] is TRadioButton) then
    begin
      if (self.Components[i] as TRadioButton).Checked  then
      begin
        CASE (self.Components[i] as TRadioButton).Tag of
          0: begin
               Tname:=' b.goods_no,b.goods_name,b.type,b.brand,b.breed,a.NQty as amount,a.id FROM GetGoodsPlan  as a ,goods_code as b where a. VCPtyieID=b.goods_no and  vcgetgoodsplanid='+''''+trim(dbgrid1.DataSource.DataSet.fieldbyname('Bno').AsString)+'''';
             end;
          1..4:
             begin
               Tname:=' b.goods_no,b.goods_name,b.type,b.brand,b.breed,a.nuOutQuantity as amount,a.id FROM SendDetailTable  as a ,goods_code as b where a.vcPtypeid=b.goods_no and  vcSendBillid='+''''+trim(dbgrid1.DataSource.DataSet.fieldbyname('Bno').AsString)+'''';
             end;
        end;
      end;
    end;
  end;
  dbgCur:=dbgrid2;
  Sql:=SelTop+Tname;
  try
    screen.Cursor :=  crHourGlass;
    datas:=null;
    cdsdtable.Close;
    cdsdtable.Data:=null;
    cdsdtable.IndexName:='';
    cdsdtable.IndexDefs.Clear;
    datas:=adisp.execSql(sql);
    filedsname:=tname;
    flag:=2;
    if not varisnull(datas) then
    begin
      cdsdtable.Data:=datas;
      cdsdtable.Open;
      datas:=null;
      cdsdtable.Last;
      DCount:=GetKeyFieldValue('id',cdsdtable);
      btnpagedown.Enabled:=true;
      dbgrid1.Visible:=false;
      dbgrid3.Visible:=false;
      dbgrid2.Visible:=true;
      dbgrid2.SetFocus;
    end;
     screen.Cursor :=  crdefault;
  except
  end;
end;

procedure TfmBacthQuery.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
   if trim(column.Field.AsString)='' then exit;
   sortgrid(column.Field.FieldName,cdsdtable,dbgrid2,column);
end;

procedure TfmBacthQuery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   IF DBGRID2.Visible THEN
  BEGIN
    if key=vk_Escape then
    begin
      dbgrid3.Visible:=false;
      dbgrid2.Visible:=false;
      dbgrid1.Visible:=true;
      dbgCur:=dbgrid1;
    end;
  END ELSE
  BEGIN
    IF (KEY=VK_F1) and (dbgrid1.Visible) THEN
    begin
      DBgrid1DblClick(DBgrid1);
      dbgrid1.Visible:=false;
      dbgrid3.Visible:=false;
      dbgCur:=dbgrid2;
    end;
    IF (KEY=VK_F2) and (dbgrid1.Visible) THEN
    begin
      bitbtn3click(nil);
      dbgrid1.Visible:=false;
      dbgrid2.Visible:=false;
      dbgrid3.Visible:=true;
      dbgCur:=dbgrid3;
    end;
    if (key=vk_Escape) and (dbgrid3.Visible) then
    begin
      dbgrid2.Visible:=false;
      dbgrid3.Visible:=false;
      dbgrid1.Visible:=true;
      dbgCur:=dbgrid1;
    end;
  END;
end;

procedure TfmBacthQuery.BitBtn3Click(Sender: TObject);
var
  TableType,temp,Tname:String;
  i:integer;
  Sql:widestring;
  datas:olevariant;
begin
  inherited;
  if dbgrid1.DataSource.DataSet.IsEmpty  then exit;
  for i:=0 to self.ComponentCount-1 do
  begin
    if (self.Components[i] is TRadioButton) then
    begin
      if (self.Components[i] as TRadioButton).Checked  then
      begin
        CASE (self.Components[i] as TRadioButton).Tag of
          0: begin
               Tname:=' max(b.id) as id, b.goods_no,b.goods_name,b.type,b.brand,b.breed,sum(c.NQty) as amount FROM GetGoodsPlan  as c ,goods_code as b,getgoodsplanmaster as a where a.vcgetgoodsplanid=c.vcgetgoodsplanid and c. VCPtyieID=b.goods_no '+querys;
             end;
          1..4:
             begin
               Tname:='max(b.id) as id, b.goods_no,b.goods_name,b.type,b.brand,b.breed,sum(c.nuOutQuantity) as amount FROM SendDetailTable  as c ,goods_code as b,sendmastertable as a where a.vcsendbillid=c.vcsendbillid and  c.vcPtypeid=b.goods_no '+querys;
             end;
        end;
      end;
    end;
  end;
  dbgCur:=dbgrid3;
  tgroup:=' group by b.goods_no,b.goods_name,b.type,b.brand,b.breed';
  Sql:=SelTop+Tname+tgroup;
  try
    screen.Cursor :=  crHourGlass;
    datas:=null;
    cdstotal.Close;
    cdstotal.Data:=null;
    cdstotal.IndexName:='';
    cdstotal.IndexDefs.Clear;
    datas:=adisp.execSql(sql);
    filedsname:=tname;
    flag:=2;
    if not varisnull(datas) then
    begin
      cdstotal.Data:=datas;
      cdstotal.Open;
      datas:=null;
      cdstotal.Last;
      tCount:=GetKeyFieldValue('id',cdstotal);
      btnpagedown.Enabled:=true;
      dbgrid1.Visible:=false;
      dbgrid2.Visible:=false;
      dbgrid3.Visible:=true;
       dbgrid3.SetFocus;
    end;
     screen.Cursor :=  crdefault;
  except
  end;

end;

procedure TfmBacthQuery.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid3.DataSource.DataSet.Active ) then exit;
   if trim(column.Field.AsString)='' then exit;
   sortgrid(column.Field.FieldName,cdstotal,dbgrid3,column);
end;

procedure TfmBacthQuery.btnpagedownClick(Sender: TObject);
var
  idcount:integer;
  temp:widestring;
  datas:olevariant;
begin
  inherited;
  screen.Cursor := crhourglass;
  case flag of
    1:
    begin
      if not cdsmtable.Active then exit;
      cdsmtable.DisableControls;
      idcount:=localcount;
      temp:=seltop+filedsname+Querys;
    end;
    2:
    begin
      if not cdsdtable.Active then exit;
      cdsdtable.DisableControls;
      idcount:=dcount;
      temp:=seltop+filedsname;
    end;
    3:
    begin
      if not cdstotal.Active then exit;
      cdstotal.DisableControls;
      idcount:=tcount;
      temp:=seltop+filedsname+Tgroup;
    end;
  end;
  try
  temp:=Temp+' and id>'+inttostr(idcount);
  datas:=null;
  try
  datas:=adisp.execsql(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    screen.Cursor :=  crdefault;
    exit;
  end;
  if not varisnull(datas) then
  begin
     case flag of
    1:
    begin
      with cdsmtable do
      begin
        close;
        AppendData(datas,true);
        open;
        last;
        LocalCount := GetKeyFieldValue('id',cdsmtable);
        cdsmtable.EnableControls;
      end;
    end;
    2:
    begin
      with cdsdtable do
      begin
        close;
        AppendData(datas,true);
        open;
        last;
        dCount := GetKeyFieldValue('id',cdsdtable);
        EnableControls;
      end;
    end;
    3:
    begin
      with cdstotal do
      begin
        close;
        AppendData(datas,true);
        open;
        last;
        tCount := GetKeyFieldValue('id',cdstotal);
        EnableControls;
      end;
    end;
  end;
  //////////////////////////////////////       dmmain.cdsquery.Last;
    //重新打开
    end else
    begin
       //不再有数据
      case flag of
        1:
        begin
          with cdsmtable do
          begin
            cdsmtable.EnableControls;
          end;
        end;
        2:
        begin
          with cdsdtable do
          begin
            EnableControls;
          end;
        end;
        3:
        begin
          with cdstotal do
          begin
            EnableControls;
          end;
        end;
      end;  
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  screen.Cursor :=  crdefault;
  btnpagedown.Enabled:=true;
end;

procedure TfmBacthQuery.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
   if (not dbgrid1.DataSource.DataSet.Active ) then exit;
   if trim(column.Field.AsString)='' then exit;
   sortgrid(column.Field.FieldName,cdsMtable,dbgrid1,column);
end;

end.
