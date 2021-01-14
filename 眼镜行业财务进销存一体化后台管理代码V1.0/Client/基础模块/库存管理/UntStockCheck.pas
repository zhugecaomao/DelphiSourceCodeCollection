unit UntStockCheck;
///2004-2-19 根据基础窗口fm_basequery 来写的 ydy
//2004-3-23ydy 根据新的商品编码来写
////2004-4-12 ydy create 用于选择商品编码和条码等信息 专门用于对stringgrid的赋值

/////////根据 UntgoodCodeSelStr修改而来
//////2004-4-14 专门修改用于商品库存查询和上下限显示  ydy created



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons,DB, fm_BaseQueryStr,
  FR_PTabl;


type
  TFmStockCheck = class(TfmBaseQueryStr)
    Panel3: TPanel;
    Label2: TLabel;
    CBType: TComboBox;
    Label4: TLabel;
    cbBrand: TComboBox;
    Label3: TLabel;
    CbBreed: TComboBox;
    DataSource1: TDataSource;
    frPrintGrid1: TfrPrintGrid;
    CopyCode: TBitBtn;
    Edit1: TEdit;
    procedure btnpagedownClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure CbBreedChange(Sender: TObject);
    procedure btnChartClick(Sender: TObject);
    procedure CopyCodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    show_mode:string;
  end;

var
  FmStockCheck: TFmStockCheck;

implementation

uses func, untdatadm;

var
  LocalCount:integer;   //直接根据本地的值上传查询
  Sqlstr:wideString;


{$R *.dfm}

procedure TFmStockCheck.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
//拷贝编号
CopyCodeClick(sender);
end;

procedure TFmStockCheck.FormActivate(Sender: TObject);
begin
  inherited;
end;

///
procedure TFmStockCheck.btnpagedownClick(Sender: TObject);
var
  i:Integer;
  t_sql,str1,strend:wideString;
  quedata:olevariant;
  //2004-2-10为了优化程序性能   速度已提高到52秒
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
    t_sql:='select  *  from  [VStockCheck] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+'''';
    end
    else
    begin
    t_sql:='select top ' + trim(ComboBox1.Text) +' *  from  [VStockCheck] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    end;

    T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+'''';
    str1 := ' and  id > '+ inttostr(localcount);

    strend := T_sql + str1;

///getmore 必须判断LOCALCOUNT是否大于RECORDCOUNT，如果大于则不执行。 条件更改以后必须重新为0

  try
    //ydy add

//    if dmmain.dsquery.Active then dmmain.dsquery.Close;
      //ydy modify
    ipubtemp.ty_query(strend,quedata);
    //dmmain.SocketConn.AppServer.qurrecords(str,quedata);
    if not varisnull(quedata) then
    begin
     if dmmain.dsquery.Active then dmmain.dsquery.Close;
      dmmain.dsquery.Open;
      dmmain.dsquery.AppendData(quedata,true);

      ///ydy add
       dmmain.dsquery.Last;
    //  dmmain.dsquery.MergeChangeLog;
    //重新打开
      dmmain.dsquery.EnableControls;
      //得到此次查询的键值
      LocalCount := GetKeyFieldValue('id');   //传入具体字段
//   lEnd := GetTickCount;
//   edtRecNo.Text := '当前记录号为'+IntToStr(localCount)+'共有'+inttostr(dmmain.dsquery.recordcount) +'条';
    edtRecNo.Text := '当前共有'+inttostr(dmmain.dsquery.recordcount) +'条';
//   edtTime.Text := FloatToStr((lEnd - lStart) / 1000.0) + '秒';

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


procedure TFmStockCheck.FormShow(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
//  t_sql:='select distinct type  from  [goods_code]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
end;

procedure TFmStockCheck.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  //调品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;

end;

procedure TFmStockCheck.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
end;

procedure TFmStockCheck.CbBreedChange(Sender: TObject);
var
  t_sql:string;
  quedata:olevariant;
begin
  inherited;
////////////查询数据

    if cbbrand.Text = '' then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;
   t_sql:='select top 20 *  from  [VStockCheck] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
   T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+'''';

  try

//    dmmain.pd_socket.AppServer.ty_query(t_sql,quedata);
   ipubtemp.ty_query(t_sql,quedata);  //.qurrecords(t_sql,quedata);
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
  screen.Cursor :=  crdefault;
end;

procedure TFmStockCheck.btnChartClick(Sender: TObject);
begin
  inherited;
{if  varisnull(dmmain.dsquery.Data) then exit;
frprintgrid1.DBGrid :=dbgrid1;
//直接用缺省的打印预览窗口
//frprintgrid1.ShowReport;
//用自定义的窗口
FrmMyPreview := TFrmMyPreview.Create(self);
frprintgrid1.Preview := FrmMyPreview.frPreview1;

frPrintGrid1.ShowReport;
try
FrmMyPreview.ShowModal;
finally
FrmMyPreview.free;
end;

frprintgrid1.DBGrid :=nil;}

end;

procedure TFmStockCheck.CopyCodeClick(Sender: TObject);
begin
  inherited;
   if not DBGrid1.DataSource.DataSet.Active then  exit;
//   if  varisnull(dmmain.cdsnewpub.Data) then exit;
  edit1.Text := trim(dbgrid1.Fields[0].AsString);
  edit1.SelectAll;
  edit1.CopyToClipboard;
end;

end.
