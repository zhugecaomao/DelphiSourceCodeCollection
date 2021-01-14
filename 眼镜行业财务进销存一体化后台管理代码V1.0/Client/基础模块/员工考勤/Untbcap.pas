unit Untbcap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB;

type
  TfmBcap = class(TfmBase)
    Panel3: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExit: TBitBtn;
    btnpagedown: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    cmbtop: TComboBox;
    dsview: TDataSource;
    procedure btnExitClick(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
     LocalCount:integer;
    tables,temp,tj:string;
    function readdata():boolean;
  public
    { Public declarations }
  end;

var
  fmBcap: TfmBcap;

implementation

uses untdatadm, func, Untbcaplr;

{$R *.dfm}
//////////////////////////
function  TfmBcap.readdata():boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=false;
  tables:=' * from dp_bcap';
  temp:='select top '+trim(cmbtop.Text);
  sql:=temp+tables+tj;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  try
    datas:=null;
    datas:=adisp.GetRecord(sql);
    if not varisnull(datas) then
    begin
      dmmain.CDSquery.Data:=datas;
      dmmain.CDSquery.Open;
      datas:=null;
    end ;
    LocalCount:=GetKeyFieldValue('id',dmmain.cdsquery);
    result:=true;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit; 
  end;
end;
////////////////////////////////
procedure TfmBcap.btnExitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmBcap.btnpagedownClick(Sender: TObject);
begin
  inherited;
   tj:=' where id >'+inttostr(LocalCount);
  readdata;
end;

procedure TfmBcap.FormShow(Sender: TObject);
begin
  inherited;
  cmbtop.ItemIndex:=0;
  tj:='';
  readdata;
end;

procedure TfmBcap.btnAddClick(Sender: TObject);
begin
  inherited;
  fmbcaplr:=tfmbcaplr.Create(self);
  fmbcaplr.person :='@';
  fmbcaplr.ShowModal;
  fmbcaplr.Free; 
end;

procedure TfmBcap.btnEditClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  fmbcaplr:=tfmbcaplr.Create(self);
  fmbcaplr.person :=trim(dmmain.CDSquery.fieldbyname('person_no').AsString);
  fmbcaplr.edticid.Text :=trim(dmmain.CDSquery.fieldbyname('ic_id').AsString);
  fmbcaplr.edtperson.Text:=trim(dmmain.CDSquery.fieldbyname('person_name').AsString);
  fmbcaplr.edtpartno.Text:=trim(dmmain.CDSquery.fieldbyname('part_no').AsString);
  for i:=1 to 31 do
  begin
  fmbcaplr.gridbase.Cells[i,1]:=trim(dmmain.CDSquery.Fields.Fields[i+4].AsString)
  end;
  fmbcaplr.ShowModal;
  fmbcaplr.Free;
end;

procedure TfmBcap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  inherited;

end;

end.
