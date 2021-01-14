unit UTotalbreed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, DBClient, StdCtrls, Grids, DBGrids, Buttons,
  ExtCtrls;

type
  TfmTotalBreed = class(TfmBase)
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    ckbtype: TCheckBox;
    ckbbreed: TCheckBox;
    ckbbrand: TCheckBox;
    cbamount: TCheckBox;
    edtamount: TEdit;
    BitBtn3: TBitBtn;
    cdsdata: TClientDataSet;
    dsview: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    tempsql:string;
    LocalCount:integer;
  end;

var
  fmTotalBreed: TfmTotalBreed;

implementation

uses func, untdatadm, UdlgGoodsSale,fm_SetColumn;

{$R *.dfm}

procedure TfmTotalBreed.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  dbgCur:=dbgrid2;
  LocalCount:=0;
end;

procedure TfmTotalBreed.BitBtn2Click(Sender: TObject);
begin
  inherited;
   with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmTotalBreed.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbtype,cbtype);
   CBTypeChange(cbtype);
end;

procedure TfmTotalBreed.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  //调品牌
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;

end;

procedure TfmTotalBreed.ckbbrandClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure TfmTotalBreed.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  if dmmain.cDSquery.Active then dmmain.cDSquery.Close;
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cbbrand.text)+'''' +' and type =' +''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;
end;

procedure TfmTotalBreed.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure TfmTotalBreed.cbamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbamount,edtamount);
end;

procedure TfmTotalBreed.BitBtn5Click(Sender: TObject);
begin
  inherited;
   ////影响库存变化//////
  dlgGoodsSale:=tdlgGoodsSale.Create(self);
  dlgGoodsSale.showmodel:=2;
  dlgGoodsSale.ShowModal;
  dlgGoodsSale.Free;
  if cdsdata.Active then
  begin
    cdsdata.Filtered:=false;
    cdsdata.Last;
    LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段
    btnpagedown.Enabled:=true;
  end;
  screen.Cursor :=  crdefault;
end;

procedure TfmTotalBreed.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
  if not cdsdata.Active then exit;
    screen.Cursor := crhourglass;
   cdsdata.DisableControls;
  try
  temp:=tempsql+inttostr(fmTotalBreed.LocalCount);
  try
  datas:=adisp.GetRecord(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    screen.Cursor :=  crdefault;
    exit;
  end;
  if not varisnull(datas) then
  begin
  cdsdata.Close;
  cdsdata.Open;
  cdsdata.AppendData(datas,true);
   ////////////////////////////////
  datas:=null;
    //重新打开
      cdsdata.EnableControls;
      //得到此次查询的键值
      cdsdata.Last;
      LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段
      screen.Cursor :=  crdefault;
      setdbgrid(dbgrid2,3);
    end else
    begin
       //不再有数据
        cdsdata.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
    screen.Cursor :=  crdefault;
  end;


end;

procedure TfmTotalBreed.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmTotalBreed.BitBtn3Click(Sender: TObject);
var
  str:string;
  i:integer;
begin
  inherited;
  if not cdsdata.Active then exit;
  str:='';
  if ckbtype.Checked then str:=str+' and trim(type) ='+''''+trim(cbtype.Text)+'''';
  if ckbbrand.Checked then str:=str+' and trim(brand) ='+''''+trim(cbbrand.Text)+'''';
  if ckbbreed.Checked then str:=str+' and trim(breed) ='+''''+trim(cbbreed.Text)+'''';
  if cbamount.Checked then str:=str+' and trim(stock_amount) ='+trim(edtamount.Text);
  i:=pos('and',str);
  if i=2 then
  begin
    str:=copy(str,5,length(str));
  end;
  cdsdata.Filter:=str;
  cdsdata.Filtered:=true;

end;

procedure TfmTotalBreed.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
   if not cdsdata.Active then exit;
   if trim(column.Field.AsString)='' then exit;
 sortgrid(column.Field.FieldName,cdsdata,dbgrid2,column);
end;

procedure TfmTotalBreed.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid2,3);
end;

end.
