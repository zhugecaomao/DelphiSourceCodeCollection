unit UntgoodscodeRe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntgoodCodeSelStr, DB, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons, DBClient;

type
  TfmgoodCodeRE = class(TfmgoodCodeSelStr)
    procedure CbBreedChange(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTypeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    LocalCount:integer;
  public
    { Public declarations }
    ShowMode:integer;
  end;

var  fmgoodCodeRE: TfmgoodCodeRE;

implementation

uses untdatadm, Stock_Contract, func, fm_SetColumn;

{$R *.dfm}

procedure TfmgoodCodeRE.CbBreedChange(Sender: TObject);
var
  t_sql:string;
  quedata:olevariant;
begin
  //inherited;
////////////查询数据
   edtRecNo.Text:='';
   if cbbrand.Text = '' then exit;
   screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;
   if showmode=0 then
   begin
     t_sql:='select top 20 *  from  [VRequirement] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
     DBGrid1.Columns.Items[5].Visible:=false;
   end;
   if showmode=2 then
   begin
     t_sql:='select top 20 *  from  [VYDgoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
     DBGrid1.Columns.Items[5].Visible:=true;
   end;
   T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and amount >0 ';

   try
  if dmmain.DSquery.Active then dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
   ipubtemp.ty_query(t_sql,quedata);  //.qurrecords(t_sql,quedata);
   if not varisnull(quedata) then
    begin
      dmmain.dsquery.Data:=quedata;
      dmmain.dsquery.Open;
      ///ydy add
       dmmain.dsquery.Last;
       edtRecNo.Text := '当前已下载: '+inttostr(dmmain.dsquery.recordcount)+'条';

    //重新打开
      dmmain.dsquery.EnableControls;
      dbgrid1.Refresh;
      //得到此次查询的键值
     LocalCount := GetKeyFieldValue('id');   //传入具体字段

    end else
    begin
       //不再有数据
        dmmain.dsquery.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
    dmmain.dsquery.EnableControls;
    dbgrid1.Refresh;
  end;
  dmmain.dsquery.EnableControls;
  dbgrid1.Refresh;   //ydy add 2004-4-13
  screen.Cursor :=  crdefault;

end;

procedure TfmgoodCodeRE.btnpagedownClick(Sender: TObject);
var
  i:Integer;
  t_sql,str1,strend:wideString;
  quedata:olevariant;
  //2004-2-10为了优化程序性能   速度已提高到52秒
  lStart, lEnd : Integer;
begin
  //inherited;
//   lStart := GetTickCount;
     if not dmmain.DSquery.Active then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;
  if combobox1.Text = '全部' then
  begin
    if showmode=0 then
    begin
      t_sql:='select  *  from  [VRequirement] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    end;
    if showmode=2 then
    begin
      t_sql:='select  *  from  [Vydgoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    end;
  end else
  begin
    if showmode=0 then
    begin
      t_sql:='select top ' + trim(ComboBox1.Text) +' *  from  [VRequirement] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    end;
    if showmode=2 then
    begin
       t_sql:='select top ' + trim(ComboBox1.Text) +' *  from  [Vydgoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    end;
  end;
  T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and amount >0 ';
  str1 := ' and  id > '+ inttostr(localcount);
  strend := T_sql + str1;
  try
   ipubtemp.ty_query(strend,quedata);
    if not varisnull(quedata) then
    begin
     if dmmain.dsquery.Active then dmmain.dsquery.Close;
      dmmain.dsquery.Open;
      dmmain.dsquery.AppendData(quedata,true);
       dmmain.dsquery.Last;
      dmmain.dsquery.EnableControls;
      //得到此次查询的键值
      LocalCount := GetKeyFieldValue('id');   //传入具体字段
    edtRecNo.Text := '当前共有'+inttostr(dmmain.dsquery.recordcount) +'条';
    end else
    begin
       //不再有数据
        dmmain.dsquery.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  dmmain.dsquery.EnableControls;
    dbgrid1.Refresh;
  end;
  dmmain.dsquery.EnableControls;
  dbgrid1.Refresh;
  screen.Cursor :=  crdefault;
end;

procedure TfmgoodCodeRE.DBGrid1DblClick(Sender: TObject);
var
  rows:integer;
begin
  //inherited;
  if not dmmain.DSquery.Active then
  begin
    if dbgrid1.SelectedRows.Count < 1 then
    Application.MessageBox('请指定出售的商品',pchar(application.Title),mb_iconinformation);
    exit;
  end;
   with frm_Stock_Contract do
    begin
    rows:=stringgrid1.RowCount;
    if  stringgrid1.Cells[1,rows-1] = '' then rows := rows -1   //ydy 2004-14 add
    else stringgrid1.RowCount := stringgrid1.RowCount + 1;
    stringgrid1.Cells[0,rows] := inttostr(rows);   //编号
    stringgrid1.Cells[1,rows]:=trim(dmmain.dsquery.fieldbyname('goods_no').AsString);
    stringgrid1.Cells[2,rows]:=trim(dmmain.dsquery.fieldbyname('goods_name').AsString);
    stringgrid1.Cells[3,rows]:='0';
    stringgrid1.Cells[4,rows]:=trim(dmmain.dsquery.fieldbyname('amount').AsString);
    stringgrid1.Cells[5,rows]:='0';
    stringgrid1.Cells[6,rows]:=trim(dmmain.dsquery.fieldbyname('type').AsString);
    stringgrid1.Cells[7,rows]:=trim(dmmain.dsquery.fieldbyname('provider').AsString);
    if showmode=2 then
    begin
      stringgrid1.Cells[8,rows] := trim(dmmain.dsquery.fieldbyname('GoodsMemo').AsString);
      stringgrid1.Cells[9,rows] := trim(dmmain.dsquery.fieldbyname('VcBillNo').AsString);
    end;
    dmmain.dsquery.Close;
    self.close;
   end;
end;

procedure TfmgoodCodeRE.btnQueryClick(Sender: TObject);
var
   x,i,countmy:integer;
   BookmarkList: TBookmarkList;
   TempBookmark: TBookmark;
begin
  if not dmmain.DSquery.Active then
    begin
      if dbgrid1.SelectedRows.Count < 1 then
      Application.MessageBox('请指定出售的商品',pchar(application.Title),mb_iconinformation);
      exit;
  end;
  DBGrid1.Datasource.Dataset.DisableControls;
  countmy :=frm_stock_contract.stringgrid1.RowCount;
  if frm_stock_contract.stringgrid1.Cells[1,countmy-1] = '' then      ///最后一行为新增加的新行 2004-4-14 add
  countmy := countmy -1;
  with DBgrid1.SelectedRows do
  if Count > 0 then
  begin
    frm_stock_contract.stringgrid1.RowCount := countmy + count ;      ///2004-4-14 new ydy
    TempBookmark:= DBGrid1.Datasource.Dataset.GetBookmark;
    for x:= 0 to Count - 1 do
    begin
      if IndexOf(Items[x]) > -1 then
      begin
        DBGrid1.Datasource.Dataset.Bookmark:= Items[x];
  //得到选定的数据
        with  frm_stock_contract do
        begin
          with stringgrid1 do
          begin
            cells[0,countmy+ x] := inttostr(countmy+ x);
            Cells[1,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('Goods_NO').AsString);
            Cells[2,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('Goods_Name').AsString);
            Cells[3,countmy +x]:='0';
            Cells[4,countmy +x]:=trim(DBGrid1.Datasource.Dataset.Fieldbyname('amount').AsString);;
            Cells[5,countmy +x]:='0';
            Cells[6,countmy+ x] := trim(DBGrid1.Datasource.Dataset.fieldbyname('type').AsString);
            Cells[7,countmy+ x] := trim(DBGrid1.Datasource.Dataset.fieldbyname('provider').AsString);
            if showmode=2 then
            begin
              Cells[8,countmy+ x] := trim(DBGrid1.Datasource.Dataset.fieldbyname('GoodsMemo').AsString);
              Cells[9,countmy+ x] := trim(DBGrid1.Datasource.Dataset.fieldbyname('VcBillNo').AsString);
            end;
          end;
       end;
     end;
   end;
  DBGrid1.Datasource.Dataset.GotoBookmark(TempBookmark);
  DBGrid1.Datasource.Dataset.FreeBookmark(TempBookmark);
  end else
  begin
    Application.MessageBox('您没有选择商品，请选定商品！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  DBGrid1.Datasource.Dataset.EnableControls;
  close;
end;

procedure TfmgoodCodeRE.btnColumnClick(Sender: TObject);
begin
  inherited;
  dbgCur:=dbgrid1;
   if not DBGrid1.DataSource.DataSet.Active then  exit;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmgoodCodeRE.cbBrandChange(Sender: TObject);
var
  sqlpub:widestring;
begin
  //inherited;
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  if showmode=0 then
  begin
    sqlpub:='select DISTINCT  breed from [VRequirement] where amount>0 and  brand='+''''+trim(cbbrand.text)+'''';
  end;
  if showmode=2 then
  begin
    sqlpub:='select DISTINCT  breed from [Vydgoods] where amount>0 and  brand='+''''+trim(cbbrand.text)+'''';
  end;
  GetDataToComBoX(cbBreed,sqlpub,'breed');
  cbBreed.ItemIndex := -1;
  edtRecNo.Clear;
end;

procedure TfmgoodCodeRE.CBTypeChange(Sender: TObject);
var
  sqlpub:widestring;
begin
  //inherited;
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  if showmode=0 then
  begin
    sqlpub:='select DISTINCT  brand from [VRequirement] where amount>0 and  type='+''''+trim(cbtype.text)+'''';
  end;
  if showmode=2 then
  begin
    sqlpub:='select DISTINCT  brand from [Vydgoods] where amount>0 and  type='+''''+trim(cbtype.text)+'''';
  end;
  GetDataToComBoX(cbBrand,sqlpub,'brand');
  cbBrand.ItemIndex := -1;
  edtRecNo.Clear;
end;

procedure TfmgoodCodeRE.FormShow(Sender: TObject);
begin
  //inherited;
  dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
  if trim(cbtype.Text)<>'' then
  begin
    cbtypechange(cbtype);
  end;
end;

procedure TfmgoodCodeRE.CBTypeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key<>#13 then key:=#0; 
end;

end.
