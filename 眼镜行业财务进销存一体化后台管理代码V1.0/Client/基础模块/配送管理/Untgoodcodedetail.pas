unit Untgoodcodedetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntgoodCodeSelPei, DB, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons;

type
  TfmgoodCodedetail = class(TfmgoodCodeSelPei)
    procedure CbBreedChange(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure CBTypeKeyPress(Sender: TObject; var Key: Char);
    procedure CBTypeChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    LocalCount:integer;
  public
    { Public declarations }
    billtyped:string;
  end;

var
  fmgoodCodedetail: TfmgoodCodedetail;

implementation

uses untdatadm, func, UntPosSendBill;

{$R *.dfm}

procedure TfmgoodCodedetail.CbBreedChange(Sender: TObject);
var
  t_sql:string;
  quedata:olevariant;
  //TempInterface: IromecheckDisp;   //ydy modify
begin                        //配送申请;
  //inherited;
////////////查询数据

    if cbbrand.Text = '' then exit;

    screen.Cursor := crhourglass;
    btnpagedown.Enabled:=true;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;
   t_sql:='select top 20 *  from  VPSSQ  where iBilltype='+trim(billtyped)+' and type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
   T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and storage_no='+''''+trim(shopid)+''''+' and VCOfficeID='+''''+trim(officeid)+'''';

  try
   ipubtemp.ty_query(t_sql,quedata);
   if not varisnull(quedata) then
    begin
     if dmmain.DSquery.Active then dmmain.dsquery.Close;
      dmmain.dsquery.Open;
      dmmain.dsquery.Data:=quedata;
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
  end;

  dbgrid1.Refresh;   //ydy add 2004-4-13
  //释放接口
  screen.Cursor :=  crdefault;

end;

procedure TfmgoodCodedetail.btnpagedownClick(Sender: TObject);
var
  i:Integer;
  t_sql,str1,strend:wideString;
  quedata:olevariant;
  lStart, lEnd : Integer;
begin
  inherited;
//   lStart := GetTickCount;
     if not dmmain.DSquery.Active then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;

    if combobox1.Text = '全部' then
    begin
    t_sql:='select *  from  VPSSQ  where iBilltype='+trim(billtyped)+' and type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
     T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and storage_no='+''''+trim(shopid)+''''+' and VCOfficeID='+''''+trim(officeid)+'''';

    end
    else
    begin
    t_sql:='select top ' + trim(ComboBox1.Text) +' * from VPSSQ  where iBilltype='+trim(billtyped)+' and type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    end;

    T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and storage_no='+''''+trim(shopid)+''''+' and VCOfficeID='+''''+trim(officeid)+'''';
    str1 := ' and  id > '+ inttostr(localcount);

    strend := T_sql + str1;

///getmore 必须判断LOCALCOUNT是否大于RECORDCOUNT，如果大于则不执行。 条件更改以后必须重新为0

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
  end;

  screen.Cursor :=  crdefault;

end;

procedure TfmgoodCodedetail.btnQueryClick(Sender: TObject);
var x,i,countmy:integer;
   BookmarkList: TBookmarkList;
   TempBookmark: TBookmark;
begin
  //inherited;
  with DBgrid1.SelectedRows do
  if Count > 0 then
  begin
     if show_mode = '配送收货单' then
          begin
          countmy :=FmPosSendBill.sgorder.RowCount -1;
          FmPosSendBill.sgorder.RowCount := FmPosSendBill.sgorder.RowCount + count -1;   ///新行数
          TempBookmark:= DBGrid1.Datasource.Dataset.GetBookmark;
          for x:= 0 to Count - 1 do
          begin
            if IndexOf(Items[x]) > -1 then
            begin
              DBGrid1.Datasource.Dataset.Bookmark:= Items[x];
              //得到选定的数据
          //    showmessage(DBGrid1.Datasource.Dataset.Fields[1].AsString);

              with  FmPosSendBill do
              begin
                sgorder.cells[0,countmy+ x] := inttostr(countmy+ x);
                sgorder.Cells[1,countmy+ x] := trim(DBGrid1.Datasource.Dataset.fieldbyname('type').AsString);
                sgorder.Cells[2,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('Goods_NO').AsString);
                sgorder.Cells[3,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('Goods_Name').AsString);
                sgorder.Cells[6,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('base_unit').AsString);
                sgorder.Cells[7,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('totalamount').AsString);//要货数量;
                sgorder.Cells[8,countmy +x] := trim('0');//要货数量;
                sgorder.Cells[21,countmy +x] := trim(inttostr(DBGrid1.Datasource.Dataset.Fieldbyname('stock_amount').AsInteger));
                sgorder.Cells[19,countmy +x ] := '0000100001';    ////???
                sgorder.Cells[16,countmy +x ] := '10';
              end;
            end;
          end;
          DBGrid1.Datasource.Dataset.GotoBookmark(TempBookmark);
          DBGrid1.Datasource.Dataset.FreeBookmark(TempBookmark);
         end;

  end else
  begin
    Application.MessageBox('您没有选择商品，请选定商品！',pchar(application.Title),mb_iconinformation);
    exit;
  end;

  DBGrid1.Datasource.Dataset.EnableControls;
  close;
end;

procedure TfmgoodCodedetail.FormShow(Sender: TObject);
begin
  //inherited;
  if trim(cbtype.Text)<>'' then
  begin
    cbtypechange(cbtype);
  end;
end;                                      

procedure TfmgoodCodedetail.cbBrandChange(Sender: TObject);
var
  sqlpub:widestring;
begin
  //inherited;
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  sqlpub:='select DISTINCT  breed from VPSSQ where brand='+''''+trim(cbbrand.text)+''''+' and vcofficeid='+''''+trim(officeid)+'''';
  GetDataToComBoX(cbBreed,sqlpub,'breed');
  cbBreed.ItemIndex := -1;
  //cbbreed.Clear;
end;

procedure TfmgoodCodedetail.CBTypeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key<>#13 then key:=#0;
end;

procedure TfmgoodCodedetail.CBTypeChange(Sender: TObject);
var
  sqlpub:widestring;
begin
  inherited;
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  sqlpub:='select DISTINCT  brand from VPSSQ where type='+''''+trim(cbtype.text)+''''+' and vcofficeid='+''''+trim(officeid)+'''';
  GetDataToComBoX(cbBrand,sqlpub,'brand');
  cbBrand.ItemIndex := -1;
end;

procedure TfmgoodCodedetail.DBGrid1DblClick(Sender: TObject);
var
  rows:integer;
begin
  //inherited;
   if show_mode='配送收货单' then
  begin
    with FmPosSendBill do
    begin
      rows:=sgorder.RowCount;
      if  sgorder.Cells[1,rows-1] = '' then rows := rows -1   //ydy 2004-14 add
      else  sgorder.RowCount := sgorder.RowCount + 1;
       sgorder.Cells[0,rows] := inttostr(rows);   //编号
      sgorder.Cells[1,rows]:=trim(dmmain.dsquery.fieldbyname('type').AsString);
      sgorder.Cells[2,rows]:=trim(dmmain.dsquery.fieldbyname('goods_no').AsString);
      sgorder.Cells[3,rows]:=trim(dmmain.dsquery.fieldbyname('goods_name').AsString);
      sgorder.Cells[6,rows] := trim(dmmain.dsquery.Fieldbyname('base_unit').AsString);
      sgorder.Cells[7,rows] := trim(dmmain.dsquery.Fieldbyname('totalamount').AsString);//要货数量;
       sgorder.Cells[8,rows] := '0';
      sgorder.Cells[21,rows] := trim(inttostr(dmmain.dsquery.Fieldbyname('stock_amount').AsInteger));
      sgorder.Cells[19,rows ] := '0000100001';   
      sgorder.Cells[16,rows ] := '10';
      dmmain.dsquery.Close;
      self.close;
    end;
  end;
end;

end.
