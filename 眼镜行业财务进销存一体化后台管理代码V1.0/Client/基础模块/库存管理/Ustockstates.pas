unit Ustockstates;

{最后修改于6-14，可以支持多级仓库使用}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ubase, Buttons, Grids, DBGrids, DB, StdCtrls, ExtCtrls, Menus,shellapi,
  DBClient;

type
  Tfrmstockstates = class(Tfrmbase)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Label2: TLabel;
    cmbtop: TComboBox;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    cdssort: TClientDataSet;
    dssort: TDataSource;
    Label4: TLabel;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel4: TPanel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    ckbtype: TCheckBox;
    ckbbreed: TCheckBox;
    ckbbrand: TCheckBox;
    cbamount: TCheckBox;
    edtamount: TEdit;
    cdspart: TClientDataSet;
    cbball: TCheckBox;
    edtBbegin: TEdit;
    Label5: TLabel;
    edtBEND: TEdit;
    cbpoll: TCheckBox;
    EDTPBEGIN: TEdit;
    Label6: TLabel;
    EDTPEND: TEdit;
    cbnroms: TCheckBox;
    EDTNORMS: TEdit;
    Cbmstorage: TCheckBox;
    cmbmstorage: TComboBox;
    cbstorages: TCheckBox;
    cmbstorages: TComboBox;
    btnprint: TBitBtn;
    procedure cmbtopChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure spbexitClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbballClick(Sender: TObject);
    procedure cbpollClick(Sender: TObject);
    procedure cbnromsClick(Sender: TObject);
    procedure CbmstorageClick(Sender: TObject);
    procedure cbstoragesClick(Sender: TObject);
    procedure cmbmstorageChange(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
    flag,LocalCount:integer;
    ps:boolean;
    procedure inistringgrid(visible:boolean);
    procedure redata;
    procedure cleardata;
  public
    { Public declarations }
    tj:string;
    tempsql,tables:string;
  end;

var
  frmstockstates: Tfrmstockstates;

implementation

uses func, untdatadm, fm_SetColumn, Udlgstock, Udlgselectdate, Unitreportxf;

{$R *.dfm}
//////////////////////////自定义函数
procedure Tfrmstockstates.redata;
var
  i,p,t,m,j,d,c:integer;
  f:boolean;
begin
  m:=stringgrid1.RowCount-1;
  stringgrid1.RowCount:=cdssort.RecordCount+1;
  t:=stringgrid1.RowCount-1;
  i:=1;
  cdssort.First;
  while not cdssort.Eof do
  begin
    f:=true;
    if  trim(stringgrid1.Cells[1,m-1])=trim(cdssort.fieldbyname('goods_no').AsString) then
    begin
      c:=0;
      j:= stringgrid1.ColCount;
      for d:=1 to j do
      begin
        if trim(stringgrid1.Cells[d,0])=trim(cdssort.fieldbyname('storage_no').AsString+'仓库') then
        begin
          c:=d;
        end;
      end;
      if c=0 then
      begin
        stringgrid1.ColCount:=stringgrid1.ColCount+1;
        stringgrid1.ColWidths[stringgrid1.ColCount-1]:=60;
        stringgrid1.Cols[stringgrid1.ColCount-1].Add(trim(cdssort.fieldbyname('storage_no').AsString+'仓库'));
        stringgrid1.Cells[stringgrid1.ColCount-1,m-1]:=trim(cdssort.fieldbyname('stock_amount').AsString );
      end else
      begin
        stringgrid1.Cells[c,m-1]:=trim(cdssort.fieldbyname('stock_amount').AsString );
      end;
      f:=false;
    end;
    if f then
    begin
      for p:=1 to dbgrid1.FieldCount-1 do
      begin
        j:=stringgrid1.ColCount-1;
        c:=0;
        if (trim(stringgrid1.Cells[1,m])<>'') and (trim(stringgrid1.Cells[2,m])<>'') and (trim(stringgrid1.Cells[3,m])<>'') and (trim(stringgrid1.Cells[4,m])<>'') and (trim(stringgrid1.Cells[5,m])<>'') and (trim(stringgrid1.Cells[6,m])<>'') and (trim(stringgrid1.Cells[7,m])<>'') and (trim(stringgrid1.Cells[8,m])<>'') and (trim(stringgrid1.Cells[9,m])<>'') then
        begin
          for d:=1 to j do
          begin
            if trim(stringgrid1.Cells[d,0])=trim(cdssort.fieldbyname('storage_no').AsString+'仓库') then
            begin
              c:=d;
            end;
          end;
        end;
        if c=0 then
        begin
         c:=p;
        end ;
        stringgrid1.Cells[c,m]:=trim(dbgrid1.Fields[p].AsString);
      end;
      inc(m);
    end;
   cdssort.Next;
  end;
  //////////////////////////////
  m:=0; //清除空白项
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    if trim(stringgrid1.Cells[1,i])='' then inc(m);
  end;
  stringgrid1.RowCount:=stringgrid1.RowCount-m;
  label4.Caption:=inttostr(strtoint(label4.Caption)+stringgrid1.RowCount-1);
  //showmessage(inttostr(stringgrid1.RowCount-1));
  ////////////////////////////////
end;
//////////////////////////////////////
procedure Tfrmstockstates.inistringgrid(visible:boolean);
var
  i:integer;
begin
  if visible then
  begin
    cleardata;
  end;
  stringgrid1.Visible:=visible;
  cdssort.First;
  if stringgrid1.ColCount<= dbgrid1.Columns.Count then
  begin
    stringgrid1.ColCount:=dbgrid1.Columns.Count;
  end;
  stringgrid1.ColWidths[0]:=-1;
  for i:=1 to dbgrid1.Columns.Count-1 do
  begin
    if  dbgrid1.Columns[i].Visible then
    begin
      stringgrid1.ColWidths[i]:=dbgrid1.Columns[i].Width;
    end else
    begin
      stringgrid1.ColWidths[i]:=-1;
    end;
    if trim(dbgrid1.Columns.Items[i].Title.Caption)<>'库存数量' then
    begin
      stringgrid1.cells[i,0]:=trim(dbgrid1.Columns[i].Title.Caption);
    end else
    begin
      stringgrid1.cells[i,0]:=trim(cdssort.fieldbyname('storage_no').AsString)+'仓库';
    end;
  end;
  redata;
end;

procedure Tfrmstockstates.cleardata;
var
  i:integer;
begin
  for i:=1 to stringgrid1.RowCount-1 do
  begin
    stringgrid1.Rows[i].Clear;
  end;
  stringgrid1.RowCount:=2;
   for i:=0 to stringgrid1.ColCount-1 do
  begin
    stringgrid1.cols[i].Clear;
  end;
  stringgrid1.ColCount:=2;
end;
/////////////////////////////////////////
procedure Tfrmstockstates.cmbtopChange(Sender: TObject);
begin
  inherited;
  tempsql:='select top '+trim(cmbtop.Text);
end;

procedure Tfrmstockstates.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  ////////////////仓库
   ///////////////////////////////
  cmbmstorage.Items.Add('本仓库'+shopid);
   ////////////////是否为总仓库

  t_sql:='select managerid from stock_manager where storageid='+''''+trim(shopid)+'''';
  datas:= null;
  ipubtemp.ty_query(t_sql,datas);
  if varisnull(datas) then
  begin
    ps:=true;
  end else
  begin
    ps:=false;
  end;
  ///////////////////////////
  if ps then
  begin
    t_sql:='select storage_no from  [storage] where storage_type<>'+''''+'门店仓库'+''''+' and storage_no<>'+''''+trim(shopid)+'''';
    cdspart.Close;
    cdspart.Data:=null;
    datas:=null;
    ipubtemp.ty_query(t_sql,datas);
    if not varisnull(datas) then
    begin
      cdspart.Data:=datas;
      cdspart.Open;
      datas:=null;
      while not cdspart.Eof do
      begin
        cmbmstorage.Items.Add('配送仓库'+trim(cdspart.fieldbyname('storage_no').AsString));
        cdspart.Next;
      end;
      cdspart.Close;
      cdspart.Data:=null;
    end;
  end;
  cmbmstorage.ItemIndex := 0;
  cmbmstorageChange(cmbmstorage);
  cmbmstorage.ItemIndex := -1;
  ////////////////////////////
  dbgCur:=dbgrid1;
  cmbtop.ItemIndex:=0;
  tempsql:='select top '+trim(cmbtop.Text);
  tables:=' * from vSelectGoods';
  cdssort.Close;
  cdssort.Data:=null;
  stringgrid1.FixedCols:=2;
end;

procedure Tfrmstockstates.BitBtn2Click(Sender: TObject);
begin
  inherited;
  //if dmmain.CDSquery.Active  then  exit;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
  if stringgrid1.Visible then
  inistringgrid(true);
end;

procedure Tfrmstockstates.BitBtn1Click(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
  str,str1:string;
  i,j:integer;
  zt:boolean;
begin
  inherited;
    cdssort.Close;
    cdssort.Data:=null;
    tj:=' where 1=1 ';
    str1:='';
    zt:=false;
    if not ps then
    begin
      str1:=' (';
      for j:=0 to cmbstorages.Items.Count-2 do
      begin
        i:=pos('仓库', trim(cmbstorages.Items.Strings[j]));
        if i>0 then
        begin
          str1:=str1+''''+copy(trim(cmbstorages.Items.Strings[j]),i+4,length(trim(cmbstorages.Items.Strings[j])))+''''+',';
        end else
        begin
          str1:=str1+''''+trim(cmbstorages.Items.Strings[j])+''''+',';
        end;
      end;
      str1:=str1+''''+trim(shopid)+''''+',';
    end;
     if cbmstorage.Checked then
    begin
      str1:=' (';
      i:=pos('仓库', trim(cmbmstorage.Text));
      if i>0 then
      begin
        str1:=str1+''''+copy(trim(cmbmstorage.Text),i+4,length(trim(cmbmstorage.Text)))+''''+',';
      end else
      begin
        str1:=str1+''''+trim(cmbmstorage.Text)+''''+',';
      end;
      zt:=true;
    end ;
    if cbstorages.Checked then
    begin
      if trim(cmbstorages.Text)<>'全部仓库' then
      begin
        if not zt then str1:=' (';
        str1:=str1+''''+trim(cmbstorages.Text)+''''+',';
      end else
      begin
        if not cbmstorage.Checked then str1:=' (';
        for j:=0 to cmbstorages.Items.Count-2 do
        begin
          i:=pos('仓库', trim(cmbstorages.Items.Strings[j]));
          if i>0 then
          begin
            str1:=str1+''''+copy(trim(cmbstorages.Items.Strings[j]),i+4,length(trim(cmbstorages.Items.Strings[j])))+''''+',';
          end else
          begin
            str1:=str1+''''+trim(cmbstorages.Items.Strings[j])+''''+',';
          end;
        end;
      end;
    end;
    if trim(str1)<>'' then
    begin
      str1:=copy(str1,1,length(str1)-1);
      str1:=str1+')';
      tj:=tj+'and storage_no in '+trim(str1);
    end;
    if ckbtype.Checked then tj:=tj+'and type='+''''+trim(cbtype.Text)+'''';
    if ckbbrand.Checked then tj:=tj+'and brand='+''''+trim(cbbrand.Text)+'''';
    if ckbbreed.Checked then tj:=tj+'and breed='+''''+trim(cbbreed.Text)+'''';
    if cbamount.Checked then tj:=tj+'and stock_amount='+trim(edtamount.Text);
    if cbball.Checked then tj:=tj+' and dball<='+trim(edtbbegin.Text)+' and dball>='+trim(edtbend.Text);
    if cbpoll.Checked then tj:=tj+' and dpoll<='+trim(edtpbegin.Text)+' and dpoll>='+trim(edtpend.Text);
    if cbnroms.Checked then tj:=tj+' and norms_type='+''''+trim(edtnorms.Text)+'''';
    screen.Cursor :=  crHourGlass;
    temp:=tempsql+tables+tj;
    try
    datas:=adisp.GetRecord(temp);
    except
      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
      screen.Cursor :=  crdefault;
      exit;
    end;
       ////////////////////////////////
      if  not varisnull(datas) then
      begin
      cdssort.Data:=datas;
      cdssort.Open;
      datas:=null;
      cdssort.Last;
      LocalCount := GetKeyFieldValue('id',cdssort);   //传入具体字段
      btnpagedown.Enabled:=true;
      with cdssort.IndexDefs.AddIndexDef do
      begin
        Fields := 'goods_no';  //
        Options := [];
      end;
      cdssort.IndexDefs.Update;
      cdssort.Open;
      //if trim(str1)<>'' then tj:=tj+str1;
      stringgrid1.Visible:=false;
      dbgrid1.Visible:=true;
      setdbgrid(dbgrid1,3);
      end;
      screen.Cursor :=  crdefault;
end;

procedure Tfrmstockstates.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
  if not cdssort.Active then exit;
    screen.Cursor := crhourglass;
   cdssort.DisableControls;
  try
  temp:=tempsql+tables+tj+' and id>'+inttostr(localcount);
  datas:=null;
  try
  datas:=adisp.GetRecord(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    screen.Cursor :=  crdefault;
    exit;
  end;
  if not varisnull(datas) then
  begin
    cdssort.Close;
    cdssort.Open;
    cdssort.AppendData(datas,true);
    datas:=null;
    cdssort.Last;
     LocalCount := GetKeyFieldValue('id',cdssort);   //传入具体字段
     ////////////////////////////////
    with cdssort.IndexDefs.AddIndexDef do
    begin
      Fields := 'goods_no';  //
      Options := [];
    end;
    cdssort.IndexDefs.Update;
    cdssort.Open;
  //////////////////////////////////////       dmmain.cdsquery.Last;
    //重新打开
      cdssort.EnableControls;
     setdbgrid(dbgrid1,3);
    end else
    begin
       //不再有数据
        cdssort.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  if stringgrid1.Visible then
  begin
    stringgrid1.RowCount:=2;
    redata;
  end;
  screen.Cursor :=  crdefault;
  btnpagedown.Enabled:=true;
end;

procedure Tfrmstockstates.spbexitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrmstockstates.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin       
  inherited ;
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
  with sender as tstringgrid do
  begin
    FixedCols:=1;
  end;
end;

procedure Tfrmstockstates.N3Click(Sender: TObject);
begin
  inherited;
   dbgrid1.Visible:=true;
   stringgrid1.Visible:=false;
end;

procedure Tfrmstockstates.N4Click(Sender: TObject);
begin
  inherited;
  if not cdssort.Active then
  begin
     application.MessageBox('请先查询数据！',pchar(application.Title),mb_iconinformation);
     bitbtn1.SetFocus;
     exit;
  end;
   dbgrid1.Visible:=false;
   stringgrid1.Visible:=true;
   inistringgrid(true);
end;
procedure Tfrmstockstates.BitBtn3Click(Sender: TObject);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  BitBtn3MouseDown(sender,mbLeft,[ssLeft],p.X,p.Y);
end;

procedure Tfrmstockstates.BitBtn3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  PopupMenu2.Popup(P.x,P.y);

end;

procedure Tfrmstockstates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
end;

procedure Tfrmstockstates.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
   if trim(column.Field.AsString)='' then exit;
   sortgrid(column.Field.FieldName,cdssort,dbgrid1,column);
end;

procedure Tfrmstockstates.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbtype,cbtype);
  CBTypeChange(cbtype);
end;

procedure Tfrmstockstates.ckbbrandClick(Sender: TObject);
begin
  inherited;
   ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure Tfrmstockstates.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure Tfrmstockstates.cbamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbamount,edtamount);
end;

procedure Tfrmstockstates.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  //调品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;

end;

procedure Tfrmstockstates.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
 // if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cbbrand.text)+'''' +' and type =' +''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
end;

procedure Tfrmstockstates.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,3);
end;

