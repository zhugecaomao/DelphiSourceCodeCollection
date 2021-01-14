unit C_Yytj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, DB,
  DBTables, DateUtils, C_CtDefine;

type
  TYytjForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    dbgWork: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    dtpBd: TDateTimePicker;
    dtpEd: TDateTimePicker;
    btnQuery: TBitBtn;
    RadioGroup1: TRadioGroup;
    qryXfxm: TQuery;
    dsXfxm: TDataSource;
    lblSh: TLabel;
    lblYh: TLabel;
    lblYy: TLabel;
    qryXfxmXMBH: TStringField;
    qryXfxmXMMC: TStringField;
    qryXfxmXFJE: TFloatField;
    qryXfxmYHJE: TFloatField;
    qryXfxmSHJE: TFloatField;
    qryJzfs: TQuery;
    qryJzfsJZFS: TStringField;
    qryJzfsXFJE: TFloatField;
    qryJzfsYHJE: TFloatField;
    qryJzfsSHJE: TFloatField;
    qryJzyg: TQuery;
    dsJzfs: TDataSource;
    qryJzygCZYXM: TStringField;
    qryJzygXFJE: TFloatField;
    qryJzygYHJE: TFloatField;
    qryJzygSHJE: TFloatField;
    dsJzyg: TDataSource;
    qryJzygJZFS: TStringField;
    qryJzfsJZBS: TIntegerField;
    procedure btnQueryClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FTjlx : Integer;
    procedure ShowHj;
  public
    { Public declarations }
  end;

var
  YytjForm: TYytjForm;

procedure Yytj(ATjlx: Integer);

implementation

{$R *.dfm}

procedure Yytj(ATjlx: Integer);
begin
  YytjForm := TYytjForm.Create(Application);
  try
    with YytjForm do
    begin
      FTjlx := ATjlx;
      RadioGroup1.ItemIndex := FTjlx;
      dtpBd.Date := Date;
      dtpEd.Date := Date;
      ShowModal;
    end;
  finally
    YytjForm.Free;
  end;

end;

procedure TYytjForm.ShowHj;
var
  AYyje,AYhje,AShje: Currency;
begin
  AYyje := 0;AYhje := 0;AShje := 0;
  with dbgWork.DataSource.DataSet do
  begin
    First;
    while not Eof do
    begin
      AYyje := AYyje + FieldByName('XFJE').AsCurrency;
      AYhje := AYhje + FieldByName('YHJE').AsCurrency;
      AShje := AShje + FieldByName('SHJE').AsCurrency;
      Next;
    end;
  end;
  lblYy.Caption := '营业金额：'+CurrToStr(AYyje)+'元';
  lblYh.Caption := '优惠金额：'+CurrToStr(AYhje)+'元';
  lblSh.Caption := '收回金额：'+CurrToStr(AShje)+'元';
end;

procedure TYytjForm.btnQueryClick(Sender: TObject);
var
  I,ColNum : Integer;
  s : string;
  AColumn : TColumn;
  IsToday : Boolean;
