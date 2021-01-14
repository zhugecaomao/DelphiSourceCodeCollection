unit UnitDM;

interface

uses
  SysUtils, Classes, ActnList,Controls,Forms, ImgList, DB, DBTables;

type
  TDM = class(TDataModule)
    ActionList1: TActionList;
    actOther: TAction;
    actLogin: TAction;
    ImageList1: TImageList;
    Database1: TDatabase;
    T_Operator: TTable;
    T_OperatorOPERATOR_BH: TStringField;
    T_OperatorOPERATOR_MC: TStringField;
    T_OperatorPASSWD: TStringField;
    T_OperatorWARRANT: TStringField;
    T_OperatorFLAG: TStringField;
    actOperator: TAction;
    T_FLAG: TTable;
    T_FLAGFLAG_BH: TStringField;
    T_FLAGFLAG_MC: TStringField;
    T_Operatorflag_mc: TStringField;
    actPerson: TAction;
    T_Person: TTable;
    T_PersonBH: TStringField;
    T_PersonNAME: TStringField;
    T_PersonNAME_JP: TStringField;
    T_PersonSEX: TStringField;
    T_PersonBIRTHDAY: TDateTimeField;
    T_PersonBIRTHDAY_TX: TStringField;
    T_PersonSX: TStringField;
    T_PersonXZ: TStringField;
    T_PersonAH: TStringField;
    T_PersonTC: TStringField;
    T_PersonNC: TStringField;
    T_PersonOICQ: TStringField;
    T_PersonEMAIL: TStringField;
    T_PersonLXDH: TStringField;
    T_PersonWEB: TStringField;
    T_PersonPHOTO: TBlobField;
    T_PersonFAMILY_PROVINCE: TStringField;
    T_PersonFAMILY_CITY: TStringField;
    T_PersonFAMILY_BELT: TStringField;
    T_PersonFAMILY_ADDRESS: TStringField;
    T_PersonFAMILY_POST: TStringField;
    T_PersonFAMILY_PHONE: TStringField;
    T_PersonFAMILY_FAMILY: TStringField;
    T_PersonCOMPANY_PROVINCE: TStringField;
    T_PersonCOMPANY_CITY: TStringField;
    T_PersonCOMPANY_BELT: TStringField;
    T_PersonCOMPANY_JOB: TStringField;
    T_PersonCOMPANY_PHONE: TStringField;
    T_PersonCOMPANY_CZ: TStringField;
    T_PersonCOMPANY_PART: TStringField;
    T_PersonCOMPANY_ZW: TStringField;
    T_PersonCOMPANY_ADDRESS: TStringField;
    T_PersonCOMAPNY_WEB: TStringField;
    T_PersonXTYPE: TStringField;
    T_PersonBZ: TStringField;
    T_PersonOPERATOR: TStringField;
    T_PersonFLAG: TStringField;
    T_JOB: TTable;
    T_JOBJOB_BH: TStringField;
    T_JOBJOB_MC: TStringField;
    T_JOBOPERATOR: TStringField;
    T_KIND: TTable;
    T_KINDKIND_BH: TStringField;
    T_KINDKIND_MC: TStringField;
    T_KINDDETAIL: TMemoField;
    T_KINDFLAG: TStringField;
    T_KINDOPERATOR: TStringField;
    T_KNOWLEDGE: TTable;
    T_STATE: TTable;
    T_STATESTATE_BH: TStringField;
    T_STATESTATE_MC: TStringField;
    T_STATEOPERATOR: TStringField;
    T_XTYPE: TTable;
    T_XTYPEXTYPE_BH: TStringField;
    T_XTYPEXTYPE_MC: TStringField;
    T_XTYPEOPERATOR: TStringField;
    T_SITE: TTable;
    T_SITESITE_BH: TStringField;
    T_SITESITE_MC: TStringField;
    T_SITESITE_JP: TStringField;
    T_SITEOPERATOR: TStringField;
    T_Personfamily_province_mc: TStringField;
    T_Personfamily_city_mc: TStringField;
    T_Personfamily_belt_mc: TStringField;
    T_Personcompany_province_mc: TStringField;
    T_Personcompany_city_mc: TStringField;
    T_Personcompany_belt_mc: TStringField;
    T_Personcompany_job_mc: TStringField;
    T_PART: TTable;
    T_ZW: TTable;
    T_ZWZW_BH: TStringField;
    T_ZWZW_MC: TStringField;
    T_ZWOPERATOR: TStringField;
    T_PARTPART_BH: TStringField;
    T_PARTPART_MC: TStringField;
    T_PARTOPERATOR: TStringField;
    T_Personcompany_part_mc: TStringField;
    T_Personcompany_zw_mc: TStringField;
    T_Personxtype_mc: TStringField;
    T_Personflag_mc: TStringField;
    Q_Any: TQuery;
    actCome: TAction;
    T_Px_Record: TTable;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    MemoField2: TMemoField;
    StringField6: TStringField;
    T_Px_RecordZK: TSmallintField;
    T_Px_RecordREAL_PRICE: TIntegerField;
    T_Px_Recordkind_price: TIntegerField;
    Q_Px_Record: TQuery;
    Q_Px_RecordBH: TStringField;
    Q_Px_RecordNAME: TStringField;
    Q_Px_RecordNAME_JP: TStringField;
    Q_Px_RecordSEX: TStringField;
    Q_Advice: TQuery;
    Q_AdviceADVICE_DATE: TDateTimeField;
    Q_AdviceWEEK: TStringField;
    Q_AdviceWEATHER: TStringField;
    Q_AdviceDETAIL: TMemoField;
    Q_AdviceANSWER: TMemoField;
    Q_AdviceOPERATOR: TStringField;
    Q_AdviceXM: TStringField;
    Q_AdviceXM_JP: TStringField;
    Q_AdviceADVICE_TYPE: TStringField;
    Q_AdviceADVICE_KEY: TStringField;
    actAdvice: TAction;
    actWork_Log: TAction;
    Q_Work_Log: TQuery;
    Q_Work_LogBH: TStringField;
    Q_Work_LogLOG_DATE: TDateTimeField;
    Q_Work_LogWEEK: TStringField;
    Q_Work_LogWEATHER: TStringField;
    Q_Work_LogDETAIL: TMemoField;
    Q_Work_LogOPERATOR: TStringField;
    T_OperatorBH: TStringField;
    T_Operatorbh_mc: TStringField;
    actDict: TAction;
    T_SEX: TTable;
    T_SEXSEX_BH: TStringField;
    T_SEXSEX_MC: TStringField;
    T_SX: TTable;
    T_SXSX_BH: TStringField;
    T_SXSX_MC: TStringField;
    T_STAR: TTable;
    T_STARSTAR_BH: TStringField;
    T_STARSTAR_MC: TStringField;
    T_STARDETAIL: TMemoField;
    T_STARFLAG: TStringField;
    T_KNOWLEDGEKNOWLEDGE_BH: TStringField;
    T_KNOWLEDGEKNOWLEDGE_MC: TStringField;
    T_KNOWLEDGEFLAG: TStringField;
    T_KNOWLEDGEOPERATOR: TStringField;
    actSearchWorkLog: TAction;
    Q_Work_Logbh_mc: TStringField;
    T_WEATHER: TTable;
    T_WEATHERWEATHER_BH: TStringField;
    T_WEATHERWEATHER_MC: TStringField;
    actSearchAdvice: TAction;
    Q_Person: TQuery;
    Q_PersonBH: TStringField;
    Q_PersonNAME: TStringField;
    Q_PersonNAME_JP: TStringField;
    Q_PersonSEX: TStringField;
    Q_PersonBIRTHDAY: TDateTimeField;
    Q_PersonBIRTHDAY_TX: TStringField;
    Q_PersonSX: TStringField;
    Q_PersonXZ: TStringField;
    Q_PersonAH: TStringField;
    Q_PersonTC: TStringField;
    Q_PersonNC: TStringField;
    Q_PersonOICQ: TStringField;
    Q_PersonEMAIL: TStringField;
    Q_PersonLXDH: TStringField;
    Q_PersonWEB: TStringField;
    Q_PersonPHOTO: TBlobField;
    Q_PersonFAMILY_PROVINCE: TStringField;
    Q_Personfamily_province_mc: TStringField;
    Q_PersonFAMILY_CITY: TStringField;
    Q_Personfamily_city_mc: TStringField;
    Q_PersonFAMILY_BELT: TStringField;
    Q_Personfamily_belt_mc: TStringField;
    Q_PersonFAMILY_ADDRESS: TStringField;
    Q_PersonFAMILY_POST: TStringField;
    Q_PersonFAMILY_PHONE: TStringField;
    Q_PersonFAMILY_FAMILY: TStringField;
    Q_PersonCOMPANY_PROVINCE: TStringField;
    Q_Personcompany_province_mc: TStringField;
    Q_PersonCOMPANY_CITY: TStringField;
    Q_Personcompany_city_mc: TStringField;
    Q_PersonCOMPANY_BELT: TStringField;
    Q_Personcompany_belt_mc: TStringField;
    Q_PersonCOMPANY_JOB: TStringField;
    Q_Personcompany_job_mc: TStringField;
    Q_PersonCOMPANY_PHONE: TStringField;
    Q_PersonCOMPANY_CZ: TStringField;
    Q_PersonCOMPANY_PART: TStringField;
    Q_Personcompany_part_mc: TStringField;
    Q_PersonCOMPANY_ZW: TStringField;
    Q_Personcompany_zw_mc: TStringField;
    Q_PersonCOMPANY_ADDRESS: TStringField;
    Q_PersonCOMAPNY_WEB: TStringField;
    Q_PersonXTYPE: TStringField;
    Q_Personxtype_mc: TStringField;
    Q_PersonBZ: TStringField;
    Q_PersonOPERATOR: TStringField;
    Q_PersonFLAG: TStringField;
    Q_Personflag_mc: TStringField;
    actSearchPerson: TAction;
    T_Px_Recordkind_detail: TStringField;
    T_KINDPRICE: TIntegerField;
    procedure actOtherExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure actOperatorExecute(Sender: TObject);
    procedure T_OperatorAfterScroll(DataSet: TDataSet);
    procedure actPersonExecute(Sender: TObject);
    procedure actComeExecute(Sender: TObject);
    procedure actAdviceExecute(Sender: TObject);
    procedure Q_AdviceXMChange(Sender: TField);
    procedure T_PersonNAMEChange(Sender: TField);
    procedure actWork_LogExecute(Sender: TObject);
    procedure Q_AdviceADVICE_DATEChange(Sender: TField);
    procedure Q_Work_LogLOG_DATEChange(Sender: TField);
    procedure actDictExecute(Sender: TObject);
    procedure actSearchWorkLogExecute(Sender: TObject);
    procedure actSearchAdviceExecute(Sender: TObject);
    procedure actSearchPersonExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses UnitOther, UnitData, UnitLogin, UnitOperator, UnitPerson, UnitCome,
  UnitAdvice, UnitWork_Log, UnitDict, UnitSearchWorkLog, UnitSearchAdvice,
  UnitSearchPerson;