procedure Tfrmstockstates.cbballClick(Sender: TObject);
begin
  inherited;
  ckbedits(cbball,EDTBBEGIN,edtbend);
end;

procedure Tfrmstockstates.cbpollClick(Sender: TObject);
begin
  inherited;
  ckbedits(cbpoll,EDTpBEGIN,edtpend);
end;

procedure Tfrmstockstates.cbnromsClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbnroms,edtnorms);
end;

procedure Tfrmstockstates.CbmstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbmstorage,cmbmstorage);
end;

procedure Tfrmstockstates.cbstoragesClick(Sender: TObject);
begin
  inherited;
    ckbcmb(cbstorages,cmbstorages);
end;

procedure Tfrmstockstates.cmbmstorageChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  t_sql:='select storageid from stock_manager where managerid='+''''+trim(copy(trim(cmbmstorage.Text),pos('仓库',trim(cmbmstorage.Text))+4,length(trim(cmbmstorage.Text))))+'''';
  GetDataToComBoX(cmbstorages,t_sql,'storageid');
  cmbstorages.Items.Add('全部仓库');
  cmbstorages.ItemIndex:=-1;
end;

procedure Tfrmstockstates.btnprintClick(Sender: TObject);
begin
  inherited;
  if trim(stringgrid1.Cells[1,stringgrid1.RowCount-1])<>'' then
  begin
    fastrepxf:=tfastrepxf.Create(self);
    fastrepxf.filenames:='OrderGoods.ini';
    //fastrepxf.RepSGrid.RangeEnd := reCount;
    GetCopyGrid(fastrepxf.SGridData,stringgrid1);
    fastrepxf.SGridData.Enabled:=true;
    fastrepxf.ShowModal;
    fastrepxf.Free;
  end;
end;

end.
