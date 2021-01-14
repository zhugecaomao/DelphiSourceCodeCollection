unit UnitSearchPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, ComCtrls, MenuBar, ToolWin, StdCtrls,
  DsFancyButton, Grids, DBGrids, DB, DBCtrls, Mask, TeEngine, Series,
  TeeProcs, Chart, DbChart, DBTables, ExtDlgs;

type
  TfrmSearchPerson = class(TBaseFrm)
    Panel3: TPanel;
    btnReset: TDsFancyButton;
    btnSearch: TDsFancyButton;
    Label1: TLabel;
    cb_Xm: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Splitter1: TSplitter;
    TabSheet3: TTabSheet;
    DS1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBMemo2: TDBMemo;
    DBGrid2: TDBGrid;
    DS: TDataSource;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DsFancyButton1: TDsFancyButton;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBImage1: TDBImage;
    dcb_SEX: TDBComboBox;
    dcb_SX: TDBComboBox;
    dcb_STAR: TDBComboBox;
    TabSheet5: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBMemo3: TDBMemo;
    TabSheet6: TTabSheet;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    DBLookupComboBox11: TDBLookupComboBox;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBLookupComboBox12: TDBLookupComboBox;
    DBLookupComboBox13: TDBLookupComboBox;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DN: TDBNavigator;
    Label43: TLabel;
    cb_Sex: TComboBox;
    Label44: TLabel;
    Label45: TLabel;
    cb_Sx: TComboBox;
    cb_Star: TComboBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    cb_Province: TComboBox;
    cb_City: TComboBox;
    cb_Belt: TComboBox;
    Label49: TLabel;
    cb_Job: TComboBox;
    Label50: TLabel;
    Label51: TLabel;
    cb_Part: TComboBox;
    cb_Zw: TComboBox;
    Label52: TLabel;
    cb_XType: TComboBox;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    PageControl4: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    DBChart1: TDBChart;
    DBChart2: TDBChart;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    PageControl5: TPageControl;
    TabSheet12: TTabSheet;
    DBChart3: TDBChart;
    TabSheet13: TTabSheet;
    DBChart4: TDBChart;
    PageControl6: TPageControl;
    TabSheet15: TTabSheet;
    DBChart5: TDBChart;
    TabSheet16: TTabSheet;
    DBChart6: TDBChart;
    Q_Sex1: TQuery;
    Q_Sex2: TQuery;
    Series1: TPieSeries;
    Q_Job1: TQuery;
    Q_Job2: TQuery;
    Q_Type1: TQuery;
    Q_Type1XTYPE: TStringField;
    Q_Type1COUNT: TIntegerField;
    Q_Type2: TQuery;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    Q_Job1COMPANY_JOB: TStringField;
    Q_Job1COUNT: TIntegerField;
    Q_Job2COMPANY_JOB: TStringField;
    Q_Job2COUNT: TIntegerField;
    Q_Sex1SEX: TStringField;
    Q_Sex1COUNT: TIntegerField;
    Q_Sex2SEX: TStringField;
    Q_Sex2COUNT: TIntegerField;
    Q_Job1job_mc: TStringField;
    Q_Job2job_mc: TStringField;
    Q_Type1xtype_mc: TStringField;
    Q_Type2xtype_mc: TStringField;
    Series2: TPieSeries;
    Series3: TPieSeries;
    Series4: TPieSeries;
    Series5: TPieSeries;
    Series6: TPieSeries;
    btnCard: TDsFancyButton;
    btnInfo: TDsFancyButton;
    btnRecord: TDsFancyButton;
    SPD: TSavePictureDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnCardClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnRecordClick(Sender: TObject);
    procedure DBChart1DblClick(Sender: TObject);
  private
    { Private declarations }
    mSQL,sCondition,sSex1,sSex2,sJob1,sJob2,sType1,sType2:string;
  public
    { Public declarations }
  end;

var
  frmSearchPerson: TfrmSearchPerson;

implementation

uses UnitData, UnitDM, UnitPrint_tmp,
  UnitPrintPersonRecord, UnitPrintPersonCard, UnitPrintOneOrMore;

{$R *.dfm}

procedure TfrmSearchPerson.FormShow(Sender: TObject);
begin
  inherited;
DN.Color:=$00E3E3E3;

AddToItem('DICT_SEX','SEX_MC',cb_SEX.Items);
cb_SEX.Items.Add('');
AddToItem('DICT_SX','SX_MC',cb_SX.Items);
cb_SX.Items.Add('');
AddToItem('DICT_STAR','STAR_MC',cb_STAR.Items);
cb_STAR.Items.Add('');
AddToItem('DICT_XTYPE','XTYPE_MC',cb_XType.Items);
cb_XType.Items.Add('');
AddToItem('DICT_JOB','JOB_MC',cb_JOB.Items);
cb_JOB.Items.Add('');
AddToItem('DICT_PART','PART_MC',cb_PART.Items);
cb_PART.Items.Add('');
AddToItem('DICT_ZW','ZW_MC',cb_ZW.Items);
cb_ZW.Items.Add('');

