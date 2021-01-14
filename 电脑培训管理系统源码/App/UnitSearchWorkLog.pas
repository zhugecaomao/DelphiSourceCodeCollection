unit UnitSearchWorkLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, ComCtrls, MenuBar, ToolWin, StdCtrls, DB,
  Grids, DBGrids, DsFancyButton, DBCtrls, Mask, DBTables;

type
  TfrmSearchWorkLog = class(TBaseFrm)
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
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    SD: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
  private
    { Private declarations }
    mSQL:string;
  public
    { Public declarations }
  end;

var
  frmSearchWorkLog: TfrmSearchWorkLog;

implementation

uses UnitDM, UnitData;

{$R *.dfm}

procedure TfrmSearchWorkLog.FormCreate(Sender: TObject);
begin
  inherited;
mSQL:='SELECT BH, LOG_DATE, WEEK, WEATHER, DETAIL, OPERATOR '
    +'FROM T_WORK_LOG T_work_log ';
DM.Q_Work_Log.SQL.Text:=mSQL+'ORDER BY BH';
DM.Q_Work_Log.Open;
end;

procedure TfrmSearchWorkLog.CheckBox1Click(Sender: TObject);
begin
  inherited;
ComboBox1.Enabled:=CheckBox1.Checked;
end;

procedure TfrmSearchWorkLog.CheckBox2Click(Sender: TObject);
begin
  inherited;
DateTimePicker1.Enabled:=CheckBox2.Checked;
DateTimePicker2.Enabled:=CheckBox2.Checked;
end;

procedure TfrmSearchWorkLog.FormDestroy(Sender: TObject);
begin
  inherited;
DM.Q_Work_Log.Close;
end;

procedure TfrmSearchWorkLog.btnResetClick(Sender: TObject);
begin
  inherited;
DM.Q_Work_Log.Close;
DM.Q_Work_Log.SQL.Text:=mSQL;
DM.Q_Work_Log.Open;

end;

procedure TfrmSearchWorkLog.btnSearchClick(Sender: TObject);
begin
  inherited;
if CheckBox1.Checked then
begin
    if CheckBox2.Checked then
    begin
        DM.Q_Work_Log.Close;
        DM.Q_Work_Log.SQL.Text:=mSQL
            +'WHERE BH = :BH AND LOG_DATE BETWEEN :DATE1 AND :DATE2 ORDER BY BH';
        DM.Q_Work_Log.ParamByName('BH').DataType:=ftString;
        DM.Q_Work_Log.ParamByName('DATE1').DataType:=ftDate;
        DM.Q_Work_Log.ParamByName('DATE2').DataType:=ftDate;

        DM.Q_Work_Log.ParamByName('BH').AsString:=
            GetValue('T_PERSON','NAME','BH',ComboBox1.Text);
        DM.Q_Work_Log.ParamByName('DATE1').AsDate:=DateTimePicker1.Date;
        DM.Q_Work_Log.ParamByName('DATE2').AsDate:=DateTimePicker2.Date;
        DM.Q_Work_Log.Open;
    end
    else begin
        DM.Q_Work_Log.Close;
        DM.Q_Work_Log.SQL.Text:=mSQL
            +'WHERE BH = :BH ORDER BY BH';
        DM.Q_Work_Log.ParamByName('BH').DataType:=ftString;
        DM.Q_Work_Log.ParamByName('BH').AsString:=
            GetValue('T_PERSON','NAME','BH',ComboBox1.Text);
        DM.Q_Work_Log.Open;
    end;

end
else begin
    if CheckBox2.Checked then
    begin
        DM.Q_Work_Log.Close;
        DM.Q_Work_Log.SQL.Text:=mSQL
            +'WHERE LOG_DATE BETWEEN :DATE1 AND :DATE2 ORDER BY BH';
        DM.Q_Work_Log.ParamByName('DATE1').DataType:=ftDate;
        DM.Q_Work_Log.ParamByName('DATE2').DataType:=ftDate;

        DM.Q_Work_Log.ParamByName('DATE1').AsDate:=DateTimePicker1.Date;
        DM.Q_Work_Log.ParamByName('DATE2').AsDate:=DateTimePicker2.Date;
        DM.Q_Work_Log.Open;

    end;
end;
end;

procedure TfrmSearchWorkLog.FormShow(Sender: TObject);
begin
  inherited;
AddToItem('T_PERSON','NAME',ComboBox1.Items,true,'XTYPE='+QuotedStr('20'));

DateTimePicker2.Date:=now;
DateTimePicker1.Date:=now-7;
end;

procedure TfrmSearchWorkLog.btnSaveAsClick(Sender: TObject);
var
    sl:TStrings;
begin
  inherited;
SD.FileName:='Log.txt';
if DBEdit1.Text<>'' then
  if SD.Execute then
  begin
      sl:=TStringList.Create;
      sl.Add(FormatDateTime('yyyy"年"m"月"d"日由"'+QuotedStr(sOperator+'生成。')+'',now));
      sl.Add('---------------------------------------------');
      sl.Add('---------------------------------------------');
      DM.Q_Work_Log.First;
    while not DM.Q_Work_Log.Eof do
      begin
          sl.Add('【'+DM.Q_Work_Log.FieldByName('BH_MC').AsString+'】');
          sl.Add('【'+DM.Q_Work_Log.FieldByName('LOG_DATE').AsString+'】');
          sl.Add('【'+DM.Q_Work_Log.FieldByName('WEEK').AsString+'】');
          sl.Add('【'+DM.Q_Work_Log.FieldByName('WEATHER').AsString+'】');
          //sl.Add('〖内容〗');
          sl.Add('『'+DM.Q_Work_Log.FieldByName('DETAIL').AsString+'』');
          sl.Add('---------------------------------------------');

          DM.Q_Work_Log.Next;
      end;
      sl.SaveToFile(SD.FileName);
      sl.Free;
  end;
end;

end.
