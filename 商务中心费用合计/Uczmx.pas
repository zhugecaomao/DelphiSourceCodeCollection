unit Uczmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, DB;

type
  TFczmx = class(TForm)
    grp1: TGroupBox;
    DBGcode: TwwDBGrid;
    grp2: TGroupBox;
    ds1: TDataSource;
    cbbry: TComboBox;
    lbl1: TLabel;
    btn1: TButton;
    btn2: TButton;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbryChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fczmx: TFczmx;

implementation
uses UDM;
{$R *.dfm}

procedure TFczmx.btn2Click(Sender: TObject);
begin
    if cbbry.Text <>'' then
    begin
      with dm.qryczjl do
      begin
        Close;
        sql.Clear;
        sql.Add('select * from czjl');
        sql.Add('where czyxm=:vxm');
        Parameters.ParamByName('vxm').Value:=cbbry.Text;
        Prepared;
        Open;
      end;
    end
    else
    MessageBox(Handle,'操作员姓名不能为空！','系统提示',MB_ICONINFORMATION+MB_OKCANCEL);
end;

procedure TFczmx.FormShow(Sender: TObject);
begin
  with DM.ADOTEMP do
  begin
    Close;
    sql.Clear;
    sql.Add('select czyxm from psw_ta');
    Prepared;
    Open;
  end;
  cbbry.Items.Clear;
  while not dm.ADOTEMP.Eof do
  begin
    cbbry.Items.Append(dm.ADOTEMP.Fields[0].AsString);
    dm.ADOTEMP.Next;
  end;
end;

procedure TFczmx.cbbryChange(Sender: TObject);
begin
      with dm.qryczjl do
      begin
        Close;
        sql.Clear;
        sql.Add('select * from czjl');
        sql.Add('where czyxm=:vxm');
        Parameters.ParamByName('vxm').Value:=cbbry.Text;
        Prepared;
        Open;
      end;
end;

procedure TFczmx.btn1Click(Sender: TObject);
begin
 close;
end;

end.