{$R *.dfm}

procedure TDM.actOtherExecute(Sender: TObject);
begin
try
    frmOther:=TfrmOther.Create(nil);
    frmOther.Caption:=TAction(Sender).Caption;
    frmOther.ShowModal;
    frmOther.Free;
except
    Msgs('window');
    frmOther.Free;
end;

end;

procedure TDM.actLoginExecute(Sender: TObject);
begin
try
    frmLogin:=TfrmLogin.Create(nil);
    if frmLogin.ShowModal=mrOk then
    begin//设置权限


    end
    else begin
        //Msgs('对不起，您无权进入系统。');
        Application.Terminate;
    end;

    frmLogin.Free;
except
    Msgs('window');
    frmLogin.Free;
end;

end;

procedure TDM.actOperatorExecute(Sender: TObject);
begin
try
    frmOperator:=TfrmOperator.Create(nil);
    frmOperator.Caption:=TAction(Sender).Caption;
    frmOperator.ShowModal;
    frmOperator.Free;
except
    Msgs('window');
    frmOperator.Free;
end;

end;

procedure TDM.T_OperatorAfterScroll(DataSet: TDataSet);
var
    ss:string[10];
begin
if frmOperator<>nil then
begin
    if DataSet.RecordCount=0 then
    begin
        frmOperator.CheckBox1.Checked:=false;
        frmOperator.CheckBox2.Checked:=false;
        frmOperator.CheckBox3.Checked:=false;
        frmOperator.CheckBox4.Checked:=false;
        frmOperator.CheckBox5.Checked:=false;
        frmOperator.CheckBox6.Checked:=false;
        frmOperator.CheckBox7.Checked:=false;
        frmOperator.CheckBox8.Checked:=false;
        frmOperator.CheckBox9.Checked:=false;
        frmOperator.CheckBox10.Checked:=false;
    end else
    begin
        ss:='0000000000';
        ss:=DataSet.FieldByName('WARRANT').AsString;
        if ss[1]='0' then
            frmOperator.CheckBox1.Checked:=false
        else
            frmOperator.CheckBox1.Checked:=true;
        if ss[2]='0' then
            frmOperator.CheckBox2.Checked:=false
        else
            frmOperator.CheckBox2.Checked:=true;
        if ss[3]='0' then
            frmOperator.CheckBox3.Checked:=false
        else
            frmOperator.CheckBox3.Checked:=true;
        if ss[4]='0' then
            frmOperator.CheckBox4.Checked:=false
        else
            frmOperator.CheckBox4.Checked:=true;
        if ss[5]='0' then
            frmOperator.CheckBox5.Checked:=false
        else
            frmOperator.CheckBox5.Checked:=true;
        if ss[6]='0' then
            frmOperator.CheckBox6.Checked:=false
        else
            frmOperator.CheckBox6.Checked:=true;
        if ss[7]='0' then
            frmOperator.CheckBox7.Checked:=false
        else
            frmOperator.CheckBox7.Checked:=true;
        if ss[8]='0' then
            frmOperator.CheckBox8.Checked:=false
        else
            frmOperator.CheckBox8.Checked:=true;
        if ss[9]='0' then
            frmOperator.CheckBox9.Checked:=false
        else
            frmOperator.CheckBox9.Checked:=true;
        if ss[10]='0' then
            frmOperator.CheckBox10.Checked:=false
        else
            frmOperator.CheckBox10.Checked:=true;

    end;
