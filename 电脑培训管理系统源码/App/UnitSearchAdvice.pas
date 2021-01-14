unit UnitSearchAdvice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, ComCtrls, MenuBar, ToolWin, StdCtrls, DB,
  Grids, DBGrids, DsFancyButton, DBCtrls, Mask, DBTables;

type
  TfrmSearchAdvice = class(TBaseFrm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    DS: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    btnReset: TDsFancyButton;
    btnSearch: TDsFancyButton;
    btnSaveAs: TDsFancyButton;
    SD: TSaveDialog;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    btnGraph: TDsFancyButton;
    Q1: TQuery;
    Q1XM: TStringField;
    Q1COUNT: TIntegerField;
    Q3: TQuery;
    Q3ADVICE_TYPE: TStringField;
    Q3COUNT: TIntegerField;
    Q2: TQuery;
    Q2ADVICE_DATE: TDateTimeField;
    Q2COUNT: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
  private
    { Private declarations }
    mSQL,sql1,sql2,sql3,sqlw:string;
  public
    { Public declarations }
  end;

var
  frmSearchAdvice: TfrmSearchAdvice;

implementation

uses UnitDM, UnitData, UnitAdviceGraph;

{$R *.dfm}

procedure TfrmSearchAdvice.FormCreate(Sender: TObject);
begin
  inherited;
sqlw:='';

sql1:='SELECT XM,COUNT(XM),COUNT(XM) FROM T_ADVICE T_advice ';
sql2:='SELECT ADVICE_DATE,COUNT(ADVICE_DATE) FROM T_ADVICE T_advice ';
sql3:='SELECT ADVICE_TYPE,COUNT(ADVICE_TYPE) FROM T_ADVICE T_advice ';

Q1.SQL.Text:=sql1+'GROUP BY XM';
Q1.Open;
Q2.SQL.Text:=sql2+'GROUP BY ADVICE_DATE';
Q2.Open;
Q3.SQL.Text:=sql3+'GROUP BY ADVICE_TYPE';
Q3.Open;

mSQL:='SELECT XM,XM_JP, ADVICE_DATE, WEEK, WEATHER,ADVICE_TYPE,ADVICE_KEY, DETAIL, ANSWER, OPERATOR '
    +'FROM T_ADVICE T_advice ';
DM.Q_Advice.SQL.Text:=mSQL+'ORDER BY XM';
DM.Q_Advice.Open;
end;

procedure TfrmSearchAdvice.CheckBox1Click(Sender: TObject);
begin
  inherited;
ComboBox1.Enabled:=CheckBox1.Checked;
end;

procedure TfrmSearchAdvice.CheckBox2Click(Sender: TObject);
begin
  inherited;
DateTimePicker1.Enabled:=CheckBox2.Checked;
DateTimePicker2.Enabled:=CheckBox2.Checked;
end;

procedure TfrmSearchAdvice.FormDestroy(Sender: TObject);
begin
  inherited;
DM.Q_Advice.Close;
end;

procedure TfrmSearchAdvice.btnResetClick(Sender: TObject);
begin
  inherited;

DM.Q_Advice.SQL.Text:=mSQL;
DM.Q_Advice.Open;

Q1.SQL.Text:=sql1+'GROUP BY XM';
Q1.Open;
Q2.SQL.Text:=sql2+'GROUP BY ADVICE_DATE';
Q2.Open;
Q3.SQL.Text:=sql3+'GROUP BY ADVICE_TYPE';
Q3.Open;
end;

procedure TfrmSearchAdvice.btnSearchClick(Sender: TObject);
begin
  inherited;

DM.Q_Advice.Close;

if CheckBox1.Checked then
begin
    if CheckBox2.Checked then
    begin
        sqlw:='WHERE XM = '+QuotedStr(ComboBox1.Text)
        +' AND ADVICE_DATE BETWEEN '+
        QuotedStr(DateToStr(DateTimePicker1.Date))
        +' AND '+QuotedStr(DateToStr(DateTimePicker2.Date));
    end
    else begin
        sqlw:='WHERE XM='+QuotedStr(ComboBox1.Text);

    end;

end
else begin
    if CheckBox2.Checked then
    begin
    sqlw:='WHERE  ADVICE_DATE BETWEEN '+
        QuotedStr(DateToStr(DateTimePicker1.Date))
        +' AND '+QuotedStr(DateToStr(DateTimePicker2.Date));

    end;
end;
DM.Q_Advice.SQL.Text:=mSQL+sqlw+' ORDER BY XM';
DM.Q_Advice.Open;

Q1.SQL.Text:=sql1+sqlw+'GROUP BY XM';
Q1.Open;
Q2.SQL.Text:=sql2+sqlw+'GROUP BY ADVICE_DATE';
Q2.Open;
Q3.SQL.Text:=sql3+sqlw+'GROUP BY ADVICE_TYPE';
Q3.Open;

end;

procedure TfrmSearchAdvice.FormShow(Sender: TObject);
begin
  inherited;
AddToItem('T_ADVICE','XM',ComboBox1.Items);
DateTimePicker2.Date:=now;
DateTimePicker1.Date:=now-7;

end;

procedure TfrmSearchAdvice.btnSaveAsClick(Sender: TObject);
var
    sl:TStrings;
begin
  inherited;
SD.FileName:='advice.txt';
if DBEdit1.Text<>'' then
  if SD.Execute then
  begin
      sl:=TStringList.Create;
      sl.Add(FormatDateTime('yyyy"年"m"月"d"日由"'+QuotedStr(sOperator+'生成。')+'',now));
      sl.Add('---------------------------------------------');
      sl.Add('---------------------------------------------');
      DM.Q_Advice.First;
      while not DM.Q_Advice.Eof do
      begin
          sl.Add('【'+DM.Q_Advice.FieldByName('XM').AsString+'】');
          sl.Add('【'+DM.Q_Advice.FieldByName('ADVICE_DATE').AsString+'】');
          sl.Add('【'+DM.Q_Advice.FieldByName('WEEK').AsString+'】');
          sl.Add('【'+DM.Q_Advice.FieldByName('WEATHER').AsString+'】');
          sl.Add('KEY:【'+DM.Q_Advice.FieldByName('ADVICE_KEY').AsString+'】');
          sl.Add('QUESTION:『'+DM.Q_Advice.FieldByName('DETAIL').AsString+'』');
          sl.Add('ANSWER:『'+DM.Q_Advice.FieldByName('ANSWER').AsString+'』');
          sl.Add('---------------------------------------------');

          DM.Q_Advice.Next;
      end;
      sl.SaveToFile(SD.FileName);
      sl.Free;
  end;
end;

procedure TfrmSearchAdvice.btnGraphClick(Sender: TObject);
begin
  inherited;
try
    frmAdviceGraph:=TfrmAdviceGraph.Create(nil);
    frmAdviceGraph.Caption:='图表';
    frmAdviceGraph.ShowModal;
    frmAdviceGraph.Free;
except
    Msgs('window');
    frmAdviceGraph.Free;
end;

end;

end.
