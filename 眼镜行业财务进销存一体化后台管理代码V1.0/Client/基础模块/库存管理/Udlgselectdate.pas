unit Udlgselectdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  Tdlgselectdate = class(TfmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtpbegin: TDateTimePicker;
    Label3: TLabel;
    dtpend: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    model:integer;
    records:string;
  end;

var
  dlgselectdate: Tdlgselectdate;

implementation

uses func, untdatadm,  Ustocking;

{$R *.dfm}

procedure Tdlgselectdate.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tdlgselectdate.FormShow(Sender: TObject);
begin
  inherited;
  dtpbegin.Date:=date-30;
  dtpend.Date:=date;
end;

procedure Tdlgselectdate.btnOkClick(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
begin
  inherited;
  temp:='exec LS_stocktotalstaff '+'0'+','+''''+formatdatetime('yyyy''-''mm''-''dd',dtpbegin.Date)+''''+','+''''+formatdatetime('yyyy''-''mm''-''dd',dtpend.Date)+''''+','+inttostr(model)+','+''''+fmstocking.storage+'''';
  try
  datas:=null;
  datas:=adisp.GetRecord(temp);
  if not varisnull(datas) then
  begin
    dmmain.CDSquery.Data:=datas;
    dmmain.CDSquery.Open;
    datas:=null;
  end;
  fmstocking.tables:='exec LS_stocktotalstaff ';
  fmstocking.tempsql:=','+''''+formatdatetime('yyyy''-''mm''-''dd',dtpbegin.Date)+''''+','+''''+formatdatetime('yyyy''-''mm''-''dd',dtpend.Date)+''''+','+inttostr(model);
  fmstocking.storage:='';
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;

  close;
end;

end.
