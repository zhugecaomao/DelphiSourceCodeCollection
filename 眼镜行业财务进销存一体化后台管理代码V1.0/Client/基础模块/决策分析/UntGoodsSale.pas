unit UntGoodsSale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, DBGrids, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TfmGoodsSale = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbtop: TComboBox;
    Panel3: TPanel;
    btnselect: TBitBtn;
    BitBtn2: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Panel2: TPanel;
    Gridbase: TStringGrid;
    DBGrid1: TDBGrid;
    dsview: TDataSource;
    Panel4: TPanel;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnselectClick(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }

    procedure readdata;
  public
    { Public declarations }
    temp:string;
    LocalCount:integer;
  end;

var
  fmGoodsSale: TfmGoodsSale;

implementation

uses untdatadm, func, fm_SetColumn, UdlgGoodsSale;

{$R *.dfm}
////////////////////////
procedure TfmGoodsSale.readdata;
begin
  if dmmain.CDSquery.Active then
  LocalCount := GetKeyFieldValue('id',dmmain.cDSquery);   //传入具体字段

end;
/////////////////////////
procedure TfmGoodsSale.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmGoodsSale.FormShow(Sender: TObject);
begin
  inherited;
  dbgCur:=dbgrid1;
  LocalCount:=0;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  dlgGoodsSale:=tdlgGoodsSale.Create(self);
  dlgGoodsSale.ShowModal;
  dlgGoodsSale.Free;
end;

procedure TfmGoodsSale.btnpagedownClick(Sender: TObject);
var
  tempsql:widestring;
  datas:oleVariant;
begin
  inherited;
  if not dmmain.cDSquery.Active then exit;
    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.cDSquery.DisableControls;
  try
  tempsql:=temp+inttostr(localcount);
  try
  datas:=adisp.GetRecord(tempsql);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  if not varisnull(datas) then
  begin
  dmmain.cDSquery.Close;
  dmmain.cDSquery.Open;
  dmmain.cDSquery.AppendData(datas,true);
   ////////////////////////////////
  //////////////////////////////////////
   datas:=null;
       dmmain.cDSquery.Last;
    //重新打开
      dmmain.cDSquery.EnableControls;
      //得到此次查询的键值
      LocalCount := GetKeyFieldValue('id',dmmain.cDSquery);   //传入具体字段

    end else
    begin
       //不再有数据
        dmmain.cDSquery.EnableControls;
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  screen.Cursor :=  crdefault;
end;

procedure TfmGoodsSale.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmGoodsSale.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,dbgrid1,column);
end;

procedure TfmGoodsSale.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmmain.cDSquery.Close;
  dmmain.cDSquery.Data:=null;
  inherited;
end;

procedure TfmGoodsSale.btnselectClick(Sender: TObject);
begin
  inherited;
  dlgGoodsSale:=tdlgGoodsSale.Create(self);
  dlgGoodsSale.showmodel:=0;
  dlgGoodsSale.ShowModal;
  dlgGoodsSale.Free;
  btnpagedown.Enabled:=true;
end;

procedure TfmGoodsSale.ckbCodeClick(Sender: TObject);
begin
  inherited;
   ckbedit(ckbcode,edtcode);
end;

procedure TfmGoodsSale.BitBtn1Click(Sender: TObject);
var
  tj:string;
begin
  inherited;
  /////////////////////////
  if not dmmain.CDSquery.Active  then  exit;
  if ckbcode.Checked then
  begin
    tj:='trim(goods_no)='+''''+trim(edtcode.Text)+'''';
  end;
  /////////可能会造成速度缓慢/////////
  dmmain.CDSquery.Filtered:=false;
  dmmain.CDSquery.Filter:=tj;
  dmmain.CDSquery.Filtered:=true;
end;

procedure TfmGoodsSale.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

procedure TfmGoodsSale.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

end.
