unit Uwpsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, Mask,
  DBCtrls, Grids, DBGrids, ComCtrls, DB;

type
  TF_wpsz = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button3: TButton;
    DSwpsz: TDataSource;
    edt1: TEdit;
    edt2: TEdit;
    dxCurrencyEdit1: TdxCurrencyEdit;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edt2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxCurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_wpsz: TF_wpsz;

implementation
uses UDM;
{$R *.dfm}

procedure TF_wpsz.Button3Click(Sender: TObject);
begin

  close;
end;

procedure TF_wpsz.FormShow(Sender: TObject);
var
  counter:Integer;
  id:string;
begin
  edt1.Enabled:=False;
  edt1.Color:=clScrollBar;
   with F_wpsz do
    begin
     with DM.qrycount do
     begin
      Filter:='id=''WP''';
      Filtered:=true;
      open;
      counter:=fieldbyname('countervalues').AsInteger;
      inc(counter);
      edit;
      fieldbyname('countervalues').AsInteger:=counter;
      post;
      close;
     end;
     id:='000'+inttostr(counter);
     id:=copy(id,length(id)-3,4);
     id:=formatdatetime('yyyy',now)+id;
     Edt1.Text:=id;
    end;


end;

procedure TF_wpsz.Button1Click(Sender: TObject);
begin
  if Edt2.Text = '' then
  begin
    MessageBox(Handle,'物品名称不能为空！','系统提示',MB_ICONINFORMATION+MB_OK);
    Exit;
  end;
  if  not dm.Qwpsz.Locate('bm',Edt1.Text,[]) then
  begin
   dm.Qwpsz.Append;
   dm.Qwpszbm.Value:=edt1.Text;
   dm.Qwpszmc.Value:=edt2.Text;
   dm.Qwpszdanja.Value:=dxCurrencyEdit1.Value;
   dm.Qwpsz.Post;
   ShowMessage('物品录入成功!');
  end
  else
  ShowMessage('物品编码有重复！');

  Self.Close;
end;

procedure TF_wpsz.edt2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if Key=$0D then
  dxCurrencyEdit1.SetFocus;
end;

procedure TF_wpsz.dxCurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
 Button1Click(Sender);
end;

end.