DM.T_Px_Record.ReadOnly:=true;
DM.T_Px_Record.MasterSource:=DS;
DM.T_Px_Record.MasterFields:='BH';
DM.T_Px_Record.IndexFieldNames:='BH';
DS.DataSet.Open;
DS1.DataSet.Open;

Q_Sex1.SQL.Text:=sSex1+' GROUP BY SEX';
Q_Sex1.Open;
Q_Job1.SQL.Text:=sJob1+' GROUP BY COMPANY_JOB';
Q_Job1.Open;
Q_Type1.SQL.Text:=sType1+' GROUP BY XTYPE';
Q_Type1.Open;

Q_Sex2.SQL.Text:=sSex2;
Q_Sex2.Open;
Q_Job2.SQL.Text:=sJob2;
Q_Job2.Open;
Q_Type2.SQL.Text:=sType2;
Q_Type2.Open;
end;

procedure TfrmSearchPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
Q_Sex2.Close;
Q_Job2.Close;
Q_Type2.Close;

DS1.DataSet.Close;
DS.DataSet.Close;
end;

procedure TfrmSearchPerson.FormCreate(Sender: TObject);
begin
  inherited;
mSQL:='SELECT * FROM T_PERSON T_person ';
sCondition:='';

sSex1:='SELECT SEX,COUNT(SEX) FROM T_PERSON T_person ';
sSex2:=sSex1+'GROUP BY SEX';
sJob1:='SELECT COMPANY_JOB,COUNT(COMPANY_JOB) FROM T_PERSON T_person ';
sJob2:=sJob1+'GROUP BY COMPANY_JOB';
sType1:='SELECT XTYPE,COUNT(XTYPE) FROM T_PERSON T_person ';
sType2:=sType1+'GROUP BY XTYPE';

end;

procedure TfrmSearchPerson.btnSearchClick(Sender: TObject);
var
    ss:string;
begin
  inherited;
sCondition:='';
//姓名
if cb_Xm.Text<>'' then
begin
    ss:=cb_Xm.Text;
    if sCondition='' then
    begin
        if ord(ss[1])>127 then
            sCondition:=sCondition+' NAME LIKE '+QuotedStr(ss+'%')
        else
            sCondition:=sCondition+' NAME_JP LIKE '+QuotedStr(ss+'%')
    end
    else begin
        if ord(ss[1])>127 then
            sCondition:=sCondition+'AND NAME LIKE '+QuotedStr(ss+'%')
        else
            sCondition:=sCondition+'AND NAME LIKE '+QuotedStr(ss+'%')
    end;
end;
//人员类型
if cb_XType.Text<>'' then
begin
    if sCondition='' then
        sCondition:=sCondition+' XTYPE='+QuotedStr(GetValue('DICT_XTYPE','XTYPE_MC','XTYPE_BH',cb_XType.Text))
    else
        sCondition:=sCondition+' AND XTYPE='+QuotedStr(GetValue('DICT_XTYPE','XTYPE_MC','XTYPE_BH',cb_XType.Text))

end;
//职业
if cb_JOB.Text<>'' then
begin
    if sCondition='' then
        sCondition:=sCondition+' COMPANY_JOB='+QuotedStr(GetValue('DICT_JOB','JOB_MC','JOB_BH',cb_JOB.Text))
    else
        sCondition:=sCondition+' AND COMPANY_JOB='+QuotedStr(GetValue('DICT_JOB','JOB_MC','JOB_BH',cb_JOB.Text))

end;
//部门
if cb_PART.Text<>'' then
begin
    if sCondition='' then
        sCondition:=sCondition+' COMPANY_PART='+QuotedStr(GetValue('DICT_PART','PART_MC','PART_BH',cb_PART.Text))
    else
        sCondition:=sCondition+' AND COMPANY_PART='+QuotedStr(GetValue('DICT_PART','PART_MC','PART_BH',cb_PART.Text))
end;
//职位
if cb_ZW.Text<>'' then
begin
    if sCondition='' then
        sCondition:=sCondition+' COMPANY_ZW='+QuotedStr(GetValue('DICT_ZW','ZW_MC','ZW_BH',cb_ZW.Text))
    else
        sCondition:=sCondition+' AND COMPANY_ZW='+QuotedStr(GetValue('DICT_ZW','ZW_MC','ZW_BH',cb_ZW.Text))
