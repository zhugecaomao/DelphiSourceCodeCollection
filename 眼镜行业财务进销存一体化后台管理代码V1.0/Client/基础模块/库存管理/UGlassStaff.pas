unit UGlassStaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ustockstates, Menus, DB, DBClient, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls;

type
  TfmGlassStaff = class(Tfrmstockstates)
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CbmstorageClick(Sender: TObject);
    procedure cbstoragesClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
     tj:string;
     PS:BOOLEAN;
    tempsql,tables,groups:string;
    //flag,LocalCount:integer;
    procedure gridtitle(colcounts:integer);
    function ReadData():boolean;
    function ClearNull(Grids:Tstringgrid):boolean;
  public
    { Public declarations }
  end;

var
  fmGlassStaff: TfmGlassStaff;

implementation

uses untdatadm, func, Unitreportxf;

{$R *.dfm}
///////////////////////
procedure tfmGlassStaff.gridtitle(colcounts:integer);
var
  i:integer;
  j:double;
begin
  stringgrid1.ColCount:=colcounts+1;
  //stringgrid1.rowCount:=colcounts+2;
  j:=0.00;
  for i:=1 to stringgrid1.rowCount do
  begin
    stringgrid1.Rows[i].Clear;
    if i<>stringgrid1.rowCount-1 then
    begin
      stringgrid1.cells[0,i]:=format('%2.2f',[j]);
    end else
    begin
      stringgrid1.Cells[0,i]:='合计：';
    end;
    j:=j-0.25;
  end;
  j:=0.00;
  for i:=1 to colcounts do
  begin
    stringgrid1.Cells[i,0]:=format('%2.2f',[j]);
    j:=j-0.25;
    stringgrid1.ColWidths[i]:=40;
  end;
end;
function tfmglassstaff.ReadData():boolean;
var
  i,col,row:integer;
begin
  result:=false;
  col:=0;
  row:=0;
  while not cdssort.Eof do
  begin
    for i:=1 to stringgrid1.ColCount-1 do
    begin
      if format('%2.2F',[cdssort.FieldByName('dpoll').asfloat])=trim(stringgrid1.Cells[i,0]) then
      begin
        col:=i;
      end;
      if format('%2.2f',[cdssort.FieldByName('dball').asfloat])=trim(stringgrid1.Cells[0,i]) then
      begin
        row:=i;
      end;
    end;
    if (col>0) and (row>0) then
    begin
      stringgrid1.Cells[col,row]:=trim(cdssort.FieldByName('amount').AsString);
      if trim(stringgrid1.Cells[col,stringgrid1.RowCount-1])='' then
      begin
        stringgrid1.Cells[col,stringgrid1.RowCount-1]:='0';
      end;
      stringgrid1.Cells[col,stringgrid1.RowCount-1]:=inttostr(strtoint(stringgrid1.Cells[col,stringgrid1.RowCount-1])+strtoint(stringgrid1.Cells[col,row]));
    end;
    cdssort.Next;
  end;
end;

function TfmGlassStaff.ClearNull(Grids:Tstringgrid):boolean;
var
  i:integer;
  j:double;
begin
  j:=0.00;
  for i:=1 to grids.ColCount-1 do
  begin
    if trim(grids.cols[i].Text)=format('%2.2f',[j])then
    begin
       grids.ColWidths[i]:=-1;
    end;
    j:=j-0.25;
  end;
  j:=0.00;
  for i:=1 to grids.rowCount-1 do
  begin
    if trim(grids.rows[i].Text)=format('%2.2f',[j])then
    begin
       grids.RowHeights[i]:=-1;
    end else
    begin
       grids.RowHeights[i]:=30;
    end;
    j:=j-0.25;
  end;
end;
////////////////////////
procedure TfmGlassStaff.N3Click(Sender: TObject);
begin
 // inherited;
  gridtitle(25);
end;

procedure TfmGlassStaff.N4Click(Sender: TObject);
begin
  //inherited;
  gridtitle(41);
end;

procedure TfmGlassStaff.BitBtn1Click(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
  str,str1:string;
  i,j:integer;
  zt:boolean;
begin
  //inherited;

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
  /////////////////////////
  if ckbtype.Checked then tj:=tj+'and type='+''''+trim(cbtype.Text)+'''';
  if ckbbrand.Checked then tj:=tj+'and brand='+''''+trim(cbbrand.Text)+'''';
  if ckbbreed.Checked then tj:=tj+'and breed='+''''+trim(cbbreed.Text)+'''';
  if cbball.Checked then tj:=tj+' and dball<='+trim(edtbbegin.Text)+' and dball>='+trim(edtbend.Text);
  if cbpoll.Checked then tj:=tj+' and dpoll<='+trim(edtpbegin.Text)+' and dpoll>='+trim(edtpend.Text);
  if cbnroms.Checked then tj:=tj+' and norms_type='+''''+trim(edtnorms.Text)+'''';
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
    //LocalCount := GetKeyFieldValue('id',cdssort);   //传入具体字段
    with cdssort.IndexDefs.AddIndexDef do
    begin
      Fields := 'goods_no';  //
      Options := [];
    end;
    cdssort.IndexDefs.Update;
    cdssort.Open;
    stringgrid1.Visible:=true;
    gridtitle(stringgrid1.ColCount-1);
    readdata;
    ClearNull(stringgrid1);
    end else
    begin
      application.MessageBox('没有数据！',pchar(application.Title),mb_iconinformation);
      gridtitle(stringgrid1.ColCount-1);
    end;
  screen.Cursor :=  crdefault;
end;

procedure TfmGlassStaff.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  //inherited;
  //////////品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;
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
  //dbgCur:=dbgrid1;
  cmbtop.ItemIndex:=0;
  tempsql:='select  sum(stock_amount) as amount,dball,dpoll';
  tables:=' from vSelectGoods';
  groups:=' group by dball,dpoll';
  cdssort.Close;
  cdssort.Data:=null;
  gridtitle(25);
end;

procedure TfmGlassStaff.ckbtypeClick(Sender: TObject);
begin
  //inherited;

end;

procedure TfmGlassStaff.cbamountClick(Sender: TObject);
begin
  //inherited;

end;

procedure TfmGlassStaff.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  stringgrid1.FixedCols:=1;
end;

procedure TfmGlassStaff.CbmstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbmstorage,cmbmstorage);
end;

procedure TfmGlassStaff.cbstoragesClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbstorages,cmbstorages);
end;

procedure TfmGlassStaff.BitBtn2Click(Sender: TObject);
begin
  //inherited;
end;

procedure TfmGlassStaff.btnprintClick(Sender: TObject);
begin
  //inherited;
  if trim(stringgrid1.Rows[stringgrid1.RowCount-1].text)<>trim(stringgrid1.Cells[stringgrid1.RowCount-1,0]) then
  begin
    fastrepxf:=tfastrepxf.Create(self);
    fastrepxf.filenames:='GlassesGoods.ini';
    //fastrepxf.RepSGrid.RangeEnd := reCount;
    GetCopyGrid(fastrepxf.SGridData,stringgrid1);
    fastrepxf.SGridData.Enabled:=true;
    fastrepxf.ShowModal;
    fastrepxf.Free;
  end;
end;

end.
