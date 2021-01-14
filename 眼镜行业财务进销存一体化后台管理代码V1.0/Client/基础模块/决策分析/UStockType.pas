unit UStockType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, DBClient, StdCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, Menus;

type
  TFmStockType = class(TfmBase)
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Gridbase: TStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cmbtop: TComboBox;
    Panel4: TPanel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    ckbtype: TCheckBox;
    ckbbreed: TCheckBox;
    ckbbrand: TCheckBox;
    Cbmstorage: TCheckBox;
    cmbmstorage: TComboBox;
    cdssort: TClientDataSet;
    cdspart: TClientDataSet;
    cbstorages: TCheckBox;
    cmbstorages: TComboBox;
    dsview: TDataSource;
    btnprint: TBitBtn;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure cmbmstorageChange(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure CbmstorageClick(Sender: TObject);
    procedure cbstoragesClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure GridbaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
     flag,LocalCount:integer;
     tj:string;
    tempsql,tables,groups:string;
    pS:boolean;
    procedure inistringgrid(visible:boolean);
    procedure redata;
    procedure cleardata;
  public
    { Public declarations }
  end;

var
  FmStockType: TFmStockType;

implementation

uses untdatadm, func,fm_SetColumn, Unitreportxf;

{$R *.dfm}
//////////////////////////自定义函数(完成加载数据，初始化，清除数据TSTRINGGRID)
procedure TFmStockType.redata;
var
  i,p,t,m,j,d,c:integer;
  f:boolean;
begin
  m:=Gridbase.RowCount-1;
  Gridbase.RowCount:=cdssort.RecordCount+1;
  t:=Gridbase.RowCount-1;
  i:=1;
  cdssort.First;
  while not cdssort.Eof do
  begin
    f:=true;
    if  trim(Gridbase.Cells[3,m-1])=trim(cdssort.fieldbyname('breed').AsString) then
    begin
      c:=0;
      j:= Gridbase.ColCount;
      for d:=1 to j do
      begin
        if trim(Gridbase.Cells[d,0])=trim(cdssort.fieldbyname('storage_no').AsString+'仓库') then
        begin
          c:=d;
        end;
      end;
      if c=0 then
      begin
        Gridbase.ColCount:=Gridbase.ColCount+1;
        Gridbase.ColWidths[Gridbase.ColCount-1]:=60;
        Gridbase.Cols[Gridbase.ColCount-1].Add(trim(cdssort.fieldbyname('storage_no').AsString+'仓库'));
        Gridbase.Cells[Gridbase.ColCount-1,m-1]:=trim(cdssort.fieldbyname('stock_amount').AsString );
      end else
      begin
        Gridbase.Cells[c,m-1]:=trim(cdssort.fieldbyname('stock_amount').AsString );
      end;
      f:=false;
    end;
    if f then
    begin
      for p:=1 to dbgrid1.FieldCount-1 do
      begin
        j:=gridbase.ColCount-1;
        c:=0;
        if (trim(Gridbase.Cells[1,m])<>'') and (trim(Gridbase.Cells[2,m])<>'') and (trim(Gridbase.Cells[3,m])<>'') then
        begin
          for d:=1 to j do
          begin
            if trim(Gridbase.Cells[d,0])=trim(cdssort.fieldbyname('storage_no').AsString+'仓库') then
            begin
              c:=d;
            end;
          end;
        end;
        if c=0 then
        begin
         c:=p;
        end ;
        Gridbase.Cells[c,m]:=trim(dbgrid1.Fields[p].AsString);
      end;
      inc(m);
    end;
   cdssort.Next;
  end;
  //////////////////////////////
  m:=0; //清除空白项
  for i:=1 to Gridbase.RowCount-1 do
  begin
    if trim(Gridbase.Cells[1,i])='' then inc(m);
  end;
  Gridbase.RowCount:=Gridbase.RowCount-m;
  label4.Caption:=inttostr(strtoint(label4.Caption)+Gridbase.RowCount-1);
  //showmessage(inttostr(Gridbase.RowCount-1));
  ////////////////////////////////
end;
//////////////////////////////////////
procedure TFmStockType.inistringgrid(visible:boolean);
var
  i:integer;
begin
  if visible then
  begin
    cleardata;
  end;
  Gridbase.Visible:=visible;
  if Gridbase.ColCount<= dbgrid1.Columns.Count then
  begin
    Gridbase.ColCount:=dbgrid1.Columns.Count;
  end;
  Gridbase.ColWidths[0]:=-1;
  cdssort.First;
  for i:=1 to dbgrid1.Columns.Count-1 do
  begin
    if  dbgrid1.Columns[i].Visible then
    begin
      Gridbase.ColWidths[i]:=dbgrid1.Columns[i].Width;
    end else
    begin
      Gridbase.ColWidths[i]:=-1;
    end;
    if (trim(dbgrid1.Columns.Items[i].Title.Caption)<>'库存数量') then
    begin
      Gridbase.cells[i,0]:=trim(dbgrid1.Columns[i].Title.Caption);
    end else
    begin
      Gridbase.cells[i,0]:=trim(cdssort.fieldbyname('storage_no').AsString)+'仓库';
    end;
  end;
  redata;
end;

procedure TFmStockType.cleardata;
var
  i:integer;
begin
  for i:=1 to Gridbase.RowCount-1 do
  begin
    Gridbase.Rows[i].Clear;
  end;
  Gridbase.RowCount:=2;
  for i:=0 to Gridbase.ColCount-1 do
  begin
    Gridbase.cols[i].Clear;
  end;
  Gridbase.ColCount:=2;
end;
/////////////////////////////////////////
procedure TFmStockType.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFmStockType.BitBtn1Click(Sender: TObject);
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
    if ckbtype.Checked then tj:=tj+'and type='+''''+trim(cbtype.Text)+'''';
    if ckbbrand.Checked then tj:=tj+'and brand='+''''+trim(cbbrand.Text)+'''';
    if ckbbreed.Checked then tj:=tj+'and breed='+''''+trim(cbbreed.Text)+'''';
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
    screen.Cursor :=  crHourGlass;
    temp:=tempsql+tables+tj+groups;
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
        Fields := 'type';  //
        Options := [];
      end;
      cdssort.IndexDefs.Update;
      cdssort.Open;
      Gridbase.Visible:=false;
      dbgrid1.Visible:=true;
      setdbgrid(dbgrid1,3);
      end;
      screen.Cursor :=  crdefault;

end;

procedure TFmStockType.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;

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
  tables:=' max(id) as id ,sum(stock_amount) as stock_amount,type,brand,breed,storage_no,storage_name from vSelectGoods';
  groups:=' group by type,brand,breed,storage_no,storage_name';
  cdssort.Close;
  cdssort.Data:=null;
  Gridbase.FixedCols:=2;

end;

procedure TFmStockType.BitBtn2Click(Sender: TObject);
begin
  inherited;
   with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
  if Gridbase.Visible then
  inistringgrid(true);
end;

procedure TFmStockType.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
  if not cdssort.Active then exit;
    screen.Cursor := crhourglass;
   cdssort.DisableControls;
  try
  temp:=tempsql+tables+tj+' and id>='+inttostr(LocalCount)+groups;
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
    cdssort.Last;
    LocalCount := GetKeyFieldValue('id',cdssort);   //传入具体字段
     ////////////////////////////////
    with cdssort.IndexDefs.AddIndexDef do
    begin
      Fields := 'type';  //
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
  gridbase.Visible:=false;
  dbgrid1.Visible:=true;
  screen.Cursor :=  crdefault;

end;

procedure TFmStockType.N3Click(Sender: TObject);
begin
  inherited;
   dbgrid1.Visible:=true;
   Gridbase.Visible:=false;
end;

procedure TFmStockType.N4Click(Sender: TObject);
begin
  inherited;
   if not cdssort.Active then
  begin
     application.MessageBox('请先查询数据！',pchar(application.Title),mb_iconinformation);
     bitbtn1.SetFocus;
     exit;
  end;
   dbgrid1.Visible:=false;
   gridbase.FixedCols:=1;
   Gridbase.Visible:=true;
   inistringgrid(true);
end;

procedure TFmStockType.cmbmstorageChange(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
  t_sql:='select storageid from stock_manager where managerid='+''''+trim(copy(trim(cmbmstorage.Text),pos('仓库',trim(cmbmstorage.Text))+4,length(trim(cmbmstorage.Text))))+'''';
  GetDataToComBoX(cmbstorages,t_sql,'storageid');
  cmbstorages.Items.Add('全部仓库');
  cmbstorages.ItemIndex:=-1;
end;

procedure TFmStockType.ckbtypeClick(Sender: TObject);
begin
  inherited;
   ckbcmb(ckbtype,cbtype);
    CBTypeChange(cbtype);
end;

procedure TFmStockType.ckbbrandClick(Sender: TObject);
begin
  inherited;
   ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure TFmStockType.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure TFmStockType.CbmstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbmstorage,cmbmstorage);
end;

procedure TFmStockType.cbstoragesClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbstorages,cmbstorages);
end;

