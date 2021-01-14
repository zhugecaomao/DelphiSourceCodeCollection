unit UnitWork_Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDBForm, ComCtrls, DBCtrls, ExtCtrls, MenuBar, ToolWin,
  StdCtrls, Mask, DB, DBTables;

type
  TfrmWork_Log = class(TBaseDBFrm)
    TV: TTreeView;
    Splitter1: TSplitter;
    Panel1: TPanel;
    DS: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Q: TQuery;
    DBComboBox1: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    mXM:string;
    mSQL:string;
    sl:TStrings;
    tn:TTreeNode;
    procedure AddDateToList;
    function ReturnNode(ss:string):TTreeNode;
    procedure AddToTv;
  public
    { Public declarations }
  end;

var
  frmWork_Log: TfrmWork_Log;

implementation

uses UnitDM, UnitData;

{$R *.dfm}

procedure TfrmWork_Log.FormCreate(Sender: TObject);
begin
  inherited;
sl:=TStringList.Create;

mSQL:='SELECT BH, LOG_DATE, WEEK, WEATHER, DETAIL, OPERATOR '
    +'FROM T_WORK_LOG T_work_log '
    +'WHERE BH='+QuotedStr(sWorker);

AddToItem('DICT_WEATHER','WEATHER_MC',DBComboBox1.Items);
end;

procedure TfrmWork_Log.ToolButton1Click(Sender: TObject);
begin
  inherited;
DN.DataSource.DataSet.FieldByName('BH').AsString:=sWorker;
DN.DataSource.DataSet.FieldByName('LOG_DATE').AsString:=DateToStr(now);
DN.DataSource.DataSet.FieldByName('OPERATOR').AsString:=sOperator;

end;

procedure TfrmWork_Log.FormShow(Sender: TObject);
begin
  inherited;
DM.Q_Work_Log.Close;
DM.Q_Work_Log.SQL.Text:=mSQL;
DM.Q_Work_Log.Open;

mXM:='【工作日志】';
Q.Close;
Q.SQL.Text:='SELECT NAME FROM T_PERSON WHERE BH='+QuotedStr(sWorker);
Q.Open;
if Q.RecordCount>0 then
    mXM:='【'+Q.Fields.Fields[0].AsString+'】工作日志';

AddToTv;

DM.Q_Work_Log.First;
end;

procedure TfrmWork_Log.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.Q_Work_Log.Close;
end;

procedure TfrmWork_Log.AddToTv;
var
    ii:integer;
begin
AddDateToList;

TV.Items.Clear;

for ii:=0 to sl.Count-1 do
begin
    tn:=ReturnNode(sl[ii]);

    tn:=TV.Items.AddChild(tn,sl[ii]);
end;
if TV.Items.Count>0 then
    TV.Items[0].Expanded:=true;
if TV.Items.Count>3 then
begin
    TV.Items[1].Expanded:=true;
    TV.Items[2].Expanded:=true;
end;
end;

procedure TfrmWork_Log.AddDateToList;
var
    ii:integer;
begin
sl.Clear;
Q.Close;
Q.SQL.Text:='SELECT DISTINCT(LOG_DATE) FROM T_WORK_LOG '
    +'WHERE BH='+QuotedStr(sWorker)+' ORDER BY LOG_DATE';
Q.Open;
if Q.RecordCount>0 then
begin
    for ii:=1 to Q.RecordCount do
    begin
        sl.Add(Q.Fields.Fields[0].AsString);
        Q.Next;
    end;
end;
end;

function TfrmWork_Log.ReturnNode(ss: string): TTreeNode;
var
    mDate:TDateTime;
    sYear,sMonth:string;
    tn1:TTreeNode;
    ii,i,iNode1:integer;
    flag,flag1:Boolean;
begin
    try
        iNode1:=0;

        if TV.Items.Count=0 then
            tn:=TV.Items.AddFirst(nil,mXM);

        mDate:=StrToDate(ss);
        sYear:=FormatDateTime('yyyy"年"',mDate);
        sMonth:=FormatDateTime('m"月"',mDate);
        flag:=false;//假定没有与这一年的结点
        flag1:=false;
        for ii:=0 to TV.Items.Count-1 do
        begin
            if TV.Items[ii].Text=sYear then
            begin
                iNode1:=ii;
                flag1:=true;
                
                for i:=0 to TV.Items[ii].Count-1 do
                begin
                    if TV.Items[ii].Item[i].Text=sMonth then
                    begin
                        flag:=true;
                        result:=TV.Items[ii].Item[i];
                    end;
                end;
            end;
        end;
        if not flag1 then //如果没有则新增一个
        begin
            tn1:=TV.Items.AddChildFirst(TV.Items[0],sYear);
            tn1:=TV.Items.AddChild(tn1,sMonth);
            result:=tn1;
        end
        else if not flag then
        begin
            tn1:=TV.Items.AddChild(TV.Items[iNode1],sMonth);
            result:=tn1;
         end;
    except

    end;
end;

procedure TfrmWork_Log.FormDestroy(Sender: TObject);
begin
  inherited;
sl.Free;
end;

procedure TfrmWork_Log.ToolButton4Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
begin
    DN.DataSource.DataSet.Post;
    TQuery(DN.DataSource.DataSet).ApplyUpdates;
    TQuery(DN.DataSource.DataSet).First;
end;
AddToTv;
end;

procedure TfrmWork_Log.TVChange(Sender: TObject; Node: TTreeNode);
var
    mXm,mDate,mType,ss:string;
begin
  inherited;
//根据日期分类
    if Node.getFirstChild=nil then
    begin
        DM.Q_Work_Log.Close;
        DM.Q_Work_Log.SQL.Text:=mSQL+' AND LOG_DATE='+QuotedStr(Node.Text);
        DM.Q_Work_Log.Open;
        DM.Q_Work_Log.First;
    end;
end;

procedure TfrmWork_Log.ToolButton2Click(Sender: TObject);
begin
  inherited;

  AddToTv;
end;

end.
