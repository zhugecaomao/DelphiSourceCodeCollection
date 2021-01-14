unit Stock_Fad_Query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls,ComCtrls;

type
  TfrmStock_Fad_Query = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtnClose: TBitBtn;
    Panel3: TPanel;
    js: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    SpeedButton10: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    jsr: TComboBox;
    zdr: TComboBox;
    djbh: TComboBox;
    rq1: TMaskEdit;
    rq2: TMaskEdit;
    thck: TComboBox;
    DB: TDBGrid;
    dscheck: TDataSource;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    dsdetail: TDataSource;
    procedure BtnCloseClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStock_Fad_Query: TfrmStock_Fad_Query;

implementation

uses untdatadm, Data,func;

{$R *.dfm}

procedure TfrmStock_Fad_Query.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStock_Fad_Query.SpeedButton10Click(Sender: TObject);
var
  sqlpub:widestring;
  T_date:Tdatetime;  //测试录单日期用
  i:integer;
begin
  sqlpub:='select * from [Cancel_strip] where 1=1 and stock_name='+''''+trim('采购退货')+'''';
  if trim(thck.Text)<>'' then sqlpub:=sqlpub+' and Storage_NO='+''''+trim(thck.Text)+'''';
  if trim(djbh.Text)<>'' then sqlpub:=sqlpub+' and Stock_No='+''''+trim(djbh.Text)+'''';
  if trim(jsr.Text)<>'' then sqlpub:=sqlpub+' and Transactor='+''''+trim(jsr.Text)+'''';
  if trim(zdr.Text)<>'' then sqlpub:=sqlpub+' and Proposer='+''''+trim(zdr.Text)+'''';
  if (rq1.Text<>'    -  -  ') and (rq2.Text<>'    -  -  ') then
  begin
    try
      t_date:=strtodate(rq1.Text);
      t_date:=strtodate(rq2.Text);
      sqlpub:=sqlpub+' and Copy_Date between '+''''+rq1.Text+''''+' and '+''''+rq2.Text+'''';
    except
      showmessage('您输入的录单日期有误，请重新输入！');
      exit;
    end;
  end else
  begin
    rq1.Text:='';
    rq2.Text:='';
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=adisp.GetRecord(sqlpub);
  dmmain.CDSquery.Open;
end;

procedure TfrmStock_Fad_Query.DBDblClick(Sender: TObject);
var
  sql:widestring;
begin
  if dmmain.CDSquery.IsEmpty then exit;
  sql:='select * from [Cancel_strip_detail] where stock_no='+''''+trim(dmmain.CDSquery.fieldbyname('stock_no').AsString)+'''';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  try
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    dbgrid1.Visible:=true;
  except
    application.MessageBox('服务器终止服务！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure TfrmStock_Fad_Query.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF DBGRID1.Visible THEN
  BEGIN
    if key=vk_Escape then
  DBGRID1.Visible :=FALSE;
  END ELSE
  BEGIN
    IF KEY=VK_F1 THEN
    DBDblClick(DB);
  END;
end;

procedure TfrmStock_Fad_Query.FormShow(Sender: TObject);
begin
  dmmain.CDSquery.Close;
  dmmain.CDSquery2.Close;
end;

procedure TfrmStock_Fad_Query.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
   DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  Action:=caFree;
end;

end.
