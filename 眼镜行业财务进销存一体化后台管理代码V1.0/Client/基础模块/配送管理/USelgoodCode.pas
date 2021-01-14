unit USelgoodCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntgoodCodeSelStr, DB, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons;

type
  TfmSelgoodCode = class(TfmgoodCodeSelStr)
    RDB1: TRadioButton;
    RDB2: TRadioButton;
    procedure CbBreedChange(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RDB1Click(Sender: TObject);
    procedure RDB2Click(Sender: TObject);
  private
    { Private declarations }
    LocalCount,IFlag:integer;
    group:string;
  public
    { Public declarations }
    show_mode:string;
    billtyped:string;
    storage_no:string;
  end;

var
  fmSelgoodCode: TfmSelgoodCode;

implementation

uses func, untdatadm, UUnPos;

{$R *.dfm}

procedure TfmSelgoodCode.CbBreedChange(Sender: TObject);
var
  t_sql:string;
  quedata:olevariant;
begin
  //inherited;
////////////查询数据


    if cbbrand.Text = '' then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;
   if iflag=1 then
   begin
     t_sql:='select top 20 sum(NQty) as NQty, goods_no,goods_name,type,stock_amount,id from  VUNPos  where iBilltype='+trim(billtyped)+' and type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
     T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and VCOfficeID='+''''+trim(officeid)+''''+' and storage_no='+''''+trim(shopid)+''''+' and vcstockid='+''''+trim(storage_no)+'''';
     t_sql:=t_sql+group ;
   end else
   begin
     t_sql:='select top 20 *  from  [vSelectGoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
     T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and storage_no='+''''+trim(shopid)+'''';
   end;
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
     LocalCount :=GetKeyFieldValue('id');   //传入具体字段

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

  dbgrid1.Refresh;
  screen.Cursor :=  crdefault;


end;

procedure TfmSelgoodCode.btnpagedownClick(Sender: TObject);
var
  t_sql:string;
  quedata:olevariant;
begin
  //inherited;
////////////查询数据

    if cbbrand.Text = '' then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;
   if iflag=1 then
   begin
   t_sql:='select top 20 sum(NQty) as NQty ,goods_no,goods_name,type,stock_amount,id from  VUNPos  where iBilltype='+trim(billtyped)+' and type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
   T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and VCOfficeID='+''''+trim(officeid)+''''+' and storage_no='+''''+trim(shopid)+''''+' and vcstockid='+''''+trim(storage_no)+'''';
   t_sql:=t_sql+' and id>'+inttostr(LocalCount)+group ;
   end else
   begin
     t_sql:='select top 20 *  from  [vSelectGoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
     T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and storage_no='+''''+trim(shopid)+'''';
     t_sql:=t_sql+' and id>'+inttostr(LocalCount);
   end;
  try
   ipubtemp.ty_query(t_sql,quedata);
   if not varisnull(quedata) then
    begin
     if dmmain.DSquery.Active then dmmain.dsquery.Close;
      dmmain.dsquery.Open;
      dmmain.dsquery.AppendData(quedata,true);
      dmmain.dsquery.Last;
      edtRecNo.Text := '当前已下载: '+inttostr(dmmain.dsquery.recordcount)+'条';
      dmmain.dsquery.EnableControls;
      dbgrid1.Refresh;
     LocalCount :=GetKeyFieldValue('id');   //传入具体字段
    end else
    begin
      dmmain.dsquery.EnableControls;        //ydy  必须要
      btnpagedown.Enabled := false;
      screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  dbgrid1.Refresh;
  screen.Cursor :=  crdefault;
end;

procedure TfmSelgoodCode.btnQueryClick(Sender: TObject);
var x,i,countmy:integer;
   BookmarkList: TBookmarkList;
   TempBookmark: TBookmark;
begin
  //inherited;
  with DBgrid1.SelectedRows do
  if Count > 0 then
  begin
     if show_mode = '配送退货单' then
          begin
          countmy :=fmUnPosSendBill.sgorder.RowCount -1;
          fmUnPosSendBill.sgorder.RowCount := fmUnPosSendBill.sgorder.RowCount + count -1;   ///新行数
          TempBookmark:= DBGrid1.Datasource.Dataset.GetBookmark;
          for x:= 0 to Count - 1 do
          begin
            if IndexOf(Items[x]) > -1 then
            begin
              DBGrid1.Datasource.Dataset.Bookmark:= Items[x];
              //得到选定的数据
          //    showmessage(DBGrid1.Datasource.Dataset.Fields[1].AsString);

              with  fmUnPosSendBill do
              begin
                sgorder.cells[0,countmy+ x] := inttostr(countmy+ x);
                sgorder.Cells[1,countmy+ x] := trim(DBGrid1.Datasource.Dataset.fieldbyname('type').AsString);
                sgorder.Cells[2,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('Goods_NO').AsString);
                sgorder.Cells[3,countmy +x] := trim(DBGrid1.Datasource.Dataset.Fieldbyname('Goods_Name').AsString);
                sgorder.Cells[6,countmy +x] := trim('0');
                sgorder.Cells[7,countmy +x] := trim('0');//要货数量;
                sgorder.Cells[8,countmy +x] := trim('0');//要货数量;
                if iflag=1 then
                begin
                  sgorder.Cells[21,countmy +x] := trim(inttostr(DBGrid1.Datasource.Dataset.Fieldbyname('NQty').AsInteger));
                end else
                begin
                  sgorder.Cells[21,countmy +x] :=trim(inttostr(DBGrid1.Datasource.Dataset.Fieldbyname('stock_amount').AsInteger)); 
                end;
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

procedure TfmSelgoodCode.DBGrid1DblClick(Sender: TObject);
var
  rows:integer;
begin
  //inherited;
   if show_mode='配送退货单' then
  begin
    with fmUnPosSendBill do
    begin
      rows:=sgorder.RowCount;
      if  sgorder.Cells[1,rows-1] = '' then rows := rows -1
      else  sgorder.RowCount := sgorder.RowCount + 1;
       sgorder.Cells[0,rows] := inttostr(rows);   //编号
      sgorder.Cells[1,rows]:=trim(dmmain.dsquery.fieldbyname('type').AsString);
      sgorder.Cells[2,rows]:=trim(dmmain.dsquery.fieldbyname('goods_no').AsString);
      sgorder.Cells[3,rows]:=trim(dmmain.dsquery.fieldbyname('goods_name').AsString);
      sgorder.Cells[6,rows] := trim('0');
      sgorder.Cells[7,rows] := trim('0');//要货数量;
      sgorder.Cells[8,rows] := trim('0');
      if iflag=1 then
      begin
        sgorder.Cells[21,rows] := trim(inttostr(dmmain.dsquery.Fieldbyname('NQty').AsInteger));
      end else
      begin
        sgorder.Cells[21,rows] :=trim(inttostr(dmmain.dsquery.Fieldbyname('stock_amount').AsInteger));;
      end;
      sgorder.Cells[19,rows ] := '0000100001';
      sgorder.Cells[16,rows ] := '10';
      dmmain.dsquery.Close;
      self.close;
    end;
  end;

end;

procedure TfmSelgoodCode.FormShow(Sender: TObject);
begin
  inherited;
  group :=' group by goods_no,goods_name,type,stock_amount,id';
  iflag:=1;
end;

procedure TfmSelgoodCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMMAIN.DSquery.Close;
  dmmain.DSquery.Data:=null;
  inherited;

end;

procedure TfmSelgoodCode.RDB1Click(Sender: TObject);
begin
  inherited;
  dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
  Iflag:=1;
end;

procedure TfmSelgoodCode.RDB2Click(Sender: TObject);
begin
  inherited;
  dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
  Iflag:=0;
  dbgrid1.Columns.Items[4].Visible:=false;
end;

end.
