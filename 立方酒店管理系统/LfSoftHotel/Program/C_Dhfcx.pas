unit C_Dhfcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, Grids, DBGridEh, DB, DBTables,
  DosMove;

type
  TDhfCxForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtKfbh: TEdit;
    edtBd: TMaskEdit;
    edtEd: TMaskEdit;
    btnQuery: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    edtBt: TMaskEdit;
    edtEt: TMaskEdit;
    dsDhfold: TDataSource;
    qryDhfnew: TQuery;
    DosMove1: TDosMove;
    procedure edtKfbhExit(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FBd,FEd: TDateTime;
    FBt,FEt: string;
    FKfbh: string;
    function GetCxtj: string;
  public
    { Public declarations }
  end;

var
  DhfCxForm: TDhfCxForm;

procedure DhfCx;

implementation

uses C_HotelData, C_Define, C_Wait;

{$R *.dfm}
procedure DhfCx;
begin
  DhfCxForm := TDhfCxForm.Create(Application);
  try
    with DhfCxForm do
    begin
      ShowModal;
    end;
  finally
    DhfCxForm.Free;
  end;
end;

function TDhfCxForm.GetCxtj: string;
var
  s : string;
  aRoom: string;
begin
  FKfbh := edtKfbh.Text;

  if edtBd.Text = '    -  -  ' then FBd := 0
  else
    FBd := StrToDate(edtBd.Text);

  if edtEd.Text = '    -  -  ' then FEd := 0
  else
    FEd := StrToDate(edtEd.Text);

  if (FBd = 0)or(FEd = 0) then
  begin
    ShowMessage('请输全查询日期！');
    Exit;
  end;
  FBt := edtBt.Text;
  FEt := edtEt.Text;
  if Length(FKfbh)=3 then
    ARoom := '1' + FKfbh
  else
    ARoom := FKfbh;
  s := 'select * from DATANEW where (Room="'
      +aRoom
      +'")and((SDate>:BD)or((SDate=:BD)and(STime>"'+FBt+'")))'
      +'and((SDate<:ED)or((SDate=:ED)and(STime<"'+FEt+'")))';//and((SDate<=:ED)and(STime<"'+FEt+'"))';
  Result := s;
end;

procedure TDhfCxForm.edtKfbhExit(Sender: TObject);
var
  aKfxx : TKfxx;
begin
  FKfbh := edtKfbh.Text;
  aKfxx := HotelData.GetKfxx(FKfbh);
  edtBd.Text :=  FormatDateTime('yyyy-mm-dd',aKfxx.ADdrq);
  edtBt.Text :=  FormatDateTime('hh:nn:ss',aKfxx.ADdsj);
  edtEd.Text :=  FormatDateTime('yyyy-mm-dd',Date);
  edtEt.Text :=  FormatDateTime('hh:nn:ss',Time);
end;

procedure TDhfCxForm.btnQueryClick(Sender: TObject);
var
  s : string;
begin
  s := GetCxtj;
  WaitForm := TWaitForm.Create(Application);
  try
    WaitForm.FTitle := '正在统计电话费';
    WaitForm.Show;
    WaitForm.Update;
    qryDhfnew.Close;
    qryDhfnew.DatabaseName := JF_DIR;
    qryDhfnew.SQL.Clear;
    qryDhfnew.SQL.Add(s);
    qryDhfnew.ParamByName('BD').AsDate := FBd;
    qryDhfnew.ParamByName('ED').AsDate := FEd;
    qryDhfNew.Prepare;
    qryDhfNew.Open;
  finally
    WaitForm.Hide;
    WaitForm.Free;
  end;
end;

procedure TDhfCxForm.BitBtn1Click(Sender: TObject);
begin
  qryDhfNew.Close;
  edtKfbh.Text := '';
  edtBd.Text := '';
  edtEd.Text := '';
  edtBt.Text := '';
  edtEt.Text := '';
  edtKfbh.SetFocus;
end;

procedure TDhfCxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '电话费明细表（'+FKfbh+'）';
  APrintStru.ADataSet := qryDhfNew;
  PrintLb1(APrintStru,DBGridEh1);
end;

end.
