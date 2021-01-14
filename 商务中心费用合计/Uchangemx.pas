unit Uchangemx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, Grids, ComCtrls,
  Buttons, DB, Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TFchangemx = class(TForm)
    pgc1: TPageControl;
    pnl1: TPanel;
    ts1: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    dsXG: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    cbbry: TComboBox;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    procedure btn4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
    { Public declarations }
  end;

var
  Fchangemx: TFchangemx;

implementation
uses UDM,Uczjl;
{$R *.dfm}


procedure TFchangemx.btn4Click(Sender: TObject);
begin
 CLOSE;
end;

procedure TFchangemx.btn1Click(Sender: TObject);
begin
  if (dtp1.Date <> null)and (cbbry.Text <>'') then
  begin
    with dm.qrydatereport do
    begin
      Close;
      sql.Clear;
      sql.Add('select * from datereport');
      sql.Add('where lx=:vlx and rq=:vrq');
      Parameters.ParamByName('vlx').Value:=cbbry.Text;
      Parameters.ParamByName('vrq').Value:=dtp1.Date;
      Prepared;
      Open;
    end;
  end
  else
  MessageBox(Handle,'查询时间,类型不能为空','系统提示',MB_ICONINFORMATION+MB_OKCANCEL);
end;

procedure TFchangemx.btn2Click(Sender: TObject);
begin
  dm.qrydatereport.CancelUpdates;
end;

procedure TFchangemx.wwDBGrid1DblClick(Sender: TObject);
begin
  Fczjl:=TFczjl.Create(Self);
   with Fczjl do
   begin
     dxEdmx.Text :=dm.qrydatereportnamemx.Value;
     dxEdlx.Text :=dm.qrydatereportlx.Value;
     Ed1.Value :=dm.qrydatereportshuliang.Value;
     Ed2.Value :=dm.qrydatereportje.Value;
   end;
   Fczjl.ShowModal;
  FreeAndNil(Fczjl);

end;

procedure TFchangemx.FormShow(Sender: TObject);
begin
 dtp1.Date:=Date;
end;

end.