procedure TFmStockType.BitBtn3Click(Sender: TObject);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  BitBtn3MouseDown(sender,mbLeft,[ssLeft],p.X,p.Y);
end;

procedure TFmStockType.BitBtn3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  PopupMenu2.Popup(P.x,P.y);

end;

procedure TFmStockType.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if not cdssort.Active then exit;
   if trim(column.Field.AsString)='' then exit;
 sortgrid(column.Field.FieldName,cdssort,dbgrid1,column);
end;

procedure TFmStockType.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
   setdbgrid(dbgrid1,3);
end;

procedure TFmStockType.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  //调品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;

end;

procedure TFmStockType.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cbbrand.text)+'''' +' and type =' +''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
end;

procedure TFmStockType.GridbaseDrawCell(Sender: TObject; ACol,
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
end;

procedure TFmStockType.btnprintClick(Sender: TObject);
begin
  inherited;
   if trim(gridbase.Cells[1,gridbase.RowCount-1])<>'' then
  begin
    fastrepxf:=tfastrepxf.Create(self);
    fastrepxf.filenames:='OrderGoods.ini';
    //fastrepxf.RepSGrid.RangeEnd := reCount;
    GetCopyGrid(fastrepxf.SGridData,gridbase);
    fastrepxf.SGridData.Enabled:=true;
    fastrepxf.ShowModal;
    fastrepxf.Free;
  end;
end;

end.
