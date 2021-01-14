unit Unitxztjt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TeEngine, Series, TeeProcs, Chart, DbChart,
  ExtCtrls, Buttons;

type
  TFormxztjt = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTPks: TDateTimePicker;
    DTPjs: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    CBbm: TComboBox;
    Button2: TButton;
    Button1: TButton;
    Panel2: TPanel;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    SpeedButton1: TSpeedButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formxztjt: TFormxztjt;

implementation
uses UDM;
{$R *.dfm}

procedure TFormxztjt.Button2Click(Sender: TObject);
begin
   Close;
end;

procedure TFormxztjt.FormShow(Sender: TObject);
begin
   DTPks.Date:=Date;
   DTPjs.Date:=Date;

   dm.ADOTJ.Open;
   
   with dm.ADOTEMP do
   begin
     close;
     sql.Clear;
     sql.add('select bumen from bumen_table');
     Prepared;
     Open;
   end;
   CBbm.Items.Clear;
   while not dm.ADOTEMP.Eof do
   begin
     CBbm.Items.Append(DM.ADOTEMP.Fields[0].AsString);
     dm.ADOTEMP.Next;
   end;
end;

procedure TFormxztjt.Button1Click(Sender: TObject);
begin
  dm.ADOTJ.Close;
  dm.ADOTJ.Open;
  if CBbm.Text='' then
  begin
    MessageBox(Handle,'日期部门信息不能为空','系统提示',MB_ICONINFORMATION+MB_OKCANCEL);
  end
  else
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(npage)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''npage''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(wpage)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''wpage''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(b5)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''b5''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(k16)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''k16''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(a4)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''a4''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(b4)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''b4''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(k8)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''k8''');
    Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(a3)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''a3''');
    Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(A42)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''A42''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(K82)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''K82''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(LABAN)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''LABAN''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(chinacall)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''CHINACALL''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(hgcall)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''HGCALL''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(nationcall)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''NATIONCALL''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(SENDOUTSIDE)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''SENDOUTSYDE''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(sendinside)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''SENDINSIDE''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(sendprive)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''SENDPRIVE''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
  with dm.ADOTEMP do
  begin
   Close;
   SQL.Clear;
   SQL.Add('update tjb');
   sql.Add('set jie=(select sum(resivdpage)*0.3 from center where department=:BM and t_time between :KRQ and :JRQ)');
   SQL.Add('where name =''RESIVDPAGE''');
   Parameters.ParamByName('bm').Value:=CBbm.Text;
   Parameters.ParamByName('krq').Value:=DTPks.Date;
   Parameters.ParamByName('jrq').Value:=DTPjs.date;
   Prepared;
   ExecSQL;
  end;
 dm.ADOTEMP.Close;
end;
procedure TFormxztjt.SpeedButton1Click(Sender: TObject);
begin
  DBChart1.Print;
end;

end.