end;

//性别
if cb_SEX.Text<>'' then
begin
    if sCondition='' then
        sCondition:=sCondition+' SEX='+QuotedStr(cb_SEX.Text)
    else
        sCondition:=sCondition+' AND SEX='+QuotedStr(cb_SEX.Text)
end;
//生肖
if cb_SX.Text<>'' then
begin
    if sCondition='' then
        sCondition:=sCondition+' SX='+QuotedStr(cb_SX.Text)
    else
        sCondition:=sCondition+' AND SX='+QuotedStr(cb_SX.Text)
end;
//星座
if cb_STAR.Text<>'' then
begin
    if sCondition='' then
        sCondition:=sCondition+' STAR='+QuotedStr(cb_STAR.Text)
    else
        sCondition:=sCondition+' AND STAR='+QuotedStr(cb_STAR.Text)
end;


//用所生成的条件查询
if sCondition<>'' then
begin
    DM.Q_Person.SQL.Text:=mSQL+' WHERE '+sCondition;
    Q_Sex1.SQL.Text:=sSex1+' WHERE '+sCondition+' GROUP BY SEX';
    Q_Job1.SQL.Text:=sJob1+' WHERE '+sCondition+' GROUP BY COMPANY_JOB';
    Q_Type1.SQL.Text:=sType1+' WHERE '+sCondition+' GROUP BY XTYPE';
end
else begin
    DM.Q_Person.SQL.Text:=mSQL;
    Q_Sex1.SQL.Text:=sSex1+' GROUP BY SEX';
    Q_Job1.SQL.Text:=sJob1+' GROUP BY COMPANY_JOB';
    Q_Type1.SQL.Text:=sType1+' GROUP BY XTYPE';

end;

Q_Sex1.Open;
Q_Job1.Open;
Q_Type1.Open;
DM.Q_Person.Open;

end;

procedure TfrmSearchPerson.btnResetClick(Sender: TObject);
begin
  inherited;
cb_Xm.Text:='';
cb_XType.ItemIndex:=-1;
cb_Job.ItemIndex:=-1;
cb_Part.ItemIndex:=-1;
cb_Zw.ItemIndex:=-1;
cb_Sex.ItemIndex:=-1;
cb_Sx.ItemIndex:=-1;
cb_Star.ItemIndex:=-1;
cb_Province.ItemIndex:=-1;
cb_City.ItemIndex:=-1;
cb_Belt.ItemIndex:=-1;


DM.Q_Person.SQL.Text:=mSQL;
DM.Q_Person.Open;
end;

procedure TfrmSearchPerson.btnCardClick(Sender: TObject);
begin
  inherited;
try
    frmPrintPersonCard:=TfrmPrintPersonCard.Create(nil);
    frmPrintPersonCard.qrlTitle.Caption:=sCompanyName+'客户卡';
    frmPrintPersonCard.QuickRep1.Preview;
    frmPrintPersonCard.Free;
except
    Msgs('window');
    frmPrintPersonCard.Free;
end;
end;

procedure TfrmSearchPerson.btnInfoClick(Sender: TObject);
begin
  inherited;
try
    frmPrintOneOrMore:=TfrmPrintOneOrMore.Create(nil);
    frmPrintOneOrMore.ShowModal;
    frmPrintOneOrMore.Free;
except
    Msgs('window');
    frmPrintOneOrMore.Free;
end;
end;

procedure TfrmSearchPerson.btnRecordClick(Sender: TObject);
begin
  inherited;
try
    frmPrintPersonRecord:=TfrmPrintPersonRecord.Create(nil);
    //frmPrintPersonRecord.QuickRep1.DataSet:=DM.Q_Person;
    frmPrintPersonRecord.qrlCompanyName.Caption:=sCompanyName;
    frmPrintPersonRecord.qrlCompanyPhone.Caption:=sCompanyPhone;
    frmPrintPersonRecord.qrlCompanyAddress.Caption:=sCompanyAddress;
    frmPrintPersonRecord.QuickRep1.Preview;
    frmPrintPersonRecord.Free;
except
    Msgs('window');
    frmPrintPersonRecord.Free;
end;
end;

procedure TfrmSearchPerson.DBChart1DblClick(Sender: TObject);
begin
  inherited;
if SPD.Execute then
begin
    case SPD.FilterIndex of
        1:begin
            SPD.DefaultExt:='bmp';
            TDBChart(Sender).SaveToBitmapFile(SPD.FileName);//bmp
        end;
        2:begin
            SPD.DefaultExt:='wmf';
            TDBChart(Sender).SaveToMetafile(SPD.FileName);//wmf
        end;
    end;
end;
end;

end.
