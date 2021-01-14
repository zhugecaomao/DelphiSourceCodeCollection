unit onlygoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, StdCtrls, Buttons, ExtCtrls, DB, DBGrids;

type
  Tfmonlygoods = class(TfmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    Gridbase: TStringGrid;
    BitBtn1: TBitBtn;
    btnprint: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure GridbaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
    procedure formini;
    function readdata(goods_no:string;storageid:string;varyear:string):integer;
  public
    { Public declarations }
    no,stockid,years,typed,brand,breed:string;
    Fb:boolean;
  end;

var
  fmonlygoods: Tfmonlygoods;
implementation


uses untdatadm, func, UDlgonlygoods, Unitreportxf;
{$R *.dfm}

///////////////////
procedure tfmonlygoods.formini;
var
  i:integer;
begin
  Gridbase.ColWidths[0]:=180;
  Gridbase.Cells[0,1]:='销售数量';    /////
  Gridbase.Cells[0,2]:='销售金额';
  Gridbase.Cells[0,3]:='销售利润';
  Gridbase.Cells[0,4]:='占该商品库存数量比例';
  Gridbase.Cells[0,5]:='占该商品库存金额比例';
  Gridbase.Cells[0,6]:='占该商品库存利润比例';
  Gridbase.Cells[0,7]:='月销售数量占全年销售数量比例';
  Gridbase.Cells[0,8]:='月销售金额占全年销售金额比例';
  Gridbase.Cells[0,9]:='月销售利润占全年销售利润比例';
  for i:=1 to 12 do
  begin
    Gridbase.Cells[i,0]:=inttostr(i)+'月';
  end;
  Gridbase.Cells[13,0]:='全年合计';
end;
function Tfmonlygoods.readdata(goods_no:string;storageid:string;varyear:string):integer;
var
  i,j:integer;
  tj:array [1..6] of double;
  datas:olevariant;
  sqlpub:widestring;
begin
  j:=1; //没数据！！
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  datas:=null;
  if not fb then
  begin
    sqlpub:='exec onlygoodsstaff'+''''+trim(varyear)+''''+','+''''+trim(goods_no)+''''+','+''''+trim(storageid)+'''';
    caption:='单品分析';
  end else
  begin
    sqlpub:='exec onlybreedstaff'+''''+trim(varyear)+''''+','+''''+trim(typed)+''''+','+''''+trim(brand)+''''+','+''''+trim(breed)+''''+','+''''+trim(storageid)+'''';
    caption:='单品种分析';
  end;
  try
  datas:=adisp.execSql(sqlpub);
  if not varisnull(datas) then
  begin
    dmmain.CDSexecsql.Data:=datas;
    dmmain.CDSexecsql.Open;
    datas:=null;
    j:=2 ;//有数据
  end;
  for i:=1 to 6 do
    tj[i]:=0;
  for i:=0 to 11 do
  begin
    Gridbase.Cells[i+1,1]:=floattostr(dmmain.CDSexecsql.Fields.Fields[2+7*i].AsFloat);
    tj[1]:=tj[1]+dmmain.CDSexecsql.Fields.Fields[2+7*i].AsFloat;
    Gridbase.Cells[13,1]:=floattostr(tj[1]);

    Gridbase.Cells[i+1,2]:=floattostr(dmmain.CDSexecsql.Fields.Fields[3+7*i].AsFloat);
    tj[2]:=tj[2]+dmmain.CDSexecsql.Fields.Fields[3+7*i].AsFloat;
    Gridbase.Cells[13,2]:=floattostr(tj[2]);


    Gridbase.Cells[i+1,3]:=floattostr(dmmain.CDSexecsql.Fields.Fields[4+7*i].AsFloat);
    tj[3]:=tj[3]+dmmain.CDSexecsql.Fields.Fields[4+7*i].AsFloat;
    Gridbase.Cells[13,3]:=floattostr(tj[3]);


    Gridbase.Cells[i+1,4]:=floattostr(dmmain.CDSexecsql.Fields.Fields[5+7*i].AsFloat*100)+'%';
    tj[4]:=tj[4]+dmmain.CDSexecsql.Fields.Fields[5+7*i].AsFloat;
    Gridbase.Cells[13,4]:=floattostr(tj[4]);

    Gridbase.Cells[i+1,5]:=floattostr(dmmain.CDSexecsql.Fields.Fields[6+7*i].AsFloat*100)+'%';
    tj[5]:=tj[5]+dmmain.CDSexecsql.Fields.Fields[6+7*i].AsFloat;
    Gridbase.Cells[13,5]:=floattostr(tj[5]);

    Gridbase.Cells[i+1,6]:=floattostr(dmmain.CDSexecsql.Fields.Fields[8+7*i].AsFloat*100)+'%';
    tj[6]:=tj[6]+dmmain.CDSexecsql.Fields.Fields[8+7*i].AsFloat;
    Gridbase.Cells[13,6]:=floattostr(tj[6]);
  end;
  for i:=0 to 11 do
  begin
    if (tj[1]>0)  then
    begin
      Gridbase.Cells[i+1,7]:=floattostr(strtofloat(Gridbase.Cells[i+1,1])/tj[1]*100)+'%';
    end else
    begin
      Gridbase.Cells[i+1,7]:='0';
    end;
    if tj[2]>0 then
    begin
      Gridbase.Cells[i+1,8]:=floattostr(strtofloat(Gridbase.Cells[i+1,2])/tj[2]*100)+'%';
    end else
    begin
      Gridbase.Cells[i+1,8]:='0';
    end;
     if tj[3]>0 then
    begin
      Gridbase.Cells[i+1,9]:=floattostr(strtofloat(Gridbase.Cells[i+1,3])/tj[3]*100)+'%';
    end else
    begin
      Gridbase.Cells[i+1,9]:='0';
    end;
  end;
  except
    j:=3;//发生错误;
  end;
  result:=j;
end;
procedure Tfmonlygoods.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmonlygoods.GridbaseDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
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

procedure Tfmonlygoods.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  DlgOnlyGoods:=tDlgOnlyGoods.Create(self);
  DlgOnlyGoods.ShowModal;
  DlgOnlyGoods.Free;
  i:=readdata(no,stockid,years);
  if i=1 then
  begin
    application.MessageBox('没有该商品的分析数据！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
   if i=3 then
  begin
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure Tfmonlygoods.FormShow(Sender: TObject);
var
  i:integer;
begin
  inherited;
  formini;
  DlgOnlyGoods:=tDlgOnlyGoods.Create(self);
  DlgOnlyGoods.ShowModal;
  DlgOnlyGoods.Free;
  i:=readdata(no,stockid,years);
  if i=1 then
  begin
    application.MessageBox('没有该商品的分析数据！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if i=3 then
  begin
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure Tfmonlygoods.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  inherited;

end;

procedure Tfmonlygoods.btnprintClick(Sender: TObject);
begin
  inherited;
  if trim(gridbase.Cells[1,gridbase.RowCount-1])<>'' then
  begin
    fastrepxf:=tfastrepxf.Create(self);
    fastrepxf.filenames:='OnlyGoods.ini';
    //fastrepxf.RepSGrid.RangeEnd := reCount;
    GetCopyGrid(fastrepxf.SGridData,gridbase);
    fastrepxf.SGridData.Enabled:=true;
    fastrepxf.ShowModal;
    fastrepxf.Free;
  end;
end;

end.
