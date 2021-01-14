unit Untwarn_limit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB;

type
  Tfmstockwarnlimit = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    LblSort: TLabel;
    Bevel1: TBevel;
    ComboBox1: TComboBox;
    edtTime: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    edtRecNo: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnExit: TBitBtn;
    btnpagedown: TBitBtn;
    BtnSort: TBitBtn;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    ds_warn_limit: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure CbBreedChange(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnSortClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    LocalCount:integer;
  public
    { Public declarations }
    tempsql,tables,tj:string;
  end;

var
  fmstockwarnlimit: Tfmstockwarnlimit;

implementation

uses untdatadm, func, limit, fm_SetColumn, Udlgstock, Storage_Guide;

{$R *.dfm}

procedure Tfmstockwarnlimit.btnExitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmstockwarnlimit.FormShow(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  combobox1.ItemIndex:=0;
  dmmain.cdsquery.Close;
  dmmain.cdsquery.Data:=null;
  dbgCur:=dbgrid1;
end;

procedure Tfmstockwarnlimit.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  //调品牌
  t_sql:='select  distinct brand,brand_no from  [goods_code] where type ='+''''+trim(cbtype.text)+''''+' order by brand_no';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;
end;

procedure Tfmstockwarnlimit.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  bitbtn1.Enabled:=false;
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed,breed_no  from  [goods_code] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+''''+' order by breed_no';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
  edtrecno.Clear;
  if CbBreed.Items.Count>0 then
  bitbtn1.Enabled:=true;
end;

procedure Tfmstockwarnlimit.CbBreedChange(Sender: TObject);
var
  t_sql:string;
  quedata:olevariant;
begin
  inherited;
  quedata:=null;
   if cbbrand.Text = '' then exit;
   screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.cdsquery.DisableControls;
   tables:=' * from [vSelectGoods]'; //表明
   tempsql:= 'select top 20 ';
   tj:=' where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+''''+' and breed = ' + ''''+trim(cbbreed.text)+'''';
   //t_sql:='select top 20 * from [vSelectGoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
   T_sql := tempsql+tables+tj;
  try
  if dmmain.cdsquery.Active then dmmain.cdsquery.Close;
  dmmain.cdsquery.Data:=null;
   quedata:=adisp.GetRecord(t_sql);  //.qurrecords(t_sql,quedata);
   if not varisnull(quedata) then
    begin
      dmmain.cdsquery.Data:=quedata;
      dmmain.cdsquery.Open;
      quedata:=null;
       dmmain.cdsquery.Last;
       edtRecNo.Text := '当前已下载: '+inttostr(dmmain.cdsquery.recordcount)+'条';

    //重新打开
      dmmain.cdsquery.EnableControls;
      dbgrid1.Refresh;
      //得到此次查询的键值
     LocalCount := GetKeyFieldValue('id',dmmain.cdsquery);   //传入具体字段
     bitbtn1.Enabled:=true;
    end else
    begin
       //不再有数据
        dmmain.cdsquery.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
    dmmain.cdsquery.EnableControls;
    dbgrid1.Refresh;
  end;
  dbgrid1.Refresh;
  screen.Cursor :=  crdefault;

end;

procedure Tfmstockwarnlimit.btnpagedownClick(Sender: TObject);
var
  i:Integer;
  t_sql,str1,strend:wideString;
  quedata:olevariant;
  lStart, lEnd : Integer;
begin
  inherited;
  quedata:=null;
  if not dmmain.cdsquery.Active then exit;

    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.cdsquery.DisableControls;

    if combobox1.Text = '全部' then
    begin
      tempsql:='select'
    end else
    begin
      tempsql:='select top ' + trim(ComboBox1.Text);
    end;
    //T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+'''';
    T_sql := tempsql+tables+tj;
    str1 := ' and  id > '+ inttostr(localcount);
    strend := T_sql + str1;
  try
   quedata:=adisp.GetRecord(t_sql);
    if not varisnull(quedata) then
    begin
     if dmmain.cdsquery.Active then dmmain.cdsquery.Close;
      dmmain.cdsquery.Open;
      dmmain.cdsquery.AppendData(quedata,true);
      quedata:=null;
       dmmain.cdsquery.Last;
      dmmain.cdsquery.EnableControls;
      //得到此次查询的键值
      LocalCount := GetKeyFieldValue('id',dmmain.cdsquery);   //传入具体字段
    edtRecNo.Text := '当前共有'+inttostr(dmmain.cdsquery.recordcount) +'条';
    end else
    begin
       //不再有数据
        dmmain.cdsquery.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
    dmmain.cdsquery.EnableControls;
    dbgrid1.Refresh;
  end;
  dbgrid1.Refresh;
  screen.Cursor :=  crdefault;
end;

procedure Tfmstockwarnlimit.btnAddClick(Sender: TObject);
begin
  inherited;
  if not dmmain.cdsquery.Active  then exit;
  dmmain.CDSquery.DisableControls;
  frm_limit:=tfrm_limit.Create(self);
  frm_limit.stockid:=trim(dmmain.cdsquery.fieldbyname('storage_no').AsString);
  frm_limit.goods_no :=trim(dmmain.cdsquery.fieldbyname('goods_no').AsString);
  frm_limit.ShowModal;
  frm_limit.Free;
  dmmain.CDSquery.Refresh;
  dmmain.CDSquery.EnableControls;
  dbgrid1.Refresh;
  dbgrid1.Refresh;
end;

procedure Tfmstockwarnlimit.btnEditClick(Sender: TObject);
begin
  inherited;
  if not dmmain.cdsquery.Active  then exit;
  dmmain.CDSquery.DisableControls;
  frm_limit:=tfrm_limit.Create(self);
  frm_limit.stockid:=trim(dmmain.cdsquery.fieldbyname('storage_no').AsString);
  frm_limit.goods_no :=trim(dmmain.cdsquery.fieldbyname('goods_no').AsString);
  frm_limit.ShowModal;
  frm_limit.Free;
  dmmain.CDSquery.Refresh;
  dmmain.CDSquery.EnableControls;
  dbgrid1.Refresh;
  dbgrid1.Refresh;
end;

procedure Tfmstockwarnlimit.btnDeleteClick(Sender: TObject);
begin
  inherited;
  if not dmmain.cdsquery.Active  then exit;
  if dmmain.cdsstockwarn.Active then  dmmain.cdsstockwarn.Close;
  dmmain.cdsstockwarn.Params.ParamByName('no').AsString:=trim(dmmain.cdsquery.fieldbyname('storage_no').AsString);
  dmmain.cdsstockwarn.Params.ParamByName('bh').AsString:=trim(dmmain.cdsquery.fieldbyname('goods_no').AsString);
  dmmain.cdsstockwarn.Open;
  if not dmmain.cdsstockwarn.IsEmpty then
  begin
    if application.MessageBox(pchar('是否确定删除商品编号为【'+trim(dmmain.cdsquery.fieldbyname('goods_no').AsString)+'】的库存上下限数据？'),pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
    begin
      dmmain.CDSquery.DisableControls;
      dmmain.cdsstockwarn.Edit;
      dmmain.cdsstockwarn.FieldByName('up_amount').AsInteger:=0;
      dmmain.cdsstockwarn.FieldByName('down_amount').AsInteger:=0;
      dmmain.cdsstockwarn.Post;
      try
        dmmain.cdsstockwarn.ApplyUpdates(-1);
        dmmain.CDSquery.Refresh;
        dmmain.CDSquery.EnableControls;
        dbgrid1.Refresh;
      except
        application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconinformation);
        exit;
      end;
    end;
  end;
end;

procedure Tfmstockwarnlimit.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnedit.Click;
end;

procedure Tfmstockwarnlimit.BtnSortClick(Sender: TObject);
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

procedure Tfmstockwarnlimit.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if dmmain.CDSquery.IsEmpty then exit;
  dlgstock:=tdlgstock.Create(self);
  dlgstock.showmode:=1;
  dlgstock.ShowModal;
  dlgstock.Free;
end;

procedure Tfmstockwarnlimit.BitBtn2Click(Sender: TObject);
begin
  inherited;
  frm_Storage_Guide:=tfrm_Storage_Guide.Create(self);
  frm_Storage_Guide.ShowModal;
  frm_Storage_Guide.Free; 
end;

procedure Tfmstockwarnlimit.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,dbgrid1,column);
end;

procedure Tfmstockwarnlimit.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

procedure Tfmstockwarnlimit.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

procedure Tfmstockwarnlimit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  inherited;

end;

end.
