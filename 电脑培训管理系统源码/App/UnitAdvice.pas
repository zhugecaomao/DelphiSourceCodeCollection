unit UnitAdvice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDBForm, ComCtrls, DBCtrls, ExtCtrls, MenuBar, ToolWin,
  StdCtrls, Grids, DBGrids, DB, DsFancyButton, Mask, DBTables;

type
  TfrmAdvice = class(TBaseDBFrm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    DS: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    btnFind: TDsFancyButton;
    btnReset: TDsFancyButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    TV: TTreeView;
    r_Type: TRadioButton;
    r_Date: TRadioButton;
    r_Xm: TRadioButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    Label10: TLabel;
    DBMemo2: TDBMemo;
    DBComboBox1: TDBComboBox;
    Q: TQuery;
    Q1: TQuery;
    DBComboBox2: TDBComboBox;
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure r_DateClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure r_TypeClick(Sender: TObject);
    procedure r_XmClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure btnFindClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    mSQL:string;
    sl:TStrings;
    tn:TTreeNode;
    procedure AddDateToList;
    function ReturnNode(ss:string):TTreeNode;
    procedure SearchDate;
    procedure SearchType;
    procedure SearchXm;

    procedure Search_R;
  public
    { Public declarations }
  end;

var
  frmAdvice: TfrmAdvice;

implementation

uses UnitData, UnitDM;

{$R *.dfm}

procedure TfrmAdvice.ToolButton4Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
begin
    DN.DataSource.DataSet.Post;
    TQuery(DN.DataSource.DataSet).ApplyUpdates;
    TQuery(DN.DataSource.DataSet).First;
end;
end;

procedure TfrmAdvice.ToolButton1Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
begin
    DN.DataSource.DataSet.FieldByName('ADVICE_DATE').AsString:=DateToStr(now);
    DN.DataSource.DataSet.FieldByName('OPERATOR').AsString:=sOperator;

end;
end;
procedure TfrmAdvice.FormCreate(Sender: TObject);
begin
  inherited;
mSQL:='SELECT XM,XM_JP, ADVICE_DATE, WEEK, WEATHER,ADVICE_TYPE,ADVICE_KEY, DETAIL, ANSWER, OPERATOR '
    +'FROM T_ADVICE T_advice ';
sl:=TStringList.Create;
DN.DataSource.DataSet.Active:=true;

end;

procedure TfrmAdvice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
DN.DataSource.DataSet.Active:=false;
end;

procedure TfrmAdvice.FormDestroy(Sender: TObject);
begin
  inherited;
sl.Free;
end;

procedure TfrmAdvice.AddDateToList;
var
    ii:integer;
begin
sl.Clear;

Q.Close;
if r_Date.Checked then
    Q.SQL.Text:='SELECT DISTINCT(ADVICE_DATE) FROM T_ADVICE ORDER BY ADVICE_DATE';
if r_Type.Checked then
    Q.SQL.Text:='SELECT DISTINCT(ADVICE_TYPE) FROM T_ADVICE';
if r_Xm.Checked then
    Q.SQL.Text:='SELECT DISTINCT(XM) FROM T_ADVICE';


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

procedure TfrmAdvice.SearchDate;
var
    ii:integer;
    //mDate:TDateTime;
begin
TV.Items.Clear;

    for ii:=0 to sl.Count-1 do
    begin
        tn:=ReturnNode(sl[ii]);
        //mDate:=StrToDate(sl[ii]);

        tn:=TV.Items.AddChild(tn,sl[ii]);
    end;
end;

procedure TfrmAdvice.r_DateClick(Sender: TObject);
begin
  inherited;
AddDateToList;
SearchDate;

end;

function TfrmAdvice.ReturnNode(ss: string): TTreeNode;
var
    mDate:TDateTime;
    sYear,sMonth:string;
    tn1:TTreeNode;
    ii,i,iNode1:integer;
    flag,flag1:Boolean;
begin
    try
        iNode1:=0;

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
            tn1:=TV.Items.AddChildFirst(nil,sYear);
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

procedure TfrmAdvice.PageControl1Change(Sender: TObject);
begin
  inherited;
if PageControl1.TabIndex=1 then
begin
    r_Date.Checked:=true;
    TV.Items.Clear;
    AddDateToList;
    SearchDate;
end;
if PageControl1.TabIndex=0 then
begin
    btnResetClick(nil);
end;
end;

procedure TfrmAdvice.r_TypeClick(Sender: TObject);
begin
  inherited;
    AddDateToList;
    SearchType;
end;

procedure TfrmAdvice.SearchType;
var
    ii,i:integer;
begin
TV.Items.Clear;
    for ii:=0 to sl.Count-1 do
    begin
        tn:=TV.Items.AddChild(nil,sl[ii]);
        Q1.Close;
        Q1.SQL.Text:='SELECT DISTINCT XM,ADVICE_DATE FROM T_ADVICE '
            +'WHERE ADVICE_TYPE='+QuotedStr(sl[ii])+' ORDER BY ADVICE_DATE DESC';
        Q1.Open;
        if Q1.RecordCount>0 then
        begin
            for i:=1 to Q1.RecordCount do
            begin
                TV.Items.AddChild(tn,'【'+Q1.Fields.Fields[0].AsString+'】'+Q1.Fields.Fields[1].AsString);
                Q1.Next;
            end;
        end;
    end;

end;

procedure TfrmAdvice.r_XmClick(Sender: TObject);
begin
  inherited;
    AddDateToList;
    SearchXm;

end;

procedure TfrmAdvice.SearchXm;
var
    ii,i:integer;
begin
TV.Items.Clear;
    for ii:=0 to sl.Count-1 do
    begin
        tn:=TV.Items.AddChild(nil,sl[ii]);
        Q1.Close;
        Q1.SQL.Text:='SELECT DISTINCT ADVICE_TYPE,ADVICE_DATE FROM T_ADVICE '
            +'WHERE XM='+QuotedStr(sl[ii])+' ORDER BY ADVICE_DATE DESC';
        Q1.Open;
        if Q1.RecordCount>0 then
        begin
            for i:=1 to Q1.RecordCount do
            begin
                TV.Items.AddChild(tn,'【'+Q1.Fields.Fields[0].AsString+'】'+Q1.Fields.Fields[1].AsString);
                Q1.Next;
            end;
        end;
    end;
end;

procedure TfrmAdvice.btnResetClick(Sender: TObject);
begin
  inherited;
DM.Q_Advice.Close;
DM.Q_Advice.SQL.Text:=mSQL+' ORDER BY ADVICE_DATE DESC';
DM.Q_Advice.Open;
end;

procedure TfrmAdvice.Search_R;
var
    mXm,mDate,mType,ss:string;
begin
//根据日期分类
if r_Date.Checked then
begin
    if tn.getFirstChild=nil then
    begin
        DM.Q_Advice.Close;
        DM.Q_Advice.SQL.Text:=mSQL+'WHERE ADVICE_DATE='+QuotedStr(tn.Text);
        DM.Q_Advice.Open;
    end;
end;
//根据类型分类
if r_Type.Checked then
begin
    if tn.getFirstChild=nil then
    begin
        ss:=tn.Text;
        if length(ss)>1 then
        begin
            delete(ss,1,2);
            mXm:=copy(ss,1,pos('】',ss)-1);
            delete(ss,1,length(mXm)+2);
            mDate:=ss;
        end;
        DM.Q_Advice.Close;
        DM.Q_Advice.SQL.Text:=mSQL
            +'WHERE ADVICE_DATE='+QuotedStr(mDate)
            +' AND XM='+QuotedStr(mXm);
        DM.Q_Advice.Open;
    end;
end;
//根据姓名分类
if r_Xm.Checked then
begin
    if tn.getFirstChild=nil then
    begin
        ss:=tn.Text;
        if length(ss)>1 then
        begin
            delete(ss,1,2);
            mType:=copy(ss,1,pos('】',ss)-1);
            delete(ss,1,length(mType)+2);
            mDate:=ss;
        end;
        DM.Q_Advice.Close;
        DM.Q_Advice.SQL.Text:=mSQL
            +'WHERE ADVICE_DATE='+QuotedStr(mDate)
            +' AND ADVICE_TYPE='+QuotedStr(mType);
        DM.Q_Advice.Open;
    end;
end;

end;

procedure TfrmAdvice.TVChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
tn:=Node;
Search_R;
end;

procedure TfrmAdvice.btnFindClick(Sender: TObject);
var
    ss:string;
begin
  inherited;
  ss:=Edit1.Text;

  if length(ss)>0 then
  begin
    DM.Q_Advice.Close;
    if Ord(ss[1])<100 then
        DM.Q_Advice.SQL.Text:=mSQL
            +'WHERE XM_JP LIKE '+QuotedStr(ss+'%')
    else
        DM.Q_Advice.SQL.Text:=mSQL
            +'WHERE XM LIKE '+QuotedStr(ss+'%');

    DM.Q_Advice.Open;
  end
  else begin
      DM.Q_Advice.Close;
      DM.Q_Advice.SQL.Text:=mSQL;
      DM.Q_Advice.Open;
  end;

end;

procedure TfrmAdvice.Edit1Change(Sender: TObject);
var
    ss:string;
begin
  inherited;
  ss:=Edit1.Text;

  if length(ss)>0 then
  begin
    DM.Q_Advice.Close;
    if Ord(ss[1])<100 then
        DM.Q_Advice.SQL.Text:=mSQL
            +'WHERE XM_JP LIKE '+QuotedStr(ss+'%')
    else
        DM.Q_Advice.SQL.Text:=mSQL
            +'WHERE XM LIKE '+QuotedStr(ss+'%');

    DM.Q_Advice.Open;
  end
  else begin
      DM.Q_Advice.Close;
      DM.Q_Advice.SQL.Text:=mSQL;
      DM.Q_Advice.Open;
  end;
end;

procedure TfrmAdvice.FormShow(Sender: TObject);
begin
  inherited;
AddToItem('DICT_WEATHER','WEATHER_MC',DBComboBox2.Items);
AddToItem('T_ADVICE','ADVICE_TYPE',DBComboBox1.Items);

end;

end.
