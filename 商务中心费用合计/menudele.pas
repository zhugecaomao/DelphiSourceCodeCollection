unit menudele;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses UDM;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
//修改部门类型
  with dm.ADOTEMP  do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update center');
    SQL.Add('set lx=''1'' where t_time between :ksj and :jsj');
    Parameters.ParamByName('ksj').Value:=DateTimePicker1.Date;
    Parameters.ParamByName('jsj').Value:=DateTimePicker2.Date;
    try
      ExecSQL;
      except
      MessageBox(Handle,'修改数据数失败','系统提示',MB_ICONINFORMATION+MB_OK);
      Exit;
    end;
  end;
  DM.ADOq1.Close;
  DM.ADOq1.Open;
 //修改客人类型
 with dm.ADOTEMP  do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update tableforpeople');
    SQL.Add('set lx=''1'' where rq between :krq and :jrq');
    Parameters.ParamByName('krq').Value:=DateTimePicker1.Date;
    Parameters.ParamByName('jrq').Value:=DateTimePicker2.Date; 
    try
      ExecSQL;
      except
      MessageBox(Handle,'修改数据数失败','系统提示',MB_ICONINFORMATION+MB_OK);
      Exit;
    end;
  end;
  DM.qrykr.Close;
  DM.qrykr.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
  begin
   DateTimePicker1.Date:=Date;
   DateTimePicker2.Date:=Date;
  end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

end.