begin
  IsToday := False;
  if FormatDateTime('yyyymmdd',dtpBd.Date)=FormatDateTime('yyyymmdd',Date) then
    IsToday := True;
  //qryWork.DisableControls;
  //qryWork.Close;
  //qryWork.SQL.Clear;
  ColNum := dbgWork.Columns.Count;
  for I := ColNum -1 downto  0 do
    dbgWork.Columns.Delete(I);
  FTjlx := RadioGroup1.ItemIndex;
  case FTjlx of
    0://消费项目
    begin
      with qryXfxm do
      begin
        Close;
        SQL.Clear;
      end;
      dbgWork.DataSource := dsXfxm;
      if IsToday then
      s := 'select               a.D_XMBH as XMBH,'
          +       '              b.D_XMMC as XMMC,'
          +       '         sum(a.D_XFJE) as XFJE,'
          +       '         sum(a.D_YHJE) as YHJE,'
          +       'sum(a.D_XFJE-a.D_YHJE) as SHJE'
          +       ' from CTDC a,CTXM b'
          +       ' where (a.D_XMBH=b.D_XMBH)'
          +       ' and (a.D_CTBH = "0") group by a.D_XMBH,b.D_XMMC'

      else
      s := 'select               a.D_XMBH as XMBH,'
          +       '              b.D_XMMC as XMMC,'
          +       '         sum(a.D_XFJE) as XFJE,'
          +       '         sum(a.D_YHJE) as YHJE,'
          +       'sum(a.D_XFJE-a.D_YHJE) as SHJE'
          +       ' from CTDCDA a,CTXM b'
          +       ' where (a.D_XMBH=b.D_XMBH)'
          +       ' and (a.D_XFRQ>=:BD) and (a.D_XFRQ<=:ED)'
          +       ' and (a.D_CTBH = "0") group by a.D_XMBH,b.D_XMMC';

      qryXfxm.SQL.Add(s);
      if not IsToday then
      begin
        qryXfxm.ParamByName('BD').AsDate := dtpBd.Date;
        qryXfxm.ParamByName('ED').AsDate := dtpEd.Date;
      end;
      qryXfxm.Open;

      with dbgWork do
      begin
        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XMBH';
        AColumn.Title.Caption   := '项目编号';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XMMC';
        AColumn.Title.Caption   := '项目名称';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XFJE';
        AColumn.Title.Caption   := '消费金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'YHJE';
        AColumn.Title.Caption   := '优惠金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'SHJE';
        AColumn.Title.Caption   := '收回金额';
        AColumn.Title.Alignment := taCenter;

      end;
    end;
    1://结帐方式
    begin
      with qryJzfs do
      begin
        Close;
        SQL.Clear;
      end;
      dbgWork.DataSource := dsJzfs;
      if IsToday then
      s := 'select               a.D_JZFS as JZFS,'
          +       '         count(*) as JZBS,'
          +       '         sum(a.D_XFJE) as XFJE,'
          +       '         sum(a.D_YHJE) as YHJE,'
          +       'sum(a.D_XFJE-a.D_YHJE) as SHJE'
          +       ' from CTDC a'
          +       ' where (a.D_CTBH = "0") group by a.D_JZFS'

      else
      s := 'select               a.D_JZFS as JZFS,'
          +       '         count(*) as JZBS,'
          +       '         sum(a.D_XFJE) as XFJE,'
          +       '         sum(a.D_YHJE) as YHJE,'
          +       'sum(a.D_XFJE-a.D_YHJE) as SHJE'
          +       ' from CTDCDA a'
          +       ' where (a.D_XFRQ>=:BD) and (a.D_XFRQ<=:ED)'
          +       ' and (a.D_CTBH = "0") group by a.D_JZFS';

      qryJzfs.SQL.Add(s);
      if not IsToday then
      begin
        qryJzfs.ParamByName('BD').AsDate := dtpBd.Date;
        qryJzfs.ParamByName('ED').AsDate := dtpEd.Date;
      end;
      qryJzfs.Open;

      with dbgWork do
      begin

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'JZFS';
        AColumn.Title.Caption   := '结帐方式';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'JZBS';
        AColumn.Title.Caption   := '结帐笔数';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XFJE';
        AColumn.Title.Caption   := '消费金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'YHJE';
        AColumn.Title.Caption   := '优惠金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'SHJE';
        AColumn.Title.Caption   := '收回金额';
        AColumn.Title.Alignment := taCenter;

      end;
    end;
    2://按员工
    begin
      with qryJzyg do
      begin
        Close;
        SQL.Clear;
      end;
      dbgWork.DataSource := dsJzyg;
      if IsToday then
      s := 'select               a.D_CZYXM as CZYXM,a.D_JZFS as JZFS,'
          +       '         sum(a.D_XFJE) as XFJE,'
          +       '         sum(a.D_YHJE) as YHJE,'
          +       'sum(a.D_XFJE-a.D_YHJE) as SHJE'
          +       ' from CTDC a'
          +       ' where (a.D_CTBH = "0") group by a.D_CZYXM,a.D_JZFS'

      else
      s := 'select               a.D_CZYXM as CZYXM,a.D_JZFS as JZFS,'
          +       '         sum(a.D_XFJE) as XFJE,'
          +       '         sum(a.D_YHJE) as YHJE,'
          +       'sum(a.D_XFJE-a.D_YHJE) as SHJE'
          +       ' from CTDCDA a'
          +       ' where (a.D_XFRQ>=:BD) and (a.D_XFRQ<=:ED)'
          +       ' and (a.D_CTBH = "0") group by a.D_CZYXM,a.D_JZFS';
     qryJzyg.SQL.Add(s);
     if not IsToday then
     begin
       qryJzyg.ParamByName('BD').AsDate := dtpBd.Date;
       qryJzyg.ParamByName('ED').AsDate := dtpEd.Date;
     end;
     qryJzyg.Open;

      with dbgWork do
      begin

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'CZYXM';
        AColumn.Title.Caption   := '操作员';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'JZFS';
        AColumn.Title.Caption   := '结帐方式';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'XFJE';
        AColumn.Title.Caption   := '消费金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'YHJE';
        AColumn.Title.Caption   := '优惠金额';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'SHJE';
        AColumn.Title.Caption   := '收回金额';
        AColumn.Title.Alignment := taCenter;

      end;

    end;

  end;
  ShowHj;
  //qryWork.EnableControls;
end;

procedure TYytjForm.btnPrintClick(Sender: TObject);
var
  APrintStru : TPrintStru;
begin
  APrintStru.ATitle := '营业统计（'+RadioGroup1.Items[RadioGroup1.ItemIndex]+'）';
  APrintStru.ASub   := lblYy.Caption+' '+lblYh.Caption+' '+lblSh.Caption;
  APrintStru.ADataSet := dbgWork.DataSource.DataSet;
  PrintLb(APrintStru,dbgWork);
end;

end.