end;
end;

procedure TDM.actPersonExecute(Sender: TObject);
begin
try
    frmPerson:=TfrmPerson.Create(nil);
    frmPerson.Caption:=TAction(Sender).Caption;
    frmPerson.ShowModal;
    frmPerson.Free;
except
    Msgs('window');
    frmPerson.Free;
end;

end;

procedure TDM.actComeExecute(Sender: TObject);
begin
try
    frmCome:=TfrmCome.Create(nil);
    frmCome.ShowModal;
    frmCome.Free;
except
    Msgs('window');
    frmCome.Free;
end;

end;

procedure TDM.actAdviceExecute(Sender: TObject);
begin
try
    frmAdvice:=TfrmAdvice.Create(nil);
    frmAdvice.Caption:=TAction(Sender).Caption;
    frmAdvice.ShowModal;
    frmAdvice.Free;
except
    Msgs('window');
    frmAdvice.Free;
end;

end;

procedure TDM.Q_AdviceXMChange(Sender: TField);
begin
DM.Q_Advice.FieldByName('XM_JP').AsString:=GetPYIndexStr(Sender.Text);
end;

procedure TDM.T_PersonNAMEChange(Sender: TField);
begin
DM.T_Person.FieldByName('NAME_JP').AsString:=GetPYIndexStr(Sender.Text);
end;

