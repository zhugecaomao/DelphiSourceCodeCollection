unit C_Ygjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, C_Define,
  DB, DBTables;

type
  TYgjzForm = class(TStandForm)
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    cmbYgxm: TComboBox;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    btnQuery: TBitBtn;
    btnPrint: TBitBtn;
    qryXfxm: TQuery;
    qryXfxmD_XMBH: TStringField;
    qryXfxmSUM: TFloatField;
    qryXfxmSUM_1: TFloatField;
    qryXfxmD_XMMC: TStringField;
    dsXfxm: TDataSource;
    qryJzfs: TQuery;
    qryJzfsD_JZFS: TStringField;
    qryJzfsSUM: TFloatField;
    qryJzfsSUM_1: TFloatField;
    dsJzfs: TDataSource;
    lblXfxm: TLabel;
    lblJzfs: TLabel;
    procedure btnQueryClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YgjzForm: TYgjzForm;

procedure Ygjz;

implementation

uses C_HotelData;

{$R *.dfm}

procedure Ygjz;
begin
  YgjzForm := TYgjzForm.Create(Application);
  try
    with YgjzForm do
    begin
      HotelData.ListMc(cmbYgxm,'YGDA','D_YGXM');
      ShowModal;
    end;
  finally
    YgjzForm.Free;
  end;
end;

procedure TYgjzForm.btnQueryClick(Sender: TObject);
var
  s : string;
begin
  inherited;
  with qryXfxm do
  begin
    Close;
    ParamByName('CZYXM').AsString := cmbYgxm.Text;
    Open;
  end;
  with qryJzfs do
  begin
    Close;
    ParamByName('CZYXM').AsString := cmbYgxm.Text;
    Open;
  end;
  s := 'select sum(D_XFJE-D_YHJE) from KRJZ where (D_CZYXM="'+cmbYgxm.Text+'")and(D_HH<>0)';
  lblXfxm.Caption := CurrToStr(HotelData.SumJe(s))+'元';
  lblJzfs.Caption := lblXfxm.Caption;
end;

procedure TYgjzForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
  s : string;
begin
  s := '';
  with qryJzfs do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      s := s + qryJzfsD_JZFS.Value +':消费'+qryJzfsSUM.AsString+'元 优惠'+qryJzfsSUM_1.AsString+'元；';
      Next;
    end;
    s := s + ' 合计：' + lblXfxm.Caption;
    EnableControls;
  end;
  APrintStru.ATitle := '员工结帐表（'+cmbYgxm.Text+'）';
  APrintStru.ASub   := s;
  APrintStru.ADataSet := qryXfxm;
  PrintLb(APrintStru,DBGrid1);
end;

end.
