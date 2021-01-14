unit UntMoneyStaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, DBGrids, Grids, ExtCtrls, DB;

type
  TfmMoneyStaff = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbtop: TComboBox;
    Panel2: TPanel;
    Gridbase: TStringGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    dsview: TDataSource;
    DBGrid1: TDBGrid;
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    LocalCount:integer;
    procedure readdata;
  public
    { Public declarations }
    temp,tj,tables:string;
    model:integer;
  end;

var
  fmMoneyStaff: TfmMoneyStaff;

implementation

uses untdatadm, func,fm_SetColumn;
{$R *.dfm}
procedure TfmMoneyStaff.readdata;
var
  tempsql:widestring;
  datas:olevariant;
begin
  temp:=' select top '+trim(cmbtop.Text);
  tables:=' * from [Supply_Company] where 1=1';
  tempsql:=temp+tables+tj;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  try
    datas:=   adisp.GetRecord(tempsql);
    if not varisnull(datas) then
    begin
    dmmain.CDSquery.Data:=datas;
    dmmain.CDSquery.Open;
    LocalCount := GetKeyFieldValue('id',dmmain.cDSquery);   //传入具体字段
    end;
  except
  end;
end;
procedure TfmMoneyStaff.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmMoneyStaff.FormShow(Sender: TObject);
begin
  inherited;
  if model=0 then
  begin
    tj:='';
  end else
  begin
    tj:=' and Must_gather>contact';
  end;
  cmbtop.ItemIndex:=0;
  dbgCur:=dbgrid1;
  readdata;
end;

procedure TfmMoneyStaff.btnpagedownClick(Sender: TObject);
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
  temp:=temp+tables+tj+' and id>'+inttostr(localcount);
  try
  datas:=adisp.GetRecord(temp);
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

procedure TfmMoneyStaff.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmMoneyStaff.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.CDSquery,dbgrid1,column);
end;

procedure TfmMoneyStaff.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
end;

procedure TfmMoneyStaff.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

procedure TfmMoneyStaff.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

end.