procedure TDM.actWork_LogExecute(Sender: TObject);
begin
try
    frmWork_Log:=TfrmWork_Log.Create(nil);
    frmWork_Log.Caption:=TAction(Sender).Caption;
    frmWork_Log.ShowModal;
    frmWork_Log.Free;
except
    Msgs('window');
    frmWork_Log.Free;
end;

end;

procedure TDM.Q_AdviceADVICE_DATEChange(Sender: TField);
begin
DM.Q_Advice.FieldByName('WEEK').AsString:=ReturnWeek(Sender.AsDateTime);
end;

procedure TDM.Q_Work_LogLOG_DATEChange(Sender: TField);
begin
DM.Q_Work_Log.FieldByName('WEEK').AsString:=ReturnWeek(Sender.AsDateTime);
end;

procedure TDM.actDictExecute(Sender: TObject);
begin
try
    frmDict:=TfrmDict.Create(nil);
    frmDict.ShowModal;
    frmDict.Free;
except
    Msgs('window');
    frmDict.Free;
end;

end;

procedure TDM.actSearchWorkLogExecute(Sender: TObject);
begin
try
    frmSearchWorkLog:=TfrmSearchWorkLog.Create(nil);
    frmSearchWorkLog.Caption:=TAction(Sender).Caption;
    frmSearchWorkLog.ShowModal;
    frmSearchWorkLog.Free;
except
    Msgs('window');
    frmSearchWorkLog.Free;
end;

end;

procedure TDM.actSearchAdviceExecute(Sender: TObject);
begin
try
    frmSearchAdvice:=TfrmSearchAdvice.Create(nil);
    frmSearchAdvice.Caption:=TAction(Sender).Caption;
    frmSearchAdvice.ShowModal;
    frmSearchAdvice.Free;
except
    Msgs('window');
    frmSearchAdvice.Free;
end;

end;

procedure TDM.actSearchPersonExecute(Sender: TObject);
begin
try
    frmSearchPerson:=TfrmSearchPerson.Create(nil);
    frmSearchPerson.Caption:=TAction(Sender).Caption;
    frmSearchPerson.ShowModal;
    frmSearchPerson.Free;
except
    Msgs('window');
    frmSearchPerson.Free;
end;

end;

end.
