unit Ustocking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Menus, DB,
  DBClient;

type
  Tfmstocking = class(TfmBase)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    dsview: TDataSource;
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
    ckbCode: TCheckBox;
    edtCode: TEdit;
    cdsdata: TClientDataSet;
    DBGrid2: TDBGrid;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ckbtypeClick(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure cbamountClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    tempsql,tables,storage,stock_id:string;
    LocalCount:integer;
    ShowModals:integer;
  end;

var
  fmstocking: Tfmstocking;

implementation


uses func, untdatadm, fm_SetColumn, Udlgstock, Udlgselectdate,
  UdlgGoodsSale;


{$R *.dfm}

procedure Tfmstocking.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmstocking.BitBtn2Click(Sender: TObject);
begin
  inherited;
   with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure Tfmstocking.BitBtn5Click(Sender: TObject);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  BitBtn5MouseDown(sender,mbLeft,[ssLeft],p.X,p.Y);

end;

procedure Tfmstocking.BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 p:Tpoint;
begin
  inherited;
  GetCursorPos(P);
  PopupMenu1.Popup(P.x,P.y);

end;

procedure Tfmstocking.N1Click(Sender: TObject);
var
  temp:widestring;
begin
  inherited;
   ////影响库存变化//////
  dlgGoodsSale:=tdlgGoodsSale.Create(self);
  dlgGoodsSale.showmodel:=1;
  dlgGoodsSale.rball.Checked:=true;
  dlgGoodsSale.ShowModal;
  dlgGoodsSale.Free;
  if cdsdata.Active then
  begin
    dmmain.CDSquery.Last;
    LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段
  end;
  screen.Cursor :=  crdefault;
end;

procedure Tfmstocking.N2Click(Sender: TObject);
var
  temp:widestring;
begin
  inherited;
   ////影响库存变化//////
  dlgGoodsSale:=tdlgGoodsSale.Create(self);
  dlgGoodsSale.showmodel:=1;
  dlgGoodsSale.ShowModal;
  dlgGoodsSale.Free;
  if cdsdata.Active then
  begin
    cdsdata.Filtered:=false;
    cdsdata.Last;
    LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段
  end;
  screen.Cursor :=  crdefault;
end;

procedure Tfmstocking.FormShow(Sender: TObject);
var
  t_sql:string;
  datas:olevariant;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  if showModals=0 then
  begin
    dbgCur:=dbgrid2;
    dbgrid1.Visible:=false;
    dbgrid2.Visible :=true;
  end else
  begin
    dbgCur:=dbgrid1;
    dbgrid2.Visible:=false;
    dbgrid1.Visible :=true;
  end;
end;

procedure Tfmstocking.BitBtn1Click(Sender: TObject);
begin
  inherited;
  {if not dmmain.CDSquery.Active  then  exit;
  dlgstock:=tdlgstock.Create(self);
  dlgstock.showmode:=3;
  dlgstock.ShowModal;
  dlgstock.Free;}
  dlgGoodsSale:=tdlgGoodsSale.Create(self);
  dlgGoodsSale.showmodel:=1;
  dlgGoodsSale.ShowModal;
  dlgGoodsSale.Free;
  if cdsdata.Active then
  begin
    cdsdata.Last;
    LocalCount := GetKeyFieldValue('id',cdsdata);   //传入具体字段
    btnpagedown.Enabled:=true;
  end;
  screen.Cursor :=  crdefault;
end;

procedure Tfmstocking.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:oleVariant;
begin
  inherited;
  if not cdsdata.Active then exit;
    screen.Cursor := crhourglass;
   cdsdata.DisableControls;
  try
  temp:=tables+inttostr(LocalCount)+tempsql+','+''''+trim(storage)+''''+','+''''+trim(stock_id)+'''';
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

procedure Tfmstocking.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cdsdata.Close;
  cdsdata.Data:=null;
end;

procedure Tfmstocking.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if not cdsdata.Active then exit;
   if trim(column.Field.AsString)='' then exit;
 sortgrid(column.Field.FieldName,cdsdata,dbgrid1,column);
end;
procedure Tfmstocking.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbtype,cbtype);
   CBTypeChange(cbtype);
end;

procedure Tfmstocking.ckbbrandClick(Sender: TObject);
begin
  inherited;
   ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure Tfmstocking.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure Tfmstocking.cbamountClick(Sender: TObject);
begin
  inherited;
  ckbedit(cbamount,edtamount);
end;

procedure Tfmstocking.CBTypeChange(Sender: TObject);
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

procedure Tfmstocking.cbBrandChange(Sender: TObject);
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

procedure Tfmstocking.BitBtn3Click(Sender: TObject);
var
  str:string;
  i:integer;
begin
  inherited;
  if not cdsdata.Active then exit;
  str:='';
  if ckbCode.Checked then str:=str+'trim(goods_no)='+''''+trim(edtCode.Text)+'''';
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

procedure Tfmstocking.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure Tfmstocking.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,3);
end;

procedure Tfmstocking.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
   if not cdsdata.Active then exit;
   if trim(column.Field.AsString)='' then exit;
 sortgrid(column.Field.FieldName,cdsdata,dbgrid2,column);
end;

procedure Tfmstocking.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid2,3);
end;

end.
