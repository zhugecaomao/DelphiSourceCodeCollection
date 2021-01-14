unit U_general_print;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, DBClient, variants;

type
  TfrmPrint = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    SrcList: TListBox;
    DstList: TListBox;
    Panel2: TPanel;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    edtPrintTitle: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    edtLister: TEdit;
    Label5: TLabel;
    edtListDate: TEdit;
    ClientDataSet: TClientDataSet;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure DstListDblClick(Sender: TObject);
    procedure SrcListDblClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    varexcel: variant; //变体变量，指向创建的EXCEL对象
    range: variant; //变体变量，作为EXCEL一块区域的对象
    procedure GetData; //得到数据
    procedure ExportDataToExcel; //打印数据
    { Private declarations }
  public
    vps_tablename: string; //打印报表的数据源的表名称
    vps_filter: string; //打印报表的数据源的表过滤条件
    vps_index: string; //打印报表的数据源的索引
    { Public declarations }
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
  end;

var
  frmPrint: TfrmPrint;

implementation

uses comobj, excel97, u_public, main;
{$R *.DFM}
//==========================
//操作两个列表框之间的数据移动

procedure TfrmPrint.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure TfrmPrint.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure TfrmPrint.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure TfrmPrint.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure TfrmPrint.ExAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure TfrmPrint.DstListDblClick(Sender: TObject);
begin
  excludebtn.click;
end;

procedure TfrmPrint.SrcListDblClick(Sender: TObject);
begin
  includebtn.click;
end;

procedure TfrmPrint.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TfrmPrint.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
end;

function TfrmPrint.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TfrmPrint.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

//===============================

//当窗体激活的时候

procedure TfrmPrint.FormActivate(Sender: TObject);
begin
  //将当前系统日期赋给edtListDate
  edtListDate.text := formatdatetime('yyyy"年"mm"月"dd"日"', date);
  //将制表人姓名赋给edtLister
  edtLister.text := CurrentParam.userName;
  if srclist.Items.count > 0 then
  begin
    includebtn.Enabled := true;
    IncAllBtn.Enabled := true;
  end;
  if dstlist.Items.count > 0 then
  begin
    ExcludeBtn.Enabled := True;
    ExAllBtn.Enabled := true;
  end;
end;

//获取数据，根据vps_table,vps_filter,vps_index来获取数据。

procedure TfrmPrint.getData;
var
  vs_sql: string;
  Vi: integer;
begin
  //定义SQL语句，到应用服务器端提取数据
  vs_sql := 'select *' + ' from ' + vps_tablename;
  clientdataset.close;
  clientdataset.CommandText := vs_sql;
  //添加过滤条件
  clientdataset.filter := vps_filter;
  clientdataset.filtered := true;
  //定义索引
  clientdataset.IndexFieldNames := vps_index;
  clientDataset.Open;
end;

//将数据导入到EXCEL中

procedure TfrmPrint.ExportDataToExcel;
var
  i, j, k: integer;
  xxx1: string;
  xr: string;
begin
  if frmPrint.dstlist.items.count = 0 then
  begin
    application.messagebox('没有选择目标字段!', '物资管理系统', mb_iconwarning + mb_defbutton1);
    exit;
  end;
  frmPrint.statusbar1.Panels[0].text := '正在载入Excel,请稍候......';
  frmPrint.statusbar1.refresh;
  try
    screen.cursor := crHourGlass;
    try
      //创建EXCEL对象
      varexcel := createoleobject('excel.application');
      if not varisempty(varexcel) then
      begin
        //添加工作簿
        varexcel.workbooks.add;
        varexcel.workbooks[1].worksheets[1].name := '数据库信息';
      end;
    except
      application.messagebox('请确认是否安装Excel?', '提示信息：', mb_iconquestion + mb_defbutton1);
      exit;
    end;
    begin
      //获取数据
      getData;
      //写入列标题
      range := varexcel.workbooks[1].worksheets[1].columns;
      for i := 0 to frmPrint.dstlist.Items.count - 1 do begin
        varexcel.workbooks[1].worksheets[1].cells[2, i + 1].value := frmPrint.dstlist.items.strings[i];
        varexcel.workbooks[1].worksheets[1].cells[2, i + 1].Font.bold := true;
        range.columns[i + 1].columnwidth := frmPrint.clientdataset.Fieldbyname(frmPrint.dstlist.items.Strings[i]).Displaywidth;
        range.columns[I + 1].HorizontalAlignment := xlCenter;
      end;
      try
        try
          //循环写入数据到EXCEL中
          frmPrint.clientdataset.first;
          j := 3;
          while not frmPrint.clientdataset.eof do begin
            for i := 0 to frmPrint.dstlist.Items.count - 1 do begin
              xr := ''''+frmPrint.clientdataset.fieldbyname(frmPrint.dstlist.items.strings[i]).AsString;
              varexcel.workbooks[1].worksheets[1].cells[j, i + 1].value := xr;
            end;
            frmPrint.clientdataset.next;
            j := j + 1;
          end;
          varexcel.workbooks[1].worksheets[1].cells[j + 1, 2].value := '制表: ' + frmPrint.edtLister.text;
          varexcel.workbooks[1].worksheets[1].cells[j + 1, 4].value := '日期: ' + frmPrint.edtListDate.text;
        except
        end;
      finally
        frmPrint.clientdataset.enablecontrols;
        frmPrint.statusbar1.Panels[0].text := '';
        k := i - 1 + ord('A');
        xxx1 := chr(k);
        xxx1 := 'A2:' + xxx1 + inttostr(j - 1);
        //将数据表格画线
        range := varexcel.workbooks[1].worksheets[1].range[xxx1];
        range.borders.linestyle := xlcontinuous;
        k := i - 1 + ord('A');
        xxx1 := chr(k);
        xxx1 := 'a1:' + xxx1 + '1';
        //数据标题列居中
        range := varexcel.workbooks[1].worksheets[1].range[xxx1];
        range.HorizontalAlignment := xlCenter;
        range.VerticalAlignment := xlCenter;
        range.MergeCells := True;
        //对报表标题进行修饰
        varexcel.workbooks[1].worksheets[1].range['a1:a1'] := frmPrint.edtPrintTitle.text;
        varexcel.workbooks[1].worksheets[1].range['a1:a1'].font.name := '楷体';
        varexcel.workbooks[1].worksheets[1].range['a1:a1'].font.size := '18';
        varexcel.workbooks[1].worksheets[1].range['a1:a1'].font.fontstyle := 'bold';
        varexcel.visible := true;
      end;
    end;
  finally
    screen.cursor := crArrow;
  end;
end;

procedure TfrmPrint.btnCancelClick(Sender: TObject);
begin
  close;
end;


procedure TfrmPrint.btnOKClick(Sender: TObject);
begin
  //导入数据到EXCEL
  ExportDataToExcel;
end;
end.

