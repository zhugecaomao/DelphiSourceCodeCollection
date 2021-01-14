//往来单位决策分析
//5-26；
unit UntWldwStaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, Grids, ExtCtrls, DB, DBClient,
  DBGrids, Menus, ComCtrls, ImgList, Edit1;

type
  TfmWldwStaff = class(TfmBase)
    PageC1: TPageControl;
    TabGoods: TTabSheet;
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
    Gridbase: TStringGrid;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbtop: TComboBox;
    Panel4: TPanel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    ckbtype: TCheckBox;
    ckbbreed: TCheckBox;
    ckbbrand: TCheckBox;
    cbwldw: TCheckBox;
    edtwldw: TEdit;
    Cbmstorage: TCheckBox;
    cmbmstorage: TComboBox;
    cbstorages: TCheckBox;
    cmbstorages: TComboBox;
    dsview: TDataSource;
    cdssoft: TClientDataSet;
    cdspart: TClientDataSet;
    TabBackGoods: TTabSheet;
    TabFinace: TTabSheet;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    Cmbtype: TComboBox;
    Cmbbrand: TComboBox;
    Cmbbreed: TComboBox;
    Chbtype: TCheckBox;
    ChBbreed: TCheckBox;
    Chbbrand: TCheckBox;
    Chbwldw: TCheckBox;
    Edtgeher: TEdit;
    ChbMstorage: TCheckBox;
    CmbBmstorage: TComboBox;
    Chbstorage: TCheckBox;
    CmbbStorage: TComboBox;
    Panel7: TPanel;
    GridBack: TStringGrid;
    DBGrid2: TDBGrid;
    Panel8: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ImageList1: TImageList;
    TabSheet1: TTabSheet;
    Panel9: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Panel10: TPanel;
    StringGrid1: TStringGrid;
    DBGrid3: TDBGrid;
    Panel11: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Panel12: TPanel;
    Chbcode: TCheckBox;
    Edtcode: TEdit;
    ChbName: TCheckBox;
    Edtname: TEdit;
    ChbtotalYs: TCheckBox;
    ChbTotalYf: TCheckBox;
    ChBXY: TCheckBox;
    EdtTotalYS: TEdit1;
    EdTTotalYf: TEdit1;
    Edtxy: TEdit1;
    Panel13: TPanel;
    Panel14: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Panel15: TPanel;
    Label8: TLabel;
    Panel16: TPanel;
    Cbname: TCheckBox;
    EdTSup_no: TEdit;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    ckbnewDate: TCheckBox;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    RB1: TRadioButton;
    RB2: TRadioButton;
    DBGrid4: TDBGrid;
    btnprint: TBitBtn;
    BitBtn18: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    CBinput: TCheckBox;
    dtpinputB: TDateTimePicker;
    dtpinputE: TDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    cbcancel: TCheckBox;
    dtpcancelB: TDateTimePicker;
    dtpcancelE: TDateTimePicker;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure GridbaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbwldwClick(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure CbmstorageClick(Sender: TObject);
    procedure cbstoragesClick(Sender: TObject);
    procedure cmbmstorageChange(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ChbtypeClick(Sender: TObject);
    procedure ChbbrandClick(Sender: TObject);
    procedure ChBbreedClick(Sender: TObject);
    procedure ChbMstorageClick(Sender: TObject);
    procedure ChbstorageClick(Sender: TObject);
    procedure ChbwldwClick(Sender: TObject);
    procedure CmbtypeChange(Sender: TObject);
    procedure CmbbrandChange(Sender: TObject);
    procedure CmbBmstorageChange(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure BitBtn10Click(Sender: TObject);
    procedure ChbcodeClick(Sender: TObject);
    procedure ChbNameClick(Sender: TObject);
    procedure ChbtotalYsClick(Sender: TObject);
    procedure ChbTotalYfClick(Sender: TObject);
    procedure ChBXYClick(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure PageC1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ckbnewDateClick(Sender: TObject);
    procedure CbnameClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid4DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnprintClick(Sender: TObject);
    procedure CBinputClick(Sender: TObject);
    procedure cbcancelClick(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
    vbegin,vend,Iflag:string;
    NO:STRING;
    ps:boolean;
    LocalCount:integer;
    procedure inistringgrid(Gridbases: TStringGrid;db:TDBGrid;visible:boolean);
    procedure readdata(gridbases:tstringgrid;dbgrids:tdbgrid);//库存分布;
    procedure cleardata(gridbases:tstringgrid);
    procedure PrintGrid(Sgrid:tstringgrid);

    //procedure redata; //销售分布
  public
    { Public declarations }
    tj:string;
    tempsql,tables:string;
  end;

var
  fmWldwStaff: TfmWldwStaff;

implementation

uses func, untdatadm,fm_SetColumn, Supply_Monad, Unitreportxf;

{$R *.dfm}
/////////////////自定义函数
procedure TfmWldwStaff.readdata(gridbases:tstringgrid;dbgrids:tdbgrid);
var
  i,p,t,m,j,d,c:integer;
  f:boolean;
begin
  m:=gridbases.RowCount-1;
  gridbases.RowCount:=cdssoft.RecordCount+1;
  t:=gridbases.RowCount-1;
  i:=1;
  cdssoft.First;
  while not cdssoft.Eof do
  begin
    f:=true;
    if  trim(gridbases.Cells[1,m-1])=trim(cdssoft.fieldbyname('goods_no').AsString) then
    begin
      c:=0;
      j:= gridbases.ColCount;
      for d:=1 to j do
      begin
        if trim(gridbases.Cells[d,0])=trim(cdssoft.fieldbyname('storage_no').AsString+'仓库') then
        begin
          c:=d;
        end;
      end;
      if c=0 then
      begin
        gridbases.ColCount:=gridbase.ColCount+1;
        gridbases.ColWidths[gridbase.ColCount-1]:=60;
        gridbases.Cols[gridbase.ColCount-1].Add(trim(cdssoft.fieldbyname('storage_no').AsString+'仓库'));
        gridbases.Cells[gridbase.ColCount-1,m-1]:=trim(cdssoft.fieldbyname('countamount').AsString );
      end else
      begin
        gridbases.Cells[c,m-1]:=trim(cdssoft.fieldbyname('stock_amount').AsString );
      end;
      f:=false;
    end;
    if f then
    begin
      for p:=1 to dbgrids.FieldCount-1 do
      begin
        j:=gridbases.ColCount-1;
        c:=0;
        if (trim(Gridbases.Cells[1,m])<>'') and (trim(Gridbases.Cells[2,m])<>'') and (trim(Gridbases.Cells[3,m])<>'') and (trim(gridbases.Cells[4,m])<>'') then
        begin
          for d:=1 to j do
          begin
            if trim(Gridbases.Cells[d,0])=trim(cdssoft.fieldbyname('storage_no').AsString+'仓库') then
            begin
              c:=d;
            end;
          end;
        end;
        if c=0 then
        begin
         c:=p;
        end ;
        Gridbases.Cells[c,m]:=trim(dbgrids.Fields[p].AsString);
      end;
      inc(m);
    end;
   cdssoft.Next;
  end;
  //////////////////////////////
  m:=0; //清除空白项
  for i:=1 to gridbases.RowCount-1 do
  begin
    if trim(gridbases.Cells[1,i])='' then inc(m);
  end;
  gridbases.RowCount:=gridbases.RowCount-m;

end;

procedure tfmWldwStaff.inistringgrid(Gridbases: TStringGrid;db:tdbgrid;visible:boolean);
var
  i:integer;
begin
  if visible then
  begin
    cleardata(Gridbases);
  end;
  Gridbase.Visible:=visible;
  if gridbases.ColCount<= db.Columns.Count then
  begin
    gridbases.ColCount:=db.Columns.Count;
  end;
  gridbases.ColWidths[0]:=-1;
  for i:=1 to db.Columns.Count-1 do
  begin
    if  dbgrid1.Columns[i].Visible then
    begin
      gridbases.ColWidths[i]:=db.Columns[i].Width;
    end else
    begin
      gridbases.ColWidths[i]:=-1;
    end;
    if trim(db.Columns.Items[i].Title.Caption)<>'商品数量' then
    begin
      gridbases.cells[i,0]:=trim(db.Columns[i].Title.Caption);
    end else
    begin
      gridbases.cells[i,0]:=trim(cdssoft.fieldbyname('storage_no').AsString)+'仓库';
    end;
  end;
  readdata(Gridbases,db);
end;


procedure TfmWldwStaff.cleardata(gridbases:tstringgrid);
var
  i:integer;
begin
  for i:=1 to Gridbases.RowCount-1 do
  begin
    Gridbases.Rows[i].Clear;
  end;
  Gridbases.RowCount:=2;
  for i:=0 to Gridbases.ColCount-1 do
  begin
    Gridbases.cols[i].Clear;
  end;
  Gridbases.ColCount:=2;
end;

procedure TfmWldwStaff.PrintGrid(Sgrid:tstringgrid);
begin
  if trim(Sgrid.Cells[1,Sgrid.RowCount-1])<>'' then
  begin
    fastrepxf:=tfastrepxf.Create(self);
    fastrepxf.filenames:='GeherGoods.ini';
    //fastrepxf.RepSGrid.RangeEnd := reCount;
    GetCopyGrid(fastrepxf.SGridData,Sgrid);
    fastrepxf.SGridData.Enabled:=true;
    fastrepxf.ShowModal;
    fastrepxf.Free;
  end;
end;
/////////////////////////////////
procedure TfmWldwStaff.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmWldwStaff.BitBtn2Click(Sender: TObject);
begin
  inherited;
   with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
  if pagec1.ActivePageIndex=0 then
  begin
    if gridbase.Visible then
    begin
      inistringgrid(gridbase,dbgrid1,true);
    end;
  end;
  if pagec1.ActivePageIndex=1 then
  begin
    if gridback.Visible then
    begin
      inistringgrid(gridback,dbgrid2,true);
    end;
  end;
end;

procedure TfmWldwStaff.BitBtn3Click(Sender: TObject);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  BitBtn3MouseDown(sender,mbLeft,[ssLeft],p.X,p.Y);
end;

procedure TfmWldwStaff.BitBtn3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  PopupMenu2.Popup(P.x,P.y);

end;

procedure TfmWldwStaff.BitBtn5Click(Sender: TObject);
begin
  inherited;
  label2.Caption:='---销售分布';
end;

procedure TfmWldwStaff.N3Click(Sender: TObject);
var
  sql:widestring;
  datas:olevariant;
begin
  inherited;
  IF PAGEC1.ActivePageIndex =0 THEN
  BEGIN
    dbgCur:=dbgrid1;
    if gridbase.Visible then
    begin
      gridbase.Visible:=false;
      dbgrid1.Visible:=true;
    end else
    begin
      gridbase.Visible:=false;
      dbgrid1.Visible:=true;
    end;
  END;
  IF PAGEC1.ActivePageIndex =1 THEN
  BEGIN
    dbgCur:=dbgrid2;
    if gridbaCK.Visible then
    begin
      gridbACK.Visible:=false;
      dbgrid2.Visible:=true;
    end else
    begin
      gridbaCK.Visible:=false;
      dbgrid2.Visible:=true;
    end;
  END;
end;

procedure TfmWldwStaff.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cmbtype.Items:=cbtype.Items;//
  cbtype.ItemIndex := -1;
  cmbtop.ItemIndex:=0;
  if TabGoods.TabVisible then
  begin
    pagec1.ActivePageIndex:=0;
  end else
  begin
    dbgCur:=dbgrid3;
  end;
  dtpbegin.Date:=date-30;
  dtpend.Date:=date;
  dtpinputb.Date:= dtpbegin.Date;
  dtpinpute.Date:= dtpend.Date;
  dtpcancelb.Date:= dtpbegin.Date;
  dtpcancele.Date:= dtpend.Date;
  tempsql:=' select top '+trim(cmbtop.Text);
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
  cmbbmstorage.Items:=cmbmstorage.Items;
end;

procedure TfmWldwStaff.N4Click(Sender: TObject);
var
  sql:widestring;
  datas:olevariant;
begin
  inherited;
  if not cdssoft.Active  then exit;
  if pagec1.ActivePageIndex =0 then
  begin
    if dbgrid1.DataSource =nil then exit;
    if dbgrid1.Visible then
    begin
      dbgrid1.Visible:=false;
      gridbase.Visible:=true;
      inistringgrid(gridbase,dbgrid1,true);
      //readdata(gridbase);
    end else
    begin
      dbgCur:=dbgrid1;
      gridbase.Visible:=true;
      dbgrid1.Visible:=false
    end;
  end;
  if pagec1.ActivePageIndex =1 then
  begin
    if dbgrid2.DataSource =nil then exit;
    if dbgrid2.Visible then
    begin
      dbgrid2.Visible:=false;
      gridBACK.Visible:=true;
      inistringgrid(gridBACK,dbgrid2,true);
      //readdata(gridBACK);
    end else
    begin
      dbgCur:=dbgrid2;
      gridBACK.Visible:=true;
      dbgrid2.Visible:=false
    end;
  end;
end;

procedure TfmWldwStaff.GridbaseDrawCell(Sender: TObject; ACol,
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

procedure TfmWldwStaff.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,cdssoft,dbgrid1,column);
end;

procedure TfmWldwStaff.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

procedure TfmWldwStaff.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

procedure TfmWldwStaff.BitBtn1Click(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
  str,str1:string;
  i,j:integer;
  zt:boolean;
begin
  inherited;
  iflag:='0';
  LocalCount:=0;
  vbegin:='';
  vend:='';
  tables:=' exec GridWldwBackStaff ';
  dbgCur:=dbgrid1;
    cdssoft.Close;
    cdssoft.Data:=null;
    cdssoft.IndexName:='';
    cdssoft.IndexDefs.Clear;
    tj:=' and 1=1 ';
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
          str1:=str1+''''+''''+copy(trim(cmbstorages.Items.Strings[j]),i+4,length(trim(cmbstorages.Items.Strings[j])))+''''+''''+',';
        end else
        begin
          str1:=str1+''''+''''+trim(cmbstorages.Items.Strings[j])+''''+''''+',';
        end;
      end;
      str1:=str1+''''+''''+trim(shopid)+''''+''''+',';
    end;
    if ckbtype.Checked then tj:=tj+' and c.type='+''''+''''+trim(cbtype.Text)+''''+'''';
    if ckbbrand.Checked then tj:=tj+' and c.brand='+''''+''''+trim(cbbrand.Text)+''''+'''';
    if ckbbreed.Checked then tj:=tj+' and c.breed='+''''+''''+trim(cbbreed.Text)+''''+'''';
    if cbwldw.Checked then tj:=tj+' and b.wldw='+''''+''''+trim(edtwldw.Text)+''''+'''';
    if cbinput.Checked then
    begin
      vbegin:=formatdatetime('yyyy-mm-dd',dtpinputb.Date);
      vend:=formatdatetime('yyyy-mm-dd',dtpinpute.Date);
    end;
    if cbmstorage.Checked then
    begin
      str1:=' (';
      i:=pos('仓库', trim(cmbmstorage.Text));
      if i>0 then
      begin
        str1:=str1+''''+''''+copy(trim(cmbmstorage.Text),i+4,length(trim(cmbmstorage.Text)))+''''+''''+',';
      end else
      begin
        str1:=str1+''''+''''+trim(cmbmstorage.Text)+''''+''''+',';
      end;
      zt:=true;
    end ;
    if cbstorages.Checked then
    begin
      if trim(cmbstorages.Text)<>'全部仓库' then
      begin
        if not zt then str1:=' (';
        str1:=str1+''''+''''+trim(cmbstorages.Text)+''''+''''+',';
      end else
      begin
        if not cbmstorage.Checked then str1:=' (';
        for j:=0 to cmbstorages.Items.Count-2 do
        begin
          i:=pos('仓库', trim(cmbstorages.Items.Strings[j]));
          if i>0 then
          begin
            str1:=str1+''''+''''+copy(trim(cmbstorages.Items.Strings[j]),i+4,length(trim(cmbstorages.Items.Strings[j])))+''''+''''+',';
          end else
          begin
            str1:=str1+''''+''''+trim(cmbstorages.Items.Strings[j])+''''+''''+',';
          end;
        end;
      end;
    end;
    if trim(str1)<>'' then
    begin
      str1:=copy(str1,1,length(str1)-1);
      str1:=str1+')';
      tj:=tj+' and a.storage_no in '+trim(str1);
    end;
    screen.Cursor :=  crHourGlass;
    temp:=tables+''''+vbegin+''''+','+''''+vend+''''+','+''''+tj+''''+','+iflag+','+inttostr(LocalCount);
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
      cdssoft.Data:=datas;
      cdssoft.Open;
      datas:=null;
      cdssoft.Last;
      LocalCount := GetKeyFieldValue('id',cdssoft);   //传入具体字段
      btnpagedown.Enabled:=true;
      with cdssoft.IndexDefs.AddIndexDef do
      begin
        Fields := 'goods_no';  //
        Options := [];
      end;
      cdssoft.IndexDefs.Update;
      cdssoft.Open;
      Gridbase.Visible:=false;
      dbgrid1.Visible:=true;
      /////////////
      dbgrid2.DataSource:=nil;
      dbgrid3.DataSource:=nil;
      dbgrid4.DataSource:=nil;
      dbgrid1.DataSource:=dsview;
      /////////////////////
      setdbgrid(dbgrid1,3);
      end;
      screen.Cursor :=  crdefault;

end;

procedure TfmWldwStaff.cbwldwClick(Sender: TObject);
begin
  inherited;
 ckbedit(cbwldw,edtwldw);
end;

procedure TfmWldwStaff.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbtype,cbtype);
    CBTypeChange(cbtype);
end;

procedure TfmWldwStaff.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;

end;

procedure TfmWldwStaff.ckbbrandClick(Sender: TObject);
begin
  inherited;
     ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure TfmWldwStaff.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;  //调品种
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cbbrand.text)+''''+' and type =' +''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;

end;

procedure TfmWldwStaff.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure TfmWldwStaff.CbmstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbmstorage,cmbmstorage);
end;

procedure TfmWldwStaff.cbstoragesClick(Sender: TObject);
begin
  inherited;
  ckbcmb(cbstorages,cmbstorages);
end;

procedure TfmWldwStaff.cmbmstorageChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  t_sql:='select storageid from stock_manager where managerid='+''''+trim(copy(trim(cmbmstorage.Text),pos('仓库',trim(cmbmstorage.Text))+4,length(trim(cmbmstorage.Text))))+'''';
  GetDataToComBoX(cmbstorages,t_sql,'storageid');
  cmbstorages.Items.Add('全部仓库');
  cmbstorages.ItemIndex:=-1;
end;

procedure TfmWldwStaff.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
  if not cdssoft.Active then exit;
    screen.Cursor := crhourglass;
   cdssoft.DisableControls;
  try
  temp:=tables+''''+vbegin+''''+','+''''+vend+''''+','+''''+tj+''''+','+iflag+','+inttostr(LocalCount);
  try
  datas:=adisp.GetRecord(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    screen.Cursor :=  crdefault;
    exit;
  end;
  if not varisnull(datas) then
  begin
    cdssoft.Close;
    cdssoft.Open;
    cdssoft.AppendData(datas,true);
    cdssoft.Last;
    LocalCount := GetKeyFieldValue('id',cdssoft);   //传入具体字段
     ////////////////////////////////
    with cdssoft.IndexDefs.AddIndexDef do
    begin
      if pagec1.ActivePageIndex in [0,1] then
      begin
        Fields := 'goods_no';  //
      end ;
      if pagec1.ActivePageIndex=3 then
      begin
        Fields := 'supply_NO';  //
      end;
      Options := [];
    end;
    cdssoft.IndexDefs.Update;
    cdssoft.Open;
  //////////////////////////////////////       dmmain.cdsquery.Last;
    //重新打开
      cdssoft.EnableControls;
     setdbgrid(dbgrid1,3);
    end else
    begin
       //不再有数据
        cdssoft.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  if pagec1.ActivePageIndex =0 then
  begin
    dbgrid1.Visible:=true;
    gridbase.Visible:=false;
  end;
  if pagec1.ActivePageIndex =1 then
  begin
    dbgrid2.Visible:=true;
    gridback.Visible:=false;
  end;
  screen.Cursor :=  crdefault;

end;

procedure TfmWldwStaff.BitBtn4Click(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
  str,str1:string;
  i,j:integer;
  zt:boolean;
begin
  inherited;
  iflag:='1';
  LocalCount:=0;
  vbegin:='';
  vend:='';
  tables:=' exec GridWldwBackStaff  ';
   dbgCur:=dbgrid2;
   cdssoft.Close;
   cdssoft.Data:=null;
   cdssoft.IndexName:='';
    cdssoft.IndexDefs.Clear;
   tj:=' and 1=1 ';
   str1:='';
   zt:=false;
   if not ps then
    begin
      str1:=' (';
      for j:=0 to cmbbstorage.Items.Count-2 do
      begin
        i:=pos('仓库', trim(cmbbstorage.Items.Strings[j]));
        if i>0 then
        begin
          str1:=str1+''''+''''+copy(trim(cmbbstorage.Items.Strings[j]),i+4,length(trim(cmbstorages.Items.Strings[j])))+''''+''''+',';
        end else
        begin
          str1:=str1+''''+''''+trim(cmbbstorage.Items.Strings[j])+''''+''''+',';
        end;
      end;
      str1:=str1+''''+''''+trim(shopid)+''''+''''+',';
    end;
    if chbtype.Checked then tj:=tj+' and c.type='+''''+''''+trim(cmbtype.Text)+''''+'''';
    if chbbrand.Checked then tj:=tj+' and c.brand='+''''+''''+trim(cmbbrand.Text)+''''+'''';
    if chbbreed.Checked then tj:=tj+' and c.breed='+''''+''''+trim(cmbbreed.Text)+''''+'''';
    if chbwldw.Checked then tj:=tj+' and b.wldw='+''''+''''+trim(edtgeher.Text)+''''+'''';
    if cbcancel.Checked then
    begin
      vbegin:=formatdatetime('yyyy-mm-dd',dtpcancelb.Date);
      vend:=formatdatetime('yyyy-mm-dd',dtpcancele.Date);
    end;
    if chbmstorage.Checked then
    begin
      str1:=' (';
      i:=pos('仓库', trim(cmbbmstorage.Text));
      if i>0 then
      begin
        str1:=str1+''''+''''+copy(trim(cmbbmstorage.Text),i+4,length(trim(cmbbmstorage.Text)))+''''+''''+',';
      end else
      begin
        str1:=str1+''''+''''+trim(cmbbmstorage.Text)+''''+''''+',';
      end;
      zt:=true;
    end ;
    if cbstorages.Checked then
    begin
      if trim(cmbbstorage.Text)<>'全部仓库' then
      begin
        if not zt then str1:=' (';
        str1:=str1+''''+''''+trim(cmbbstorage.Text)+''''+''''+',';
      end else
      begin
        if not chbmstorage.Checked then str1:=' (';
        for j:=0 to cmbbstorage.Items.Count-2 do
        begin
          i:=pos('仓库', trim(cmbbstorage.Items.Strings[j]));
          if i>0 then
          begin
            str1:=str1+''''+''''+copy(trim(cmbbstorage.Items.Strings[j]),i+4,length(trim(cmbbstorage.Items.Strings[j])))+''''+''''+',';
          end else
          begin
            str1:=str1+''''+''''+trim(cmbbstorage.Items.Strings[j])+''''+''''+',';
          end;
        end;
      end;
    end;
    if trim(str1)<>'' then
    begin
      str1:=copy(str1,1,length(str1)-1);
      str1:=str1+')';
      tj:=tj+' and a.storage_no in '+trim(str1);
    end;
    screen.Cursor :=  crHourGlass;
    temp:=tables+''''+vbegin+''''+','+''''+vend+''''+','+''''+tj+''''+','+iflag+','+inttostr(LocalCount);
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
    cdssoft.Data:=datas;
    cdssoft.Open;
    datas:=null;
    cdssoft.Last;
    LocalCount := GetKeyFieldValue('id',cdssoft);   //传入具体字段
    btnpagedown.Enabled:=true;
    with cdssoft.IndexDefs.AddIndexDef do
    begin
      Fields := 'goods_no';  //
      Options := [];
    end;
    cdssoft.IndexDefs.Update;
    cdssoft.Open;
    Gridback.Visible:=false;
    dbgrid2.Visible:=true;
    ///////////////////////
    dbgrid1.DataSource:=nil;
    dbgrid3.DataSource:=nil;
    dbgrid4.DataSource:=nil;
    dbgrid2.DataSource:=dsview;
    ////////////////////////
    setdbgrid(dbgrid2,3);
    end;
    screen.Cursor :=  crdefault;

end;

procedure TfmWldwStaff.ChbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(chbtype,cmbtype);
  CmBTypeChange(cmbtype);
end;

procedure TfmWldwStaff.ChbbrandClick(Sender: TObject);
begin
  inherited;
   ckbcmb(chbbrand,cmbbrand);
   cmbbrandchange(cmbbrand);
end;

procedure TfmWldwStaff.ChBbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(chbbreed,cmbbreed);
end;

procedure TfmWldwStaff.ChbMstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(chbmstorage,cmbbmstorage);
end;

procedure TfmWldwStaff.ChbstorageClick(Sender: TObject);
begin
  inherited;
  ckbcmb(chbstorage,cmbbstorage);
end;

procedure TfmWldwStaff.ChbwldwClick(Sender: TObject);
begin
  inherited;
  ckbedit(chbwldw,edtgeher);
end;

procedure TfmWldwStaff.CmbtypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cmbtype.text)+'''';
  GetDataToComBoX(cmbBrand,t_sql,'brand');
  cmbBrand.ItemIndex := -1;
  cmbbreed.Clear;

end;

procedure TfmWldwStaff.CmbbrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  if cmbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cmbbrand.text)+''''+' and type =' +''''+trim(cmbtype.text)+'''';
  GetDataToComBoX(cmbBreed,t_sql,'breed');
  cmbBreed.ItemIndex := -1;

end;

procedure TfmWldwStaff.CmbBmstorageChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  t_sql:='select storageid from stock_manager where managerid='+''''+trim(copy(trim(cmbbmstorage.Text),pos('仓库',trim(cmbbmstorage.Text))+4,length(trim(cmbbmstorage.Text))))+'''';
  GetDataToComBoX(cmbbstorage,t_sql,'storageid');
  cmbbstorage.Items.Add('全部仓库');
  cmbbstorage.ItemIndex:=-1;
end;

procedure TfmWldwStaff.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid2,2);
end;

procedure TfmWldwStaff.DBGrid2DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid2,2);
end;

procedure TfmWldwStaff.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdssoft.Close;
  cdssoft.Data:=null;
  cdspart.Close;
  cdspart.Data:=null;
  inherited;

end;

procedure TfmWldwStaff.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,cdssoft,dbgrid2,column);
end;

procedure TfmWldwStaff.BitBtn10Click(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
begin
  inherited;
  tables:=' * from [Supply_Company]';
  cdssoft.Close;
  cdssoft.Data:=null;
  cdssoft.IndexName:='';
  cdssoft.IndexDefs.Clear;
  tj:=' where 1=1 ';
  if chbcode.Checked then tj:=tj+'and supply_NO='+''''+trim(edtcode.Text)+'''';
  if chbname.Checked then tj:=tj+'and supply_Name='+''''+trim(edtname.Text)+'''';
  if chbtotalys.Checked then tj:=tj+'and Must_gather='+trim(edttotalys.Text);
  if chbtotalyf.Checked then tj:=tj+' and Pay_gather='+trim(edttotalyf.Text);
  if chbxy.Checked then tj:=tj+' and contact='+trim(edtxy.Text);
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
    cdssoft.Data:=datas;
    cdssoft.Open;
    datas:=null;
    cdssoft.Last;
    LocalCount := GetKeyFieldValue('id',cdssoft);   //传入具体字段
    btnpagedown.Enabled:=true;
    with cdssoft.IndexDefs.AddIndexDef do
    begin
      Fields := 'supply_NO';  //
      Options := [];
    end;
    cdssoft.IndexDefs.Update;
    cdssoft.Open;
    Gridbase.Visible:=false;
    dbgrid1.Visible:=true;
    ///////////////////////
    dbgrid2.DataSource:=nil;
    dbgrid1.DataSource:=nil;
    dbgrid4.DataSource:=nil;
    dbgrid3.DataSource:=dsview;
    ////////////////////////
    setdbgrid(dbgrid2,3);
    end;
    screen.Cursor :=  crdefault;

end;

procedure TfmWldwStaff.ChbcodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(chbcode,edtcode);
end;

procedure TfmWldwStaff.ChbNameClick(Sender: TObject);
begin
  inherited;
  ckbedit(chbname,edtname);
end;

procedure TfmWldwStaff.ChbtotalYsClick(Sender: TObject);
begin
  inherited;
  ckbedit(chbtotalys,edttotalys);
end;

procedure TfmWldwStaff.ChbTotalYfClick(Sender: TObject);
begin
  inherited;
  ckbedit(chbtotalyf,edttotalyf);
end;

procedure TfmWldwStaff.ChBXYClick(Sender: TObject);
begin
  inherited;
  ckbedit(chbxy,edtxy);
end;

procedure TfmWldwStaff.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid3.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,cdssoft,dbgrid3,column);
end;

procedure TfmWldwStaff.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid3,2);
end;

procedure TfmWldwStaff.DBGrid3DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid3,2);
end;

procedure TfmWldwStaff.PageC1Change(Sender: TObject);
begin
  inherited;
  case pagec1.ActivePageIndex of
    0 : dbgCur:=dbgrid1;
    1 : dbgCur:=dbgrid2;
    2 : dbgCur:=dbgrid4;
    3:  dbgCur:=dbgrid3;
  end;
end;

procedure TfmWldwStaff.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Check_Mond:='';
  Check_Mond:='Stock_pay_Str';
  frm_Supply_Monad:=Tfrm_Supply_Monad.Create(self);
  frm_Supply_Monad.Caption:='【往来单位】';
  frm_Supply_Monad.ShowModal;
  EdTSup_no.Text:=check_Mond_Result;
  no:=wldwno;
  frm_Supply_Monad.Free;
end;

procedure TfmWldwStaff.ckbnewDateClick(Sender: TObject);
begin
  inherited;
  ckbDtps(ckbnewdate,dtpbegin,dtpend);
end;

procedure TfmWldwStaff.CbnameClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbname,edtsup_no);
end;

procedure TfmWldwStaff.BitBtn14Click(Sender: TObject);
var
  vbegin,vend,SNO:string;
  temp:widestring;
  datas:olevariant;
begin
  inherited;
  vbegin:='';
  vend:='';
  sno:='';
  cdssoft.Close;
  cdssoft.Data:=null;
  cdssoft.IndexName:='';
  cdssoft.IndexDefs.Clear;
  datas:=null;
  temp:=' exec JCGeherTotalAccount ';
  dbgrid1.DataSource:=nil;
  dbgrid3.DataSource:=nil;
  dbgrid2.DataSource:=nil;
  if cbname.Checked then sno:=no;
  if ckbnewdate.Checked then
  begin
    vbegin:=formatdatetime('yyyy-mm-dd',dtpbegin.Date);
    vend:=formatdatetime('yyyy-mm-dd',dtpend.Date);
  end;
  if rb1.Checked then
  begin
    temp:=temp+''''+vbegin+''''+','+''''+vend+''''+','+''''+sno+''''+','+'0';
    dbgrid4.Columns.Items[4].Title.caption:='应付帐款';
    dbgrid4.Columns.Items[5].Title.caption:='已付帐款';
    dbgrid4.Columns.Items[6].Title.caption:='未付帐款';
  end;
  if rb2.Checked then
  begin
    temp:=temp+''''+vbegin+''''+','+''''+vend+''''+','+''''+sno+''''+','+'1';
    dbgrid4.Columns.Items[4].Title.caption:='应收帐款';
    dbgrid4.Columns.Items[5].Title.caption:='已收帐款';
    dbgrid4.Columns.Items[6].Title.caption:='未收帐款';
  end;
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
    cdssoft.Data:=datas;
    cdssoft.Open;
    datas:=null;
    cdssoft.Last;
    //LocalCount := GetKeyFieldValue('id',cdssoft);   //传入具体字段
    btnpagedown.Enabled:=true;
    with cdssoft.IndexDefs.AddIndexDef do
    begin
      Fields := 'wldw';  //
      Options := [];
    end;
    cdssoft.IndexDefs.Update;
    cdssoft.Open;
    dbgrid4.DataSource:=dsview;
    ////////////////////////
    setdbgrid(dbgrid4,3);
    end;
    screen.Cursor :=  crdefault;
end;

procedure TfmWldwStaff.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
   if (not dbgrid4.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,cdssoft,dbgrid4,column);
end;

procedure TfmWldwStaff.DBGrid4DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid4,3);
end;

procedure TfmWldwStaff.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid4,3);
end;

procedure TfmWldwStaff.btnprintClick(Sender: TObject);
begin
  inherited;
  if pagec1.ActivePageIndex=0 then
  begin
    printgrid(gridbase);
  end;
  if pagec1.ActivePageIndex=1 then
  begin
    printgrid(gridback);
  end;
end;

procedure TfmWldwStaff.CBinputClick(Sender: TObject);
begin
  inherited;
  ckbDtps(cbinput,dtpinputb,dtpinpute);
end;

procedure TfmWldwStaff.cbcancelClick(Sender: TObject);
begin
  inherited;
  ckbDtps(cbcancel,dtpcancelb,dtpcancele);
end;

procedure TfmWldwStaff.BitBtn12Click(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
   if not cdssoft.Active then exit;
    screen.Cursor := crhourglass;
   cdssoft.DisableControls;
  try
  temp:=tempsql+tables+tj+' and id>'+inttostr(LocalCount);
  try
  datas:=adisp.GetRecord(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    screen.Cursor :=  crdefault;
    exit;
  end;
  if not varisnull(datas) then
  begin
    cdssoft.Close;
    cdssoft.Open;
    cdssoft.AppendData(datas,true);
    cdssoft.Last;
    LocalCount := GetKeyFieldValue('id',cdssoft);   //传入具体字段
     ////////////////////////////////
    with cdssoft.IndexDefs.AddIndexDef do
    begin
      if pagec1.ActivePageIndex in [0,1] then
      begin
        Fields := 'goods_no';  //
      end ;
      if pagec1.ActivePageIndex=3 then
      begin
        Fields := 'supply_NO';  //
      end;
      Options := [];
    end;
    cdssoft.IndexDefs.Update;
    cdssoft.Open;
  //////////////////////////////////////       dmmain.cdsquery.Last;
    //重新打开
      cdssoft.EnableControls;
     setdbgrid(dbgrid1,3);
    end else
    begin
       //不再有数据
        cdssoft.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  if pagec1.ActivePageIndex =0 then
  begin
    dbgrid1.Visible:=true;
    gridbase.Visible:=false;
  end;
  if pagec1.ActivePageIndex =1 then
  begin
    dbgrid2.Visible:=true;
    gridback.Visible:=false;
  end;
  screen.Cursor :=  crdefault;
end;

end.
