unit Unitaddpag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib,Unitaddmx,
  DB, Grids, Wwdbigrd, Wwdbgrid;

type
  TFormaddpage = class(TForm)
    GroupBox1: TGroupBox;
    Bqd: TButton;
    Bet: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edmc: TEdit;
    dxCsl: TdxCurrencyEdit;
    Cbm: TComboBox;
    drq: TDateTimePicker;
    GroupBox2: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    DSBM: TDataSource;
    GroupBox3: TGroupBox;
    RichEdit1: TRichEdit;
    dxljje: TdxCurrencyEdit;
    procedure BetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BqdClick(Sender: TObject);
    procedure dxCslKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure drqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxljjeChange(Sender: TObject);
    procedure dxljjeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   function zhid:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formaddpage: TFormaddpage;

implementation
uses UDM;
{$R *.dfm}

function TFormaddpage.zhid:Integer;
begin
  with dm.ADOTEMP do
  begin
    Close;
    sql.Clear;
    sql.Add('select isnull(max(id),0)+1 from l_assist');
    Prepared;
    Open;
  end;
  Result:=dm.ADOTEMP.Fields[0].AsInteger;
end;


procedure TFormaddpage.BetClick(Sender: TObject);
begin
   Close;
end;

procedure TFormaddpage.FormShow(Sender: TObject);
begin
  dm.ADOalllname.Open;
  dm.ADOl_assist.Open;
  DM.qry1.Open;

  drq.Date:=Date;
  Edmc.Enabled:=False;

   with dm.ADOTEMP do
   begin
     Close;
     SQL.Clear;
     sql.Add('select bumen from bumen_table');
     Prepared;
     Open;
   end;
  Cbm.Items.Clear;
  while not dm.ADOTEMP.Eof do
  begin
    Cbm.Items.Append(dm.ADOTEMP.Fields[0].AsString);
    dm.ADOTEMP.Next;
  end;
  dxCsl.SetFocus;
end;

procedure TFormaddpage.BqdClick(Sender: TObject);
begin
 if Edmc.Text<>'' then
 begin
    if Cbm.Text<>'' then
    begin
      dm.ADOl_assist.Append;
      dm.ADOl_assistID.Value:=zhid;
      dm.ADOl_assistPYNAME.Value:=dm.pyn;
      DM.ADOl_assistZSNAME.Value:=Edmc.Text;
      dm.ADOl_assistJE.Value:=dxCsl.Value;
      dm.ADOl_assistbm.Value:=Cbm.Text;
      dm.ADOl_assistrq.Value:=drq.Date;
      dm.ADOl_assistdm.Value:=DM.hm;
      dm.ADOl_assist.Post;
    end
    else
    MessageBox(Handle,'部门名称不能为空','系统提示',MB_ICONINFORMATION+MB_OKCANCEL);
 end
 else
   MessageBox(Handle,'项目名称不能为空','系统提示',MB_ICONINFORMATION+MB_OKCANCEL);
 with  Formaddmx do
 begin
   dxDBl_assist.FullExpand;
   dxDBall_name.FullExpand;
 end;
 close;
end;

procedure TFormaddpage.dxCslKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=$0D  then
  Cbm.SetFocus;
end;

procedure TFormaddpage.CbmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=$0D then
 drq.SetFocus;
end;

procedure TFormaddpage.drqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=13 then
  BqdClick(Sender);
end;

procedure TFormaddpage.wwDBGrid1DblClick(Sender: TObject);
begin
   Cbm.Text:=DM.qry1.FieldBYNAME('bumen').AsString;
end;

procedure TFormaddpage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.bmmc:=Cbm.Text;
end;

procedure TFormaddpage.dxljjeChange(Sender: TObject);
begin
 dxCsl.Value:=dxCsl.Value+dxljje.Value;

end;

procedure TFormaddpage.dxljjeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
 dxljje.Value:=0;
end;

end.
