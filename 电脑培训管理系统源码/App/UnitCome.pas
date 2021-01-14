unit UnitCome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDBForm, ComCtrls, DBCtrls, ExtCtrls, MenuBar, ToolWin,
  StdCtrls, DsFancyButton, DB, Grids, DBGrids, Mask;

type
  TfrmCome = class(TBaseDBFrm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    btnFind: TDsFancyButton;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    DS1: TDataSource;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    DBGrid2: TDBGrid;
    DsFancyButton1: TDsFancyButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure DsFancyButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCome: TfrmCome;

implementation

uses UnitDM, UnitData;

{$R *.dfm}

procedure TfrmCome.FormCreate(Sender: TObject);
begin
  inherited;
self.Caption:='报名管理';
DM.T_Px_Record.ReadOnly:=false;
DM.T_Px_Record.MasterSource:=DS;
DM.T_Px_Record.MasterFields:='BH';
DM.T_Px_Record.IndexFieldNames:='BH';
DS.DataSet.Active:=true;
DS1.DataSet.Active:=true;

end;

procedure TfrmCome.FormDestroy(Sender: TObject);
begin
  inherited;
DS.DataSet.Active:=false;
DS1.DataSet.Active:=false;

end;

procedure TfrmCome.ToolButton1Click(Sender: TObject);
begin
  inherited;
if (DS.DataSet.RecordCount=0)
    and(DS1.DataSet.State in[dsInsert,dsEdit]) then
begin
    DS1.DataSet.Cancel;
end else
  if Msgs(DS.DataSet.FieldByName('NAME').AsString+' 要进行报名？','YESNO')=IDYES then
  begin
      if DS1.DataSet.State in[dsInsert] then
      begin
          DS1.DataSet.FieldByName('BH').AsString:=
              DS.DataSet.FieldByName('BH').AsString;
          DS1.DataSet.FieldByName('COME_DATE').AsString:=DateToStr(now);
          DS1.DataSet.FieldByName('STATE').AsString:='10';
          DS1.DataSet.FieldByName('OPERATOR').AsString:=sOperator;
      end
  end else
    DS1.DataSet.Cancel;
end;
procedure TfrmCome.ToolButton4Click(Sender: TObject);
begin
  inherited;
if DS1.DataSet.State in[dsEdit,dsInsert] then
begin
    DS1.DataSet.Post;
end;
end;

procedure TfrmCome.btnFindClick(Sender: TObject);
var
    ss:string;
begin
  inherited;
ss:=Edit1.Text;
if ss<>'' then
begin
    if ord(ss[1])<128 then
    begin
        DM.Q_Px_Record.Close;
        DM.Q_Px_Record.SQL.Text:='SELECT BH, NAME, NAME_JP, SEX '
            +'FROM T_PERSON T_person WHERE FLAG='+QuotedStr('Y')
            +' AND NAME_JP LIKE '+QuotedStr(ss+'%');
        DM.Q_Px_Record.Open;
    end else
    begin
        DM.Q_Px_Record.Close;
        DM.Q_Px_Record.SQL.Text:='SELECT BH, NAME, NAME_JP, SEX '
            +'FROM T_PERSON T_person WHERE FLAG='+QuotedStr('Y')
            +' AND NAME LIKE '+QuotedStr(ss+'%');
        DM.Q_Px_Record.Open;

    end;
end;
end;

procedure TfrmCome.DsFancyButton1Click(Sender: TObject);
begin
  inherited;
        DM.Q_Px_Record.Close;
        DM.Q_Px_Record.SQL.Text:='SELECT BH, NAME, NAME_JP, SEX '
            +'FROM T_PERSON T_person WHERE FLAG='+QuotedStr('Y');
        DM.Q_Px_Record.Open;
end;

end.
