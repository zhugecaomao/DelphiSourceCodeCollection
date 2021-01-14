unit Unithuz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFormhuz = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DKSR: TMonthCalendar;
    GroupBox2: TGroupBox;
    DJSR: TMonthCalendar;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formhuz: TFormhuz;

implementation
USES UDM;
{$R *.dfm}

procedure TFormhuz.FormShow(Sender: TObject);
begin
  DKSR.Date:=Date;
  DJSR.Date:=Date;
end;

procedure TFormhuz.Button1Click(Sender: TObject);
begin
  try
   dm.adocon1.BeginTrans;
   DM.ADOHZ.Close;
   DM.ADOHZ.Parameters.ParamByName('@krq').Value:=DKSR.Date;
   DM.ADOHZ.Parameters.ParamByName('@jrq').Value:=DKSR.Date;
   DM.ADOHZ.ExecProc;

   with dm.ADOTEMP do
   begin
     Close;
     SQL.Clear;
     sql.Add('delete from l_assist');
     sql.Add('where rq between :Krq and :jsr');
     Parameters.ParamByName('krq').Value:=DKSR.Date;
     Parameters.ParamByName('jsr').Value:=DKSR.Date;
     Prepared;
     ExecSQL;
   end;
   dm.adocon1.CommitTrans;
   except
   dm.adocon1.RollbackTrans;
  end;
  dm.ADOl_assist.Close;
  dm.ADOl_assist.Open;

  dm.qrykr.Close;
  dm.qrykr.Open;

  dm.ADOq1.Close;
  dm.ADOq1.Open;
  Close;

end;

procedure TFormhuz.Button2Click(Sender: TObject);
begin
   Close;
end;

end.
