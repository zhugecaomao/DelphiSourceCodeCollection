unit fm_BaseQueryStr;
//YDY CREATE 2004-2-19
///ydy modify 2004-4-12 用于采用新的查询方法dmmain.dsquery
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base,  StdCtrls, Buttons,
  ExtCtrls,  Grids, DBGrids, DBCtrls,DB, DBClient;

type
  TfmBaseQueryStr = class(TfmBase)
    Panel2: TPanel;
    btnExit: TBitBtn;
    btnQuery: TBitBtn;
    btnColumn: TBitBtn;
    btnPrivew: TBitBtn;
    btnChart: TBitBtn;
    DBGrid1: TDBGrid;
    btnpagedown: TBitBtn;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    edtRecNo: TEdit;
    edtTime: TEdit;
    LblSort: TLabel;
    BtnSort: TBitBtn;
    Bevel1: TBevel;
    procedure btnQueryClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure btnChartClick(Sender: TObject);
    procedure btnPrivewClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnSortClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
     function GetKeyFieldValue(sortField:string) : OleVariant;
  end;

var
  fmBaseQueryStr: TfmBaseQueryStr;
  LocalCount:integer;   //直接根据本地的值上传查询
  Sqlstr:wideString;

implementation
uses
  fm_SetColumn ,untdatadm, func;
{$R *.dfm}

procedure TfmBaseQueryStr.btnQueryClick(Sender: TObject);
begin
  inherited;
  //先关闭数据集   YDY 2004-2-18主要是未了解决排序出错的问题
  //清除索引键  2004-2-19 一切OK
  dmMain.dsquery.IndexName :='';
  dmMain.dsquery.IndexDefs.Update;
  dmMain.dsquery.Data := null;    //客户端内存减少
  dmmain.dsquery.Close;
//  dmMain.dsquery.Data := null;    //客户端内存减少
//  if dmmain.dsquery.Active then dmmain.dsquery.Close;

//全部采用dmMain.dsquery来处理数据

end;

procedure TfmBaseQueryStr.btnExitClick(Sender: TObject);
begin
  inherited;
  //ydy 此处还需考虑

//ydy 注意  先后对速度的影响相当大
   dmmain.dsquery.Data := null; //客户端内存减少
   dmMain.dsquery.Close;   //ydy add
   //清除索引键  2004-2-19 一切OK
   dmMain.dsquery.IndexName :='';
   dmMain.dsquery.IndexDefs.Update;

  close;

end;

//列设置
procedure TfmBaseQueryStr.btnColumnClick(Sender: TObject);
begin
  inherited;
  if not DBGrid1.DataSource.DataSet.Active then  exit;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

//调图表统计
procedure TfmBaseQueryStr.btnChartClick(Sender: TObject);
begin
  inherited;
{
  with TfmSingleGuestChart.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
}
end;



//报表打印预览
procedure TfmBaseQueryStr.btnPrivewClick(Sender: TObject);
begin
  inherited;
  {if not DBGrid1.DataSource.DataSet.Active then  exit;
  fastrepxf:=tfastrepxf.Create(nil);
  try
  fastrepxf.filenames:='singleguest.ini';
  fastrepxf.frReportxf.Dataset:=dmmain.frDBSingleGuest;
  fastrepxf.ShowModal;
  finally
  fastrepxf.Free;
  end;}
end;

//////////////////////////////////////
//取得目前在TCLIENTDATASET中最后一笔数据的键值
function TfmBaseQueryStr.GetKeyFieldValue(sortField:string): OleVariant;
var
aCDS : TClientDataSet;
begin
aCDS:=TClientDataSet.Create(Self);
try
try
if not varisnull(dmmain.dsquery.Data) then
begin
///如果重新按其他列排序后，此处可能不对了 ！！ydy
aCDS.Data:=dmmain.dsquery.Data;  //ClientDataSet1.Data;
//ydy 2004-2-18 add
    WITH acds do begin
        IndexName := '';
        IndexDefs.Update;
    end;
    with aCDs.IndexDefs.AddIndexDef do
        begin
          Fields := sortField;  //不同表此处不同'sg_id'; //AFields;
          Options := [];
        end;
aCDs.IndexDefs.Update;
///////////

aCDS.Last;
//Result:=aCDS.FieldByName('SG_id').Value;
Result:=aCDS.FieldByName(sortfield).Value;
end;
finally // wrap up
aCDS.Free ;
end; // try/finally
except
on e: Exception do
raise;
end; // try/except
end;

procedure TfmBaseQueryStr.FormActivate(Sender: TObject);
begin
  inherited;
  //ydy add   2004-2-18
  dbgCur:=dbgrid1;
    //先关闭数据集   YDY 2004-2-18主要是未了解决排序出错的问题
//   dmmain.dsquery.Close;
   //清除索引键  2004-2-19 一切OK
//此处用要出错
   dmMain.dsquery.IndexName :='';
   dmMain.dsquery.IndexDefs.Update;

   dmMain.dsquery.Data := null;    //客户端内存减少


end;


//排序条件
procedure TfmBaseQueryStr.BtnSortClick(Sender: TObject);
begin
  inherited;
// if not (Screen.ActiveControl is TDBGrid) then exit;    //??

   {if not DBGrid1.DataSource.DataSet.Active then  exit;
   frmSetSort:= tfrmSetSort.Create(nil);
   try
   //设置执行FORM的标题
   frmsetSort.RunFormCaption := self.caption;
   frmSetSort.dbgSS := DBGRID1; //TDBGrid(Screen.ActiveControl);
   frmSetSort.ShowModal;
   finally
   frmsetsort.Free;
   end;
   Lblsort.Caption :=ReturnSortString; }

end;



procedure TfmBaseQueryStr.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
   if (dbgrid1.DataSource = nil) or
     (DBGrid1.DataSource.Dataset = nil) then exit;
  // 不同行的颜色
  if (DBGrid1.DataSource.DataSet.RecNo mod 2) = 0 then
    DBGrid1.Canvas.Brush.Color := clSilver
  else
    DBGrid1.Canvas.Brush.Color := $00EAEAEA;//clgray;
    dbgrid1.DefaultDrawColumnCell(rect,datacol,column,state);
  //选择行的颜色
  with TDBGrid(Sender) do begin
    if gdSelected in State then Canvas.Brush.Color := clTeal;  //clBlue;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;


end.
